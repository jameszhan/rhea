begin
	puts "Thread.main=#{Thread.main}"
	puts "Thread.current=#{Thread.current}"
	puts "Thread.list=#{Thread.list}"
	
	
	Thread.new{
		Thread.current[:cat] = 'kitty'
		Thread.current[:dog] = 'snooby'	
		Thread.current.raise("James Good!")
	}.join.tap{|th|
		p th.keys
	}
	
rescue Exception => e
	puts e
end


[
  Thread.new { Thread.current["name"] = "A" },
  Thread.new { Thread.current[:name]  = "B" },
  Thread.new { Thread.current["name"] = "C" }
].each do |th|
  th.join
	puts <<-EOF
#{th.inspect}: #{th[:name]} 
alive?: #{th.alive?}
group: #{th.group}"
status: #{th.status}
stop?: #{th.stop?}
priority: #{th.priority}
safe_level: #{th.safe_level}
	EOF
end

