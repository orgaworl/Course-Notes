---
title: CPP-Basic
subtitle: 主要是C的内容
layout: post
author: orgaworl
header-style: text
tags:
  - code
  - cpp
  - 静态语言
  - 编译
  - 物理机运行
date updated: 2024-09-24 23:41
---

## 1. 变量与常量

### 变量/常量

- 变量
	- `数据类型 变量名=初始值`

- 常量
	- `const 数据类型 变量名=常量值`
	- `constexpr`

> 传统const的问题在于“双重语义”，既有“只读”的含义，又有“常量”（不可改变）的含义，而**constexpr严格定义了常量** 为不可改变。

**const for poiter**

```cpp
 int b = 1;
 //C++规定const在类前和类后是一样的。
 const int *a = &b; //该指针可以指向其它的变量但无法修改它们的值。
 int const *a = &b; //同上一行
 int* const a = &b; //无法指向别的地址。
 const int* const a = &b; //既不能指向其它变量的地址，也不能修改值。
```

**const for function**

```cpp
const int func(){};  //函数返回const int类型
int const func(){};  // 函数返回const int类型
void func() const{}; //通常是在类中，表示该函数不修改成员变量
```

**const for class**
类的const实例只能调用类的const成员函数.

```cpp
class A{
    public:
    void test1() const;
    void test2();
};
const A classA;
classA.test1();//正确
classA.test2();//错误
```

### 变量属性

#### 作用域

在 C++源代码中，一个标识符能被语句使用的区域范围称为此标识符的作用域。一个标识符只有在其作用域内才是“可见”的，在作用域以外不能访问.

- 分类
	- 局部作用域(块作用域):  局部作用域是指在函数、块或类内部定义的变量，其作用域仅限于定义它的代码块。
		- 局部变量 `loop/ main/ class/ struct/ if/ func`
		- 函数形参

	- 全局作用域: 全局作用域中的变量和函数在程序的任何地方都可见, 全局变量在所有函数和类中可访问.
		- `::varN`

	- 函数作用域

	- 类作用域: 在类内部定义的成员变量和成员函数具有类作用域, 它们在类的所有成员函数中可见.

	- 命名空间作用域`namespace`: 特定的块声明成“命名空间”，将标识符的作用域限制在块内
		```cpp
		nameapce ns
		{

		}
		```

	- 就近原则,跳出最近作用域后改变

#### 生存期

一个动态的概念，说明了标识符表示的数据对象存在的时间区间

- 影响因素：存储类别
	- 动态存储
		不自动初始化
	- 静态存储
		初始化只进行一次
		没有初始化其值，则系统自动赋值 0x0

### 宏定义

**1. 数据宏定义**

```cpp
#define LEN 1024
```

| 已有宏      | 含义                                      |
| -------- | --------------------------------------- |
| **LINE** | 这会在程序编译时包含当前行号。                         |
| **FILE** | 这会在程序编译时包含当前文件名。                        |
| **DATE** | 形式为 month/day/year 的字符串, 表示编译的日期。       |
| **TIME** | 形式为 hour:minute:second 的字符串, 表示程序被编译的时间 |

**2. 类型宏定义**

```cpp
typedef type alias

typedef struct LNode *LinkLink

typedef struct Sname {
    type1 var1;
    type2 var2;
}alias1,alias2;

struct Sname{
    type1 var1;
    type2 var2;
}instant1, instant2;

```

typedef struct 和 struct 的区别在于 -

- 使用时是否可以省去struct关键字(C), CPP不做区分
- typedef: 别名;  struct: 实例化;

实例

```cpp

typedef Node{
}Node,*LinkList;

struct Node{
};
typedef struct Node Node;
typedef struct Node *LinkList;

Node    *list;
LinkList list;

```

**3. 函数宏定义**

```cpp
#define DEBUG_ON

#ifdef DEBUF_ON
    #define PRINT_DEBUG(a) print("%d",a)
#else
    #define PRINT_DEBUG()
#endif
```

