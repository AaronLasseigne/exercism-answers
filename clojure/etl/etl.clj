(ns etl)

(defn- transform-helper [data [score values]]
  (merge data (zipmap (map #(.toLowerCase %1) values) (repeat score))))

(defn transform [data]
  (reduce transform-helper {} data))
