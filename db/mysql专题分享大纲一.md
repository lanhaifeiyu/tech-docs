### 专题分享大纲一：

##### MySQL体系结构概述

​	由哪些模块组成

​	每个模块的作用

​	重点讲解：

​	整体的运行流程（连接池、语法解释、优化、缓存、查找，写，磁盘同步，redo日志）

​	当我们输入这些SQL 查询语句时，发生了什么？ 先整体讲解，再EXPLAIN具体解析

​	涉及：磁盘加载索引，查找页，内存页内查找，内存结构，磁盘同步，CheckPoint，LRU

```mysql
## rtv_user表的关键索引：1.id-主键  2.corp_id  3.corp_id,logon_name
#读-主键索引（聚集索引）
SELECT id, corp_id, display_name, logon_namem, `rank` FROM `rtv_user` WHERE id = 65537;
#读-普通索引（非聚集索引、辅助索引）
SELECT id, corp_id, display_name, logon_name, `rank` FROM `rtv_user` WHERE logon_name = 'c65537';
#读-覆盖索引，联合索引的最佳使用场景讲解
SELECT id, corp_id, logon_name FROM `rtv_user` WHERE logon_name = 'c65537' AND corp_id = 1;
#写-缓存读取
UPDATE `rtv_user` SET last_access_date = NOW() WHERE id = 65537;
#写-查找读取
UPDATE `rtv_user` SET last_access_date = NOW() WHERE id = 65538;

```

##### MySQL存储引擎介绍和对比

​	主要讲解 InnoDB 和 MyISAM

##### InnoDB存储引擎概述

​	后台线程

​	内存

​	CheckPoint

​	关键特性

##### 日志文件

​	普通查询，慢查询，错误日志，二进制日志， 实验机上实践

##### InnoDB逻辑存储结构

​	表空间、段、区、页、行

##### InnoDB行记录格式

​	Compact格式

##### 索引

​	数据结构B+树



##### 面试题

- 使用explain优化sql和索引？

- MySQL慢查询怎么解决？

- 聚集索引和非聚集索引区别？ 

- 索引为什么要用B+树，B+树和B-树的区别是什么 

- MySQL常见的三种存储引擎（InnoDB、MyISAM、MEMORY）的区别？ 

- MySQL的MyISAM与InnoDB两种存储引擎在，事务、锁级别，各自的适用场景？ 

- 你怎么看到为表格定义的所有索引？ 

- 索引的底层实现原理和优化 

- 简单描述mysql中，索引，主键，唯一索引，联合索引的区别，对数据库的性能有什么影响（从读写两方面） 

- NULL是什么意思 

- select *

- char的底层实现其实和varchar是一样的

- ```
  count(1)和count(*)基本没有差别！ 
  count(*)包括了所有的列，相当于行数，在统计结果的时候，不会忽略列值为NULL  
  count(1)包括了忽略所有列，用1代表代码行，在统计结果的时候，不会忽略列值为NULL  
  count(列名)只包括列名那一列，在统计结果的时候，会忽略列值为空（这里的空不是只空字符串或者0，而是表示null）的计数，即某个字段值为NULL时，不统计。
  
  ```

  

##### 实践经验