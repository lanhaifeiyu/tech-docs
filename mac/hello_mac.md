#### 需要安装的软件

##### 未装：

trojan-qt5, shadowsocksX, chrome及书签插件,oneNote, Typora, notepad++, ditto, github desktop, fiddler, 调度台-调度台服务 EMSS Studio,  花生壳, 向日葵, beyond compare, cad迷你看图, 企业微信, VirtualBox, MobaXterm，解压工具, 

##### 开发：

navicat, xshell, xftp, wireshark, postman, mysql, git, TortoiseGit, maven, jdk, erlang, scala, python, nodeJs, tomcat, jmeter, 

kafka, rabbitmq, zookeeper, nginx, redis,



##### idea插件：

jrebel, AceJump, ADB Idea, bashSupport, camelCase, Codota, Free mybatis plugin, formatYaml, grep console,

HighlightBracketPair, ideavim, key promoter x, lombok, maven helper, phoneGap, Protocol Buffer Editor, rainbow brackets,

request mapper, restfulToolkit, sequenceDiagram, Shifter, Spring Assistant, Statistic, String Manipulation, VisualVM Lancher,

vue.js, 



##### 已装：

idea, datagrip, wechat, wps, todo, 网易云音乐, 百度网盘, teamViewer, 



#### VPN

