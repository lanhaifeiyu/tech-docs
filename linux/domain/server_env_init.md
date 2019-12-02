## 云服务器初始化记录

说明：云服务器系统为centos7。

1. ##### 获取云服务器基本信息（区域、公网IP、内网IP），并将相关信息备份保存

2. ##### 获取服务器的root密码（这次是通过重置密码设置的root密码）

3. ##### 通过root账号远程连接服务器（网页版连接、xshell、putty等，推荐xshell）

4. ##### 创建工作目录

   ```shell
   mkdir -p /usr/local/lh/pkg/
   cd /usr/local/lh/pkg/
   ```

   

5. ##### 更换yum源到阿里云镜像，更新软件

   ```shell
   yum -y install wget
   mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
   wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
   yum clean all
   yum makecache
   yum check-update
   yum update
   ```

6. ##### 安装系统常用包：注意设置enable对应版本

   ```shell
   #常用命令：yum list | grep redis
   yum -y install epel-release (epel安装源,提供更多的软件包)
   yum install net-tools
   yum -y install wget
   yum install -y bash-completion （Tab键自动补全功能）
   yum -y install gcc-c++ 
   yum install htop （htop 是一个 Linux 下的交互式的进程浏览器，可以用来替换Linux下的top命令）
   yum install man-pages (是linux /unix 环境下命令与函数的帮助文档。)
   yum install vim-enhanced
   yum install screen (安装后才能使用命令：screen -D -RR)
   ```
   
   ·
   
7. ##### 安装常用应用软件：详细内容请参考 [domain/server_software_install.md](server_software_install.md)

   

8. ##### 创建普通用户、组，一般情况皆使用此用户进行操作（远程登陆、运行程序）

   ```shell
   useradd lh
   passwd lh
   groupadd lhfeiyu
   usermod -a -G lhfeiyu lh  (将用户lh加入组lhfeiyu)
   groups lh (查看用户lh加入的组)
   cat /etc/passwd (cat 命令用于连接文件并打印到标准输出设备上)
   cat /etc/group
   ```

   

9. ##### 修改软件相关权限及配置

   每个软件的相关权限及配置都已经在对应软件安装详情里面配置完成，需要关注的地方有：
   
   目录权限、服务运行权限、端口开放、日志（存放目录、压缩、清理）、配置参数、
   
   远程连接与访问、开机自启动、性能监控、资源占用等
   
   ```shell
   #https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html
   #https://blog.csdn.net/qq_36441027/article/details/80636526
   ```
   
   
   
10. ##### 为用户开放部分root权限

    操作步骤请参考[tech/auth_sudoers.md](../tech/auth_sudoers.md)

    ```shell
    #开放root权限的方式是：让普通用户可以通过sudo执行root权限的命令而不用输入root密码
    lh      ALL=(ALL)       NOPASSWD: /bin/systemctl restart tomcat.service,xx,xx,xx,xx,xx
    #建议可以开放的权限，以逗号分隔
    /bin/systemctl restart tomcat.service,
    /bin/systemctl restart mysql.service,
    /bin/systemctl restart nginx.service
    #普通用户执行方式：
    sudo systemctl restart tomcat.service
    ```

    

11. ##### 安全

    启用防火墙

    ```shell
    systemctl enable firewalld.service
    systemctl start firewalld.service
    systemctl status firewalld.service
    ```

    

12. TODO
