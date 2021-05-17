##### MySQL8.0版本默认的认证方式是caching_sha2_password,MySQL5.7版本则为mysql_native_password。

##### 解决MAC+ MySQL 8 错误：Authentication plugin 'caching_sha2_password' cannot be loaded：https://blog.51cto.com/fengfeng688/2147169

##### MySQL8.0新特性——默认使用caching_sha2_password作为身份验证插件：https://www.jianshu.com/p/9a645c473676

##### [MySQL新密码机制介绍caching_sha2_password](https://www.cnblogs.com/olinux/p/13201497.html)：https://www.cnblogs.com/olinux/p/13201497.html



##### Mysql8 报错：ERROR 1193 (HY000): Unknown system variable 'tx_isolation'

老版本mysql用的是tx_isolation,由于我装的是Mysql8，所以现在更名为 transaction_isolation
或者在pom.xml文件中将MySQL Connector / J版本升级为8：

```mysql
SET GLOBAL tx_isolation="READ-COMMITTED";
SET GLOBAL transaction_isolation="READ-COMMITTED";
```

