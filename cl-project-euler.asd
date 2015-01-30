;;;; cl-project-euler.asd

(asdf:defsystem #:cl-project-euler
  :serial t
  :description "project euler solved in common-lisp"
  :author "Pradnyesh Sawant <spradnyesh@gmail.com>"
  :license ""
  :depends-on (#:fiveam)
  :components ((:module "src"
                        :components ((:file "package")
                                     (:file "utils" :depends-on ("package"))
                                     (:file "prob01" :depends-on ("utils"))))
               (:module "test"
                        :components ((:file "package"))
                        :depends-on ("src"))))
