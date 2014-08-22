p Module::nesting

p "__method__ = '#{__method__}', __callee__ = '#{__callee__}'"
def hello
  p "__method__ = '#{__method__}', __callee__ = '#{__callee__}'"
end
hello




BasicObject.constants.each{|c| puts "BasicObject::#{c} = #{BasicObject.const_get(c)}"}

Object.constants.each{|c| puts "Object::#{c} = #{Object.const_get(c)} or #{eval(c.to_s)}"}

Object.constants.each{|c| puts "Module::#{c} = #{Object.const_get(c)} or #{eval(c.to_s)}"}

puts "global_variables => "
p global_variables

puts "local_variables => "
p local_variables


v0 = 0

class MyClass
  @m1 = 3
  v1 = 1
  def method
    v2 = 2
    p "#{local_variables}, #{self} => #{self.class}"
  end
  p "#{local_variables}, #{self} => #{self.class}"  
end

p "#{local_variables}, #{self} => #{self.class}"
obj = MyClass.new
obj.method


def my_method(x)
  y = 100
  yield y + x
end

my_method(11){|p|
  p "#{local_variables}, #{self} => #{self.class}"
#  p "p = #{p} x= #{x} y = #{y}" 
}



puts "For Fiber"
p Fiber.included_modules
p Fiber.ancestors


puts "For File"
p File.included_modules
p File.ancestors
p File.constants
p File.class_variables
p File.private_instance_methods
p File.protected_instance_methods
p File.public_instance_methods
p File.const_get('PATH_SEPARATOR')
p File.const_get('ALT_SEPARATOR')
p File.const_get('SEPARATOR')
p File.const_get('Separator')
#p File::PATH_SEPARATOR


file = File.new(__FILE__, 'r')
#This is in Object
p File.instance_methods
p File.instance_variables
p File.singleton_methods
p File.singleton_class

