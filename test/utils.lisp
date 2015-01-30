(in-package #:cl-project-euler-test)

(def-suite :utils)
(in-suite :utils)

(test range
  (and (is (equal (range 10) '(0 1 2 3 4 5 6 7 8 9)))
       (is (equal (range 10 :min 1) '(1 2 3 4 5 6 7 8 9)))
       (is (equal (range 10 :min 1 :step 2) '(1 3 5 7 9)))))
