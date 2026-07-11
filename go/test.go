package test

// #cgo CFLAGS: -I../c
// #include "lib.c"
import "C"

func fibonacci(n C.uint8_t) C.uint64_t {
	return C.fibonacci(n)
}
