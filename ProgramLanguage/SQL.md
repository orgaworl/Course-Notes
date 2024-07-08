---
tags:
  - 编程语言
  - SQL
---
---

## SQL语句

### 定义

#### DataBase

```sql
CREATE DATABASE dbname
    ON(content)
    LOG ON(content);
DROP DATABASE dbname;
ALTER DATABASE dbname
    MODIFY FILE();
    ADD LOG FILE();
USE dbname;
SHOW dbname;
SHOW DATABASES;
```

#### Table

```sql
CREATE TABLE tbname
     (
     column_name1 datat_ype(size)[constraint],
     column_name2 data_type(size)[constraint],
     column_name3 data_type(size)[constraint],
     ....
     [,table constraint]
     ); 
DROP TABLE tbname,... //删除表
ALTER TABLE tbname
    ADD [COLUMN]      colname datatype [constraint]
    ADD [CONSTRAINT constname] <constraint> (col1,...)
    WITH NOCHECK  //原数据不做要求,新数据受约束限制.
    DROP [COLUMN]     colname
    DROP [CONSTRAINT] constname
    ALTER  [COLUMN]   colname datatype [constraint];//SQLServer/MS Access
    MODIFY [COLUMN]   colname datatype [constraint];//MySQL/Oracle
    RENAME [COLUMN]   colname1 to name2

DESC tbname;   //查看表信息
SHOW TABLES;  //显示所有表
```

```sql
constraint:
    UNIQUE,
    PRIMARY KEY,
    NOT NULL,
    DEFAULT <val>, //缺省值,插入时可不填值默认为该值.
    CHECK(<condition>),
    IDENTITY(1,1), #从1开始递增1

table constraint:
    PRIMARY KEY(colnames),
    [constraint consN]foreign key(colnames) references tbname(colnames),
    DEFAULT <val> FOR colname,    
    CHECK(condition),//对整个表做约束
```

#### 索引 Index

```sql
CREATE 
    [CLUSTERED|NONCLUSTERED][UNIQUE]
    INDEX idname
    ON tbname(colname[ASC|DESC],...);
//用于 MS SQL Server 的 DROP INDEX 语法：
DROP INDEX tbname.idname;

//用于 MySQL 的 DROP INDEX 语法：
ALTER TABLE tbname DROP INDEX idname;

//用于 DB2/Oracle 的 DROP INDEX 语法：
DROP INDEX idname;
//用于 MS Access 的 DROP INDEX 语法：
DROP INDEX idname ON tbname;
```

### 操作

```sql
// 插入数据
#先建立表,将子查询结果插入
INSERT INTO table_name 
[(column1,column2,column3,...)]
    VALUES (value1,value2,value3,...);// 1)插入元组
    SELECT colname(s) FROM table1;    // 2)插入子查询结果

#无预先建立表,执行时同时建立新表.
SELECT column_name(s) //
    INTO newtable [IN externaldb]
    FROM table1;

// 删除特定元组
DELETE FROM tbname
    WHERE <condition>;

// 修改特定元组的数据
UPDATE table_name
    SET column1 = value1, column2 = value2, ...
    WHERE condition;

TRUNCATE TABLE table_name;//仅清空表中数据,表仍存在
```

### 查询

```sql
SELECT [DISTINCT] [TOP num]
    <expression> AS alianame,...
    FROM tbname,...
    WHERE <condition>
    ORDER BY colname [ASC|DESC],...
    GROUP BY colname HAVING <condition> //having筛选分组后各组内的数据
    TOP <number|percent> //SQL server/MS Acess
        WITH TIES        //返回和最后一元组相同的连续排列的多个元组
    LIMIT num1 OFFSET num2         //MySql
```

expression:

- 表达式

- 聚合函数

- 列

conditon:

```sql
<>,!=,=       //比较大小
AND,OR,NOT,   //连接词
IS [NOT] NULL //空值
[NOT] LIKE '<匹配串>' [ESCAPE '<转义符>'] //字符匹配
[NOT] IN   (ele1,ele2,...)               //确定集合
[NOT] BETWEEN <va> AND <vb>               //连续区间
BETWEEN CAST('1970-01-01' AS DATETIME ) AND CAST('1970-12-31' AS DATETIME)
```

通配符:

- _   : 任一字符

- %  : 任意字符串

- \[ ]  : 匹配任一字符

- \[^] : 不匹配任一字符

#### 子查询

子查询可嵌套多个

- 相关子查询
  外查询每次输入一个元组到内查询, 内查询根据条件判断输出/不输出元组.

- 不相关子查询
  
  - 不带EXISTS
    先进行内查询, 再进行外查询
  
  - 带**Exist谓词**

            带有EXIST 谓词的子查询不返回数据,当子查询结果不为空则返回True,否则FALSE

#### 集合查询

```sql
UNION     #并
INTERSECT #交
EXCEPT    #差
```

#### 派生表查询

```sql
SELECT * FROM
(
    SELECT * FROM
    (
        SELECT * FROM()AS TC
    )AS TB(col1,)
)AS TA(col1,)
```

### 连接

