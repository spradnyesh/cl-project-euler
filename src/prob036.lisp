(in-package #:cl-project-euler-src)

(defun palindrome-in-both? (n)
  (and (is-palindrome? (str n))
       (is-palindrome? (base-10->k-string 2 n))))

(defun dual-palindromes-less-than (n)
  (remove-if-not #'palindrome-in-both? (range n)))

(defun prob036 (n)
  (reduce #'+ (dual-palindromes-less-than n)))
