
result = system("finger -m james")
puts "result = #{result}"

puts `finger -m james`

ls = IO.popen("ls -l")
ls.each{|line|puts line}

pipe = IO.popen("-", "w+")
if pipe
  pipe.puts "Get a job!"
  STDERR << "Child says '#{pipe.gets.chomp}'\n"
else
  STDERR << "Parent says '#{gets.chomp}'\n"
  puts "OK"
end

IO.popen("date"){|f| puts "Date is #{f.gets}\n"}

trap("CLD") do
  pid = Process.wait
  puts "Child pid #{pid}: terminated."
end
puts fork{ exec("sort testfile > output.txt") }


