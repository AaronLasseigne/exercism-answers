(ns prime_factors)

(defn- divisible? [a b]
  (= (rem a b) 0))

(defn of [number]
  (loop [remaining number
         divisors []
         divisor  2]
    (cond
      (< remaining 2) divisors
      (divisible? remaining divisor) (recur (/ remaining divisor)
                                            (conj divisors divisor)
                                            divisor)
      :else (recur remaining
                   divisors
                   (inc divisor)))))
