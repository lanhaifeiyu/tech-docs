```shell
#启动eureka，profile为node1
nohup java -jar tech-eureka-server-0.0.1-SNAPSHOT.jar --spring.profiles.active=node1 > /dev/null 2>&1 &
nohup java -jar tech-eureka-server-0.0.1-SNAPSHOT.jar --spring.profiles.active=node2 > /dev/null 2>&1 &
#访问管理页面
http://172.81.216.81:8761/
http://172.81.216.81:8762/
http://175.24.103.167:8761/
http://175.24.103.167:8762/
```

[第九篇: 高可用的服务注册中心](https://www.cnblogs.com/PPBoy/p/9435289.html)

```yaml
client:
    serviceUrl:
      defaultZone: http://peer2:8769/eureka/,http://peer3:8770/eureka/
    registerWithEureka: true #这里显式的把这两个属性设为true，作为服务注册，当单点时，要设置为false。或者将application.yml的属性设为true，因为即使启动时加了参数peer1也会加载application.yml.
    fetchRegistry: true
```

