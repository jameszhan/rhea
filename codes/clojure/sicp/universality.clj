(defn filter [predicate sequence]
  (cond
    (empty? sequence) nil
    (predicate (first sequence)) (cons (first sequence) (filter predicate (rest sequence))))
    :else (filter predicate (rest sequence)))

;(filter (fn [_] false) (list 1 2 3 4 5))

(defn accumulate [op initial sequence]
  (if (empty? sequence)
    initial
    (op (first sequence) (accumulate op initial (rest sequence)))))


(println (accumulate + 0 '(1 2 3 4 5)))

(defn accumulate2 [op initial sequence]
  (letfn [(iter [ret op sequence]
            (if (empty? sequence)
              ret
              (iter (op ret (first sequence)) op (rest sequence))))]
    (iter initial op sequence)))


(println (accumulate2 + 0 '(1 2 3 4 5)))


(defn accumulate3 [op initial sequence]
  (letfn [(iter [ret op sequence]
            (if (empty? sequence)
              ret
              (recur (op ret (first sequence)) op (rest sequence))))]
    (iter initial op sequence)))


(println (accumulate3 + 0 '(1 2 3 4 5)))



(println (accumulate + 0 (range 1000)))
(println (accumulate2 + 0 (range 1000)))
(println (accumulate3 + 0 (range 1000)))
(println (accumulate3 + 0 (range 10000000)))


(defn interval [low high]
  (if (> low high)
    nil
    (cons low (interval (inc low) high))))

(println (interval 2 7))

(defn fibonacci [n]
  (if (<= n 2)
    1
    (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))

(println (for [x (range 10)] (fibonacci (+ x 1))))


(defn fibonacci2 [n]
  (letfn [(iter [r1 r2 i]
            (if (> i n)
              r1
              ;(iter r2 (+ r2 r1) (inc i))))]
              (recur r2 (+ r2 r1) (inc i))))]
    (iter 1 1 1)))

(println (for [x (range 80)] (fibonacci2 x)))