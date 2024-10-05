
### 元素属性及对应取值

**展示效果**
- color 文字颜色
	- :rgb(r,g,b, trasparent)
- font-size 文字大小
- background-color 背景颜色
	- : transparent
	- `: <color>`

- text-decoration 底线装饰
	- : none
- border-radius 圆角效果
	- : 10px
- cursor
	- : pointer 

**元素大小**
- height
- width
- size


**元素边框与边距**
- padding 内边距
	- : up-right-down-left
	- : u r d l
	- : u r-d l
	- : u-d l-r
- border 边框
	- :`5px #9d8189 solid`
- margin 外边距
	- : up-right-down-left
	- : u r d l
	- : u r-d l
	- : u-d l-r
**父元素控制子元素位置**
- display
	- :inline 作为行内元素进行显示
	- :flex 设置为flex-box, 控制子元素排列方式
- flex-direction
	- 
- justify-content 子元素在排列方向上的排列方式
	- center
	- space-between
- align-items 子元素垂直位置

```css
/* 父元素 控制其中子元素布局*/
fatherElement{
	display: flex;
	justify-content:space-between;
	align-items:center;
}
```


**子元素设置其位置**
- position
	- relative 相对模式,从元素原位置开始计算
	- absolute 绝对位置, 从父元素左上角开始计算
	- fixed 固定, 页面不随页面变动


### 显示单位
- em
- px
- vw 相对单位, 按整个窗口的比例设置宽度.
- vh 相对单位, 按整个窗口的比例设置高度.
### CSS规则
CSS 规则由两个主要的部分构成：
- 选择器: 选择单个或多个元素
	- `.className{}`
	- `elementName{}`
	- `*{}` 默认配置
	- `a:hover` 悬停时
	- `header h1{}` 指定某部分中的元素
- 一条或多条声明:指定元素属性

```css
p{
    color:red;
    text-align:center;
    font-family:arial;
}
```



**修改预设默认值**
```css
*{
	padding:5;
	margin:5;
}
```



### id 和 class 选择器

```css

#para1
{
    text-align:center;
    color:red;
}

```

### 设置

#### 字体

| Property                                                                | 描述                 |
| ----------------------------------------------------------------------- |:------------------ |
| [font](https://www.runoob.com/cssref/pr-font-font.html)                 | 在一个声明中设置所有的字体属性    |
| [font-family](https://www.runoob.com/cssref/pr-font-font-family.html)   | 指定文本的字体系列          |
| [font-size](https://www.runoob.com/cssref/pr-font-font-size.html)       | 指定文本的字体大小          |
| [font-style](https://www.runoob.com/cssref/pr-font-font-style.html)     | 指定文本的字体样式          |
| [font-variant](https://www.runoob.com/cssref/pr-font-font-variant.html) | 以小型大写字体或者正常字体显示文本。 |
| [font-weight](https://www.runoob.com/cssref/pr-font-weight.html)        | 指定字体的粗细。           |





---
