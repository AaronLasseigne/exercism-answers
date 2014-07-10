(ns etl)

(defn- lower-case [values]
  (map #(.toLowerCase %1) values))

(defn- map-keys-to-value [keys value]
  (zipmap keys (repeat value)))

(defn transform [data]
  (reduce
    (fn [data [key values]]
      (merge data (map-keys-to-value (lower-case values) key)))
  {} data))
