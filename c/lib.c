#include "lib.h"

uint64_t fibonacci(uint8_t n) {
  static uint64_t calcurated[UINT8_MAX] = {
      [0] = 1,
      [1] = 1,
  };
  if (calcurated[n]) {
    return calcurated[n];
  }
  return calcurated[n] = fibonacci(n - 2) + fibonacci(n - 1);
}
