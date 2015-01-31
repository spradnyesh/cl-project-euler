(in-package #:cl-project-euler-src)

(defun prob012 (n)
  (do ((i 1 (1+ i)))
      ((>= (length (factors (triangle-number i))) n) (triangle-number i))))
