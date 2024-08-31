
### 07 迭代器
**特点**
- **惰性求值**：迭代器不会立即计算其元素，而是在需要时才计算，这使得迭代器可以用于处理无限序列。例如，当调用 map() 或 filter() 方法时，并不会立即对集合进行转换或过滤，而是返回一个新的迭代器，只有当真正需要获取数据时，才会对数据进行转换或过滤。
- **消费性**：在迭代器完成迭代后，它所迭代的集合将被消费，即集合的所有权被转移给迭代器，集合不能再被使用。
- **不可变访问**：迭代器默认以不可变方式访问其元素，这意味着在迭代过程中不能修改元素。
- **所有权**：迭代器可以处理拥有或借用的元素。当迭代器借用元素时，它不会取得元素的所有权。例如，iter() 方法返回的是一个借用迭代器，而 into_iter() 方法返回的是一个获取所有权的迭代器。

>直接访问可迭代对象可能会导致所有权的转移

#### 创建迭代器
```rust
let iter      = vec.iter();
let iter_mut  = vec.iter_mut();
let into_iter = vec.into_iter();

0..n   //[0,n)
0..=n  //[0,n]

use std::ops::{Range, RangeInclusive};
Range{ start:0,end:n};
RangeInclusive::new(0,n); //包含结束值

```


注意:
- `assert_eq!((1..=5), RangeInclusive::new(1, 5));`成立
- `assert_eq!((1..6), RangeInclusive::new(1, 5));`  不成立,两者类型不同不能直接比较


#### 迭代器方法

Rust 的迭代器提供了丰富的方法来处理集合中的元素，其中一些常见的方法包括：

- `map()`：对每个元素应用给定的转换函数。
- `filter()`：根据给定的条件过滤集合中的元素。
- `fold()`：对集合中的元素进行累积处理。
- `skip()`：跳过指定数量的元素。
- `take()`：获取指定数量的元素。
- `enumerate()`：为每个元素提供索引。

#### 迭代访问
```rust
for (i, v) in a.iter().enumerate() {
	println!("The {}th element is {}", i + 1, v);
}
```


---

### 08 结构体与枚举体

#### 结构体
**结构体**
当字段名与用以初始化的变量名相同时, 可省略为一个.
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


结构体更新:
基于一个结构体实例来构造另一个
```rust
let ori=Stru{};
let new=Stru{
	domain:val,
	name:val2,
	..ori
}

```

你可以在实例化一个结构体时将它**整体标记为可变的**，但是 Rust 不允许我们将结构体的某个字段专门指定为可变的.
```rust
let mut p = Person {
	name: String::from("sunface"),
	age:18,
};
p.age = 30;
```

调试输出
```rust
#[derive(Debug)]
struct varStruct{};
println("{:?}",varStruct);
```
##### **元组结构体**
拥有结构体名的元组
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
//
let Color(x,y,z)=black;
let Point(a,b) = origin;
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

#### 枚举类 enumerations

```rust
enum Status {
    ToDo,
    InProgress,
    Done,
}
```

创建枚举时，你可以使用显式的整数设定枚举成员的值
```rust
// C style
enum Number2 {
    Zero = 0.0,
    One = 1.0,
    Two = 2.0,
}
```



#####  模式匹配
######  match
`match`语句让你能把Rust值与一系列**模式**进行比较。你可以把它想象成类型级别的`if`。如果`status`是`已完成`变体，执行第一块代码；如果是`进行中`或`待办`变体，则执行第二块代码。

**完备性**
`match`是**完备的**。你必须处理所有枚举变体。如果你遗漏了某个变体，Rust会在**编译时**阻止你并报错。

```rust
let res = match var{
	val1=>res1,
	val2=>res2,
	val3 | val4 =>res3,
	_ => res_other,
}

match var{
	val=>{
		block1;
	},
}

```


```rust
enum Status {
    ToDo,
    InProgress,
    Done
}
impl Status {
    fn is_done(&self) -> bool {
        match self {
            Status::Done => true,
            // The `|` operator lets you match multiple patterns.
            Status::InProgress | Status::ToDo => false
        }
    }
}
```


######  matches!

1. 判断变量取值是否在范围内
	```rust
	match!(var,iter1 | iter2 | iter3 )
	```
