(use 'clojure.walk)

(println (macroexpand ''(+ 1 2 3)))
(println (macroexpand '`(+ 1 2 3)))
(println (macroexpand '~(+ 1 2 3)))
(println (macroexpand '~@(+ 1 2 3)))
(println (macroexpand '@ref))
(println (macroexpand-all '#"^.+$"))
(println (macroexpand-all '#'x))
(println (macroexpand-all '#(+ %1 %2)))
(println (macroexpand-all '(+ 1 2 #_(+ 3 5 7))))