(in-package #:cl-project-euler-src)

(defun helper-002 (n)
  (let ((fib (fib n)))
    (if (evenp fib)
        fib
        0)))

(defun prob002 (limit)
  (loop for i in (range 100000)
     while (< (fib i) limit)
     summing (helper-002 i)))
