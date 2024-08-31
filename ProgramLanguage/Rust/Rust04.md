### 方法
参数以`self`变体作为开始, 方法通过 `.` 进行调用.
```rust
impl StrutType{
	// `&self` 是 `self: &Self` 的语法糖
	fn <methodName>(&     self)->ResType{}
	fn <methodName>(& mut self)->ResType{}
	fn <methodName>(      self)->ResType{}
	// self 会带走当前结构体实例(调用对象)的所有权
}
```

- 只有**可变类型**的结构体变量能使用参数为`&mut self` 的方法
### 关联函数:
参数不含`self`变体, 关联函数通过 `::` 进行调用.
```rust
fn new()->Self {}
fn origin()->Self {}

```



关联函数与方法最大的区别就是它第一个参数不是 `self` ，原因是它们不需要使用当前的实例.
### 特性 Trait
特性是Rust定义**接口**的方式. 特性定义了一组类型必须实现的方法，以满足特性的契约. 告诉编译器一个特定的类型所具有的、且能跟其它类型共享的特性。我们可以使用特征通过抽象的方式来定义这种共享行为，还可以使用特征约束来限定一个泛型类型必须要具有某个特定的行为。

**定义特性: 不指定类型**
```rust
trait <TraitName> {
    fn <method_name>(<parameters>) -> <return_type>;
    fn show(&self) {
        println!("{:?}", self);
    } //可提供默认的定义实现
}
```
s

**实现特性: 指定类型**
```rust
impl <TraitName> for <TypeName> {
    fn <method_name>(<parameters>) -> <return_type> {
        // Method body
    }
}
```

**调用特性**
```rust
use crate::<TraitName>;
```

**使用特征作为函数参数**
```rust
fn function(var:&impl TraitName){}
```

```rust
trait Summary {
    fn summarize(&self) -> String;
}
fn summary(t: &impl Summary) {
    let _ = t.summarize();
}
```

**使用特征作为函数返回值**
```rust
fn function()->&impl TraitName{}
```

#### 特征约束
使用泛型参数时，我们往往需要为该参数指定特定的行为，这种指定方式就是通过特征约束来实现的. 
```rust
fn sum<T: std::ops::Add<Output = T>>(x: T, y: T) -> T {
    x + y
}
```

```rust
fn sum<T>(x: T, y: T) -> T
where
    T: std::ops::Add<Output = T>,
{
    x + y
}
```
#### 运算符重载
通过**特质**实现,每个运算符都对应一个相应特质
- Add
- Sub
- Mul
- Div
- Rem
- PartialEq
	- eq
	- ne
- PartialOrd
	- ge
	- le

```rust
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct WrappingU32 {
    value: u32,
}
impl WrappingU32 {
    pub fn new(value: u32) -> Self {
        Self { value }
    }
}
impl std::ops::Add for WrappingU32 {
    type Output = Self;
    fn add(self, rhs: Self) -> Self::Output {
        Self::new(self.value.wrapping_add(rhs.value))
    }
}
```


```rust
use std::ops;
fn multiply<T: ops::Mul<Output = T>>(n1:T,n2:T)->T{
    n1*n2
}
```



#### Derive 派生宏

**结构体解构**:将结构体分解为多个字段
```rust
let StructName{
	
}=varName;
```

**派生宏**
**派生宏**是Rust宏的一种特殊形式。它作为属性放在结构体定义的顶部。

派生宏用于**自动为自定义类型实现一些常见的特质**。展开宏，会看到生成的代码在功能上等同于你手动编写的代码，尽管读起来可能稍显复杂：

```rust
#[derive(Debug, Clone, Copy, PartialEq,PartialOrd)]
struct Ticket {
    title: String,
    description: String,
    status: String,
}
```

常用宏:
- `PartialEq,PartialOrd,Eq,Ord`
- `Clone, Copy`
- `Debug`
- `Hash`
- `Default`




#### Trait Bound 特性界 
```rust
pub fn min<T:PartialOrd>(left: T, right: T) -> T {
    if left <= right {
        left
    } else {
        right
    }
}
```
规定泛型函数中参数`T`必须实现的特性

#### 重要特性
##### `Deref` 特性

简化定义:
```rust
pub trait Deref {
    type Target;
    
    fn deref(&self) -> &Self::Target;
}

```

`String` 的`Deref` 特性
```rust
impl Deref for String {
    type Target = str;
    
    fn deref(&self) -> &str {
        // [...]
    }
}
```
`&String` 会自动转换为 `&str`

##### `Sized` 特性

如果一个类型的大小在编译时已知，则它是 `Sized` 的, 而不是DST. 
使用`std::mem::size_of::<type>();`获知`Sized`类型大小

- 标记号特质
>标记特质不需要实现任何方法。它不定义任何行为。它仅用于**标记**类型具有某些属性。 这个标记随后被编译器利用，以启用特定行为或优化。

- 自动特质
>特别地，`Sized` 也是一个**自动特质**。你不需要显式实现它；编译器会根据类型的定义自动为你实现。


##### Supertrait / Subtrait
超集特性/子集特性

`From: Sized` means:
- `From`是`Sized`的**Subtrait**
- 任何实现了`From`的类型也必须实现`Sized`
- `Sized`是`From`的**Supertrait**。

#####  `From` 和 `Into`特性

