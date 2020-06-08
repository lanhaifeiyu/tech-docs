> #### 数据结构与集合

##### 这几道Java集合框架面试题在面试中几乎必问：https://juejin.im/post/5b7e955be51d4538de11550c

HashMap 实现原理，ConcurrentHashMap 实现原理 

红黑树，为什么允许局部不平衡 

ConcurrentHashMap 和 Hashtable 区别 

ArrayList 和 linkedlist 区别。ArrayList 是否会越界。 

ArrayList 和 hashset 有何区别。hashset 存的数是有序的么。 

hashmap 扩容是怎么扩容的，为什么是 2 的幂 

concurrenthashmap 为什么线程安全，采用了什么措施应对高并发 

快速排序说一下过程 

栈和队列 

java 的基础知识点，主要围绕在集合类和多线程等：ArrayList、LinkedList、HashSet、HashpMap 的数据结果，以及如何扩容、以及 ConcurrentHashMap 相关的多线程安全等。 

排序算法的复杂度，快速排序非递归实现。海量数据过滤，黑名单过滤一个 url。 

list set map 底层使用什么实现的有哪些典型实现 

说说一致性 Hash 算法 

常用的集合类有哪些? 比如List如何排序?

ArrayList和LinkedList内部的实现大致是怎样的? 他们之间的区别和优缺点?

HashMap实现原理，如何保证HashMap的线程安全?

各种排序算法、未排序常规数据查找第 K 大的数，时间复杂度。 

二叉树的深度

从 ConcurrentHashMap 一路问到锁&锁优化->LongAdder->伪共享->缓存行填充->cas 等诸多技术细节

如何倒序输出单向链表？ 

个人直接想法是用栈先进后出的特点，把链表数据读到栈里然后输出。 有更好的实现方式吗？ 

ArrayList 和 LinkedList 底层 

HashMap 及线程安全的 ConcurrentHashMap，以及各自优劣势 

HashMap 中的 get()方法是如何实现的？ 

HashMap 可以用在哪些场景？ 

ArrayList 和 LinkedList 底层 

HashMap 及线程安全的 ConcurrentHashMap，以及各自优劣势 

HashMap 中的 get()方法是如何实现的？ 

HashMap 可以用在哪些场景？ 

问了冒泡排序，快排，和归并排序及优缺点和优化 

jdk1.8 concurrenthashmap 的新的特性，有没有看过源码 

爬虫用的什么数据结构 

hashmap 和 concurrenthashmap 的 size 方法怎么实现的 

说一下 hashcode 的作用？HashMap 的底层实现？HashMap 和 HashTable 的区别

说一下 concurrentHashMap 和 hashTable 在性能上的区别？以及这种差异形成的原因 

讲一下堆以及堆排序 

说一下 B+tree 和二叉搜索树的区别？说一下二叉搜索树和 AVL 树、红黑树之间的差别 

给你两个文件（字符串形式的）如何找出他们之间的不同地方？ 你刚刚说的能怎么优化？ 

Hashmap 的原理，增删的情况后端数据结构如何位移 

hashmap 容量为什么是 2 的幂次 

hashset 的源码 

object 类你知道的方法. hashcode 和 equals 

你重写过 hashcode 和 equals 么，要注意什么 

假设现在一个学生类，有学号和姓名，我现在 hashcode 方法重写的时候，只将学号参与计算，会出现什么情况？ 

往 set 里面 put 一个学生对象，然后将这个学生对象的学号改了，再 put 进去，可以放进 set 么？并讲出为什么 

讲一下稳定的排序算法和不稳定的排序算法 

讲一下快速排序的思想 

为什么要同时重写 hashcode 和 equals 

Hashmap 的原理 

Hashmap 如何变线程安全，每种方式的优缺点 

Hashmap 的原理，增删的情况后端数据结构如何位移 

hashmap 容量为什么是 2 的幂次 

hashset 的源码 

讲一下稳定的排序算法和不稳定的排序算法 

讲一下快速排序的思想 

说一下几种常见的排序算法和分别的复杂度。

用Java写一个冒泡排序算法

描述一下链式存储结构。

如何遍历一棵二叉树?

倒排一个LinkedList。

用Java写一个递归遍历目录下面的所有文件。

#

- 编程技巧
- 线性表
- 字符串
- 栈和队列
- 树
- 排序
- 查找
- 暴力枚举法
- 广度优先搜素
- 深度优先搜素
- 分治法
- 贪心法
- 动态规划
- 图
- 细节实现题

> ##### 算法

两个 10G 的文件，里面是一些 url，内存只有 1G，如何将这两个文件合并，找到相同的 url？ 

代码题：两个有序数组，数组中存在重复数字，合并成一个有序数组，去除重复数字。 

两个 10G 的文件，里面是一些 url，内存只有 1G，如何将这两个文件合并，找到相同的 url？ 

1000 个多并发线程，10 台机器，每台机器 4 核的，设计线程池大小。

代码题：两个有序数组，数组中存在重复数字，合并成一个有序数组，去除重复数字。 

给你 50 亿行字符串，机器 4G 内存（只能一台机器），找出重复次数最多的那行字符串？ （以行为单位，每行不超过 10 个字符） 

设计一个算法，实现两个 10g 大文件在 10m 的内存中将两个大文件中重复的放进第三个文件

快速排序的平均复杂多少？最坏情况是什么？（这个题估计就是缓和一下尴尬的气氛） 

手撕算法：给定一个数字三角形，找到从顶部到底部的最小路径和。每 一步可以移动到下面一行的相邻数字上。 然后继续在这个问题上扩展  求出最短那条的路径 . 递归求出所有的路径 

手撕算法：反转单链表. 手撕算法：实现类似微博子结构的数据结构，输入一系列父子关系，输 出一个类似微博评论的父子结构图 

手写 java 多线程 

手写 java 的 soeket 编程，服务端和客户端 

手撕算法： 爬楼梯，写出状态转移方程 

智力题：时针分针什么时候重合 

手撕算法：leeetcode 原题 22，Generate Parentheses，给定 n 对括号，请写一个函数以将其生成新的括号组合，并返回所有组合结果。 

手撕算法：leeetcode 原题 22，Generate Parentheses，给定 n 对括号，请写一个函数以将其生成新的括号组合，并返回所有组合结果。 