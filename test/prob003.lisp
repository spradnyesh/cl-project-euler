(in-package #:cl-project-euler-test)

(def-suite :prob003)
(in-suite :prob003)

(test largest-prime-factor
  (is (= 5 (largest-prime-factor 100))))

(test largest-prime-factor-clj
  (is (= 5 (largest-prime-factor-clj 100))))
