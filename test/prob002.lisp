(in-package #:cl-project-euler-test)

(def-suite :prob002)
(in-suite :prob002)

(test helper-002
  (and (is (= 8 (helper-002 5)))
       (is (= 0 (helper-002 6)))))

(test prob002
  (is (= 798 (prob002 1000))))
