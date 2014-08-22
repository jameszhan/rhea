#!/usr/bin/env ruby -I ../lib -I lib
require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do 
  "<h1>Hello Sinatra</h1>"
end

get '/time' do
  haml :time, :locals => {:now => Time.now}
end

get '/hello/:name' do
  "Hello #{params[:name]}"
end

get '/views/:name' do |filename|
#  send_file File.join(settings.public, filename)
  File.read("views/#{filename}")
end