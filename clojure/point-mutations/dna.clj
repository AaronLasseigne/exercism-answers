(ns dna)

(defn hamming-distance
  [strand other]
  (count (filter true? (map not= strand other))))
