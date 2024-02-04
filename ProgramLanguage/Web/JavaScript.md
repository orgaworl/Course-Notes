# JavaScript

```javascript
<script>
alert("我的第一个 JavaScript");
</script>
```

---

# Syntax

## 1. 数据类型

- numer
  
  只存在一种数字类型,可以通过科学计数法书写.

- string

- boolean
  
  true/false

- function

- symbol

- Date

- null

- undefined

- array
  
  ```javascript
  var cars=new Array();
  var cars=new Array("Saab","Volvo","BMW");
  var cars=["Saab","Volvo","BMW"];
  ```

- object
  
  对象由花括号分隔。在括号内部，对象的属性以名称和值对的形式 (name : value) 来定义。属性由逗号分隔：
  
  ```javascript
  //定义
  var person={
  firstname:"John", 
  lastname:"Doe", 
  id:5566};
  //寻址
  person.lastname;
  person["lastname"];
  ```

JS 使用动态类型,同一变量可用作不同的类型.

```javascript
typeof varN
```

**类型转换**

## 2. 变量与常量及变量作用域

```javascript
var varN=val;
var lastname="Doe",
age=30,
job="carpenter";
```

声明无值的变量,其值实际上是 undefined.

可以通过将变量的值设置为 null 来清空变量。

- 局部变量: 函数运行删除.

- 全局变量: 在页面关闭后删除.

## 3. 运算符号

- 数学运算
  
  字符串支持 + 拼接运算. 字符串+数字, 得到拼接字符串.

- 比较运算
  
  ```javascript
  ==  //值相等
  === //值和类型均相等
  !=
  !==
  ```

- 逻辑运算
  
  同C

- 位运算  

- 条件运算符
  
  `*variablename*=(*condition*)?*value1*:*value2*`

## 4. 流程控制

```javascript
// 1
if (condition){}

// 2
switch(n)
{
    case 1:
        执行代码块 1
        break;
    case 2:
        执行代码块 2
        break;
    default:
        与 case 1 和 case 2 不同时执行的代码
}
// 3
for (var i=0,len=cars.length; i<len; i++){}
for (; i<len; i++){ } //初值条件中可设多个值或者省略.
for (x in objectN){ } //循环遍历对象的属性


// 4
while( ){ }
do{ }while( );
```

支持break and continue.

## 5. 函数

```javascript
function functionname()
{
    return;
}
```

## 6. 文件与I/O

## 7. 复杂数据类型

## 面向对象

- 对象属性

- 对象方法
  
  ```javascript
  //创建
  methodName : function() {
      // code
  }
  //访问
  objectName.methodName()
  ```

## 错误处理
