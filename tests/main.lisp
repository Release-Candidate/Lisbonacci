(defpackage lisbonacci/tests/main
  (:use :cl
   :asdf
        :rove))
(in-package :lisbonacci/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :asdf)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
