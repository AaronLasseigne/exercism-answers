(ns space_age)

(def ^:private earth-year-in-seconds 31557600.0)

(defn- to-years [seconds orbital-ratio]
  (let [year-in-seconds (* earth-year-in-seconds orbital-ratio)]
    (->> (/ seconds year-in-seconds)
         (with-precision 2))))

(defn on-earth [seconds]
  (to-years seconds 1))

(defn on-mercury [seconds]
  (to-years seconds 0.2408467))

(defn on-venus [seconds]
  (to-years seconds 0.61519726))

(defn on-mars [seconds]
  (to-years seconds 1.8808158))

(defn on-jupiter [seconds]
  (to-years seconds 11.862615))

(defn on-saturn [seconds]
  (to-years seconds 29.447498))

(defn on-uranus [seconds]
  (to-years seconds 84.016846))

(defn on-neptune [seconds]
  (to-years seconds 164.79132))
