---
title: Rust01
subtitle: Rust基本管理
layout: post
author: orgaworl
header-style: text
tags:
  - Rust
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

配置文件
```
[profile.dev]
opt-level = 1               # Use slightly better optimizations.
overflow-checks = false     # Disable integer overflow checks.
```


**整数溢出检测**
- `dev`配置中, 整数溢出默认检测, 触发`panic`
- `release`配置中,整数溢出不检测

### 项目管理
自带cargo
```
cargo --help #查看 Cargo 的帮助信息。
cargo new <ProjectName> <--lib> #创建新项目

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

**包**
Rust包由`Cargo.toml`文件中的`[package]`部分定义，也称为**清单**。在`[package]`内，你可以设置包的元数据，比如名称和版本。

**目标 crate**
在一个包内部，你可以有一个或多个**crate**，也称为**目标**。最常见的两种crate类型是**二进制crate**和**库crate**.


**约定**



### 依赖管理
包可以通过在它的`Cargo.toml`文件的`[dependencies]`部分列出其他包来依赖它们。指定依赖最常用的方式是提供其名称和版本号：

自动获取依赖
```rust
[dependencies] 
thiserror = "1"
```
手动路径依赖
```rust
[dependencies]
my-library = { path = "../my-library" }
```
开发依赖(只在开发过程中引入)
```rust
[dev-dependencies]
static_assertions = "1.1.0"
```

---
### 管理
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



---


1. 访问路径
	- 相对路径 `self::`
	- 绝对路径 `crate::`
2. 访问权限
	- public `pub mod` `pub fn`
	- private (默认)
3. 引入当前作用域
	- `use crate::`

## 使用总结
对于不进行修改,只进行读取的参数, 使用引用的方式进行传参.


## References
- 