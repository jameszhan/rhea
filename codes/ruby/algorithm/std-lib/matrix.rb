require 'pp'
require 'matrix'

pp Matrix.build(5, 5){|row, col| col - row}

pp Matrix.build(5, 5){ 2 }

pp Matrix.build(2, 2){ rand }

pp Matrix.row_vector([3, 5, 7])
pp Matrix.column_vector([3, 5, 7])

pp Matrix.rows([[25, 93], [-1, 66]])
pp Matrix.columns([[25, 93], [-1, 66]])

pp Matrix.diagonal(9, 6, 3)

pp Matrix.empty(3, 0)
pp Matrix.empty(0, 3)

pp Matrix.zero(3) 
pp Matrix.identity(3) 
pp Matrix.unit(3)       #alias for identify 

pp Matrix.scalar(2, 10)


puts "=" * 100

m = Matrix.rows([[1, 2, 3], [2, 3, 4], [3, 4, 5]])

pp m * 2
pp m * Vector[2, 2, 2]
pp m * m

pp m ** 2