2. 对比枚举类取值
	```rust
	enum MyEnum {
	    Foo,
	    Bar
	}
	let v = MyEnum::Foo;
	if matches!(e , MyEnum::Foo) {
		count += 1;
	}
	```


###### if-let & let-else

if-let
将变量中的值保存到参数中,再对该参数进行操作
```rust
// 普通
if let new = ori {
	
} else {
	
};

//结构体
if let StructType{} = ori { };

//元组
if let ()= ori { };

//枚举体
if let EnumType::EnumVal() = ori { };
if let EnumType::EnumVal{} = ori { };

```

实例
```rust
enum Shape {
    Circle { radius: f64 },
    Square { border: f64 },
    Rectangle { width: f64, height: f64 },
}
impl Shape {
    pub fn radius(&self) -> f64 {
        if let Shape::Circle { radius }= &self{
            *radius
        }
        else{
            panic!("");
        }
    }
}
```


let-else
```rust
impl Ticket {
    pub fn assigned_to(&self) -> &str {
        let Status::InProgress { assigned_to } = &self.status else {
            panic!("");
        };
        assigned_to
    }
}
```




###### match guard
是一个位于 match 分支模式之后的额外 if 条件，它能为分支模式提供更进一步的匹配条件
```rust
// 在匹配值后面添加条件
match num {
	Some(x) if x < split => assert!(x < split),
}
```


###### 枚举成员持有各类型的值
在每个变体**附加数据**
```rust
enum Status {
    ToDo,
    InProgress {
        assigned_to: String,
    },
    Done,
}
```

初始化
```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

fn main() {
    let msg1 = Message::Move{x:1,y:2};
    let msg2 = Message::Write(String::from("hello,world")); 
} 
```

###### 模式匹配获取成员中的值
访问变体数据需要使用**模式匹配**, 避免访问到不可用实例

```rust
// 一般数据
match status {
    Status::InProgress { assigned_to } => {
        println!("Assigned to: {}", assigned_to);
    },
}

enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

//结构体
match msg {
	Message::Move{x:a,y:b} => {
		assert_eq!(a, 1);
		assert_eq!(b, 3);
	},
}

//元组
match msg {
	Message::ChangeColor(r, g, b) => {
		assert_eq!(g, 255);
		assert_eq!(b, 0);
	},
}

```



###### 绑定
可将字段绑定到其他变量名
```rust
match status {
    Status::InProgress { assigned_to: person } => {
        println!("Assigned to: {}", person);
    },
    Status::ToDo | Status::Done => {
        println!("Done");
    }
}
```


##### 模式

###### 范围匹配
使用 `|` 可以匹配多个值, 而使用 `..=` 可以匹配一个闭区间的数值序列

###### `@`重新绑定范围匹配变量
`@` 操作符可以让我们将一个与模式相匹配的值绑定到新的变量上
```rust
match ori{
	StructType{var1:nvar1@( ), var2:nvar2@( )}=>{
	
	}
}
```

```rust
match p {
	Point { x, y: 0 }                         => {},
	Point { x: 0..=5, y: t@ (10 | 20 | 30) }  => {},
	Point { x, y }                            => {},
}
```

######  `..` 忽略部分匹配值
```rust
fn main() {
    let numbers = (2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048);
    match numbers {
        (first,..,last) => {},
    }
}
```


######  **通配符**
如果你不关心一个或多个变体，可以使用`_`模式作为通配符：
```rust
match status {
	Status::Done => true,
	_ => false 
}
```




##### Option枚举类
`Option`是Rust中表示**可空值**的类型。
```rust
enum Option<T> {
    Some(T),
    None,
}
```

用例
```rust

// 填空让 `println` 输出，同时添加一些代码不要让最后一行的 `panic` 执行到
fn main() {
    let five = Some(5);
    let six = plus_one(five);
    let none = plus_one(None);

    if let Some(n) = six {
        println!("{}", n)
    }else{
        panic!("不要让这行代码运行！");
    }  
} 
fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        None => None,
        Some(i) => Some(i + 1),
    }
}
```

### 10 泛型
**函数**
```rust
fn max<T,U>(array:&[T]) -> U {}
```

**方法**
```rust
struct Point<T, U> {
    x: T,
    y: U,
}
impl<T, U>Point<T,U> {
    fn mixup<P,Q>(self,poi:Point<P,Q>)->Point<T,Q>{
        Point{
            x:self.x,
            y:poi.y,
        }
    }
}
```

