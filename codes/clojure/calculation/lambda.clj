;;λ演算
;;
;;α--变换
;;α变换规则表达的是，被绑定变量的名称是不重要的。
;;α变换规则陈述的是，若v与w均为变量，E是一个lambda表达式，同时E[v/w]是指把表达式E中的所有的v的自由出现都替换成w，那么在w不是E中的一个自由出现，且如果w替换了v，w不会被E中的λ绑定的情况下，有
;;  λv.E == λw.E[v/w]
;; 例如：λx.(λx.x)x <=> λy.(λx.x)y
;;
;;β--规约
;;β规约规则表达的是函数作用的概念，它陈述了所有的E‘的自由出现在E[v/E']中仍然是自由的情况下，有 ((λv.E)E') == E[v/E'] 成立。
;;
;;η--变换
;;η变换表达的是外延性的概念，在这里外延性指的是，两个函数对于所有的参数得到的结果一致，当且仅当它们是同一个函数，η变换可以令 λx.fx和f相互交换，只要x不是f中的自由出现。
;;

(def zero (fn [f x] x))
;(defn zero [f x] x)
(defn succ [n] (fn [f x] (f (n f x))))

;(def one (fn [f x] (f x)))
(defn one [f x] (f x))
;(def two (fn [f x] (f (f x))))
(defn two [f x] (f (f x)))
;(def three (fn [f x] (f (f (f x)))))
(defn three [f x] (f (f (f x))))

(defn plus [m n] (fn [f x] (m f (n f x))))
;(defn mult [m n] (fn [f x] (n #(m f %) x)))
(defn mult [m n] (fn [f x] (n (partial m f) x)))

(defn church->int [n] (n #(inc %) 0))

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