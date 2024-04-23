---
tags:
  - code
  - cpp
---

## define

```cpp
#define flag1

#ifdef flag1
#endif

#typedef uint8_t type1

enum 枚举名{ 
     标识符[=整型常数], 
     标识符[=整型常数], 
... 
    标识符[=整型常数]
} 枚举变量;

```

---

## static and extern

### static
- 变量
	- global
		- 只有本文件能访问该变量(默认即为static)
	-  local
		- 程序开始时初始化
	- class
		- 可以通过`类名.方法名`直接访问.
- 函数
	- global
		- 文件外不能访问该函数
	- class.method
		- 可以通过`类名.方法名`直接访问.
### extern
- 变量
	- global
		- 文件外能访问
-  函数
	- global
		- 文件外能访问(默认)

---
## Const







---

author email: orgaworl@outlook.com