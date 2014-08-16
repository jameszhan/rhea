;;java -cp clojure-1.6.0.jar clojure.main
(println
  "agent =" *agent*
  "\ncommand-line-args =" *command-line-args*
  "\ncompile-files =" *compile-files*
  "\ncompile-path =" *compile-path*
  "\ncompiler-options =" *compiler-options*
  "\ndata-readers =" *data-readers*
  "\ndefault-data-reader-fn =" *default-data-reader-fn*
  "\nwarn-on-reflection =" *warn-on-reflection*
  "\nunchecked-math =" *unchecked-math*
  "\nread-eval =" *read-eval*
  "\nprint-readably =" *print-readably*
  "\nprint-meta =" *print-meta*
  "\nprint-level ="* *print-level*
  "\nprint-length =" *print-length*
  "\nprint-dup =" *print-dup*
  "\nns =" *ns*
  "\nin =" *in*
  "\nout =" *out*
  "\nerr =" *err*
  "\nfile =" *file*
  "\nflush-on-newline =" *flush-on-newline*)

(println)
(println *1 *2 *3 *e)

;; Types
;;  ArrayChunk
;;  Vec
;;  VecNode
;;  VecSeq

;; http://clojure.org/cheatsheet

;;compare & test
(println (< 1 2 3))
(println (<= 1 2 3))
(println (> 1 2 3))
(println (>= 1 2 3))
(println (= 1 2 3))
(println (== 1 2 3))
(println (== 1 1 1))
(println)


;;quote
(println '(print (+ 1 2)))
(println `(print (+ 1 2)))
(println `(print ~(+ 1 2)))

;;;
;(defmacro go-away [name & body]
;  (println name ~@body))
;(go-away "hello" "world" "abcdefg", "xyz", "world")









