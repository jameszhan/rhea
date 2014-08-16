(defmacro unless [pred a b]
  `(if (not ~pred) ~a ~b))

(use 'clojure.walk)
(println (macroexpand '(unless false (println "Will print") (println "Will not print"))))
(println (macroexpand-1 '(unless false (println "Will print") (println "Will not print"))))
(println (macroexpand-all '(unless false (println "Will print") (println "Will not print"))))




(println "=========================")
;;scope
(def ^:dynamic x 1)
(def ^:dynamic y 2)
(println (+ x y))
(binding [x 3 y 2] (println (+ x y)))

(def o (Object.))
(future (locking o
          (Thread/sleep 5000)
          (println "done")))
(future (locking o
          (Thread/sleep 5000)
          (println "done")))
(time (Thread/sleep 100))

(println (with-precision 10 (/ 1M 6)))

(println (with-out-str (println "this should return as a string")))


;;(defn prompt [question] (println question) (read-line))
;;(with-in-str "28" (prompt "How old are you?"))












