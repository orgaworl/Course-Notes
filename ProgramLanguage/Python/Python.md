---
tags:

- 编程语言
- Python

---

---

## 基础

- 注释说明  
  
  - `#单行注释`  
  - `''' 多行注释 '''`  

- 模块引入  
  
  - `import math #引入整个模块`  
  - `from math import abs #引入模块的部分`  

- 字符编码  
  
  - `#ASCII编码`  
  
  - `#拓展ASCII编码`  
  
  - `#Unicode编码`
    
    ```python
    word=chr(int(input("enter a int for a char")))
    code=ord(input("enter a char for a code"))
    ```
  
  - `#UTF-8编码`  
  
  - `#编码转换`  
    
    ```python
    str_.encode(encoding='UTF-8')#编码
    str.decode(encoding='UTF-8')#解码  
    ```

- 对象
  
  - 在python中处理的一切都是对象, 由标识（Identity) 、类型（type)、值（value)组成  
  - `id(obj)`可返回对象 obj 的标识  
  - `type(obj)`获得对象的所属类型  
  - `print(obj)`可以直接打印出值  

- 变量  
  
  - 表示/指向特定值的名称，变量存储是对象内存的引用/地址  
  - 基于值的内存管理方式，如果为不同变量赋值为相同值，这个值在内存中只有一份，多个变量指向同一块内存地址  

- 内存管理  
  
  - 多个变量赋相同的值,变量都指向唯一的值的内存地址  
  - 多个变量赋相同的列表,变量指向不同的列表内存地址  
  - 变量复制实则为对变量的引用  
  - 自动内存管理功能，对于没有任何变量指向的值，Python自动将其删除。Python会跟踪所有的值，并自动删除不再有变量指向的值。  
  - 也可显式使用del命令删除不需要的值或显式关闭不再需要访问的资源  

- 模块管理PIP  
  
  - sys.modules.items() 显示所有预加载模块信息  

- 脚本之 __name__ 属性  
  
  - 作为模块 ,则 _name__=moudleName  
    
    - 作为脚本独立运行,则 __name_="__main__"  

- [-5,256]间的int类型也适用于驻留机制

---

## 02.运算符

- 数据类型  
  
  - Number  
    - 进制  
      - 常用:0o8进制 0x十六进制 0b二进制  
            - `转换:bin() int() oct() hex()`  
        
        - 数字类型转换  
          - int() #整数 float() #浮点数 complex(x,y) #复数 bool()  


            - 支持在数字中间位置使用单个下划线作为分隔来提高数字的可读性，类似于数学上使用逗号作为千位分隔符。1_000_000==1000000 1_2_3_4==1234 1_2 + 3_4j==(12+34j) 1_2.3_45==12.345  
    
    
    - String  
        不存在单个字符
        - 创建  
            - str_=''' this is a long sentence '''  
            - str_=str(obj) str_=repr(obj)  
            - 空字符串为'' 或 ""  
            - 单引号、双引号、三单引号、三双引号可以互相嵌套  
        - 访问  
            - str_[ [start] : [end] : [step] ]  
        - 运算  
            - + * 关系运算符 in not in  
        - 函数  
            - #查找  
                - str_.find(subStr[,beg[,end]])  
                - str_rfind(subStr[,beg[,end]])  
                - str_.startwith(subStr) #检查是否以子字符串开始  
            - #替换 
                - str_.replace(oldStr,newStr[,maxTimes])  
            - #拆分  
                - str_.split(sep="分隔符",num=分割次数)  
            - #拼接  
                - +  
                - x= '1234''abcd'  
                - sep.join(str_list)  
            - #格式化  
                - ’%总长.小数点后位数f ’ %a  
                - “””%d %s””” %(1, ”word” )  
    
            - #原始字符串  
                - 加r/R 表示原始字符串,字符串中转义字符不识别.  
    
        - print('我是\u80E1\u7A0B\u745C')#四位十六进制数表示Unicode字符我是胡程瑜  


        - 字符编码  
            - `ord(ele)`  获取ASCII码
            - `chr(ele)`  获取ASCII对应字符
    
        - 格式化输出  
            - `: 填充符 对齐方式 符号说明 [ [#] 进制] 宽度 .浮点数精度f`  

- 数据类型分类  
  - 变量  
    - 列表 字典 集合  
    - 常量 
    - 字符串 元组  
