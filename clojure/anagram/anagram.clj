(ns anagram)

(defn anagrams-for
  [subject words]
  (let
    [subject_char_freq (frequencies subject)]
    (filter #(= subject_char_freq (frequencies %)) words)))
