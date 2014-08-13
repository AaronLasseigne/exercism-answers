(ns roman_numerals)

(defn numerals [number]
  (loop [remaining number
         output ""]
    (cond
      (>= remaining 1000) (recur (- remaining 1000) (apply str output "M"))
      (>= remaining  900) (recur (- remaining  900) (apply str output "CM"))
      (>= remaining  500) (recur (- remaining  500) (apply str output "D"))
      (>= remaining  400) (recur (- remaining  400) (apply str output "CD"))
      (>= remaining  100) (recur (- remaining  100) (apply str output "C"))
      (>= remaining   90) (recur (- remaining   90) (apply str output "XC"))
      (>= remaining   50) (recur (- remaining   50) (apply str output "L"))
      (>= remaining   40) (recur (- remaining   40) (apply str output "XL"))
      (>= remaining   10) (recur (- remaining   10) (apply str output "X"))
      (=  remaining    9) (apply str output "IX")
      (>= remaining    5) (recur (- remaining 5) (apply str output "V"))
      (=  remaining    4) (apply str output "IV")
      (>= remaining    0) (apply str output (repeat remaining "I")))))
