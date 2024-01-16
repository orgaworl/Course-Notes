## Pytorch

```python
# numpy 转换到 tensor
torch.tensor(array)
torch.from_numpy(np.ndarray())

torch.zeros([,])
torch.ones([,])

x.shape()

# 张量处理
x=x.squeeze(dim)
x=x.unsqueeze(dim)
x=x.traspose(dim1,dim2)
w=torch.cat([x,y,z],dim=dim) 
x.reshape([,])
#要求除了融合的维度,其余维度大小均相同.
x.pow()
x.sum()
x.mean()

# 训练硬件
torch.cuda.is_available()
x = x.to(‘cpu’)
x = x.to(‘cuda’)
```

## Data

```python
from torch.utils.data import Dataset, DataLoader
torch.utils.data.Dataset
torch.utils.data.DataLoader
```

## Neural Network

```python
torch.nn
torch.optim

# NN struct
nn.Linear(in_featuresN, out_featuresN)
  nn.Linear.weight
  nn.Linear.bias
nn.Conv2d(1,20,5)
# 接受一个4维的张量,样本数*通道数*高*宽）
nn.Sigmoid()
nn.ReLU()


# Loss Function
nn.MSELoss()          # Mean Squared Error (for linear regression)
nn.CrossEntropyLoss() # Cross Entropy (for classiﬁcation)

# OPT
# Optimization algorithms for neural networks (gradient descent)
# Stochastic Gradient Descent (SGD)
torch.optim.SGD(params, lr, momentum = 0)
```

## 模型I/O

```python
# Save
torch.save(model.state_dict(), path)
# Load
ckpt = torch.load(path)  model.load_state_dict(ckpt)
```

## 实例

```python
# A 数据集处理
class MyDataset(Dataset):
  def init (self, file):
      self.data = ...
  def __getitem__(self, index):  
      return self.data[index]
  def __len__(self):
      return len(self.data)
dataset=MyDataset(file)
dataloader=DataLoader(dataset,batch_size,shuffle=True)
#shuffle,Traing-True,Testing-False

# B 配置模型结构
class MyModel(nn.Module):
    # Initialize your model & deﬁne layers
    def __init__(self):
        super(MyModel, self).init()
        self.net = nn.Sequential(
                nn.Linear(10, 32),
                nn.Sigmoid(),
                nn.Linear(32, 1))
    # Compute output of your NN
    def forward(self,x):
        return self.net(x)


# C 配置模型训练参数
dataset = MyDataset(file)
tr_set = DataLoader(dataset, 16, shuffle=True)
#contruct model and move to device (cpu/cuda)  set
model = MyModel().to(device)
criterion = nn.MSELoss()
optimizer = torch.optim.SGD(model.parameters(), 0.1)


# D 实际训练
for epoch in range(n_epochs):
  model.train()
  for x, y in tr_set:  
      optimizer.zero_grad()
    x, y = x.to(device), y.to(device)  
    pred = model(x)
    loss = criterion(pred, y)  
    loss.backward()  
    optimizer.step()

# E 验证集
model.eval()
total_loss = 0
for x, y in dv_set:
    x,y=x.to(device),y.to(device)
    with torch.no_grad():
      pred = model(x)    
      loss = criterion(pred, y)
      total_loss += loss.cpu().item() * len(x)
      avg_loss = total_loss/len(dv_set.dataset)

# F 测试集
model.eval()
preds = []
for x in tt_set:
    x=x.to(device)
    with torch.no_grad():
    pred = model(x)
    preds.append(pred.cpu())
```
