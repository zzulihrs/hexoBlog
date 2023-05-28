---
title: docker
tag: 后端
category: 后端
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

```
之前运行一个镜像，需要添加大量的参数
可以哦那个过Docker-compose编写这些参数
Docker-compose可以帮助我们批量管理容器
只需要通过一个docker-compose.yml文件去维护即可
```

```
# 1.去github下载docker-compose 1.24.1版本

# 2. 拖拽到linux上

# 3. 需要将docker-compose名字修改一下，并给其可执行的权限
mv docker-compose-Linux-x86_64 docker-compose
chmod 777 docker-compose

# 4. 为了方便后期操作，配置环境变量
# 将docker-compose文件移动到/usr/local，修改了/etc/profile
mv docker-compose /usr/local/bin
vim /etc/profile
export /usr/local/bin:$path
source /etc/profile
```







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

yml文件

```yml
version: '3.1'
service:
    mysql: #服务的名称
        restart: always # 代表只要docker启动，那么这个让其就跟着一起启动
        image: daocloud.io/library/mysql:5.7.4 # 指定镜路径
        container_name: mysql # 指定容器名称
        ports:
            - 3306:3306 # 指定端口号映射
        environment:
            MYSQL_ROOT_PASSWORD: root # 指定Mysql的ROOT用户登录密码
            TZ: Asia/Shanghai         # 指定时区
        volumes:
            - /opt/docker_mysql_tomcat/mysql_data:/var/lib/mysql # 映射数据卷
    tomcat:
        restart: always 
        image: daocloud.io/library/tomcat:8.5.16-jre8-alpine
        container_name: tomcat 
        ports:
            - 8080:8080 
        environment:
            MYSQL_ROOT_PASSWORD: root
            TZ: Asia/Shanghai         
        volumes:
            - /opt/docker_mysql_tomcat/tomcat_webapps:/usr/local/tomcat/webapps 
            - /opt/docker_mysql_tomcat/tomcat_logs:/usr/local/tomcat/logs
```



### 使用docker-compose命令管理容器

在使用docker-compose的命令时，默认会在当前目录下找到yml文件

```
# 1. 基于docker-compose.yml启动管理的容器
docker-compose up -d
# 2. 关闭并删除容器
docker-compose down
# 3. 开启或关闭已经存在的由docker-compose维护的容器
docker-compose start/stop/restart
# 4. 查看docker-compose管理的容器
docker-compose ps
# 5. 查看日志
docker-compose logs -f
```



### docker-compose配置Dockerfile使用

```
使用docker-compose.yml文件以及Dockerfile文件再生成自定义镜像的同时启动当前镜像，并且由docker-compose去管理容器
```

```
# yml 文件
version: '3.1'
service:
  ssm:
     restart: always
     build:   # 构建自定义镜像
        context: ../   # 指定Dockerfile文件的所在路径
        dockerfile: Dockerfile # 指定dockerfile文件名称
     images: ssm:1.0.1
     container_name: ssm
     ports:
        8081:8080
     environment:
        TZ: Asia/Shanghai
```

```
# dockerfile文件
from daocloud.io/library/tomcat:8.5.15-jre8
copy ssm.war /usr/local/tomcat/webapps
```

```
# 可以直接启动基于docker-compose.yml以及Dockerfile文件构建的自定义镜像
docker-compose up -d
# 重新构建自定义镜像
docker-compose build
# 运行前重新构建
docker-compose up -d -build
```

### Docker C运行I、CD

```
项目部由
	1. 将项目通过maven进行编译打包
	2. 将文件上传到指定的服务器
	3. 将war包放到tomcat的目录
	4. 通过Dockerfile将Tomcat和war包转成一个镜像，由DockerCompose去运行容器
项目更新：需要将上述流程再次重来一遍
```

#### CI介绍

```
CI(contimuous intergration) 持续集成
持续集成：编写代码时，完成了一个功能后，立即提交代码到Git仓库中，将项目重新的构建并且测试
* 快速发现错误
* 防止代码偏离主分支
```

### 实现持续集成

#### 搭建Gitlab服务器

```
1. 创建一个全新的虚拟机，并且至少指定4G的运行内存
2. 安装docker以及docker-compose
3. docker-compose.yml文件去安装gitlab服务器
```

实现持续交付持续部署

安装Jenkins

```
version: '3.1'
services:
    jenkins:
        image: jenkins/jenkins
        restart: always
        container_name: jenkins
        ports:
           - 8888:8080
           - 50000:50000
        volumes:
           - ./data:/var/jenkins_home
```

第一次运行时，会因为data目录没有权限，导致启动失败

chmod 777 data

docker-compose restart

输入密码，日志中可以看到



### 配置目标服务器及GitLab免密登录

```
GitLab -> Jenkins -> 目标服务器
1、jenkins去lian'jie
```

