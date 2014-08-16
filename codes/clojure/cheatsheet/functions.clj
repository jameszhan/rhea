(use 'clojure.walk)

(println (macroexpand-1 '(fn [x y] (+ x y))))
(println (macroexpand '(fn [x y] (+ x y))))
(println (macroexpand-all '(fn [x y] (+ x y))))

(println (macroexpand-1 '(defn hello [name] (println "hello" name))))
(println (macroexpand '(defn hello [name] (println "hello" name))))
(println (macroexpand-all '(defn hello [name] (println "hello" name))))

(println (macroexpand-1 '(defn- hello [name] (println "hello" name))))
(println (macroexpand '(defn- hello [name] (println "hello" name))))
(println (macroexpand-all '(defn- hello [name] (println "hello" name))))

(println (macroexpand-1 '(memfn hello)))
(println (macroexpand '(memfn hello)))
(println (macroexpand-all '(memfn hello)))

(println (filter identity [1 2 3 nil false 6 true]))
(println (map (constantly 9) [1 2 3]))
(println ((comp (partial apply str) reverse str) "hello" "world"))
(println ((complement empty?) []))
(println ((complement empty?) [1 2]))
(println ((partial + 100) 3))
(println ((juxt identity name) :keyword))

(def hello-memo (memoize #(println "hello" "world")))
(hello-memo)

(println ((every-pred number? odd?) 3 9 11))
(println ((some-fn number? odd?) 3 9 11))

(println (ifn? hello-memo))
(println (fn? hello-memo))
