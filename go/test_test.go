package test

import "testing"

func TestFibonacciNumber(t *testing.T) {
	got := fibonacci(6)
	if got != 8 {
		t.Errorf("fibonacci(5) = %d; want 8", got)
	}
}
