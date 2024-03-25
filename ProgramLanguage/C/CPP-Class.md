
## 1.1 封装

### 1.1.1 文件拆分

-   class 的文件拆分
    -   .h
        -   `#pragma once  `
            `using namespace std;  `
            原文件删除函数的详细内容,加 ;  
            若存在嵌套,则加#include<被嵌套.h>
    -   .cpp
        -   `#include" .h"  `
            `#include<iostream> //若使用`  
            ​ 只写类成员函数具体实现,返回类型和函数名之间加作用域
    -   main
        -   `#include" .h"  `
        -   类中的静态常量在此赋值

### 1.1.2 封装

-   三大特性:封装、继承、多态
-   封装

    -   将属性和行为(函数表示)加以权限控制

    -   语法
        -   定义
            ```cpp
            class 类名
            {
            访问权限： //冒号
            ​属性 / 行为
            ​ };
            ```
        -   访问用 .
            -   `类名.属性/行为`
    -   成员

        -   属性(成员属性,成员变量)
        -   行为(成员函数,成员方法)

    -   访问权限
        -   public 公共权限
            -   类内可以访问 类外可以访问  

        -   protected 保护权限
            -   类内可以访问 类外不可以访问  

        -   private 私有权限
            -   类内可以访问 类外不可以访问  

    -   struct 和 class 的区别  
         默认的访问权限不同
        -   struct 默认 public
        -   class 默认 private  

    -   成员属性设置为私有
        -   可在类内写 public 的函数提供私有数据的接口  


-   类内声明+类外定义
    -   `void class_name : : func_01( ) { }  `
    -   `class_name : : class_name( ){ }`  
         构造函数
-   对象指针(一般 new)

## 1.2 初始化与清理

-   对象初始化和清理  
     编译器自动调用两函数，完成对象初始化和清理工作。
-   构造函数  
     创建对象时为对象的成 ​ 员属性赋值，构造函数由编译器自动调用，无须手动调用。

    -   类名(){}  
         构造函数，没有返回值也不写 void  
         构造函数可以有参数，因此可以发生重载  
         程序在调用对象时候会自动调用构造，无须手动调用,而且只会调用一次

    -   分类
        -   默认

        -   有参
            ```cpp
              person(1234){
              ​m_age=1234;
              ​}
            ```
        -   拷贝构造函数
            ```cpp
              person(const person&p){
              ​ m_age=p.m_age;
              ​}
            ```
            -   函数值传递中实参传给形参(不改变实参)
                ```cpp
                  //相当于Person p1 = p;
                  void doWork(Person p1) {}
                  ​
                  void test02() {
                  Person p; //无参构造函数
                  doWork(p);
                  }
                ```
            -   函数 return 局部对象(return 的不是原版,而是 copy)
                ```cpp
                Person doWork2()
                {
                Person p1; //默认
                cout << (int *)&p1 << endl;
                return p1; //拷贝
                }
                void test03()
                {
                Person p = doWork2();//拷贝
                }
                ```
    -   调用方式
        -   括号法
            -   调用默认构造函数  
                 `person p1;`
            -   调用有参构造函数  
                 `person p2(1234);`
            -   调用拷贝构造函数  
                 `person p3(p2);`
        -   显示法
            -   `person p4=person (1234); `
                =右边为匿名对象

            -   `person p5=person (p2);`

        -   隐式转换法
            -   person p6=10;
            -   person p6=p4;

    -   -   默认情况下，c++编译器至少给一个类添加 3 个函数

            -   1．默认构造函数(无参，函数体为空)

            -   2．默认析构函数(无参，函数体为空)

            -   3．默认拷贝构造函数，对属性进行值拷贝

        -   如果用户定义有参构造函数，c++不在提供默认无参构造，但是会提供默认拷贝构造  
             person p1; //错误

        -   如果用户定义拷贝构造函数，c++不会再提供其他构造函数  


    -   拷贝
        -   浅拷贝  
             无 new 时用
            -   浅拷贝： 将原对象或原数组的引用直接赋给新对象，新数组，新对象／数组只是原对象的一个引用  

        -   深拷贝：在堆区重新申请空间拷贝操作  
             不改变  
             ​ 用在有开辟在堆区属性时  
             ​ 否则析构 delete 重复清空,导致错误
            -   创建一个新的对象和数组，将原对象的各项属性的“值”（数组的所有元素）拷贝过来，是“值”而不是“引用”，新对象跟原对象不共享内存，修改新对象不会改到原对象
                ```cpp
                  Person(int age ,int height) {
                  ​ m_height = new int(height)
                  ​ }
                  ​public:
                  ​int* m_height;
                ```
    -   初始化列表
        -   `构造函数()：属性1(值1),属性2（值2）...  ​{ }`

