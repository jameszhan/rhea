
class Hasie
  def initialize(hash)
    @hash = hash
  end

  def method_missing(method, *args, &block)
    if @hash.include?(method)
      self.class.__send__ :define_method, method do|*args, &block|
        @hash[method]
      end
      self.__send__(method, *args, &block)
    else
      super
    end
  end

end

hash = {:a => 1, :b => 2}
h = Hasie.new(hash)
puts h.a()
puts h.b()