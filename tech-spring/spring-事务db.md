

> ##### 事务管理

##### 

PROPAGATION_REQUIRED 				支持一个己经存在的事务。如果没有事务，则开始一个新的事务

PROPAGATION_SUPPORTS 				支持一个己经存在的事务。如果没有事务，则以非事务方式执行

PROPAGATION_MANDATORY 			支持一个己经存在的事务。如果没有活动事务，则抛出异常

PROPAGATION_REQUIRES_ NEW 	始终开始新的事务。如果活动事务己经存在，将其暂停

PROPAGATION_NOT_SUPPORTED 	不支持活动事务的执行。始终以非事务方式执行并暂停任何现有事务

PROPAGATION_NEVER 						即使存在活动事务，也始终以非事务方式执行。如果存在活动事务，则抛出异常

PROPAGATION_NESTED 					如果存在活动事务，则在嵌套事务中运行。如果没有活动事务，则与																PROPAGATION_REQUTRED相同

NESTED 播行为会沿用当前事务的隔离级别和锁等特性，而REQUIRES_ NEW则可以拥有自己独立的隔离级别和锁等特性。



**TransactionDefinition接口：**设置事务的隔离级别、传播类型、是否只读、超时机制

**PlatformTransactionManager接口：**Spring 事务支持的核心接口，该接口实现在特定平台（如 JDBC JTA） 上执行事务管理。其核心方法PlatformTransactionManager.getTransaction(TransactionDefinition definition)，返回TransactionStatus

**TransactionStatus接口：**用于控制事务执行，更具体地说，是设置事务结果并检查事务是否完成或是否为新事务。



##### 什么是JTA    

##### https://juejin.im/post/5b83b8756fb9a019ff71389d

https://leokongwq.github.io/2017/01/03/transaction-understanding-jta.html

Java 事务编程接口（JTA：Java Transaction API）和 Java 事务服务 (JTS；Java Transaction Service) 为 J2EE 平台提供了分布式事务服务。分布式事务（Distributed Transaction）包括事务管理器（Transaction Manager）和一个或多个支持 XA 协议的资源管理器 ( Resource Manager )。

**资源管理器( Resource Manager )** 可以将看做任意类型的持久化数据存储。
**事务管理器（Transaction Manager）** 承担着所有事务所参与单元的协调与控制。






> ##### 访问数据库



##### JPA(Hibernate)



##### Mybatis

使用插件：

```java
package com.spr ngboot chapter5.plugin
/**** imports ****/ 
//定义拦截签名
@Intercepts((@Signature(type = StatementHandler.class, method = "prepare", 
                        args = (Connection class, Integer .class)))) 
public class MyPlugin implements Interceptor ( 
	Properties properties = null ; 
	//拦截方法逻辑
    @Override 
    public Object intercept(Invocation invocation) throws Throwable { 
        System.out.println("插件拦截方法． ．．．．");
        return invocation.proceed();
    }
    //生成MyBatis拦截器代理对象
    @Override
    public Object plugin (Object target) { 
    	return Plugin.wrap(target, this); 
    }
    //设置插件属性
    @Override 
    public void setProperties (Properties properties) { 
    this . properties =properties; 
    }
}
```

```xml
<configuration>
    <plugins> 
        <plugin interceptor="com springboot chapter5 plugin MyPlugin">
        <property name= " keyl " value= "valuel " /> 
        <property name= " key2 " value= " value2 " />
        <property name= " key3 " value= " value3" />
        </plugin>
    </plugins> 
</configuration>
```

支持注解配置



##### jdbcTemplate

