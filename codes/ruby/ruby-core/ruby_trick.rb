puts self 
puts self.singleton_class
puts singleton_class

puts(<<-EOL, __FILE__, __LINE__ + 1)
  Back Back Back!
  File File File!
EOL

at_exit{puts "you can put your clean code here!"}

puts Gem.bin_path('rack', 'rackup', ">=0")
puts Gem.bin_path('railties', 'rails', ">=0")
p Gem.path

p "/abcdefg/".chomp("/")


p [Array === [], String === ""]

p ?a
p ?/

sum_of_100 = begin
  (1..100).reduce(0){|sum, i| sum += i}
end
puts sum_of_100

def capture_block
  @blocks ||= []
  @blocks.push(Proc.new) if block_given?
end

capture_block do
	puts "OKOKOK."
end
capture_block {
	puts "ONE TWO THREE."
}

@blocks.each{|b| b.call} #if @blocks


hello = proc{|name| puts "Hello #{name}!"}

hello["Peter"]
hello.call("Peter")
hello===("Peter")
hello.yield("Peter")


def multiple_of(factor)
	proc{|product| product.modulo(factor).zero?}
end
number = 28
case number
  when multiple_of(3)
	puts "Multiple of 3"
  when multiple_of(7)
	puts "Multuple of 7"
end

it_is_day_of_week = lambda{ |day_of_week, date| date.wday == day_of_week }
it_is_wednesday = it_is_day_of_week.curry[3]
it_is_saturday = it_is_day_of_week.curry[6]
it_is_sunday = it_is_day_of_week.curry[0]
case Time.now
	when it_is_wednesday
		puts "Wednesday!"
	when it_is_saturday
  		puts "Saturday!"
	when it_is_sunday
  		puts "Sunday!"
else
  puts "Not the weekend"
end


def assert(msg = nil)
  if DEBUG
    raise msg || "Assertion failed!" unless yield
  end
end



