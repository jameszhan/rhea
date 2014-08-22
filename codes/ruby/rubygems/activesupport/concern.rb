
module Foo
  class << self
    def included(base)
      p "Foo included by #{base}"
#      base.send(:do_host_something)
    end
  end
  
  def foo
    puts "foo method invoked."
  end
end

module Bar
  include Foo
  def self.included(base)
    p "Bar included by #{base}"
#      base.send(:do_host_something)
  end
  
  def bar
    p "bar method invoked."
  end
end

class Host
  include Bar
end

require 'active_support/concern'

module Foo1 
  extend ActiveSupport::Concern
  included do |base|
    p "Foo1 included by #{base} <=> #{self} : #{base == self}"
#    self.send(:do_host_something)
  end
  
  module ClassMethods
    def foo1
      puts "#{self} invoke foo"
    end
  end
  
  def foo1
    puts "#{self} invoke foo"
  end

  def foofoo
    puts "#{self} invoke foofoo"
  end  
end

module Bar1
  extend ActiveSupport::Concern
  include Foo1
  
  included do |base|
    p "Bar1 included by #{base} <=> #{self} : #{base == self}"
#    self.send(:do_host_something)
  end
  module ClassMethods
    def bar1
      puts "#{self} invoke bar"
    end
  end
  
  def bar1
    puts "#{self} invoke bar"
  end
  
  def barbar
    puts "#{self} invoke barbar"
  end
end

class Host
  include Bar1
end

p "============= #{Host < Bar1} #{Host < Foo1} #{Host > Bar1} #{Host > Foo1} == #{Bar1 < Foo1} == #{Foo1 < Bar1}"

host = Host.new
Host.foo1
Host.bar1

host.foo1
host.bar1

host.foofoo
host.barbar
