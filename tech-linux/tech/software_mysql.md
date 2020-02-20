## 云服务器软件之MYSQL

1. ##### 安装mysql

   ```shell
   wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
   rpm -Uvh mysql80-community-release-el7-3.noarch.rpm
   yum repolist all | grep mysql
   screen -D -RR (避免下载时间太长，连接断开)
   yum install mysql-community-server
   #启动mysql服务
   systemctl start mysqld.service
   #查看运行状态
   systemctl status mysqld.service
   #设置开机启动
   systemctl enable mysqld.service
   
   #mysql8设置账号密码
   ##查看自动生成的默认root密码
   grep 'temporary password' /var/log/mysqld.log
   mysql -uroot -p
   ##修改默认密码
   ALTER USER 'root'@'localhost' IDENTIFIED BY '!new_password';
   ##允许远程用root账号登陆（根据实际情况决定是否开启）,mysql8版本已经将创建账户和赋予权限的方式分开了
   #GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '!root_new_password' WITH GRANT OPTION;
   GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'
   ##创建普通用户，一般用普通用户操作数据库
   CREATE USER 'lh'@'%' IDENTIFIED BY '!lh_new_password';
   #GRANT ALL PRIVILEGES ON *.* TO 'lh'@'%' IDENTIFIED BY '!lh_new_password' WITH GRANT OPTION;
   GRANT ALL PRIVILEGES ON *.* TO 'lh'@'%'
   FLUSH PRIVILEGES;
   USE mysql;
   SELECT host,user FROM user;
   quit;
   
   #配置防火墙，开放3306端口
   firewall-cmd --zone=public --add-port=3306/tcp --permanent
   firewall-cmd --reload
   
   ```

   

2. ##### TODO

   ```shell
   
   ```
   