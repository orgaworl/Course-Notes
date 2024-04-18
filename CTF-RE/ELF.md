

# Struct

- ELF Header

- Program-head-table
  
  链接后存在

- Sections
  
	- .text(只读)
  
	- .data
  
	 - .bss
    
	    未初始化局部静态变量编译时一定存放在 .bss 节中
	    
	    未初始化全局变量编译时不一定存放在 .bss 节中.
  
	- .rodata(只读)
  
	- .comment 编译器版本信息字符串
  
	- .dynamic 动态链接信息
  
	- .symtab 符号表
		- Elf32_Sym数组, 每个元素对应一个符号, 第一个元素无效.
		- 符号值st_value: 函数或变量地址

- Section-head-table 描述所有节的属性
	- 有n个节描述符 Elf32_Shdr,其中第一个为无效节描述符,共(n-1)个有效节.

- String table
	- .strtab 字符串表 : 保存普通字符串
	- .shstrtab 节头字符串表 : 保存节头表中用到的字符串(如, 节名)
- Symbol table
- Relocation table
	- 每个需要重定位的代码节或数据节都需要单独的重定位节
	- .rel.text
	- .rel.*

# 空间占用

1. 链接文件

2. 可执行文件

3. 展开到内存中执行
   
   
