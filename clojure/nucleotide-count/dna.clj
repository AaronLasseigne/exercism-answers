(ns dna)

(def nucleotides
  ^{:private true}
  {\A 0,
   \C 0,
   \G 0,
   \T 0})

(defn nucleotide-counts
  [chain]
  (merge nucleotides (frequencies chain)))

(defn count
  [nucleotide chain]
  (cond
    (= nucleotide \U) 0
    (nucleotides nucleotide) ((nucleotide-counts chain) nucleotide)
    :else (throw (Exception. "invalid nucleotide"))))
