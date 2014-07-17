(ns meetup
  (:import (java.util Calendar)))

(defn- build-cal [year month day]
  (doto (Calendar/getInstance)
    (.set year (dec month) day)))

(defn- cal->vec [cal]
  [(.get cal Calendar/YEAR)
   (inc (.get cal Calendar/MONTH))
   (.get cal Calendar/DAY_OF_MONTH)])

(defn- on-a? [cal day-of-week]
  (= (.get cal Calendar/DAY_OF_WEEK) day-of-week))

(defn- next-day-of-week [day-of-week step year month day]
  (loop [cal (build-cal year month day)]
    (if (on-a? cal day-of-week) 
      (cal->vec cal)
      (do
        (.add cal Calendar/DAY_OF_WEEK step)
        (recur cal)))))

(defn- first-teenth [day-of-week month year]
  (next-day-of-week day-of-week 1 year month 13))

(defn monteenth [month year]
  (first-teenth Calendar/MONDAY month year))
(defn tuesteenth [month year]
  (first-teenth Calendar/TUESDAY month year))
(defn wednesteenth [month year]
  (first-teenth Calendar/WEDNESDAY month year))
(defn thursteenth [month year]
  (first-teenth Calendar/THURSDAY month year))
(defn friteenth [month year]
  (first-teenth Calendar/FRIDAY month year))
(defn saturteenth [month year]
  (first-teenth Calendar/SATURDAY month year))
(defn sunteenth [month year]
  (first-teenth Calendar/SUNDAY month year))

(defn- first-day-of-week [day-of-week month year]
  (next-day-of-week day-of-week 1 year month 1))

(defn first-monday [month year]
  (first-day-of-week Calendar/MONDAY month year))
(defn first-tuesday [month year]
  (first-day-of-week Calendar/TUESDAY month year))
(defn first-wednesday [month year]
  (first-day-of-week Calendar/WEDNESDAY month year))
(defn first-thursday [month year]
  (first-day-of-week Calendar/THURSDAY month year))
(defn first-friday [month year]
  (first-day-of-week Calendar/FRIDAY month year))
(defn first-saturday [month year]
  (first-day-of-week Calendar/SATURDAY month year))
(defn first-sunday [month year]
  (first-day-of-week Calendar/SUNDAY month year))

(defn- second-day-of-week [day-of-week month year]
  (update-in (first-day-of-week day-of-week month year) [2] #(+ 7 %)))

(defn second-monday [month year]
  (second-day-of-week Calendar/MONDAY month year))
(defn second-tuesday [month year]
  (second-day-of-week Calendar/TUESDAY month year))
(defn second-wednesday [month year]
  (second-day-of-week Calendar/WEDNESDAY month year))
(defn second-thursday [month year]
  (second-day-of-week Calendar/THURSDAY month year))
(defn second-friday [month year]
  (second-day-of-week Calendar/FRIDAY month year))
(defn second-saturday [month year]
  (second-day-of-week Calendar/SATURDAY month year))
(defn second-sunday [month year]
  (second-day-of-week Calendar/SUNDAY month year))

(defn- third-day-of-week [day-of-week month year]
  (update-in (first-day-of-week day-of-week month year) [2] #(+ 14 %)))

(defn third-monday [month year]
  (third-day-of-week Calendar/MONDAY month year))
(defn third-tuesday [month year]
  (third-day-of-week Calendar/TUESDAY month year))
(defn third-wednesday [month year]
  (third-day-of-week Calendar/WEDNESDAY month year))
(defn third-thursday [month year]
  (third-day-of-week Calendar/THURSDAY month year))
(defn third-friday [month year]
  (third-day-of-week Calendar/FRIDAY month year))
(defn third-saturday [month year]
  (third-day-of-week Calendar/SATURDAY month year))
(defn third-sunday [month year]
  (third-day-of-week Calendar/SUNDAY month year))

(defn- fourth-day-of-week [day-of-week month year]
  (update-in (first-day-of-week day-of-week month year) [2] #(+ 21 %)))

(defn fourth-monday [month year]
  (fourth-day-of-week Calendar/MONDAY month year))
(defn fourth-tuesday [month year]
  (fourth-day-of-week Calendar/TUESDAY month year))
(defn fourth-wednesday [month year]
  (fourth-day-of-week Calendar/WEDNESDAY month year))
(defn fourth-thursday [month year]
  (fourth-day-of-week Calendar/THURSDAY month year))
(defn fourth-friday [month year]
  (fourth-day-of-week Calendar/FRIDAY month year))
(defn fourth-saturday [month year]
  (fourth-day-of-week Calendar/SATURDAY month year))
(defn fourth-sunday [month year]
  (fourth-day-of-week Calendar/SUNDAY month year))

(defn- last-day-of-week [day-of-week month year]
  (next-day-of-week day-of-week -1 year (inc month) 0))

(defn last-monday [month year]
  (last-day-of-week Calendar/MONDAY month year))
(defn last-tuesday [month year]
  (last-day-of-week Calendar/TUESDAY month year))
(defn last-wednesday [month year]
  (last-day-of-week Calendar/WEDNESDAY month year))
(defn last-thursday [month year]
  (last-day-of-week Calendar/THURSDAY month year))
(defn last-friday [month year]
  (last-day-of-week Calendar/FRIDAY month year))
(defn last-saturday [month year]
  (last-day-of-week Calendar/SATURDAY month year))
(defn last-sunday [month year]
  (last-day-of-week Calendar/SUNDAY month year))
