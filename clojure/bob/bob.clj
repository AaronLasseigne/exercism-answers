(ns bob)

(defn- silent?
  [message]
  (= message ""))

(defn- shout?
  [message]
  (= message (clojure.string/upper-case message)))

(defn- ask?
  [message]
  (= (last message) \?))

(defn response-for
  [message]
  (cond
    (silent? message) "Fine, be that way."
    (shout? message) "Woah, chill out!"
    (ask? message) "Sure."
    :else "Whatever."))
