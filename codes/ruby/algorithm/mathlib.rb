module Mathlib
  
  def ackerman(m, n)
    if(m == 0)
      return n + 1
    elsif(n == 0)
      return ackerman(m - 1, 1)
    else
      return ackerman(m - 1, ackerman(m, n - 1))
    end
  end
  
  
  def fibonacci1(n)
    if(n == 0 or n == 1)
      return n
    else
      return fibonacci1(n - 1) + fibonacci1(n - 2)
    end
  end
  
  def fibonacci2(n)    
    if(n < 2)
      return n
    else
      x, y = 1, 0
      for i in (2..n) do
        x, y = y, x
        x = x + y
      end
      return x
    end
  end

  def fibonacci(n)
    sqrt5 = Math.sqrt(5)
    c1, c2 = (1 + sqrt5) / 2, (1 - sqrt5) / 2    
    return ((c1 ** n - c2 ** n) / sqrt5).floor
  end
  
  def pi(n)
    k = 0
    n.times{
      x, y = Random::rand(), Random::rand()
      if(x * x + y * y <= 1)
        k = k + 1
      end
    }
    4 * k * 1.0 / n
  end
  
end

if __FILE__ == $0
  include Mathlib

  begin

  puts(ackerman(3, 4))
  p Array(1..20).map{|i|fibonacci1(i)} 
  p Array(1..20).map{|i|fibonacci2(i)} 
  p Array(1..20).map{|i|fibonacci(i)} 

  [1000000, 10000000].each{|i| p pi(i)}
  rescue Exception => e
    puts e
  end
end