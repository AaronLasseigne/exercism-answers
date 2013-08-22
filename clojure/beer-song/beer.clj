(ns beer
  (:require [clojure.string :refer [capitalize join]]))

(defn- bottles
  [remaining]
  (case remaining
    (0) "no more bottles"
    (1) "1 bottle"
    (format "%d bottles" remaining)))

(defn- first-line
  [remaining]
  (let [bottles_remaining (bottles remaining)]
    (format "%s of beer on the wall, %s of beer.\n"
            (capitalize bottles_remaining)
            bottles_remaining)))

(defn- second-line-first-half
  [remaining]
  (if (= 0 remaining)
    "Go to the store and buy some more"
    (format "Take %s down and pass it around"
            (if (= 1 remaining) "it" "one"))))

(defn- second-line-second-half
  [remaining]
  (format ", %s of beer on the wall.\n"
          (bottles (if (= -1 remaining) 99 remaining))))

(defn- second-line
  [remaining]
  (apply str
         (second-line-first-half remaining)
         (second-line-second-half (dec remaining))))

(defn verse
  [bottles]
  (apply str (first-line bottles) (second-line bottles)))

(defn sing
  ([beginning] (sing beginning 0))
  ([beginning ending]
   (if (= beginning ending)
     (apply str (verse beginning) "\n")
     (join "\n" [(verse beginning) (sing (dec beginning) ending)]))))
