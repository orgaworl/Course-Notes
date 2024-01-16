**（1）方向导数：本质就是函数在A点无数个切线的斜率的定义。每一个切线都代表一个变化的方向。**

**（2）梯度：函数在A点无数个变化方向中变化最快的那个方向。**

**（3）全微分：函数从A点到B点变化的量（其实是取一个无穷小的变化的量）。**

**（4）偏导：多元函数降维时候的变化，比如二元函数固定y，只让x单独变化，从而看成是关于x的一元函数的变化来研究。**

```python
np.concatenate((a,b,c),axis=0)
```

```python
a = np.array([1,2,3]) #数组
np.array([[1,2,3]]) #行向量
```

pandas 读写csv

```python
import pandas as pd
titanic_data = pd.read_csv('titanic.csv')

titanic_data = pd.read_csv(r'https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv')


city = pd.DataFrame([['Sacramento', 'California'], ['Miami', 'Florida']], columns=['City', 'State'])
city.to_csv('city.csv')
```

matplotlib

```python
#标题
plt.xlabel('False positive rate', fontdict={"family": "Times New Roman", "size": 25})
plt.ylabel('True positive rate', fontdict={"family": "Times New Roman", "size": 25})
#坐标轴
plt.xticks(fontname="Times New Roman", fontsize=25)
plt.yticks(fontname="Times New Roman", fontsize=25)
#标注
plt.legend(["ave", "csd"], ncol=2, prop={"family": "Times New Roman", "size": 20})
#限制x,y轴显示区间
plt.xlim([-0.03, 1.0])
plt.ylim([0.0, 1.03])
```

```python
lw = 5
plt.figure(figsize=(10, 10))
plt.subplots_adjust(left=0.095, bottom=0.08, right=0.96, top=0.98)
plt.xlim([-0.03, 1.0])
plt.ylim([0.0, 1.03])
plt.xticks(fontname="Times New Roman", fontsize=25)
plt.yticks(fontname="Times New Roman", fontsize=25)
plot_auc(ave_y, ave_s, color="#7e1e9c")
plot_auc(csd_y, csd_s, color="g")

plt.xlabel('False positive rate', fontdict={"family": "Times New Roman", "size": 25})
plt.ylabel('True positive rate', fontdict={"family": "Times New Roman", "size": 25})
plt.legend(["ave", "csd"], ncol=2,prop={"family": "Times New Roman", "size": 20})
plt.plot([0, 1], [0, 1], color='navy', lw=lw, linestyle='--')
plt.show()
```
