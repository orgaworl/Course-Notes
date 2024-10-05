---
tags:
  - 编译
  - 跨平台
  - default-tag
date updated: 2024-09-14 11:40
title: CMake的基础使用
subtitle: 语法与文件结构
layout: post
author: orgaworl
header-style: text
---

## 0. 示例

在命令行中调用`CMake`

```shell
cd build
cmake ..
make
```

编写`CMakeList.txt`:

- 手动指定文件

	```python
	cmake_minimum_required (VERSION 2.8)
	project (demo)
	add_executable(main main.c testFunc.c)
	```

- 自动选定所有文件

	```python
	cmake_minimum_required (VERSION 2.8)
	project (demo)
	aux_source_directory(. SRC_LIST) //将本目录所有源代码添加
	add_executable(main ${SRC_LIST})
	```

- 半自动选定文件

	```python
	cmake_minimum_required (VERSION 2.8)
	project (demo)
	set( SRC_LIST
		 ./main.c
		 ./testFunc1.c
		 ./testFunc.c)
	add_executable(main ${SRC_LIST})
	```

- 分文件夹编写

	```python
	cmake_minimum_required (VERSION 2.8)
	project (demo)
	include_directories (test_func1 test_func2) # 添加.h文件
	aux_source_directory (test_func1 SRC_LIST1) # 添加源文件组1
	aux_source_directory (test_func2 SRC_LIST2) # 添加源文件组2

	# 编译可执行文件
	add_executable (main main.c ${SRC_LIST1} ${SRC_LIST2}) 
	```

---

## 1. 语法

### 基础信息

```python
# 基础信息
cmake_minimum_required (VERSION 2.8)  # 指定CMake最低版本
project (project_name language)       # 项目名称+编程语言
set(CMAKE_CXX_STANDARD 11)            # CPP 版本
set(CMAKE_CXX_STANDARD_REQUIRED ON)
```

### 库依赖与链接

```python
# 自动检测外部库
find_package(<packName> <version> REQUIRED PATHS <path>)

#设置包含目录和链接目录：
include_directories(${<packName>_INCLUDE_DIRS})
link_directories(${<packName>_LIBRARY_DIRS})

# 链接
target_link_libraries(<target>  <libraries>...)
```

### 添加源文件与编译

**添加源文件**

```python

# 添加头文件路径
include_directories (${PROJECT_SOURCE_DIR}/include)

# 手动选定源代码文件到变量中
set( <SRC_LIST> func1.c func2.c func3.c) # var<-

# 将文件夹中源代码名保存到变量中
aux_source_directory (<dirPath> <SRC_LIST>) # ->var

# 添加子目录  
add_subdirectory(<srcPath>)

```

**构建目标**

```python
# 编译为库文件,
add_library(<libName> <STATIC> <source_files>...)
set_target_properties(<libName> PROPERTIES COMPILE_DEFINITIONS "DEBUG")

#  编译为可执行文件, 指定生成的可执行文件和源文件
add_executable (<main> <source_files>...)
set_target_properties(<main> PROPERTIES COMPILE_DEFINITIONS "RELEASE")

```

- 可同时定义多个构建目标, 每个目标可以有不同的构建设置和选项。

### 编译控制

#### **常规变量**

```python
# 设置常规变量
set(<variable> <value> ...)

# 取消常规变量
unset(<variable>)

# 使用 ${<variable>} 语法进行引用。
${<variable>}
```

#### 环境变量

修改设置环境变量

```python
set(<var> <val>)
```

环境变量

```cmake
PROJECT_NAME # 项目名称
CMAKE_CXX_STANDARD     # CPP标准
EXECUTABLE_OUTPUT_PATH # 编译输出 

# 工程编译发生的目录: 
CMAKE_BINARY_DIR
PROJECT_BINARY_DIR
<projectname>_BINARY_DIR

# 源文件
CMAKE_SOURCE_DIR
PROJECT_SOURCE_DIR
<projectname>_SOURCE_DIR

#当前处理的CMakeLists.txt 所在的路径。
CMAKE_CURRENT_SOURCE_DIR
CMAKE_CURRENT_BINARY_DIR
#如果是内部编译,它跟 CMAKE_CURRENT_SOURCE_DIR 一致
#如果是外部编译,他指的是 target 编译目录。
#使用我们上面提到的 ADD_SUBDIRECTORY(src   bin)可以更改这个变量的值。
#使用 SET(EXECUTABLE_OUTPUT_PATH    <新路径>) 并不会对这个变量造成影响,它仅仅修改了最终目标文件存放的路径。


```

#### 编译流程控制

```python

# 设置编译选项
option(MYDEBUG "enable debug compilation" OFF)
if (MYDEBUG)
    add_executable(main2 main2.c)
else()
    message(STATUS "Currently is not in debug mode")
endif()


# 提示
message("str")


# 添加编译选项
add_compile_options(-std=c++11 -Wall)
```

`message`函数，分为三个消息类型：

- FATAL_ERROR（致命错误）
- WARNING（警告）
- STATUS（正常）

---

## 2. 工程文件结构

### 一般结构

- CMakeLists.txt
- bin
- lib
- build
- include
	- func1.h
	- func2.h
- src
	- CMakeLists.txt(可选)
	- main.cpp
	- func1.cpp
	- func2.cpp

### 单独使用一个cmake文件

```cmake
cmake_minimum_required (VERSION 2.8)
project (demo)

# 添加编译结果存放路径
set (EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
# 添加头文件存放路径
include_directories (include)
# 添加源代码路径到变量
aux_source_directory (src SRC_LIST)
# 选定源代码编译
add_executable (main ${SRC_LIST})

```

### 两个cmake文件结合

```python
# CMakeLists.txt
cmake_minimum_required (VERSION 2.8)
project (demo)
add_subdirectory (src)
```

```python
# src/CMakeLists.txt
include_directories (../include)
aux_source_directory (. SRC_LIST)
add_executable (main ${SRC_LIST})
set (EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
```

```shell
#  编译命令 (Makefile在build目录下生成)
cd build 
cmake ..
make
```

## 3. CMake调用

### 基础

```shell
#  指定生成器
cmake -G "Ninja" ..

# 指定构建类型
cmake -DCMAKE_BUILD_TYPE=Release ..
```

### 跨平台编译

### 交叉编译

## Reference

[^1]:[CMake 教程 | 菜鸟教程 (runoob.com)](https://www.runoob.com/cmake/cmake-tutorial.html)
[^2]: [CMake常用变量和常用环境变量 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/603137782)

