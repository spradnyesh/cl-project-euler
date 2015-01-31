(in-package #:cl-project-euler-src)

;; http://stackoverflow.com/a/13937652/4329629
(defun range (max &key (min 0) (step 1))
  (loop for n from min below max by step
       collect n))

(def-memoized-function fib (n)
  (if (<= n 1)
    1
    (+ (fib (1- n)) (fib (- n 2)))))

(defun is-prime? (n)
  (cond ((< n 2) nil)
        ((= n 2) t)
        (t  (let ((f (first (last (loop for i in (range (1+ (sqrt n)) :min 2)
                                     until (zerop (rem n i))
                                     collecting i)))))
              (when f
                (= f (truncate (1+ (sqrt n)))))))))

(defun next-prime (n)
  (if (< n 2)
      2
      (do ((i (1+ n) (1+ i)))
          ((is-prime? i) i))))

(defun prime-factors (n)
  (loop for i in (range n :min 2)
       when (and (zerop (rem n i)) (is-prime? i))
       collecting i))

(defun is-palindrome? (n)
  (let ((str-n (str n)))
    (equal str-n (reverse str-n))))

(defun base-10->k-string (k n)
  (let ((*print-base* k))
    (format nil "~a" n)))

(defun square (n)
  (* n n))

(defun digitps (num)
  (do* ((n num (truncate (/ n 10)))
        (rslt (list (rem n 10)) (push (rem n 10) rslt)))
       ((< n 10) rslt)))

;; https://github.com/spradnyesh/cl-web-utils/blob/master/src/list.lisp
(defun splice (lst &key (from 0) (to (1- (length lst))))
  (if (and lst
           (>= from 0)
           (>= to from)
           (< to (length lst)))
      (let ((rslt nil))
        (dotimes (i (1+ (- to from)))
          (push (nth (+ from i) lst) rslt))
        (nreverse rslt))
      (values nil lst)))

;; http://clojuredocs.org/clojure.core/partition
;; TODO: "pad"
(defun partition (lst n &key (step 1) (pad nil))
  (let* ((len (length lst)))
    (loop for i = 0 then (+ i step)
         for j = n then (+ j step)
       while (<= j len)
       collecting (splice lst :from i :to (1- j)))) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; http://www.chadbraunduin.com/2011/07/common-lisp-currying.html

(defun partial (f &rest args)
  "currying function"
  (lambda (&rest more-args)
    (apply f (append args more-args))))

(defmethod to-string (arg) (string arg))
(defmethod to-string ((arg integer)) (write-to-string arg))

(setf (symbol-function 'concatenate-string)
      (partial 'concatenate 'string))

(defun str (&rest args)
  (apply 'concatenate-string (mapcar #'to-string args)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; http://www.chadbraunduin.com/2011/07/common-lisp-lazy-sequences.html

(defstruct thunk body)

(defun thunkp (arg)
  (eq (type-of arg) 'thunk))

(defmacro delay (expr)
  `(make-thunk
   :body (lambda () ,expr)))

(defun force (thunk)
  (if (thunkp thunk)
      (funcall (thunk-body thunk))
      thunk))

(defun cdr (cons)
  "cdr for lists, force cdr for thunks"
  (force (cl:cdr cons)))

(defun mapcar (f list &rest more-lists)
  "Apply FUNCTION to successive elements of LIST.
Return list of FUNCTION return values.
lists can be lazy"
  (cons (apply f
               (car list)
               (cl:mapcar 'car more-lists))
        (when (and (cdr list) (every #'identity more-lists))
          (apply 'mapcar
                 f
                 (cdr list)
                 (cl:mapcar 'cdr more-lists)))))

(defun repeat (arg)
  (cons arg
        (delay (repeat arg))))

(defun lazy-range (max &key (min 0) (step 1))
  (when (<= min max)
    (cons min
          (delay (lazy-range max :min (+ min step) :step step)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
