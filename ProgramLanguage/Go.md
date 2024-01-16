## 结构

---

## 数据类型

- boolean
  
  true,false

- num
  
  uint64,int64, float64,complex128,
  byte,rune,uint,int,uintptr

- string

```go
+
fmt.Sprintf//生成格式化的字符串并返回该字符串
fmt.Printf //生成格式化的字符串并写入标准输出 
```

- Poiter
  
  ```go
  var varN * typeN
  var varN [size] * typeN //指针数组
  ```
  
  当一个指针被定义后没有分配到任何变量时，它的值为 nil.
  
  nil 指针也称为空指针。
  
  nil在概念上和其它语言的null、None、nil、NULL一样，都指代零值或空值。

- array
  
  相同类型的一组已编号且长度固定的数据项序列.
  
  ```go
  var varN [size] typeN
  //初始化
  var varN [size] typeN {val1,val2,}
      varN := [size]int{val1,val2,val3,}
      varN := [size]int{pos1:val1,pos2:val2,}
  //可使用 ... 代替长度,编译器自动填充.
  ```

- struct
  
  ```go
  //define
  type structT struct {
      var1 type
      ...
      var2 type
  }
  
  //create
  varN:=structType{val1, val2, }
  varN:=structType{key1:val1, key2:val2, }
  
  //access
  varN.item
  ```

- channel

- function

- slice
  
  对数组的抽象,动态数组.
  
  ```go
  //create
  var varN [] type
  var varN [] type=make([]type,len)
  var slice:=make([]type,len)
  //make([]T, length, capacity)
  ```

- interface

- map
  
  ```go
  //CREATE
  mapVar := make(map[KeyType]ValueType, initialCapacity)
  m := map[string]int{
      "apple": 1,
      "banana": 2,
      "orange": 3,
  }
  // access
  mapVar[key]
  
  //delete
  delete(m,key)
  ```
  
  Map 是一种无序的键值对的集合。
  
  Map 最重要的一点是通过 key 来快速检索数据，key 类似于索引，指向数据的值。
  
  Map 是一种集合，所以我们可以像迭代数组和切片那样迭代它。不过，Map 是无序的，遍历 Map 时返回的键值对的顺序是不确定的。
  
  在获取 Map 的值时，如果键不存在，返回该类型的零值，例如 int 类型的零值是 0，string 类型的零值是 ""。
  
  Map 是引用类型，如果将一个 Map 传递给一个函数或赋值给另一个变量，它们都指向同一个底层数据结构，因此对 Map 的修改会影响到所有引用它的变量。

**数据类型转换**

```go
type_name(expression)


//字符串转换
num,_ = strconv.Atoi(str)
str := strconv.Itoa(num)
```

---

## 变量作用域

Go 语言中变量可以在三个地方声明：

- 函数内定义的变量称为局部变量

- 函数外定义的变量称为全局变量

- 函数定义中的变量称为形式参数
  
  ---

### 变量与常量

**变量声明**

```go
// 变量声明
var var1,var2 type //初始化默认0,false,"",nil
var var1,var2 =val1,val2 //根据初始值自动判断类型.
    var1,var2:=val1,val2 //只能被用在函数体内，而不可以用于全局变量的声明与赋值
var(
    var1 type1
    var2 type2
)
//常量声明
const var1,var2 type
```

`int、float、bool`和` string `这些基本类型都属于值类型，使用这些类型的变量直接指向存在内存中的值. 使用等号 `=` 将一个变量的值赋值给另一个变量时，实际上是在内存中将值进行了拷贝.

**常量声明**

```go
const var [type] = val
const var1,var2 = value1, value2 //多个简写

const(
    var1=val1
    var2=val2
)

//特殊常量 iota 在 const关键字出现时将被重置为0,
//const 中每新增一行常量声明将使 iota 计数一次
```

---

### 运算符

- 算术运算符
  
  ++ , --

- 关系运算符

- 逻辑运算
  
  &&, ||, !

- 位运算
  
  &, |, ^, <<, >>
  
  (取反用异或全1实现)

- 赋值运算
  
  同C

- 其他
  
  ```go
  & //取变量地址
  * //指针变量
  ```
  
  **运算符优先级**
  
  | 优先级 | 运算符              |
  | --- | ---------------- |
  | 5   | * / % << >> & &^ |
  | 4   | + - \| ^         |
  | 3   | == != < <= > >=  |
  | 2   | &&               |
  | 1   | \|               |

---

### 流程控制

```go
if condition{}else{}

switch var{
    case val1:
        ...
    case val2:
        ...
    default:
        ...
}
// 支持多条件匹配
// 默认只执行一个case
// fallthrough 可执行多个case
// break 终止case
```

```go
//一般for循环
for init; condition; post{ }

//while 循环
for condition{ }

//无限循环
for { }

//For-each range 循环
for item :=range Obj { }
for _,item :=range Obj { } // _ 作占位符
```

---

### 函数

```go
func function_name( [parameter list] ) [return_types] { 

}
```

- 函数可返回多个值

- 函数参数默认值传递, 可手动引用传递

- 函数可作为实参
  
  ```go
  getSquareRoot := func(x float64) float64 {return math.Sqrt(x)}
  getSquareRoot(9)
  ```
