## STL
[[CPP-STL-Algorithm]] and [[CPP-STL-Containers]]

## Lib

```cpp
//STL container
#include <vector>
#include <map>
#include <set>
#include <stack>
#include <queue>
#include <deque>
#include <string>
#include <pair>

#include <algorithm>>
#include <isotream>

#include <cstring> //strlen()、strcat()
#include <cstdlib> // min()、max()
#include <cstdio>  // scanf()、printf()
#include <cmath>   // log()、sin()、pow()

#include <string.h>
#include <stdlib.h>   
#include <stdio.h>
#include <math.h>

```

## 编译优化
```cpp
//解决爆栈，手动加栈，必须放在头文件之前
#pragma comment(linker,"/STACK:1024000000,1024000000")

#define INF 0x3F3F3F3F
memset(buf,0x3F,n);



```