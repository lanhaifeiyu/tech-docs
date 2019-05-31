## 云服务器软件之其他软件

1. ##### 安装git

   ```shell
   yum install git
   ```
   
   
   
2. ##### 安装Nenux

   ```shell
   cd /usr/local/lh/pkg
   #下载
   wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-3.16.1-02-unix.tar.gz
   #解压到上级目录
   tar zxvf nexus-3.16.1-02-unix.tar.gz -C../  
   #到bin目录
   cd /usr/local/lh/nexus-3.16.1-02/bin
   #设置Nexus依赖的JAVA环境（正常情况不用设置，因nexus 3+以上版本只能依赖jdk1.8，服务器中安装build 12.0.1+12，所以需要再安装一个jdk1.8,并把    INSTALL4J_JAVA_HOME_OVERRIDE指向jdk1.8路径）

   #运行
   ./nexus run

   #异常
   http://assets.airson.cc/img/tech/linux/soft/Nexus/Nexus%E9%85%8D%E7%BD%AEJava%E7%8E%AF%E5%A2%83-00.jpg
   
   ```
   