### 枚举

**枚举**

```cpp
enum 枚举名{
     标识符[=整型常数],
     标识符[=整型常数],
    ...
    标识符[=整型常数]
} 枚举变量;

```

### 联合体

- 声明
	```cpp
	union Data
	{
	    char a[4];
	    int b;
	};// 32bit,可通过a操控8bit
	```
- 性质
	- 空间占用: 内部最大成员的大小
	- 内部所有属性**共用一个空间**, 无内存对齐.
- 作用
	- 判断大小端

---

## 2. 数据类型

### 基本类型

- 整型  : 描述整数
	- short
	- int
	- long
	- longlong `long long z =42LL;`

- 无符号整型  : 首位不表正负,因而所表数字更多
	- unsigned int `unsigned int x = 42u;`
	- unsigned short
	- unsigned long
	- unsigned longlong

- 浮点型 : 描述小数
	- float `float abc=123f`
	- double

- 字符型  : 描述单个字母
	- char

- 字符串型  描述多个字母
	- string  `string abc ="aaa"`

- 布尔类型  : 表示真假
	- bool   `bool abc=true/false`
	- 输出字符true/false

- 空类型
	- void

### 转义字符

- 转义字符 特殊 ASCII 字符
	- `\n` 换行
	- `\\`  \
	- `\t` 水平制表 整齐输出
	- `\b` 退格
	- `\r` 回车
	- `\0` 空字符
	- `\'` 单引号
	- `\"` 双引号
	- `\ddd` 1~3 位八进制数所代表字符
	- `\xhh` 1~2 位十六进制数所代表字符
	- `\t`
	- `\x` 16 进制 charch = ‘\01a’
	- `\0` 8 进制
	- `\a` 发出报警音

### 类型转换

- 强制/显式类型转换explicit conversion
	- `(type)var` // C风格转换语句
	- `type(var)` //C++风格转换语句
	- 问题  : 目标类型表示范围小于原类型
		- 数值截断
		- 精度丢失

- 自动/隐式类型转换implicit conversion\
	赋值动作中，数据类型与变量类型不一致时自动发生
	- 隐式转换
		- 不同类型的算数运算中
			```cpp
			int m；doule n;  
			m+n; //先将m转为double再进行加法
			```
		- 不同类型的赋值运算中
			```cpp
			int m；doule n;  
			n=m; //先将m转为double再进行赋值
			```
	- 数字类型默认int和**double**, 类型转换发生于:
		1. 初始化与赋值：`int counter = 2.718; float f =2111222333;`
		2. 函数调用：传递参数与返回值
		3. 算术运算符求解：`7 / 2.718;`

- 示例
	- 整型to 浮点: 由于浮点数有效数字位数较少，转换可能导致精度降低
	- 浮点to 整型: 浮点数不超出整型表示的数据上限时截断；否则结果没有规律
	- 小整型vs 大整型: 只保留右边字节存储的数据
	- 尽量避免“大类型”向“小类型”的自动转换

- C++ 中四种强制类型转换
	- ``

### 数组

1. 存放相同类型数据元素
2. 由连续内存位置组成

- 一维数组: 一个数组中数据类型相同
	- 数组定义
		- `数据类型 数组名[数组长度]; //定义`
		- `数组名[数据编号]=123;    //赋值`
		- `数据类型 数组名[ ]={值 1,值 2,值 3,值 4};       //定义,数组长度自动填写`
		- `数据类型 数组名[数组长度]={值 1,值 2,值 3,值 4}; //定义`

- 二维数组
	- 数组定义
		- `数据类型 数组名 [行] [列] ; //定义`
		- `数据类型 数组名 [行] [列]=123 //赋值`
		- `数据类型 数组名 [行] [列]= { {1,2,3} , {4,5,6} }; //二维数组可视化`
		- `数据类型 数组名 [行] [列]={1,2,3,4,5,6};`
		- `数据类型 数组名 [ ] [列]={1,2,3,4,5,6}; //自动算出行数`