- 运算符  
  - 算术运算符  
      优先级与数学一致
    - `**`  幂次  
	- `//`  整除，python向下-∞取整，cpp向零取整
	- `*`  字符串重复
	- `+`  字符串拼接  
	- `%`  取余 ,正负由两数共同决定
		- 9%-4 == -3  
			9 = (-4)*(-3) + (-3)
		- -9%4 == 3  
			-9 = (4)*(-3) + (3)
		- `x%y==x-(x//y)*y`  
    
    
    - 位运算符  
        - 位与 &  
        - 位或 |  
        - ^ 按位异或  
        - ~ 按位取反  
        - 左移运算符 <<  
            高位溢出,低位补0
        - 右移运算符 >>  
            低位截断,高位补0
    
    - 逻辑运算符  
        - 与 and  
        - 或 or  
        - 非 not  
	- 包含关系
		- in (字典针对key)


    
    - 关系运算符  
        - ==        值(value)相同
		- is          引用自同一个对象, 地址(id)相同
		- is not    引用自不同对象, 地址不同
        - 可连用1<3<5分别比较左右两边 ,即返回true and true  
    
    - 赋值运算符  
        - 链式赋值  
            - a=b=c=1  
        - 系列解包赋值  
            - a,b,c=1,2,3  
                - 例:值交换 a,b=b,a  
    
    
    - python中优先级  
    - 运算符额外用法  
        - +  
            - 连接两个列表、元组、字符串  
            - #不支持字符与数字相加  
    
        - *  
            - 用于列表、字符串、元组等类型,对内容进行重复并返回
    
    - 集合运算符  
        - & 交  
        - |   并  
        - -  差  
        - ^  对称差

---

## 03.组合数据结构概论

### 操作组合数据结构

-   组合数据
    - 修改主体  
        - 本地操作,不返回值  
            - 切片赋值  
            - 大部分 .方法  
            - 通过下标[numth]修改  
                
        - 生成新序列  
            - 修改  
                - 切片  
                - 内置函数 #如reverse(list)  
                - +  
                    - blist=alist+[7]  
                - *  
                    - 复制已有元素的引用,修改其中一个值时，相应的引用也会被修改  
                        
            - 拷贝  
                - 浅拷贝  
                    - 拷贝的是对象的引用，如果原对象改变，相应的拷贝对象也会发生改变  
                        - id不同 ,值相同 ,原序列中可变元素改变影响新序列  
                        - b = list(a) # 可以通过list 对列表进行浅拷贝  
                        - c = a.copy() # 也可以通过copy函数进行拷贝  
                        - d=list(::)/list(:) #切片返回浅拷贝  
                    
                - 深拷贝  
                    - 拷贝对象中的每个元素，拷贝对象和原有对象无关，两个是独立的对象  
                        - id不同 ,值相同 ,原序列中可变元素改变不影响新序列  
                        - copy.deepcopy()  
                            
                - 相同引用#起别名  
                    - 为同一个对象的引用  
                        - id相同 ,值相同  
                        - alist=blist  

### 组合数据结构分类
- 分类  
    - 是否可变  
        - 可变序列,修改后id不变,为原  
            - 列表  
            - 字典  
            - 集合  
        
        - 不可变序列,不可执行增删改操作  
            - 元组  
            - 字符串  
            
    - 可迭代对象  
        - range  
        - 列表  
        - 元组  
        - 获取  
            - 索引  
            - for in遍历不需要索引  

### 切片
- 切片操作  
    - 切片  
        - 返回浅复制  
        - 错误不会抛出异常,返回空列表  
        - del 切片 #删除切片  
		- step为负数时，从右向左提取元素  
		- 要满足: 在当前方向上head位于tail前面  
    - 切片(被)赋值  
        修改原序列

- 错误种类  
    - 抛出异常  
        - 下标不存在/越界  
    - 返回空list  
        - 切片方向异常 
    - 下标越界: 在列表尾部截断或者返回一个空列表  
        
- 对列表进行特定值删除操作  
    - 删除/增加列表元素时，Python会自动对列表内存进行收缩/拓展并移动列表元素以保证所有元素之间没有空隙  
        - 每当插入或删除一个元素之后，该元素位置后面所有元素的索引就都改变了。  
            
    



---
## 04.组合数据结构分论

### 列表 list

```python

list.clear()
list.copy()
list.append()
list.extend()
list.index()
list.insert()
list.pop()
list.remove()
list.reverse()
list.sort()
```



