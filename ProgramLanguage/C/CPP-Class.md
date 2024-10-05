---
date created: 2024-09-26 17:09
date updated: 2024-09-26 18:22
title: CPP-Class
subtitle: 模板, 重载, 封装, 继承, 多态
layout: post
author: orgaworl
header-style: text
tags:
  - default-tag
---

## 1. 函数模板

- 函数模板\
	无法直接编译，因此无法分离写

```cpp
template<typename Tid>  
Tid funcN(Tid,Tid,Tid);

template<typename Tid>  
Tid funcN(Tid a，Tid b，Tid c)
{  
	return ret;
​}
```

- 调用时手动指定类型
	`cout<<func<int,int>(1,2,4);`

## 2. 类

- 对象内容分开存储
	- 空对象有 1 字节的大小
	- 非静态成员变量  "属于" 对象
	- 静态成员变量     "不属于"对象
	- 非静态成员函数 "不属于"对象
	- 静态成员函数     "不属于"对象

- 类外写成员函数
	- `retType classN :: funcN() { }`

> 流对象只能引用不可复制

## 3. 封装

C++面向对象的三大特性为：封装、继承、多态

### 文件拆分

- class 的文件拆分
	- `.h`
		- ` #pragma once   `
			` using namespace std;   `
			原文件删除函数的详细内容,加 ;\
			若存在嵌套,则加#include<被嵌套.h>
	- `.cpp`
		- ` #include" .h"   `
			`#include<iostream> //若使用`\
			​ 只写类成员函数具体实现,返回类型和函数名之间加作用域
	- `main`
		- ` #include" .h"   `
		- 类中的静态常量在此赋值

### 封装

- 封装: 将属性和行为(函数表示)加以权限控制
	- 成员
		- 属性(成员属性,成员变量)
		- 行为(成员函数,成员方法)
	- 访问权限
		- `public` 公共权限: 类内可以访问 类外可以访问

		- `protected` 保护权限: 类内可以访问 类外不可以访问

		- `private` 私有权限: 类内可以访问 类外不可以访问
	```cpp
	//定义:
	class classN
	{
	permission:
		​attribute;
		Behavior;
	​};

	classN.attribute;
	classN.Behavior;
	```

**注意点:**

- struct 和 class 的区别: 默认的访问权限不同, struct 默认 public, class 默认 private.
- 一般将成员属性设置为私有, 并在类内写 public 的函数提供私有数据的接口
- 类内声明+类外定义
	```cpp
	className :: className( ){ };
	retType className :: func_01( ) { };
	```

## 4. 初始化与清理

- 对象初始化和清理:  编译器自动调用两函数，完成对象初始化和清理工作。

- 默认情况下，c++编译器至少给一个类添加 3 个函数
	1．默认构造函数(无参，函数体为空)
	2．默认析构函数(无参，函数体为空)
	3．默认拷贝构造函数，对属性进行值拷贝

- 如果用户定义有参构造函数，c++不在提供默认无参构造，但是会提供默认拷贝构造.

- 如果用户定义拷贝构造函数，c++不会再提供其他构造函数.

### 构造函数

- 构造函数: 创建对象时为对象的成员属性赋值，构造函数由编译器自动调用，无须手动调用。
	- 构造函数没有返回值也不写 void
	- 构造函数可以有参数，因此可以发生重载
	- 程序在调用对象时候会自动调用构造，无须手动调用,而且只会调用一次

- 分类
	- 默认构造
		```cpp
		className(){
		}
		```
	- 有参构造
		```cpp
		  person(1234){
		  ​m_age=1234;
		  ​}
		```
	- 拷贝构造
		```cpp
		person(const person&p){
			​m_age=p.m_age;
		​}
		```

**调用方式**

- 括号法
	- 调用默认构造函数  `person p1;`
	- 调用有参构造函数  `person p2(1234);`
	- 调用拷贝构造函数  `person p3(p2);`

- 显式法
	- ` person p4=person (1234);  `   `=`右边为匿名对象
	- `person p5=person (p2);`

- 隐式转换法
	- `person p6=10;`
	- `person p6=p4;`

### 拷贝

- 浅拷贝： 将原对象或原数组的引用直接赋给新对象/新数组，新对象／数组只是原对象的一个引用

- 深拷贝：在堆区重新申请空间拷贝, 创建一个新的对象和数组，将原对象的各项属性的“值”（数组的所有元素）拷贝过来，是“值”而不是“引用”，新对象跟原对象不共享内存，修改新对象不会改到原对象
	```cpp
	Person{
	public:
	​   int* m_height;
	}
	Person(int age ,int height) {
	​  m_height = new int(height)
	​}
	```

**拷贝函数**

