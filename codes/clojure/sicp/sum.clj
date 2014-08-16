(defn sum2 [term a next b]
  (if (> a b)
    0
    (+ (term a)
      (sum2 term (next a) next b))))

(defn sum [term a next b]
  (loop [i a sum 0]
    (if (> i b)
      sum
      (recur (next i) (+ sum (term i))))))


(println (sum identity 1 inc 10))

(defn cube [x] (* x x x))
(println (sum cube 1 inc 10))

(defn pi-sum [a b]
  (letfn [(pi-term [x] (/ 1.0 (* x (+ x 2))))
          (pi-next [x] (+ x 4))]
    (sum pi-term a pi-next b)))


(println (* (pi-sum 1 10000) 8))

(defn integral [f a b dx]
  (letfn [(add-dx [x] (+ x dx))]
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
      dx)))

(println (integral cube 0 1 0.01))
(println (integral cube 0 1 0.000001))

(defn pi-sum2 [a b]
  (sum #(/ 1.0 (* % (+ % 2)))
    a
    #(+ % 4)
    b))

(println (* (pi-sum2 1 10000) 8))