- 列表  
    - 创建  
        - `list_=[ele1,ele2,ele3]`
        - `list_=list([ele1,ele2,ele3])`  
            
    - 特点  
        - print(list)按顺序全部打印  
        - 任意类型数据可混存  
            
    
    - 获取元素索引  
        - .index(ele)  
        - .index(ele,start,end)  
            索引 [start,end)
        - 返回 第一个 值相同的元素索引  
        - 不存在返回ValueError  
            
    - 获取指定元素  
        - `list_[num_th]`  
        - 索引可为负值  
            - 非负索引=num+负索引  
        - 索引不可超出范围  [-num,-1]∪[0,num-1]  
            

    - 获取多个元素  
        - list_[start:end]  
            step默认为1, start默认为0,end默认为最后一个元素
		- list_[ :end: ]  
			step默认为1, start默认为0
        - list_[start:end:step]
            [ start,end )
        
        - step为负数时  
            默认最后元素做start,从后到前输出
            - 此时start/end可用非负数  
                
    
    - 查询元素是否存在  
        - ele in list_  
        - ele not in list_  
        - for item in list_ :  
            - 遍历列表  
                
    
    - 增加列表元素  
        - alist+[2]  
            生产新序列
        - .append(new_ele)  
            在末尾增加一个元素,同一个列表
        - .extend(ele)  
            在末尾增加至少一个个元素
            - 例: `list_2.extend(list_1)` 把list_1接到list_2上
        - .insert(numth,new_ele)  
            在任意位置添加一个元素
        - 切片赋值  
            - list_1[numth:numth]=list_2[]  
                在任意位置`插入至少一个元素
    
    - 删除列表元素  
        - `.remove(ele)`  
            元素存在时,移除(一个)第一个相同元素
        - `.pop(numth)`  
            根据索引移除元素,不写索引默认删除最后一个
        - 切片赋值  
            - `list_[start,end]=[]`
        - `.clear( )`  
            清空列表
            - 列表变为空列表  
                
        
        - `del list_`  
            删除列表对象
            - 对象不再存在  
                
    
    - 修改列表元素  
        - list_[numth]=num  
        - 切片赋值  
            - list_[start,end]=[ele1,ele2,ele3]  
    - 排序列表元素  
        - .sort( )  
            升序排列
        - .sort(reverse=True)  
            降序排列
        - =sorted(list_)  
            返回新列表,原列表不改变
        - =sorted(list_ ,reverse=True)  
            返回新列表,原列表不改变
    
    - 复制删除  
        - list_copy=list.copy() #浅复制  
        - list_copy=list #深复制  
        - del 列表名 #彻底删除  
            
    
    - 生成列表  
        - =[公式 for i in 可迭代]  
        - =[公式 for i in 可迭代 if condition]  
            
    - 空列表  
        - list_=[ ]  
        - list_=list( )  
            
    - 列表中包含的是元素值的引用，而不是直接包含元素值  
    - *运算符将包含列表的列表重复并创建新列表时，并不是复制子列表值，而是复制已有元素的引用。因此，当修改其中一个值时，相应的引用也会被修改


### 元组 tuple

```python
tuple.count()
tuple.index()
```
- 元组  
    内置数据结构,不可改变
    - 相当于 : const列表  
    - 实际存储对元素的引用, 储存指针常量
        - 若元素为常量则不可变  
            C++下 const type * const p
        - 若元素为变量则可改变该元素的数据,但不可改变引用对象  
            C++下 type * const p
    
    - 创建  
        - t=(ele1 , ele2 , ele3)  
            元组中元素>=2时,可以省略小括号
		- t=(ele,)  
			只含一个元素时要加逗号 ,
        - t=tuple( (ele1,ele2,ele3) )  
            
    - 获取  
    
    - 查询  

    - 无生成式  

    - 空元组  
        - tup_=()  
        - tup_=tuple( )  
            
- 具名元组namedtuple  
    - `生成类 City = namedtuple("City", "name country polulation coordinates") # 实例化 tokyo = City("Tokyo", ‘Japan', ‘2000', ('35.68','139.69')) #调用属性tokyo.name`


### 字典 dict

