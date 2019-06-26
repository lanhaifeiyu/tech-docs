# Jenkins使用

## 安装Jenkins

1. 安装好Jenkins，jdk使用1.8

   若提示jdk版本不对,则在jenkins中添加jdk1.8的位置/usr/local/lh/pkg/jdk1.8.0_212/bin/java

   ```vim /etc/rc.d/init.d/jenkins
   vim /etc/rc.d/init.d/jenkins
   ```

   ```candidates="
   candidates="
   /usr/local/lh/pkg/jdk1.8.0_212/bin/java
   /etc/alternatives/java
   /usr/lib/jvm/java-1.8.0/bin/java
   /usr/lib/jvm/jre-1.8.0/bin/java
   /usr/lib/jvm/java-1.7.0/bin/java
   /usr/lib/jvm/jre-1.7.0/bin/java
   /usr/lib/jvm/java-11.0/bin/java
   /usr/lib/jvm/jre-11.0/bin/java
   /usr/lib/jvm/java-11-openjdk-amd64
   /usr/bin/java
   "
   
   ```

2. 打开106.13.20.220:8080,若提示“该Jenkins实例似乎已离线。”

   1. 因jenkins在安装插件时需要检查网络，默认是访问google的，但国内必须×××才可以，所以这就坑啦，完全没有照顾到我们的感受吗，在这里需要修改成www.baidu.com

      ```vim /var/lib/jenkins/updates/default.json```

   2. 进入页面http://106.13.20.220:8080/pluginManager/advanced，将底部https://mirrors.tuna.tsinghua.edu.cn/jenkins/

3. 提示插件下载失败，更换镜像，进入页面http://106.13.20.220:8080/pluginManager/advanced，将底部https://mirrors.tuna.tsinghua.edu.cn/jenkins/

## 配置Jenkins

1. 插件安装

   若网络不好的话自动安装失败，可以选择手动上传插件，地址：<http://106.13.20.220:8080/pluginManager/advanced>

   ![1561518733639](.\assets\img\1561518733639.png)

   插件下载地址：<https://mirrors.tuna.tsinghua.edu.cn/jenkins/plugins/>，<https://updates.jenkins.io/download/plugins/>

2. 全局配置

   创建项目之前先要对 Jenkins 进行基本的配置，比如 jdk 的目录，git 命令的目录和 maven 的目录等等

   1. 添加凭据

      ![1561519320531](.\assets\img\1561519320531.png)

      类型选择SSH Username private key，Private Key填Jenkins服务器上生成的

      ![1561519586851](.\assets\img\1561519586851.png)
   
      ![1561519510144](.\assets\img\1561519510144.png)
   
      配置好git,用ssh的方式拉取代码，并把生成的私钥复制到凭证的Private Key中。Git设置SSH的方式看另一篇文章《git》

## 新建任务

1. 配置源代码地址

   ![1561531043943](.\assets\img\1561531043943.png)

2. 运行脚本

   ![1561531103209](.\assets\img\1561531103209.png)

   - Jenkins中执行shell

   ```
   /usr/local/lh/scripts/stop.sh
   /usr/local/lh/scripts/replace.sh
   BUILD_ID=dontKillMe nohup /usr/local/lh/scripts/startup.sh &
   ```
   
   - stop.sh
   
   ```
#!/bin/bash
   echo "Stopping Eureka Application"
pid=`ps -ef | grep eurekaserver-0.0.2-SNAPSHOT.jar | grep -v grep | awk '{print $2}'`
   if [ -n "$pid" ]
   then
      kill -9 $pid
   fi
   ```
   
   - replace.sh
   
   ```
   #用于将上次构建的结果备份，然后将新的构建结果移动到合适的位置
   #!/bin/bash
   #先判断文件是否存在，如果存在，则备份
file="/usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar"
   if [ -f "$file" ]
then
   mv /usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar /usr/local/lh/workspace/bak/eurekaserver-0.0.2-SNAPSHOT.jar.`date +%Y%m%d%H%M%S`
   fi
   mv /var/lib/jenkins/workspace/tech-site/target/eurekaserver-0.0.2-SNAPSHOT.jar /usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar
   
   ```
   
   - startup.sh

   ```# startup.sh 启动项目
#!/bin/sh
   echo "授予当前用户权限"
   chmod 777 /usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar
   echo "执行....."
   java -jar /usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar
   ```


### 参考博客

<https://www.daimafans.com/article/d5700685599342592-p1-o1.html>