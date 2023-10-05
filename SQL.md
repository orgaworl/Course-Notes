# SQL

## SQL语句

### 定义

#### DataBase

```sql
CREATE DATABASE dbname
    ON(content)
    LOG ON(content);
ALTER DATABASE dbname
    MODIFY FILE()
    ADD LOG FILE()
DROP DATABASE dbname
USE dbname
SHOW dbname
SHOW DATABASES;
```

#### Table

```sql
CREATE TABLE tbname
     (
     column_name1 datatype(size)[constraint],
     column_name2 data_type(size)[constraint],
     column_name3 data_type(size)[constraint],
     ....
     [,table constraint]
     ); 

DROP TABLE tbname,...
DESC tbname
ALTER TABLE tbname
    ADD colname datatype [constraint]
    ADD [CONSTRAINT constname] <constraint>
    WITH NOCHECK//原数据不做要求,新数据受约束限制.
    DROP COLUMN <colname> <datatype>
    DROP CONSTRAINT <consname>
    ALTER COLUMN colname datatype [constraint] //SQL Server / MS Access
    MODIFY COLUMN colname datatype [constraint]//My SQL / Oracle
SHOW TABLES;


```

```sql
constraint:
    UNIQUE
    PRIMARY KEY,
    NOT NULL,
    DEFAULT <val> FOR colname,
    CHECK(<condition>),
table constraint:
    PRIMARY KEY(colnames),
    foreign key(colnames) references tbname(colnames),

```

#### 索引

```sql
CREATE
    [UNIQUE][CLUSTERED|NONCLUSTERED]
    INDEX idname
    ON tbname(colname[ASC|DESC],...)
//用于 MS Access 的 DROP INDEX 语法：
DROP INDEX idname ON tbname

//用于 MS SQL Server 的 DROP INDEX 语法：
DROP INDEX tbname.idname

//用于 DB2/Oracle 的 DROP INDEX 语法：
DROP INDEX idname

//用于 MySQL 的 DROP INDEX 语法：
ALTER TABLE tbname DROP INDEX idname


```



### 查询

```sql
SELECT [DISTINCT] <expression>,...
    AS colname //为列起别名
    FROM tbname,...
    WHERE <condition>
    ORDER BY colname [ASC|DESC],...
    GROUP BY colname HAVING <condition>
    TOP <number|percent> //SQL server/MS Acess
    LIMIT number         //MySql
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
[NOT] BETWEEN <va>AND <vb>               //连续区间
```

通配符:

- _   : 任一字符

- %  : 任意字符串

- \[ ]  : 匹配任一字符

- \[^] : 不匹配任一字符

#### 子查询



#### 集合查询





### 操作

```sql
INSERT INTO table_name (column1,column2,column3,...)
    VALUES (value1,value2,value3,...);// 1)插入元组
    SELECT colname(s) FROM table1;    // 2)插入子查询结果

SELECT column_name(s)
    INTO newtable [IN externaldb]
    FROM table1;

UPDATE table_name
    SET column1 = value1, column2 = value2, ...
    WHERE condition;

DELETE FROM tbname
    WHERE <condition>;

TRUNCATE TABLE table_name//仅删除表中数据
```



### 控制

```sql
GRANT

REVOKE

DENY

```





### 连接

```sql
JOIN
｜ 把来自两个或多个表的行结合起来
    类型
        INNER JOIN:(默认使用内连接);如果表中有至少一个匹配，则返回行;  1)等值连接2)自连接;
        LEFT JOIN:   左外连接; 使右表中没有匹配，也从左表返回所有的行.
        RIGHT JOIN:  右外连接; 即使左表中没有匹配，也从右表返回所有的行.
        FULL JOIN:   全外连接; 只要其中一个表中存在匹配，则返回行.

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





### 视图

```sql
CREATE VIEW <view_name> 
    AS SELECT column_name(s)
    FROM table_name
    WHERE condition
    [WITH CHECK OPTION]
DROP VIEW <viewname>
```







***

## SQL数据类型

***





## SQL自带函数

```sql
GETDATE()
YEAR()

```

聚合函数:

```sql
COUNT([DISTINCT|ALL] colname)
SUM()
AVG()
MAX()
MIN()
```





***
