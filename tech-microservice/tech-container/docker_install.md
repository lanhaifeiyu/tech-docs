https://docs.docker.com/engine/install/centos/
https://www.cnblogs.com/andrew3/p/12941903.html

```shell
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
sudo yum install -y yum-utils  
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

sudo docker run hello-world
```



##### [IDEA连接远程服务器Docker部署Spring Boot项目](https://www.cnblogs.com/andrew3/p/13043042.html): https://www.cnblogs.com/andrew3/p/13043042.html







