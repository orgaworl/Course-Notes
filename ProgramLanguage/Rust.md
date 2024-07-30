---
tags:
  - 编程语言
  - 静态语言
  - 面向对象
  - 物理机运行
  - code
  - rust
---


## 语言特点

- 内存安全
- 高性能
- 强类型语言，但具有自动判断变量类型的能力
- 不允许精度有损失的自动数据类型转换

## 编译与依赖管理
### 编译
```shell
rustc runoob.rs
```

### 项目管理
自带cargo
```
cargo --help #查看 Cargo 的帮助信息。
cargo new <ProjectName> #创建新项目

cargo test   #运行当前项目的单元测试。
cargo build [--release]
cargo run   [--release]
cargo clean   #清理构建过程中生成的临时文件和目录
cargo check   #检查当前项目的语法和类型错误。
cargo update  #更新 Cargo.toml 中指定的依赖项到最新版本。
cargo publish #将 Rust 项目发布到 crates.io。


cargo clippy #类似eslint，lint工具检查代码可以优化的地方
cargo fmt    #类似go fmt，代码格式化
cargo tree   #查看第三方库的版本和依赖关系
cargo bench  #运行benchmark(基准测试,性能测试)
cargo udeps  #检查项目中未使用的依赖


```

### 组织管理

1. 访问路径
	- 相对路径 `self::`
	- 绝对路径 `crate::`
2. 访问权限
	- public `pub mod` `pub fn`
	- private (默认)
3. 引入当前作用域
	- `use crate::`





## 语法
### 数据类型
#### 基本数据结构

- integer
  `isize,usize`

- float
  `f32,f64`
	默认`f64`
- bool
  值为 `true,false`

- char
	4Byte大小，表示Unicode标量值

#### 复杂数据结构

- 元组 `(,,)`
	元组是用一对 ( ) 包括的一组数据，可以包含不同种类的数据：
	`let tup:(i32,i64,u8)=(500,6.4,1);`
	`let (x,y,z)=tup;`

- 数组`[,,]`:
  `let c: [i32; 5] = [1, 2, 3, 4, 5];`
  `let d = [val; repeatTime]; `
  `let val=d[0];`
- str

- String
```rust
let string=String::new();
let string=val.to_string();

.push_str(str);
.push(str);
.len(); // 字节长度
.chars().count(); //字符长度
let s3=s1+s2;

```
- Vec
	```rust
	let vector:Vec<type> = Vec::new();
	let vector           = Vec![1,2,4,8];
	.push(val);
	.append(Vec); //向量拼接
	.get(val);    //返回枚举类
	
	
	```

- HashMap
```rust
let mut map = HashMap::new();  
map.insert("color", "red");          //直接插入
map.insert("size", "10 m^2");
map.get("color").unwrap()
map.entry("color").or_insert("red"); //安全插入
```



**切片**
`let slice=&vec[0..n]`
`str` 和`String` 都支持切片操作

### 变量常量

- 常量
- 不可变变量
- 可变变量

```rust
let a = 123;       //不可变变量
let mut a = 123;   //可变变量
const a: i32 = 123;//常量 
```

常量与不可变变量的区别
- 变量的值可以"重新绑定"，但在"重新绑定"以前不能私自被改变
- 常量的值永远不可改变
#### 重影（Shadowing）
重影就是指变量的名称可以被重新使用的机制：

**重影与赋值的对比**
- 重影是指用同一个名字重新代表另一个变量实体，其类型、可变属性和值都可以变化。
- 可变变量赋值仅能发生值的变化

### 作用域与内存管理
#### 所有权
所有权有以下三条规则：
- Rust 中的每个值都有一个变量，称为其所有者。
- 一次只能有一个所有者。
- 当所有者不在程序运行范围时，该值将被删除。

##### 直接复制
- 所有整数类型，例如 i32 、 u32 、 i64 等。
- 布尔类型 bool，值为 true 或 false 。
- 所有浮点类型，f32 和 f64。
- 字符类型 char。
- 仅包含以上类型数据的元组（Tuples）。
##### 所有权转移
实际数据在堆中时，将对象赋值给另一个对象，会导致原对象失效

##### 克隆(深复制）
`let s2=s1.clone()`

##### 函数调用中所有权

##### 引用(浅复制)
`let s2=&s1;`
当一个变量的值被引用时，变量本身不会被认定无效, 过程中未发生原值的复制
- 引用不会获得值的所有权。
- 引用只能租借（Borrow）值的所有权。
- 引用本身也是一个类型并具有一个值，这个值记录的是别的值所在的位置，但引用不具有所指值的所有权：

### 运算符