**结构体**
```rust
struct Point<T,U> { x:T,y:U}
struct SGen <T,U> (T,U);
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


**使用**
```rust
// 自动推断类型
let tmp=SGen(1,2);
let res:i32 = max(array);

// 手动指定类型
let tmp=SGen::<i32,i32>(1,2);
let res:i32 = max::<i32,i32>(array);
```

**实例**
```rust
fn sum< T:std::ops::Add<Output=T> >(x: T, y: T) -> T {
    x + y
}
```

#### Const 泛型-针对值的泛型

const 泛型参数只能使用以下形式的实参:
- 一个单独的 const 泛型参数.
- 一个字面量 (i.e. 整数, 布尔值或字符).
- 一个具体的 const 表达式, 表达式中不能包含任何 泛型参数.

```rust
fn foo<const N: usize>() {}

fn bar<T, const M: usize>() {
    foo::<M>(); // 1
    foo::<2021>(); // 2
    foo::<{20 * 100 + 20 * 10 + 1}>(); // 3
    let _: [u8; M]; // 1
}
```


```rust
struct Array<T, const N: usize> {
    data : [T; N],
}
fn print_array<T:std::fmt::Debug, const N: usize>(arr:[T;N]) {
    println!("{:?}", arr);
}
```
> 长度不同会导致类型不同： `Array<i32, 3>` 和 `Array<i32, 4>` 是不同的类型



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


```rust
// 错误: String 类型会发生所有权转移
let x = (1, 2, (), "hello".to_string());
let y = x;

// 正确: &str类型会发生直接复制(copy)
let x = (1, 2, (), "hello");
let y = x;
```


所有权转移可以带来可变性变化
```rust
fn main() {
    let s = String::from("hello, ");
    let mut s1 = s;
    s1.push_str("world")
}
```


#### 借用
拥有一些不获取其所有权就能读取变量值的方法是可取的。否则编程将受到很大限制。在Rust中，这是通过**借用**来完成的。

每次你借用一个值时，都会得到它的**引用**。引用带有它们的权限标签

- 不可变引用(`&`)允许你读取值，但不允许修改它
- 可变引用(`&mut`)允许你读取并修改值

回到Rust所有权系统的目标：
- 数据在被读取时从不被修改
- 数据在被修改时从不被读取
##### 数量限制
> [!IMPORTANT]
为了确保这两点，Rust必须对引用引入一些**限制**：
- 不能同时拥有对同一值的可变引用和不可变引用
- 不能同时拥有对同一值的多个可变引用
- 所有者在值被借用期间不能修改值
- 没有可变引用, 可拥有任意数量的不可变引用，

在某种程度上, 你可以将不可变引用视为值上的“只读”锁, 而可变引用则像是“读写”锁, 所有这些限制都由借用检查器在编译时强制执行。


```rust
fn main() {
    let mut s = String::from("hello, ");
    let r1 = &mut s;
    r1.push_str("world");
    let r2 = &mut s;
    r2.push_str("!");
    //println!("{}",r1); // 注释掉一行代码让它工作
}
```
>编译器判断r1的生命周期, 在其生命周期内只允许**一个可变引用**存在, 生命周期结束后可再次创建可变引用. (生命周期不是以一个完整函数体为界)


##### 可变性限制
要求: 
- 从不可变对象借用不可变
- 从可变对象借用可变/不可变
```rust
fn main() {
    let mut s = String::from("hello, ");
    borrow_object(&s);
    s.push_str("world");
}
fn borrow_object(s: &String) {
}
```


#### 引用
实质上是一个指针,保存地址,访问原数据需要用`*`

获取引用的方法:
- `&`
	包含两种(形参和实参)
	- 可变引用`&mut var`
	- 不可变引用`&var`
- `ref`
	在模式匹配中创建对某个值的引用
	```rust
	// 直接使用
	let ref refVar = var;
	
	// match 语句中
	match tuple {
	    (ref x, ref y, ref z) => { }
	};
	
	// 元组
	let (ref a,ref b)=(var1,var2);
	
	//结构体
	let Person { ref, ref age } = person;
	```




#### 部分move
变量中一部分的所有权被转移给其它变量, 而另一部分我们获取了它的引用, 原变量将无法再被使用, 但是它没有转移所有权的那一部分依然可以使用, 也就是之前被引用的那部分.
```rust
fn main() {
    #[derive(Debug)]
    struct Person {
        name: String,
        age: Box<u8>,
    }
    let person = Person {
        name: String::from("Alice"),
        age: Box::new(20),
    };

    // 解构式模式匹配
    // person.name 的所有权被转移给新的变量 `name`
    // `age` 变量是对person.age 的引用
    let Person { name, ref age } = person;
    println!("{}", age);
    println!("{}", name);
    //println!("{:?}", person); //error
    println!("{}", person.age);
}
```

```rust
fn main() {
   let t = (String::from("hello"), String::from("world"));
   let (ref s1, ref s2) = t;
   println!("{:?}, {:?}, {:?}", s1, s2, t); 
   // -> "hello", "world", ("hello", "world")
}
```

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

#### 不可恢复的错误
```rust
panic!("ErrorMessgae");
unimplemented!()
todo!()
assert_eq!()
assert!()
```

#### 可恢复的错误: Result 枚举类
```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```
有两个变体：
- `Ok(T)`：表示成功执行的操作，包含操作的输出`T`。
- `Err(E)`：表示失败的操作，包含发生的错误`E`。
`Ok`和`Err`都是泛型，允许你为成功和错误情况指定自己的类型。

##### 错误
>Rust中的可恢复错误**以值的形式表示**。它们只是一个类型的实例，像任何其他值一样被传递和操作。

>Rust通过`Result`强制你**在函数签名中编码失败的可能性**。如果一个函数可能失败（并且你想让调用者有机会处理错误），它必须返回一个`Result`。

```rust
// 仅凭签名，你就能知道这个函数可能会失败。
// 你还可以检查`ParseIntError`以了解可能出现的失败类型。
fn parse_int(s: &str) -> Result<i32, ParseIntError> {
    // ...
}
```


##### 错误处理: 解包
错误不能自动忽略,必须显式处理.
处理方式:
- 如果操作失败，则恐慌, 通常使用`unwrap`或`expect`方法完成。
    ```rust
    // 如果`parse_int`返回`Err`则恐慌。
	let number = parse_int("42").unwrap();
	// `expect`允许你指定自定义的恐慌信息。
	let number = parse_int("42").expect("解析整数失败");
	```
    
- 使用`match`表达式解构`Result`以显式处理错误情况。
    ```rust
	match parse_int("42") {
	    Ok(number) => println!("解析的数字: {}", number),
	    Err(err) => eprintln!("错误: {}", err),
	}
	```


##### 枚举错误类型Error

```rust
enum U32ParseError {
    NotANumber,
    TooLarge,
    Negative,
}
match s.parse_u32() {
    Ok(n) => n,
    Err(U32ParseError::Negative) => 0,
    Err(U32ParseError::TooLarge) => u32::MAX,
    Err(U32ParseError::NotANumber) => {
        panic!("Not a number: {}", s);
    }
}

