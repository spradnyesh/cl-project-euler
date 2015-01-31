(in-package #:cl-project-euler-test)

(test palindrome-in-both?
  (and (is-true (palindrome-in-both? 585))
       (is-false (palindrome-in-both? 584))))

(test dual-palindromes-less-than
  (is (equal '(0 1 3 5 7 9 33 99) (dual-palindromes-less-than 100))))

(test prob036
  (is (= 157 (prob036 100))))
