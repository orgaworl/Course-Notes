---
tags:
  - 编程语言
  - 汇编语言
  - 物理机运行
  - 编译
---
---
## 0.  基础

汇编程序组成:
- 指令 instruction
- 伪指令 directive
	- 告知编译器生成特定数据并放置在特定节.
	- 定义某个类型的值; 将内容放入某个节;
	- `.type value`
- 标号label
	- 引用的指令或数据的符号名称
	- `sym: .type value`
	- `sym:`
- 注释 comment
```
; 定义section
.section .data
.string "%d %d %.2f %0.2f %c %d\n"
.global main



```


语法
- AT&T
- intel

---
## **1. 寄存器**
### 通用寄存器

8个通用, ESP保存当前 Stack 的地址.

| 8+8bit | ah+al | bh+bl | ch+cl | dh+dl | +spl | +bpl | +Sil | +Dil |
| ------ | ----- | ----- | ----- | ----- | ---- | ---- | ---- | ---- |
| 16bit  | ax    | bx    | cx    | dx    | sp   | bp   | si   | di   |
| 32bit  | eax   | ebx   | ecx   | edx   | esp  | ebp  | esi  | edi  |
| 64bit  | rax   | rbx   | rcx   | rdx   | rsp  | rbp  | rsi  | rdi  |
| 作用     | 累加    | 基址    | 计数    | 数据    | 栈指针  | 基址指针 | 源地址  | 目的地址 |

| r8l-r15l |
| -------- |
| r8w-r15w |
| r8d-r15d |
| r8-r15   |
| 通用       |

新指令级中使用的寄存器是旧寄存器的超集. 
在新指令级中使用旧寄存器可以访问新寄存器固定范围的位.
r8-r15 只在x86-64中出现, x86-32中不存在.
为32bit寄存器赋值, 会清空64bit寄存器中其他位, 而为16/8 bit寄存器赋值则不会.

### 非通用寄存器

| 16bit | ip  |       |     |
| ----- | --- | ----- | --- |
| 32bit | eip | eflag |     |
| 64bit | rip | rflag |     |
| 作用    |     |       |     |

rip 寄存器
- 始终指向下一条指令地址, 由CPU自动设置
- 在x86-64下可以读取指令指针的值, x86-32下则不可.

rflag 标志寄存器
- 用以比较和条件分支


---
## 2. 指令

**指令格式**
x86 ISA使用变长指令, 长度为1-15字节.
指令可以从任意地址内存开始, CPU不强制对代码进行对齐, 但编译器经常会对代码进行对齐以优化指令性能.

**指令组成(原理性)**
指令组成:
- Prefix 可以修改指令行为
- Opcode是指令类型的主要标识符
- AddrMode 字节表示指令操作类型
- SIB 和 Displacement 表示内存操作数
- Imm 表示常量数值

| 前缀     | 操作码    | 操作数             | 操作数      | 操作数          | 操作数       |
| ------ | ------ | --------------- | -------- | ------------ | --------- |
| prefix | Opcode | Addressing mode | SIB byte | Displacement | Immediate |
| 0-4 B  | 1-3 B  | 0-1             | 0-1      | 0/1/2/4 B    | 0/1/2/4 B |


![[Pasted image 20240623192731.png]]

**指令操作数**

隐式操作数: 部分指令的某些操作数是固定值, 因此省略.

一般操作数分类:
- 寄存器操作数
- 立即数
	- x86 以小端格式编码, 补码表示有符号整数
- 内存操作数
	- 取内存大小
		- DWORD => 4B
		- WORD => 2B
	-  $[base+index*scale+displacement]$
		- base 和 index 为64bit寄存器
		- scale 为1/2/4/8
		- displacement 为 32bit 常量/符号
		- base,index,scale 编码在SIB中, Displacement 编码在Displacement.
	- x86 ISA最多仅支持一个显示内存操作数, 对内存和内存进行操作时使用寄存器做中间存储.
	- 可以将rip作为内存操作数base, 借助rip进行相对寻址


```assembly
mov     ebx,0ffh             
lea     eax,[ebx+ecx]        
sub     eax,[ebx+ecx*4h-20h] 
mov     DWORD PTR [rbp-8], 1
```
 
 
 **Cast Operator（Intel）**
- `PTR`，表示指针，pointer的简写。
- `BYTE`: 字节，8位。
- `WORD`: 字，2bytes，16位（8086的word只有16bit，沿用至今）
- `DWORD`: 双字，4bytes，32位
- `QWORD`: 8bytes，64位
- `XMMWORD`：16bytes，128位


### 2.1. 基础指令

#### 指令格式

```
mnemonic destination, source
助记符 操作数1,操作数2
```

#### 复杂指令

**1. `push`压栈**
先令`esp`自减, 再将寄存器中数据放入.


**2. `pop`**
将栈顶数据读入寄存器，`esp`自增

**3. `call`指令用来调用函数**
将返回地址压入栈中, 跳转到新指令地址.
其他操作均由被调用函数进行: 
- 保存原栈帧地址
- 创建新栈帧
- 保存寄存器
- 恢复寄存器

**`4.enter`**
等价于
```
push rbp
mov rbp,rsp
```

**5. `ret`**
终止当前函数的执行，将运行权交还给上层函数, 当前函数的帧将被回收.

