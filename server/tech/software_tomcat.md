## 云服务器软件之TOMCAT

1. ##### 安装tomcat

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
   #.
   #访问ngnix
   http://182.61.49.180:8081/
   ```

   

2. ##### 配置tomcat服务

   ```
   #刷新
   systemctl daemon-reload
   
   #tomcat: 新增tomcat服务文件，在 /usr/lib/systemd/system (/etc/systemd/system ) 目录下创建tomcat.service文件，并编辑内容如下
   [Unit]
   Description=tomcat
   After=network.target
   
   [Service]
   User=lh
   Group=lhfeiyu
   
   Type=forking
   ExecStart=/usr/local/lh/tomcat/bin/startup.sh
   ExecReload=/usr/local/lh/tomcat/bin/shutdown.sh & /usr/local/lh/tomcat/bin/startup.sh
   ExecStop=/usr/local/lh/tomcat/bin/shutdown.sh
   PrivateTmp=true
   
   [Install]
   WantedBy=multi-user.target
   ```
   
   
   
3. ##### TODO