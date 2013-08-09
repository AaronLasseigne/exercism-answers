(ns phrase
  (:require [clojure.string :as str :only [split lower-case]]))

(defn- words [text]
  (str/split text #"[^\p{Alnum}]+"))

(defn- normalize [word]
  (str/lower-case word))

(defn word-count [text]
  (->>
    (words text)
    (map normalize)
    (frequencies)))
