```mysql
tail -n 1000 /var/log/itrunk/mysql/mysql_slow.log

ALTER TABLE `rtv_user` ADD INDEX `opt_bnl`(`corp_id`, `status`, `rank`, `device`) USING BTREE;

id	select_type	table	partitions	type	possible_keys	key	key_len	ref	rows	filtered	Extra
1	PRIMARY	A		ref	corp_id,corp_id_name,corp_id_rank	corp_id	4	const	8961	8.10	Using where
1	PRIMARY	vu		ALL	uid				1	100.00	Using where; Using join buffer (Block Nested Loop)
2	DEPENDENT SUBQUERY	zone_id_assign		eq_ref	PRIMARY	PRIMARY	4	rtvitrunk.A.zone_id	1	100.00	


INSERT INTO ``(`id`, `select_type`, `table`, `partitions`, `type`, `possible_keys`, `key`, `key_len`, `ref`, `rows`, `filtered`, `Extra`) VALUES (1, 'PRIMARY', 'A', NULL, 'ref', 'corp_id,corp_id_name,corp_id_rank', 'corp_id', '4', 'const', 8961, 8.10, 'Using where');
INSERT INTO ``(`id`, `select_type`, `table`, `partitions`, `type`, `possible_keys`, `key`, `key_len`, `ref`, `rows`, `filtered`, `Extra`) VALUES (1, 'PRIMARY', 'vu', NULL, 'ALL', 'uid', NULL, NULL, NULL, 1, 100.00, 'Using where; Using join buffer (Block Nested Loop)');
INSERT INTO ``(`id`, `select_type`, `table`, `partitions`, `type`, `possible_keys`, `key`, `key_len`, `ref`, `rows`, `filtered`, `Extra`) VALUES (2, 'DEPENDENT SUBQUERY', 'zone_id_assign', NULL, 'eq_ref', 'PRIMARY', 'PRIMARY', '4', 'rtvitrunk.A.zone_id', 1, 100.00, NULL);

```

##### MySQL JOIN的原理解析: https://www.bloghome.com.cn/post/mysql-joinyuan-li.html



##### 技术分享 | MySQL 优化：JOIN 优化实践:https://zhuanlan.zhihu.com/p/103661924

##### Block Nested-Loop and Batched Key Access Joins: https://dev.mysql.com/doc/refman/5.6/en/bnl-bka-optimization.html

##### MySQL · 性能优化 · MySQL常见SQL错误用法: http://mysql.taobao.org/monthly/2017/03/03/

##### 【MySQL】MySQL性能优化之Block Nested-Loop Join(BNL): http://blog.itpub.net/22664653/viewspace-1692317/