 **一台Linux服务器上同时部署多个Tomcat方法需要注意事项**： https://blog.csdn.net/shmily_lsl/article/details/80718508 

 https://blog.csdn.net/wb96a1007/article/details/60968138 

#### 修改/etc/profile文件

```
export CATALINA_BASE=/usr/local/01more/apache-tomcat1
export CATALINA_HOME=/usr/local/01more/apache-tomcat1
export CATALINA_BASE_2=/usr/local/01more/apache-tomcat2
export CATALINA_HOME_2=/usr/local/01more/apache-tomcat2

source /etc/profile

bin下的catalina.sh
# yrh add
export CATALINA_BASE=$CATALINA_BASE_2
export CATALINA_HOME=$CATALINA_HOME_2

 修改端口号server.xml

```

