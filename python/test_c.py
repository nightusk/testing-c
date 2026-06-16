import ctypes
import os
import unittest

clib = ctypes.CDLL(os.path.abspath(os.path.join(os.path.dirname(__file__), "../c/lib.so")))
clib.fibonacci.argtypes = [ctypes.c_uint8]
clib.fibonacci.restype = ctypes.c_uint64

class TestFibonacci(unittest.TestCase):
    def test_fibonacci(self):
        self.assertEqual(clib.fibonacci(5), 8)

