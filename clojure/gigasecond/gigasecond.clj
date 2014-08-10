(ns gigasecond
  (:import (java.util Calendar)))

(def ^:private ->seconds
  (bigint (Math/pow 10 9)))

(defn- build-offset-cal [year month day offset]
  (doto (Calendar/getInstance)
    (.set year (dec month) day 0 0 offset)))

(defn- cal->date-vec [cal]
  [(.get cal Calendar/YEAR)
   (inc (.get cal Calendar/MONTH))
   (.get cal Calendar/DAY_OF_MONTH)])

(defn from [year month day]
  (-> (build-offset-cal year month day ->seconds)
      cal->date-vec))
