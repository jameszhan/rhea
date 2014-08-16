(use 'clojure.walk)


(println (for [x [0 1 2 3 4 5] :let [y (* x 3)] :when (even? y)] y))
(doseq [x [1 2 3] y [1 2 3]] (print (* x y) " "))
(println)
(dotimes [n 10] (println (map #(* % (inc n)) (range 1 11))))

(def a (atom 10))
(while (pos? @a) (do (println @a) (swap! a dec)))

(println (macroexpand-1 '(for [x (range 3 7)] (* x x))))
(println (macroexpand '(for [x (range 3 7)] (* x x))))
(println (macroexpand-all '(for [x (range 3 7)] (* x x))))

(println (macroexpand-1 '(doseq [[x y] (map list [1 2 3] [1 2 3])] (println (* x y)))))
(println (macroexpand '(doseq [[x y] (map list [1 2 3] [1 2 3])] (println (* x y)))))
(println (macroexpand-all '(doseq [[x y] (map list [1 2 3] [1 2 3])] (println (* x y)))))

(println (macroexpand-1 '(dotimes [n 5] (println "n is" n))))
(println (macroexpand '(dotimes [n 5] (println "n is" n))))
(println (macroexpand-all '(dotimes [n 5] (println "n is" n))))

(println (macroexpand-1 '(while (pos? @a) (do (println @a) (swap! a dec)))))
(println (macroexpand '(while (pos? @a) (do (println @a) (swap! a dec)))))
(println (macroexpand-all '(while (pos? @a) (do (println @a) (swap! a dec)))))

(println)
(println (doto (java.util.ArrayList.) (.add -2) (.add -1) (#(dotimes [i 3] (.add % i)))))
(println (macroexpand-1 '(doto (java.util.ArrayList.) (.add -2) (.add -1) (#(dotimes [i 3] (.add % i))))))
(println (macroexpand '(doto (java.util.ArrayList.) (.add -2) (.add -1) (#(dotimes [i 3] (.add % i))))))
(println (macroexpand-all '(doto (java.util.ArrayList.) (.add -2) (.add -1) (#(dotimes [i 3] (.add % i))))))

(println)
(-> (range 6) (conj 9) reverse println)
(println (macroexpand-1 '(-> (range 6) (conj 9) reverse println)))
(println (macroexpand '(-> (range 6) (conj 9) reverse println)))
(println (macroexpand-all '(-> (range 6) (conj 9) reverse println)))

(println)
(->> (range 12) (map (partial + 5)) (filter even?) println)
(println (macroexpand-1 '(->> (range 12) (map (partial + 5)) (filter even?) println)))
(println (macroexpand '(->> (range 12) (map (partial + 5)) (filter even?) println)))
(println (macroexpand-all '(->> (range 12) (map (partial + 5)) (filter even?) println)))

(println)
(println (.. System getProperties (get "os.name")))
(println (macroexpand-1 '(.. System getProperties (get "os.name"))))
(println (macroexpand '(.. System getProperties (get "os.name"))))
(println (macroexpand-all '(.. System getProperties (get "os.name"))))

(println)
(println (.substring "hello" 1 3))
(println (macroexpand-1 '(.substring "hello" 1 3)))
(println (macroexpand '(.substring "hello" 1 3)))
(println (macroexpand-all '(.substring "hello" 1 3)))

(println)
(println (Math/pow 2 10))
(println (macroexpand-1 '(Math/pow 2 10)))
(println (macroexpand '(Math/pow 2 10)))
(println (macroexpand-all '(Math/pow 2 10)))

(println)
(println Integer/MAX_VALUE)
(println (macroexpand-1 '(Integer/MAX_VALUE)))
(println (macroexpand '(Integer/MAX_VALUE)))
(println (macroexpand-all '(Integer/MAX_VALUE)))


