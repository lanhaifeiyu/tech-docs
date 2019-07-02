#### tech项目组成：

##### 项目tech-blog(parent):

【module】tech-blog-api：controller的接口，定义：RequestMapping，swagger等，统一定义对外接口，与实现分离。

【module】tech-blog-controller：实现了tech-api的controller

【module】tech-blog-service：核心的业务逻辑，service和dao层，

【dependency】tech-factory

【dependency】tech-common



##### 项目tech-im(parent):

【module】tech-im-api

【module】tech-im-controller

【module】tech-im-service

【dependency】tech-factory

【dependency】tech-common



##### 项目tech-factory

##### 项目tech-common



##### 微服务依赖：

tech-eureka-server：注册中心

tech-config-server：配置中心

tech-gateway-server：网关

tech-hystrix-dashboard：hystrix dashboard & Turbine



##### 依赖第三方独立服务：

kafka/rabbitmq, nginx, redis, mysql 等



------------------------------------------------------------------------------------------------------------------------------------------------------------



项目组成板块：

tech-eureka-server：注册中心

tech-config-server：配置中心

tech-gateway-server：网关

tech-hystrix-dashboard：hystrix dashboard & Turbine



tech-factory： 工厂模块：mybatis genetor，测试数据生成导入，批量操作数据库，等

tech-parent：maven根项目

tech-common：公共基础包

tech-xxx-api：controller的接口，定义：RequestMapping，swagger等，统一定义对外接口，与实现分离。

tech-xxx-server：实现了tech-api的controller

tech-xxx-service：核心的业务逻辑，service和dao层，
有没必要再分离出tech-dao?(我觉得不应该，每个业务项目应该单独建立dao，互不影响，调用关系也更清晰)

xxx是业务模块：

前台：tech-fg-api, tech-fg-server, tech-common-service

后台：tech-bg-api, tech-bg-server, tech-common-service



业务功能：模仿CSDN，博客园等技术型社区，UI参考segmentfault <https://segmentfault.com/>

后台：用户，管理员，文章，通知消息，IM，

前台：登陆注册，社交账号绑定，文章分类阅读，发布文章，文章分享（社交账号），评论，订阅（邮件，站内），IM，粉丝，喜欢，关注，收藏，文章推荐

不用刻意去堆功能，做大量没什么技术性的功能收获不大，主要是选有一定技术挑战的功能，核心功能就只用以博客为中心就行了，实现这些平台的博客部分。

IM可以当作一个重点模块，它包含了非常多的技术点，实时性非常强，当数据量、并发量非常高的时候，能够非常明显的暴露问题，方便进行优化调试验证。

需要重点关注的部分：

1. 消息队列、高并发、数据一致性：访问，点赞，收藏，关注，分享，站内通知，订阅，IM
2. 网站安全：权限认证、识别过滤脚本访问，业务安全，服务器安全
3. 适应性：网络检测与降级，前端显示自适应，异常提示
4. 性能：缓存、数据库优化
5. 监控报警：业务监控、服务器监控，数据展现，故障排查
6. 日志：记录，聚合，分析，存储，定期清理，数据展现
7. 自动化脚本：检查服务器状态，业务状态，定期压缩-转储-清理，模拟访问
8. 大数据、高并发：模拟大数据量，大量用户在线操作
9. 部署：应用服务器的重启、项目的重新部署、不暂停服务
10. 数据安全：数据的备份、恢复，数据异常告警



<https://blog.csdn.net/linsongbin1/article/details/82148499>



<https://zhuanlan.zhihu.com/p/43023436>



