---
tags:
  - cpp
  - code
date updated: 2024-09-27 20:42
---

以C++11为主.

## 类型推断

### auto

编译期推导出变量类型

### decltype

编译期推导出表达式类型

```cpp
const int &i = 1;
decltype(i) b = 2;
```

## using 定义别名

```cpp

// 一般类型
using vvi = std::vector<std::vector<int>>; // c++11

// 模板类型
template<class T>
using pairVec = vector<T,T>; 
pairVec<int> v; 
```

## 模板参数

### 默认参数模板

- 函数模板的默认模板参数: 默认模板参数无限制
	```cpp
	template <typename R=int, typename U>
	R func2(U val) {
	    return val;
	}
	```
- 类模板的默认模板参数: 默认模板参数必须从右往左定义
	```cpp
	template <typename T, typename U=int>
	class A {
	    T value;
	};
	```

### 变长参数模板

```cpp

template <typename T>
void func(const T& t){
    cout << t << '\n';
}

template <typename T, typename ... Args>
void func(const T& t, Args ... args){
    cout << t << ',';
    func(args...);
}

```

## 智能指针

自动释放new出来的内存，从而**避免内存泄漏**. 将分配的动态内存都交由有生命周期的对象来处理，在对象过期时让它的析构函数删除指向的内存.

1. C++98 提供了 auto_ptr 模板的解决方案
2. C++11 增加unique_ptr、shared_ptr 和weak_ptr

### auto_ptr

```cpp
#include < memory >  
auto_ptr<type> var(new type);

```

### std::shared_ptr

shared_ptr使用了引用计数，每一个shared_ptr的拷贝都指向相同的内存，每次拷贝都会触发引用计数+1，每次生命周期结束析构的时候引用计数-1，在最后一个shared_ptr析构的时候，内存才会释放。

- shared_ptr 支持复制、赋值以及移动

```cpp
auto smartPtr = std::make_shared<className>();
auto smartPtr = std::shared_ptr<int> ptr(
					new int,                 // 构造智能指针
					[](int *p){ delete p; }  // 自定义删除器
					);


className*nakePtr=smartPtr.get();  //获取裸指针

```

- 不能用一个裸指针初始化多个`shared_ptr`，会出现`double_free`
- 不能手动`delete`裸指针, 而是由程序自主控制
- 使用`make_share` 替代`new`
- 使用`shared_from_this()`返回this指针,而不是直接返回this指针

### std::weak_ptr

**循环引用问题**
循环引用导致内存永远不会被释放，造成内存泄漏

**weak_ptr**
weak_ptr是用来监视shared_ptr的生命周期，它不管理shared_ptr内部的指针，它的拷贝的析构都不会影响引用计数，纯粹是作为一个旁观者监视shared_ptr中管理的资源是否存在，可以用来返回this指针和解决循环引用问题。

### std::unique_ptr

std::unique_ptr是一个独占型的智能指针

- 不支持复制和赋值, 但是可以移动
- 不允许其它智能指针共享其内部指针
- 不允许unique_ptr的拷贝和赋值, 其拷贝构造函数为private
- 提供了移动构造函数，可以通过std::move将指针指向的对象交给另一个unique_ptr，转交之后自己就失去指针对象的所有权

```cpp
auto ptr = std::unique_ptr<A>(new A);
auto tptr = std::make_unique<A>(); // error, c++11不支持，c++14支持
std::unique_ptr<A> tem = ptr; // error
```

## 统一初始化

Syntax:

```cpp
typeName var{para,...};
```

### 内置类型

**显式指定类型时:**

```cpp
    int x_1 =1;     // = 初始化  
    int x_2(1);     // () 初始化  
    int x_3{1};     // {} 初始化  
    int x_4 = {1};  // {} 与 = 组合进行初始化  
    int x_5 = (1);  // 虽然正确，但极少使用  
    return 0;
```

**auto自动推断类型时:**

```cpp
auto x_4={1}; //type is std::initializer_list<int>
auto x_5=(1); //type is int

```

内置类型在不使用auto时, `{}`与`()`等价.

### 复杂类型

