

module BaseHook
  
  def inherited(base)
   hook_invoked(base, __callee__)
#   super
  end

  def included(base)
   hook_invoked(base, __callee__)
#   super
  end
  
  def extended(base)
     hook_invoked(base, __callee__)
  end
  
  def extend_object(base)
    hook_invoked(base, __callee__)
    super
  end

  def append_features(base)
    hook_invoked(base, __callee__)
    super
  end
      


  def hook_invoked(base, method)
    puts "#{base} #{method} #{self}."
  end
  
  
  class << self
    include BaseHook
  end
  
end
