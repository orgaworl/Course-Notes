---
date created: 2024-10-03 11:16
date updated: 2024-10-03 22:28
---

## 示例

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Hello World!</title>
  </head>
  
  <body>
	<header>
	</header>
	
	<nav>
	</nav>
	<main>
		<section class="cls1"></section>
		<section class="cls2"></section>
	</main>
	<footer>
		copyright
	</footer>
  </body>
</html>
```


## 基本组成

- `<!DOCTYPE html>` 声明为 HTML5 文档
- `<html>` 元素是 HTML 页面的根元素
- `<head>` 元素包含了文档的元(meta)数据，如 <meta charset="utf-8"> 定义网页编码格式为 utf-8。
- `<title>` 元素描述了文档的标题
- `<body>` 元素包含了可见的页面内容
- `<header>`
- `<main>`
- `<section>`
- `<footer>`


## HTML 标签

- HTML 标签 (HTML tag)成对出现,分别为开始标签,结束标签

## HTML元素
### 基础
- 元素语法
	- HTML 元素以开始标签起始
	- HTML 元素以结束标签终止
	- 元素的内容是开始标签与结束标签之间的内容
	- 某些 HTML 元素具有空内容（empty content）
	- 空元素在开始标签中进行关闭（以开始标签的结束而结束）
	- 大多数 HTML 元素可拥有属性
- 常见元素
	- `<html>文档</html>`
	- `<head>首</head>`
	- `<body>主体</body>`


### **区块元素:** 独占一整行
- 标题`<h1> </h1>` - `<h6></h6>`
- 段落 `<p> </p>`
- HTML 图像 `<img>`
	```html
	<img decoding="async" src="logo.png" width="258" height="39" />
	```



### **行内元素:** 只占据本身大小的空间
- 粗体`<strong> </strong>` 
- 斜体`<em> </em>` 
- 链接`<a> </a>`
	```html
	<a href="https://www.runoob.com/">这是一个链接</a>
	```
- 有序列表
	```html
	<ol>
		<li> </li>
		<li> </li>
	</ol>
	```
- 无序列表
	```html
	<ul>
		<li> </li>
		<li> </li>
	</ul>
	```
- 引用`<blockquote> </blockquote>`

### **其他元素**
- 注释 `<!--注释内容-->`


- 空元素: 无内容
	- `<br>` 换行
	- `<hr>` 水平线

- 表单
	```html
	<form> 
		<input type="passwd" placeholder="input please" required>
		<input type="email">
		<input type="file">
		<button type="submit"> login in </button>
	</form>
	```
## HTML属性

属性一般描述于开始标签, 属性总是以名称/值对的形式出现，比如：name="value"。

- 常见属性
	- class
		- 为html元素定义一个或多个类名（classname）(类名从样式文件引入)
	- id
		- 定义元素的唯一id
	- style
		- 规定元素的行内样式（inline style）
	- title
		- 描述了元素的额外信息 (作为工具条使用)


