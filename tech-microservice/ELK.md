systemctl start elasticsearch.service

```
systemctl start elasticsearch.service
systemctl start filebeat.service
setsid ./kibana-7.3.1/bin/kibana --allow-root > ./kibana.out
```

安装：

```shell
# https://www.elastic.co/guide/en/beats/filebeat/7.5/setup-repositories.html#_yum
# https://www.elastic.co/guide/en/logstash/7.5/installing-logstash.html#_yum

cd /usr/local/lh/elk/
rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
touch /etc/yum.repos.d/elastic.repo
vim /etc/yum.repos.d/elastic.repo
[elastic-7.x]
name=Elastic repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

yum install filebeat
yum install logstash
yum install elasticsearch
systemctl enable filebeat
systemctl enable logstash

#配置filebeat.yml, pipleline.conf

#https://github.com/theangryangel/logstash-output-jdbc
/usr/share/logstash/bin/logstash-plugin install logstash-output-jdbc

#https://www.elastic.co/guide/en/logstash/current/advanced-pipeline.html
nohup filebeat -e -c /etc/filebeat/filebeat.yml -d "publish" > /dev/null 2>&1 &
#验证配置是否正确logstash
nohup /usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/first-pipeline.conf --config.test_and_exit > /dev/null 2>&1 &
#正常启动logstash
nohup /usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/first-pipeline.conf --config.reload.automatic  > /dev/null 2>&1 &
/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/first-pipeline.conf --config.reload.automatic &

#kibaba远程访问
vim /etc/kibana/kibaba.yml
server.host: 10.1.0.11

systemctl restart kibana.service

#安装包的下载缓存目录 https://blog.csdn.net/zhezhebie/article/details/74980072
/var/cache/yum/x86_64/7/elastic-7.x/packages（有问题，只有几M）
```

```properties
# /etc/logstash/conf.d/first-pipeline.conf
input {
    beats {
        port => "5044"
    }
}
# The filter part of this file is commented out to indicate that it is
# optional.
# filter {
#
# }
#output {
#    stdout { codec => rubydebug }
#}
output {
    jdbc {
        driver_jar_path => "/usr/local/lh/elk/mysql-connector-java-8.0.17.jar"
        driver_class => "com.mysql.cj.jdbc.Driver"
        connection_string => "jdbc:mysql://localhost/tech_im?user=lh&password=Keep123!"
        statement => [ "INSERT INTO test_logstash (msg_host, msg_ts, msg) VALUES(?, ?, ?)", "host", "@timestamp", "message" ]
    }
}

```

logstash-output-jdbc插件的安装 https://github.com/theangryangel/logstash-output-jdbc

```shell
#官网安装说明：
Installation
Run bin/logstash-plugin install logstash-output-jdbc in your logstash installation directory
Now either:
Use driver_jar_path in your configuraton to specify a path to your jar file
Or:
Create the directory vendor/jar/jdbc in your logstash installation (mkdir -p vendor/jar/jdbc/)
Add JDBC jar files to vendor/jar/jdbc in your logstash installation
And then configure (examples can be found in the examples directory)

#实际安装：
/usr/share/logstash/bin/logstash-plugin install logstash-output-jdbc

```

https://www.elastic.co/guide/en/logstash/current/field-extraction.html

https://www.elastic.co/guide/en/logstash/current/logstash-config-for-filebeat-modules.html

http://docs.flycloud.me/docs/ELKStack/logstash/plugins/filter/grok.html

http://grokdebug.herokuapp.com/

##### logstash output:

```json
{
      "@version" => "1",
         "input" => {
        "type" => "log"
    },
       "message" => "2020-01-16 10:25:47 \e[39mDEBUG\e[0;39m: \e[36mRouteDefinition tech-blog-provider applying {_genkey_0=/feign/**} to Path\e[0;39m <<< [elastic-3] at org.springframework.cloud.gateway.route.RouteDefinitionRouteLocator.combinePredicates(RouteDefinitionRouteLocator.java:237)",
         "agent" => {
                "type" => "filebeat",
        "ephemeral_id" => "8290015f-c446-4dfc-b5c1-07c4bfa4026f",
            "hostname" => "VM_0_11_centos",
                  "id" => "727bb563-7035-4935-88fc-e6945d9d3514",
             "version" => "7.5.1"
    },
           "ecs" => {
        "version" => "1.1.0"
    },
          "tags" => [
        [0] "beats_input_codec_plain_applied"
    ],
          "host" => {
                 "name" => "VM_0_11_centos",
                   "id" => "c28d40cbc8e3adcb4e32d9779a77b39e",
         "architecture" => "x86_64",
                   "os" => {
              "kernel" => "3.10.0-862.el7.x86_64",
                "name" => "CentOS Linux",
             "version" => "7 (Core)",
              "family" => "redhat",
            "platform" => "centos",
            "codename" => "Core"
        },
        "containerized" => false,
             "hostname" => "VM_0_11_centos"
    },
    "@timestamp" => 2020-01-16T02:25:56.875Z,
           "log" => {
        "offset" => 3964617,
          "file" => {
            "path" => "/usr/local/lh/runtime/logs-all/tech-cloud/gateway/tech-gateway-server.log"
        }
    }
}

```

filebeat 开发语言：GO

logstash 开发语言：JRuby

elasticsearch 开发语言：Java

kibana 开发语言：nodejs