## Jenkins使用

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


3. 

4. 提示插件下载失败，更换镜像，进入页面http://106.13.20.220:8080/pluginManager/advanced，将底部https://mirrors.tuna.tsinghua.edu.cn/jenkins/

5. 运行脚本

   # stop.sh

   ```
   #!/bin/bash
   echo "Stopping Eureka Application"
   pid=`ps -ef | grep eurekaserver-0.0.2-SNAPSHOT.jar | grep -v grep | awk '{print $2}'`
   if [ -n "$pid" ]
   then
      kill -9 $pid
   fi
   ```

   # replace.sh

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

   # startup.sh

   ```# startup.sh 启动项目
#!/bin/sh
echo "授予当前用户权限"
chmod 777 /usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar
echo "执行....."
java -jar /usr/local/lh/workspace/eurekaserver-0.0.2-SNAPSHOT.jar
   ```

6. Jenkins中执行shell（缺图片）

   ```
   /usr/local/lh/scripts/stop.sh
   /usr/local/lh/scripts/replace.sh
   BUILD_ID=dontKillMe nohup /usr/local/lh/scripts/startup.sh &
   ```

   

