## 云服务器常用应用软件安装记录

说明：云服务器系统为centos7，yum install 需要注意设置enable对应版本。

1. 安装 redis

   ```shell
   yum install git
   ```

   

2. 安装 redis

   ```shell
   yum install -y redis
   vim /etc/redis.conf
   找到下面这一行bind 127.0.0.1注释掉#bind 127.0.0.1
   requirepass !pssword_ (密码需要修改)
   systemctl enable redis.service （开机启动）
   systemctl start redis.service -> systemctl status redis.service
   ```

   

3. 安装 nginx

   ```shell
   yum install -y nginx
   ```

   

4. 下载安装 mysql8

   ```shell
   wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
   rpm -Uvh mysql80-community-release-el7-3.noarch.rpm
   yum repolist all | grep mysql
   screen -D -RR (避免下载时间太长，连接断开)
   yum install mysql-community-server
   systemctl start mysqld.service
   systemctl status mysqld.service
   
   #mysql8设置账号密码
   grep 'temporary password' /var/log/mysqld.log
   mysql -uroot -p
   ALTER USER 'root'@'localhost' IDENTIFIED BY '!VDDdd357_';
   GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '!VDDdd357_' WITH GRANT OPTION;
   CREATE USER 'airson'@'%' IDENTIFIED BY '!VDDdd357_';
   CREATE USER 'itrunk'@'%' IDENTIFIED BY '!VDDdd357_';
   GRANT ALL PRIVILEGES ON *.* TO 'airson'@'%' IDENTIFIED BY '!VDDdd357_' WITH GRANT OPTION;
   GRANT ALL PRIVILEGES ON *.* TO 'itrunk'@'%' IDENTIFIED BY '!VDDdd357_' WITH GRANT OPTION;
   FLUSH PRIVILEGES;
   SELECT host,user FROM user;
   quit;
   
   #配置防火墙，开放3306端口
   firewall-cmd --zone=public --add-port=3306/tcp --permanent
   firewall-cmd --reload
   firewall-cmd --list-all
   
   #配置防火墙其他常用命令
   /////
       #临时关闭防火墙,重启后会重新自动打开
       systemctl restart firewalld
       #检查防火墙状态
       firewall-cmd --state
       firewall-cmd --list-all
       #Disable firewall
       systemctl disable firewalld
       systemctl stop firewalld
       systemctl status firewalld
       #Enable firewall
       systemctl enable firewalld
       systemctl start firewalld
       systemctl status firewalld
   ////
   ```

   

5. 下载安装 jdk-12#下载安装 jdk-12

   ```shell
   #oracle官网下载jdk需要登陆，注册账号后下载对应jdk,然后复制URL到linux,用wget下载（这个URL已包含了授权参数，可直接下载）
   #wget http://198.1.3.113:8080/pkg/jdk-8u181-linux-x64.rpm (第二种方案是本地起TOMCAT供服务器访问)
   wget jdk-12.0.1_linux-x64_bin.rpm?AuthParam=1557986409_48c70e13b64a91e0405e7670ff9be657 (参数需更新)
   rpm -ivh jdk-8u181-linux-x64.rpm
   java -version
   #设置JDK环境变量
   vi /ect/profile:
   	JAVA_HOME=/usr/java/jdk1.8.0_181
   	export PATH=$PATH:$JAVA_HOME/bin
   	source /etc/profile
   	echo $JAVA_HOME
   	echo $PATH
   ```

   

6. 下载安装 tomcat-9

   ```shell
   wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20.tar.gz
   tar -xvf apache-tomcat-9.0.20.tar.gz
   mv apache-tomcat-9.0.20 /usr/local/lh/
   ```

   

7. TODO

8. TODO

9. TODO

10. TODO

11. TODO

12. TODO

13. TODO

14. TODO

15. TODO

16. TODO

17. TODO





#
	
	



