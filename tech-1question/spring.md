> #### Spring

##### AOP、IOC：

spring IOC 和 AOP，以及各有什么优点 

请解释下 Spring 框架中的 IoC ？

什么是控制反转(IOC)？

spring的两大特性- ioc aop，实现原理

讲一下 Spring AOP 和 IOC 的底层实现 、实现原理

Spring IOC 的理解，其初始化过程？

如果要你实现Spring AOP，请问怎么实现？

如果要你实现Spring IOC，你会注意哪些问题？

AOP 实现原理：动态代理 

Spring 的 IOC 实现原理？没有无参构造函数能实例化吗？有参构造函数注入？（xml 配置） 

Spring 的 aop 怎么实现 ，有哪些实现方式 ？

Spring IOC，autowired 如何实现 

如果存在A依赖B，B依赖A，那么是怎么加到IOC中去的（TIP：使用构造器有循环依赖问题，应该用属性属性注入，精通spring4.x 5.3.2）



------

##### Bean、Context、注入：

Spring 的 bean 的作用域？（比如：singleton，prototype 等） 

BeanFactory 和 和 ApplicationContext 有什么区别？

请解释 Spring Bean 的自动装配？

请解释 Spring Bean 的生命周期？

Spring Bean 的作用域之间有什么区别？

什么是 Spring inner beans ？

Spring 框架中的单例 Beans 是线程安全的么？

请举例说明如何在 Spring 中注入一个 Java Collection ？

如何向 Spring Bean 中注入一个 Java.util.Properties ？

请解释自动装配模式的区别？

BeanFactory 和 FactoryBean

构造方法注入和设值注入有什么区别？

BeanFactory 和 ApplicationContext？

Spring Bean 的生命周期，如何被管理的？Spring Bean 的加载过程是怎样的？

Spring 循环注入的原理？

BeanFactory 和 FactoryBean

FactoryBean的理解

beanFactory的理解，怎么加载bean

spring中的自动装配方式

基于注解的形式，是怎么实现的， 你知道其原理吗，说一下

依赖冲突，有碰到过吗，你是怎么解决的~

怎么防止依赖注入

如何自动包装对象

怎么让mapper 和xml对应

------

##### 架构设计：

什么是 Spring 框架？Spring 框架有哪些主要模块？

Spring boot、SpringClound 的基本架构设计 

Dubbo 和 SpringClound 的区别在哪里，优劣势 

使用 Spring 框架能带来哪些好处？

Spring 框架中有哪些不同类型的事件？

Spring 框架中都用到了哪些设计模式？

spring的启动过程

------

##### 事务:

spring 当中事物的隔离级别 

Spring 是如何管理事务的，事务管理机制？

Spring 的不同事务传播行为有哪些，干什么用的？

------

##### 配置、使用：

Spring 有几种配置方式？

如何用基于 XML 配置的方式配置 Spring ？

如何用基于 Java 配置的方式配置 Spring ？

怎样用注解的方式配置 Spring ？

如何开启基于注解的自动装配

请举例解释@Required 注解？

请举例解释@Autowired 注解？

请举例说明@Qualifier 注解？

FileSystemResource 和 和 ClassPathResource 有何区别？

------



> ##### Spring MVC

什么是 SpringMvc？

Spring MVC 的优点：

Spring MVC 的工作原理？

Spring 如何保证 Controller 并发的安全？

你一般是怎么对mvc项目进行分层的

dispatch-servlet的工作原理

为什么有了springmvc还要在项目中使用spring？

springmvc的运行机制，dispatch -》 hanldermapping-—》handler -》handlerAdapter-》执行handler-》modelandview -》 返回mv -》 视图解析器-》返回view -》 渲染响应

如何部署springmvc项目 以及如何部署springboot项目

Spring 如何保证 Controller 并发的安全？

SpringMVC 工作原理？

Springmvc 请求流程 

SpringMVC 流程？

SpringMvc 的控制器是不是单例模式,如果是,有什么问题,怎么解决？

如果你也用过 struts2.简单介绍下 springMVC 和 struts2 的区别有哪些?

SpingMvc 中的控制器的注解一般用那个,有没有别的注解可以替代？

@RequestMapping 注解用在类上面有什么作用？

怎么样把某个请求映射到特定的方法上面？

如果在拦截请求中,我想拦截 get 方式提交的方法,怎么配置？

怎么样在方法里面得到 Request,或者 Session？

我想在拦截的方法里面得到从前台传入的参数,怎么得到？

如果前台有很多个参数传入,并且这些参数都是一个对象的,那么怎么样快速得到这个对象？

SpringMvc 中函数的返回值是什么？

SpringMVC 怎么样设定重定向和转发的？

SpringMvc 用什么对象从后台向前台传递数据的？

SpringMvc 中有个类把视图和数据都合并的一起的,叫什么？

怎么样把 ModelMap 里面的数据放入 Session 里面？

SpringMvc 怎么和 AJAX 相互调用的？

讲下 SpringMvc 的执行流程

SpringMvc 里面拦截器是怎么写的？

当一个方法向 AJAX 返回特殊对象,譬如 Object,List 等,需要做什么处理？

#

> ##### Spring boot

什么是 Spring Boot？

Spring Boot 有哪些优点？

如何部署springmvc项目 以及如何部署springboot项目

springboot的插件，你使用过哪些

和spring相比，做了什么改变，starter你知道哪些

什么是 JavaConfig？

如何重新加载 Spring Boot 上的更改，而无需重新启动服务器？

Spring Boot 中的监视器是什么？

如何在 Spring Boot 中禁用 Actuator 端点安全性？

如何在自定义端口上运行 Spring Boot 应用程序？

什么是 YAML？

什么是 Spring Profiles？

什么是 Spring Batch？

如何集成 Spring Boot 和 ActiveMQ？

如何使用 Spring Boot 实现分页和排序？

什么是 Swagger？你用 Spring Boot 实现了它吗？

什么是 FreeMarker 模板？

如何使用 Spring Boot 实现异常处理？

您使用了哪些 starter maven 依赖项？

什么是 CSRF 攻击？

什么是 WebSockets？

什么是 AOP？

什么是 Apache Kafka？

我们如何监视所有 Spring Boot 微服务？



> ##### Spring cloud

[Spring Cloud面试题（2020最新版）](https://mp.weixin.qq.com/s/mqXHun_J6CfgEgZQpDgkMg)

什么是 Spring Cloud？

使用 Spring Cloud 有什么优势？

服务注册和发现是什么意思？Spring Cloud 如何实现？

负载平衡的意义什么？

什么是 Hystrix？它如何实现容错？

什么是 Hystrix 断路器？我们需要它吗？

什么是 Spring Cloud Bus？我们需要它吗？

什么是 Netflix Feign？它的优点是什么？