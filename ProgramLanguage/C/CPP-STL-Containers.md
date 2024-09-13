## Basic Concept

| 组件             | 描述                                                           |
| -------------- | ------------------------------------------------------------ |
| 容器（Containers） | 容器是用来管理某一类对象的集合。C++ 提供了各种不同类型的容器，比如 deque、list、vector、map 等。 |
| 算法（Algorithms） | 算法作用于容器。它们提供了执行各种操作的方式，包括对容器内容执行初始化、排序、搜索和转换等操作。             |
| 迭代器（iterators） | 迭代器用于遍历对象集合的元素。这些集合可能是容器，也可能是容器的子集。                          |

- 容器（Containers）
- 分配器（Allocators）
- 算法（Algorithm）
- 迭代器（Iterators）
- 适配器（Adapters）
- 仿函数（Functors）


---

## Containers

打勾的是本次将会详细讲解的，加粗的是算法竞赛中有必要学习的。

- 顺序容器
  - [ ] **array**
  - [x] **vector**
  - [ ] **deque**
  -  [ ] forward_list
  - [ ] **list**

- 关联容器
  - [x] **set**
  - [x] **map**
  - [ ] **multiset**
  - [ ] **multimap**

- 无序关联容器
  - [ ] **unordered_set**
  - [ ] **unordered_map**
  - [ ] **unordered_multiset**
  - [ ] **unordered_multimap**

- 容器适配器
  - [x] **stack**
  - [x] **queue**
  - [x] **priority_queue**
  - flat_set
  - flat_map
  - flat_multiset
  - flat_multimap

- 字符串
  - [x] **string** (basic_string\<char\>)

- 对与元组
  - [x] **pair**
  - [ ] **tuple**

### 1.1 vector

**调用**

```c
#include<vector>

//一维数组
vector<type> vec( len,[initVal]/vec2);

// 构造初始100行，不指定列数的二维数组
vector<vector<int>> mat(100, vector<int> ());

// 构造初始100行，初始666列的二维数组，初值为-1
vector<vector<int>> mat(100, vector<int> (666, -1))



//调用
.size()  //r 容器真实占用的大小，也就是容器当前拥有多少个容器
.empty() //是否为空
.capacity()//发生 realloc 前能允许的最大元素数，即预分配的内存空间。
.front()
.back()
.push_back(i);
.pop_back();
.insert(pos,val)
.erase(pos);vec.erase(beginPos,endPos);
.clear()

.resize(len,[defaultVal]) //容器内的对象内存空间是真正存在的。
.reserve() //仅仅只是修改了 capacity 的值，容器内对象无真实空间

.begin()
.end()
```

`vector<vector<int> > name;`  **>>之间要加空格**

**元素访问**

```c
//下标
vec[i]

// 使用迭代器 iterator 访问值
vector<typeN>::iterator varN;

vector<int>::iterator v = vec.begin();
for (int i = 0; i < v.size(); i++)
{
   cout<<*(it+i)<<" ";
}
while( v != vec.end())
{
  cout <<*v << endl;
  v++;
}

//智能指针
for(auto val :vec) 
    cout << val;
```

### 1.2 stack

**调用**

```c
stack<typeN>var;
s.push(ele)    //元素ele入栈，增加元素
s.pop()     //移除栈顶元素
s.top()     //取得栈顶元素（但不删除）
s.empty()//检测栈内是否为空，空为真
s.size() //返回栈内元素的个数
```

只能对栈顶元素进行操作,不可访问内部元素.       

可使用`vector`模拟stack.

### 1.3 queue

调用

```c
queue<typeN>var;

.front()//返回队首元素
.back() //返回队尾元素
.push() //尾部添加一个元素副本 进队
.pop()  //删除第一个元素 出队
.size() //返回队列中元素个数，返回值类型uint
.empty()//判断是否为空
```

不可访问内部元素

### 1.6 priority_queue

提供常数时间的最大元素查找，对数时间的插入与提取，底层原理是二叉堆。

```c
#include <queue> 
priority_queue<typeN> q;

q.top()    //访问队首元素
q.push()   //入队
q.pop()    //堆顶（队首）元素出队
q.size()   //队列元素个数
q.empty()  //是否为空
//没有clear()
//优先队列只能通过top()访问队首元素（优先级最高的元素）
```

仅堆顶可读,其他元素无法读取和修改.

**设置优先级**  

```c
// 默认大根堆, 即每次取出的元素是队列中的最大值
priority_queue<int> pq; 
// 小根堆, 每次取出的元素是队列中的最小值
priority_queue<int,vector<int>,greater<int> >q; 
//less< int > 表示数字大的优先级大
//greater< int >表示数字小的优先级大

//自定义排序
struct cmp1 {
    bool operator()(int x,int y) {
        return x > y;
    }
};
priority_queue<int, vector<int>, cmp1> q1; // 小根堆
```

### 1.4 deque

```c
deque<typeN>var;

push_back(val)
push_front(val)
back()
front()
pop_back()
pop_front()
erase(it)    //删除双端队列中的某一个元素
erase(itBegin,itEnd)//删除双端队列中[first,last)中的元素
empty()
size()
clear()

//排序
sort(d.begin(),d.end())
```

### 1.5 set

**内部自动有序**且**不含重复元素**的容器

```c
#include <set>
using namespace std;
set<typeN> var;

//调用
.begin()
.end()
.rbegin()//逆序迭代器,指向最后位置.
.rend()
.clear()
.empty()
.size()
.insert(value)
.erase(iter/key_value)
.erase(itBegin,itEnd)//删除区间内所有元素
.find(value)//返回对应迭代器.
.count(value)
.lower_bound(val)//返回大于等于k的第一个元素的迭代器
.upper_bound(val)//返回大于k的第一个元素的迭代器
```


