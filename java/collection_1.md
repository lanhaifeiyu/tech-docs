##### Java8的HashMap详解: https://blog.csdn.net/login_sonata/article/details/76598675 

##### Java 8系列之重新认识HashMap: https://zhuanlan.zhihu.com/p/21673805 

##### HashMap中(tab.length - 1) & hash的神奇之处: https://blog.csdn.net/hbtj_1216/article/details/76623754 

##### 全网把Map中的hash()分析的最透彻的文章，别无二家。 https://www.hollischuang.com/archives/2091 

HashMap 的长度为什么是2的幂次方,  **hash%length==hash&(length-1)** :

```
那么，为什么可以使用位运算(&)来实现取模运算(%)呢？这实现的原理如下：
X % 2^n = X & (2^n – 1)
2^n表示2的n次方，也就是说，一个数对2^n取模 == 一个数和(2^n – 1)做按位与运算 。
假设n为3，则2^3 = 8，表示成2进制就是1000。2^3 = 7 ，即0111。
此时X & (2^3 – 1) 就相当于取X的2进制的最后三位数。
从2进制角度来看，X / 8相当于 X >> 3，即把X右移3位，此时得到了X / 8的商，而被移掉的部分(后三位)，则是X % 8，也就是余数。
```

