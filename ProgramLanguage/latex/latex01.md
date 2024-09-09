---

---
---
# LaTex论文写作

## 项目文件结构


## 论文标准写作

### 使用正确字体

> The typeface in which a symbol appears helps to define what thes ymbol represents.

- 数量/变量/符号-斜体
	```latex
	$t_\text{max}$
	```
- 单位符号-roman
- 描述性术语符号-roman



大数字自动分隔
```latex
\usepackage{siunitx}
\num{123456789}
```

### 引用
自动引用
```latex
\usepackage{hyperref}
\autoref{fig:xxx}
\autoref{tbl:xxx}
\autoref{thm:xxx}
```


## 示例


```

$$

\mathbb{Z}=

  \begin{pmatrix}

  z_{1,1}&\cdots&z_{1,|k|}\\

  \vdots &\ddots &\vdots \\

  z_{\mathbb{N},1}&\cdots&z_{\mathbb{N},|k|}

  \end{pmatrix}

  \xrightarrow{\text{汉明重量/汉明距离}}

  \mathbb{H}=

  \begin{pmatrix}

  h_{1,1}&\cdots&h_{1,|k|}\\

  \vdots &\ddots &\vdots \\

  h_{\mathbb{N},1}&\cdots&h_{\mathbb{N},|k|}

  \end{pmatrix}

$$
```




```latex
\makecell{测线距中心点\\处距离/m}
\multicolumn{2}{|c|}{~}                               %1*2
\multirow{8}*{\makecell{}} %8*1
```

```latex
\begin{algorithm}[H]
  \caption{ECDSA KeyGen}
  \begin{algorithmic}[1]
  \STATE $  P=d G$, n  is order of group $<G>$
  \STATE $SK=d$, $PK=P$
  \end{algorithmic}
\end{algorithm}
```

```latex
\usepackage{seqsplit}
\renewcommand{\seqinsert}{\ifmmode\allowbreak\else\-\fi}
\seqsplit{1234567898765432123456789876543212345678998764321}
```


