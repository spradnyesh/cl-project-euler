(in-package #:cl-project-euler-test)

(test next-collatz
  (and (is (= 40 (next-collatz 13)))
       (is (= 20 (next-collatz 40)))))

(test collatz-seq
  (is (equal '(1 2 4 8 16 5 10 20 40 13) (collatz-seq 13))))

(test prob014
  (is (= 97 (prob014 100))))
