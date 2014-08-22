require 'fiber'

f = Fiber.new do
  p "hello"
end

begin
  p f.alive?
  p f.resume
  p f.alive?
  p f.resume
rescue => e
  puts e.message 
  puts e.backtrace.join("\n")
end


f = Fiber.new do |a, b, c|
  puts a, b, c
end

f.resume(1, 2, 3)

f = Fiber.new do |a, b|
  Fiber.yield a + b, a - b
  p a, b
end
p f.resume 10, 10
p f.resume 3, 4