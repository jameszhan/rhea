require 'socket'

begin
  client = TCPSocket.open('127.0.0.1', 'finger')
  client.send("james\n", 0)

  puts client.readlines
  client.close
rescue Exception
  STDERR << "Failed to finger 127.0.0.1 #{$!}\n"
end

require 'net/http'
h = Net::HTTP.new('www.baidu.com', 80)
response = h.get('/index.htm')
puts response.body if response.message == "OK"

require "open-uri"
open("http://www.bing.com/"){|io| io.each{|line| puts line } }




