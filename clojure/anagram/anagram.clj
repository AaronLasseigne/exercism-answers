(ns anagram
  (:require [clojure.string :as str :only [split]]))

(defn- normalize
  [word]
  (sort (rest (str/split word #""))))

(defn- is-anagram
  [subject word]
  (= (normalize subject) (normalize word))
  )

(defn anagrams-for
  [subject words]
  (filter #(is-anagram subject %) words)
  )
