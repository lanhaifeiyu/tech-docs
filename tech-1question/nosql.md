> ##### redis



[Redis面试题（2020最新版）](https://mp.weixin.qq.com/s/ADJ_ig7GwserpE1_xqNknQ)



了解 redis 源码么 

了解 redis 集群么 

Redis，持久化框架 

缓存框架，例如 Redis、Memcached 之间的区别，优劣势比较 

Redis 的数据结构 

Redis 是基于内存的么 

Redis 的 list zset 的底层实现 

分布式 session 的共享方案有哪些，有什么优劣势 

Redis 的特点 

Redis 的持久化怎么做，aof 和 rdb，有什么区别，有什么优缺点。 

Redis 使用哨兵部署会有什么问题，我说需要扩容的话还是得集群部署。 

Redis 介绍 

Redis 的持久化？有哪些方式，原理是什么？ 

Redis 的应用 

Redis 的持久化的方式和原理 

redis 缓存和 memcached 缓存的区别，以及各自的优劣势 

问了 redis 的一些问题，项目中有(扩容，失效 key 清理策略等) 

Redis 的应用 

Redis 的持久化的方式和原理 

列举一个常用的Redis客/发模型。

HBase如何实现模糊查询?

列举一个常用的消息中间件，如果消息要保序如何实现?

如何实现一个Hashtable? 你的设计如何考虑Hash冲突? 如何优化?

分布式缓存，一致性hash

LRU算法，slab分配，如何减少内存碎片

如何解决缓存单机热点问题

什么是布隆过滤器，其实现原理是? False positive指的是?

memcache与redis的区别

zookeeper有什么功能，选举算法如何进行

map/reduce过程，如何用map/reduce实现两个数据源的联合统计



- redis 简介
- 为什么要用 redis /为什么要用缓存（高性能、高并发）
- 为什么要用 redis 而不用 map/guava 做缓存?
- redis 和 memcached 的区别
- redis 常见数据结构以及使用场景分析（**String、Hash、List、Set、Sorted Set**）
- redis 设置过期时间
- redis 内存淘汰机制（**MySQL里有2000w数据，Redis中只存20w的数据，如何保证Redis中的数据都是热点数据？**）
- redis 持久化机制（**怎么保证 redis 挂掉之后再重启数据可以进行恢复**）
- redis 事务
- Redis 常见异常及解决方案（**缓存穿透、缓存雪崩、缓存预热、缓存降级**）
- 分布式环境下常见的应用场景（**分布式锁、分布式自增 ID**）
- Redis 集群模式（**主从模式、哨兵模式、Cluster 集群模式**）
- 如何解决 Redis 的并发竞争 Key 问题
- 如何保证缓存与数据库双写时的数据一致性？

> ##### nosql

常用 NOSQL，有做过比较? 

