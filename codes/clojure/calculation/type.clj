;;Type Stack
;;  Operations:
;;    make-stack()
;;    push(stack, x)
;;    pop(stack)
;;    top(stack)
;;  Invariants:
;;    top(push(stack, x)) == x
;;    pop(push(stack, x)) == stack
;;

;;(defn make-stack []
;;  (letfn [(push [x] (fn [f] (f x)))
;;          (pop [] ())]))



(defn make-stack [] nil)

(defn push [stack x]
  {:top x :pop stack})

(defn top [stack]
  (:top stack))

(defn pop [stack]
  (:pop stack))

(def stack (make-stack))
(println (def stack (push stack 1)))
(println (def stack (push stack 2)))
(println (def stack (push stack 3)))

(println (top stack))
(def stack (pop stack))

(println (top stack))
(def stack (pop stack))

(println (top stack))
(def stack (pop stack))

(println (top stack))



(defmacro dispatch [f & params]
  (list* f params))







