## LINUX模块之常用命令

1. ##### 常用命令

```shell
#查看网络IP占用情况
yum install arp-scan
IP ADDR
arp-scan --interface=enp0s3 -l

#查看服务器基本情况
top

#其他命令：
ctrl-c: ( kill foreground process ) 发送 SIGINT 信号给前台进程组中的所有进程，强制终止程序的执行；
ctrl-z: ( suspend foreground process ) 发送 SIGTSTP 信号给前台进程组中的所有进程，常用于挂起一个进程，而并非结束进程，用户可以使用使用fg/bg操作恢复执行前台或后台的进程。fg命令在前台恢复执行被挂起的进程，此时可以使用ctrl-z再次挂起该进程，bg命令在后台恢复执行被挂起的进程，而此时将无法使用ctrl-z再次挂起该进程；一个比较常用的功能：
正在使用vi编辑一个文件时，需要执行shell命令查询一些需要的信息，可以使用ctrl-z挂起vi，等执行完shell命令后再使用fg恢复vi继续编辑你的文件（当然，也可以在vi中使用！command方式执行shell命令，但是没有该方法方便）。
ctrl-d: ( Terminate input, or exit shell ) 一个特殊的二进制值，表示 EOF，作用相当于在终端中输入exit后回车；
#还有以下几个：
ctrl-/    发送 SIGQUIT 信号给前台进程组中的所有进程，终止前台进程并生成 core 文件
ctrl-s   中断控制台输出
ctrl-q   恢复控制台输出
ctrl-l    清屏
```

```shell
#查看服务的错误信息
journalctl -xe
journalctl -xe | grep logstash
```