- 默认拷贝构造函数是浅拷贝, 简单地复制对象的每个成员变量的值
- 拷贝构造函数使用时机
	- 函数值传递中实参传递拷贝给形参, 不改变实参
	- 函数 return 局部对象时, return 的是 copy, 而不是原版

**拷贝赋值运算符**

- 默认的拷贝赋值运算符执行的是浅拷贝
- 使用时机:
	- 当对象通过赋值操作符进行复制

**移动语义**
资源转移操作，将一个对象的资源所有权从一个对象转移到另一个对象，而不是复制资源。移动语义通过移动构造函数和移动赋值运算符来实现。移动构造函数的声明形式为 `ClassName(ClassName&& other)`，移动赋值运算符的声明形式为 `ClassName& operator=(ClassName&& other)`，其中 `ClassName` 是类的名称，`other` 是右值引用。

### 初始化列表

功能:

- 指定基类构造函数
- 对类本身的数据成员进行初始化

当属性为类时, 自动调用构造函数为属性赋值, 根据不同传入参数自动选择不同构造函数.

- 要求所有属性都有构造函数(三种构造函数都可)
- 成员是按照他们在类中出现的顺序进行初始化的
- 因此最好按照成员定义的顺序进行初始化

```cpp
classN{
public:
	attr1;
	attr2;
	attr3;
	classN():attr1(val1),attr2(val2){
	
	}
}
```

### 析构函数

- 析构函数: 主要作用在于对象销毁前系统自动调用，执行一些清理工作。
	- 析构函数，没有返回值也不写 void
	- 析构函数不可以有参数，因此不可以发生重载
	- 调用时机
		- 程序在对象销毁前会自动调用析构，无须手动调用,而且只会调用一次
		- 在 main 函数return 0 后调用
		- 写在函数中的栈上数据, 在函数执行完调用
	```cpp
	~className(){
	}
	```

## 5. 静态成员/this 指针/友元

### 静态成员

- 静态成员变量
	- 特点
		- 该类所有对象公用此变量
		- 编译阶段分配内存至全局区
		- 必须在类内声明,类外设置初始值
		- 无需创建具体对象即可访问
	- 访问方式
		- 通过对象访问   `g . m_name`
		- 通过类名访问   `gundam::m_name`
	- 访问权限
		- 类外无法访问私有静态成员

- 静态成员函数
	- 特点
		- 该类所有对象公用此函数
		- 没有 this 指针, 只能访问静态变量, 无法访问对象的成员变量
		- 无需创建具体对象即可使用
	- 访问方式
		- 通过对象访问  `g.func()`
		- 通过类名访问  `gundam::func ( )`
	- 在.h 中声明,在.cpp 中实现去掉 static


```cpp
class classN{
public:
	static int num;
}
int classN::num=initVal; // 赋初值
int main(){
	classN::num++;
}
```
### this 指针

- this 指针  默认存在直接使用
	- this 指针只能用在非静态成员内部
	- 空指针可调用成员函数, 如需使用成员变量, 需要判断指针是否为空.
	- `this`指针解决名称冲突, 在成员变量前加->区分成员变量与形参
	- 返回对象本身  `return *this`, 可用于(链式编程)连续调用函数
		```cpp
		Person& PersonAddPerson(Person p)  
		{  
			this->age += p.age;
			return *this;
		}  
		Person p1(10);
		Person p2(10);
		​p2.PersonAddPerson(p1).PersonAddPerson(p1).PersonAddPerson(p1);
		```

### 常对象/ 常成员

- 常对象
	- 特点
		- 声明对象前加 const 称该对象为常对象
		- 成员属性不可改,前加 mutable 后可改
		- 常对象只能调用常函数(保证了所有数据不可改 exceptmutable)
	```cpp
	const classN var();
	```

- 常成员函数(const 修饰成员函数)\
	指针常量变为都不可修改
	- 特点
		- 常函数内不可以修改成员属性
		- 成员属性声明时加关键字 mutable 后，在常函数中依然可以修改
	```cpp
	classN{
	public:
		retType funcN()const{
		}
	}
	```

- 常数据成员
	- 常数据成员的值是不能改变的, 只能通过构造函数的参数初始化表对常数据成员进行初始化。
	```cpp
	classN{
	public:
		const type var;
	}
	```

### 友元