`{}`初始化类成员变量

```cpp
class classN{
public:
	classN()=default;
	int num{initVal}; //初始化 类成员变量
}
```

`{}`初始化类

```cpp
classN var{para,...};
```

### explicit

添加`explicit`关键字后, 构造函数必须要被显示调用

```cpp
class P{
public:
	P(int a, int b){...}
	explicit P(int a, int b, int c){...}
};

P x(77,5);    //OK
P y{77,5};    //OK
P z{77,5,42}; //OK
p v = {77,5}; //OK,(implicit type conversion allowed)
P w = {77,5,42};//Error,必须要显示调用该构造函数

void fp(const P&);
fp({47,11});    //OK
fp({47,11,3});  //Error
fp(P{47,11});   //OK
fp(P{47,11,3}); //OK

```

## 初始化列表(Initializer_list)

## 移动语义 (Move Semantics)

将临时存在、即将无效化的对象浅拷贝给新对象, 堆区内存由新对象管理.

### 左值/右值

- **左值（lvalue）** ：表达式结束后依然存在的持久对象.

- **右值（rvalue）** ：表达式结束后就不再存在的临时对象.

- **纯右值（Pure Rvalue）**：这是传统的右值，如临时对象或字面量。

- **将亡值（Xvalue）**：这是一种特殊的右值，它表示一个即将被移动的对象。在C++11中，移动语义允许资源（如动态内存）从将亡值转移到另一个对象，而不需要进行复制。

- **通用引用（Universal Reference）**：这是C++11中引入的模板参数类型，它可以是左值引用、右值引用或将亡值引用。

- **完美转发**：这是模板库中的一种技术，允许将参数完美地转发给另一个函数，保留它们的值类别（左值或右值）。

- 返回值优化RVO：将返回的对象构造在调用者栈帧上, 减少构造函数调用次数.

引用:

- 左值引用: `&`
- 右值引用: `&&`

### **移动构造函数**(vs 拷贝构造函数)

当一个对象是通过移动构造函数创建的，它将接受另一个对象的资源，而不是复制它们。
适合再利用临时值.

```cpp
//拷贝构造函数: 
classN::classN(classN& temp){
	// 深拷贝
}

//移动构造函数: 
classN::classN(classN&& temp){
	// 浅拷贝
    temp.poi = nullptr;    //将右值对象的指针置空,避免资源释放
}

```

### 移动赋值构造(vs赋值构造)

```cpp
// 赋值构造
classN& operator=(classN& var){}

//移动赋值构造
classN& operator=(classN&& var){}
```

### 左右值转换

- 强转右值 std::move
	- 适合将再不使用的左值转为右值, 移动赋值给其他对象.

## emplace

针对顺序容器(如vector、deque、list)，C++11引入**emplace_front、emplace和emplace_back**分别对应push_front、insert和push_back

**原理与对比**

- 调用insert时,会先创建一个临时对象，再将临时对象移动或拷贝到vector 中 (如果是拷贝的话，事后会自动销毁先前创建的这个临时元素).
- 而emplace函数在容器中直接构造元素, 省去了移动或者拷贝元素的过程.
- 插入rvalue, 节约了一次move构造; 当插入lvalue, 节约了一次copy构造.
- 优点: 避免产生不必要的临时变量，避免不必要的临时对象的产生

```cpp
.emplace();
.emplace_back();
.emplace_front();
```

### 变参模板

使得 emplace 可以接受任意参数，这样就可以适用于任意对象的构建。

```cpp
struct Bar
{
    Bar(int a) {}
    explicit Bar(int a, double b) {} ///< 必须显示调用
};

int main(void)
{
    vector<Bar> bv;
    bv.push_back(1);      ///< 隐式转换生成临时变量
    bv.push_back(Bar(1)); ///< 显示构造临时变量
    bv.emplace_back(1);   ///< 没有临时变量

    //bv.push_back({1, 2.0}); ///< 无法进行隐式转换
    bv.push_back(Bar(1, 2.0));///< 显示构造临时变量
    bv.emplace_back(1, 2.0);  ///< 没有临时变量

    return 0;
}
```