```python
dict.clear()
dict.copy()
dict.update()
dict.pop()

dict.fromkeys()
dict.get()

dict.keys()
dict.values()
dict.items()

dict.popitem()
dict.setdefault()

```
- 字典  
    - 特点  
        - key不允许同名;value可相同  
        - key必须为常量  
        - 元素由key的哈希值排序(确定的无序)  
    
    - 创建  
        - dic_={ key00:e01 , key10:e11 , key20:e21 }  
        - dic_={ }  
            创建空字典
        - dic_=dict(name=key00,age=e01)  
        - dic_=dict.fromkeys(seq, defaultValue)  
        - dic_=dict.fromkeys(seq ) #值为None  
            
    - 获取元素  
        - dic_[key_]  
            - 不存在时报: KeyError  
        - dic_.get(key_)  
            - 不存在时返回None  
            - dic_.get(key_ , num)  
                - 不存在时返回指定num  

    - 查询元素(key)是否存在  
        - ele in list_  
        - ele not in list_  
        - for item in list_ :  
            - 遍历列表  
                
    - 删除字典元素  
        - del dic_[key_]  
            删除指定键值对
        - dic_ .clear( )  
            清空字典
        - .pop()  
            删除并返回指定键的元素
        - .popitem()  
            随机删除并返回字典元素
    
    - 增改字典元素  
        - dic_[key_]=ele  
            - 无key_,添加字典元素  
            - 有key_,修改字典元素  

        - dic_3={dic_1,dic_2}  
            - 生成字典副本  

        - .update(anotherDic)  
            - 若原字典中不存在key_时,新增字典元素  
            - 若原字典中已存在key_,则替换其value_  
        - .setdefault()  
            - 将键值对添加到字典,只添加不替换,返回相同键的位置.  
  
    - 获取字典视图  
        - dic_.keys( )  
            - 获取所有key  
        - dic_.values( )  
            - 获取所有value  
        - dic_.items( )  
            - 获取所有key:value对  
                
    - 遍历字典  
        ```python
        for key in dic_ : 
	        print(key) 
	        print(dic_[key]) 
	        print(dic_.get(key)) 
	        #key都存在无差别  
		```
            
    
    - 生成字典式  
        - `={ key:value for key,value in zip(keys,values) }`  
            
    - 空字典  
        - dic_={ }  
        - dic_=dict( )  
            
    - 一键对应多个值:  
        - 一个键对应复合数据类型  
            
    - 字典有序性  
        - origh table  
            - dict_[key]=value  
        - hash table  
            - indices[hash(key)]=ordOfEntries  
        - store table  
            - entries[ordOfEntries]=[ hash(key_),key_,value_ ]  
                
    - 排序  
        - `sorted(d.items(), key=lambda x: x[0]) #按键排序,返回列表`  
        - `sorted(d.items(), key=lambda x: x[1]) #按值排序,返回列表`


### 集合 set

```python
set.clear()
set.copy()
set.add()
set.update()
set.pop()
set.remove()


set.difference()
set.difference_update()
set.discard()
set.intersection()
set.intersection_update()
set.isdisjoint()
set.issubset()
set.sisuperset()
set.union()

```
- 集合  
    - 相当于没有value的字典  
        - 元素由key的哈希值排序(确定的无序)  
    - 创建  
        - set_={ele1,ele2,ele3}  
        - set_=set( {ele1,ele2,ele3} )  

    - 获取  
        
    - 查询  
        
    - 增  
        - .add(ele)  
            增单个,ele也是key
        - .update( {}[]() )  
            增至少一个,内可放集合/列表/元组
    
    - 删  
        - .remove(key)  
            删一个,不存在则返回KeyError
        - .discord(key)  
            删一个,不存在则不报错
        - .pop( )  
            半(伪)随机删除一元素
        - .clear( )  
            清空集合

    - 集合关系  
        - 相等  
            - ==  
        - 是子集  
            - .issbuset( {} )  
            - <=  
            - < #真子集  
        - 是超集  
            - .issuperset( {} )  
        - 无交集  
            - .isdisjoint( {} )  

    - 集合运算  
        返回新集合对象
        
        - 取交集  
            - .intersection( {} )  
            - {} & {}  
        - 取并集  
            - .union( {} )  
            - {} | {}  
        - 取差集  
            A集合减去AB交集  
            - .difference( {} )  
            - {} - {}  
                
        - 取对称差集  
            A与B差集的并集
            - .symmetric_difference( {} )  
            - {} ^ {}  
                
    - 集合生成式  
        - ={公式 for i in 可迭代}  
            
    
    - 空集合  
        - set_=set( )  
            - 不可用 set_={ }


### 序列
- 序列解包  
    
    - a,b,c=可迭代对象  
        - for key, value in aDict.items():  
            
    
    - a,*other,c=可迭代对象  
        *_name 为不定数量列表


---

## 05.类

---

Author : orgaworl@outlook.com
Github : [orgaworl/Course-Notes: SDU CyberScience (github.com)](https://github.com/orgaworl/Course-Notes)
Create: `2024-06-18` `20:22`