- 指针数组, 可用以实现:
	- 堆区二维数组
	- 堆区一维数组

### 指针

记录数据地址, 32bit: 4字节, 64bit: 8字节.

- 定义
	- `数据类型*指针变量名; 指针变量名=&变量名;`
		- `int * p;   p=&num1;`
	- `数据类型*指针变量名=&变量名;`
		- `int * p=&num1;`

- 使用: 通过解引用找到指针指向内存
	- `*指针变量名`

- 常见指针
	- 空指针指向地址0  , 指向的内存不可访问(0-255 为系统占用,不可访问)
		- `int \*p=NULL;`

	- 野指针
		- `int _ p=(int_)0x1100;`

	- const
		- const 修饰常量 : 指针常量\
			指针指向`(p)`不可改,指针指向的值`(*p)`可改.
			- `int * const p= &num1`
		- const 修饰指针 : 常量指针\
			指针指向`(p)`可改,指针指向的值`(*p)`不可改.
			- `const int *p= &num1`
		- 既修饰常量, 又修饰指针:
			指针指向`(p)`不可改,指针指向的值`(*p)`不可改
			- `const int * const p= &num1`

- 指针按指向分类
	- 堆区指针
		- new类       `p->`
		- new数组   `p[ ]`
		- new其他   `*p`
	- 栈区指针

---

### 引用

- 引用
	- 使多个变量指向同一块内存
	- 对数据的操控等效
	- 引用本质为指针常量

- 引用使用
	- `type &alias = ori;`

- 引用注意
	- 引用必须初始化(赋初值)
		- `int &c; //错误，引用必须初始化`
	- 引用在初始化后，(指向)不可以改变
		- `int &c = a; //一旦初始化后，就不可以更改`
		- `c = b; //这是赋值操作，不是更改引用`

- 引用作用
	- 引用作函数参数: 与地址传递功能相同, 让形参修饰实参
		```cpp
		void mySwap03(int& a, int& b)
		{
		    int temp = a;
		    a = b;
		    b = temp;
		}
		mySwap03(a, b);
		```

	- 引用做函数返回值: 不可返回局部变量的引用, 可返回静态变量(存放在全局区)
		- 返回全局变量
			```cpp
			int &func(){
			    return a;
			}
			int &a=func();
			```

		- 返回类的引用

			- 接受引用返回值的对象能修改该值
			- 接受引用返回值该使用引用

			```cpp
			student &func(student other){
			    if(1){return *this;}
			    else {return other;}
			​}
			student&ssss=s.func(1);
			```

	- 函数调用作左值
		- `func()=1000;`\
			函数返回值为引用时, 则为函数返回的引用赋值

- 常量引用: 修饰形参(指向和数值都不能改变), 可用以引用常量
	- 用在 man 中
		- `main: int&b=10; //错误`
		- `main: const int&b=10; //正确`

	- 用在函数中
		```cpp
		void showValue(const int& v) { }
		main:
		showValue(a);
		```

	- 成员函数中，前 const 无法修改 s1，后无法修改 this，返回值改为常引用
		```cpp
		const student&func（const student&s1）const
		{
		return *this；
		}
		```

### 函数指针

- 函数指针是指指向函数的指针.
- **回调函数**无非是对函数指针的应用，用函数指针来**调用一个函数**.
- **注册函数**则是将**函数指针**作为参数传进去，便于其它函数调用.

```cpp
int funcOri(tpye1 para1,type2 para2,...){
    return 0;
}
int main(){
    returnType (*funcPoi)(type1 para01,type2 para2,...); //指针参数类型
    funcPoi=funcOri;                              //指针指向函数
    funcPoi(var1,var2,...);                       //通过指针调用函数
}
```

使用`typedef`:

```cpp
typedef void (*fp)(void); 
fp b[] = {t1,t2,t3};
```

---

## 3. 运算符号

- 赋值运算符
	- `=` 赋值
	- `+=`
	- `-=`
	- `/=`
	- `*=`
	- `%=`
	- `^=`

