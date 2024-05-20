## P

```shell

set disassembly-flavor intel
disas main


break *0x0000555555555298
run
set ((char*)answer)[0]=65
p answer[0]
set ((char*)answer)[1]=65
set $var1=$var2
continue

65 67 67 66 68 65 65 68 66 66 
```



## Syntax
### 反汇编

```shell
disas symbol
```

### 内存读取

```shell
examine命令: x/<n/f/u>  <addr> #查看内存地址中的值
n:显示的内存单元的个数
f:内存内容的输出格式:
	s 对应输出字符串
    x 按十六进制格式显示变量。
    d 按十进制格式显示变量。
    u 按十六进制格式显示无符号整型。
    o 按八进制格式显示变量。
    t 按二进制格式显示变量。
    a 按十六进制格式显示变量。
    c 按字符格式显示变量。
    f 按浮点数格式显示变量。
u:内存单元字节数,数字形式/字符形式
	b=1 byte, 
	h=2 bytes,
	w=4 bytes,
	g=8 bytes.
<addr>:表示内存地址。
```

### 运行

```shell
#运行程序，当遇到断点后，程序会在断点处停止运行，等待用户输入下一步的命令。
run/r     

#退出gdb
quit/q 
```

```shell
#继续执行，到下一个断点处（或运行结束）
continue/c 次数

#单步跟踪程序，当遇到函数调用时不进入此函数体
next/n

#单步跟踪程序, 如果有函数调用则进入函数
step/s

#可以运行程序直到退出循环体。
until
# 运行至某行
until+行号 

#运行直到当前函数完成返回，并打印函数返回时的堆栈地址和返回值及参数值等信息。
finish  

#函数(参数)：调用程序中可见的函数，并传递“参数”，如：call gdb_test(55)
call    

```

### 断点break (b)

```shell
break n        #在第n行处设置断点
break OAGUPDATE.cpp:578
break funcSymbol    #在函数func()的入口处设置断点，
break *addr    # 在某条指令处停止

tb #临时断点
b fn1 if a＞b：条件断点设置
delete n  # 删除第n个断点
disable n # 暂停第n个断点
enable n  # 开启第n个断点
clear n   # 清除第n行的断点

info  b （info breakpoints）#显示当前程序的断点设置情况
delete breakpoints  # 清除所有断点：
```


### 检查查看

```shell
# 栈帧
backtrace/bt

#堆栈
frame/f



```

```shell
print/p # 表达式
display 表达式 #在单步运行时有用，使用display命令设置一个表达式后，它将在每次单步进行指令后，紧接着输出被设置的表达式及值。
watch 表达式 #设置一个监视点，一旦被监视的“表达式”的值改变，gdb将强行终止正在被调试的程序。
whatis #查询变量或函数
list #显示源代码
info function #查询函数
info locals # 显示当前堆栈页的所有变量
```

### 数值修改

```shell
# 修改寄存器
set $reg=value

# 修改变量
set ((char*)&var)[i]=val

# 修改内存


```

### 程序流修改
```shell
# 结束当前函数并返回指定值
return val

#将程序执行流跳转到指定行或地址
j addr

#修改进程
thread

```



```shell
where/bt ：当前运行的堆栈列表；

up/down 改变堆栈显示的深度

set args 参数:指定运行时的参数

show args：查看设置好的参数

info program： 来查看程序的是否在运行，进程号，被暂停的原因。
```


---
author email: orgaworl@outlook.com