```rust
= //赋值
```

### 函数与语句块

```rust
//函数
fn <funcName> (varName:varType,)->resType{
    ......
    return res;
}

//语句块
//最后一个步骤是表达式，此表达式的结果值是整个表达式块所代表的值
let res={
         ;
    value  
};
```

特点
- 定义位置无要求
- 函数参数必须声明类型
-  不支持自动返回值类型判断，未指定返回值类型则不允许返回值

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

### 迭代器
**特点**
- **惰性求值**：迭代器不会立即计算其元素，而是在需要时才计算，这使得迭代器可以用于处理无限序列。例如，当调用 map() 或 filter() 方法时，并不会立即对集合进行转换或过滤，而是返回一个新的迭代器，只有当真正需要获取数据时，才会对数据进行转换或过滤。
- **消费性**：在迭代器完成迭代后，它所迭代的集合将被消费，即集合的所有权被转移给迭代器，集合不能再被使用。
- **不可变访问**：迭代器默认以不可变方式访问其元素，这意味着在迭代过程中不能修改元素。
- **所有权**：迭代器可以处理拥有或借用的元素。当迭代器借用元素时，它不会取得元素的所有权。例如，iter() 方法返回的是一个借用迭代器，而 into_iter() 方法返回的是一个获取所有权的迭代器。

#### 创建迭代器
```
let iter      = vec.iter();
let iter_mut  = vec.iter_mut();
let into_iter = vec.into_iter();
0..5

```

#### 迭代器方法

Rust 的迭代器提供了丰富的方法来处理集合中的元素，其中一些常见的方法包括：

- `map()`：对每个元素应用给定的转换函数。
- `filter()`：根据给定的条件过滤集合中的元素。
- `fold()`：对集合中的元素进行累积处理。
- `skip()`：跳过指定数量的元素。
- `take()`：获取指定数量的元素。
- `enumerate()`：为每个元素提供索引。



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
结构体更新
```rust
let ori=Stru{};
let new=Stru{
	domain:val,
	name:val2,
	..ori
}

```


元组结构体
```rust
//define
struct Color(u8, u8, u8);
struct Point(f64, f64);
//instant
let black = Color(0, 0, 0);
let origin = Point(0.0, 0.0);
//access
black.0
black.1
```

**结构体所有权**
结构体必须掌握字段值所有权，因为结构体失效的时候会释放所有字段。

**输出结构体**
```rust
#[derive(Debug)]
println!("rect1 is {:?}", rect1);
println!("rect1 is {:#?}", rect1);
```

**结构体方法**
```rust
struct Rectangle {  
    width: u32,  
    height: u32,  
}  
  
impl Rectangle {  
    fn area(&self) -> u32 {  
        self.width * self.height  
    }  
    fn wider(&self, rect: &Rectangle) -> bool {  
        self.width > rect.width  
    }  
}
```

**结构体关联函数**
参数无需`&self`, 不依赖实例执行

---

### 枚举类

```rust
let a = [10, 20, 30, 40, 50];
a.iter();

0..5  //[0,4]
```



---
### 错误处理


### 泛型
**函数**
```rust
fn max<T>(array:&[T]) -> T {
}
```

**结构体**
```rust
struct Point<T> {
    x: T,
    y: T
}
```

**枚举类**
```rust
enum Option<T> {
    Some(T),
    None,
}

enum Result<T, E> {
    Ok(T),
    Err(E),
}
```


---

### I/O

#### 输入输出
```rust
//格式化字符串输出,使用{}进行占位
println!("{}",varName);         //在输出的最后附加输出一个换行符
println!("{0}{1}{0}",var0,var1);//按序号访问变量
print!("{}",varName);

use std::io::stdin;
stdin().read_line(&mut str_buf);


```
**转义字符**
- {{
- }}
- 其他字符通过 `\` 进行转义
#### 文件读写
```rust
use std::fs;

//一次性读取
let text = fs::read_to_string(path).unwrap();//文本文件
let content = fs::read(path).unwrap();       //二进制文件

// 一次性写入
fs.write(path,content).unwrap();

//文件流读取
let mut buffer = [0u8; 5];
let mut file = fs::File::open(path).unwrap();
file.read(&mut buffer).unwrap();
println!("{:?}", buffer);

// 文件流写入
use std::io::prelude::*;  
use std::fs::File;  
let mut file = File::create(path).unwrap();  
file.write(b"FROM RUST PROGRAM").unwrap();  


use std::io::prelude::*;  
use std::fs::OpenOptions;  
let mut file = OpenOptions::new().append(true).open(path)?;  
file.write(content)?;  



```

---

author email: orgaworl@outlook.com
