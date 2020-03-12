> ##### spring注解大全

https://juejin.im/post/5d455eabe51d4561fd6cb472

https://juejin.im/post/5d31272ef265da1bb776a293#heading-0

https://juejin.im/post/5b8ac1c76fb9a019da27d910

------

https://blog.csdn.net/m0_37479246/article/details/78970809

三种定时类型。

```
1.cron  -- @Scheduled(cron = "0 0/1 * * * ?") # 当时间达到设置的时间会触发事件。上面那个例子会每1分钟执行一次。
2.fixedRate --@Scheduled（fixedRate=2000） # 每两秒执行一次时间。
3.fixedDelay --@Scheduled（fixedDelay=2000） #  每次任务执行完之后的2s后继续执行
```

