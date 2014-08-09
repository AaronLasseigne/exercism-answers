(ns dna
  (:refer-clojure :exclude [count]))

(def nucleotides
  ^{:private true}
  #{\A \C \G \T})

(defn nucleotide-counts [chain]
  (->> chain
       (frequencies)
       (merge (zipmap nucleotides (repeat 0)))))

(defn count [nucleotide chain]
  (cond
    (= nucleotide \U) 0
    (nucleotides nucleotide) ((nucleotide-counts chain) nucleotide)
    :else (throw (Exception. "invalid nucleotide"))))
