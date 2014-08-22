def send(x)
  Fiber.yield(x)
end

def receive(prod)
  prod.resume
end

def producer()
  Fiber.new do
    while true
      x = readline.chomp
      send(x)
    end
  end
end

def consumer(producer)
  while true
    x = receive(producer)
    break if x == 'quit'
    puts x
  end
end

if $0 == __FILE__
  consumer(producer())
end