-   析构函数  
     主要作用在于对象销毁前系统自动调用，执行一些清理工作。
    -   `~类名(){}`
        析构函数，没有返回值也不写 void  
         析构函数不可以有参数，因此不可以发生重载

    -   调用时机
        -   程序在对象销毁前会自动调用析构，无须手动调用,而且只会调用一次写  
             例如：delete 掉指向堆区声明类指针时
        -   在 main 中的,return 0 后调用  

        -   写在函数中的(栈上数据),函数执行完调用

---

## 1.3 静态成员/this 指针/友元

### 1.3.1 静态成员
-   静态成员
    -   静态成员变量
        -   特点
            -   该类所有对象公用此变量
            -   编译阶段分配内存至全局区
            -   必须在类内声明,类外设置初始值
                -   类外全局
                    -   `string gundam: : m_name="UNICORN";`
                -   类外局部
                    -   `unicorn.m_name="UNICORN";`
            -   无需创建具体对象即可访问  
        -   访问方式
            -   通过对象访问  
                 `g . m_name`
            -   通过类名访问  
                 `gundam::m_name`
        -   访问权限
            -   类外无法访问私有静态成员  
    -   静态成员函数
        -   特点
            -   该类所有对象公用此函数
            -   只能作用于静态成员函数
            -   无需创建具体对象即可使用  
        -   访问方式
            -   通过对象访问  
                 `g.func()`
            -   通过类名访问  
                 `gundam : : func ( )`
        -   在.h 中声明,在.cpp 中去掉 static 实现  


### 1.3.2 this 指针
-   this 指针  
     默认存在直接使用
    -   -   -   空指针调用成员函数
                ```cpp
                class Person {  
                    void ShowClassName() {cout << "Person 类!" << endl; }  
                    void ShowPerson()  
                    {  
                    if (this == NULL) {return; }  
                    cout << mAge << endl;  
                    }  
                    int mAge;  
                    };
                    void test01()  
                    {  
                    Person \* p = NULL;  
                    p->ShowClassName(); //空指针，可以调用成员函数  
                    p->ShowPerson(); //成员函数中用到了this指针,不可,需判断指针是否空  
                    }
					```
    -   解决名称冲突  
         `this->age=age;`  
         //在成员变量前加->区分成员变量与形参

    -   返回对象本身  
         `return\*this`

        -   可用于(链式编程)连续调用函数  
	        ```cpp
             Person& PersonAddPerson(Person p)  
             {  
             this->age += p.age;  
             return \*this;  
             }  
             Person p1(10);  
             Person p2(10);  
             ​p2.PersonAddPerson(p1).PersonAddPerson(p1).PersonAddPerson(p1);
			```
    -   常函数(const 修饰成员函数)  
         指针常量变为都不可修改
        -   特点
            -   成员函数()后加 const 后我们称为这个函数为常函数
            -   常函数内不可以修改成员属性
            -   成员属性声明时加关键字 mutable 后，在常函数中依然可以修改  

    -   常对象
        -   特点
            -   声明对象前加 const 称该对象为常对象
            -   成员属性不可改,前加 mutable 后可改
            -   常对象只能调用常函数(保证了所有数据不可改 exceptmutable)  

    -   实质
        -   指针常量  

    -   \***\*this 只能用在非静态成员内部\*\***  

