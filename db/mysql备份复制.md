#### 备份

##### mysqldump

```shell
mysqldump --help
mysqldump -uitrunk -p rtvitrunk --ignore-table=rtvitrunk.rtv_gps_info > rtvitrunk_yun2_without_gps_201908121432.sql

mysqldump --all-databases > dump.sql
mysqldump --databases db1 db2 db3 > dump.sql
#--single-transaction 保证备份的一致性
mysqldump --single-transaction db1 > dump.sql
# --single-transaction, 
#--lock-tables(-l), 
#--lock-all-tabls(-x), 
#--add-drop-databases, 
#--master-data,
#--tab
#--where(-w)

mysqldump --single-transaction --add-drop-database --master-data=2 --databases db1 > dump.sql
mysqldump --single-transaction --where='rank>0' rtvitrunk rtv_user > console.sql

```

```mysql
#导出一张表的数据，默认以tab分隔
SELECT * INTO outfile '/home/itrunk/user.sql' FROM rtv_user;
mysql test -e "SELECT * INTO OUTFILE '/home/itrunk/user.sql' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' FROM rtv_user";
```

#### 恢复

```shell
mysql -uroot -p < dump.sql

mysqlimport --use-threads=2 rtvitrunk /home/itrunk/user.sql /home/itrunk/group.sql
```



```mysql
SOURCE /home/itrunk/dump.sql;

#LOAD DATA INFILE 忽略外键检查
SET @@foreign_key_checks=0;
LOAD DATA INFILE '/home/itrunk/dump.sql' INTO table rtv_user;

#查看数据库线程列表
SHOW FULL PROCESSLIST\G;
```



##### 二进制日志备份与恢复

```properties
#my.cnf/my.ini配置启用二进制日志
[mysqld]
log-bin=mysql-bin
sync_binlog=1
inndb_support_xa=1
```

在备份二进制日志文件前，可能通过 FLUSH LOGS 命令来生成一个新的二进制日志文件，然后备份之前的二进制日志

```shell
mysqlbinlog binlog.0000001 | mysql -uroot -p rtvitrunk
mysqlbinlog binlog.[0-10]* | mysql -uroot -p rtvitrunk

#mysqlbinlog命令导出到文件，再通过SOURCE导入，好处是可以对导出的文件进行修改后再导入
mysqlbinlog binlog.0000001 > /tmp/tt.sql
mysql -uroot -p -e "source /temp/tt.sql"
# --start-position, --stop-position, --start-datetime, --stop-datetime 
mysqlbinlog --start-position=107856 binlog.0000001 | mysql -uroot -p test
```

#### 热备

##### ibbackup（收费，不研究了）

XtraBackup（Percona开发）

 https://www.percona.com/ 
 https://www.percona.com/doc/percona-toolkit/LATEST/index.html 
 https://www.percona.com/doc/percona-monitoring-and-management/deploy/index.html 
 https://www.percona.com/software/mysql-database/percona-xtrabackup 



#### 复制

```mysql
SHOW MASTER STATUS;
SHOW SLAVE STATUS;

GRANT REPLICATION SLAVE, RELOAD, CREATE USER, SUPER ON *.* TO itrunk@'192.168.1.%' WITH GRANT OPTION;

CHANGE MASTER TO MASTER_HOST = 'master-1',MASTER_PORT=3306,MASTER_USER='repl_user',MASTER_PASSWORD='root';
START SLAVE;

#强制轮换（rotate）二进制日志，从而得到一个“完整的”二进制日志文件
FLUSH LOGS;
#
SHOW BINLOG EVENTS;
```

##### my.cnf - master

```properties
[mysql]
# =============================
# Master mode, added by zom
# [must]binary log
log-bin           = master-bin
binlog_format     = "MIXED"
expire-logs-days  = 30

# [must]only ID
server-id         = 1
log-bin-index     = master-bin.index

# ignore DB
# binlog-ignore-db  = mysql
# binlog-ignore-db  = information_schema
# binlog-ignore-db  = performance_schema
# binlog-ignore-db  = sys
# binlog-ignore-db  = zlab

# Replicate db
binlog-do-db           = rtvitrunk
binlog-do-db           = audioitrunk
```

##### my.cnf - slave

```properties
server-id           = 2
relay-log-index		= slave-relay-bin.index
relay-log			= slave-relay-bin
```























































