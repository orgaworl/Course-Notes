---
tags:
  - cpp
  - gcc
---
---
# 语法

## 编译参数

|   |   |
|---|---|
|-ansi|只支持 ANSI 标准的 C 语法。这一选项将禁止 GNU C 的某些特色， 例如 asm 或 typeof 关键词。|
|-c|只编译并生成目标文件。|
|-DMACRO|以字符串"1"定义 MACRO 宏。|
|-DMACRO=DEFN|以字符串"DEFN"定义 MACRO 宏。|
|-E|只运行 C 预编译器。|
|-g|生成调试信息。GNU 调试器可利用该信息。|
|-IDIRECTORY|指定额外的头文件搜索路径DIRECTORY。|
|-LDIRECTORY|指定额外的函数库搜索路径DIRECTORY。|
|-lLIBRARY|连接时搜索指定的函数库LIBRARY。|
|-m486|针对 486 进行代码优化。|
|-o|FILE 生成指定的输出文件。用在生成可执行文件时。|
|-O0|不进行优化处理。|
|-O|或 -O1 优化生成代码。|
|-O2|进一步优化。|
|-O3|比 -O2 更进一步优化，包括 inline 函数。|
|-shared|生成共享目标文件。通常用在建立共享库时。|
|-static|禁止使用共享连接。|
|-UMACRO|取消对 MACRO 宏的定义。|
|-w|不生成任何警告信息。|
|-Wall|生成所有警告信息|



---