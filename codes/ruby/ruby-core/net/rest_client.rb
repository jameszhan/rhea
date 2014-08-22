require 'yaml'
require 'net/http'

Net::HTTP.start("localhost", 4567) do |http|
  http.request_get("/") do |response|
    puts "REQUEST GET /"
    puts response.to_yaml
  end
  
  puts "\n" * 3  
  http.request_post("/", "hello=world") do |response|
    puts "REQUEST POST /"
    puts response.to_yaml
  end
  
  puts "\n" * 3
  http.request_put("/", "hello=world") do |response|
    puts "REQUEST PUT /"
    puts response.to_yaml
  end
  
  puts "\n" * 3
  puts "REQUEST DELETE /"
  puts http.delete("/").to_yaml 
  
  puts "\n" * 3
  puts "REQUEST GET /"
  puts http.get("/").to_yaml
  
  puts "\n" * 3
  puts "REQUEST POST /"
  http.post("/", "hello=world") do |body|
    puts body
  end
  
  puts "\n" * 3
  puts "REQUEST PUT /"
  puts http.put("/", "hello=world").to_yaml
end