```

##### 错误特性 Error trait
`Error`有两个超特性：`Debug`和`Display`。如果一个类型想要实现`Error`，它也必须实现`Debug`和`Display`。

```rust
// `Debug` 低级表示,可自动实现
pub trait Debug {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result<(), Error>;
}

// `Display` 手动实现,抽象表示
pub trait Display {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result<(), Error>;
}

```

#### 类型转换错误
定义:
```rust
pub trait TryFrom<T>: Sized {
    type Error;
    fn try_from(value: T) -> Result<Self, Self::Error>;
}
pub trait TryInto<T>: Sized {
    type Error;
    fn try_into(self) -> Result<T, Self::Error>;
}
```

两者关系与性质:
- `From` 和 `Into` 特性，这是 Rust 中用于**肯定不会出错**类型转换的习惯用法接口
- **可能出错**的类型转换：`TryFrom` 和 `TryInto`。
- `TryFrom` 和 `TryInto` 都定义在 `std::convert` 模块中，和 `From` 与 `Into` 一样。
- `From`/`Into` 与 `TryFrom`/`TryInto` 之间的主要区别在于后者返回一个 `Result` 类型。这允许转换失败，并返回错误而不是导致恐慌。




---

### 13 I/O

#### 输入输出
```rust
//格式化字符串输出,使用{}进行占位
println!("{}",varName);         //在输出的最后附加输出一个换行符
println!("{0}{1}{0}",var0,var1);//按序号访问变量
print!("{}",varName);
print!("{:?}",varName); //Debug

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
