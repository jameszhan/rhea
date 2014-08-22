# encoding: UTF-8
require 'active_support/core_ext/module/aliasing'

module Alias
  
  def test()
    puts "test!"
  end 
  
  alias_method :test_a, :test
  
  def foo
    puts "foo"
  end
  
  def foo_with_debug()
    foo_without_debug()
    puts "#{__FILE__} #{__LINE__}"
  end
  
  alias_method_chain :foo, :debug
    
end

include Alias

test()
test_a()

foo()
foo_without_debug()


