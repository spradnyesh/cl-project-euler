(in-package #:cl-project-euler-src)

(defun prob010 (n)
  (reduce #'+ (primes-below n)))
