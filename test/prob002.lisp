(in-package #:cl-project-euler-test)

(test helper-002
  (and (is (= 8 (helper-002 5)))
       (is (= 0 (helper-002 6)))))

(test prob002
  (is (= 798 (prob002 1000))))
