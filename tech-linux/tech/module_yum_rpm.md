## LINUX模块之软件管理

1. ##### yum常用命令

   ```
   
   ```

2. ##### 更换yum源到阿里云镜像，更新软件

   ```shell
   yum -y install wget
   mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
   wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
   yum clean all
   yum makecache
   yum check-update
   yum update
   yum list installed | grep elasticsearch
   yum update elasticsearch
   ```

3. ##### 安装系统常用包：注意设置enable对应版本

   ```shell
   #常用命令：yum list | grep redis
   yum -y install epel-release (epel安装源,提供更多的软件包)
   yum install net-tools
   yum -y install wget
   yum install -y bash-completion
   yum -y install gcc-c++ 
   yum install htop
   yum install man-pages
   yum install vim-enhanced
   yum install screen (安装后才能使用命令：screen -D -RR)
   yum -y upgrade
   ```

   

4. ##### TODO

5. ```shell
   rpm -ivh your-package.rpm
   
   ```


   ```
#安装包的下载缓存目录 https://blog.csdn.net/zhezhebie/article/details/74980072
   /var/cache/yum/x86_64/7/elastic-7.x/packages（有问题，只有几M）


   ```

##### [查看RPM包依赖](https://blog.csdn.net/nklinsirui/article/details/80159116)

```shell
查看.rpm 包依赖：
rpm -qpR [package]
安装.rpm 包时，如果缺少依赖，报错信息中会打印出缺少的依赖：
rpm -ivh [package]
通过查询 https://pkgs.org/ 来查询包的依赖关系。
通过yum install --downloadonly --downloaddir=[download_dir] [package] 来只下载包不安装包
运行yum list [package] --showduplicates 来查看包的多个版本

rpm -qa | grep docker
*运行rpm -ql [package]，比如：
rpm -ql jenkins
运行yum list installed | grep [package] ， 比如：
yum list installed | grep docker
```

