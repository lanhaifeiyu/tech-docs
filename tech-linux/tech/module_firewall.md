## LINUX模块之防火墙

1. ##### 防火墙基本命令

```shell
#配置防火墙，开放3306端口
firewall-cmd --add-port=3306/tcp --zone=public --permanent
#批量开放端口
firewall-cmd --add-port=2181-2183/tcp --zone=public --permanent
#关闭端口
firewall-cmd --remove-port=11111/tcp --permanent
firewall-cmd --reload
firewall-cmd --list-all

#临时关闭防火墙,重启后会重新自动打开
systemctl restart firewalld
#检查防火墙状态
firewall-cmd --state
firewall-cmd --list-all
#Disable firewall
systemctl disable firewalld
systemctl stop firewalld
systemctl status firewalld
#Enable firewall
systemctl enable firewalld
systemctl start firewalld
systemctl status firewalld
```

