(in-package #:cl-project-euler-test)

(test is-pythagorean-triplet?
  (and (is-true (is-pythagorean-triplet? 3 4 5))
       (is-false (is-pythagorean-triplet? 3 4 6))))

(test triplet
  (is (equal '(3 4 5) (triplet 12))))

(test prob009
  (is (= 60 (prob009 12))))
