## 云服务器软件之NGINX

###### 目录索引：

[1.安装nginx](#安装nginx)

[2.nginx最简配置](#nginx最简配置文件 - /etc/nginx/nignx.conf)

1. ##### 安装nginx

   ```shell
   #设置nginx安装源(直接yum install有很可能不是最新版本)
   vim /etc/yum.repos.d/nginx.repo
       [nginx]
       name=nginx repo
       baseurl=http://nginx.org/packages/centos/7/$basearch/
       gpgcheck=0
       enabled=1
   yum install -y nginx 
   systemctl enable nginx
   systemctl start nginx
   systemctl status nginx
   
   #配置防火墙，开放对应端口
   firewall-cmd --zone=public --add-port=8081/tcp --permanent
   firewall-cmd --reload
   #更新配置文件 /etc/nginx/nignx.conf，参看nginx最简配置.md
   #修改文件权限
   chown -R lh /var/log/nginx/ && chgrp -R lhfeiyu /var/log/nginx/
   chown -R lh /etc/nginx/ && chgrp -R lhfeiyu /etc/nginx/
   #更改服务运行权限
   #nginx: 修改nginx服务的启动权限，编辑/usr/lib/systemd/system/nginx.service:
   [Service]
   User=lh
   Group=lhfeiyu
      
   #刷新
   systemctl daemon-reload
   
   #访问ngnix
   http://182.61.49.180:8081/
   ```

   

2. ##### nginx最简配置文件 - /etc/nginx/nignx.conf

   ```shell
   
   user  nginx;
   worker_processes  1;
   
   error_log  /var/log/nginx/error.log warn;
   pid        /var/run/nginx.pid;
   
   
   events {
       worker_connections  1024;
   }
   
   
   http {
       include       /etc/nginx/mime.types;
       default_type  application/octet-stream;
   
       log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                         '$status $body_bytes_sent "$http_referer" '
                         '"$http_user_agent" "$http_x_forwarded_for"';
   
       access_log  /var/log/nginx/access.log  main;
   
       sendfile        on;
       #tcp_nopush     on;
   
       keepalive_timeout  65;
   
       #gzip  on;
   
       include /etc/nginx/conf.d/*.conf;
   
       upstream general {
           server  182.61.49.180:8080 max_fails=2 fail_timeout=600s;
           server  182.61.49.180:8080 backup;
       }
       
       server{
           listen 8081;
           server_name localhost;
   
           location / {
               proxy_pass http://general;
           }
       }
   
   }
   ```

   

3. 跨域

   ```nginx
   http {
       add_header Access-Control-Allow-Origin *;
       add_header Access-Control-Allow-Headers X-Requested-With;
       add_header Access-Control-Allow-Methods GET,POST,OPTIONS;
        server {
       }
   }
   ```

4. 重定向，

   