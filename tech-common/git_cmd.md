[常用Git命令手册](https://juejin.im/post/5a4de5d8f265da432c2444b9)

[Git远程操作详解](https://www.ruanyifeng.com/blog/2014/06/git_remote.html)

常用命令：

```shell
#查看命令帮助文档
git help -a
git help -g
git help push

#查看当前状态，未添加，已修改，未提交等
git status

#取回所有分支的更新
git fetch

#PULL分支代码 注意：当前分支也会执行merge操作，所以最好切换到对应分支再做pull
git pull origin multizone_release:multizone_release
git pull origin multizone_common_base:multizone_common_base
git pull origin large_zone_capacity:large_zone_capacity
git pull origin large_zone_release:large_zone_release

git checkout multizone_release && git pull
git checkout multizone_common_base && git pull
git checkout large_zone_capacity && git pull
git checkout large_zone_release && git pull

#添加所有未追踪的文件
git add -A
git add --all
git add -i #交互式添加，回车为确认

#commit代码
git commit -m "commit message"

#切换分支
git checkout multizone_release
git checkout large_zone_release
git checkout tmp_safecheck

#创建分支
git branch new_branch
git push --set-upstream origin new_branch

#删除分支
git branch -r -d origin/branch-name
#删除分支-远端
git push origin :branch-name

#PUSH分支
git push

#创建标签
git checkout tmp_zone_large_safecheck && git tag R08.00.70-ZLU
git checkout tmp_safecheck && git tag R04.05.70
#删除标签
git tag -d xxx
#删除标签-远端
git push origin :refs/tags/标签名
git push origin :refs/tags/R08.03.107-ZLU-hotfix
git push origin --delete tag R08.03.107-ZLU-hotfix
git push origin --delete refs/tags/${tagname}

#PUSH标签
git push origin --tags
git push origin --tags -f

#IDEA中把多次commit合并成一次和覆盖上一次Commit
#https://blog.csdn.net/huangjhai/article/details/109557946
#需要注意的是只在自己的开发分支做这样的操作，需要在 push 的时候，选择 force push，不然后续不管是merger还是rebase服务器始终会覆盖本地，造成失败。

# 修改已经提交的记录的 author
git commit --amend --author="虞荣华 <yuronghua@sensorsdata.cn>"
```

