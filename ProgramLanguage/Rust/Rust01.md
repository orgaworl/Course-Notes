
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
