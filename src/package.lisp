;;;; package.lisp

(defpackage #:cl-project-euler-src
  (:use #:cl #:org.tfeb.hax.memoize #:split-sequence)
  (:shadow cl:cdr cl:mapcar)
  (:export :range :fib :is-prime? :next-prime :primes-below :is-palindrome?
           :base-10->k-string :square :digits :factors :splice :partition
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
           :prob007
           ;; prob008
           :n-1000 :prob008
           ;; prob009
           :is-pythagorean-triplet? :triplet :prob009
           ;; prob010
           :prob010
           ;; prob011
           :grid :get-cell :right :down :diag-left :diag-right :m-get-cell :prob011
           ;; prob012
           :triangle-number :prob012))
