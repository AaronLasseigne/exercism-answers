(ns dna
  (:require [clojure.string :as str :only [:replace]]))

(defn to-rna [nucleotides]
  (let [thymine "T"
        uracil  "U"]
    (str/replace nucleotides thymine uracil)
  ))
