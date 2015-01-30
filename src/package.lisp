;;;; package.lisp

(defpackage #:cl-project-euler-src
  (:use #:cl #:org.tfeb.hax.memoize)
  (:shadow cl:cdr cl:mapcar)
  (:export :range :fib :is-prime? next-prime
           :cdr :delay :force :repeat :mapcar :lazy-range :partial :str
           ;; prob001
           :merge-without-duplicates :multiples :sum-multiples-below :prob001
           ;; prob002
           :helper-002 :prob002
           ;; prob003
           :largest-prime-factor :largest-prime-factor-clj))
