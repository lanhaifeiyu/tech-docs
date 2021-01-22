##### Im-project:

启动项目：nohup java -jar im-server-rest-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod > nohup-im-rest.log 2>&1 &

http://172.81.216.81:8081/

http://175.24.103.167:8081/

##### Eureka:

http://172.81.216.81:8761/
http://172.81.216.81:8762/
http://175.24.103.167:8761/
http://175.24.103.167:8762/



##### 相关文档：

tech-mq/mq_kafka.md,  cloud_eureka.md,  spring_boot.md



##### 备注：

先单独启动zookeeper（每个节点需要创建自己的myid），再启动kafka

