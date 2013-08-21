(ns beer
  (:require [clojure.string :refer [capitalize join]]))

(defn- bottles
  [remaining]
  (case remaining
    (-1) "99 bottles"
    (0)  "no more bottles"
    (1)  "1 bottle"
    (join " " [remaining "bottles"])))

(defn- first-line
  [remaining]
  (let [bottles_remaining (bottles remaining)]
    (join " " [(capitalize bottles_remaining)
               "of beer on the wall,"
               bottles_remaining
               "of beer."])))

(defn- second-line-first-half
  [remaining]
  (if (= 0 remaining)
    "Go to the store and buy some more"
    (join " " ["Take"
               (if (= 1 remaining) "it" "one")
               "down and pass it around"])))

(defn- second-line-second-half
  [remaining]
  (join " " ["," (bottles (dec remaining)) "of beer on the wall."]))

(defn- second-line
  [remaining]
  (apply str
    (second-line-first-half remaining)
    (second-line-second-half remaining)))

(defn verse
  [bottles]
  (join "\n" [(first-line bottles) (second-line bottles) ""]))

(defn sing
  ([beginning] (sing beginning 0))
  ([beginning ending]
  (if (= beginning ending)
    (apply str (verse beginning) "\n")
    (join "\n" [(verse beginning) (sing (dec beginning) ending)]))))
