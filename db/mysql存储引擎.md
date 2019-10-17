体系结构：

 ![img](assets/mysql-structure.png) 

MySQL由以下几部分组成：

- 连接池组件（Connection Pool）
- 管理服务和工作组件（Enterprise Management Services & Utilities）
- SQL接口组件（SQL Interface）
- 查询分析器组件（Parser）
- 优化器组件（Optimizer）
- 缓冲组件（Caches & Buffers）
- 插件式存储引擎（Pluggable Storage Engines）
- 物理文件（File System）

Mysql存储引擎：



![img](assets/mysql-engines.jpg)

查看数据支持的引擎：

1. 执行命令：SHOW ENGINES
2. 查看information_schema数据库中的ENGINES表

![mysql show engines](assets/mysql-show-engines.png)

相关SQL语句



```mysql
#创建表时指定引擎方式1
CREATE TABLE `demo_users`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT 'username',
  PRIMARY KEY (`id`)
) ENGINE = ARCHIVE COMMENT = 'demo table';
#创建表时指定引擎方式2
CREATE TABLE `demo_engines` ENGINE=MyISAM AS SELECT * FROM `demo_users`;
#修改引擎
ALTER TABLE `demo_engines` ENGINE = INNODB;
#删除demo表
DROP TABLE IF EXISTS `demo_users`,`demo_engines`;
```

连接MySQL

连接MySQL操作是一个连接进程和MySQL数据库实例进行通信，本质上是进程通信，常用的进程通信方式有

管道、命名管道、TCP/IP套接字、UNIX域套接字。

TCP/IP：最常用的方式

```shell
#命令行
mysql -h127.0.0.1 -uroot -p
#JDBC
jdbc:mysql://localhost/rtvitrunk?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false
```

