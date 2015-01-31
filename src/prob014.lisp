(in-package #:cl-project-euler-src)

(defun next-collatz (n)
  (if (evenp n)
      (/ n 2)
      (1+ (* n 3))))

(defun collatz-seq (start)
  (do* ((s start (next-collatz s))
        (acc (list s) (push s acc)))
       ((= 1 s) acc)))

(defun prob014 (n)
  (first (last (do* ((i 2 (1+ i))
                     (tmp (collatz-seq i) (collatz-seq i))
                     (acc tmp (if (> (length tmp) (length acc))
                                  tmp
                                  acc)))
                    ((> i n) acc)))))
