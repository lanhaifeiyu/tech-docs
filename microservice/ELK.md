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

#https://www.elastic.co/guide/en/logstash/current/advanced-pipeline.html
nohup filebeat -e -c /etc/filebeat/filebeat.yml -d "publish" > /dev/null 2>&1 &
/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/first-pipeline.conf --config.test_and_exit &
/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/first-pipeline.conf --config.reload.automatic &
```

