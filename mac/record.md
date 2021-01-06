brew更新升级

```shell
brew update && brew upgrade
brew doctor
brew config

git -C "/usr/local/Homebrew" remote set-url origin https://github.com/Homebrew/brew
git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core" remote set-url origin https://github.com/Homebrew/homebrew-core
```

#### mac下chrome浏览器无法访问自签HTTPS证书的问题：

https://blog.csdn.net/zhangshuyx/article/details/105702108
https://segmentfault.com/a/1190000021843971
https://www.cnblogs.com/snandy/p/3262661.html

##### 实际验证有效的方法：

##### **问题描述：**
macOS Chrome无法访问自签名https页面，以往版本可以选择跳过，继续访问，但是新版本Chrome不允许继续，并显示ERR_CERT_INVALID；
**解决办法：**
在Chrome该页面上，直接键盘敲入这11个字符：**thisisunsafe；注意不是地址栏，而是页面内直接输入。** 



