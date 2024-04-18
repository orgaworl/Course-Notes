---
tags:
  - 编程语言
  - 静态语言
  - 面向对象
  - 物理机运行
  - code
  - rust
---

---
## Intro



11

11

---

## Syntax

### 数据类型

- integer
  `isize,usize`

- float
  `f32,f64`

- bool
  `true,false`

- char

- 元组(,,)

- 数组[integer/char]:
  `let c: [i32; 5] = [1, 2, 3, 4, 5];`
  `let d = [3; 5];`

### 变量常量与作用域

- 常量
- 不可变变量
- 可变变量

```rust
let a = 123;      //"不可变变量"
let mut a = 123;   //可变变量
const a: i32 = 123;//常量 
```

---

### 运算符

```rust
= //赋值
```

### 函数与语句块

```rust
//函数
fn <funcN> (varN:varType,)->resType{
    ......
    return res;
}

//语句块
//最后一个步骤是表达式，此表达式的结果值是整个表达式块所代表的值
{
         ;
    value  
};
```

---

### 流程控制

```rust
//条件表达式必须是 bool 类型,block可以是函数体表达式
if condition {block1}
else if condition {block2}
else {block3}

while condition {block}

for i in iterObj {block}

loop {block} //无限循环
```

---

### 结构体

结构体

```rust
//define
struct Site {
    domain: String,
    name: String,
    nation: String,
    found: u32
}
//instantiate
let runoob = Site {
    domain: String::from("www.runoob.com"),
    name: String::from("RUNOOB"),
    nation: String::from("China"),
    found: 2013
};
```

元组

```rust
//define
struct Color(u8, u8, u8);
struct Point(f64, f64);.0);
//instant
let black = Color(0, 0, 0);
let origin = Point(0.0, 0
//access
black.0
black.1
```

---

### 枚举类

```rust
let a = [10, 20, 30, 40, 50];
a.iter();

0..5  //[0,4]
```

### 组织管理

---

### 错误处理

---

### I/O

```rust
//格式化字符串输出,使用{}进行占位
println!() //在输出的最后附加输出一个换行符
print!()
```
