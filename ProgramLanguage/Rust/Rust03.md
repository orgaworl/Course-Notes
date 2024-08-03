
### 07 迭代器
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
0..n   //[0,n)
0..=n  //[0,n]

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

### 08 结构体与枚举体

#### 结构体
**结构体**
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


##### **元组结构体**
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

##### **结构体方法**
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

- 可以使用**函数调用方法**和**方法调用方法**
##### **静态方法(结构体关联函数)**
- 参数无需`&self`, 不依赖实例执行
- 调用静态方法的唯一方式是使用**函数调用语法**

#### 枚举类

```rust

```

### 09 模块
**模块**将相关代码组织在一起，置于一个共同的命名空间下（即模块名）

#### 内联模块
```rust
//内联模块:模块声明和模块内容一起
mod ModName{
}
```

#### 模块树
- 模块可以嵌套，形成**树状结构**。树的根是**crate**本身，即包含所有其他模块的顶级模块。对于库，根模块通常是`src/lib.rs`（除非位置被自定义过）。
- 根模块也被称为**crate根**。
- 根模块可以有子模块，它们反过来也有自己的子模块，以此类推。

#### 模块分文件

在父模块里，用`mod`关键字声明子模块的存在。
`mod dog;`

模块声明在crate的根目录（如`src/lib.rs`或`src/main.rs`）
- `src/<module_name>.rs`
- `src/<module>/mod.rs`

模块是另一个模块的子模块，文件应命名为：
- `[..]/<parent_module>/<module>.rs`
- `[..]/<module>/mod.rs`


比如，如果是`animals`的子模块，那么`src/animals/dog.rs`或`src/dog/mod.rs`。

#### 项路径与访问
- 同一模块里的项可以直接访问

- 从不同模块访问实体,要用指向要访问实体的**路径**
	- 从当前crate根开始，比如 `crate::module_1::module_2::MyStruct`
	- 从父模块开始，比如 `super::my_function`
	- 从当前模块开始，比如 `sub_module::MyStruct`

- **使用use引入到作用域**
	- 使用 `*` 引入模块中所有项目

#### 可见性
Rust中，默认一切都是**私有的**, 私有实体只能在以下情况下被访问：
1. 定义它的同一个模块内部，或
2. 其子模块之一

**可见性修饰符**
你可以使用**可见性修饰符**来修改实体的默认可见性:
- `pub`：使实体**公开**，在定义模块之外也能访问，可能还允许其他crate访问。
- `pub(crate)`：在同一个**crate**内部公开实体，但不允许外部访问。
- `pub(super)`：在父模块中公开实体。
- `pub(in path::to::module)`：在指定的模块中公开实体。

```rust
pub struct{
	pub(crate)version:u32,
}

pub mod ticket {
    pub struct Ticket {
        title: String,
        description: String,
        status: String,
    }

    impl Ticket {
        pub fn new() {
        }
    }
}

```
### 10 泛型
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



### 11 作用域与内存管理
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

##### 引用(浅复制)
`let s2=&s1;`
当一个变量的值被引用时，变量本身不会被认定无效, 过程中未发生原值的复制
- 引用不会获得值的所有权。
- 引用只能租借（Borrow）值的所有权。
- 引用本身也是一个类型并具有一个值，这个值记录的是别的值所在的位置，但引用不具有所指值的所有权：

#### 函数调用中所有权变化

#### 借用
拥有一些不获取其所有权就能读取变量值的方法是可取的。否则编程将受到很大限制。在Rust中，这是通过**借用**来完成的。

每次你借用一个值时，都会得到它的**引用**。引用带有它们的权限标签

- 不可变引用(`&`)允许你读取值，但不允许修改它
- 可变引用(`&mut`)允许你读取并修改值

回到Rust所有权系统的目标：
- 数据在被读取时从不被修改
- 数据在被修改时从不被读取

为了确保这两点，Rust必须对引用引入一些限制：
- 你不能同时拥有对同一值的可变引用和不可变引用
- 你不能同时拥有对同一值的多个可变引用
- 所有者在值被借用期间不能修改值
- 只要有不可变引用，你可以拥有任意数量的不可变引用，只要没有可变引用

在某种程度上, 你可以将不可变引用视为值上的“只读”锁, 而可变引用则像是“读写”锁, 所有这些限制都由借用检查器在编译时强制执行。

#### 设置器
设置器方法允许用户更改`Ticket`的私有字段值，同时确保其不变性得到尊重（例如，你不能将`Ticket`的标题设置为空字符串）。

在Rust中有两种常见的设置器实现方式：
- 将`self`作为输入。

	```rust
	impl Ticket {
	    pub fn set_title(mut self, new_title: String) -> Self {
	        // 验证新标题 [...]
	        self.title = new_title;
	        self
	    }
	}
	let ticket = Ticket::new("标题".into(), "描述".into(), "待办".into());
	let ticket = ticket.set_title("新标题".into());
	let ticket = ticket
	    .set_title("新标题".into())
	    .set_description("新描述".into())
	    .set_status("进行中".into());
	```
- 将`&mut self`作为输入。

	```rust
	impl Ticket {
	    pub fn set_title(&mut self, new_title: String) {
	        self.title = new_title;
	    }
	}
	let mut ticket = Ticket::new(
			"标题".into(), "描述".into(), "待办".into());
	ticket.set_title("新标题".into());
	
	// 使用已修改的ticket
	
	```




---
### 12 错误处理

```rust
panic!("ErrorMessgae");
assert_eq!()
assert!()

```


---

### 13 I/O

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
