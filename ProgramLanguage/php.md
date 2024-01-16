# PHP lan

---

## 1. 变量与常量

**变量**

- 无需声明自动创建, 使用时需要加$.

- 弱类型, 自动判断数据类型

```php

```

**常量**

```php
bool define (
    string $name , // name：必选参数，常量名称，即标志符。
    mixed $value , // value：必选参数，常量的
    [bool $case_insensitive = false ]
    //可选参数，如果设置为 TRUE，该常量则大小写不敏感，默认是大小写敏感的 
)
```

## 2. 数据类型

- String（字符串）

- Integer（整型）

- Float（浮点型）

- Boolean（布尔型）

- Array（数组）
  
  ```php
  $cars=array("Volvo","BMW","Toyota");
  ```

- Object（对象）
  
  ```php
  class Car
  {
    var $color;
    function __construct($color="green") {
      $this->color = $color;
    }
    function what_color() {
      return $this->color;
    }
  }
  ```

- NULL（空值）
  
  NULL 值表示变量没有值,可以通过设置变量值为 NULL 来清空变量数据：

- Resource（资源类型）
  
  特殊变量，保存了到外部资源的一个引用

## 3. 运算符号

比较

- 松散比较：使用两个等号 == 比较，只比较值，不比较类型。
- 严格比较：用三个等号 === 比较，除了比较值，也比较类型。

## 4. 流程控制

## 5. 函数

## 6. 变量作用域

作用域种类

- local
  
  在 PHP 函数内部声明的变量是局部变量，仅能在函数内部访问：

- global
  
  在所有函数外部定义的变量，拥有全局作用域.
  
  要在一个函数中访问一个全局变量，需要使用 global 关键字。
  
  ```php
  $x=5;
  $y=10;
  function myTest()
  {
      global $x,$y;
  }
  // PHP 将所有全局变量存储在一个名为 $GLOBALS[index] 的数组中
  // index 保存变量的名称。
  function myFunction()
  {
      $GLOBALS['y']=$GLOBALS['x']+$GLOBALS['y'];
  }
  ```

- static
  
  类似 C language 中static.
  
  每次调用函数时，函数的static局部变量将会保留着函数前一次被调用时的值. 

- parameter
  
  参数是通过调用代码将值传递给函数的局部变量.
  
  参数是在参数列表中声明的，作为函数声明的一部分.

## 7. 文件与I/O

输出

```php
echo "str1","str2","str3"; //可输出多个字符串
print "str"; //只输出一个字符串.
```

## 并发

## 项目管理

## 错误处理
