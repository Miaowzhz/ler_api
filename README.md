## 项目介绍

API 接口调用平台，用户可以注册登录，开通调用权限。用户可以使用接口，并且每次调用会进行统计。管理员可以发布接口、下线接口、接入接口，以及可视化接口的调用情况、数据

## 架构图

![](https://cdn.nlark.com/yuque/0/2024/jpeg/40918944/1716890504426-d2ab9d0a-a308-41e9-b041-1a20271fe6c7.jpeg)

## 技术栈

### 前端

Ant Design Pro
React
Ant Design Procomponents
Umi
Umi Request（Axios 的封装）

### 后端

Java + Spring Boot
Spring Boot Starter（SDK 开发）
API网关
## 统计调用次数

### 需求：

用户每次调用接口成功，次数加一

### 业务流程：

1、用户调用接口
2、数据库，调用次数加一

### 设计库表：

用户 <-> 接口
多对多

```sql
CREATE TABLE IF NOT EXISTS lerapi.user_interface_info
(
   `id`             BIGINT  NOT NULL AUTO_INCREMENT COMMENT '主键' PRIMARY KEY,
   `userId`         BIGINT  NOT NULL COMMENT '调用用户 id',
   `interfaceInfoId`    BIGINT  NOT NULL COMMENT '接口 id',
   `totalNum`      INT DEFAULT 0 NOT NULL COMMENT '总调用次数',      
   `leftNum`       INT DEFAULT 0 NOT NULL COMMENT '剩余调用次数',       
   `status`         INT    NOT NULL DEFAULT 0 COMMENT '0 - 正常，1 - 禁用）',
   `createTime`     DATETIME DEFAULT CURRENT_TIMESTAMP  NOT NULL COMMENT '创建时间',
   `updateTime`     DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
   `isDelete`       TINYINT  DEFAULT 0 not null comment '是否删除（0-未删，1-已删）'   
) COMMENT '用户调用接口关系';

```

### 流程：

1、开发基本的增删改查功能
2、统计调用次数
问题：每次调用方法后，需要添加调用次数加一的代码
解决：
AOP切面：优点：独立于接口，分离出来。缺点：只存在于单个项目中，其他人开发自己的接口时，也需要写一个切面

![](https://cdn.nlark.com/yuque/0/2024/jpeg/40918944/1716193963144-ae264649-1566-45a7-adcf-cb7f66f66949.jpeg)