## lambda函数

```cpp
auto lamb=[<capture list>] (<parameter list>) -> retType{

}
lamb(<paraList>);

```

### Lambda表达式的优点

> lambda表达式在本质上和仿函数一样, 都是空类, 只占用1字节

Lambda表达式相比于普通函数和普通类，有以下几个优点：

- 简洁：省略函数名和类名，直接定义和使用，使得代码更加简洁和清晰.
- 灵活：可以捕获外部变量，可以作为函数参数，也可以作为函数返回值.
- 安全：Lambda表达式可以控制外部变量的访问方式，可以避免全局变量的定义，可以避免悬空指针和无效引用的产生，使得代码更加安全和稳定.

### 捕获方式

- **值捕获**:
	- 将变量的值拷贝到 Lambda 表达式中,
	- 捕获的变量在 Lambda 表达式定义时确定，不会随着外部变量的变化而变化。
	- 值捕获的变量默认不能在 Lambda 表达式中修改，除非使用 `mutable` 关键字。
		```cpp
		int x,y;
		auto lamb=[x,y]()->retType{};
		```

- **引用捕获**：
	- 将该变量的引用传递到 Lambda 表达式中。
	- 引用捕获的变量在 Lambda 表达式调用时才确定，会随着外部变量的变化而变化。
	- 引用捕获的变量可以在 Lambda 表达式中修改，但要注意生命周期的问题，避免悬空引用的出现。

		```cpp
		int x=0;
		auto lamb=[&x] (int y) ->retType {}; // 引用捕获 x
		```

- **隐式捕获**
	-  `=` / `&`，表示按 值/引用 捕获 Lambda 表达式中使用的所有外部变量.
	- 简化捕获列表的书写，避免过长或遗漏.
	- 隐式捕获可以和显式捕获混合使用，但不能和同类型的显式捕获一起使用.

		```cpp
		int x = 10;
		int y = 20;
		auto f = [=, &y] (int z) -> int { return x + y + z; }; 
		// 隐式按值捕获 x，显式按引用捕获 y
		```

- **初始化捕获** (init capture) C++14

	- 允许在捕获列表中使用初始化表达式，从而在捕获列表中创建并初始化一个新的变量，而不是捕获一个已存在的变量。
	- 这种方式可以使用 `auto` 关键字来推导类型，也可以显式指定类型。这种方式可以用来捕获只移动的变量，或者捕获 `this` 指针的值。

	```cpp
	[var=val,...]()->retType{};
	```

- 捕获`this`指针.
	```cpp
	class className{
	public:
		void function()
		{
			[*this,...]()->retType{};
		}
	}
	```

### 泛型lambda in C++14

```cpp
[](auto var1,auto var2,...)->retType{};

```

## 多线程

### std::thread

```cpp
thread threadObj=thread(funcName,para1,para2,...);

```

- `std::thread`对象不可复制，只具有移动属性
	- 当`push_back`接受的是左值时，底层对对象进行复制后添加进向量.
	- 当`push_back`接受的是右值时，底层调用`emplace_back`函数.
		```cpp
		// 可行的创建多线程方法:
		std::thread trd{do_some_work, idx};
		threadList.emplace_back(std::thread{do_some_work, idx});
		threadList.push_back(std::move(td));
		threadList.emplace_back(std::move(td));
		```
- 每个线程具有唯一的标志，即线程id
- 每个线程可以执行
	- 函数
	- lambda表达式

**类方法:**

```cpp
thread.join();
thread.get_id();
thread.joinable()
```

### 多线程问题

**饥饿**

**死锁**

**活锁**

### std::atomic  原子操作

```cpp
#include <atomic>
atomic_int num=val;

```

### std::mutex 信号量

`mutex`的方法

```cpp
#include <mutex>
mutex.lock()
mutex.unlock()
mutex.try_lock()
```

### std::async

async可以根据情况选择同步执行或创建新线程来异步执行，当然也可以手动选择。对于async的返回值操作也比thread更加方便。

```cpp
#include <future>


```

## 网络编程

## foreach

```cpp
for(typeName &var: iterObj)


```

---
