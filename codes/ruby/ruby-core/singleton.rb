require 'singleton'

class SingletonConfig
	include Singleton	
end

class PrototypeConfig

end

class DefaultConfig
	def self.instance
		@instance ||= self.new
	end
	private 
	def self.new
		super
	end	
end

begin
	puts SingletonConfig.instance
	puts SingletonConfig.instance
	puts SingletonConfig.instance
	
	puts PrototypeConfig.new
	puts PrototypeConfig.new
	puts PrototypeConfig.new
	
	puts DefaultConfig.new
	puts DefaultConfig.new
	puts DefaultConfig.new
	
	puts DefaultConfig.instance
	puts DefaultConfig.instance
	puts DefaultConfig.instance
rescue Exception => e
	puts e
end