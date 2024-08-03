
### 基本模块
- asm 汇编与反汇编，支持x86/x64/arm/mips/powerpc等基本上所有主流平台
- dynelf 用于远程符号泄露，需要提供leak方法
- elf 对elf文件进行操作
- gdb 配合gdb进行调试
- memleak 用于内存泄露
- shellcraft shellcode生成器
- tubes 包括tubes.sock, tubes.process, tubes.ssh, tubes.serialtube，分别适用于不同场景的PIPE
- utils 一些实用的小功能，例如CRC计算，cyclic pattern等

### Quick Start
```python
from pwn import * 
context(os='linux', arch='amd64', log_level='debug')
context.arch = 'amd64'
context.arch      = 'i386'
context.log_level = True
context.log_level='debug'
context.os        = 'linux'
context.endian    = 'little'
context.word_size = 32
#context是pwntools用来设置环境的功能。在很多时候，由于二进制文件的情况不同，我们可能需要进行一些环境设置才能够正常运行exp，比如有一些需要进行汇编，但是32的汇编和64的汇编不同，如果不设置context会导致一些问题。

io=process("path")
io=remote("ip",port)

shellcode = asm(shellcraft.sh()) #pwntools自动生成shellcode


io.send("data")
io.sendline("data")
io.sendlineafter("string",shellcode)

data=io.recv(numb,timeout)
data=io.recvall()
data=io.recvline(timeout=1)
data=io.recvuntil("string")
data=io.recvrepeat(timeout)

data=io.readline()

io.interractive()
io.close()

#智能转换
u8(data)
u32(data)
p32(data)
p64(data)
int(num,16)


shell = ssh('bandit0', 'bandit.labs.overthewire.org', 
			 password='bandit0', port=2220)
shell['whoami']
shell.download_file('/etc/motd')
sh = shell.run('sh')
sh.sendline('sleep 3; echo hello world;') 
sh.recvline(timeout=1)
sh.recvline(timeout=5)
shell.close()
```


### 导入

```python
from pwn import *

p = process('')
p = remote('8.8.8.8', 8888)

l=listen()
r=remote('localhost',l.host)
c=l.wait_for_connection()

ssh()
```

### 汇编与反汇编

```python
asm('instruction')
asm('nop', arch='arm')          #汇编指令转化为字节数据
disaasm('bytes'.decode('hex'))  #字节数据转化为汇编指令
disaasm(bytes)
```

##### shellcode

```python
shellcraft.sh()
shellcraft.i386.linux.sh()
shellcraft.amd64.linux.sh()
asm(shellcraft.nop())
```

### ELF
分析EFL中信息
```python
elf = ELF('')
# 或者
p = process('')
elf = p.elf

# 文件装载地址
elf.address
# 符号表
elf.symbols
# GOT表
elf.got
# PLT表
elf.plt
```

### pack与unpack

```python
# 将数据解包
u32()
u64()
# 将数据打包
p32()
p64()
```

### Cyclic

在栈溢出的时候可以方便计算偏移

```python
# 生成一个0x100大小的字符串
cyclic(0x100)
cyclic_find(0x12345678)
cyclic_find('abcd')
```

> 这里因为当存在栈溢出，而我们输入的数据比较大时，就会覆盖栈底指针以及返回地址，所以当使用这个工具进行计算时，因为覆盖了返回地址导致程序跳转失败，所以跳转的地址就是字符串对应的位置，这就是cyclic_find(0x12345678)的原理。

### Context

```python
# 环境设置
context(os='linux', arch='amd64', log_level='debug')
# 或者
context.log_level = 'debug'
context.arch = 'i386'
...
```

1. os设置系统为linux
2. arch设置架构为amd64，可以简单的认为设置为64位的模式，对应的32位模式是’i386’
3. log_level设置日志输出的等级为debug，这样pwntools会将完整的io过程都打印下来，使得调试更加方便

### gdb

```python
from pwnlib import *
# 打开调试进程，并设置断点
pwnlib.gdb.debug('./human', 'b *main')

# 附加调试进程p
pwnlib.gdb.attach(p)
```

### IO交互

```python
send(payload)	# 发送payload
sendline(payload) # payload + 换行\n
sendafter(string, payload) # 接收到指定string后发送payload
recvn(n) # 接收n个字符
recvline() # 接收一行输出
recvlines(n) # 接收n行输出
recvuntil(string) # 接收到指定string为止

interactive() # shell式交互
```



### rop

```python
elf = ELF('./proc')
rop = ROP(elf)
# 第一个参数是需要call的函数或地址，第二个为函数参数
rop.call('read', (0, elf.bss(0x80)))
rop.dump()
```


