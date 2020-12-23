##### [Mybatis批量更新三种方式](https://segmentfault.com/a/1190000018084851): https://segmentfault.com/a/1190000018084851

```
<update id="updateBatch"  parameterType="java.util.List">  
    <foreach collection="list" item="item" index="index" open="" close="" separator=";">
        update tableName
        <set>
            name=${item.name},
            name2=${item.name2}
        </set>
        where id = ${item.id}
    </foreach>      
</update>
```

但Mybatis映射文件中的sql语句默认是不支持以" ; " 结尾的，也就是不支持多条sql语句的执行。所以需要在连接mysql的url上加 &allowMultiQueries=true 这个才可以执行。