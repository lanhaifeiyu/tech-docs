##### 快速定位数据中每张表的大小

mysqldump -h172.17.73.99 -u itrunk -p@Zse4rfv_ --databases rtvitrunk

```
mysqldump -uitrunk -p rtvitrunk --ignore-table=rtvitrunk.rtv_gps_info > rtvitrunk_yun3_without_gps_201908131415.sql
```

##### 备份数据库（一定要定向到文件里面，不然会打印在标准输出，非常占内存和时间）

