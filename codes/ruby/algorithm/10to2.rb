
def convert_10_to_2(num, ret)
  return if num == 0
  convert_10_to_2(num / 2, ret)
  ret << num % 2  
end

ret = []
convert_10_to_2(10, ret)
p ret.join("")


def reverse_input()
  c = gets()    
  reverse_input() if c != "\n"
  p c
end

reverse_input
