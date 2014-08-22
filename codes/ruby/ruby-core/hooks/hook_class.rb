require './base_hook'

class Hook
  class << self
    include BaseHook
  end

  

  def c1
    puts "#{__callee__} called by #{self}"
  end

end