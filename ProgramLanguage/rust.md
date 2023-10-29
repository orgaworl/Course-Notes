# 数据类型

```rust
//integer
isize,usize
//float
f32,f64
//bool
true,false
//4字节char
//元组(,,)

//数组[integer/char]:
let c: [i32; 5] = [1, 2, 3, 4, 5];
let d = [3; 5];
```

# Syntax

```rust
let a = 123;    //"不可变变量"
let mut a = 123;//可变变量
const a: i32 = 123;//常量
```

```rust
//函数
fn <funcN> (varN:varType,)->resType{
    ......
    return res;
}

//语句块,最后一个步骤是表达式，此表达式的结果值是整个表达式块所代表的值
{
         ;
    value  
};
```

```rust
//条件表达式必须是 bool 类型,block可以是函数体表达式
if condition {block1}
else if condition {block2}
else {block3}

while condition {block}

for i in iterObj {block}

loop {block} //无限循环
```

```rust
let a = [10, 20, 30, 40, 50];
a.iter();

0..5  //[0,4]
```
