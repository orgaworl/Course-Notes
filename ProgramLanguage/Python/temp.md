---
date created: 2024-09-27 23:42
---

## 01.基础

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

- 脚本之 **name** 属性

	- 作为模块 ,则 *name*_=moudleName

		- 作为脚本独立运行,则 _*name*="**main**"

- [-5,256]间的int类型也适用于驻留机制


