matchn_num(A, B, C, D) :- 
  Vars = [A, B, C, D],
  Vars in 0..9,
  X = 1000 * A + 100 * B + 10 * C + D,
  Y = 1000 * D + 100 * C + 10 * B + A,
  X = 9 * Y.