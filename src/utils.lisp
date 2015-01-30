(in-package #:cl-project-euler-src)

;; http://stackoverflow.com/a/13937652/4329629
(defun range (max &key (min 0) (step 1))
  (loop for n from min below max by step
       collect n))
