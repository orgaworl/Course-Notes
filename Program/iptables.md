# Iptables

```shell
iptables -t table_name #nat filter mangle
    -D chain_name order          #按顺序删除规则
    -A chain_name <rule>         #添加规则
    -j DROP/ACCEPT               #对满足条件的传入数据包进行操作
    -L -n  --line-numbers        #显示规则
    -F                           #删除表中所有规则
    -p #指定协议
```

```shell
#外网无法ping内网
iptables -A FORWARD -i eth0 -p icmp --icmp-type echo-request -j DROP
#内网ping外网
iptables -A FORWARD -i eth1 -p icmp --icmp-type echo-request -j ACCEPT
#外网响应内网ping
iptables -A FORWARD -i eth0 -p icmp --icmp-type echo-reply   -j ACCEPT
#其余数据包全丢弃
iptables -P FORWARD DROP
```
