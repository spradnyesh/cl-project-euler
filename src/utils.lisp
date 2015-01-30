(in-package #:cl-project-euler-src)

;; http://stackoverflow.com/a/13937652/4329629
(defun range (max &key (min 0) (step 1))
  (loop for n from min below max by step
       collect n))

(def-memoized-function fib (n)
  (if (<= n 1)
    1
    (+ (fib (1- n)) (fib (- n 2)))))

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