- 比较运算符\
	cout 中加( )优先运算
	- `==` 等于
	- `!=` 不等于
	- `> /<` 大于/小于
	- `> =/<=`大于等于/小于等于

- 算数运算符

```cpp
*
/ 
%
var++;//返回值后自增
++var;//先自增再返回
```

- 逻辑运算符
	- `!` 非
	- `&&` 与
	- `||` 或
- 三目运算
	`condition ? val1 : val2`

---

## 4. 程序流程结构

- 顺序结构

- 选择结构

	- if 语句

		```cpp
		if(condition){block;}

		if(condition){block;}else{block;}

		if(condition1){block1}
		else if(condtion2){block2}
		else{blcok3}
		```

	- 三目运算符: 返回变量( #左值),可以继续赋值

		- `表达式 1?表达式 2:表达式 3;`

	- switch

		```cpp
		switch( ) {
		    case 1:
		    case 99: 
		    case 44:
		    default:
		}
		// case 中语句过长时用{}括起来
		```

- 循环结构

	- while

		```cpp
		while(condition){
		    block;
		}
		```
	- for

		```cpp
		for(initBlock;continueCondition;loopAdd){
		    block;
		}
		```
	- do while

		```cpp
		do {
		    block; 
		} while(condition);
		```

- 跳转语句

	- `break` 跳出选择或循环

		- switch 结构中
			- 终止 case 跳出 switch
		- 循环语句中
			- 跳出当前循环语句
		- 嵌套循环中
			- 跳出最近的内层循环语句

	- `continue` 在循环语句中跳过其后的执行语句

	- `goto` 跳转到标记处(极少使用)

		```cpp
		goto FLAG;
		//code
		FLAG:       //标记用冒号
		//code
		```

---

## 5. 函数

### 函数基础

- 函数
	- 定义

		```cpp
		returnType funcName(paraType paraVar,...){
		    block; 
		    return val;
		}
		```
	- 声明: 声明可以写多次,定义只有一次

		```cpp
		returnType funcName(paraType paraVar,...);
		```
	- 调用
		- `funcName(paraVar,...);`

### 参数传递

- 值传递(直接传递拷贝)

	- 值传递时,函数形参改变不影响实参
	- 函数内部数据不影响外部,仅通过输出(return)影响

- 地址传递

	- 传入数组

	- 传入指针

	- 引用传递

		- `returnType funcName(int &a,...)`

- 常见样式

	- 有返
	- 无返

### 进阶

- 函数默认参数(形参)
	- 返回值类型 函数名 （参数= 默认值){}
	- `retTyp funcN(para=defaultVal)`
	- 作用
		- 可以使调用函数时传入的参数少于所需参数
		- 未传数值使用默认值
	- 注意
		- 1.如果某个位置参数有默认值，那么从这个位置往后都要有默认值
		- 2. 函数声明和函数实现只能其中一个有默认参数

- 函数的占位参数

	- 占位参数也可以有默认参数

	```cpp
	void func(int a, int) {}
	int main{
	    func(10,10); //占位参数必须填补
	}
	```

	```cpp
	void func(int a, int=10) {}
	int main{
	    func(10);
	}
	```

- 函数重载

	- 满足条件

		- 函数名相同
		- 同一个作用域下
		- 函数名称相同
		- 函数参数类型不同/个数不同/顺序不同.
		- 函数的返回值不同不可函数重载,仍为同一函数
	- 注意事项

		- 引用作函数重载条件

			```cpp
			retType funcName(int&a){}
			int main{
			    (变量)
			}
			retType funcName(const int&a){}  
			​int main{
			    ​(常量) //例如 (10)
			}
			```

		- 函数重载与默认参数
			函数重载最好不写默认参数

			```cpp
			void func2(int a, int b = 10){  
			​cout << "func2(int a, int b = 10) 调用" << endl;}  
			void func2(int a){  
			​cout << "func2(int a) 调用" << endl;}  
			func2(10); //碰到默认参数产生歧义，需要避免
			```

