# gem5-arm快速部署

- 基于debian系统
- 已经将实验要求的所有环境布置完成
- 可以通过qemu直接运行交叉编译器编译出的arm的可执行文件

加载镜像
`docker pull 100qwer789/gem5:latest`

启动容器
`docker run -it --entrypoint bin/bash <image-id>`

退出容器
`exit`

进入容器
`docker exec -it <container-id> bash`

交叉编译器位置
`/usr/bin/arm-linux-gnueabi-gcc`

编译选项
`-static`

gem5
`/opt/gem5`
