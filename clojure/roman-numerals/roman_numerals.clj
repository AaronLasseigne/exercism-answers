(ns roman_numerals)

(def ^:private conversions
  (sorted-map-by >
                 1000 "M"
                 900 "CM"
                 500 "D"
                 400 "CD"
                 100 "C"
                 90 "XC"
                 50 "L"
                 40 "XL"
                 10 "X"
                 9 "IX"
                 5 "V"
                 4 "IV"
                 1 "I"))

(defn- amount->numerals [[output total] [amount numeral]]
  (let [times (quot total amount)]
    [(apply str output (repeat times numeral))
     (rem total amount)]))

(defn numerals [number]
  (->> conversions
       (reduce amount->numerals ["" number])
       (first)))