### inline 函数内联

**避免相同函数重写多次的麻烦**，**减少了运行时间但是增加了空间开销**。

> 类内的成员函数，默认都为inline.

- inline使用限制
	inline 的使用是有所限制的，inline 只适合涵数体内代码简单的函数使用，不能包含复杂的结构控制语句例如 while、switch，并且不能内联函数本身不能是直接递归函数（即，自己内部还调用自己的函数）

- inline仅是一个对编译器的建议

- 建议 inline 函数的定义放在头文件中
	因为内联函数要在调用点展开，所以**编译器必须随处可见内联函数的定义**，要不然就成了非内联函数的调用了。所以，这要求每个调用了内联函数的文件都出现了该**内联函数的定义**。

- **声明跟定义要一致**：如果在每个文件里都实现一次该内联函数的话，那么，最好保证每个定义都是一样的，否则，将会引起未定义的行为。如果不是每个文件里的定义都一样，那么，编译器展开的是哪一个，那要看具体的编译器而定。所以，最好将**内联函数定义**放在**头文件**中。

- 类中的成员函数与inline
	**定义**在类中的**成员函数**默认都是**内联的**，如果在类定义时就在类内给出函数定义，那当然最好。如果在类中未给出成员函数定义，而又想内联该函数的话，那在类外要加上 inline，否则就认为不是内联的。

---

## 6. 结构体

即自定义数据类型

- 结构体

	- 定义
		- struct 结构体名{结构体成员列表};
			- `struct humans { int age; string sex; };`
	- 创建
		- 先定义再单独赋值
			- `struct humans hum1; hum1.age= 24 ; hum1.sex= "男" ;`
		- 定义时直接赋值
			- `struct humans hum1={24,"男"};`
		- 定义时创建
			- `struct humans { int age; string sex }hum3;`

- 结构体数组

	- 创建
		- struct 结构体名 数组名[ ]= { {12,"女" }, {16,"男"}, {99,"女"}, };

- 结构体指针: 访问结构体成员

	- `(*p).name`
	- `p->name`

- 结构体作函数参数

	- 值传递: 实参不变

		```cpp
		void printstudent(struct student xzy) {
		    cout<<xzy.name;
		};
		printstudent(xzy);
		```
	- 地址传递: 实参改变

		```cpp
		void printstudent(struct student *pxzy) {
		    cout<<pxzy->name;
		};
		printstudent(&xzy)
		```

- 结构体中 const 的使用\
	只读状态,防止错误.
	与地址传递结合,节省数据量,且值不变.(常量指针).

	```cpp
	void printstudent(const struct student *pxzy)
	​{
	  cout<<pxzy->name;
	​};
	​printstudent(&xzy)
	```

---

## 7. 限定符

### static

- 变量
	- global
		- 只有本文件能访问该变量(默认即为 static)
	- local
		- 程序开始时初始化
	- class. val
		- 可以通过 `类名::变量名` 直接访问,  实现多个不同的类实例之间的数据共享.
- 函数
	- global
		- 文件外不能访问该函数
	- class.method
		- 可以通过 `类名::方法名` 直接访问.

### extern

- 变量
	- global
		- 文件外能访问
- 函数
	- global function
		- 文件外能访问(默认)

---

## 8. 变量作用域

---

## 9. 文件与 I/O

### CPP

#### 输入输出

- 转化进制\
	标记使 cout 对所有整型变量都使用指定的方式输出（直到被下一个标记改变位置）,不仅限于标记之后的一个变量

	- 16 `cout<<hex<<var;`
	- 10`dec`
	- 8  `oct`

- 数据输入

	- `cin>>a;`
	- `cin.getline(str, len);`
	- `cin.get(char)`

- 数据输出

	- `cout.put(a);`
		a 为一个已定义字符或'a'

#### 读写文件

- 文件流

