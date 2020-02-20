### [MyBatis Generator](http://www.mybatis.org/generator/index.html)

官网：

<http://www.mybatis.org/generator/index.html>

自定义插件：

<https://blog.csdn.net/u011781521/article/details/78697775>

<https://juejin.im/post/5c4ab9e851882525eb365d29>

##### 备注：

MBG是通过注解@mbg.generated来判断是否是否自动生成的内容，标有此注解的内容会在重新生成的时候被覆盖，而没有标此注解的内容被会保留，如果自动生成的内容没有标注此注解，那么再重新生成的时候会重新生成，造成内容重复。

MySqlCommentGenerator自定义注释会导致无法生成@mbg.generated，从而无法进行覆盖更新。

targetProject的相对路径是个问题，特别是在多模块项目中的时候，
tech_blog项目的相对路径为：targetProject=“tech-blog-parent\tech-blog-service\src\main\java”



##### TODO：

生成的mapper类应该在类上自动加一个@component注解

添加自定义内容（自定义插件）

能自动生成类注释，并且不影响@mbg.generated逻辑

