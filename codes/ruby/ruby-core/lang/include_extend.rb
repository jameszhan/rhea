#在类定义中引入模块，使模块中的方法成为类的实例方法,直接include即可
#在类定义中引入模块，使模块中的方法成为类的类方法, 直接extend 即可
#在类定义中引入模块，既希望引入实例方法，也希望引入类方法,这个时候需要使用include, base.extend(ClassMethods)  

module M1
  def self.included(base)
    puts "M1 self.included by #{base}"
  end
  
  def self.extended(base)
    puts "M1 self.extended by #{base}"
  end
  
  def included(base)
    puts "M1 included by #{base}"
  end

  def extended(base)
    puts "M1 extended by #{base}"
  end

  def self.m1s
    puts "M1 method m1s #{self}"
  end
  
  def m1m
    puts "M1 method m1m #{self}"
  end

end

module M2
  def self.included(base)
    puts "M2 self.included by #{base}"
  end
  
  def self.extended(base)
    puts "M2 self.extended by #{base}"
  end

  def included(base)
    puts "M2 included by #{base}"
  end
  
  def extended(base)
    puts "M2 extended by #{base}"
  end
  
  
  def self.m2s
    puts "M1 method m2s #{self}"
  end
  
  def m2m
    puts "M1 method m2m #{self}"
  end

end

class C1
  def self.included(base)
    puts "C1 self.included by #{base}"
  end

  def included(base)
    puts "C1 included by #{base}"
  end

end

class C2
  def self.included(base)
    puts "C2 self.included by #{base}"
  end
  
  def included(base)
    puts "C2 included by #{base}"
  end

end

class Car
  extend M1, M2
#  include C1, C2   #Not allow, `include': wrong argument type Class (expected Module)!
  
end
Car::m1m
Car::m2m


class Bus
  include M1, M2
#  extend C1, C2     #Not allow, `extend': wrong argument type Class (expected Module)
  
end
bus = Bus.new
bus.m1m
bus.m2m

module Base  
  def show  
    puts "You came here!"  
  end  
 
  #扩展类方法  
  def self.included(base)  
    def base.call  
      puts "I'm strong!"  
    end  
    base.extend(ClassMethods)  
  end  
 
  #类方法  
  module ClassMethods  
    def hello  
      puts "Hello baby!"  
    end  
  end  
     
end