| 数据类型     | 描述                                          |
| -------- | ------------------------------------------- |
| ofstream | 该数据类型表示输出文件流，用于创建文件并向文件写入信息。                |
| ifstream | 该数据类型表示输入文件流，用于从文件读取信息。                     |
| fstream  | 该数据类型通常表示文件流，且同时具有 ofstream 和 ifstream 两种功能 |

- 流状态成员函数
	- `eof()`： 表示如果读文件到达文件末尾，返回true
	- `bad()`：如果在读写过程中出错，返回 true
	- `fail()`：读写过程出错或格式错误时返回true

- 打开文件

	```cpp
	fstream ofm("fileName", ios::mode1 | ios::mode2);
	fs.open("fileName", ios::mode1 | ios::mode2);
	```

| 模式标志        | 描述                                   |
| ----------- | ------------------------------------ |
| ios::app    | 每次写操作定位到文件末尾。                        |
| ios::ate    | 文件打开后定位到文件末尾。                        |
| ios::in     | 打开文件用于读取。                            |
| ios::out    | 打开文件用于写入。                            |
| ios::trunc  | 如果该文件已经存在，其内容将在打开文件之前被截断，即把文件长度设为 0。 |
| Ios::binary | 二进制                                  |

- 写文件

	```cpp
	outfile << data << endl;
	```
- 读文件

	```cpp
	infile >> data;
	getline(infile,tmpStr);
	```
- 关闭文件

	```cpp
	fs.close()
	```

**示例**

```cpp
    // 写
    fstream obj;
    obj.open("./test.txt", ios::app);
    for (auto i = 0; i < 3; i++)
    {
        obj << str << endl;
    }
    obj.close();

    // 读
    fstream obj2;
    obj2.open("./test.txt", ios::in);
    while (obj2 >> str)
    {

        cout << str<<endl;
    }
    obj2.close();
```

### C

- 流
	- 输入流
	- 输出流
	- 文件流

#### 输入输出

以两输出

```cpp
char tmp = 0xFF;
printf("%02X ",(int)(unsigned char)tmp);
```

```cpp
// in
scanf();//格式化读取
gets();//读取一行
fget();//从指定流读取一行
fgetc();
getc();
getchar();

// out
printf();
print();
puts();
fputs();
putc();
fputc();
putchar();

//
fflush()
```

#### 文件读写

```cpp
// 文件的打开  
    fopen()   // 打开文件

// 文件的关闭  
    fclose()  // 关闭文件

// 文件的读写
    fgetc()   // 读取一个字符  
    fputc()   // 写入一个字符  
    fgets()   // 读取一个字符串  
    fputs()   // 写入一个字符串  
    fprintf() // 写入格式化数据  
    fscanf()  // 格式化读取数据  
    fread()   // 读取数据  
    fwrite()  // 写入数据

// 文件状态检查
    feof()    // 文件是否结束  
    ferror()  // 文件读/写是否出错  
    clearerr()// 清除文件错误标志  
    ftell()   // 文件指针的当前位置

// 文件指针定位
    rewind() // 把文件指针移到开始处  
    fseek()  // 重定位文件指针
```

#### 字符串操作

- code

```cpp
strcmp(str1,str2){
	return 0 if same
	return -1 if notsame
}
```

```cpp
strcpy(char* dst,char*src);
strncpy(char*dst,char*src,int copyCharNum);
strcat(char*ori,char*append);
char*p = strstr(char* str,char* substr);
strlen();
```

## 10. 项目管理

- 分文件编写
	- .h 头文件中写声明
		```cpp
		#include
		using namespace std;
		```

	- .cpp 源文件中写函数定义
		```cpp
		#include"头文件模板.h"
		//以下写函数定义
		```

## . 其他

### 随机数生成

```cpp
#include<ctime> 
srand((unsigned int)time(null));
```

### 内存占用

- 内存大小 `sizeof()`

### 系统

- SYSTEM
	- ` system ("pause");  `
	- ` system("cls");   `

---

## Reference
