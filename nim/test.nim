import unittest

proc fibonacci(n: uint8): uint64 {.importc, cdecl.}

test "fibonacci number":
  check fibonacci(5) == 8
