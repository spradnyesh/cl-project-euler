(in-package #:cl-project-euler-src)

(defun largest-prime-factor (n)
  (do ((i (truncate (sqrt n)) (1- i)))
      ((or (= i 1) (and (zerop (rem n i))
                        (or (is-prime? i)
                            (is-prime? (/ n i)))))
       (apply #'max (remove-if-not #'is-prime? (list i (/ n i)))))))

(defun largest-prime-factor-clj (n)
  (apply #'max (loop for i in (range (truncate (sqrt n)) :min 2)
                  when (and (zerop (rem n i)) (is-prime? i))
                  collecting i)))
