#####  你确定理解了String对象创建和使用吗？：https://juejin.im/entry/5a4ed02a51882573541c29d5 

```java
 String s3 = new String("three"); // 将创建1或2个字符串(取决于常量池中是否已存在"three")
//用new String()创建的字符串不是常量，不能在编译期就确定，所以new String()创建的字符串不放入常量池中，它们有自己的地址空间。
//但是"three"字符串常量在编译期也会被加入到字符串常量池（如果不存在的话）
```

