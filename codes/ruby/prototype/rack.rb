module Prototype	
	module Rack
		class Builder

			def initialize(default_app = nil, &block)
        @middlewares, @run = [], default_app
        instance_eval(&block) if block_given?
      end

      def self.app(default_app = nil, &block)
        self.new(default_app, &block).to_app
      end
			
			def use(middleware, *args, &block)
				@middlewares << lambda{|app| middleware.new(app, *args, &block)}
			end
			
			def run(app)
				@run = app
			end
			
			def to_app
				app = @run
				@middlewares.reverse.reduce(app){|a, m|
					m[a] #m.call(a) #m===a #m(a)
				}
			end		
				
		end	
	end	
end

class Hello
  def initialize(app)
    @app = app
  end
end

class World
  def initialize(app)
    @app = app
  end
end

app = Prototype::Rack::Builder.app do 
  use World
  use Hello
  run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['OK']] }
end

puts app.inspect
