
puts BasicObject
puts Fiber
puts Mutex
#puts VM
puts StopIteration


puts lambda{||}.arity
puts lambda{|x|}.arity
puts lambda{|x, y|}.arity
puts lambda{|x, y, z|}.arity
puts lambda{|a, b, c, d|}.arity
puts lambda{|a, b, c, d, e|}.arity

puts lambda{|*args|}.arity
puts lambda{|first, *args|}.arity
puts lambda{|first, second, *args|}.arity


{1=>2, 2=>3, 3=>4}.each_pair{|key, value| print key, value}

