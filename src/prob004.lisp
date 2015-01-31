(in-package #:cl-project-euler-src)

(defun prob004 ()
  (block outer
    (loop for i from 999 downto 800
       do (loop for j from 999 downto 800
             do (when (is-palindrome? (* i j))
                  (return-from outer (* i j)))))))
