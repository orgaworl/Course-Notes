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
    mixed $value , // value：必选参数，常量的值
)
```

常量是全局的, 常量使用无需使用`$`.

## 2. 数据类型

### 一般

- String（字符串）

- Integer（整型）

- Float（浮点型）

- Boolean（布尔型）

- NULL（空值）
  
  NULL 值表示变量没有值,可以通过设置变量值为 NULL 来清空变量数据：

- Resource（资源类型）
  
  特殊变量，保存了到外部资源的一个引用

### Array（数组）

分类

- 数值数组: key为数字

- 关联数组: key自定义

- 多维数组

```php
// 声明
$cars=array("Volvo","BMW","Toyota");
$age=array("Peter"=>"35","Ben"=>"37","Joe"=>"43");
//访问
$obj[$ord]
age['Peter']="35";

//函数调用
count($arrayVar)
```

### Object（对象）

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

## 3. 运算符号

比较

- 松散比较：使用两个等号 == 比较，只比较值，不比较类型。
- 严格比较：用三个等号 === 比较，除了比较值，也比较类型。

字符串运算

```php
. //字符串连接符
echo $str1 . "" . $str2;
strlen($str)//字符串长度.
strpos($str,$subStr)//查找第一个匹配字符串位置 
```

算术运算

```php
~x //取反
```

逻辑运算

```php
and or xor && || !
```

数组运算

```php
+   // 集合合并
==  // 两数组具有相同键值对
=== //具有相同键值对且顺序类型相同
```

三元

```php
expr1?(expr2):(expr3)
```

## 4. 流程控制

```php
if(){}  elseif(){}  else{}

switch(expr){
    case val1:
        //block1;
        break;
    default:
        //block
}

while(){}
do{}while();
for(initVal;condition;append){}
foreach($array as $value){}

foreach($array as $key=>$valu){}
```

## 5. 函数

函数声明

```php
function funcName($para1)
{
    return $result;
}
```

变量函数

将一个变量名作为函数名来调用的函数. 同样可调用一个对象的方法.

```php
function func(){return 1;}
$funcName="func"
$funcName();
```

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

## 8. 类与对象

```php
class Site{
    var $var1;
    var $var2;

    function func1(){
    return $val;
    }
}
$item=new Site;
$item->func1();
```

## 9. 自带函数实现
