## 配置settings.xml

1. 在settings.xml(路径：C:\Users\Gene.A.Wang\.m2)的mirrors中添加mirror

   ```<mirror>
   <mirror>
         <id>nexus</id>
         <mirrorOf>*</mirrorOf>               <url>http://182.61.49.180:8081/repository/maven-public/</url>
   </mirror>
   ```
   
2. servers下添加server，发布项目到nexus的账号

   ```<server>
       <server>  
         <id>snapshots</id>
         <username>admin</username>
         <password>keep123!</password>
       </server>
   ```

3. profiles中添加profile

   ``` <profile>
         <id>nexus</id>
         <repositories>
           <repository>
             <id>central</id>
             <url>http://central</url>
             <releases><enabled>true</enabled></releases>
             <snapshots><enabled>true</enabled></snapshots>
           </repository>
         </repositories>
        <pluginRepositories>
           <pluginRepository>
             <id>central</id>
             <url>http://central</url>
             <releases><enabled>true</enabled></releases>
             <snapshots><enabled>true</enabled></snapshots>
           </pluginRepository>
         </pluginRepositories>
       </profile>
   ```

4. 设置activeProfile

   ```<activeProfile>nexus</activeProfile>```

## 创建archetype

   1. 在创建好的maven项目根目录下(即项目的`pom.xml`文件所在目录)下执行`maven`命令:

   `mvn archetype:create-from-project`

   这样本项目的archetype就创建好了.

   生成的archetype的信息,默认是在工程根目录下的 target\generated-sources\archetype 目录中.

2. 在pom.xml中添加如下配置：

   ```<distributionManagement>
       <snapshotRepository>
         <id>snapshots</id>     <url>http://182.61.49.180:8081/repository/maven-snapshots</url>
       </snapshotRepository>
     </distributionManagement>
   ```

3. 推送到nexus中

   在archetype的根目录下(即: 项目根目录\target\generated-sources\archetype)再执行以下`maven`命令:

 `mvn clean deploy`