```sql
JOIN
｜ 把来自两个或多个表的行结合起来
    类型
        INNER JOIN:(默认内连接);如果表中有至少一个匹配，则返回行;1)等值连接2)自连接;
        LEFT JOIN:   左外连接; 使右表中没有匹配，也从左表返回所有的行.
        RIGHT JOIN:  右外连接; 即使左表中没有匹配，也从右表返回所有的行.
        FULL JOIN:   全外连接; 只要其中一个表中存在匹配，则返回行.
        CROSS JOIN:
    语法
        ｜ SELECT column1, column2, ...
        ｜ ​FROM table1  JOIN table2 
        ｜ ​ON condition;

UNION
｜ 合并多个 SELECT 语句的结果集
    SQL UNION 语法
        ｜ SELECT column_name(s) FROM table1
        ｜ UNION
        ｜ SELECT column_name(s) FROM table2;
        ｜ 

    UNION 操作符选取不同的值。要允许重复的值,使用 UNION ALL。
    SQL UNION ALL 语法
        ｜ SELECT column_name(s) FROM table1
        ｜ UNION ALL
        ｜ SELECT column_name(s) FROM table2;
```

```sql
#笛卡尔积
SELECT *
FROM TABLEA,TABLEB

# 内连接
SELECT *
FROM TABLEA,TABLEB
WHERE condition

#自然连接, 无重复列,要求重复列属性相同
SELECT student.*, class.class_name
FROM student inner join class
ON student.class_id = class.class_id

#左连接
左连接以左表为基础，显示左表中的所有记录：
显示的记录条数 = 左表中记录的条数
再用左表中的指定列，来和右表中的指定列比较。满足，则输出值；不满足，则输出 NULL。

# 右连接
右连接与左连接正好相反，右连接以右表为基础，显示右表中的所有记录：
显示的记录条数 = 右表中记录的条数
再用右表中的指定列，来和左表中的指定列比较。满足，则输出值；不满足，则输出 NULL。

#全连接
全连接类似于左连接和右连接的综合：
显示记录的条数 = 指定比较字段在两个表中的不同种类数
对于空余字段，则显示 NULL 。也就是说，它能返回两个表中所有的关联信息，以及所有没有被关联到的信息。
```

<img title="" src="../picture/sql-join.png" alt="join" style="zoom:80%;">

### 视图

与表同级,为虚表. 数据库中只存放视图定理, 对应数据仍在原数据表内.

```sql
// 创建视图
CREATE VIEW <view_name> [(col1,)] AS 
    SELECT column_name(s)
        FROM table_name
        WHERE condition
    [WITH CHECK OPTION]; //以后添加的元组必须满足该条件

// 删除视图
DROP VIEW <viewname>;

//更新视图
//视图不存储数据, 通过视图更新数据最终转化为对基本表的更新.
INSERT INTO viewname(col1,)
    VALUES(val1,)

DELETE FROM viewname
    WHERE condition

UPDATE viewname 
    SET col=val
    WHERE condition
```

### 控制

```sql
#将赋予其他用户某个表的多种操作权限.
GRANT <OP1,> ON tbname TO username
#禁止权限
DENY <OP1,> ON tbname TO username
#撤销用户的权限
REVOKE <OP1,> ON tbname FROM username

OP:
#语句权限
    CREATE DATABASE,CREATE TABLE,CREATE VIEW,CREATE DEFAULT,
    CREATE RULE,CREATE FUNCTION,CREATE PROCEDURE,
    BACKUP DATABASE,BACKUP LOG,
#对象权限
    #列
    SELECT,UPDATE,
    #表,视图,表值函数,
    SELECT,UPDATE,INSERT,DELETE,REFERENCES,
    #存储过程
    EXECUTE,SYNONYM,
    #标量函数
    EXECUTE,REGERENCES,
```

---

## 事务

数据库运行的最小的,不可分割的工作单位,要么全执行,要么全不执行.

## 备份及恢复

---

## TRICKS

```sql
# 笛卡尔积
SELECT *
FROM 
    table1 AS a,
    table2 AS b

#对使用了GROUP BY或ORDER BY的查询结果截取列
SELECT Email
FROM (
    SELECT email as Email,COUNT(email) as num
    FROM Person
    GROUP BY email
)AS T
WHERE num!=1

# WHERE 语句高级用法
# 重复类
SELECT 
    b.name AS Department,
    a.name AS Employee,
    a.salary AS Salary
FROM Employee as a JOIN Department as b 
    ON a.departmentId=b.id
WHERE   (a.departmentId,a.salary) IN
        (   SELECT departmentId,MAX(Salary)
            FROM Employee
            GROUP BY departmentId
        )

#分组后统计该组内值的种类数
COUNT(DISTINCT user_id)
```

***

## SQL数据类型

***

## SQL自带函数

```sql
GETDATE()
YEAR()
DATEDIFF(DAY,ProductTime,GETDATE()) #相差天数
```

聚合函数:

```sql
COUNT([DISTINCT|ALL] colname) //COUNT(*)记录NULL, COUNT(col)记录NU
SUM()// null自动忽略
AVG()
MAX()
MIN()
round(num,小数点后精度)
```

## 自定义函数

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
    SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
        SELECT(IFNULL(
            (SELECT DISTINCT salary 
            FROM Employee
            ORDER BY salary DESC
            LIMIT M, 1),NULL)
        )
  );
END
```

---

## MS-SQL

`sqlcmd -S localhost -U sa -P '<123123Aa!@>'`

`select name from sys.databases`

---

author email: orgaworl@outlook.com