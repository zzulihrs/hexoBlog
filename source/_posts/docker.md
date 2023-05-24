---
title: docker
tag: 后端
---

### 镜像站：

https://hub.daocloud.io/

https://c.163yun.com/dashboard?nowLang=zh#/overview

### 镜像操作

`docker pull imgaes:tag` 拉取镜像

`docker images` 查看镜像

`docker rmi image` 删除镜像

```
镜像的导入导出
将本地的镜像导出
docker save -o 导出的路径 镜像id
加载本地的镜像文件
docker load -i 镜像文件

修改镜像名称
docker tag 镜像id:版本
```



### 容器操作

```
运行容器
docker run -d -p 宿主机端口:容器端口 --name 容器名称 镜像的表示|镜像名称[:tag]
# -d:代表后台运行容器
# -p 宿主机端口:容器端口，为了映射当前Linux端口和容器的端口
# --name 容器名称：指定容器名称
# 注意需要在阿里云安全组打开宿主机端口
```

```
查看正在运行的容器
docker ps 
# -a 查看全部容器
# -q 查看容器id

查看容器的日志
docker logs -f 容器id
# -f可以滚动查看日志

进入容器内部
docker exec -it 容器id bash

docker stop id
# 删除容器前，需要停止容器
docker rm id

docker start id
```

### Docker应用

```
# 将linux系统中的文件传到docker容器中
docker cp 文件名称 容器id:容器内部路径
docker cp ssm.war fe:/usr/local/tomcat/webapps/
```

### Docker自定义镜像

```ssh
中央仓库上的镜像，也是Docker的用户自己传过去的。

# 1. 创建一个Dockerfile文件，并且指定自定义镜像信息。
from: 指定当前自定义镜像依赖的环境
copy: 将相对路径下的内容复制到自定义镜像中
workdir: 声明镜像的默认工作目录
cmd: 需要执行的命令(workdir下执行的，cmd可以写多个，但只以最后一个为准)

# 2. 将准备好的Dockerfile和相应的文件拖拽到Linux操作系统中，通过Docker命令制作镜像
docker build -t 镜像名称:[tag]
```

### Docker-Compose







### 数据卷

数据卷：将宿主机中一个目录映射到容器的一个目录中，可以在宿主机中操作目录的内容，那么容器内部映射的文件，也会跟着一起改变

```
# 1. 创建数据卷
docker volume create 数据卷名称
# 创建数据卷之后，默认会存放在一个目录下 /var/lib/docker/volumes/数据卷名称/_data

# 2.查看数据卷的详细信息
docker volume inspect tomcat
查看所有数据卷
docker volume ls
docker volume rm 数据卷

# 3. 应用数据卷
# 当你映射数据卷时，如果数据卷不存在，Doker会帮你自动船舰
docker run -v 数据卷名称:容器内部路径 镜像id
#  直接指定一个路径作为数据卷的存放位置
docker run -v 路径:容器内部路径 镜像id
```







`docker pull images `

`docker ps -a` 查看本地容器

`docker images` 查看镜像

`docker top container`查看容器的所有进程

`docker [container] attach CONTAINER`：进入容器
				先按Ctrl-p，再按Ctrl-q可以挂起容器

docker rm/start/stop



