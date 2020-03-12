[常用Git命令手册](https://juejin.im/post/5a4de5d8f265da432c2444b9)

[Git远程操作详解](https://www.ruanyifeng.com/blog/2014/06/git_remote.html)

常用命令：

```shell
#查看命令帮助文档
git help -a
git help -g
git help push

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

#commit代码
git commit -m "commit message"

#切换分支
git checkout multizone_release
git checkout large_zone_release
git checkout tmp_safecheck

#创建分支
git branch new_branch
git push --set-upstream origin new_branch

#PUSH分支
git push

#创建标签
git checkout tmp_zone_large_safecheck && git tag R08.00.70-ZLU
git checkout tmp_safecheck && git tag R04.05.70
#删除标签
git tag -d xxx

#PUSH标签
git push origin --tags
git push origin --tags -f

```

