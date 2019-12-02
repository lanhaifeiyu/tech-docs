## 云服务器软件之其他软件

1. ##### 安装git

   ```shell
   yum install git
   ```
   
2. ##### 安装Nenux

   1. 下载、解压
   
   ```shell
   cd /usr/local/lh/pkg
   #下载
   wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-3.16.1-02-unix.tar.gz
   #解压到上级目录
   tar zxvf nexus-3.16.1-02-unix.tar.gz -C../    
   ```
   2. 运行（默认端口8081）
      ```shell
      #到bin目录
       cd /usr/local/lh/nexus-3.16.1-02/bin
      #运行
      ./nexus run
      ```
   3. 出现异常(The version of the JVM must be 1.8)
   设置Nexus依赖的JAVA环境（正常情况不用设置，因nexus 3+以上版本只能依赖jdk1.8，服务器中安装build 12.0.1+12，所以需要再安装一个jdk1.8,并把INSTALL4J_JAVA_HOME_OVERRIDE指向jdk1.8路径）
![设置Java jdk配置](http://assets.airson.cc/img/tech/linux/soft/Nexus/Nexus%E9%85%8D%E7%BD%AEJava%E7%8E%AF%E5%A2%83-00.jpg)
![修改配置INSTALL4J_JAVA_HOME_OVERRIDE](http://assets.airson.cc/img/tech/linux/soft/Nexus/Nexus%E9%85%8D%E7%BD%AEJava%E7%8E%AF%E5%A2%83-02.jpg)
   4. 开放端口
[开放端口](https://github.com/lanhaifeiyu/tech-docs/blob/develop/server/tech/module_firewall.md)

   5. 配置Service
   ```shell
   #进入目录
   cd /etc/systemd/system
   #创建Nexus服务
   vim nexus.service
   ```
   添加配置：
   ```shell
   [Unit]
   Description=nexus
   After=network.target
   
   [Service]
   User=lh
   Group=lhfeiyu
   
   Type=forking
   ExecStart=/usr/local/lh/nexus-3.16.1-02/bin/nexus start
   ExecReload=/usr/local/lh/nexus-3.16.1-02/bin/nexus stop & /usr/local/lh/nexus-3.16.1-02/bin/nexus start
   ExecStop=/usr/local/lh/nexus-3.16.1-02/bin/nexus start
   PrivateTmp=true
   
   [Install]
   WantedBy=multi-user.target
   ```

   ```shell
   # 刷新配置
   sudo systemctl daemon-reload
   #配置自动启动
   sudo systemctl enable nexus.service
   # 启动
   sudo systemctl start nexus.service
   ```

   6. 说明
   ```shell
      [Unit]:服务的说明
      
      Description:描述服务
      After:描述服务类别
      [Service]服务运行参数的设置
      
      Type=forking是后台运行的形式
      ExecStart为服务的具体运行命令
      ExecReload为重启命令
      ExecStop为停止命令
      PrivateTmp=True表示给服务分配独立的临时空间
      注意：[Service]的启动、重启、停止命令全部要求使用绝对路径
      [Install]服务安装的相关设置，可设置为多用户 
   ```
   
3. ##### Jenkins

jdk选择1.8