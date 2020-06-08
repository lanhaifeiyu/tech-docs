##### 命令行运行jmeter并生成报告：

```shell
jmeter -n -t D:\apache-jmeter-5.2.1\z_cases\rest_api_performence_2020_local.jmx -l D:\apache-tomcat-9.0.31\webapps\jmeter1\rest_api_performence_2020_local.jtl -e -o D:\apache-tomcat-9.0.31\webapps\jmeter1\rest_api_performence_2020_local

jmeter -n -t D:\apache-jmeter-5.2.1\z_cases\rest_api_performence_2020_local.jmx -l D:\apache-tomcat-9.0.31\webapps\jmeter2\rest_api_performence_2020_local.jtl -e -o D:\apache-tomcat-9.0.31\webapps\jmeter2\rest_api_performence_2020_local

jmeter -n -t /root/jmeter/rest_api_performence_new.jmx -l /root/jmeter/rest_api_performence_new.jtl -e -o /root/jmeter/rest_api_performence_new
```

