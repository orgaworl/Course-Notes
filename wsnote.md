### 工具

```shell
tcpdump -i eth0 -n
```

```shell
On Host B (server, IP address is 10.9.0.6), run the following:
# nc -lp 9090
On Host A (client), run the following:
# nc 10.9.0.6 9090
```

```shell
telnet <host>
```

### 函数

```python
#scapy监听接收到的数据包，然后筛选出需要的。
sr() #IP地址,返回两个列表: [收到应答数据包] [未收到数据包]
sr1()#IP地址,只返回一个应答包
srp()#MAC地址
send() #发送IP数据包
sendp()#发送Ether数据包
suiff(filter="",iface="",count=""prn="")
#count表示用来指定监听到的数据包数量；prn表示对捕获的数据包进行处理
raw()
hexdump()
summary()
show()
```

### 报文字段

```shell
###[ ARP ]### 
  hwtype    = Ethernet (10Mb)
  ptype     = IPv4
  hwlen     = None
  plen      = None
  op        = who-has
  hwsrc     = d8:bb:c1:dc:75:df
  psrc      = 101.76.240.3
  hwdst     = 00:00:00:00:00:00
  pdst      = 0.0.0.0
```

```shell
###[ Ethernet ]### 
  dst       = ff:ff:ff:ff:ff:ff
  src       = d8:bb:c1:dc:75:df
  type      = 0x9000
```

```shell
###[ IP ]### 
  version   = 4
  ihl       = None
  tos       = 0x0
  len       = None
  id        = 1
  flags     = 
  frag      = 0
  ttl       = 64
  proto     = hopopt
  chksum    = None
  src       = 127.0.0.1
  dst       = 127.0.0.1
  \options   \
```

```shell
###[ ICMP ]### 
  type      = echo-request
  code      = 0
  chksum    = None
  id        = 0x0
  seq       = 0x0
  unused    = ''
```

 

```shell
###[ TCP ]### 
  sport     = ftp_data
  dport     = http
  seq       = 0
  ack       = 0
  dataofs   = None
  reserved  = 0
  flags     = S
  window    = 8192
  chksum    = None
  urgptr    = 0
  options   = ''
```

```shell
###[ UDP ]### 
  sport     = domain
  dport     = domain
  len       = None
  chksum    = None
```
