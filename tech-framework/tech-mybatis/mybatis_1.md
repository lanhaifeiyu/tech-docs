[mybatis官网](https://mybatis.org/mybatis-3/zh/index.html)

[面试官问你MyBatis SQL是如何执行的？把这篇文章甩给他](https://mp.weixin.qq.com/s/AyItaTuLGYHvY9w9EJ-rOg)

##### 预编译到底做了什么逻辑,**为什么使用预编译语句**？ https://blog.csdn.net/xqhys/article/details/66478563    

#####  **1、提高效率**  

  使用 PreparedStatement 最重要的一点好处是它拥有更佳的性能优势，SQL语句会预编译在数据库系统中。执行计划同样会被缓存起来，它允许数据库做参数化查询。使用预处理语句比普通的查询更快，因为它做的工作更少（数据库对SQL语句的分析，编译，优化已经在第一次查询前完成了）。为了减少数据库的负载，生产环境中德JDBC代码你应该总是使用PreparedStatement 。 

#####  **2、提高安全性**  

 在使用参数化查询的情况下，数据库系统（eg:MySQL）不会将参数的内容视为SQL指令的一部分来处理，而是在数据库完成SQL指令的编译后，才套用参数运行，因此就算参数中含有破坏性的指令，也不会被数据库所运行。 

##### 为什么#{}，预编译的方式能够防止SQL注入，查看生成的SQL语句，会转义一些特殊字符

```mysql
#SELECT A.* FROM zone_id_assign A WHERE 1=1 AND A.name LIKE 
<if test="nameLike != null and nameLike !=''">
	<bind name="nameLike" value="'%'+nameLike+'%'" />
	AND A.name LIKE #{nameLike}
</if>
#生成的语句转义了单引号： nameLike：%' -- select * from rtv_user 
SELECT A.* FROM zone_id_assign A WHERE 1=1 AND A.name LIKE '%%\' -- select * from rtv_user%'
```



##### MyBatis 模糊查询 防止Sql注入，方式一， concat

```mysql
#Mysql:  
select * from t_user where name like concat('%', #{name}, '%')
#Oracle: 
select * from t_user where name like '%' || #{name} || '%'
#SQLServer: 
select * from t_user where name like '%' + #{name} + '%'
                                            
                                        
```

##### MyBatis 模糊查询 防止Sql注入，方式二，使用bind标签

```xml
<if test="nameLike != null">
	<bind name="nameLike" value="'%'+nameLike+'%'" />
	and name like #{nameLike}
</if>    
```

##### MyBatis IN查询 防止Sql注入，方式一， foreach （多个参数时，collection=参数名）

```xml
<foreach collection="list" item="id" index="index" open="(" close=")" separator=",">
	#{id}
</foreach>
<foreach collection="array" item="id" index="index" open="(" close=")" separator=",">
	#{id}
</foreach>
```

##### MyBatis IN查询 防止Sql注入，方式二，正则过滤

in查询一般是数字加逗号，如果想使用${}，可以正则过滤