[Trojan-Qt5](https://github.com/Trojan-Qt5/Trojan-Qt5)：https://github.com/Trojan-Qt5/Trojan-Qt5/releases

https://github.com/Trojan-Qt5/Trojan-Qt5/releases/download/v1.4.0/Trojan-Qt5-macOS.dmg



#### 共享机制

代码：git, github

文本：git, github, oneNote, todo

文件：百度网盘, 基于自己的阿里云搭建共享服务器，找找有没有共享文件相关的软件



#### 运行windows软件

https://www.lizhi.io/blog/31970512

https://www.zhihu.com/question/19947980



#### 设备：

内胆包， 妙控板， 蓝牙机械键盘， 遮盖布，键盘毛刷，屏幕清洁，2T固态硬盘

以后有钱买个5K显示器



-----------------------------------------------------------------------------------------------------------

解压：
https://www.zhihu.com/question/20383279/answer/595600588
https://zhuanlan.zhihu.com/p/41127267



VSFTPD的使用详解：
https://security.appspot.com/vsftpd.html#download
https://zhuanlan.zhihu.com/p/73367809

jrebel:
https://github.com/ilanyu/ReverseProxy/releases/tag/v1.4
https://lioswong.github.io/2019/08/23/Jrebel%E4%BD%BF%E7%94%A8/
http://blog.lanyus.com/archives/317.html

idea:
https://zhile.io/2018/08/17/jetbrains-license-server-crack.html

https://zhile.io/custom-license.html



##### 编程相关推荐，很不错：https://www.zhihu.com/question/27617980/answer/919642075

##### 打造Mac下最强终端，iTerm2 + Oh My Zsh + powerlevel9k: https://feeeei.com/archives/27/

##### 舒适美观的mac终端, iTerm2+zsh+powerlevel9k+vim+virtualenv:https://juejin.im/post/5d7ba7f6e51d453c135c5b79

##### 程序员如何优雅地使用 macOS？:https://www.zhihu.com/question/20873070

##### Mac上有什么实用的必备软件？:https://www.zhihu.com/question/35251600

##### Mac上有什么实用的必备软件？-优质回答：https://www.zhihu.com/question/35251600/answer/750994319

[精品MAC应用分享](https://xclient.info/)：https://xclient.info/



##### iterm2 + oh-my-zsh + tmux + gitup  

##### iTerm2 + Oh My Zsh + powerlevel9k 

##### iTerm2+zsh+powerlevel9k+vim+virtualenv



一个手指就相当于鼠标本身，轻按表示左键点一下，可以调节灵敏度使得不离开触屏即可点到屏幕每个角落；
两个手指上下滑动控制页面，左右滑动控制前进后退，旋转可以控制图片旋转，放缩可以放缩界面，同时轻按可以触发右键；
三个手指相当于左键按住不放；
四个手指同向左右切换不同桌面，同向向上启动Mission Control ，同向向下另一个功能（我只是不知道它叫什么...嗯就是可以显示所有桌面中的同一个软件(也许是同一类型软件如文本编辑类)窗口，比如各个桌面都有一个Word，选中任一个之后四指同向向下，可以把各个桌面的word都显示出来），
四指合起来可以显示Launched里面的各个App，四指分开可以显示桌面......

-----------------------------------------------------------------------------------------------------------

##### mac idea: key is invalid:

https://www.cnblogs.com/zxtceq/p/13167732.html

https://www.jiweichengzhu.com/article/e1b6f944b88347d7a2bdac56bc6681d9

```yaml
#0.0.0.0 account.jetbrains.com
0.0.0.0 https://account.jetbrains.com:443
127.0.0.1       activate.navicat.com
```

##### jrebel:

https://github.com/ilanyu/ReverseProxy

https://github.com/ilanyu/ReverseProxy/releases/tag/v1.4

```yaml
#--- idea jrebel account
http://127.0.0.1:8756/511bd7e8-4fae-43a5-b596-16516c0bfaa8
airson_yu@163.com

#--- windows jrebel server
@echo off

echo.
echo ------ step2 init jrebel ------
cd /d D:\jar_dependency\jrebel
ReverseProxy_windows_amd64.exe -l "0.0.0.0:8756"

#--- idea vm options
#-javaagent:D:\jar_dependency\idea\jetbrains-agent.jar
#-javaagent:C:\Users\Public\.jetbrains\jetbrains-agent-v3.1.3.0cd4.033
#-javaagent:C:\Users\Public\.jetbrains\jetbrains-agent-v3.2.0.de72.619
-javaagent:C:\Users\Public\.jetbrains\jetbrains-agent-v3.2.0.de72.619

#jrebel的server可以试试能不能部署到云服务器上，这样就不用本地启Server了
firewall-cmd --add-port=8756/tcp --zone=public --permanent
firewall-cmd --reload
nohup /usr/local/lh/jrebel/ReverseProxy_linux_amd64 -l "0.0.0.0:8756" > /home/nohup_jrebel.log 2>&1 &

#成功: http://175.24.103.167:8756/511bd7e8-4fae-43a5-b596-16516c0bfaa8
#--- final idea jrebel account
http://175.24.103.167:8756/511bd7e8-4fae-43a5-b596-16516c0bfaa8
airson_yu@163.com
```



##### 2020年金钱可以买到的6种最佳Mac键盘（经过手工比较和测试）: https://wpjian.com/tips/2019121828742.html

##### Homebrew常规使用教程：https://www.jianshu.com/p/d7013f24f342

##### Mac OS下安装配置mysql8.0：https://www.jianshu.com/p/fd84d9ae14c1

网盘上：Navicat for MySQL 12.1.19 [MacSKY].dmg

ssh: brew cask install royal-tsx

##### 在Mac上使用Royal TSX: https://guozh.net/macos-shell-royal-tsx-item2-ssh-ftp/

##### 编程相关推荐，很不错：https://www.zhihu.com/question/27617980/answer/919642075

##### trojan：

https://github.com/trojan-tutor/Trojan-Qt5
https://github.com/trojan-tutor/trojan-tutor.github.io
https://trojan-tutor.github.io/2019/04/10/p41.html#more

##### trojan mac客户端配置教程：https://hijk.pp.ua/trojan-mac-client-config-tutorial/



##### macos 鼠标滚轮设置：

https://sspai.com/post/40596

https://www.jianshu.com/p/2fdd2e147fd0

1、首先打开左上角全局菜单中的“偏好设置”

2、然后在偏好设置中找到“鼠标”点击进去

3、最后在“鼠标”设置中把“滚动方向：自然”前面的勾去掉就和windows中一样了。



##### 软件市场：

https://www.macw.com/list/7_0_1.html

https://www.macwk.com/soft/development/p1?cid=39,16,40



[Navicat Premium](https://www.navicat.com.cn/products/navicat-premium/)：https://www.navicat.com.cn/download/navicat-premium

**Navicat 15 keygen for Mac 安装教程**：https://www.52pojie.cn/thread-1101529-1-1.html

##### Navicat 15 keygen for Mac 安装教程：https://www.7i5.com/1226.html



##### Mac上安装程序ZIP软件：

从软件官网或其他渠道获得 .dmg 或 .zip。然后：

- 双击 .dmg，将里面的 .app 拖进应用程序目录。
- 双击 .dmg，双击里面的 .pkg 安装文件按指示安装。这种多见于大型软件。
- 打开 .zip，将里面的 .app 拖进应用程序目录。



[Mac App Store](https://www.apple.com/cn/macos/) ： Thor    （设定快捷键，快速在应用之间切换。）

```shell
#zsh + Oh My Zsh: https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```



##### 程序员用 Mac 都有哪些必备的 app？: https://www.zhihu.com/question/20036899/answer/89884433



