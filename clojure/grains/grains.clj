(ns grains)

(defn- expt [number exponent]
  (if (= exponent 0)
    1
    (apply * (repeat exponent number))))

(defn square [number]
  (expt (bigint 2) (- number 1)))

(defn total []
  (- (square 65) 1))
