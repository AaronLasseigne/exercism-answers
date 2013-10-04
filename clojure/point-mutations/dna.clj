(ns dna)

(defn- non-matching-pair?
  [[a b]]
  (not= a b))

(defn hamming-distance
  [strand other]
  (count (filter non-matching-pair? (map vector strand other))))
