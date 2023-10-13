

### package

```python
Matplotlib
Natural Language Toolkit (NLTK)
Numpy
Scipy
Pythorch
TensorFlow
Keras
```



---

# 

# Numpy

---

## 常量

* np.Inf, np.Infinity 正无穷 np.NAN, np.NaN 非数字  

* np.MAXDIMS 最大维度 np.NINF 负无穷 np.NZERO 负0
  
  

### 输入输出

* 二进制文件  
  
  * load、save、savez、savez_compressed  

* 普通文本文件  
  
  * savetxt('path', data, delimiter='分隔符', dtype)  
  * loadtxt

### 二维矩阵

- 创建
  
  ```python
  np.mat(list)
  #当传入数组时, 仅创建引用,不会创建副本
  np.asmatrix()
  #同mat
  np.matrix(list,copy=True)
  #默认创建副本
  
  
  ```
  
  

```python
numpy.arange(start,end)
numpy.array(list_)
ob.reshape(n,m)


array=np.asarray(matrix, dtype=None,order=)
mat1.getA()

np.asmatrix()
np.mat()
np.matrix()



```


