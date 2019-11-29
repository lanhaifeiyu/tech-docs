### 如何实现SSH断开后 进程仍然在后台运行

```shell
#需要在shell中输入exit来退出终端
nohup command > /dev/null 2>&1 &
nohup command > /home/nohup.log 2>&1 &
```

https://blog.csdn.net/v1v1wang/article/details/6855552

##### 使用&命令后，作业被提交到后台运行，当前控制台没有被占用，但是一但把当前控制台关掉(退出帐户时)，作业就会停止运行。 

对于linux运维，我们都是使用ssh登录到服务器，如果我们运行的任务需要很长时间或不间断运行，在我们直接关闭终端窗口或网络不稳定的情况下，任务就会中断，当然这只对于普通程序，不包括如mysqld,httpd这样的守护进程。
原因分析：

```shell
[root@DigMouse ~]# ping 51osos.com > /dev/null &
[1] 13678
[root@DigMouse ~]# pstree -H 13678
init-+-NetworkManager
      |-sshd---sshd---bash-+-ping
                            |                    `-pstree
```


当用户注销（logout）或者网络断开时，终端会收到 HUP（hangup）信号从而关闭其所有子进程。从上面的例子大家可以看出当前我们所处的 bash 是 sshd 的子进程，当 ssh 断开连接时，HUP 信号会影响到它下面的所有子进程，包括ping进程。

##### 解决思路：

1.让进程运行在新的session(会话)里即不属于此终端的子进程。
2.可以实现让进程忽略HUP信号
解决方法：

##### 1.nohup命令  ( no hang up) 

功能：不挂断地运行命令，忽略HUP信号。
语法：nohup command &
实例：

```shell
[root@DigMouse ~]# nohup ping 51osos.com > /dev/null &
[1] 13683
[root@DigMouse ~]# nohup: ignoring input and redirecting stderr to stdout
[root@DigMouse ~]# ls
Desktop    Downloads  nohup.out
Documents  Music      Public    Videos 
[root@DigMouse ~]# cat nohup.out
PING cd447.gotoip.net (122.225.57.246) 56(84) bytes of data.
64 bytes from 122.225.57.246: icmp_seq=1 ttl=56 time=48.6 ms
64 bytes from 122.225.57.246: icmp_seq=2 ttl=56 time=47.8 ms
64 bytes from 122.225.57.246: icmp_seq=3 ttl=56 time=49.9 ms
64 bytes from 122.225.57.246: icmp_seq=4 ttl=56 time=49.5 ms
[root@DigMouse ~]# ps -ef | grep ping
root     13683 13655  0 09:33 pts/0    00:00:00 ping 51osos.com
root     13687 13655  0 09:36 pts/0    00:00:00 grep ping
[root@DigMouse ~]#
```

关闭此终端，打开另一个终端使用ps命令，仍然可以查看到ping进程。 无论是否将 nohup 命令的输出重定向到终端，输出都将附加到当前目录的 nohup.out 文件中。如果当前目录的 nohup.out 文件不可写，输出重定向到 $HOME/nohup.out 文件中。
#nohup command > command.out 2>&1 &
上面的例子中nohup command输出的内容输出到了command.out文件中，错误内容输出到了标准输出。

#####  nohup /dev/null 2>&1 含义详解https://blog.csdn.net/u010889390/article/details/50575345 

 nohup /mnt/Nand3/H2000G >/dev/null 2>&1 & 

其中0 表示键盘输入 1表示屏幕输出 2表示错误输出.把标准出错重定向到标准输出,然后扔到/DEV/NULL下面去。通俗的说，就是把所有标准输出和标准出错都扔到垃圾桶里面。
command >out.file 2>&1 &
command >out.file是将command的输出重定向到out.file文件，即输出内容不打印到屏幕上，而是输出到out.file文件中。 2>&1 是将标准出错重定向到标准输出，这里的标准输出已经重定向到了out.file文件，即将标准出错也输出到out.file文件中。最后一个& ， 是让该命令在后台执行。 

##### 2.setsid命令

功能：run a program in a new session在新的会话中运行程序
实例：

```shell
[root@DigMouse ~]# setsid ping 51osos.com > /dev/null 
[root@DigMouse ~]# ps -ef | grep ping
root     13696     1  0 09:45 ?        00:00:00 ping 51osos.com
root     13698 13655  0 09:46 pts/0    00:00:00 grep ping
[root@DigMouse ~]#
```


从上例可以看出ping进程的PID是13696，进程的父ID(PPID)是init而不是当前终端的进程 ID，可与nohup比较。

##### 3.将"&"也放入“()”内执行命令

将一个或多个命名包含在“()”中就能让这些命令在子 shell 中运行

```shell
[root@DigMouse ~]# (ping 51osos.com > /dev/null &)
[root@DigMouse ~]# ps -ef | grep ping
root     13702     1  0 09:50 pts/0    00:00:00 ping 51osos.com
root     13704 13655  0 09:50 pts/0    00:00:00 grep ping
[root@DigMouse ~]#
```


进程的父ID(PPID)是init而不是当前终端的进程 ID，因而关闭终端无任何影响。

##### 4.disown命令

用disown -h jobspec 来使某个作业忽略HUP信号。 用disown -ah 来使所有的作业都忽略HUP信号。
用disown -rh 来使正在运行的作业忽略HUP信号。
当使用过 disown 之后，会将把目标作业从作业列表中移除，我们将不能再使用jobs来查看它，但是依然能够用ps -ef查找到它。

但是还有一个问题，这种方法的操作对象是作业，如果我们在运行命令时在结尾加了"&"来使它成为一个作业并在后台运行，那么就万事大吉了，我们可以通过jobs命令来得到所有作业的列表。但是如果并没有把当前命令作为作业来运行，如何才能得到它的作业号呢？答案就是用 CTRL-z（按住Ctrl键的同时按住z键）了！

CTRL-z 的用途就是将当前进程挂起（Suspend），然后我们就可以用jobs命令来查询它的作业号，再用bg jobspec 来将它放入后台并继续运行。需要注意的是，如果挂起会影响当前进程的运行结果，请慎用此方法。

```shell
[root@DigMouse ~]# ping 51osos.com > /dev/null 
^Z
[1]+  Stopped                 ping 51osos.com > /dev/null
[root@DigMouse ~]# jobs
[1]+  Stopped                 ping 51osos.com > /dev/null
[root@DigMouse ~]# bg %1
[1]+ ping 51osos.com > /dev/null &
[root@DigMouse ~]# jobs
[1]+  Running                 ping 51osos.com > /dev/null &
[root@DigMouse ~]# disown -h %1

