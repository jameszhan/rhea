require 'fiber'

module FiberActor
  class Scheduler
    def initialize
      @queue = []
      @running = false
    end

    def run
      return if @running
      @running = true
      while true
        while actor=@queue.shift
          begin
            actor.fiber.resume
          rescue => ex
            puts "actor resume error,#{ex}"
          end
        end
        Fiber.yield
      end
    end

    def reschedule
      if @running
        @fiber.resume
      else
        self << Actor.current
      end
    end

    def running?
      @running
    end

    def <<(actor)
      @queue << actor unless @queue.last == actor
      unless @running
         @queue << Actor.current
         @fiber=Fiber.new { run }
         @fiber.resume
      end
    end
  end
  
  class Actor
    attr_accessor :fiber
    class << self
      def scheduler
        Thread.current.__scheduler__
      end

      def current
        Fiber.current.__actor__
      end

      def spawn(*args, &block)
        fiber = Fiber.new do
          block.call(args)
        end
        actor = new(fiber)
        fiber.instance_variable_set :@internal_actor, actor
        scheduler << actor
        actor
      end

      def receive(&block)
        current.receive(&block)
      end
    end

    def initialize(fiber)
      @mailbox=[]
      @fiber=fiber
    end

    def << (msg)
     @mailbox << msg
     Actor.scheduler << self
    end

    def receive(&block)
     Fiber.yield while @mailbox.empty?
     msg = @mailbox.shift
     block.call(msg)
    end

    def alive?
     @fiber.alive?
    end
  end
end

class Thread
  def __scheduler__
    @internal_scheduler ||= FiberActor::Scheduler.new
  end
end

class Fiber
  def __actor__
    @internal_actor
  end
end

include FiberActor

Actor.spawn { puts "hello world!"}

actor = Actor.spawn{
   Actor.receive{ |msg|  puts "receive #{msg}" }
}
actor << :test_message


pong = Actor.spawn do
      Actor.receive do |ping|
        ping << :pong
      end
    end
ping = Actor.spawn do
  pong << Actor.current
  Actor.receive do |msg|
    puts "ping #{msg}"
  end
end

if $0 == __FILE__
  Actor.scheduler.reschedule
end