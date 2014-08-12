(ns scrabble-score.test (:require [clojure.test :refer :all]))
(load-file "scrabble_score.clj")

(deftest lower-case-letter
  (is (= 1 (scrabble_score/score-letter "a"))))

(deftest upper-case-letter
  (is (= 1 (scrabble_score/score-letter "A"))))

(deftest two-letter-word
  (is (= 2 (scrabble_score/score-word "at"))))

(deftest bigger-word-1
  (is (= 6 (scrabble_score/score-word "street"))))

(deftest bigger-word-2
  (is (= 22 (scrabble_score/score-word "quirky"))))

(deftest all-upper-case-word
  (is (= 20 (scrabble_score/score-word "MULTIBILLIONAIRE"))))

(run-tests)
