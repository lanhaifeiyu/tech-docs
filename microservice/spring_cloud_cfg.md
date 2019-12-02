```
nohup java -jar yourapp.jar &
eureka-server: http://182.61.49.180:8761/
config-server: http://182.61.49.180:9002/
client-refresh-config: http://localhost:8888/actuator/refresh
server-refresh-config: http://182.61.49.180:9002/actuator/bus-refreshclient-get-config: http://localhost:8888/configConsumer/getConfigInfo
rabbitmq-server: http://182.61.49.180:15672/
```