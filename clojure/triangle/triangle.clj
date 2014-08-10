(ns triangle)

(defn- valid? [a b c]
  (and (> (+ a b) c)
       (> (+ b c) a)
       (> (+ c a) b)))

(defn- isosceles? [a b c]
  (or (= a b)
      (= b c)
      (= c a)))

(defn type [a b c]
  (cond
    (= a b c) :equilateral
    (not (valid? a b c)) :illogical
    (isosceles? a b c) :isosceles
    :else :scalene))
