## 安全相关之权限配置 /etc/sudoers

1. ##### 为普通用户设置部分root权限

   - 修改/etc/sudoers文件权限

     ```shell
     chmod u+w /etc/sudoers  #（/etc/sudoers默认只有读权限，需要先开放写权限）
     ```

   - 添加所需要运行的用户，并配置需要开放的权限

     ```shell
     vim /etc/sudoers
     #找到如下行：
     root ALL=(ALL) ALL
     #在其下面添加： 
     #airson add
     lh      ALL=(ALL)       NOPASSWD: /bin/systemctl restart tomcat.service
     ```

   - 恢复/etc/sudoers文件权限

     ```shell
     chmod 440 /etc/sudoers
     ```

     

2. ##### /etc/sudoers详解

   ```shell
   #参考 https://www.chengzi520.com/?p=1845
   ```

   

3. ##### TODO













1. 添加所需要运行的用户
2. 修改/etc/sudoers文件权限

```shell
#http://zhmgz.lofter.com/post/90909_aab67c8
#https://www.chengzi520.com/?p=1845

#1.修改/etc/sudoers文件权限
chmod u+w /etc/sudoers
root    ALL=(ALL)       ALL
#airson add
lh      ALL=(ALL)       NOPASSWD: /bin/systemctl restart tomcat.service
```

