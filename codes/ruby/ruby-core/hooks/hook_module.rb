require './base_hook'

module Hook
  class << self
    include BaseHook
  end
  
  def const_missing(id)
    warn "undefined constant #{id.inspect}"
  end
  
  def method_missing(name)
    warn "undefined method #{name}"
  end
  
  def m1
    puts "#{__callee__} called by #{self}"
  end

end