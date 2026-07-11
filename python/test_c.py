from cffi import FFI
import os
import unittest

ffi = FFI()
ffi.cdef("""
      uint64_t fibonacci(uint8_t n);
""")

clib = ffi.dlopen("c/lib.so")

class TestFibonacci(unittest.TestCase):
    def test_fibonacci(self):
        self.assertEqual(clib.fibonacci(6), 8)

