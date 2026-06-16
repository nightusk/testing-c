(defsystem "testing-c"
  :class :package-inferred-system)

(defsystem "testing-c/test"
  :depends-on ("uiop"
               "testing-c/lisp/test")
  :serial t
  :perform (test-op (op c)
                    (uiop:symbol-call :testing-c/lisp/test :run-tests)))
