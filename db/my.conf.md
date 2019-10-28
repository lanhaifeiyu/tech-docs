```shell
touch /var/log/mysql/mysql_general.log
touch /var/log/mysql/mysql_slow.log
touch /var/log/mysql/mysql_error.log
chgrp -R  mysql /var/log/mysql/
chown -R  mysql /var/log/mysql/
```



```mysql

# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.6/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

# Recommended in standard MySQL setup
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

[mysqld_safe]
pid-file=/var/run/mysqld/mysqld.pid

#log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

#yrh add
character-set-server=utf8mb4
group_concat_max_len=102400
max_allowed_packet=1000M
log-error=/var/log/mysql/mysql_error.log
long_query_time=3
slow_query_log=ON
slow_query_log_file=/var/log/mysql/mysql_slow.log
general_log=ON
general_log_file=/var/log/mysql/mysql_general.log

[mysql]
default-character-set=utf8mb4

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

