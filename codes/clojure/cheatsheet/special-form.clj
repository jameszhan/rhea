(use 'clojure.walk)

(println (macroexpand-all '(def a 1)))
(println (macroexpand-all '(quote a)))
(println (macroexpand-all '(var meta)))
(println (macroexpand-all '(if (< a 1) "hello" "world")))
(println (macroexpand-all '(do (+ 1 1) (+ 2 3) (+ 5 8))))
(println (macroexpand-all '(fn [x y z] (+ x y z))))
(println (macroexpand-all '(let [x 1 y 2] (+ x y))))
(println (macroexpand-all '(letfn [(p1 [x] (+ x 1))] (p1 1))))
(println (macroexpand-all '(loop [x 10] (when (> x 1) (println x) (recur (- x 2))))))
(println (macroexpand-all '(throw (Exception. "my exception message"))))
(println (macroexpand-all '(try (/ 1 0) (catch Exception e (str "caught exception: " (.getMessage e))))))

