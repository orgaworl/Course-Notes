---
tags:
---

## 0. 例

```shell
// 编译命令
cmake .
make
```

- 手动指定文件
```cmake
//CMakeLists.txt
cmake_minimum_required (VERSION 2.8)
project (demo)
add_executable(main main.c testFunc.c)
```

- 自动选定所有文件
```cmake
cmake_minimum_required (VERSION 2.8)
project (demo)
aux_source_directory(. SRC_LIST) //将本目录所有源代码添加
add_executable(main ${SRC_LIST})
```

- 半自动选定文件
```cmake
cmake_minimum_required (VERSION 2.8)
project (demo)
set( SRC_LIST
	 ./main.c
	 ./testFunc1.c
	 ./testFunc.c)
add_executable(main ${SRC_LIST})
```

- 分文件夹编写
```cmake
cmake_minimum_required (VERSION 2.8)
project (demo)
include_directories (test_func test_func1)
aux_source_directory (test_func SRC_LIST)
aux_source_directory (test_func1 SRC_LIST1)

add_executable (main main.c ${SRC_LIST} ${SRC_LIST1})
```




---
## 1. 语法

```cmake
// 基础信息
cmake_minimum_required (VERSION 2.8)
project (demo)
//包含文件夹
include_directories (dirPath)

// 手动选定源代码文件到变量中
set( SRC_LIST func1.c func2.c func3.c)
//将文件夹中源代码名保存到变量中
aux_source_directory (dirPath SRC_LIST)

// 设置编译选项
option(MYDEBUG "enable debug compilation" OFF)
if (MYDEBUG)
    add_executable(main2 main2.c)
else()
    message(STATUS "Currently is not in debug mode")    
endif()

//提示
message("str")


// 添加编译选项
add_compile_options(-std=c++11 -Wall) 
// 添加编译所需所有文件
add_executable (main main.c ${SRC_LIST} ${SRC_LIST1})
```

常用环境变量
```cmake
${EXECUTABLE_OUTPUT_PATH} // 编译输出 
${PROJECT_SOURCE_DIR}     // 本路径
${} //

```
---
## 2. 程序文件结构

0. 一般结构
- CMakeLists.txt
- bin
- build
- include
	- func1.h
	- func2.h
- src
	- CMakeLists.txt
	- main.cpp
	- func1.cpp
	- func2.cpp

1. 两个cmake文件结合

```cmake
// CMakeLists.txt
cmake_minimum_required (VERSION 2.8)
project (demo)
add_subdirectory (src)
```

```cmake
// src/CMakeLists.txt
include_directories (../include)
aux_source_directory (. SRC_LIST)
add_executable (main ${SRC_LIST})
set (EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
```

```shell
// 编译命令 (Makefile在build目录下生成)
cd build 
cmake ..
make
```

2. 单独使用一个cmake文件
```cmake
cmake_minimum_required (VERSION 2.8)
project (demo)

// 添加编译结果存放路径
set (EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
// 添加头文件存放路径
include_directories (include)
// 添加源代码路径到变量
aux_source_directory (src SRC_LIST)
// 选定源代码编译
add_executable (main ${SRC_LIST})

```

---
