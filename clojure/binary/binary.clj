(ns binary)

(defn- bit->int [bit]
  (if (= bit \1) 1 0))

(defn- binary->decimal [shift bit]
  (bit-shift-left bit shift))

(defn to-decimal [binary]
  (->> binary
       (map bit->int)
       (reverse)
       (map-indexed binary->decimal)
       (reduce +)))
