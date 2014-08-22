require "active_support"

module RubyHook

  class C1
    class << self
      def inherited(*args)
        puts "#{args} #{__callee__} #{self}"
      end
    end

    def c1m1

    end

    def c1m2

    end
  end

  module M1
    class << self
      def inherited(*args)
        puts "#{args} #{__callee__} #{self}"
      end

      def included(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def extended(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def append_features(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def extend_object(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def m1s1

      end

      def m1s2

      end
    end

    def m1m1

    end

    def m1m2

    end
  end

  module M2
    class << self
      def inherited(*args)
        puts "#{args} #{__callee__} #{self}"
      end

      def included(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def extended(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def append_features(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def extend_object(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def m2s1

      end

      def m2s2

      end
    end

    def m2m1

    end

    def m2m2

    end
  end

  class Herego < C1
    include M1
    extend  M2
  end

  p Herego.methods - Module.methods
  p Herego.new.methods  - Object.new.methods;


  puts ">>-------------------------------------------------------"
  module Mod
    extend ActiveSupport::Concern

    included do
      extend M1
      include M2
    end

    module ClassMethods
      def hello

      end
    end

    def world

    end

  end

  class Obj
    include Mod

  end
  
  p Obj.new.methods - Object.new.methods
  p Obj.methods - Module.methods

end

