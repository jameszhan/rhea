;;
;;
;;<expr> ::= <identifier>
;;<expr> ::= lambda <identifier-list>. <expr>
;;<expr> ::= (<expr> <expr>)
;;
;;

(def zero (fn [f] (fn [x] x)))
(def succ (fn [n] (fn [f] (fn [x] (f ((n f) x))))))

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

(def one (fn [f] (fn [x] (f x))))
(def two (fn [f] (fn [x] (f (f x)))))
(def three (fn [f] (fn [x] (f (f (f x))))))

(def plus (fn [m n] (fn [f] (fn [x] ((m f) ((n f) x))))))
;(def mult (fn [m n] (fn [f] (n (m f)))))
(def mult (fn [m n] (fn [f] (fn [x] ((n (m f)) x)))))

(def church->int (fn [n] ((n (fn [x] (inc x))) 0)))

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

