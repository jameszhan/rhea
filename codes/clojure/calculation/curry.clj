(println ((fn [x y] (- x y)) 5 2))

(println (((fn [x] (fn [y] (- x y))) 5) 2))

(defn zero [f x] x)
(defn succ [n] (fn [f x] (f (n f x))))

(defn one [f x] (f x))
(defn two [f x] (f (f x)))
(defn three [f x] (f (f (f x))))

(println (two (fn [x] (three inc x)) 0))

