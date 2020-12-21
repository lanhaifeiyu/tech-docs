 https://docs.docker.com/install/linux/docker-ce/centos/ 

 https://yeasy.gitbooks.io/docker_practice/introduction/what.html 

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

