require 'rack'
require 'rack/lobster'

class Heartbeat
	def self.call(env)
		[200, { "Content-Type" => "text/plain" }, ["OK"]]
	end
end

app1 = Rack::Builder.app do
	use Rack::CommonLogger
	run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['Hello World!']] }
end

app2 = Rack::Builder.new do
	use Rack::CommonLogger
	use Rack::ShowExceptions
	map "/lobster" do
		use Rack::Lint
		run Rack::Lobster.new
	end
	map "/hello" do
	  run app1
  end
  map "/heartbeat" do
    run Heartbeat
  end
end

Rack::Handler::Thin.run(app2, :Port => 3000)