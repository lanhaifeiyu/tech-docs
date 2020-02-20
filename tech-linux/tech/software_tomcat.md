## 云服务器软件之TOMCAT

1. ##### 安装tomcat

   ```shell
   #oracle官网下载jdk需要登陆，注册账号后下载对应jdk,然后复制URL到linux,用wget下载（这个URL已包含了授权参数，可直接下载）
   #wget http://198.1.3.113:8080/pkg/jdk-8u181-linux-x64.rpm (第二种方案是本地起TOMCAT供服务器访问)
   wget jdk-12.0.1_linux-x64_bin.rpm?AuthParam=1557986409_48c70e13b64a91e0405e7670ff9be657 #(参数需更新)
   rpm -Uvh jdk-12.0.1_linux-x64_bin.rpm
   java -version
   #设置JDK环境变量
   ##rpm安装jdk没有配置环境变量也能运行,是因为安装rpm的时候，/usr/bin下面的一个叫java的软链接，这个链接指向的就是java解压文件。
   ##vi /ect/profile:
   export JAVA_HOME=/usr/java/jdk-12.0.1
   export PATH=$PATH:$JAVA_HOME/bin
   ##更新文件，echo查看是否生效	
   source /etc/profile
   echo $JAVA_HOME
   echo $PATH
   
   ##更改目录权限
   chown -R lh /usr/local/lh/tomcat/ && chgrp -R lhfeiyu /usr/local/lh/tomcat/
   #更改服务运行权限
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
   
   #--设置pid文件
   touch /usr/local/lh/tomcat/tomcat.pid
   chown lh /usr/local/lh/tomcat/tomcat.pid & chgrp lhfeiyu /usr/local/lh/tomcat/tomcat.pid
   #
   vim /usr/local/lh/tomcat/bin/catalina.sh
   #airson add
   CATALINA_PID=/usr/local/lh/tomcat/tomcat.pid
   #CATALINA_PID=/usr/local/lh/nexus-3.16.1-02/nexus.pid
   #参考auth_sudoers.md配置对应权限
   #------
   https://blog.51cto.com/newthink/1775489
   https://blog.51cto.com/vekergu/1623700
   http://zhmgz.lofter.com/post/90909_aab67c8
   https://askubuntu.com/questions/692701/allowing-user-to-run-systemctl-systemd-services-without-password/774566
   sudo systemctl restart tomcat.service
   ```
   
   
   
2. ##### 配置tomcat服务

   ```shell
   #新增tomcat服务文件，
   #在/etc/systemd/system(/usr/lib/systemd/system)目录下创建tomcat.service文件，并编辑内容如下:
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
   
   #刷新配置
   systemctl daemon-reload 
   ```
   
   
   
3. tomcat配置JMX

   ```shell
   #1:编辑bin/catalina.sh,找到如下内容"#—–Execute The Requested Command"一行,在这行下面添加：
   JAVA_OPTS="-Djava.rmi.server.hostname=182.61.49 -Dcom.sun.management.jmxremote.port=7091 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
   #2:重启tomcat
   ```

   

4. ##### TODO

