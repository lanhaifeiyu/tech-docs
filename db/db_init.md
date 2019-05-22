# 数据库创建
Version 8.0.16

## Create DataBase

```mysql
CREATE DATABASE
IF
	NOT EXISTS tech_share DEFAULT CHARACTER 
	SET utf8 COLLATE utf8_general_ci;
```


<!--备注：COLLATE(排序):_ci结尾表示大小写不敏感（caseinsensitive）,_cs表示大小写敏感（case sensitive）,_bin表示二进制的比较（binary）-->


## Create Table

-- ===============================================

-- Server:	182.61.49.180
 
-- Database:	tech_share
 
-- DataTable: category
 
-- Author:    wangaimin	
 
-- CreateDate:	2019-05-22

-- Description:	分类表
 
-- ================================================

```mysql
CREATE TABLE
IF
	NOT EXISTS tech_share.category (
		`id` INT NOT NULL AUTO_INCREMENT COMMENT '系统编号',
		`parent_id` INT NOT NULL COMMENT '父节点系统编号',
		`category_name` VARCHAR ( 50 ) NULL COMMENT '分类名称',
		`priority` TINYINT NOT NULL COMMENT '排序优先级',
		`status` TINYINT NOT NULL COMMENT '状态',
		`in_user_id` BIGINT NOT NULL COMMENT '创建用户id',
		`in_user_name` VARCHAR ( 64 ) NOT NULL COMMENT '创建用户名',
		`in_date` DATETIME ( 3 ) NOT NULL DEFAULT CURRENT_TIMESTAMP ( 3 ) COMMENT '创建时间',
		`edit_user_id` BIGINT NOT NULL COMMENT '编辑用户id',
		`edit_user_name` VARCHAR ( 64 ) NOT NULL COMMENT '编辑用户名',
		`edit_date` DATETIME ( 3 ) NOT NULL DEFAULT CURRENT_TIMESTAMP ( 3 ) COMMENT '编辑时间',
		PRIMARY KEY ( `id` ) 
	) COMMENT = '分类表';
CREATE INDEX `idx_parent_id` ON tech_share.category ( `parent_id` );
CREATE INDEX `idx_priority` ON tech_share.category ( `priority` );


```


