
class Object
  def eigenclass
    class << self; self; end
  end
end

class A
  def ma; end
  def mb; end
  class << self
    def a; end
    def b; end
  end
end
class B < A; end
class C < B; end


def list(obj)
  c = obj.eigenclass
  r = []
  while c
    r << c
    c = c.superclass
  end
  p r
end

list C.new
list C

puts "======================================"

list "abc"
list String
list Module
list Class


puts "--------------------------------"

puts String.eigenclass
puts String.eigenclass.eigenclass
puts String.eigenclass.eigenclass.eigenclass
puts String.eigenclass.eigenclass.eigenclass.eigenclass
puts String.eigenclass.eigenclass.eigenclass.eigenclass.eigenclass


puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

puts A.methods - Class.methods
puts String.eigenclass.methods - String.methods