(in-package #:cl-project-euler-src)

(defun merge-without-duplicates (&rest lsts)
  (remove-duplicates (apply #'concatenate 'list lsts)))

(defun multiples (lst of)
  (remove-if-not #'(lambda (n) (= 0 (rem n of))) lst))

(defun sum-multiples-below (n args)
  (let ((numbers (range n)))
    (apply #'merge-without-duplicates (map 'list #'(lambda (n) (multiples numbers n)) args))))

(defun prob001 (n &rest args)
  (reduce #'+ (sum-multiples-below n args)))
