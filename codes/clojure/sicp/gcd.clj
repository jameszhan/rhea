(defn gcd [a b]
  (if (= b 0)
    a
    (gcd b (mod a b))))

(println (gcd 45 78))
(println (gcd 30 20))