---
### 1.3.3 友元

-   友元 friend  
     允许一个函数或类访问另一个类中私有成员
    -   全局函数作友元
        -   `friend void func(int);`  
    -   类作友元
        -   `friend class gundam; //写在被访问数据的类中`  
    -   别类成员函数作友元
        -   `friend gundam::void m_func();`

---
## 1.4 运算符重载


-   运算符重载  
     实现自定义类型的运算
    大部分返回值为引用是为了实现链式  
     ​ 编程,持续对一个数据进行操作
-   加法运算符
    -   通过成员函数重载
		``` cpp
           Person operator+(Person& p) //this 为前,传入为右  
            {  
            Person temp;  
            temp.m_A = this->m_A + p.m_A;  
            temp.m_B = this->m_B + p.m_B;  
            return temp;  
            }
            Person p3=p1+p2;
		```
    -   通过全局函数重载
        ```cpp
		    Person operator+(const Person& p1, const Person& p2) {  
            Person temp(0, 0);  
            temp.m_A = p1.m_A + p2.m_A;  
            temp.m_B = p1.m_B + p2.m_B;  
            return temp;  
            }
        ```
-   左移运算符<<
    -   不建议用成员函数重载
    -   通过全局函数重载
        -   //若返回类型位 void 则无法链式编程 
	        ```cpp
            ​ostream& operator<<(ostream& out, Person& p)  
            ​ {  
            out << "a:" << p.m_A << " b:" << p.m_B;  
            return out;  
            }  
            //引用特性使其可以不用 cout,而用其他名称如 out
			```
        -   若成员属性为私有则需 friend 在该类定义内  

-   前置递增
    -   成员函数
		```cpp
	        MyInteger& operator++() {
            m_Num++;  
            return \*this;  
            }
		```
    -   全局函数
        ```cpp
           money& operator++(money& m)  
            {  
            m.m_cash++;  
            return m;
            }
        ```
-   后置递增
    -   成员函数
		```cpp
            MyInteger operator++(int) {  
            ​ //占位运算符 //若仍返回引用则临时变量被清除后执行非法操作
            ​ MyInteger temp = \*this;  
            ​ //记录当前本身的值，然后让本身的值加 1，但是返回的是以前的值，达到先返回后++；
            ​ m_Num++;  
            return temp;  
            }
		```

    -   全局函数
	    ```cpp
            money operator++(money& m,int)  
            {  
            money temp = m;  
            m.m_cash++;  
            return temp;
            }
        ```

-   赋值运算符  

     是 class 中默认存在的 4 函数之一  
     class 中默认是浅拷贝赋值
    -   浅拷贝  
         赋值时 指针类的属性将所指地址复制并赋值

    -   深拷贝  
         赋值时 指针的解引用 在堆区开辟新数据 并将新数据的地址赋值
        -   成员函数
		    ```cpp
                money& operator=(money& m)  
                {  
                if (this->m_lease != NULL)  
                {  
                delete this->m_lease;  
                this->m_lease = NULL; //先清空  
                }  
                ​  
                if (m.m_lease!=NULL)  
                {  
                this->m_cash = m.m_cash;  
                this->m_lease = new double(*m.m_lease);  
                }  
                ​  
                return *this;
                }
			```
        -   全局函数  

-   关系运算符
    -   成员函数
		```cpp    
	        bool operator&&( money m)  
            ​{  
            ​ return m_cash&&m.m_cash;  
            ​}
		```
    -   全局函数
        ```cpp    
	        bool operator&&( money a,money b)  
            {  
            return a.m_cash&&b.m_cash;  
            }
        ```