- 友元 friend:  允许一个函数或类访问另一个类中私有成员, 写在被访问数据的类中.`
	- 全局函数作友元        `friend void func(int);`
	- 类作友元                    `friend class gundam;`
	- 别类成员函数作友元  `friend gundam::void m_func();`

---

## 6. 运算符重载

- 运算符重载
	- 实现自定义类型的运算
	- 大部分返回值为引用是为了实现链式编程,持续对一个数据进行操作

**特殊运算符:**

- 只能用成员函数重载
	- `=  ()  []  ->`
- 不能重载
	- `.     .\*     ::    sizeof    ?   :`

### 重载实例

- **加法运算符+**
	- 通过成员函数重载
		```cpp
		Person operator+(Person& p) //this 为前,传入为右  
		 {  
			Person temp;  
			temp.m_A = this->m_A + p.m_A;
			temp.m_B = this->m_B + p.m_B;
			return temp;
		 }
		 Person p3=p1+p2;
		```

	- 通过全局函数重载
		```cpp
		Person operator+(const Person& p1, const Person& p2) {  
			Person temp(0, 0);
			temp.m_A = p1.m_A + p2.m_A;  
			temp.m_B = p1.m_B + p2.m_B;  
			return temp;  
		}
		```

- **左移运算符<<**

	- 不建议用成员函数重载
	- 通过全局函数重载
	- 若返回类型位 void 则无法链式编程

	```cpp
	​ostream& operator<<(ostream& out, Person& p)  
	​ {  
		out << "a:" << p.m_A << " b:" << p.m_B;  
		return out;  
	}  
	//引用特性使其可以不用 cout,而用其他名称如 out
	```

	- 若成员属性为私有则需 friend 在该类定义内

- **前置递增**
	- 成员函数
		```cpp
		MyInteger{
			MyInteger& operator++() {
				m_Num++;  
				return *this;
			}
		}
		```

	- 全局函数
		```cpp
		money& operator++(money& m){  
			m.m_cash++;  
			return m;
		}
		```

- **后置递增**
	- 成员函数

		```cpp
		MyInteger operator++(int) {  
		​ //占位运算符 //若仍返回引用则临时变量被清除后执行非法操作
			​MyInteger temp = *this;  
		​ //记录当前本身的值，然后让本身的值加 1，但是返回的是以前的值，达到先返回后++；
			​m_Num++;  
		return temp;  
		}
		```

	- 全局函数
		```cpp
		money operator++(money& m,int){  
			money temp = m;  
			m.m_cash++;  
			return temp;
		}
		```

- **赋值运算符**: 是 class 中默认存在的 4 函数之一 , class 中默认是浅拷贝赋值
	- 浅拷贝: 赋值时 指针类的属性将所指地址复制并赋值
	- 深拷贝: 赋值时 指针的解引用 在堆区开辟新数据 并将新数据的地址赋值
		- 成员函数
			```cpp
			money& operator=(money& m)  {  
				if (this->m_lease != NULL)  {  
					delete this->m_lease;  
					this->m_lease = NULL; //先清空  
				}
				if (m.m_lease!=NULL){  
					this->m_cash = m.m_cash;  
					this->m_lease = new double(*m.m_lease);  
				}  ​
				return *this;
			}
			```

- **关系运算符**
	- 成员函数
		```cpp
		bool operator&&( money m)  
		​{  
			return m_cash&&m.m_cash;  
		​}
		```
	- 全局函数
		```cpp
		bool operator&&( money a,money b)  
		{  
			return a.m_cash&&b.m_cash;  
		}
		```

- **函数调用运算符 () {}**
	- 成员函数
		```cpp
		void operator()(string text)  
		{  
			cout << text << endl;
		}
		```
	- 调用
		- `对象名(传入数据);`
		- `类名( )(传入数据);`

# 7. 继承

## 继承与继承内容

- 代码
	- `class 子类名：继承方式 父类名 { }`\
		又称 派生类 和 基类
- 继承方式
	三种方式都继承父类中 private成员(内存中存在),  但不可访问,  继承默认使用 private继承.
	- publlic继承:  继承父类中pub和pro, 权限不变
	- protect继承: 继承父类中pub和pro,均变为 protected
	- private继承:  继承父类中pub和pro, 均变为 private

一个派生类继承了所有的基类方法，但下列情况除外：

- 基类的构造函数、析构函数和拷贝构造函数.
- 基类的重载运算符.
- 基类的友元函数.

## 覆盖与隐藏(继承访问)

**基类与继承类的访问控制:**

| 访问   | public | protected | private |
| ---- | ------ | --------- | ------- |
| 同一个类 | yes    | yes       | yes     |
| 派生类  | yes    | yes       | no      |
| 外部的类 | yes    | no        | no      |

**访问父类与子类中同名成员**
当派生类中定义了与基类同名的成员函数时，基类的函数会被覆盖(Override), 除非在派生类中显式调用基类的函数

- 访问同名成员: 若子类父类中有成员名相同, 通过继承了父类的子类访问两者属性
	- 访问子类中同名成员：直接   `s.m_age`
	- 访问父类中同名成员：加作用域  `s.father :: m_age`
- 访问同名静态成员: 子类父类中有静态成员名相同, 通过继承了父类的子类访问两者属性
	- 通过对象访问
		- 同上
	- 通过类名访问
		- 访问子类中同名成员:  `son :: m_age`
		- 访问父类中同名成员:  `son :: father :: m_age` 加作用域

## 构造与析构

**继承中构造与析构顺序**
- 构造父类
- 构造子类
- 析构子类
- 析构父类


**子类初始化**
要用父类对象初始化子类对象, 不能直接对父类的成员进行
```cpp
class child:public parent{
	child(para,...):parent(para,...){
		
	};
}
```




## 多继承

一个类可以派生自多个类, 可以从多个基类继承数据和函数。：

```cpp
class deriveClass: public base1,protect base2,private base3{
}
```

## 虚基类与虚继承

**菱形继承问题**

- 多继承的多个基类间接具有**相同的基类**导致.
- 存在数据的二义性, **浪费内存空间**.
- 两份基类N，分别存在类A和类B中

**虚基类与虚继承**

- 作用是 在间接继承共同基类时只保留一份基类成员
- 虚基类并不是在声明基类时声明的，而是在声明派生类时，指定继承方式声明的。
- 虚继承是声明类时的一种继承方式，在继承属性前面添加virtual关键字。

```cpp
class N {};
//类A是类N的公用派生类, 类N是类A的虚基类
class A : virtual public N { };
//类B是类N的公用派生类, 类N是类B的虚基类
class B : virtual public N { };
class C : public A, public B{ };
```

**虚基类的初始化** 由最后的派生类中负责初始化, 因此最后的派生类要初始化:

- 直接基类
- 虚基类
- 自身成员

编译器只执行==最后的派生类==对虚基类的构造函数调用，而忽略其他派生类对虚基类的构造函数调用。从而避免对基类数据成员重复初始化。因此，虚基类只会构造一次

## 父类 <- 子类

直接把子类中的父类那一部分**直接拷贝过去，注：自定义类型需要拷贝构造**

# 8. 多态

### 静态与动态多态

**多态**按字面的意思就是多种形态。当类之间存在层次结构，并且类之间是通过继承关联时，就会用到多态。
C++ 多态意味着调用成员函数时，会根据调用函数的对象的类型来执行不同的函数。

**静态多态:编译阶段确定函数地址**

- 函数重载
- 运算符重载

**动态多态: 运行阶段确定函数地址**

### 虚函数

**虚函数**: 允许用基类的指针来调用子类的同名函数, 实现多态
`virtual void func ( ) { };`

**绑定(binding)**：编译器将源代码中的函数调用解释为执行特定的函数代码块被称为**函数名绑定(binding)**。

- 静态绑定(binding)：在编译期间就可以完成的函数名绑定。
- 动态绑定(binding)：在运行期间才可以完成的函数名绑定。
	- 地址早绑定，调用父类函数
		- （父类对象的指针或引用 执行子类对象）
			```cpp
			 void DoSpeak(Animal & animal){  
				 animal.speak();  
			 }
			 void test01(){  
				 Cat cat;  
				 DoSpeak(cat);  
			 ​}
			```
	- 地址晚绑定，调用传入的类的函数\
		需在父类调用函数前加 virtual\
		如： `virtual void func(){ }`
		- 父类为虚函数则子类默认也为虚函数

**纯虚函数**
`virtual void func () =0;`\
需声明不需实现, 父类函数完全无用时调用, 且该父类成为抽象类
- 抽象类特点
	- 无法实例化对象
	- 子类必须重写纯虚函数，否则也是抽象类

**虚析构**
`virtual~father ( ){ };`
- 当通过基类指针删除派生类对象时，会首先调用派生类的析构函数，然后再调用基类的析构函数。
- 如果不加virtual关键字，则会导致只调用基类的析构函数而不调用派生类的析构函数。
- 解决父类指针 delete 时无法调用子类析构，导致无法清理子类堆区数据

**纯虚析构**
`virtual ~father ( )=0;`
`father :: ~father( ) { }`  (类外实现)

- 需要声明也需要实现

### 多态条件与作用

**多态条件:**

- 有继承关系
- 子类重写父类中函数
- 父类对象的指针或引用 指向子类对象

父类指针指向子类对象:

```cpp
father*abc = new son_1;  
abc->m_Num1 = 10;  
abc->m_Num2 = 10;  
cout 
	<< abc->m_Num1<< "+" <<abc->m_Num2 
	<< "="<<abc->getResult();  
delete abc;
```

- 多态作用
	- 拓展功能
		- 父类作总，多个子类作分功能
		- 多个不同的类带有同一名称但实现不同的函数，函数的参数可以相同。

## References

[^1]:[C++ 教程 | 菜鸟教程 (runoob.com)](https://www.runoob.com/cplusplus/cpp-tutorial.html)
