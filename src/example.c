#include "picounit.h"
#include "stdio.h"

int add(int a, int b) {
  return a+b;
}

void pu_test_add() {
  int r;
  r = add(1,1);
  pu_test("ensure 1 + 1 is 2", "", r == 2);
  pu_test("ensure 1 + 1 isn't 3", "", r != 3);
  r = add(-1,1);
  pu_test("ensure -1 + 1 is 0", "", r == 1);  //This test will be failed
}

int main() {
  pu_test_add();
  pu_show_result();

  return 0;
}
