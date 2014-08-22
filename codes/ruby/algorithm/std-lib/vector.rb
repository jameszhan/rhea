require 'pp'
require 'matrix'

pp 3.abs
pp 3.abs2


v1 = Vector[7, 4, 1]
v2 = Vector.elements([8, 5, 2])

pp "v1 = #{v1} #{v1.magnitude}, v2 = #{v2} #{v1.magnitude}"

pp "v1 + v2 => #{v1 + v2}"
pp "v1 - v2 => #{v1 - v2}"
pp "v2 - v1 => #{v2 - v1}"
pp "v1 * 3 => #{v1 * 3}"

v1.each do |e|
  p e
end

v1.each2(v2) do |i, j|
  p "i = #{i}, j = #{j}"
end

pp v1.inner_product(v2)

pp v1.map do |e|
  e * 3
end


pp Vector[1, 1, 1].magnitude
pp Vector[2, 2, 2].magnitude
pp Vector[3, 3, 3].magnitude

pp Vector[1, 3, 6].magnitude
pp Vector[6, 3, 1].magnitude


pp Vector[3, 6, 9].magnitude
pp Vector[1, 10, 100].magnitude

