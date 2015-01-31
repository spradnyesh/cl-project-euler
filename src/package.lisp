;;;; package.lisp

(defpackage #:cl-project-euler-src
  (:use #:cl #:org.tfeb.hax.memoize)
  (:shadow cl:cdr cl:mapcar)
  (:export :range :fib :is-prime? :next-prime :is-palindrome? :base-10->k-string :square
           :cdr :delay :force :repeat :mapcar :lazy-range :partial :str
           ;; prob001
           :merge-without-duplicates :multiples :sum-multiples-below :prob001
           ;; prob002
           :helper-002 :prob002
           ;; prob003
           :largest-prime-factor :largest-prime-factor-clj
           ;; prob036
           :palindrome-in-both? :dual-palindromes-less-than :prob036
           ;; prob004
           :prob004
           ;; prob005
           :prob005
           ;; prob006
           :prob006
           ;; prob007
           :prob007))
