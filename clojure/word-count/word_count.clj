(ns phrase
  (:require [clojure.string :as str :only [split lower-case]]))

(defn- normalize [word]
  (str/lower-case word))

(defn- words [text]
  (str/split (normalize text) #"[^\p{Alnum}]+"))

(defn word-count [text]
  (frequencies (words text)))
