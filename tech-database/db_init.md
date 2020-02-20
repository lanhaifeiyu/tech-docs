# 数据库创建
Version 8.0.16

## Create DataBase

```mysql
CREATE DATABASE IF NOT EXISTS tech_share DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

<!--备注：COLLATE(排序):_ci结尾表示大小写不敏感（caseinsensitive）,_cs表示大小写敏感（case sensitive）,_bin表示二进制的比较（binary）-->

<!--utf8mb4_unicode_ci 是基于标准的Unicode来排序和比较，能够在各种语言之间精确排序；
    utf8mb4_general_ci 没有实现Unicode排序规则，在遇到某些特殊语言或字符是，排序结果可能不是所期望的。utf8mb4_general_ci 在比较和排序的时候更快
utf8mb4_unicode_ci 在特殊情况下，Unicode排序规则为了能够处理特殊字符的情况，实现了略微复杂的排序算法。但是在绝大多数情况下，不会发生此类复杂比较。为了Emojis一类手机端表情图片使用unicode排序没有必要。-->


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
		`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系统编号',
		`parent_id` BIGINT UNSIGNED NOT NULL COMMENT '父节点系统编号',
		`category_name` VARCHAR ( 50 ) NULL COMMENT '分类名称',
		`priority` SMALLINT UNSIGNED NOT NULL COMMENT '排序优先级',
		`status` TINYINT  UNSIGNED NOT NULL COMMENT '状态',
		`create_user_id` BIGINT UNSIGNED NOT NULL COMMENT '创建用户id',
		`create_user_name` VARCHAR ( 64 ) NOT NULL COMMENT '创建用户名',
		`create_date` DATETIME ( 3 ) NOT NULL DEFAULT CURRENT_TIMESTAMP ( 3 ) COMMENT '创建时间',
		`edit_user_id` BIGINT UNSIGNED NOT NULL COMMENT '编辑用户id',
		`edit_user_name` VARCHAR ( 64 ) NOT NULL COMMENT '编辑用户名',
		`edit_date` DATETIME ( 3 ) NOT NULL DEFAULT CURRENT_TIMESTAMP ( 3 ) COMMENT '编辑时间',
		PRIMARY KEY ( `id` ) 
	) COMMENT = '分类表';
CREATE INDEX `idx_parent_id` ON tech_share.category ( `parent_id` );
CREATE INDEX `idx_priority` ON tech_share.category ( `priority` );


```


