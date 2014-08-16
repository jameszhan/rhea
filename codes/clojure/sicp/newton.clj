(defn average [x y]
  (/ (+ x y) 2))

(defn improve [guess x]
  (average guess (/ x guess)))

(defn abs [x]
  (if (< x 0) (- x) x))

(defn square [x]
  (* x x))

(defn good-enough? [guess x]
  (< (abs (- (square guess) x)) 0.00001))

(defn sqrt-itr [guess x]
  (if (good-enough? guess x)
    guess
    (sqrt-itr (improve guess x) x)))

(defn sqrt [x]
  (sqrt-itr 1.0 x))


(println (sqrt 2))
(println (sqrt 3))
(println (sqrt 5))
(println (sqrt 8))
(println (sqrt 13))