弹出返回地址并跳转到该地址.
等价于
```
mov rsp,rbp
pop rbp
```

**6. `cmp`**
根据**减运算**结果在**标志寄存器**中设置**状态标志位**.
标志寄存器:
- rflags
- CF 进位数据
- ZF 结果为0
- SF 结果为负数
- OF 溢出

**7. `test`**
根据**按位与**运算结果设置状态标志位.



#### 一般指令

```assembly
; 数据移动
mov
push
pop
lea dst,src    ;将内存地址加载到dst,即dst=&src

; 运算
add
sub         
inc           ; ++
dec           ; --
mul           ;无符号乘法
imul          ;有符号数乘
idiv          ;有符号除法
and
or
xor
not
neg           ;求补码

shl           ;逻辑左移
sal           ;算数左移
rol           ;循环左移
shr           ;逻辑右移
sar           ;算数右移
ror           ;循环右移


;其他
xchg dst1,dst2 ;交换两个寄存器值
syscall        ;进入内核执行系统调用
int 0x80       ;x86-32 系统调用
nop            ;空指令


;控制流
jmp addr       ;无条件跳转
call addr      ;将返回地址压入栈中,调用函数
ret            ;从栈上弹出返回地址,并跳转
cmp src1,src2  ;根据 src1-src2 设置状态标志位
test src1,src2 ;根据 src1&src2 设置状态标志位

; 条件跳转, 基于状态寄存器进行跳转
jz  ;为零, 设置ZF零标志位则跳转
je  ;等于, 同jz
ja  ;无符号数大于
jb  ;无符号数小于
jg  ;有符号大于
jl  ;有符号小于
jge ;有符号大于等于
jle ;有符号小于等于 
js  ;结果为负
jnz ;结果非0

```



---
### 2.2. 流程控制

- IF-ELSE
	```assemby
			cmp 
			jmp addr2: else condition	
	addr1:     
			...                                ; ifDoBlock
			jmp addr3
	addr2:     
			...                                ; elseDoBlock
	addr3:
	```

- WHILE
	```assembly
			jmp to addr2
	addr1:
			...                                ;whieDoBlock
	addr2:
			cmp
			jmp to addr1:condition
	addr3:

	```
- FOR
- SWITCH



---
### 2.3. 函数调用

- **执行系统调用**
	- rax 保存系统调用号
	```
	mov eax,0xee ;系统调用号
	int 0x80     ;使用中断号 0x80 触发系统调用
	```

- **函数调用**
	```assembly
	; x86_64下
	; 保存参数(寄存器+内存方法)
	mov rdi,para1
	mov rsi,para2
	mov rdx,para3
	mov rcx,para4
	mov r8,para5
	mov r9,para6
	push para9
	push para8
	push para7
	; 可以不使用寄存器,将所有参数反序压入栈中.

	call ; 返回地址eip入栈,跳转到函数地址

	```

- **函数运行**
	- x86-64 linux: 函数的前六个参数分别保存在rdi, rsi, rdx, rcx, r8, r9 中.
	- 超过6个以上的参数以逆序保压入栈中.
	- rbx 和 r12-r15 需要保存和恢复
	```assembly
	; 序言
	; 创建栈帧
	push rbp     ; 保存原rbp入栈
	mov rbp,rsp  ; 保存新rbp
	...          ; 保存ebx、r12-r15寄存器

	; 函数体
	sub rsp,0x10 ; 在栈区分配空间
	...          ; 将局部变量保存到栈上

	...          ; 恢复rbx、r12-r15寄存器
	; 尾声
	mov eax,0x00 ; 设置函数返回值
	leave        ; 恢复栈指针rsp和帧指针rbp
	ret          ; 自动弹出返回地址eip并跳转
	```



- 以main函数启动为例
	```assembly
	; 创建序言
	push rbp                     ; 保存rbp
	mov rbp,rsp                  ; 栈帧
	sub rsp,0x10                 ; 在栈区分配空间, 为参数分配空间
	mov DWORD PTR [rbp-0x04],edi ; 保存 argc
	mov QWORD PTR [rbp-0x10],rsi ; 保存 argv[]
	...                          ; 函数体
	mov eax,0x0                  ; 设置返回值
	leave                        ; 恢复栈指针rsp和帧指针rbp
	ret                          ; 自动弹出返回地址eip并跳转
	```

### 2.4 系统调用



#### Linux下系统调用分析

系统调用的不同方式
- x86-64中默认使用`syscall` ,在32bit下无法使用
- 历史遗留方式 `int 0x80`
- x86-32中常用  `sysenter`


| 架构     |         |          |          |
| ------ | ------- | -------- | -------- |
| x86_64 | syscall | 不支持      |          |
| x86_32 | syscall | int 0x80 | sysenter |


```assembly
; read 为例
mov rax,<symCallNum=0>  ;系统调用号
mov rdi,<fileDescr>   ;文件描述符
mov rsi,<bufferAddr>  ;缓冲区地址
mov rdx,<bytesNum>    ;读取的字节数
syscall
```


不同架构下系统调用的差别
![[Pasted image 20240604175717.png|600]]

x86_64 中系统调用参数与函数调用参数所使用的寄存器完全相同。





