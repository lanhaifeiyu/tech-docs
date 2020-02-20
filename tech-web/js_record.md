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

