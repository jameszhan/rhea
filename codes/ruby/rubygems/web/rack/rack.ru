require 'rack/lobster'
require 'sinatra'

use Rack::ShowExceptions
use Rack::Auth::Basic, "Lobster 2.0" do |username, password|
  'secret' == password
end

#run Sinatra::Application

run Rack::Lobster.new


