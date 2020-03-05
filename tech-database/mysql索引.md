##### B+树的调度一般都在2-4层，即查找某一键值最多只需要2-4次IO：

默认未压缩情况下，一页大小为16K，每页最多存放（硬性定义）16KB/2-200=7992行，几次IO对应7992的几次方





##### 多列索引：

[多个单列索引和联合索引的区别详解](https://blog.csdn.net/Abysscarry/article/details/80792876)
[mysql索引合并:一条sql可以使用多个索引](https://www.bo56.com/mysql%E7%B4%A2%E5%BC%95%E5%90%88%E5%B9%B6%E4%B8%80%E6%9D%A1sql%E5%8F%AF%E4%BB%A5%E4%BD%BF%E7%94%A8%E5%A4%9A%E4%B8%AA%E7%B4%A2%E5%BC%95/)

