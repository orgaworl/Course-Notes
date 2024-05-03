---
tags:
  - 编程语言
  - 汇编语言
  - 物理机运行
  - 编译
---
---
## 1. 基础语法

```assembly

xchg dst1,dst2
cmp src1,src2  ;根据 src1-src2 设置状态标志位
test src1,src2 ;根据 src1&src2 设置状态标志位
syscall        ;进入内核执行系统调用
int 0x80       ;x86-32 系统调用
jmp addr       ;无条件跳转
call addr      ;将返回地址压入栈中,调用函数
ret            ;从栈上弹出返回地址,并跳转
lea dst,src    ;将内存地址加载到dst
nop            ;空指令



; 条件跳转, 基于状态寄存器进行跳转
je  ;等于
ja  ;无符号数大于
jb  ;无符号数小于
jg  ;有符号大于
jl  ;有符号小于
jge ;有符号大于等于
jle ;有符号小于等于 
js  ;结果为负



```


---
## 2. 流程控制

- IF-ELSE
	```assembly
			cmp 
			jmp to addr2: else condition	
	addr1:     
			...                                ; ifDoBlock
			jmp to addr3: no condition
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
## 3. 函数调用

- **执行系统调用**
	- rax 保存系统调用号
	- rdi 文件描述符
	- rsi 缓冲区地址
	- rdx 读取字节数


- **函数调用**
	```assembly
	;保存参数
	mov rdi,para1
	mov rsi,para2
	mov rdx,para3
	mov rcx,para4
	mov r8,para5
	mov r9,para6
	push para9
	push para8
	push para7


	call ; 返回地址eip入栈,跳转到函数地址

	```

- **函数运行**
	- x86-64 linux: 函数的前六个参数分别保存在rdi, rsi, rdx, rcx, r8, r9 中.
	- 超过6个以上的参数以逆序保压入栈中.
	- rbx 和 r12-r15 需要保存和恢复
	```assembly
	; 序言
	push rbp     ; 保存原rbp入栈
	mov rbp,rsp  ; 保存新rbp
	...          ; 保存r12-r15寄存器

	sub rsp,0x10 ; 在栈区分配空间
	...          ; 将参数保存到栈上
	...          ; 再次调用函数


	...          ; 恢复r12-r15寄存器

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
