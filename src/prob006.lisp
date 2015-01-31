(in-package #:cl-project-euler-src)

(defun prob006 (n)
  (let* ((numbers (range (1+ n) :min 1))
         (sum (reduce #'+ numbers)))
    (- (square sum)
       (reduce #'+ (mapcar #'square numbers)))))
