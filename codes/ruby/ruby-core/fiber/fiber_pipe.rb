class PE
  attr_accessor :source
  
  def initialize
    @fiber_delegate = Fiber.new do
      process
    end
  end
  
  def |(other)
    other.source = self
    other
  end
  
  def resume
    @fiber_delegate.resume
  end
  
  def process
    while value = input
      handle_value(value)
    end
  end
  
  def handle_value(value)
    output(value)
  end
  
  def input
    @source.resume
  end
  
  def output(value)
    Fiber.yield value
  end
  
end

class Producer < PE
  def process
    while true
      value = readline.chomp
      handle_value(value)
    end
  end
end

class Filter < PE
  def initialize
    @line = 1
    super()
  end
  
  def handle_value(value)
    value = sprintf("%5d %s", @line, value)
    output(value)
    @line = @line.succ
  end    
end

class Consumer < PE
  def handle_value(value)
    puts value
  end
end

if $0 == __FILE__
  producer=Producer.new
  filter=Filter.new
  consumer=Consumer.new

  pipeline = producer | filter | consumer
  pipeline.resume
end

