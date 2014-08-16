(defn abs [v]
  (if (< v 0)
    (- v)
    v))

(defn backtrack [n m pred? handle]
  (letfn [(dfs [ref-a k]
            (doseq [i (range n)] (do
                                   (dosync (alter ref-a assoc k i))
                                   (if (pred? @ref-a k)
                                     (if (= k (- m 1))
                                       (handle @ref-a)
                                       (dfs ref-a (inc k)))))))]
    (let [ref-a (ref (vec (repeat m 0)))] (dfs ref-a 0))))
    ;(let [ref-a (ref (vec (for [x (range m)] 0)))] (dfs ref-a 0))))

(defn permutation [n m]
  (backtrack n m
    (fn [c k]
      (let [a (subvec c 0 k)
            i (nth c k)]
        (->> a (filter (partial = i)) empty?)))
        ;;(empty? (filter (partial = i) a))))
        ;;(empty? (filter #(= i %) a))))
    (fn [c] (println (map #(char (+ 65 %)) c)))))

(defn combination [n m]
  (backtrack n m
    (fn [c k]
      (let [a (subvec c 0 k)
            i (nth c k)]
        (->> a (filter (partial <= i)) empty?)))
        ;;(empty? (filter #(<= i %) a))))
    (fn [c] (println (map #(char (+ 65 %)) c)))))

(defn nqueue [n]
  (backtrack n n
    (fn [c k]
      (let [a (map #(vector %1 %2) (subvec c 0 k) (range))
            i (nth c k)]
        (->> a (filter #(or (= i (nth % 0)) (= (- k (nth % 1)) (abs (- i (nth % 0)))))) empty?)))
        ;;(empty? (filter #(or (= i (nth % 0)) (= (- k (nth % 1)) (abs (- i (nth % 0))))) a))))
    (fn [c] (println c))))

(permutation 3 3)

(println )
(combination 4 2)

(println )
(nqueue 8)

