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










