> ##### 多线程

有哪几种常用的线程池什么情况下使用 Runnable 和 Thread 创建线程，Runnable 和 Callable 的区别 

线程方法中的异常如何处理，副线程可以捕获到吗 

synchronized 和锁的区别，什么情况下使用 synchronized 和 ReentrantLock 

高并发情况，系统的优化方案有哪些，以及优先级排序。 

volatile 和 synchronized 区别 

Java 线程间怎么实现同步，notify()与 notifyAll()的区别 

synchronized 的实现原理？Volatile 能保证原子性吗？为什么？ 

线程池的参数有什么意义 

多线程和高并发有什么区别 

高并发下有哪些常用的技术解决方案，举三个高并发场景设计例子 

线程池优点，参数，如果我想实现 newSingleThreadPoll，应该怎么配置，构造方法传什么 

参数

线程的五态？转化过程？ 

变着法的问了一大堆线程池的知识 （主要考对应的参数） 

lock 和 synchronized 的区别 

reentrantlock 的实现 

hashmap 和 concurrenthashmap 

线程安全（阻塞同步，非阻塞同步，无同步） 

线程池的设计 

线程池如何做负载均衡 

如何实现线程调度算法 

将一下线程安全问题产生的原因？ 

多线程状态图，状态如何流转？ 

Java 如何实现线程安全 

Synchronized 和 Lock 哪个更好？ 

用过线程池吗，对应的好处，如何用？ 

Synchronized 和 Lock 哪个更好？ 

1000 个多并发线程，10 台机器，每台机器 4 核的，设计线程池大小。 

线程池的参数 

每个参数解释一遍 

然后面试官设置了每个参数，给了是个线程，让描述出完整的线程池执 行的流程

Java 如何实现线程安全 

多线程状态图，状态如何流转？ 

用过线程池吗，对应的好处，如何用？ 

线程池的参数，每个参数解释一遍，然后面试官设置了每个参数，给了是个线程，让描述出完整的线程池执行的流程 

一个任务分成十个任务，最后汇总计算，不能用 fork/join ，开源框架源码了解不？ 

多线程条件变量为什么要在 while 体里 

threadlocal 了解吗 

如何创建线程? 如何保证线程安全?

如何实现一个线程安全的数据结构

如何避免死锁

Volatile关键字的作用?

HashMap在多线程环境下使用需要注意什么? 为什么?

Java程序中启动一个线程是用run还是start?

什么是守护线程? 有什么用?

什么是死锁? 如何避免

线程和进程的差别是什么?

Java里面的Threadlocal是怎样实现的?

ConcurrentHashMap的实现原理是?

sleep和wait区别

notify和notifyAll区别

volatile关键字的作

ThreadLocal的作用与实现

两个线程如何串行执行

上下文切换是什么含义

可以运行时kill掉一个线程吗?

什么是条件锁、读写锁、自旋锁、可重入锁?

线程池ThreadPoolExecutor的实现原理?

#

- Synchronized 用 过 吗 ， 其 原 理 是 什 么 ？
- 你 刚 才 提 到 获 取 对 象 的 锁，这 个 “锁”到 底 是 什 么 ？ 如 何 确 定对 象 的 锁 ？
- 什 么 是 可 重 入 性 ， 为 什 么 说 Synchronized 是 可 重 入 锁 ？
- JVM 对 Java 的 原 生 锁 做 了 哪 些 优 化 ？
- 为 什 么 说 Synchronized 是 非 公 平 锁 ？
- 什 么 是 锁 消 除 和 锁 粗 化 ？
- 为 什 么 说 Synchronized 是 一 个 悲 观 锁 ？ 乐 观 锁 的 实 现 原 理
- 又 是 什 么 ？ 什 么 是 CAS， 它 有 什 么 特 性 ？
- 既 然 提 到 可 以 通 过 配 置 不 同 参 数 创 建 出 不 同 的 线 程 池 ， 那 么Java 中 默 认 实 现 好 的 线 程 池 又 有 哪 些 呢 ？ 请 比 较 它 们 的 异 同 。
- 如 何 在 Java 线 程 池 中 提 交 线 程 ？
- 什 么 是 Java 的 内 存 模 型，Java 中 各 个 线 程 是 怎 么 彼 此 看 到对 方 的 变 量 的 ？
- 请 谈 谈 volatile 有 什 么 特 点 ， 为 什 么 它 能 保 证 变 量 对 所 有 线程 的 可 见 性 ？
- 既 然 volatile 能 够 保 证 线 程 间 的 变 量 可 见 性 ， 是 不 是 就 意 味着 基 于 volatile 变 量 的 运 算 就 是 并 发 安 全 的 ？
- 请 对 比 下 volatile 对 比 Synchronized 的 异 同 。
- 很 多 人 都 说 要 慎 用 ThreadLocal， 谈 谈 你 的 理 解 ， 使 用
- 乐 观 锁 一 定 就 是 好 的 吗 ？
- 跟 Synchronized 相 比 ， 可 重 入 锁 ReentrantLock 其 实 现原 理 有 什 么 不 同 ？
- 那 么 请 谈 谈 AQS 框 架 是 怎 么 回 事 儿 ？
- 请 尽 可 能 详 尽 地 对 比 下 Synchronized 和 ReentrantLock的 异 同 。
- ReentrantLock 是 如 何 实 现 可 重 入 性 的 ？
- 除 了 ReetrantLock， 你 还 接 触 过 JUC 中 的 哪 些 并 发 工 具 ？
- 请 谈 谈 ReadWriteLock 和 StampedLock。
- 如 何 让 Java 的 线 程 彼 此 同 步 ？ 你 了 解 过 哪 些 同 步 器 ？ 请 分 别介 绍 下 。
- CyclicBarrier 和 CountDownLatch 看 起 来 很 相 似 ， 请 对 比下 呢 ？
- Java 中 的 线 程 池 是 如 何 实 现 的 ？
- 创 建 线 程 池 的 几 个 核 心 构 造 参 数 ？
- 线 程 池 中 的 线 程 是 怎 么 创 建 的 ？ 是 一 开 始 就 随 着 线 程 池 的 启 动创 建 好 的 吗 ？

