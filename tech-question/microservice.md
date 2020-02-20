> ##### 微服务

什么情况会出现雪崩，以及如何应对？ 

微服务和 SOA 的区别，优劣势 

分布式事务了解么 

分布式系统原理：CAP，最终一致性，幂等操作等 

什么情况会出现雪崩，以及如何应对？ 

微服务架构是什么，它的优缺点？ 

ACID CAP BASE 理论 

分布式一致性协议，二段、三段、TCC，优缺点 

RPC 过程 

服务注册中心宕机了怎么办？

微服务还有其他什么组件 

分布式架构与微服务的关系 

从 hystrix 一路问到原理->自己如何实现->如何优化->响应流编程(reactive streams); 

什么是微服务?

微服务之间是如何独立通讯的

springCloud和dubbo 有哪些区别?

springboot和springcloud，请你谈谈对他们的理解?

什么是微服务熔断? 什么是服务降级?

微服务的优缺点分别是什么? 说下你在项目开发中碰到的坑

你所知道的微服务技术栈有哪些? 请列举一二

eureka和zookeeper都可以提供服务的注册和发现的功能，请说说两个的区别?



> ##### 分布式

分布式系统原理：CAP，最终一致性，幂等操作等 

- Dubbo的底层实现原理和机制
- 描述一个服务从发布到被消费的详细过程
- 分布式系统怎么做服务治理
- 接口的幂等性的概念
- 消息中间件如何解决消息丢失问题
- Dubbo的服务请求失败怎么处理
- 重连机制会不会造成错误
- 对分布式事务的理解
- 如何实现负载均衡，有哪些算法可以实现？
- Zookeeper的用途，选举的原理是什么？
- 数据的垂直拆分水平拆分。
- zookeeper原理和适用场景
- zookeeper watch机制
- redis/zk节点宕机如何处理
- 分布式集群下如何做到唯一序列号
- 如何做一个分布式锁
- 用过哪些MQ，怎么用的，和其他mq比较有什么优缺点，MQ的连接是线程安全的吗
- MQ系统的数据如何保证不丢失
- 列举出你能想到的数据库分库分表策略；分库分表后，如何解决全表查询的问题
- zookeeper的选举策略



> ##### 其他

服务注册中心：Eureka/Consul
负载均衡：Ribbon
服务网关: gateway/Zuul/Kong
配置中心：cloud-config/Apollo
日志监控：ELK
调用链监控：CAT/Zipkin/Pinpoint
Metrics监控：OpenTSDB/KairosDB/Argus/ 轻量级：InfluxDB/Prometheus-Grafana
健康检查和告警ZMon
服务容错： Hystrix
消息系统：Kafka(低可靠)，RabbitMQ/RocketMQ
缓存治理：cachecloud(Redis缓存治理平台), twemproxy, codis
分布式数据访问层：shardingjdbc/MyCAT
任务调度系统：xxl-job/elastic-job
服务安全：OAuth/OpenID connect/spring cloud security
集群资源调度系统：kubernetes
镜像治理：docker
持续交付：Jeenkins