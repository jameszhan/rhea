require 'fiber'

f = Fiber.new do
  puts "hello"
end

p f.alive?
f.resume
p f.alive?
begin
  f.resume
rescue FiberError => e
  puts "FiberError: #{e}"
end

begin
  Fiber.yield
rescue FiberError => e
  puts "FiberError: #{e}"
end

f = Fiber.new do
  puts "in fiber @ 1."
  Fiber.yield
  puts "in fiber @ 2."
  Fiber.yield
  puts "in fiber @ 3."
end
f.resume
f.resume
f.resume

f1 = Fiber.new do|f2|
  print "Hello "
  f2.transfer
end

f2 = Fiber.new do
  print "World!"
end

f1.resume(f2)


f = Fiber.new do |a, b, c|
  p [a, b, c]
end
f.resume(1, 2, 3)

f = Fiber.new do |a, b|
  Fiber.yield a+b, a-b
  p a, b
end
p f.resume(10, 10)
p f.resume(3, 6)





