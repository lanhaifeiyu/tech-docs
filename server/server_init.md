## 云服务器初始化记录

说明：云服务器系统为centos7。

1. 获取云服务器基本信息（区域、公网IP、内网IP），并将相关信息备份保存

2. 获取服务器的root密码（这次是通过重置密码设置的root密码）

3. 通过root账号远程连接服务器（网页版连接、xshell、putty等，推荐xshell）

4. 创建工作目录

   ```shell
   mkdir -p /usr/local/lh/pkg/
   cd /usr/local/lh/pkg/
   ```

   

5. 更换yum源到阿里云镜像，更新软件

   ```shell
   yum -y install wget
   mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
   wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
   yum clean all
   yum makecache
   yum check-update
   yum update
   ```

6. 安装系统常用包：注意设置enable对应版本

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
   
   ```
   
   ·
   
7. 安装常用应用软件：详细内容请参考 server_install.md

   

8. 创建普通用户、组，一般情况皆使用此用户进行操作（远程登陆、运行程序）

   ```shell
   useradd lh
   passwd lh
   groupadd lhfeiyu
   usermod -a -G lhfeiyu lh  (将用户lh加入组lhfeiyu)
   groups lh (查看用户lh加入的组)
   cat /etc/passwd
   cat /etc/group
   ```

   

9. 修改文件目录的权限，切换到用户lh，启动对应软件

   ```
   chmod
   ```

   

10. 

