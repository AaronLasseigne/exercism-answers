(ns phone
  (:require [clojure.string :as string]))

(def length 10)
(def bad-number (apply str (repeat length "0")))

(defn- clean
  [number]
  (string/replace number #"[^0-9]+" ""))

(defn number
  [digits]
  (let [digits (clean digits)]
    (cond
      (= (count digits) length) digits
      (and
        (= (count digits) (+ length 1))
        (= (subs digits 0 1) "1")
      ) (subs digits 1)
      :else bad-number)))

(defn area-code
  [digits]
  (subs (number digits) 0 3))

(defn- exchange
  [digits]
  (subs (number digits) 3 6))

(defn- suffix
  [digits]
  (subs (number digits) 6))

(defn pretty-print
  [digits]
  (format "(%s) %s-%s" (area-code digits) (exchange digits) (suffix digits)))