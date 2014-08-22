require 'rack'

Rack::Server.start(
	:app => lambda do |e|
	  puts e
		[200, {'Content-Type' => 'text/html'}, ['hello world', "<br />", "Welcome! James"]]
	end,
	:server => 'thin'
)