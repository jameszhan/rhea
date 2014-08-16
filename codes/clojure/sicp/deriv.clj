(def dx 0.000001)

(defn deriv [g]
  (fn [x]
    (/ (- (g (+ x dx)) (g x)) dx)))

(defn cube [x] (* x x x))

(println ((deriv cube) 5))

(defn newton-transform [g]
  (fn [x]
    (- x (/ (g x) ((deriv g) x)))))

(println ((newton-transform cube) 5))