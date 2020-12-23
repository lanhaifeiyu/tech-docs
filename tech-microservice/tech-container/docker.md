 https://docs.docker.com/install/linux/docker-ce/centos/ 

 https://yeasy.gitbooks.io/docker_practice/introduction/what.html 

##### 2020年最完整的Docker v19.x入门教程: https://www.jianshu.com/p/6d44b7d1a267

##### win10使用WSL 2运行Docker Desktop，运行文件从C盘迁移到其他目录：https://cloud.tencent.com/developer/article/1679501

```shell
#1首先关闭 docker

#2关闭所有发行版：
wsl --shutdown

#3将 docker-desktop-data 导出（注意，原有的 docker images 不会一起导出）
wsl --export docker-desktop-data F:\wsl\docker-desktop-data\docker-desktop-data.tar

#4注销 docker-desktop-data：
wsl --unregister docker-desktop-data

#5重新导入 docker-desktop-data 到要存放的文件夹：F:\wsl\docker-desktop-data\：
wsl --import docker-desktop-data F:\wsl\docker-desktop-data\ F:\wsl\docker-desktop-data\docker-desktop-data.tar --version 2

#重启 docker，这下不用担心 C 盘爆满了！
```

```shell
#查看Docker的版本
docker version
docker info

#搜索镜像
docker search <镜像名>

#下载镜像
docker pull <用户名>/<镜像名>

#启动容器
docker run <用户名>/<镜像名> [命令]
# 在启动的容器中安装Ping
docker run <用户名>/<镜像名> apt-get install -y ping

#查看运行的容器
docker ps

#提交容器
docker commit <ID> <新名字>

#查看指定ID的容器信息
docker inspect <ID>

#查看有所有镜像
docker images


```

