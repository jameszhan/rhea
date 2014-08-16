(defn make-account [balance]
  (letfn [(withdraw [amount]
            (if (>= @balance amount)
              (do (dosync (ref-set balance (- @balance amount)))
                @balance)
              "Insufficient funds"))
          (deposit [amount]
            (dosync (ref-set balance (+ @balance amount)))
            @balance)
          (dispatch [m]
            (cond (= m 'withdraw) withdraw
              (= m 'deposit) deposit
              :else (println "Unknown request -- MAKE ACCOUNT" m)))]
    dispatch))

(def acc (make-account (ref 100)))

(println ((acc 'withdraw) 25))
(println ((acc 'withdraw) 85))
(println ((acc 'withdraw) 25))
(println ((acc 'deposit) 100))

