#include "lib.h"

uint64_t fibonacci(uint8_t n) {
  static uint64_t calcurated[UINT8_MAX] = {
      [1] = 1,
  };
  if (n == 0) {
    return 0;
  }
  if (calcurated[n]) {
    return calcurated[n];
  }
  return calcurated[n] = fibonacci(n - 2) + fibonacci(n - 1);
}
