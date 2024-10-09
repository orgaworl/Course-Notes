---
title: Greenhouse-AE
subtitle: 对嵌入式固件托管方案Greenhouse的Artifact Evaluation
layout: post
author: orgaworl
header-style: text
tags:
  - IoT
  - SystemSecurity
  - rehost
date updated: 2024-10-07 20:36
---

## Artifact Evaluation: Greenhouse USENIX 2023

本次测试基于

- VMvare17
- Ubuntu 20.04
- Greenhouse USENIX 2023 Artifact Evaluation Version v5

测试时间

- 2024.10.07

### 下载 artifact

作者在zenodo上提交了论文对应的artifact, 包含一个docker容器与多个说明文档, 对应链接为: <https://zenodo.org/records/8217895>.
下载其中的docker容器文件`greenhouse-ae.tar`与使用文档`README.md`, 留作备用.


### 基于 docker 搭建运行环境

运行该artifact需先安装依赖:

```shell
sudo apt install docker docker-compose
```

其余部分基于artifact所提供的手册进行.

```shell
#只执行一次:
docker load -i greenhouse-ae.tar  
# 每次启动容器都要执行:
docker run -it --privileged -v /dev:/host/dev greenhouse:usenix-eval-jul2023 bash 
/gh/docker_init.sh
/gh/test.sh
```

过程中可能遇到无法访问`docker daemon`的报错, 需要在容器中执行 `usermod -aG docker root`命令并重新启动容器.

### 对固件进行 rehost

该程序对固件进行rehost时需要指定品牌, 查看程序源代码, 发现该程序主要支持以下品牌:

- netgear
- dlink
- trendnet
- tenda
- asus

因此, 本文选择了华硕(asus)某款路由器的固件进行测试, 下载链接为:
<https://dlcdnets.asus.com.cn/pub/ASUS/wireless/RT-BE88U/FW_RT_BE88U_300610233921.zip?model=RT-BE88U>

随后, 使用greenhouse对该固件进行rehost.

```shell
# 将文件复制到container中
sudo docker cp ./RT-BE88U_3.0.0.6_102_33921-g6ecb73c_620-gaf023_BA08_nand_squashfs.pkgtb 0db2:/
# 参数中指定品牌名和固件文件路径
gh/run.sh asus /RT-BE88U_3.0.0.6_102_33921-g6ecb73c_620-gaf023_BA08_nand_squashfs.pkgtb
```

> 以上命令仅供参考, 需要根据官方手册并结合实际情况进行修改.

运行完成后, 在容器的`/gh/result/`路径下发现新文件夹`<sha256hash>`, 将其中的`<firmware-name>`复制到主机中留作备用.

```shell
# 在主机中执行
sudo docker cp \ 
	0db2:/gh/result/<sha256hash>/<firmware-name>  \
	~/d9f3/<firmware-name>
```

### 在docker中运行rehost后的固件

> 经典换源环节, 已换过的不需要重换.

```shell
sudo touch /etc/docker/daemon.json
sudo chmod 666 /etc/docker/daemon.json
sudo echo "{\"registry-mirrors\": [\"https://dockerproxy.cn\"]}" >> /etc/docker/daemon.json
sudo chmod 644 /etc/docker/daemon.json
```

利用greenhouse产生的构建文件重新构建一个容器, 作为固件的运行环境.

```shell
cd ~/d9f3/<firmware-name>/debug
sudo docker-compose build
sudo docker-compose up
```

固件成功启动后, 根据构建文件`~/d9f3/<firmware-name>/debug/docker-compose.yml`中指定的ip与端口访问固件程序.

本文采用默认设置: `172.21.0.2:80`, 成功在浏览器中访问.

![](pic/Snipaste_2024-10-07_19-16-45.png)

在创建无线网络这一步遇到问题, 输入SSID与password后, 页面保持加载状态, 始终无法进入下一个页面, 猜测与docker环境中缺少无线网络必需硬件设备有关.

![](pic/Snipaste_2024-10-07_19-59-33.png)

## Reference

[^1]:https://www.usenix.org/biblio-13740

[^2]: https://secartifacts.github.io/usenixsec2023/appendix-files/sec23winterae-final55.pdf

[^3]: https://zenodo.org/records/8026178
