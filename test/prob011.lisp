(in-package #:cl-project-euler-test)

(test get-cell
  (and (is (= 1 (get-cell -1 -1)))
       (is (= 1 (get-cell 21 21)))
       (is (= 8 (get-cell 0 0)))))

(test right
  (is (equal '((0 0) (0 1) (0 2) (0 3)) (right 0 0))))

(test down
  (is (equal '((0 0) (1 0) (2 0) (3 0)) (down 0 0))))

(test diag-left
  (is (equal '((0 0) (1 -1) (2 -2) (3 -3)) (diag-left 0 0))))

(test diag-right
  (is (equal '((0 0) (1 1) (2 2) (3 3)) (diag-right 0 0))))

(test m-get-cell
  (is (equal (macroexpand-1 '(m-get-cell (right x y)))
             '(REDUCE #'*
               (CL-PROJECT-EULER-SRC:MAPCAR
                #'(LAMBDA (CL-PROJECT-EULER-SRC::A)
                    (APPLY #'GET-CELL CL-PROJECT-EULER-SRC::A))
                (RIGHT X Y))))))

(test prob011
  (is (= 70600674 (prob011))))
