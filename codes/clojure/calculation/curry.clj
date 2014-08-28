(println ((fn [x y] (- x y)) 5 2))

(println (((fn [x] (fn [y] (- x y))) 5) 2))

(defn zero [f x] x)
(defn succ [n] (fn [f x] (f (n f x))))

(defn one [f x] (f x))
(defn two [f x] (f (f x)))
(defn three [f x] (f (f (f x))))

(println (two (fn [x] (three inc x)) 0))

(defn add [n m] (fn [f x] (m f (n f x))))
(println ((add two three) inc 0))
(defn mul [n m] (fn [f x] (m (partial n f) x)))
(println ((mul two three) inc 0))
(defn exp [a n] )