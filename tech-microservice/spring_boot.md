[运行SpringBoot工程的四种方法](https://www.jianshu.com/p/0a91ee4600fa)

1. 直接运行启动类

2. 利用`mvn spring-boot:run`运行

3. 打包成jar包后，利用`java -jar xxx.jar`运行

4. 打包成war包后，利用`java -jar xxx.war`运行

   ```shell
   java -jar tech-eureka-server-0.0.1-SNAPSHOT.jar --spring.profiles.active=node1
   java -jar tech-eureka-server-0.0.1-SNAPSHOT.jar --spring.profiles.active=node2
   
   nohup java -jar statistics.jar > logs/catalina.out.log 2>&1 &
   ps -ef|grep java
   kill -9 xxx
   ```


   ```
   
   

##### springboot多个profile

1.在application.yml文件中配置：

​```yml
spring:
  profiles: 
    active: prod
server: 
  port: 8080  

---
spring: 
  profiles: dev  
  
server: 
  port: 8080  
  
spring:
    profiles:
        active: dev  
   ```

2.建立对应的配置文件，格式为：application-{profle}.yml, 如application-dev.yml, application-prod.yml

在application.yml中指定profile:

```yml
spring:
    profiles:
        active: dev
```

##### [springBoot 打包上线跳过连接数据库](https://blog.csdn.net/ssjq123/article/details/83277755)

```
在pom文件properties中添加 <skipTests>true</skipTests> 这一行
```

[yaml语法及规范](https://blog.csdn.net/IT_faquir/article/details/79842885)

##### [Spring Boot配置过滤器的两种方式](https://www.javazhiyin.com/45056.html)