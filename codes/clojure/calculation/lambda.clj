;;λ演算
;;
;;  <expression> := <name> | <function> | <application>
;;  <function> := λ<name>.<expression>
;;  <application> := <expression><expression>
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
;;Arithmetic in lambda calculus
;;
;;  0 := λf.λx.x
;;  1 := λf.λx.f x
;;  2 := λf.λx.f (f x)
;;  3 := λf.λx.f (f (f x))
;;
;;  SUCC  := λn.λf.λx.f (n f x)
;;  PLUS  := λm.λn.m SUCC n
;;  PLUS  := λm.λn.λf.λx.m f (n f x)
;;  MULT  := λm.λn.m (PLUS n) 0
;;  MULT  := λm.λn.λf.m (n f)
;;  PRED  := λn.λf.λx.n (λg.λh.h (g f)) (λu.x) (λu.u)
;;  SUB   := λm.λn.n PRED m
;;  POW   := λb.λe.e b
;;
;;Logic and predicates
;;
;;  TRUE  := λx.λy.x
;;  FALSE := λx.λy.y
;;  AND   := λp.λq.p q p
;;  OR    := λp.λq.p p q
;;  NOT   := λp.λa.λb.p b a
;;  IFTHENELSE := λp.λa.λb.p a b
;;
;;Pairs
;;  PAIR := λx.λy.λf.f x y
;;  FIRST := λp.p TRUE
;;  SECOND := λp.p FALSE
;;  NIL := λx.TRUE
;;  NULL := λp.p (λx.λy.FALSE)
;;

(defn zero [f] (fn [x] x))
(defn succ [n] (fn [f] (fn [x] (f ((n f) x)))))

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

(defn one [f] (fn [x] (f x)))
(defn two [f] (fn [x] (f (f x))))
(defn three [f] (fn [x] (f (f (f x)))))

(defn plus [m n] (fn [f] (fn [x] ((m f) ((n f) x)))))
(defn mult [m n] (fn [f] (n (m f))))
;(defn mult [m n] (fn [f] (fn [x] ((n (m f)) x))))
(defn exp [a n] (n a))

(defn pred [n]
  (fn [f]
    (fn [x]
      (((n (fn [g] (fn [h] (h (g f)))))
         (fn [u] x))
        (fn [u] u)))))

(defn sub [n m] ((m pred) n))

(defn church->int [n] ((n (fn [x] (inc x))) 0))

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

(println "EXP")
(println (church->int (exp zero zero)))
(println (church->int (exp one zero)))
(println (church->int (exp two zero)))
(println (church->int (exp two three)))
(println (church->int (exp three two)))

(println "PRED")
(println (church->int (pred zero)))
(println (church->int (pred one)))
(println (church->int (pred two)))
(println (church->int (pred three)))
(println (church->int (pred (succ three))))

(println "SUB")
(println (church->int (sub zero zero)))
(println (church->int (sub two two)))
(println (church->int (sub two one)))
(println (church->int (sub three one)))
(println (church->int (sub (succ three) one)))


(println "\nEVEN RULES")
(defn church->even [n] ((n #(+ % 2)) 0))
(println (church->even zero))
(println (church->even (succ zero)))
(println (church->even (plus (succ zero) (succ (succ zero)))))
(println (church->even (mult three three)))

(println "\nEGATIVE NUMBER")
(defn church->neg [n] ((n dec) 0))
(println (church->neg zero))
(println (church->neg (succ zero)))
(println (church->neg (plus (succ zero) (succ (succ zero)))))
(println (church->neg (mult three three)))

;;Logic and predicates
(println "\nLogic and predicates")
(defn TRUE [x y] x)
(defn FALSE [x y] y)
(defn IF [p a b] (p a b))

(println (IF TRUE 3 6))
(println (IF FALSE "A" "B"))


;;Pairs
(println "\nPairs")
(defn cons [x y] (fn [m] (IF m x y)))

(defn car [z] (z TRUE))
(defn cdr [z] (z FALSE))

(def a (cons 1 2))
(println (car a))
(println (cdr a))

(def b (cons 1 a))
(println (car b))
(println (cdr b))
(println (car (cdr b)))
(println (cdr (cdr b)))

(def c (cons (cons 1 2) (cons 3 4)))
(println (car c))
(println (car (car c)))


