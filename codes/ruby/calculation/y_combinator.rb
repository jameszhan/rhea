# Define the Y combinator
module YCombinator
  def y_comb(&generator)
    proc { |x|
      proc { |*args|
        generator.call(x.call(x)).call(*args)
      }
    }.call(proc { |x|
      proc { |*args|
        generator.call(x.call(x)).call(*args)
      }
    })
  end
end

# Give the y_comb function to all objects
class Object
  include(YCombinator)
end


hash = y_comb { |callback|
  proc {
    Hash.new { |h, k| h[k] = callback.call }
  }
}.call

# Now this will work:
hash['a']['b']['c']['d']['e']['f']['g'] = 1

# And hash looks like:
puts hash   # => {"a"=>{"b"=>{"c"=>{"d"=>{"e"=>{"f"=>{"g"=>1}}}}}}}
