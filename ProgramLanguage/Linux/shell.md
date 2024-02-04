# SHELL

## 1. 变量类型

运行shell时，会同时存在三种变量：

* **1) 局部变量** 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
* **2) 环境变量** 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
* **3) shell变量** shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行

```shell
#定义变量无需$
var="hello"
#使用变量需要$,可加 {}帮助辨别界限
echo ${varname}
#删除变量
unset varname
```

## 2. 字符串

不区分 ' 和 " ,

#### 单引号

* 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
* 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

#### 双引号

* 双引号里可以有变量
* 双引号里可以出现转义字符

#### 语法

```shell
#字符串拼接
'str1'str2'
"str1"str2"

#字符串长度
${#string}

#提取子字符串
${string:1:4} #从第二个字符开始截取4个字符.
```

## 3. 数组

```shell
#创建数组
array_name=(value1 value2 ... valuen)
#读取
${array_name[index]}
```

## 4. 流程控制

```shell
#判断
if condition1
then command1
elif condition2 
then command2
else commandN
fi

if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi

#for循环
for var in item1 item2 ... itemN
do
    ...
done

for var in item1 item2 ... itemN; do command1; command2… done;

#while循环
while condition
do
    command
done

#无限循环
while :       #1.
while true    #2
for (( ; ; )) #3


#until循环
until condition
do
    command
done


#case
case var in
val1)
    commands
    ;;
val2)
    commands
    ;;
esac


#跳出循环
break
continue
```

```shell
for i in $(seq $len);      # 遍历序列
for i in $(cat words.txt); # 遍历输出每一行
```

## 5. 运算

 字符串运算

```shell
=  # 字符串比较
+  # 字符串拼接
```

```shell
$(command)   #运行命令
"$(command)" #命令结果转字符串保存
$(($A op $B) #进行运算
"Hello, $(Var) " # 字符串拼接
```

## . 自定义函数

```shell
[ function ] funname [()]
{

    action;
    [return int;]
}
#如果不加return，将以最后一条命令运行结果作为返回值
#函数参数
#在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数
#当n>=10时，需要使用${n}来获取参数
```

## . 输入/输出重定向

| 命令              | 说明                             |
| --------------- | ------------------------------ |
| command > file  | 将输出重定向到 file(覆盖写).             |
| command < file  | 将输入重定向到 file。                  |
| command >> file | 将输出以追加的方式重定向到 file。            |
| n > file        | 将文件描述符为 n 的文件重定向到 file。        |
| n >> file       | 将文件描述符为 n 的文件以追加的方式重定向到 file。  |
| n >& m          | 将输出文件 m 和 n 合并。                |
| n <& m          | 将输入文件 m 和 n 合并。                |
| << tag          | 将开始标记 tag 和结束标记 tag 之间的内容作为输入。 |

## .字符串处理

```shell
echo -n $str #去除换行符输出
${#VarStr}   #字符串计数    
```

```shell
echo $Str | xxd -p #转hex 
```