-   函数调用运算符 () {}
    -   成员函数
		```cpp
            void operator()(string text)  
            {  
            cout << text << endl;
            }
		```
    -   全局函数

    -   调用
        -   `对象名(传入数据);`

        -   `类名( )(传入数据);`  

-   只能用成员函数重载
    -   =  ()  []  ->  

-   不能重载
    -   .     .\*     ::    sizeof    ?   :

---

## 2.1 继承

-   代码
    -   `class 子类名：继承方式 父类名 { }`  
         又称 派生类 和 基类
-   继承方式  
     默认 private  
     ​ 三种都继承父类中 private 但不可访问
    -   公共继承
        -   父类中可继承 权限不变  

    -   保护继承
        -   父类中可继承 变为 protected  

    -   私有继承
        -   父类中可继承 变为 private  
-   继承中对象属性
    -   父类所有非静态成员属性都会被子类继承  

-   cl /d1 reportSingleClassLayouttheonly 类名 cpp 文件名.cpp  

-   继承中构造与析构顺序
    -   构造父类
    -   构造子类
    -   析构子类
    -   析构父类  

-   访问同名成员  
     子类父类中有成员名相同  
     通过继承了父类的子类访问两者属性
    -   访问子类中同名成员：直接  
         `s.m_age`
    -   访问父类中同名成员：加作用域  
         `s . father : : m_age`
-   访问同名静态成员  
     子类父类中有静态成员名相同  
     通过继承了父类的子类访问两者属性
    -   通过对象访问
        -   同上  

    -   通过类名访问
        -   访问子类中同名成员：直接  
             `son : : m_age`
        -   访问父类中同名成员：加作用域  
             `son : : father : : m_age`
-   多继承
    -   `class 子类名: 继承方式 父类 1,继承方式 父类 2 { }`  
         又称 派生类 和 基类
-   菱形继承
    -   虚继承
        -   二级类继承+ virtual,两个同名数据合并为一份 （一级类称为虚基类）  
             `class father：virtual public grad {};`
             `class mother：virtual public grad {}`

---
## 3.1 多态

-   3 多态  
     一个接口多个状态
-   静态多态  
     ；编译阶段确定函数地址
    -   如：函数重载 运算符重载  

-   动态多态  
     ；运行阶段确定函数地址
    -   虚函数
        -   虚函数 `virtual void func ( ) { };`
            -   0 地址早绑定，调用父类函数
                -   （父类对象的指针或引用 执行子类对象）  
	                ```cpp    
                     void DoSpeak(Animal & animal)  
                     {  
                     animal.speak();  
                     }  
                     void test01()  
                     {  
                     Cat cat;  
                     DoSpeak(cat);  
                     ​}
					```  
            -   1 地址晚绑定，调用传入的类的函数  
                 需在父类调用函数前加 virtual  
                 如： `virtual void func(){ }`
                -   父类为虚函数则子类默认也为虚函数  

        -   纯虚函数 `virtual void func () =0;`  
             需声明不需实现  
             ​ 父类函数完全无用时用  
             且该父类成为抽象类

            -   抽象类特点
                -   无法实例化对象
                -   子类必须重写纯虚函数，否则也是抽象类  

        -   虚析构 `virtual~father ( ){ };`  
             解决父类指针 delete 时无法调用子类析构，导致无法清理子类堆区数据

        -   纯虚析构 `virtual~father ( )=0;` 类外：`father : :~father( ) { }`  
             需要声明也需要实现
            
    -   派生类  

-   条件
    -   有继承关系
    -   子类重写父类中函数
    -   父类对象的指针或引用 指向子类对象
        -   指针
		    ```cpp    
                father\*abc = new son_1;  
                abc->m_Num1 = 10;  
                abc->m_Num2 = 10;  
                cout << abc->m_Num1<< "+" <<abc->m_Num2 << "="<<abc->getResult();  
                delete abc;
	        ```    
        -   引用  

-   作用
    -   拓展功能
        -   父类作总，多个子类作分功能

---
