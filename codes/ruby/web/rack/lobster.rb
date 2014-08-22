%w(rubygems rack thin rack/lobster).each { |dep| require dep } 

Thin::Server.start('0.0.0.0', 3000) do
  use Rack::Static
	use Rack::CommonLogger
	use Rack::ShowExceptions
	map "/lobster" do
		use Rack::Lint
		run Rack::Lobster.new
	end
end