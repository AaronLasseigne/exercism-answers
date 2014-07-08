(ns leap)

(defn leap-year? [year]
  (cond
    (= (mod year 400) 0) true
    (= (mod year 100) 0) false
    (= (mod year 4)   0) true
    :else false))
