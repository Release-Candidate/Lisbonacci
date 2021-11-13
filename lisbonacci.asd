(defsystem "lisbonacci"
  :version "0.1.0"
  :author "Release-Candidate"
  :license "GPLv3"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "lisbonacci/tests"))))

(defsystem "lisbonacci/tests"
  :author "Release-Candidate"
  :license "GPLv3"
  :depends-on (""
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for Lisbonacci"
  :perform (test-op (op c) (symbol-call :rove :run c)))
