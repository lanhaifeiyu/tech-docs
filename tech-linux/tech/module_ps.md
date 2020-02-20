## LINUX模块之进程

#### 查看linux中某个端口（port）是否被占用

1.使用lsof ，例如：lsof -i:80

2.使用netstat ，例如：netstat -anp|grep 80 

ps -ef|grep tomcat



#### 如何实现SSH断开后 进程仍然在后台运行

https://blog.csdn.net/v1v1wang/article/details/6855552

nohup command &

