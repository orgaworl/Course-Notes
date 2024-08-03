---
tags:
  - 编程语言
  - 静态语言
  - 面向对象
  - 物理机运行
  - code
  - rust
---

## 语法
### 01数据类型
#### 基本数据结构

- integer
  `isize,usize`
	`65535u16`

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
- &str  16Byte poi+len

- String 24Byte
```rust
let string=String::new();
let mut s = String::with_capacity(cap);
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

### 02变量常量

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

### 04运算

```rust
= //赋值
```

#### 整数溢出

手动环绕运算
`let sum = x.wrapping_add(y);`

饱和运算: 溢出时返回最大值或最小值
`let sum = x.saturating_add(y);`

#### 显式类型转换

```rust
let a: u32 = 10;
let b = a as u64;
let c: u64 = a as _;  // 自动推断
```




### 05函数与语句块

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

### 06流程控制

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

author email: orgaworl@outlook.com
