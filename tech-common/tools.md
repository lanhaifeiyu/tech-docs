#### 自动化交互工具 expect ：

##### [Linux expect 介绍和用法](https://www.cnblogs.com/saneri/p/10819348.html) : https://www.cnblogs.com/saneri/p/10819348.html

##### mac下的expect安装和使用: https://www.jianshu.com/p/e56a9bdca581

```shell
brew install expect  # yum install -y expect

## git_tag.sh
echo "\n---- 请输入TAG名称:（请确保已经PULL最新远程代码，本地代码都已经PUSH）----"
read TAG_NAME

echo "\n---- tag name: ${TAG_NAME} ----"

function push_tag
{
   echo "\n---- add tag for $1 ----"
   git tag ${TAG_NAME}
   /xxx/git_push_tag_pswd.exp
}

cd /xxx/zom-www-common
push_tag "zom-www-common"

## git_push_tag_pswd.exp

#!/usr/bin/expect

set PASSWORD_TIP "xxxx@xxxxx's password:";
set PASSWORD "xxxxxxx\r";

##push tag
spawn git push origin --tags
expect ${PASSWORD_TIP}
send ${PASSWORD}
expect eof
```

