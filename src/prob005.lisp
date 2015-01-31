(in-package #:cl-project-euler-src)

(defun prob005 (n)
  (apply #'lcm (range n :min 1)))