```rust
impl<T, U> From<U> for T
let varT:T=T::from(varU)
```


`From`和`Into`是**对称特性**, 任何实现`From`的类型都会自动实现一个**空白实现`Into`：
```rust
impl<T, U> Into<U> for T
where
    U: From<T>,
{
	fn into(self) -> U {
		U::from(self)
	}
}

let varT:T=varU.into()
```

##### Deref 与 From 对比

```rust
trait From<T> {
    fn from(value: T) -> Self;
    }
trait Deref {
    type Target;
    fn deref(&self) -> &Self::Target;
    }
```

由于deref强制转换的工作原理，给定类型只能有一个"目标"类型", 相关类型是由特性实现唯一确定的。

可以为类型多次实现`From`，只要**输入类型**不同即可
```rust
trait From<T> {
    fn from(var: T) -> Self;
}

impl From<type1> for U {
    fn from(value: type1) -> Self {
	    // ****
    }
}
impl From<type2> for U {
    fn from(value:type2) -> Self {
	    // ****
    }
}
```

```rust
trait Power<T> {
    fn power(&self,pow:T) -> u32;
}
impl Power<u32> for u32 {
    fn power(&self,pow:u32)->u32 {
        let mut res=1;
        for _ in 0..pow{
            res*=self;
        }
        res
    }
}
impl Power<u16> for u32 {
    fn power(&self,pow:u16)->u32 {
        let mut res=1;
        for _ in 0..pow{
            res*=self;
        }
        res
    }
}
impl Power<&u32> for u32 {
    fn power(&self,pow:&u32)->u32 {
        let mut res=1;
        for _ in 0..*pow{
            res*=self;
        }
        res
    }
}
```
##### Clone 特性
`clone`接受一个引用`self`并返回一个**相同类型的**新**拥有**实例.
```rust
pub trait Clone {
    fn clone(&self) -> Self;
}
```

##### Copy特性
`Copy`特性是`Clone`特性的子特性, 如果一个类型实现了`Copy`，创建该类型的实例时就不需要显式调用`.clone()`，Rust会**隐式**地处理，无需介入。

要求满足性质：
1. 实现`clone`
2. 类型不管理任何额外资源（如堆内存、文件句柄等），除了它在内存中占用的`std::mem::size_of`字节。
3. 类型不是可变引用（`&mut T`）


##### Drop特性
`Drop`特性是一种机制，让你为类型定义**额外**清理逻辑，超出编译器自动为你做的部分。你在`drop`方法中放入的任何内容都会在值超出作用域时被执行。
```rust
use std::ops::Drop;
pub trait Drop {
    fn drop(&mut self);
    }
```


如果类型有显式的`Drop`实现，编译器会认为你的类型附加了额外资源，并不允许你实现`Copy`。

```rust
use std::ops::Drop;
impl Drop for DropBomb{
    fn drop(&mut self) {
        if self.flag{
            panic!("panic!!!!!");
        }
    }
}
```


#### 总结
```rust
use std::clone;
use std::ops::Add;
use std::cmp::PartialEq;
#[derive(Debug,Clone, Copy)]
pub struct SaturatingU16{
    value:u16,
}

impl SaturatingU16{
    fn new(value:u16)->Self{
        SaturatingU16{
            value:value ,
        }
    }
}
//  ---------------------------------------
impl From<u16> for SaturatingU16{
    fn from(var:u16)->Self {
        SaturatingU16{
            value:var
        }
    }
}
impl From<u8> for SaturatingU16 {
    fn from(var:u8)->Self {
        SaturatingU16{
            value:var as u16
        }
    }
}

// ---------------------------------------

impl Add<Self> for SaturatingU16{
    type Output = Self;
    fn add(self,other:Self)->Self{
        SaturatingU16::new(
            self.value.saturating_add(other.value))
    }
}
impl Add<u16> for SaturatingU16{
    type Output = Self;
    fn add(self,other:u16)->Self{
        SaturatingU16::new(
            self.value.saturating_add(other))
    }
}

// ---------------------------------------
impl PartialEq<Self> for SaturatingU16{
    fn eq(&self,other:&Self)->bool {
        self.value==other.value
    }
}

impl PartialEq<u16> for SaturatingU16{
    fn eq(&self,other:&u16)->bool {
        self.value==*other
    }
}

```


### 智能指针
当栈上数据转移所有权时，实际上是把数据拷贝了一份，最终新旧变量各自拥有不同的数据，因此所有权并未转移。
栈上数据: 
- 基础类型
- 基础类型组成的数组
- 指针

而堆上则不然，底层数据并不会被拷贝，转移所有权仅仅是复制一份栈中的指针，再将新的指针赋予新的变量，然后让拥有旧指针的变量失效，最终完成了所有权的转移.

堆上数据
- 变长数据
	- String
- `Box<type>`

#### Box
使用 `Box<T>` 可将任意数据存储在堆上, 创建并返回一个智能指针

```rust
let a :Box<{integer}> = Box::new(3);

let arr = Box::new([0;1000]);
```

#### DST动态大小类型=> Sized固定大小类型

递归类型：在类型定义中又使用到了自身，或者说该类型的值的一部分可以是相同类型的其它值，这种值的嵌套理论上可以无限进行下去，所以 Rust 不知道递归类型需要多少空间
