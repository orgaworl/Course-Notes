# P

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





# Syntax

检查

```shell
examine命令: x/<n/f/u>  <addr> #查看内存地址中的值
n:是正整数，表示需要显示的内存单元的个数，即从当前地址向后显示n个内存单元的内容，一个内存单元的大小由第三个参数u定义。
f:表示addr指向的内存内容的输出格式，s对应输出字符串，此处需特别注意输出整型数据的格式：
    x 按十六进制格式显示变量。
    d 按十进制格式显示变量。
    u 按十六进制格式显示无符号整型。
    o 按八进制格式显示变量。
    t 按二进制格式显示变量。
    a 按十六进制格式显示变量。
    c 按字符格式显示变量。
    f 按浮点数格式显示变量。
u:就是指以多少个字节作为一个内存单元,可以写数字形式或字符形式
b=1 byte, h=2 bytes,w=4 bytes,g=8 bytes.
<addr>:表示内存地址。
```

运行

```shell
run/r          #运行程序，当遇到断点后，程序会在断点处停止运行，等待用户输入下一步的命令。
continue/c #继续执行，到下一个断点处（或运行结束）
next/n       #单步跟踪程序，当遇到函数调用时，也不进入此函数体；此命令同 step 的主要区别是，step 遇到用户自定义的函数，将步进到函数中去运行，而 next 则直接调用函数，不会进入到函数体内。
step/s  #单步调试如果有函数调用，则进入函数；与命令n不同，n是不进入调用的函数的
until    #当你厌倦了在一个循环体内单步跟踪时，这个命令可以运行程序直到退出循环体。
until+行号 # 运行至某行，不仅仅用来跳出循环
finish  #运行程序，直到当前函数完成返回，并打印函数返回时的堆栈地址和返回值及参数值等信息。
call    #函数(参数)：调用程序中可见的函数，并传递“参数”，如：call gdb_test(55)
quit/q #退出gdb
```

断点break (b)

```shell
break n        #在第n行处设置断点
break OAGUPDATE.cpp:578
break func    #在函数func()的入口处设置断点，
break addr    # 在某条指令处停止
b fn1 if a＞b：条件断点设置
delete n  # 删除第n个断点
disable n # 暂停第n个断点
enable n  # 开启第n个断点
clear n   # 清除第n行的断点
info  b （info breakpoints）#显示当前程序的断点设置情况
delete breakpoints  # 清除所有断点：
```

查看

```shell
print/p # 表达式
display 表达式 #在单步运行时有用，使用display命令设置一个表达式后，它将在每次单步进行指令后，紧接着输出被设置的表达式及值。
watch 表达式 #设置一个监视点，一旦被监视的“表达式”的值改变，gdb将强行终止正在被调试的程序。
whatis #查询变量或函数
info function #查询函数
info locals # 显示当前堆栈页的所有变量
```

修改

```shell
set $reg=value

set ((char*)&var)[i]=val
```

```shell
where/bt ：当前运行的堆栈列表；
bt backtrace 显示当前调用堆栈
up/down 改变堆栈显示的深度
set args 参数:指定运行时的参数
show args：查看设置好的参数
info program： 来查看程序的是否在运行，进程号，被暂停的原因。
```
