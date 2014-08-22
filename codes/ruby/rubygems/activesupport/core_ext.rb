require 'active_support/core_ext'
class Bar
  def hello
    puts "Hello ==========> Everyone."
  end  
  def goodbye
    puts "GoodBye"
  end  
end


class Foo
  attr_accessor :bar
  def initialize(bar = nil)
    @bar = bar
  end
  delegate :hello, :goodbye, :to => :bar
end

foo = Foo.new(Bar.new)
foo.hello
foo.goodbye