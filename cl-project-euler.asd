;;;; cl-project-euler.asd

(asdf:defsystem #:cl-project-euler
  :serial t
  :description "project euler solved in common-lisp"
  :author "Pradnyesh Sawant <spradnyesh@gmail.com>"
  :license ""
  :depends-on (#:fiveam #:memoize #:split-sequence)
  :components ((:module "src"
                        :components ((:file "package")
                                     (:file "utils" :depends-on ("package"))
                                     (:file "prob001" :depends-on ("utils"))
                                     (:file "prob002" :depends-on ("utils"))
                                     (:file "prob003" :depends-on ("utils"))
                                     (:file "prob004" :depends-on ("utils"))
                                     (:file "prob005" :depends-on ("utils"))
                                     (:file "prob006" :depends-on ("utils"))
                                     (:file "prob007" :depends-on ("utils"))
                                     (:file "prob008" :depends-on ("utils"))
                                     (:file "prob009" :depends-on ("utils"))
                                     (:file "prob010" :depends-on ("utils"))
                                     (:file "prob011" :depends-on ("utils"))
                                     (:file "prob036" :depends-on ("utils"))))
               (:module "test"
                        :components ((:file "package"))
                        :depends-on ("src"))))
