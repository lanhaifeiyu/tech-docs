## LINUX模块之服务

1. ##### systemctl常用命令

   ```shell
   服务相关命令：
   systemctl + double tab #查看
   systemctl list-units #查看开启的所有服务
   systemctl start tomcat.service   #启动服务
   systemctl stop tomcat.service    #停止服务
   systemctl status tomcat.service  #查看服务状态
   systemctl enable tomcat.service  #启用服务
   systemctl disable tomcat.service #停用服务
   systemctl reload tomcat.service  #重新启动服务
   systemctl daemon-reload #刷新服务配置
   
   ```
   
2. ##### 服务的配置文件

   ```shell
   vim /etc/systemd/system/prometheus.service
   
   [Unit]
   Description=tomcat
   After=network.target
   
   [Service]
   User=lh
   Group=lhfeiyu
   
   Type=forking
   PIDFile=/usr/local/lh/tomcat/tomcat.pid
   ExecStart=/usr/local/lh/tomcat/bin/startup.sh
   #ExecReload=/usr/local/lh/tomcat/bin/startup.sh & /usr/local/lh/tomcat/bin/shutdown.sh
   #ExecStop=/usr/local/lh/tomcat/bin/shutdown.sh
   ExecReload=/bin/kill -s HUP $MAINPID
   ExecStop=/bin/kill -s QUIT $MAINPID
   PrivateTmp=true
   Restart=always
   
   [Install]
   WantedBy=multi-user.target
   
   Warning: prometheus.service changed on disk. Run 'systemctl daemon-reload' to reload units.
   systemctl daemon-reload
   ```

   <https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html>
   
    https://www.cnblogs.com/GaZeon/p/7090874.html 

