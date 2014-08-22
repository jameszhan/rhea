module M
  
  def m2(who)
    puts "Hello, #{who} in m2!"
    m1(who)
  end
  
  private 
  def m1(who)
    puts "Hello, #{who} in M1!"
  end
  
end

class C
  private 
  def c1(who)
    puts "Hello, #{who} in C1!"
  end
end

class O < C
  include M
  
  def test(who)
    c1(who)
    m1(who)
    self.m2(who)
#    self.m1(who) #NoNameError
#    self.c1(who) #NoNameError
  end
  
end

O.new.test "ABC"
