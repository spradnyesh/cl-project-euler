(in-package #:cl-project-euler-src)

(defun is-pythagorean-triplet? (a b c)
  (and (< a b c)
       (= (square c) (+ (square a) (square b)))))

(defun triplet (n)
  (block outer
    (loop for a from 0 upto (- n 3)
       do (loop for b from 1 upto (- n 2)
             do (loop for c from 2 upto (1- n)
                     do (when (and (= n (+ a b c))
                                   (is-pythagorean-triplet? a b c))
                          (return-from outer (list a b c))))))))

(defun prob009 (n)
  (reduce #'* (triplet n)))
