(ns school)

(defn add
  [db student grade_num]
  (update-in db [grade_num] (fnil conj []) student))

(defn grade
  [db grade_num]
  (get-in db [grade_num] []))

(defn- sort-students
  [students _]
  (vec (sort students)))

(defn sorted
  [db]
  (merge-with sort-students db db))
