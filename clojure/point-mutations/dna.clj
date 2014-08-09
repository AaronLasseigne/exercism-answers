(ns dna)

(defn hamming-distance
  [strand other]
  (->>
    (map not= strand other)
    (filter true?)
    (count)))
