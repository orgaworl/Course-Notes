

ML绘制图案例

```matlab
clear;
close all;
input=[338.,333.,328.,207.,226.,25.,179.,60.,208.,606.];
output=[640.,633.,619.,393.,428.,27.,193.,66.,226.,1591.];
f=@(w,b)sum((output-b-w*input).^2);
w=linspace(-200,200,100);
b=linspace(-20,20,100);
lenw=length(w);
lenb=length(b);
w=repmat(w,lenb,1);w=w(:);
b=repmat(b',1,lenw);b=b(:);
L=zeros(length(w),1);
for i=1:length(w)
    L(i)=f(w(i),b(i));
end
x=w;
y=b;
z=L;
xlin = linspace(min(x),max(x),100); %22指参与作图散点的个数
ylin = linspace(min(y),max(y),100);  
[X,Y] = meshgrid(xlin,ylin);
Z = griddata(x,y,z,X,Y,'linear');
%1. 散点图
%figure,plot3(x,y,z,'.','MarkerSize',15) %nonuniform
%2. 彩色图
figure;
mesh(X,Y,Z) %interpolated %目标图
axis tight; hold on;
%plot3(x,y,z,'.','MarkerSize',15)
xlabel('w');ylabel('b');zlabel('L');
%3. 伪彩色图
figure,pcolor(X,Y,Z);shading interp
%4. 等高线图
figure,contourf(X,Y,Z)
%5. 三维曲面
figure,surf(X,Y,Z)
xlabel('w');ylabel('b');zlabel('L');
```







```matlab
symbol=["bx-","c*-","y>-","x-","^-","+-"];
Fontsize=32;
set(gca,'FontSize',18);
grid  on;
xlabel('数据大小(MB)','FontSize',Fontsize);
ylabel('数据吞吐率(MB/S)','FontSize',Fontsize);
title("数据吞吐率测试",'FontSize',Fontsize);
legend("Openssl","C implemnet","Python","AESNI",'FontSize',25);

```

```matlab
%柱状图
figure;
Bar=["Openssl","C","Python","AESNI"];
Bar=categorical(Bar);
b=bar(Bar,[mean(x./y1),mean(x./y2),mean(x./y3),mean(x./y4)],0.6,'FaceColor',[0.94, 0.89, 0.85],'EdgeColor',[0.9, 0.7, 0.8],'LineWidth',1.5);
set(gca,'FontSize',32);
title("不同实现吞吐量对比",'FontSize',Fontsize)
xlabel("不同实现",'FontSize',Fontsize)
ylabel("吞吐量(MB/S)",'FontSize',Fontsize)
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',Fontsize)

```

```matlab
%双y轴图
figure;
yyaxis left;
plot(x,y1,symbol(1));
ylabel('时间开销(S)','FontSize',Fontsize);
yyaxis right;
plot(x,y2,symbol(2));
axis([0 64 0 140])
ylabel('数据吞吐率(MB/S)','FontSize',Fontsize);
```

```matlab
%三维曲面图

close all;
%data=load( "./data/18_.txt");
data=load("C:\Users\25137\OneDrive\文档\SourceCode\Mountain\Mountain\test.txt");
x=data(:,1);%size
y=data(:,2);%step
z=data(:,3);

xlin = linspace(min(x),max(x),100); %22指参与作图散点的个数
ylin = linspace(min(y),max(y),60);  
[X,Y] = meshgrid(xlin,ylin);
Z = griddata(x,y,z,X,Y,'linear');
mesh(X,Y,Z) %interpolated %目标图
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlabel('size( KB )');
ylabel('step(×8 Byte)');
zlabel('Read throughput(MB/s)');
%figure
%pcolor(X,Y,Z);shading interp%伪彩色图
%figure,contourf(X,Y,Z) %等高线图
figure,surf(X,Y,Z)%三维曲面
xlabel('size( KB )');
ylabel('step(×8 Byte)');
zlabel('Read throughput(MB/s)');
%plot3(x,y,z,".");
```



```matlab
%box图 与 异常数据剔除
% 生成一组随机数据
data = randn(100,1);
% 绘制箱线图
boxplot(data)
% 使用 prctile 函数计算异常值的上限和下限
q1 = prctile(data,25);
q3 = prctile(data,75);
iqr = q3-q1;
upper = q3+1.5*iqr;
lower = q1-1.5*iqr;
% 删除超过上限和下限的数据
data(data>upper) = [];
data(data<lower) = [];

% 绘制去除异常值后的箱线图
figure
boxplot(data)
```


