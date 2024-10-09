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

### 核心
- 多个渲染进程
- *渲染进程通过IPC与主进程通信*
- 单个主进程
- *主进程通过 Native apis 与操作系统通信*
- 操作系统

主进程作为中转核心, 只有主进程可以进行GUI的API操作


## 安装
```shell
mkdir rep
cd ./rep
npm init
npm install
npm start
```

## 使用

- `package.json` 记录所有依赖
-  `main.js`主进程
- 

### 生命周期事件
状态:

| 状态                | 触发时间               |
| ----------------- | ------------------ |
| ready             | app初始化完成触发         |
| dom-ready         | 窗口中文本加载完成          |
| did-finsh-load    | 导航完成时触发            |
| closed            | 当窗口关闭时触发, 此时删除窗口引用 |
|                   |                    |
| window-all-closed | 所有窗口都关闭时触发         |
| before-quit       | 关闭窗口前触发            |
| will-quit         | 窗口关闭并且应用退出时触发      |
| quit              | 当所有窗口都关闭时触发        |

- window-all-closed 被监听时, 覆盖默认行为, 需要自定义app行为.
- window-all-closed 被监听时, before-quit will-quit quit 均失效.

```js
app.on("<status>",AnonymousFunction)
app.whenReady().then(CallbackFunction)
```


### 主进程创建窗口(函数)

```js
const {BrowserWindow}=require('electron')
let window=new BrowserWindow({
	title:"title", //与html中title值冲突,去除html中title
	ico:"img",
	transparent:true,
	autoHideMenuBar: true,//隐藏自带menu
	//窗口大小
	x:100,
	y:100,
	width:800,
	height:300,
	minWidth:800,
	show:false, //是否显示
	resizable:true,// 是否允许缩放大小?
	webPreferences:{
		nodeIntegration:true, //允许集成node环境
		enableRemoteModule:true,//是否允许开启remote模块
	}
})
```

资源加载完成后再显示窗口
```js
mainWindow.on('ready-to-show',()=>{
	mainWindow.show()
})
```

#### 渲染进程创建窗口
```shell
npm install --save @electron/remote
```


主进程
```js
const { app, BrowserWindow} = require('electron')
app.on('ready', () => {
  let mainWindow = new BrowserWindow({
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,   
    }
  })
  require('@electron/remote/main').initialize()
  require("@electron/remote/main").enable(mainWindow.webContents)
})
```

渲染进程
```js
const {BrowserWindow}=require('@electron/remote')
```

### 触发事件
对于`index.html`中可能触发的事件, 在`index.js`中进行实现.

```js
window.addEventListener('DOMContentLoaded',()=> {
	// 获取元素
	const obj=document.getElementById('id')
	const obj=document.getElementByClassName('class')[index]
	const obj=document.getElementByTagName('tag')[index]
	//监听行为
	obj.addEventListener('click',()=>{
		
	})
})
```

## API
```js
window.addEventListener('DOMContentLoaded',()=> {
	let winObj=getCurrentWindow()
	winObj.isMaximizable()
	winObj.minmize()
	winObj.maxmize()
	winObj.close()

	// 设置窗口关闭前执行操作, 返回值决定是否关闭该窗口
	
	window.onbeforeunload=function(){
		if(){
			// 使用该方法关闭窗口, 否则会无限循环
			mainWin.destroy() 
		}
		
		return false
	}
})
```

### 实现弹窗
```js
  window.onbeforeunload = function () {
    let close_window = document.getElementsByClassName("close-window")[0];
    close_window.style.display = "block";
    let yes_option = close_window.getElementsByClassName("close-button")[0];
    let no_option = close_window.getElementsByClassName("close-button")[1];

    yes_option.addEventListener("click", () => {
      mainWin.destroy();
    });

    no_option.addEventListener("click", () => {
      close_window.style.display = "none";
    });
    return "你想关闭窗口吗？";
  };
```

## References