```cpp
//元素访问,只能用iterator
set<typeN>::iterator it;

set<int> st;
for (set<int>::iterator it = st.begin(); it != st.end(); it++)
{
    cout << *it << endl;
}

//智能指针
```

**改变存储顺序**

```c
// 1.
set<int> s1; // 默认从小到大排序
set<int, greater<int> > s2; // 从大到小

//2. 重载 < 运算符
struct cmp {
    bool operator () (cons int& u, const int& v) const {
       // return + 返回条件
       return u > v;
    }
};
set<int, cmp> s; 

//3. 匿名函数

set<int, function<bool(int, int)>> s
([&](int i, int j)
{
    return i > j; // 从大到小
});
```

### 1.6 string

**初始化**

```c

string str1;                  //生成空字符串
string str2(str);             //复制
string str3(str, start, len); // str[start:start+len-1]
string str4(str, len);        // str[0:len-1]
string str5(times, str);      // times*str
```

**访问**

```c

```

**操作**

```cpp
s.push_back(str)
s.insert(pos,element)
s.append(str)
erase(iterator p) //删除字符串中p所指的字符
erase(iterator first, iterator last)//删除[first,last)上所有字符
erase(pos, len)  //删除字符串中从索引位置pos开始的len个字符
clear()          //删除字符串中所有字符

string s;
transform(s.begin(),s.end(),s.begin(),::tolower); //转换小写
transform(s.begin(),s.end(),s.begin(),::toupper); //转换大写


```

### 1.7 map

map会按照键的顺序从小到大自动排序，键的类型必须可以比较大小

**map**：内部用**红黑树**实现，具有**自动排序**（按键从小到大）功能。
- 优点：内部用红黑树实现，内部元素具有有序性，查询删除等操作复杂度为O ( l o g N ) O(logN)O(logN)
- 缺点：占用空间，红黑树里每个节点需要保存父子节点和红黑性质等信息，空间占用较大。
    
**unordered_map**：内部用**哈希表**实现，内部元素无序杂乱。
- 优点：内部用哈希表实现，查找速度非常快（适用于大量的查询操作）。
- 缺点：建立哈希表比较耗时。


```cpp
// 判断元素是否存在
if(mp.find(key)!=mp.end()) //存在

// 插入元素
mp.insert(pair<string,int>("H",1)

```

| 代码                     | 含义                                                                                           |
| ---------------------- | -------------------------------------------------------------------------------------------- |
| `mp.find(key)`         | 返回键为key的映射的迭代器 $O(logN) $ 注意：用find函数来定位数据出现位置，它返回一个迭代器。当数据存在时，返回数据所在位置的迭代器，数据不存在时，返回mp.end() |
| `mp.erase(it)`         | 删除迭代器对应的键和值O(1)                                                                              |
| `mp.erase(key)`        | 根据映射的键删除键和值O(logN)                                                                           |
| `mp.erase(first,last)` | 删除左闭右开区间迭代器对应的键和值O(last−first)                                                               |
| `mp.size()`            | 返回映射的对数$ O(1)$                                                                               |
| `mp.clear()`           | 清空map中的所有元素O(N)                                                                              |
| `mp.insert()`          | 插入元素，插入时要构造键值对                                                                               |
| `mp.empty()`           | 如果map为空，返回true，否则返回false                                                                     |
| `mp.begin()`           | 返回指向map第一个元素的迭代器（地址）                                                                         |
| `mp.end()`             | 返回指向map尾部的迭代器（最后一个元素的**下一个**地址）                                                              |
| `mp.rbegin()`          | 返回指向map最后一个元素的迭代器（地址）                                                                        |
| `mp.rend()`            | 返回指向map第一个元素前面(上一个）的逆向迭代器（地址）                                                                |
| `mp.count(key)`        | 查看元素是否存在，因为map中键是唯一的，所以存在返回1，不存在返回0                                                          |
| `mp.lower_bound()`     | 返回一个迭代器，指向键值>=key的第一个元素                                                                      |
| `mp.upper_bound()`     | 返回一个迭代器，指向键值> key的第一个元素                                                                      |
|                        |                                                                                              |
### 1.8 pair

```cpp

pair<int,int> p
.first
.second
```

### bitset

```cpp
bitset<n>bs //n必须为常量

```

|                          |                        |
| ------------------------ | ---------------------- |
| `bitset < n >a`          | a有n位，每位都为0             |
| `bitset < n >a(b)`       | a是unsigned long型u的一个副本 |
| `bitset < n >a(s)`       | a是string对象s中含有的位串的副本   |
| `bitset < n >a(s,pos,n)` | a是s中从位置pos开始的n个位的副本    |

|代码|含义|
|:-:|:-:|
|`b.any()`|b中是否存在置为1的二进制位，有 返回true|
|`b.none()`|b中是否没有1，没有 返回true|
|`b.count()`|b中为1的个数|
|`b.size()`|b中二进制位的个数|
|`b.test(pos)`|测试b在pos位置是否为1，是 返回true|
|`b[pos]`|返回b在pos处的二进制位|
|`b.set()`|把b中所有位都置为1|
|`b.set(pos)`|把b中pos位置置为1|
|`b.reset()`|把b中所有位都置为0|
|`b.reset(pos)`|把b中pos位置置为0|
|`b.flip()`|把b中所有二进制位取反|
|`b.flip(pos)`|把b中pos位置取反|
|`b.to_ulong()`|用b中同样的二进制位返回一个unsigned long值|








---
author email: orgaworl@outlook.com