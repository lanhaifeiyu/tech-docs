[常用Git命令手册](https://juejin.im/post/5a4de5d8f265da432c2444b9)

##### GitHub官方帮助文档：https://docs.github.com/en/github



#### 设置SSH

1. 生成公钥

   `ssh-keygen -t rsa -b 4096`

2. 显示并复制公钥

   `cat /root/.ssh/id_rsa.pub`

3. 复制公钥到https://github.com/settings/keys



###### Edit systemwide gitconfig：

```
[http]
	sslCAInfo = D:/Git/mingw64/ssl/certs/ca-bundle.crt
	sslBackend = openssl
[diff "astextplain"]
	textconv = astextplain
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[credential]
	#helper = manager
	helper = cache --timeout 5
[core]
	editor = 'D:\\Notepad++\\notepad++.exe' -multiInst -notabbar -nosession -noPlugin
```

主要是设置保存密码

```
https://www.cnblogs.com/volnet/p/git-credentials.html
https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%87%AD%E8%AF%81%E5%AD%98%E5%82%A8
helper = manager
helper = cache --timeout 5
#或者直接删除helper
```



#### 自建GIT服务器

https://www.cnblogs.com/guitu18/p/12817272.html

```shell
# https://gitea.io/zh-cn/
# 创建工作目录 
mkdir -p /usr/local/gitea && cd /usr/local/gitea 
wget -O gitea https://dl.gitea.io/gitea/1.12.3/gitea-1.12.3-linux-amd64 && chmod +x gitea
```

