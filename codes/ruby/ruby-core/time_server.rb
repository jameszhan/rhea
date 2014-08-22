require 'socket'

=begin
server = TCPServer.new 2000
loop do
	client = server.accept
	client.puts "Hello !"
	client.puts "Time is #{Time.now}"
	client.close
end
=end

server = TCPServer.new 2001
loop do
	Thread.start(server.accept) do |client|
		client.puts "Hello #{client.addr} #{client.peeraddr}!"
		client.puts "Time is #{Time.now}"
		client.close
	end
end
