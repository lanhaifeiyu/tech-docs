# 数据库创建
Version 8.0.16

## Create DataBase

```mysql
CREATE DATABASE TechShareMgt DEFAULT CHARACTER 
SET utf8 COLLATE utf8_general_ci;
```


<!--备注：COLLATE(排序):_ci结尾表示大小写不敏感（caseinsensitive）,_cs表示大小写敏感（case sensitive）,_bin表示二进制的比较（binary）-->


## Create Table

/*===================================================================
Server:	182.61.49.180	
Database:	TechShareMgt
DataTable: Category
Author:		Gene	
CeateDate:	2019-05-22
Version:	1.0
Description:	分类表
=====================================================================*/

```mysql
create table TechShareMgt.Category(
     `SysNo` INT  NOT NULL  AUTO_INCREMENT  COMMENT'系统编号',
     `Parent_SysNo` INT  NOT NULL  COMMENT'父节点系统编号',
     `Category_Name` VARCHAR(50)  NULL  COMMENT'分类名称',
     `Priority` TINYINT  NOT NULL  COMMENT'排序优先级',
     `Status` TINYINT  NOT NULL  COMMENT'状态',
     `InUserSysNo` INT  NOT NULL  COMMENT'创建者系统编号',
     `InUserName` VARCHAR(40)  NOT NULL  COMMENT'创建者显示名',
     `InDate` DATETIME  NOT NULL  DEFAULT NOW()  COMMENT'创建时间',
     `EditUserSysNo` INT  NOT NULL  COMMENT'最后修改人系统编号',
     `EditUserName` VARCHAR(40)  NOT NULL  COMMENT'最后修改人显示名',
     `EditDate` DATETIME  NOT NULL  DEFAULT NOW()  COMMENT'最后修改时间'
     ,PRIMARY KEY (`SysNo`)

) AUTO_INCREMENT=1 COMMENT='分类表';

alter table TechShareMgt.Category add index IX_Status(`Status`);
alter table TechShareMgt.Category add index IX_Parent_SysNo(`Parent_SysNo`);
alter table TechShareMgt.Category add index IX_Priority(`Priority`);


```


