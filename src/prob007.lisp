(in-package #:cl-project-euler-src)

(defun prob007 (n)
  (do ((i 1 (1+ i))
       (p 2 (next-prime p)))
      ((= i n) p)))
