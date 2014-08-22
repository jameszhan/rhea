result = class MyClass
  
  def hello
    puts self
  end
  
  puts "Hello World."
  self
end

puts result

puts result.new.hello


def add_world_method(clazz)
  clazz.class_eval do
#  clazz.module_eval do
    def world
      puts "#{self} in add_world_method lineno:#{__LINE__}"
    end
  end
end

add_world_method MyClass


puts MyClass.new.world


class Clazz
  def m1
    puts "#{self.class} #{__LINE__}"
    def m2
      puts "#{self.class} #{__LINE__}"
    end
  end
end

puts obj = Clazz.new
obj.m1
obj.m2

c = Class.new(Array) do 
  def my_method
    'Hello!'
  end 
end

puts c
NamedClass = c
puts c
puts c.superclass




