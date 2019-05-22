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

