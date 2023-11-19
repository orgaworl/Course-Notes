## 数据类型

```c

```

## 函数

```c
pcap_lookupdev()：函数用于查找网络设备，返回可被 pcap_open_live() 函数调用的网络设备名指针。


pcap_lookupnet()：函数获得指定网络设备的网络号和掩码。
int pcap_lookupnet(char *device,bpf_u_int32 *netp,
                    bpf_u_int32 *maskp,char *errbuf);


pcap_open_live()： 函数用于打开网络设备，并且返回用于捕获网络数据包的数据包捕获描述字。对于此网络设备的操作都要基于此网络设备描述字。
pcap_t *pcap_open_live(char *device, int snaplen, int promisc, 
                        int to_ms, char *ebuf)
//设备名称,抓取的最大比特,混合模式，超时时间(0一直等待),返回会话句柄 pcap_t

pcap_compile()： 函数用于将用户制定的过滤策略编译到过滤程序中。
int pcap_compile(pcap_t *p, struct bpf_program *fp, char *str, 
                    int optimize, bpf_u_int32 netmask);
//会话句柄,存储编译结果,过滤器表达式,是否优化表达式,网络掩码
pcap_setfilter()：函数用于设置过滤器。
pcap_loop()：函数
pcap_dispatch() 函数用于捕获数据包，捕获后还可以进行处理，

pcap_next():
const u_char *pcap_next(pcap_t *p, struct pcap_pkthdr *h);
//p：pcap_open_live()返回的 pcap_t 类型的指针, h：数据包头
pcap_next_ex()
pcap_close()：函数用于关闭网络设备，释放资源
```

流程

1. 打开网络设备
2. 设置过滤规则
3. 捕获数据
4. 关闭网络设备

```c
// 获取设备信息
char *dev;
char errbuf[PCAP_ERRBUF_SIZE];
dev = pcap_lookupdev(errbuf);
//获取网络号和掩码
bpf_u_int32  netp = 0, maskp = 0;
int ret = pcap_lookupnet(dev, &netp, &maskp, error_content);
if(ret == -1){printf(error_content);    exit(-1);    }


// sniff
pcap_t *handle = pcap_open_live(dev, BUFSIZ, 1, 1000, errbuf);
struct pcap_pkthdr protocol_header;
const unsigned char *p_packet_content = 
            pcap_next(pcap_handle, &protocol_header); 
//读取数据包
struct ether_header ethernet_protocol=
            (struct ether_header *)p_packet_content;  
//struct ether_header 以太网帧头部
unsigned char *p_mac_string = 
            (unsigned char *)ethernet_protocol->ether_shost;//获取源mac
printf("Mac Source Address is %02x:%02x:%02x:%02x:%02x:%02x\n",*(p_mac_string+0),*(p_mac_string+1),*(p_mac_string+2),*(p_mac_string+3),*(p_mac_string+4),*(p_mac_string+5));
unsigned char *p_mac_string = 
            (unsigned char *)ethernet_protocol->ether_dhost;//获取目的mac
printf("Mac Destination Address is %02x:%02x:%02x:%02x:%02x:%02x\n",*(p_mac_string+0),*(p_mac_string+1),*(p_mac_string+2),*(p_mac_string+3),*(p_mac_string+4),*(p_mac_string+5));


//filter
pcap_compile()// 编译过滤语句
pcap_setfilter()


//spoof
```

```c

```

```c

```

```c
 pcap_t *handle;        /* Session handle */
 char dev[] = "rl0";        /* Device to sniff on */
 char errbuf[PCAP_ERRBUF_SIZE];    /* Error string */
 struct bpf_program fp;        /* The compiled filter expression */
 char filter_exp[] = "port 23";    /* The filter expression */
 bpf_u_int32 mask;        /* The netmask of our sniffing device */
 bpf_u_int32 net;        /* The IP of our sniffing device */

 pcap_lookupnet(dev, &net, &mask, errbuf);
 handle = pcap_open_live(dev, BUFSIZ, 1, 1000, errbuf);
 pcap_compile(handle, &fp, filter_exp, 0, net);
```
