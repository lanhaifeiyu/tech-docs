##### Spring-Boot-操作-Redis，三种方案全解析！：https://juejin.im/post/5cf46fe36fb9a07ec373d730

```shell
#redis 密码为@开头，springboot启动报错：
while scanning for the next token found character '@' that cannot start any token. (Do not use @ for indentation) in 'reader', line 37, column 19: password: @Zse4rfv_
```

```shell
#redis-cli连接后执行操作报错：Redis (error) NOAUTH Authentication required.
127.0.0.1:6379> auth "yourpassword"
```

```shell
#查看redis的基本统计信息
127.0.0.1:6379> info
```

```shell
#查看所有key
keys *
```

[Springboot操作Redis时，发现key值出现 \xac\xed\x00\x05t\x00\tb](https://www.jianshu.com/p/5f9cc7a70bd4) 我出现的前缀是：\xac\xed\x00\x05t\x00\x05

