## 云服务器软件之RABBITMQ

https://ken.io/note/centos7-rabbitmq-install-setup

https://ken.io/note/centos7-erlang-install

1. ##### 安装Erlang

   ```shell
   #低于22的版本可以设置yum源，22.0目前只能手动编译安装
   ######方式一：手动编译安装22.0######
   #安装必要依赖(需要依赖JDK，由于已经安装，这里就去掉了)
   sudo yum install -y gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf git
   #下载
   screen -D -RR
   cd /usr/local/lh/pkg/
   wget http://erlang.org/download/otp_src_22.0.tar.gz
   #解压
   tar -zvxf otp_src_22.0.tar.gz
   #编译&安装
   cd otp_src_22.0
   ./otp_build autoconf
   ./configure && make && sudo make install
   #验证 进入erlang命令行表示成功
   erl
   
   ######方式二：yum安装版本21######
   #创建yum源
   sudo vi /etc/yum.repos.d/rabbitmq-erlang.repo
   
   #文件内容
   [rabbitmq-erlang]
   name=rabbitmq-erlang
   baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/21/el/7
   gpgcheck=1
   gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
   repo_gpgcheck=0
   enabled=1
   
   #安装
   sudo yum install -y erlang
   #验证 进入erlang命令行表示成功
   erl
   ```

2. ##### 安装socat

   Socat 是 Linux 下的一个多功能的网络工具，名字来由是 「Socket CAT」。其功能与有瑞士军刀之称的 Netcat 类似，可以看做是 Netcat 的加强版。

   Socat 的主要特点就是在两个数据流之间建立通道，且支持众多协议和链接方式。如 IP、TCP、 UDP、IPv6、PIPE、EXEC、System、Open、Proxy、Openssl、Socket等。

   ```
   sudo yum install -y socat
   ```

   

3. ##### 安装rabbitmq

   ```shell
   #官网下载地址：https://www.rabbitmq.com/install-rpm.html
   sudo rpm -Uvh https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.15/rabbitmq-server-3.7.15-1.el7.noarch.rpm
   
   #如果遇到erlang已安装且版本正确，但是RabbitMQ检测失败的情况，可以追加参数 —-nodeps （不验证软件包依赖）
   # rpm -Uvh —-nodeps https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.15/rabbitmq-server-3.7.15-1.el7.noarch.rpm
   
   #设置为开机启动
   sudo systemctl enable rabbitmq-server
   #启动服务
   sudo systemctl start rabbitmq-server
   #查看状态
   sudo systemctl status rabbitmq-server
   
   #配置防火墙，开放5672端口
   firewall-cmd --zone=public --add-port=5672/tcp --permanent
   firewall-cmd --reload
   
   rabbitmqctl add_user  lh keep123!
   rabbitmqctl set_user_tags lh administrator
   
   #https://blog.csdn.net/zht741322694/article/details/82801873
   #给用户授予了角色，只能登录控制台，但是没有给读写以及管理队列的权限，通过控制台admin按钮查看角色权限，这里给新建的lh角色设置读写权限
   rabbitmqctl set_permissions -p / lh ".*" ".*" ".*"
   
   ```

   

4. ##### RabbitMQ常用命令

   ```shell
   # 添加用户
   sudo rabbitmqctl add_user <username> <password>  
   
   # 删除用户
   sudo rabbitmqctl delete_user <username>  
   
   # 修改用户密码
   sudo rabbitmqctl change_password <username> <newpassword>  
   
   # 清除用户密码（该用户将不能使用密码登陆，但是可以通过SASL登陆如果配置了SASL认证）
   sudo rabbitmqctl clear_password <username> 
   
   # 设置用户tags（相当于角色，包含 administrator，monitoring，policymaker，management）
   sudo rabbitmqctl set_user_tags <username> <tag>
   
   # 列出所有用户
   sudo rabbitmqctl list_users  
   
   # 创建一个vhosts
   sudo rabbitmqctl add_vhost <vhostpath>  
   
   # 删除一个vhosts
   sudo rabbitmqctl delete_vhost <vhostpath>  
   
   # 列出vhosts
   sudo rabbitmqctl list_vhosts [<vhostinfoitem> ...]  
   
   # 针对一个vhosts给用户赋予相关权限；
   sudo rabbitmqctl set_permissions [-p <vhostpath>] <user> <conf> <write> <read>  
   
   # 清除一个用户对vhosts的权限；
   sudo rabbitmqctl clear_permissions [-p <vhostpath>] <username>  
   
   # 列出哪些用户可以访问该vhosts；
   sudo rabbitmqctl list_permissions [-p <vhostpath>]   
   
   # 列出用户访问权限；
   sudo rabbitmqctl list_user_permissions <username>
   ```

   

5. ##### RabbitMQ实战：界面管理和监控

   ```shell
   #https://blog.csdn.net/zht741322694/article/details/82801873
   #https://juejin.im/post/5ad1d975f265da238e0e2cd4
   #通过下面的命令启用web管理插件：
   rabbitmq-plugins enable rabbitmq_management
   #配置防火墙，开放15672端口
   firewall-cmd --zone=public --add-port=15672/tcp --permanent
   firewall-cmd --reload
   
   #访问管理界面 lh/keep123!
   http://182.61.49.180:15672/
   
   ```

6. DONE



