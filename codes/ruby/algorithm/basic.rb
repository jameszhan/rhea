# encoding: UTF-8
module Basic
  
  def shuffle(a)
    n = a.length
    (0...n).each{|i|
      j = Random::rand(i...n)
      a[i], a[j] = a[j], a[i]
    }
  end
  
  def hanoi(n, src, dst, mid, &handle)
    if(n > 1)
      hanoi(n - 1, src, mid, dst, &handle)
      handle.call(n, src, dst)
      hanoi(n - 1, mid, dst, src, &handle)
    else
      handle.call(n, src, dst)
    end
  end 
  
#  LCG(linear congruential generator)
# => The heart of an LCG is the following formula
# =>  X(i+1) = (a * X(i) + c) mod M
# =>  where 
# =>    M is the modulus.         M > 0.
# =>    a is the multiplier,      0 <= a < M.
# =>    c is the increment,       0 <= c < M.
# =>    X(0) is the seed value,   0 <= X(0) < M.
# =>    i is the iterator.        i < M 
  def lcg_rand(m = 8)
    a, c, x = 5, 3, 1
    lcg = lambda do
      x = (a * x + c) % m      
      x       
    end
    lcg
  end  
end


if __FILE__ == $0
  
  include Basic  
  rand = lcg_rand
  (1..20).each{|i| p rand.call }

  begin
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    shuffle(a)
    p a
    puts "==========>"
    hanoi(6, 'A', 'C', 'B'){|n, src, dst| puts "move #{n} from #{src} to #{dst}"}
    i = 0
    hanoi(6, 'A', 'C', 'B'){|n, src, dst| i += 1}
    puts i
    puts "==========>"
    hanoi(3, 'A', 'C', 'B'){|n, src, dst| puts "move #{n} from #{src} to #{dst}"}
    i = 0
    hanoi(3, 'A', 'C', 'B'){|n, src, dst| i += 1}
    puts i
 
  rescue Exception => e
    puts e
    puts e.backtrace
  end
end
