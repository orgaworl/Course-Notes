
## Basic Concept

| 组件             | 描述                                                           |
| -------------- | ------------------------------------------------------------ |
| 容器（Containers） | 容器是用来管理某一类对象的集合。C++ 提供了各种不同类型的容器，比如 deque、list、vector、map 等。 |
| 算法（Algorithms） | 算法作用于容器。它们提供了执行各种操作的方式，包括对容器内容执行初始化、排序、搜索和转换等操作。             |
| 迭代器（iterators） | 迭代器用于遍历对象集合的元素。这些集合可能是容器，也可能是容器的子集。                          |


- 容器（Containers）
- 分配器（Allocators） 
- 算法（Algorithm） `<algorithm>`  `<numeric>`
- 迭代器（Iterators）`<iterator>`
- 适配器（Adapters）
- 仿函数（Functors）

## 仿函数
`class + operator()`
```cpp
class classN{
	retType operator()(<paraList>)
	{
	}
}


```

- 一般写成模板类, 配合STL使用
- 内部含有状态

## Algorithms

```cpp
<algorithm>    
<functional>
<numeric>
```



```cpp
// 1. 算术
max(a,b)
min(a,b)
accumulate(iterator beg,iterator end,value);
nth_element()


for_each(iterator beg,iterator end,_func);

// 2. 查找
find   (iterator beg,iterator end,value);
find_if(iterator beg,iterator end,_Pred);
count(iterator beg,iterator end,value);
count_if(iteraotr beg,iterator end,_Pred);
//先对序列进行排序后才能使用
bool binary_search(iterator beg,iterator end,value);



// 3. 换序
sort(iterator beg,iterator end,_Pred);
reverse(iterator beg,iterator end);

//随机调整顺序.
random_shuffle(iterator beg,iterator end);

// 4. 操作
fill(iterator beg,iterator end,value);
//将两个有序序列合并为一个有序序列.
merge(iterator beg1,iterator end1,
      iterator beg2,iterator end2,iterator target_beg);
swap(container c1,container c2);
replace(iterator beg,iterator end,oldvalue,newvalue);
replace_if(iterator beg,iterator end,_Pred,newvalue);
```


```cpp
//求交集的两个容器必须是有序序列，而且同序（同升或同降），否则报错。
set_intersection(iterator beg1,iterator end1,
                 iterator beg2,iterator end2,iterator target_beg)
//求并集的两个容器必须是有序序列，而且同序（同升或同降），否则报错。
set_union(iterator beg1,iterator end1,
          iterator beg2,iterator end2,iterator target_beg)
set_difference(iterator beg1,iterator end1,
               iterator beg2,iterator end2,iterator target_beg)
```


---

author email: orgaworl@outlook.com