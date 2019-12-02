原 https://blog.csdn.net/vitaminc4/article/details/76566720

# Linux 快速删除已输入的命令

2017年08月02日 09:13:03 [DreamLee0625](https://me.csdn.net/vitaminc4) 阅读数 17561



 版权声明：本文为博主原创文章，转载请注明出处。 https://blog.csdn.net/vitaminc4/article/details/76566720

Q: 
有时候调用历史命令，都是很长的那种，然后发现并不是自己想要的，需要重新输入，如何快速删除已有/已输入的命令/内容？ 
或者说， 
比如我输入了 `# ps -aux | grep yum`，这个命令还没执行，现在我不想用这个命令了，如果快速删除已输入的内容，也就是`# ps -aux | grep yum`？

A: 
直接按Ctrl + c

------

附上一些其他较长使用的快捷键：

ctrl + w —往回删除一个单词，光标放在最末尾 
ctrl + k —往前删除到末尾，光标放在最前面（可以使用ctrl+a） 
ctrl + u 删除光标以前的字符 
ctrl + k 删除光标以后的字符 
ctrl + a 移动光标至的字符头 
ctrl + e 移动光标至的字符尾 
ctrl + l 清屏