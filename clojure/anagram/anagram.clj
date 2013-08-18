(ns anagram)

(defn anagrams-for
  [subject words]
  (let
    [subject-char-freq (frequencies subject)]
    (filter #(= subject-char-freq (frequencies %)) words)))
