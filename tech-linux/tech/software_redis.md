## 云服务器软件之REDIS

1. ##### 安装redis

   ```shell
   yum install -y redis
   vim /etc/redis.conf
   #找到下面这一行bind 127.0.0.1注释掉#bind 127.0.0.1
   requirepass !pssword_ (密码需要修改)
   systemctl enable redis.service （开机启动）
   systemctl start redis.service -> systemctl status redis.service
   ```
   
   
   
2. ##### TODO

   ```shell
   
   ```
   