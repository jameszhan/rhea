(import '(java.awt Color) '(javax.swing JPanel JFrame Timer)
  '(java.awt.event KeyEvent ActionListener KeyListener))

(defn gen-apple [_] [(rand-int 750) (rand-int 550)])
(defn move [{:keys [body dir] :as snake} & grow]
  (assoc snake :body (cons (vec (map #(+ (dir %) ((first body) %)) [0
                                                                    1]))
                       (if grow body (butlast body)))))
(defn turn [snake newdir] (if newdir (assoc snake :dir newdir) snake))
(defn collision? [{[b] :body} a]
  (every? #(<= (- (a %) 10) (b %) (+ 10 (a %))) [0 1]))
(defn paint [g p c] (.setColor g c) (.fillRect g (p 0) (p 1) 10 10))

(def dirs {KeyEvent/VK_LEFT [-10 0] KeyEvent/VK_RIGHT [10 0]
           KeyEvent/VK_UP   [0 -10] KeyEvent/VK_DOWN  [0 10]})
(def apple (atom (gen-apple nil)))
(def snake (atom {:body (list [10 10]) :dir [10 0]}))
(def colors {:apple (Color. 210 50 90) :snake (Color. 15 160 70)})
(def panel (proxy [JPanel ActionListener KeyListener] []
             (paintComponent [g] (proxy-super paintComponent g)
               (paint g @apple (colors :apple))
               (doseq [p (:body @snake)]
                 (paint g p (colors :snake))))
             (actionPerformed [e] (if (collision? @snake @apple)
                                    (do (swap! apple gen-apple)
                                      (swap! snake move :grow))
                                    (swap! snake move))
               (.repaint this))
             (keyPressed [e] (swap! snake turn (dirs (.getKeyCode e))))
             (keyReleased [e])
             (keyTyped [e])))

(doto panel (.setFocusable true)(.addKeyListener panel))
(doto (JFrame. "Snake")(.add panel)(.setSize 800 600)(.setVisible true))
(.start (Timer. 200 panel))