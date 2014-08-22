def itor(t)
  i = 0
  return lambda{
    i += 1
    if(i < t)
      true
    else
      false
    end
  } 
end

it = itor(10)
while(it.call)do
  puts "100"
end

fib = Fiber.new do
  f1 = f2 = 1
  loop do
    Fiber.yield f2
    f1, f2 = f2, f1 + f2
  end
end

10.times{ puts fib.resume }

fibonacci = lambda{
  f1 = f2 = 1
  return Proc.new{f1, f2 = f2, f1 + f2; p f1;}
}.call

10.times{ fibonacci.call }