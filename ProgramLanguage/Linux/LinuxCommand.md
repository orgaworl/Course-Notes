# Linux

---


---
## 二进制分析

```shell
file     //查看文件类型

objdump  //反汇编
	-d [obj.o]
	-M intel
	-s --section [sectionName]

strip
	--strip-all //剥离所有符号

readelf  // 查看elf文件内容
	-s   // 查看符号表
	-h   // 查看头

nm [file] // 查看符号表
	-D --demangle 

ldd [file] //查看程序依赖库文件

xxd [file] // 查看16进制数据

strace [program] //追踪系统调用
ltrace [program] //追踪库调用

```


---
## 一般命令

## I/O

read
```shell

grep ['str'] [file] //过滤输入
string [file]       //查找字符串
head [file] [-c offset] [-n lineN] //查看前10行(默认)
tail [file] [-c offset] [-n lineN] //截取偏移值以后的内容

tar
   -c – 创建一个新的 .tar 压缩文件。
   -x – 从 .tar 压缩文件中提取文件。
   -f – 指定存档文件名，而不是 stdin/stdout。
   -v – 显示归档文件的详细输出。
   -z – 使用 gzip 压缩或解压缩压缩包。

tar -cvzf images.tar.gz /home/user/images


```

```


## Sys
```shell
su
su - # 获得root环境变量

stat <path> # 查看文件inode信息

ls -i #查看节点号
ls -s #查看占用块数
ls -l #查看权限
```

```shell
sudo ln -sf /bin/zsh /bin/sh
chsh 
printenv
env
export
unset
```
---