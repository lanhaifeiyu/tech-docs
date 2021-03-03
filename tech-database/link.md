##### 第10章字符集，排序规则，Unicode：http://www.deituicms.com/mysql8cn/cn/charset.html

https://www.rednn.com/createsite/202003/26108.html
https://www.lifesailor.me/archives/2676.html

##### java.sql.SQLException: Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_0900_.

https://www.jianshu.com/p/5741e21581ed

```mysql
SELECT * FROM information_schema.CHARACTER_SETS;
show character set;
```

<!--备注：COLLATE(核验、排序):_ci结尾表示大小写不敏感（case insensitive）,_cs表示大小写敏感（case  sensitive）,_bin表示二进制的比较（binary）
utf8mb4_0900_ai_ci: _ai:accent insenstive, _as:accent sensitive accent:口音，音调-->

<!--utf8mb4_unicode_ci 是基于标准的Unicode来排序和比较，能够在各种语言之间精确排序；
    utf8mb4_general_ci 没有实现Unicode排序规则，在遇到某些特殊语言或字符是，排序结果可能不是所期望的。utf8mb4_general_ci 在比较和排序的时候更快
utf8mb4_unicode_ci 在特殊情况下，Unicode排序规则为了能够处理特殊字符的情况，实现了略微复杂的排序算法。但是在绝大多数情况下，不会发生此类复杂比较。为了Emojis一类手机端表情图片使用unicode排序没有必要。-->

**表10.1校对案例/重音敏感度后缀**

| 后缀   | 含义         |
| ------ | ------------ |
| `_ai`  | 口音不敏感   |
| `_as`  | 口音敏感     |
| `_ci`  | 不区分大小写 |
| `_cs`  | 区分大小写   |
| `_ks`  | 假名敏感     |
| `_bin` | 二进制       |

