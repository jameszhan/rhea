
p %q/this is a string.\n/
p %Q-this is a string.\n-
p %(a (nested) string\n)

p %w{this is an array}
p %W|this is an array|

p %r[this is a regex]
p %s+this_is_a_symbol+
p %x*ls -l*


3.times do
  print 'hello'.object_id, " "
end

3.times do
  print :hello.object_id, " "
end

