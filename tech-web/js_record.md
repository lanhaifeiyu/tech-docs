### JS RECORD

##### JS date 时区问题：https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Date

js new Date()，时区问题，有时会相关8个小时

比如：

```javascript
let date = new Date().toISOString();
let date = new Date().toUTCString();
console.log(date);
```

应该使用：

```javascript
//https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString
let date = new Date().toLocaleString();
let date = new Date().toLocaleString('zh-CN', {timeZone: 'Asia/Shanghai', hour12: false});
console.log(date);
```



##### [JavaScript 浮点数运算的精度问题](https://www.html.cn/archives/7340)



#### Js如何调用本地应用程序：

##### Js如何调用本地应用程序：https://blog.csdn.net/jiaowo_ccc/article/details/78792657

##### js调用本地exe程序的两种方式：https://blog.csdn.net/longzhoufeng/article/details/78778708

运行window，输入regedit打开注册表。 在HKEY_CLASSES_ROOT下面建一个自己起的名字的表。：Computer\HKEY_CLASSES_ROOT\QQGameProtocol