(in-package #:cl-project-euler-test)

(test merge-without-duplicates
  (is (equal '(1 2 3 4) (merge-without-duplicates '(1 1 2 2) '(2 2 3 3) '(3 3 4 4)))))

(test multiples
  (is (equal '(0 3 6 9) (multiples (range 10) 3))))

(test sum-multiples-below
  (is (equal '(3 6 9 0 5) (sum-multiples-below 10 '(3 5)))))

(test prob001
  (is (= 23 (prob001 10 3 5))))
