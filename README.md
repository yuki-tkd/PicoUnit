# PicoUnit
PicoUnit is a micro library for running unit test in C.
This library is written in only 1 header file. 


# Usage

### Step1
you need to include the library.

```
#include "picounit.h"
```

### Step2
Write test code

```
//Example
int r = 1+1;
pu_test("ensure 1 + 1 is 2", "Error r != 2", r == 2);
```

### Step3
Call pu_show_result() function

```
pu_show_result()
```


