(ns raindrops)

(def ^:private translations
  {3 "Pling"
   5 "Plang"
   7 "Plong"})

(defn- translate [phrase]
  (reduce-kv (fn [translation number word]
              (if (zero? (mod phrase number))
                (str translation word)
                translation))
             ""
             translations))

(defn convert [phrase]
  (let [translation (translate phrase)]
    (if (empty? translation)
      (str phrase)
      translation)))
