(defpackage :testing-c/lisp/test
  (:use cl)
  (:export #:run-tests))
(in-package :testing-c/lisp/test)

(sb-alien:load-shared-object "c/lib.so")

(sb-alien:define-alien-routine ("fibonacci" fibonacci) (sb-alien:unsigned 64)
  (n (sb-alien:unsigned 8)))

(defun run-tests ()
  (assert (= (fibonacci 5) 8)))
