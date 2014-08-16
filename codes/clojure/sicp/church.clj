(defn zero [] (fn [f] (fn [x] x)))
(defn succ [n] #(fn [f] (fn [x] (f (((n) f) x)))))

;;
;; one = (succ zero)
;;      = (fn [f] (fn [x] (f (((zero) f) x))))
;;      = (fn [f] (fn [x] (f ((fn [x] x) x))))
;;      = (fn [f] (fn [x] (f x)))
;;
;; two = (succ one)
;;     = (fn [f] (fn [x] (f (((one) f) x))))
;;     = (fn [f] (fn [x] (f ((fn [x] (f x)) x))))
;;     = (fn [f] (fn [x] (f (f x))))
;;

(defn one [] (fn [f] (fn [x] (f x))))
(defn two [] (fn [f] (fn [x] (f (f x)))))
(defn three [] (fn [f] (fn [x] (f (f (f x))))))

(defn plus [m n] #(fn [f] (fn [x] (((m) f) (((n) f) x)))))
(defn mult [m n] #(fn [f] ((n) ((m) f))))

(defn church->int [n] (((n) (fn [x] (inc x))) 0))


(println (church->int zero))
(println (church->int one))
(println (church->int two))
(println (church->int three))

(println "SUCC")
(println (church->int (succ zero)))
(println (church->int (succ one)))
(println (church->int (succ two)))

(println "PLUS")
(println (church->int (plus zero zero)))
(println (church->int (plus one one)))
(println (church->int (plus one two)))
(println (church->int (plus three three)))

(println "MUL")
(println (church->int (mult zero three)))
(println (church->int (mult one two)))
(println (church->int (mult one three)))
(println (church->int (mult three two)))
(println (church->int (mult three (succ two))))

