## 云服务器常用应用软件安装记录

说明：云服务器系统为centos7，yum install 需要注意设置enable对应版本。

##### 防火墙相关命令参考[tech/module_firewall.md](../tech/module_firewall.md)

##### 服务相关命令参考[tech/module_systemctl.md](../tech/module_systemctl.md)

目录索引：

[安装 git](#安装 git)

[安装 redis](#安装 redis)

[安装 redis](#安装 nginx)

[下载安装 mysql-8](#下载安装 mysql-8)

[下载安装 jdk-12](#下载安装 jdk-12)

[下载安装 tomcat-9](#下载安装 tomcat-9)

1. ##### 安装 git

   ```shell
   yum install git
   ```

   

2. ##### 安装 redis

   ```shell
   yum install -y redis
   vim /etc/redis.conf
   #找到下面这一行bind 127.0.0.1注释掉#bind 127.0.0.1
   requirepass !pssword_ #密码需要修改
   systemctl enable redis.service #开机启动
   systemctl start redis.service
   systemctl status redis.service
   #TODO:端口开放、权限配置
   ```

   

3. ##### 安装 nginx

   - 设置nginx安装源(直接yum install有很可能不是最新版本)

     ```shell
     vim /etc/yum.repos.d/nginx.repo
     [nginx]
     name=nginx repo
     baseurl=http://nginx.org/packages/centos/7/$basearch/
     gpgcheck=0
     enabled=1
     ```

   - 安装

     ```shell
     yum install -y nginx 
     systemctl enable nginx
     systemctl start nginx
     systemctl status nginx
     ```
     
   - 配置防火墙，开放对应端口

     ```shell
     #80,443,8080,8081
     firewall-cmd --add-port=80/tcp --zone=public --permanent
     firewall-cmd --add-port=443/tcp --zone=public --permanent
     firewall-cmd --add-port=8080/tcp --zone=public --permanent
     firewall-cmd --add-port=8081/tcp --zone=public --permanent
     firewall-cmd --reload
     ```

   - 更新配置文件 /etc/nginx/nignx.conf，详情参照[tech/software_nginx.md](../tech/software_nginx.md)中的：nginx最简配置

   - 修改文件权限

     ```shell
     chown -R lh /var/log/nginx/ && chgrp -R lhfeiyu /var/log/nginx/
     chown -R lh /etc/nginx/ && chgrp -R lhfeiyu /etc/nginx/
     ```

   - 更改服务运行权限

     ```shell
     vim /usr/lib/systemd/system/nginx.service
     [Service]
     User=lh
     Group=lhfeiyu
     
     #刷新
     systemctl daemon-reload
     systemctl reload nginx
     ```

   - 访问nginx，http://182.61.49.180:8081/

4. ##### 下载安装 mysql-8

   - 下载安装

     ```shell
     #下载 官网下载页面：https://dev.mysql.com/downloads/repo/yum/
     wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
     #安装
     rpm -Uvih mysql80-community-release-el7-3.noarch.rpm
     yum repolist all | grep mysql
     screen -D -RR #避免下载时间太长，连接断开
     yum install mysql-community-server
     #启动mysql服务
     systemctl enable mysqld.service
     systemctl start mysqld.service
     systemctl status mysqld.service
     ```

   - 设置账号密码

     ```shell
     #查看自动生成的默认root密码
     grep 'temporary password' /var/log/mysqld.log
     mysql -uroot -p
     #修改默认密码
     ALTER USER 'root'@'localhost' IDENTIFIED BY '!new_password';
     #允许远程用root账号登陆（根据实际情况决定是否开启）,mysql8版本已经将创建账户和赋予权限的方式分开了
     #GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '!root_new_password' WITH GRANT OPTION;
     GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'
     #创建普通用户，一般用普通用户操作数据库
     CREATE USER 'lh'@'%' IDENTIFIED BY '!lh_new_password';
     #GRANT ALL PRIVILEGES ON *.* TO 'lh'@'%' IDENTIFIED BY '!lh_new_password' WITH GRANT OPTION;
     GRANT ALL PRIVILEGES ON *.* TO 'lh'@'%'
     FLUSH PRIVILEGES;
     USE mysql;
     SELECT host,user FROM user;
     quit;
     ```

   - 配置防火墙，开放3306端口

     ```shell
     firewall-cmd --zone=public --add-port=3306/tcp --permanent
     firewall-cmd --reload
     ```

   - 修改目录及服务权限

     ```SHELL
     #TODO
     ```

5. ##### 下载安装 jdk-12

   - 下载安装

     ```shell
     #oracle官网下载jdk需要登陆，注册账号后下载对应jdk,然后复制URL到linux,用wget下载（这个URL已包含了授权参数，可直接下载）
     #官网下载页面：https://www.oracle.com/technetwork/java/javase/downloads/index.html
     
     #wget http://198.1.3.113:8080/pkg/jdk-8u181-linux-x64.rpm (第二种方案是本地起TOMCAT供服务器访问)
     #13.0.1 （官网产生实时AuthParam）
     https://download.oracle.com/otn-pub/java/jdk/13.0.1+9/cec27d702aa74d5a8630c65ae61e4305/jdk-13.0.1_linux-x64_bin.rpm?AuthParam=1574912044_933b10dffa6d32d7931612c7b1e7f586 
     
     rpm -Uvih jdk-13.0.1_linux-x64_bin.rpm
     whereis java # /usr/bin/java
     ll /usr/bin/java #/usr/bin/java -> /etc/alternatives/java
     ll /etc/alternatives/java #/etc/alternatives/java -> /usr/java/jdk-13.0.1/bin/java
     java -version
     ```

   - 设置环境变量

   ```shell
   #rpm安装jdk没有配置环境变量也能运行,是因为安装rpm的时候，/usr/bin下面的一个叫java的软链接，这个链接指向的就是java解压文件。
   #vi /ect/profile:
   #airson-yrh add
   export JAVA_HOME=/usr/java/jdk-13.0.1
   export PATH=$PATH:$JAVA_HOME/bin
   #更新文件，echo查看是否生效	
   source /etc/profile
   echo $JAVA_HOME
   echo $PATH
   ```

6. ##### 下载安装 tomcat-9

   - 下载安装

     ```shell
     #官网下载页面：https://tomcat.apache.org/download-90.cgi
     wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-9/v9.0.29/bin/apache-tomcat-9.0.29.tar.gz
     tar -zxvf apache-tomcat-9.0.29.tar.gz
     mv apache-tomcat-9.0.29 /usr/local/lh/tomcat
     #启动tomcat
     cd /usr/local/lh/tomcat
     ./bin/startup.sh
     #查看tomcat进程
     ps -ef|grep tomcat
     ```

   - 配置防火墙，开放对应端口

     ```shell
     firewall-cmd --add-port=8080/tcp --zone=public --permanent
     firewall-cmd --reload
     ```

   - 修改目录及服务权限

     ```shell
     #TODO
     ```

   - tomcat配置JMX(主要用于远程性能监控-JMC，可忽略)

     ```shell
     #1:编辑bin/catalina.sh,找到如下内容"#—–Execute The Requested Command"一行,在这行下面添加：
     JAVA_OPTS="-Djava.rmi.server.hostname=182.61.49 -Dcom.sun.management.jmxremote.port=7091 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
     #2:重启tomcat
     ```

   - 访问tomcat，http://182.61.49.180:8080/

   

7. ##### 安装kafka / ZooKeeper

   ```shell
   #kafka官网下载页面：https://kafka.apache.org/downloads
   wget http://mirror.bit.edu.cn/apache/kafka/2.3.1/kafka_2.12-2.3.1.tgz
   #ZooKeeper官网下载页面：https://www.apache.org/dyn/closer.cgi/zookeeper/
   wget http://mirror.bit.edu.cn/apache/zookeeper/current/apache-zookeeper-3.5.6-bin.tar.gz
   
   tar -zxvf kafka_2.12-2.3.1.tgz
   tar -zxvf apache-zookeeper-3.5.6-bin.tar.gz
   mv kafka_2.12-2.3.1 /usr/local/lh/kafka
   mv apache-zookeeper-3.5.6-bin.tar.gz /usr/local/lh/zookeeper
   
   #复制/usr/local/lh/zookeeper/conf/zoo_sample.cfg为zoo.cfg，修改zoo.cfg中的dataDir
   cp zoo_sample.cfg zoo.cfg
   mkdir -p /home/lh/log/zookeeper
   mkdir -p /home/lh/log/kafka
   mkdir -p /home/lh/log/tomcat
   mkdir -p /home/lh/log/redis
   mkdir -p /home/lh/log/nginx
   
   #修改/usr/local/lh/kafka/config/server.properties中的log.dir，确认zookeeper.connect
   log.dirs=/home/lh/kafka
   listeners=PLAINTEXT://localhost:9092
   advertised.listeners=PLAINTEXT://localhost:9092
   
   mkdir -p /home/lh/log/nohup
   
   #启动zookeeper 
   #nohup /usr/local/lh/zookeeper/bin/zkServer.sh > /home/lh/log/nohup/zookeeper.log 2>&1 &
   #由于zkServer.sh的start分支中已经使用了 nohup command 2>&1 < /dev/null &，可以直接使用zkServer.sh start
   /usr/local/lh/zookeeper/bin/zkServer.sh start
   
   #启动kafka 
   nohup /usr/local/lh/kafka/bin/kafka-server-start.sh /usr/local/lh/kafka/config/server.properties > /home/lh/log/nohup/kafka.log 2>&1 &
   
   #防火墙
   firewall-cmd --add-port=9092/tcp --zone=public --permanent
   firewall-cmd --reload
   
   #查看是否9092是否在监听
   netstat -lptu
   
   kafka-topics.sh -list -zookeeper localhost:2181
   ```

   

8. ##### 安装rabbitmq

9. ##### elasticsearch / solr

10. ##### docker / docker swarm / kubernetes

11. ##### spring boot jar

12. ##### TODO

13. ##### TODO

14. ##### TODO

15. ##### 安装prometheus-grafana

16. ##### TODO





#
	
	



