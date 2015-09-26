#include <stdio.h>
int tests_run;
int tests_err;

#define pu_test(name, error, test) do {                             \
  tests_run++;                                                  \
  if (!(test)){                                                 \
    printf("\n\x1b[31m# Failed test (%s) died in function %s()\n# at %s line %d \n# %s\n\n\x1b[39m", name, __func__, __FILE__, __LINE__, error); \
    tests_err++;                                                \
  } else{                                                       \
    printf("'%s' in function %s() at %s line %d .......... OK \n", name, __func__, __FILE__, __LINE__); \
  }                                                             \
} while (0)

#define pu_show_result() do {                                   \
  printf("\nTests run: %d, Succeeded %d, Failed %d\n", tests_run, tests_run-tests_err, tests_err);\
  if(tests_err == 0){                                           \
    printf("\x1b[32mAll tests passed\x1b[39m \n");          \
  }else{                                                        \
    printf("\x1b[31mFailed %d tests\x1b[39m \n", tests_err);    \
  }                                                             \
} while(0)

