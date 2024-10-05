---
title: Title
subtitle: Subtitle
layout: post
author: orgaworl
header-style: text
tags:
  - default-tag
date updated: 2024-09-14 11:40
---
## 架构

### 组成
- chromium
- Node.js 实现本地文件访问
- 集成
	- html
	- js

### 核心
- 多个渲染进程
- *渲染进程通过IPC与主进程通信*
- 单个主进程
- *主进程通过 Native apis 与操作系统通信*
- 操作系统

主进程作为中转核心, 只有主进程可以进行GUI的API操作


## 核心工作流程




## References

