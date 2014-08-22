# encoding: UTF-8
require 'sinatra'
set :server, 'thin'

get '/' do
  "GET Hello World!"
end

post '/' do
  puts params
  "POST Hello World"
end

put '/' do
  puts params
  "PUT Hello World" # response without entity body
end

delete '/' do
  puts params
  "DELETE Hello World" # response without entity body
end


