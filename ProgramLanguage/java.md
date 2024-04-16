---
tags:
  - 静态语言
  - code
  - 面向对象
  - 编程语言
  - 虚拟机运行
  - java
---

---
## 1. 变量与常量

### 语法
```java
type identifier [ = value][, identifier [= value] ...] 
```

### 常量

```java
//在 Java 中使用 final 关键字来修饰常量，声明方式和变量类似
final type varN=val;
```


---
## 2. 数据类型

### 2.1 基本类型

- 数值
  
  byte, short, int, long, float, double

- boolean
  
  默认false.

- 字符
  
  单一的 16 位 Unicode 字符.
  
  最小值是 \u0000（十进制等效值为 0）；
  
  最大值是 \uffff（即为 65535）；

- 字符串
	`String`


  
  ### 自动类型转换
  
  ```shell
  低 ------------------------------------> 高
  byte,short,char —> int —> long —> float —> double
  ```

### 2.2 数据结构

#### 数组

```java
// 静态数组
int[]arr=new int[]{it1,it2,...};
//动态数组
int[]arr=new int[10]
```

---
## 3. 运算符号

1. 移位运算符
	```java
	<<     
	// 按位左移运算符。左操作数按位左移右操作数指定的位数。    
	>>     
	// 按位右移运算符。左操作数按位右移右操作数指定的位数。    
	>>>     
	// 按位右移补零操作符,移动得到的空位以零填充。    

	```

2. 条件运算符
	```java
	(expression) ? value if true : value if false
	```
3. 字符串运算

```java




```


---
## 4. 流程控制

```java
if,while,do-while,for,switch //同C

for(声明语句 : 表达式)
{
   //code
}
//声明语句:声明新的数组元素类型的局部变量.
//表达式  : 要访问的数组.

continue
break

```

switch 语句中的变量类型可以是： byte、short、int 或者 char。

---
## 5. 方法

```java
public class cls
{
    public static int func()
    {
    }
}
```

**参数传递机制**

- 浅拷贝传递

- 地址传递(引用)

**方法重载**
每个重载的方法都有独一无二的参数列表

**方法重写**
对`子类和父类`之间.
```java
class Fruit {
	public void eat(){
    System.out.printl('eat fruit');
  }
}
class Apple extends Fruit{
  @Override
  public void eat(){
    System.out.printl('eat apple');
  }
}
```

---
## 6. 变量作用域

- **局部变量（Local Variables）：** 定义在方法、构造方法或语句块中的变量，作用域只限于当前方法、构造方法或语句块中。局部变量必须在使用前声明，并且不能被访问修饰符修饰。

- **成员变量（Instance Variables）：** 定义在类中、方法之外的变量，作用域为整个类，可以被类中的任何方法、构造方法和语句块访问。成员变量可以被访问修饰符修饰。

- **静态变量(Class Variables)** 定义在类中、方法之外的变量，并且使用 `static` 关键字修饰，作用域为整个类，可以被类中的任何方法、构造方法和语句块访问，静态变量的值在程序运行期间只有一个副本。静态变量可以被访问修饰符修饰。

- **参数变量（Parameters）：** 方法定义时声明的变量，作为调用该方法时传递给方法的值。参数变量的作用域只限于方法内部。

---
## 7. 面向对象😄

### 语法

```java
public class cls
{
    int age;
    int cls(){
	    age=0;
    }

    public int getAge(){
	    return age;
    }
    
}
```

### 组成
- 构造函数
- 变量
- 成员函数



---
## 8. 修饰符 ⭐

定义类、方法或者变量，通常放在语句的最前端。

- 访问修饰符
	  - default (即默认，什么也不写）: 在同一包内可见，不使用任何修饰符。使用对象：类、接口、变量、方法。
	  - private : 在同一类内可见。使用对象：变量、方法。 注意：不能修饰类（外部类）
	  - public : 对所有类可见。使用对象：类、接口、变量、方法
	  - protected : 对同一包内的类和所有子类可见。使用对象：变量、方法。 注意：不能修饰类（外部类）。

- 非访问修饰符
	  - static 修饰符，用来修饰类方法和类变量。
	    - **静态变量：** static 关键字用来声明独立于对象的静态变量，无论一个类实例化多少对象，它的静态变量只有一份拷贝。 静态变量也被称为类变量。局部变量不能被声明为 static 变量。
	    - **静态方法：** static 关键字用来声明独立于对象的静态方法。静态方法不能使用类的非静态变量。静态方法从参数列表得到数据，然后计算这些数据。
	  - final 修饰符，用来修饰类、方法和变量.
		  - final 修饰的类不能够被继承，
		  - 修饰的方法不能被继承类重新定义，
		  - 修饰的变量为常量，是不可修改的。
	  - abstract 修饰符，用来创建抽象类和抽象方法。
	  - synchronized 和 volatile 修饰符，主要用于线程的编程。

---

## 9. ??