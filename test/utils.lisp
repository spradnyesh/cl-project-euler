(in-package #:cl-project-euler-test)

(def-suite :utils)
(in-suite :utils)

(test range
  (and (is (equal (range 10) '(0 1 2 3 4 5 6 7 8 9)))
       (is (equal (range 10 :min 1) '(1 2 3 4 5 6 7 8 9)))
       (is (equal (range 10 :min 1 :step 2) '(1 3 5 7 9)))))

(test fib
  (is (= 8 (fib 5))))

(test is-prime?
  (and (is-true (is-prime? 5))
       (is-false (is-prime? 4))))

(test next-prime
  (and (is (= 2 (next-prime 1)))
       (is (= 3 (next-prime 2)))))

(test is-palindrome?
  (and (is-false (is-palindrome? 584))
       (is-true (is-palindrome? 585))))

(test base-10->k-string
  (is (equal "1001001001" (base-10->k-string 2 585))))

(test square
  (is (= 25 (square 5))))

(test digits
  (is (equal '(1 2 3)) (digits 123)))

(test splice
  (and (multiple-value-bind (status lst)
           (splice nil)
         (and (is (null status))
              (is (null lst))))
       (multiple-value-bind (status lst)
           (splice '(1 2 3) :from -1 :to 2)
         (and (is (null status))
              (is (equal lst '(1 2 3) ))))
       (multiple-value-bind (status lst)
           (splice '(1 2 3) :from 3 :to 2)
         (and (is (null status))
              (is (equal lst '(1 2 3) ))))
       (multiple-value-bind (status lst)
           (splice '(1 2 3) :from 0 :to 4)
         (and (is (null status))
              (is (equal lst '(1 2 3) ))))
       (is (equal '(1 2 3) (splice '(0 1 2 3 4) :from 1 :to 3)))))

(test partition
  (and (is (equal '((1 2) (2 3) (3 4) (4 5)) (partition '(1 2 3 4 5) 2)))
       (is (equal '((1 2) (3 4)) (partition '(1 2 3 4 5) 2 :step 2)))))