[root@DigMouse ~]# ps -ef | grep ping
root     13716 13655  0 09:59 pts/0    00:00:00 ping 51osos.com
root     13734 13655  0 10:01 pts/0    00:00:00 grep ping

#此时jobs还是能看到ping后台任务的。logout后在另一个终端测试

[root@DigMouse ~]# ps -ef | grep ping
root     13716     1  0 09:59 ?        00:00:00 ping 51osos.com
root     13754 13738  0 10:02 pts/1    00:00:00 grep ping
```


此时Jobs无ping后台任务。PPID变成了1

##### 5.screen命令

此命令非常强大。如果非常多的命令都需要忽略HUP命令，screen可以解决这一问题。screen 提供了 ANSI/VT100 的终端模拟器，使它能够在一个真实终端下运行多个全屏的伪终端。

用screen -dmS session name 来建立一个处于断开模式下的会话（并指定其会话名）。
用screen -list 来列出所有会话。
用screen -r session name 来重新连接指定会话。
用快捷键CTRL-a d 来暂时断开当前会话。
我的CentOS6.0上没有screen命令，不过可以使用yum安装。
[root@DigMouse ~]# yum list screen
Available Packages
screen.i686                         4.0.3-15.el6                         base
[root@DigMouse ~]# yum install screen*
复制代码
Ok,系统有了screen命令了。
[root@DigMouse ~]# screen -r DigMouse
[root@DigMouse ~]# ping 51osos.com > /dev/null &
[1] 13789
[root@DigMouse ~]# pstree -H 13789
复制代码

此时 bash 是 screen 的子进程，而 screen 是 init（PID为1）的子进程。那么当 ssh 断开连接时，HUP 信号自然不会影响到 screen 下面的子进程了。



 在linux命令行中输入：**screen**即可，就进入了**screen**环境。 进入了就要**退出**，**退出**有两种方式，一个是完全**退出**，输入exit就是完全**退出**。 另一个是Detached，CTRL-a+d（先按CTRL-a，然后按d字母），就可以Detached了。 

