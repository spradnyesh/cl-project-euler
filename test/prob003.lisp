(in-package #:cl-project-euler-test)

(test largest-prime-factor
  (is (= 5 (largest-prime-factor 100))))

(test largest-prime-factor-clj
  (is (= 5 (largest-prime-factor-clj 100))))
