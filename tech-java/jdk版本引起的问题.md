### JDK版本引起的问题

1. ##### JDK12启动springboot项目，缺少JAR包

   https://blog.csdn.net/weixin_34235135/article/details/91478708

   ```xml
   <dependency>  
      <groupId>javax.xml.bind</groupId>  
       <artifactId>jaxb-api</artifactId>  
   </dependency>  
   <dependency>  
       <groupId>com.sun.xml.bind</groupId>  
       <artifactId>jaxb-impl</artifactId>  
       <version>2.3.0</version>  
   </dependency>  
   <dependency>  
       <groupId>org.glassfish.jaxb</groupId>  
       <artifactId>jaxb-runtime</artifactId>  
       <version>2.3.0</version>  
   </dependency>  
   <dependency>  
       <groupId>javax.activation</groupId>  
       <artifactId>activation</artifactId>  
       <version>1.1.1</version>  
   </dependency>  
   ```

   

2. ##### 启动警告问题：Illegal reflective access by com.thoughtworks.xstream.core.util.Fields

   https://www.cnblogs.com/yjcblog/p/10332877.html

   ```shell
   #根据警告信息，添加如下启动参数：
   --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED
   #更新：
   --illegal-access=warn --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED
   ```

   

   

3. ##### TODO

4. 









