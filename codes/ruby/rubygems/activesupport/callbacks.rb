require 'active_support/callbacks'

class Record
  include ActiveSupport::Callbacks
  define_callbacks :save, :create
  set_callback :save, :before, -> { puts "hello..." }
  set_callback :save, :after, -> { puts "world..." }
  set_callback :create, :before, -> { puts "hello..." }
  set_callback :create, :after, -> { puts "world..." }
  
  #set_callback :create, :around, ->(*args) { p args; puts "around before"; true }
  #set_callback :create, :around, ->(*args) { p args; puts "around after"; true }
  
  def save
    run_callbacks :save do
      puts "- save"
      "Very Good"
    end    
  end
  
  def create
    puts "create..."
    "Good!"
  end

  def create_with_callbacks
    run_callbacks :create do
      create_without_callbacks
    end    
  end  
  alias_method_chain :create, :callbacks 

end

class PersonRecord < Record
  set_callback :save, :before, :saving_message
  def saving_message
    puts "saving..."
  end

  set_callback :save, :after do |object|
    puts "saved"
  end
  
  set_callback :create, :before, -> { puts "good..." }
  set_callback :create, :after, -> { puts "...doog" }
end


p PersonRecord.new.save

p PersonRecord.new.create



class StaticClass
#  class << self
    include ActiveSupport::Callbacks
    define_callbacks :lookup
    
    set_callback :lookup, :after, -> { puts "hello..." }
    
    def lookup
      run_callbacks :lookup do
        puts "LOOKUP"
        "OK"
      end
    end
#  end  
end

puts StaticClass.new.lookup