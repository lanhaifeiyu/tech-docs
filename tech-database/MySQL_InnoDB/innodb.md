#### 第一章 MySQL体系结构和存储引擎

配置文件的查找顺序，后者覆盖前者，mysql --help可以查看很多帮助信息

```shell
mysql --help | grep my.cnf
 order of preference, my.cnf, $MYSQL_TCP_PORT,
/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf 
```

配置文件的参数datadir：数据库所在路径

```mysql
show variables like '%datadir%';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| datadir       | /var/lib/mysql/ |
+---------------+-----------------+
1 row in set (0.03 sec)

# 在mysql命令行环境中执行系统命令，查看数据库文件
system ls -lh /var/lib/mysql/
```

通常MySQL的权限为mysql:msql

