(ns prime_factors)

(defn- divisible? [a b]
  (= (rem a b) 0))

(defn of [number]
  (loop [remaining number
         primes []
         divisor  2]
    (cond
      (< remaining 2) primes
      (divisible? remaining divisor) (recur (/ remaining divisor)
                                            (conj primes divisor)
                                            divisor)
      :else (recur remaining
                   primes
                   (inc divisor)))))
