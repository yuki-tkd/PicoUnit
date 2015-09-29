#include "picounit.h"
#include "stdio.h"

void pu_test_add() {
  int r = 1+1;
  pu_test("ensure 1 + 1 isn't 2", "Error r != 2", r != 2);
  pu_test("ensure 1 + 1 isn't 3", "Error r == 3", r != 3);
}

int main() {
  pu_test_add();
  pu_show_result();

  return 0;
}
