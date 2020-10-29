https://www.elastic.co/guide/index.html

https://www.elastic.co/guide/en/logstash/current/index.html

https://www.elastic.co/guide/en/beats/filebeat/current/index.html

https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html



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

#离线安装
https://rubygems.org/gems/logstash-output-jdbc
https://blog.csdn.net/fgf00/article/details/90383884

# 插件都在https://rubygems.org/, 搜索插件，然后下载gem文件
mkdir logstash
mv logstash-output-exec-3.1.4.gem logstash/
zip -r logstash-output-exec.zip logstash
./bin/logstash-plugin install file:///tmp/logstash-output-exec.zip
bin/logstash-plugin list

mkdir logstash
mv logstash-output-jdbc-5.4.0.gem logstash/
zip -r logstash-output-jdbc.zip logstash
/usr/share/logstash/bin/logstash-plugin install file:///usr/local/elk/logstash-output-jdbc.zip
/usr/share/logstash/bin/logstash-plugin list

/usr/share/logstash/bin/logstash-plugin install file:///usr/local/elk/logstash-output-jdbc.zip
chown -R logstash /usr/share/logstash/vendor/bundle/jruby/2.5.0/gems/logstash-output-jdbc-5.4.0
chgrp -R logstash /usr/share/logstash/vendor/bundle/jruby/2.5.0/gems/logstash-output-jdbc-5.4.0
chmod -R 755 /usr/share/logstash/vendor/bundle/jruby/2.5.0/gems/logstash-output-jdbc-5.4.0
chown logstash /usr/share/logstash/vendor/bundle/jruby/2.5.0/specifications/logstash-output-jdbc-5.4.0.gemspec
chgrp logstash /usr/share/logstash/vendor/bundle/jruby/2.5.0/specifications/logstash-output-jdbc-5.4.0.gemspec
chmod 755 logstash /usr/share/logstash/vendor/bundle/jruby/2.5.0/specifications/logstash-output-jdbc-5.4.0.gemspec

#安装websocket output插件
/usr/share/logstash/bin/logstash-plugin install logstash-output-websocket
/usr/share/logstash/bin/logstash-plugin install /usr/local/elk/logstash-output-websocket-3.0.5.gem
#conf.d/first-pipeline.conf:
websocket {
	id => "sta_out_ws"
	port => "6001"
}
systemctl restart logstash.service

#http plugin
/usr/share/logstash/bin/logstash-plugin install file:///usr/local/elk/logstash-output-http-5.2.4.zip
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

##### logstash安装离线插件：https://anbc.gitbooks.io/elk-handbook/content/shengcheng-logstash-cha-jian-li-xian-bao.html

```shell
#先在线安装插件
/usr/share/logstash/bin/logstash-plugin install logstash-output-websocket
#生成离线安装包，是一个zip文件
/usr/share/logstash/bin/logstash-plugin prepare-offline-pack logstash-output-websocket
#在需要离线安装插件的主机上安装此离线包
/usr/share/logstash/bin/logstash-plugin install file:///usr/local/elk/logstash-output-http-5.2.4.zip
```



filebeat 开发语言：GO

logstash 开发语言：JRuby

elasticsearch 开发语言：Java

kibana 开发语言：nodejs

logstash监控 https://www.elastic.co/guide/en/logstash/current/monitoring-logstash.html

```shell
curl -XGET '127.0.0.1:9600/_node/<types>' #pipelines, os, jvm

curl -XGET '127.0.0.1:9600/_node/pipelines?pretty'
curl -XGET '127.0.0.1:9600/_node/os?pretty'
curl -XGET '127.0.0.1:9600/_node/jvm?pretty'

curl -XGET '127.0.0.1:9600/_node/plugins?pretty'

curl -XGET '127.0.0.1:9600/_node/stats/<types>' #jvm, process, events, pipelines, reloads, os
curl -XGET '127.0.0.1:9600/_node/stats/jvm?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/process?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/events?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/pipelines?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/reloads?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/os?pretty'

curl -XGET '127.0.0.1:9600/_node/hot_threads?pretty'

#重要：
curl -XGET '127.0.0.1:9600/_node/stats/events?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/process?pretty'
curl -XGET '127.0.0.1:9600/_node/stats/pipelines?pretty'

curl -XGET '127.0.0.1:5066'
```

##### [数据收集之Filebeat](https://blog.csdn.net/wangpei1949/article/details/81839830) At-Least-Once机制

filebeat的log默认在/var/log/下面，以message-为前缀，如：messages-20200309，这个log里面可以看到filebeat的metric信息，基本的运行状态。

filebeat没有创建对应的账号，服务/etc/systemd/system/multi-user.target.wants/filebeat.service配置里面也没有指定用户，是由root账号在运行，直接打印到/var/log/message系统日志中了。

`journalctl -u kibana.service`

##### kibana:

http://47.93.118.250:5601/

journalctl -xe

离线安装logstash插件：

https://blog.csdn.net/evandeng2009/article/details/78036054

https://blog.csdn.net/fgf00/article/details/90383884

http://codepub.cn/2017/09/29/logstash-offline-install-plugin/

https://github.com/logstash-plugins?q=&type=&language=

https://yangxx.net/?p=3189

**删除ES文件：**

https://www.qedev.com/bigdata/158587.html
https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-delete-index.html

```shell
#清空索引，释放磁盘空间
curl -X DELETE "localhost:9200/_all?pretty"
```

