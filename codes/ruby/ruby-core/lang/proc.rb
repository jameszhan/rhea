def double(callable_object)
  callable_object.call * 2
end

l = lambda{10}
p double(l)


pr = proc{10}
p double(pr)


l2 = lambda{return 10}
p double(l2)


p2 = proc{return 10}
# This fails with a LocalJumpError:
#p double(p2)

def anthor_double
  p = proc{return 10}
  result = p.call
  return p * 2  # unreachable code!
end

p anthor_double