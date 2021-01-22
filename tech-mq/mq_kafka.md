##### ZooKeeper文档： https://zookeeper.apache.org/doc/current/index.html 

##### kafka文档： https://kafka.apache.org/documentation/ 

##### kafka官网下载： https://kafka.apache.org/downloads 

##### scala官网下载（kafka依赖）： https://www.scala-lang.org/download/ 

##### ZooKeeper下载： https://www.apache.org/dyn/closer.cgi/zookeeper/ 

##### Kafka 简介 & 集成 SpringBoot: https://juejin.im/post/5c7febd0e51d4542176d1102 

##### windows下安装kafka、zookeeper： https://my.oschina.net/u/2312022/blog/3002570 

##### Spring Kafka 2.x 生产/消费消息的基本用法详解: https://juejin.im/entry/5a9e65296fb9a028dc408af5 

##### zookeeper原理与应用： https://juejin.im/post/5d2d33b5e51d4510803ce461 

复制zookeeper/conf/zoo_sample.cfg为zoo.cfg，修改zoo.cfg中的dataDir

修改apache-kafka_2.12-2.3.1/config/server.properties中的log.dir，确认zookeeper.connect

```shell
#启动zookeeper
D:\apache-zookeeper-3.5.6\bin\zkServer.cmd
#启动kafka
cd /d D:\apache-kafka_2.12-2.3.1\bin\windows
.\kafka-server-start.bat ..\..\config\server.properties
```

#### 3.应用kafka

##### 3.1 创建主题

进入kafka的安装目录，D:\softCommon\kafka\kafka_2.12-2.1.0\bin\windows>

```shell
kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
--create 创建主题
--zookeeper 连接到哪个zookeeper服务器(支持多个)
--replication-factor 每个分区的副本数
--partitions 分区数
--topic 主题名称
如上命令的理解：创建一个主题命名test，test只有一个分区，每个分区只有一个副本数，该kafka连接的zookeeper服务器localhost:2181
```

##### 3.2 创建producer

```shell
kafka-console-producer.bat --broker-list localhost:9092 --topic test
--broker-list kafka集群包含多个服务，其中每个服务称为broker
--topic 主题名称
如上命令的理解：创建生产者的服务只有一个，即本机的localhost:9092， 生产者向主题为test的topic发消息。
```

--broker-list kafka集群包含多个服务，其中每个服务称为broker
--topic 主题名称
如上命令的理解：创建生产者的服务只有一个，即本机的localhost:9092， 生产者向主题为test的topic发消息。

##### 3.3 创建consumer

```shell
kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic test --from-beginning
--bootstrap-server kafka消费服务器指定，这里指定本地kafka来消费
--topic 消费主题名称
--from-beginning 表示从topic中第一条消息开始消费
如上命令的理解：消费者从主题为test的topic中消费消息，从第一条开始消费。
```

##### 3.4 列出所有topic

```shell
kafka-topics.bat -list -zookeeper localhost:2181
```

##### 3.5 删除topic

```shell
kafka-topics.bat --delete --zookeeper localhost:2181 --topic test6
```



## Linux操作

https://kafka.apache.org/quickstart

Linux版kafka启动方式

```shell
#在bin的上一级目录执行命令：
#加守护进程启动
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
bin/kafka-server-start.sh -daemon config/server.properties

#通过后台来启动
nohup bin/zookeeper-server-start.sh config/server.properties > /dev/null 2>&1 &
nohup bin/kafka-server-start.sh config/server.properties > /dev/null 2>&1 &
```

单独启动zookeeper

##### kafka集群搭建(单机伪集群): https://zygood.club/2020/01/11/kafkacolony/

##### 10分钟搭建单机Kafka集群: https://zhuanlan.zhihu.com/p/136758040

```shell
# myid文件缺失导致zookeeper无法启动（myid file is missing）https://blog.csdn.net/u010842515/article/details/51147016

#81 server
#/usr/local/lh/zookeeper1/bin/zkServer.sh status        
#/usr/local/lh/zookeeper1/bin/zkServer.sh stop
/usr/local/lh/zookeeper1/bin/zkServer.sh start
/usr/local/lh/zookeeper3/bin/zkServer.sh start
/usr/local/lh/zookeeper5/bin/zkServer.sh start

#167 server
/usr/local/lh/zookeeper2/bin/zkServer.sh start
/usr/local/lh/zookeeper4/bin/zkServer.sh start

nohup /usr/local/lh/kafka/bin/kafka-server-start.sh /usr/local/lh/kafka/config/server1.properties > /home/lh/log/kafka1/startup.log 2>&1 &

nohup /usr/local/lh/kafka/bin/kafka-server-start.sh /usr/local/lh/kafka/config/server3.properties > /home/lh/log/kafka3/startup.log 2>&1 &

nohup /usr/local/lh/kafka/bin/kafka-server-start.sh /usr/local/lh/kafka/config/server5.properties > /home/lh/log/kafka5/startup.log 2>&1 &

nohup /usr/local/lh/kafka/bin/kafka-server-start.sh /usr/local/lh/kafka/config/server2.properties > /home/lh/log/kafka2/startup.log 2>&1 &

nohup /usr/local/lh/kafka/bin/kafka-server-start.sh /usr/local/lh/kafka/config/server4.properties > /home/lh/log/kafka4/startup.log 2>&1 &
```

1 partitions have leader brokers without a matching listener, including [test-0]: 

https://www.jianshu.com/p/99946b659924