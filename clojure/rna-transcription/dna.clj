(ns dna
  (:require [clojure.string :as str :only [:replace]]))

(defn to-rna [nucleotides]
  (str/replace nucleotides #"T" "U"))
