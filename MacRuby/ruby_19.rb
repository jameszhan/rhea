
{a: 1, b: 2, c:3}.collect{|k, v| puts "#{k}: #{v * v}"}

lambda{|arg| puts arg}.call("abcdefg")

proc = ->arg1, arg2{puts "arg1: #{arg1}, arg2: #{arg2}"}

proc.call(1, 2)

str = "<html><head><title>hello world</title></head><body></body></html>"
str.scan(/(?<=<)[^>]+(?=>)/){|matched| print "#{matched}," }


class SomeClass

  def []= (*param)
    print "\n#{param}"
  end
end

s = SomeClass.new
s[1] = 2
s[:cat, :dog] = :ememies


print "\n"
`ls -l /etc/passwd`.lines.each{|line| print line}
print `date`
print %x{echo "Hello there"}
print "#{$?.exitstatus}\n"

print "#{defined? 1}, #{defined? printf}, #{defined? String}, #{defined? $_} #{defined? a = 1}, #{defined? nil}"

File.foreach("/etc/passwd") do |line|
  next unless line !~ /^#/
  print line unless line =~ /^$/
end


=begin
re = /
\A
(?<name>
(?:\\g<name)
)
\z
/x


puts re
=end