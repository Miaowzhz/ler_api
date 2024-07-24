/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : lerapi

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 11/05/2024 15:42:28
*/
-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
use lerapi;
-- 接口表
CREATE TABLE IF NOT EXISTS lerapi.interface_info
(
    `id`             BIGINT                                                         NOT NULL AUTO_INCREMENT COMMENT '主键' PRIMARY KEY,
    `name`           VARCHAR(255)                                                   NOT NULL COMMENT '名称',
    `description`    VARCHAR(255)                                                   NULL COMMENT '描述',
    `url`            VARCHAR(512)                                                   NOT NULL COMMENT '接口地址',
    `requestParams`  TEXT                                                           NULL COMMENT '请求参数',
    `requestHeader`  TEXT                                                           NULL COMMENT '请求头',
    `responseHeader` TEXT                                                           NULL COMMENT '响应头',
    `status`         INT                                                            NOT NULL DEFAULT 0 COMMENT '接口状态（0 - 关闭，1 - 开启）',
    `method`         VARCHAR(255)                                                   NOT NULL COMMENT '请求类型',
    `userId`         BIGINT                                                         NOT NULL COMMENT '创建人',
    `createTime`     DATETIME DEFAULT CURRENT_TIMESTAMP                             NOT NULL COMMENT '创建时间',
    `updateTime`     DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    `isDelete`       TINYINT  DEFAULT 0                                             NOT NULL COMMENT '是否删除'
) COMMENT '接口信息';


INSERT INTO lerapi.interface_info (`name`, `description`, `url`, `requestHeader`, `responseHeader`, `status`, `method`,
                                   `userId`)
VALUES ('接口1', '这是接口1的描述', 'http://example.com/api/1', '{"Content-Type": "application/json"}',
        '{"Content-Type": "application/json"}', 1, 'GET', 1),
       ('接口2', '这是接口2的描述', 'http://example.com/api/2', '{"Content-Type": "application/json"}',
        '{"Content-Type": "application/json"}', 1, 'POST', 2),
       ('接口3', '这是接口3的描述', 'http://example.com/api/3', '{"Content-Type": "application/json"}',
        '{"Content-Type": "application/json"}', 0, 'GET', 3)

-- 用户调用接口关系表
CREATE TABLE IF NOT EXISTS lerapi.user_interface_info
(
    `id`              BIGINT                                                         NOT NULL AUTO_INCREMENT COMMENT '主键' PRIMARY KEY,
    `userId`          BIGINT                                                         NOT NULL COMMENT '调用用户 id',
    `interfaceInfoId` BIGINT                                                         NOT NULL COMMENT '接口 id',
    `totalNum`        INT      DEFAULT 0                                             NOT NULL COMMENT '总调用次数',
    `leftNum`         INT      DEFAULT 0                                             NOT NULL COMMENT '剩余调用次数',
    `status`          INT                                                            NOT NULL DEFAULT 0 COMMENT '0 - 正常，1 - 禁用）',
    `createTime`      DATETIME DEFAULT CURRENT_TIMESTAMP                             NOT NULL COMMENT '创建时间',
    `updateTime`      DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '更新时间',
    `isDelete`        TINYINT  DEFAULT 0                                             not null comment '是否删除（0-未删，1-已删）'
) COMMENT '用户调用接口关系';