different(red, green).
different(red, blue).
different(green, red).
different(green, blue).
different(blue, red).
different(blue, green).

coloring(A, B, C, D, E) :-
  different(A, B),
  different(A, D),
  different(B, C),
  different(B, D),
  different(B, E),
  different(C, D).