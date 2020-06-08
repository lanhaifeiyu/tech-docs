##### 这几道Java集合框架面试题在面试中几乎必问：https://juejin.im/post/5b7e955be51d4538de11550c



##### HashMap中(tab.length - 1) & hash的神奇之处：https://www.jianshu.com/p/2d86f83d1d26

##### hashmap 中hash函数h & (length-1)详解：https://blog.csdn.net/oqqYeYi/article/details/39831029



为了能让 HashMap 存取高效，尽量较少碰撞，也就是要尽量把数据分配均匀，每个链表/红黑树长度大致相同。这个实现就是把数据存到哪个链表/红黑树中的算法。

**这个算法应该如何设计呢？**

我们首先可能会想到采用%取余的操作来实现。但是，重点来了：**“取余(%)操作中如果除数是2的幂次则等价于与其除数减一的与(&)操作（也就是说 hash%length==hash&(length-1)的前提是 length 是2的 n 次方；）。”** 并且 **采用二进制位操作 &，相对于%能够提高运算效率，这就解释了 HashMap 的长度为什么是2的幂次方。**



**5.**  **HashMap和HashTable的对比**



HashTable和HashMap采用相同的存储机制，二者的实现基本一致，不同的是：

（1）HashMap是非线程安全的，HashTable是线程安全的，内部的方法基本都经过synchronized修饰。

（2）因为同步、哈希性能等原因，性能肯定是HashMap更佳，因此HashTable已被淘汰。

（3） HashMap允许有null值的存在，而在HashTable中put进的键值只要有一个null，直接抛出NullPointerException。

（4）HashMap默认初始化数组的大小为16，HashTable为11。前者扩容时乘2，使用位运算取得哈希，效率高于取模。而后者为乘2加1，都是素数和奇数，这样取模哈希结果更均匀。



**6.**  **HashTable和ConCurrentHashMap的对比**



先对ConcurrentHashMap进行一些介绍吧，它是线程安全的HashMap的实现。

HashTable里使用的是synchronized关键字，这其实是对对象加锁，锁住的都是对象整体，当Hashtable的大小增加到一定的时候，性能会急剧下降，因为迭代时需要被锁定很长的时间。

ConcurrentHashMap算是对上述问题的优化，其构造函数如下，默认传入的是16，0.75，16。



 **7.**  **HashMap和ConCurrentHashMap的对比**

最后对这俩兄弟做个区别总结吧：

（1）经过4.2的分析，我们知道ConcurrentHashMap对整个桶数组进行了分割分段(Segment)，然后在每一个分段上都用lock锁进行保护，相对于HashTable的syn关键字锁的粒度更精细了一些，并发性能更好，而HashMap没有锁机制，不是线程安全的。

（2）HashMap的键值对允许有null，但是ConCurrentHashMap都不允许。