
p global_variables
p local_variables

p Array.ancestors
p Hash.ancestors
p String.ancestors

arr = ["a", "b", "c"]
p arr.send(:delete, "b")
p arr


class A
  def self.a
    puts "self.a"
  end

  def a
    puts "a"
  end

  class << self
    def method_missing name, args
      p "#{name}, #{args}\n"
    end
      def b
        puts "b"
      end
  end
end



a = A.new

a.a
A.a

A.b
A.c "abc"