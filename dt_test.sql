/*
 Navicat Premium Data Transfer

 Source Server         : 6
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : frp.feifeilong.work:3306
 Source Schema         : dt_test

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 07/06/2023 11:36:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for common_demo
-- ----------------------------
DROP TABLE IF EXISTS `common_demo`;
CREATE TABLE `common_demo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of common_demo
-- ----------------------------
BEGIN;
INSERT INTO `common_demo` VALUES (3, '李六', '备注', '2022-01-11 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for common_tdemo
-- ----------------------------
DROP TABLE IF EXISTS `common_tdemo`;
CREATE TABLE `common_tdemo` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '路面名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '层数',
  `code` varchar(50) DEFAULT NULL COMMENT '路面材料',
  `classify` decimal(50,0) DEFAULT '0' COMMENT '弹性模量',
  `remark` decimal(50,2) DEFAULT '0.00' COMMENT '泊松比',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '父级id',
  `order_by` decimal(50,2) DEFAULT '0.00' COMMENT '厚度',
  `status` varchar(8) DEFAULT NULL COMMENT '状态',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='测试案例表';

-- ----------------------------
-- Records of common_tdemo
-- ----------------------------
BEGIN;
INSERT INTO `common_tdemo` VALUES ('060beef563b64738b0a6932bfe10a0dd', '1', '第2层', '2', 'AC20', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.07, '0', '2023-04-11 17:20:53', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-29 23:48:08');
INSERT INTO `common_tdemo` VALUES ('0a31322b441144038ca58abb3d5138d9', '2', '111', '1', 'AC13', 0, 18000.00, 'cedb875c654d4629b2f62e0aff501f86', 0.23, '0', '2023-05-30 00:00:48', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-30 00:03:46');
INSERT INTO `common_tdemo` VALUES ('0d657162cb964f5996042bf28a06071b', '1', 'STR3', 'STR3', NULL, 0, 0.00, '1', 0.00, '0', '2023-04-16 00:57:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('1f62ea8172af42c2973501de0ec68004', '2', '4444', '4', 'GB', 2333, 0.62, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('267d250d737441ab8717f3e4424d881b', '2', '5555', '5', 'GB', 2333, 0.22, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('29a7431e2afe451586e57fe355de0611', '2', '2222', '2', 'AC20', 2333, 0.23, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('2a7e1f842eac49429227b095fa095cd1', '2', '底基层', '3', 'CBG25', 233, 0.23, 'de7a5e8231314c8897d321d38e68bf08', 0.00, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 17:06:01');
INSERT INTO `common_tdemo` VALUES ('3d27dd4f1e04492f915749dfa8dc7d60', '1', '第4层', '4', 'CS', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.27, '0', '2023-04-11 16:53:52', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-29 23:48:08');
INSERT INTO `common_tdemo` VALUES ('437500317fc14ac9bcdeccccd6e03075', '1', 'STR4', 'STR4', NULL, 0, 0.00, '1', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('643f17d262be49d18391221f868ab143', '2', '中间层', '2', 'CBG25', 2333, 0.23, 'de7a5e8231314c8897d321d38e68bf08', 0.11, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 00:42:14');
INSERT INTO `common_tdemo` VALUES ('77fbbc105765468e95cb8aa1323f57fc', '2', '222', '2', 'CBG25', 234, 0.22, '0d657162cb964f5996042bf28a06071b', 0.22, '0', '2023-04-16 00:57:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('8af1bc4fbfca435182bf46eef98ceb0e', '1', '第3层', '3', 'AC25', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.19, '0', '2023-04-11 17:22:15', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-29 23:48:08');
INSERT INTO `common_tdemo` VALUES ('95a938de46ec41abb600c64c080dc83d', '2', '333', '3', 'GB', 0, 18000.00, 'cedb875c654d4629b2f62e0aff501f86', 0.27, '0', '2023-05-30 00:00:48', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-30 00:03:46');
INSERT INTO `common_tdemo` VALUES ('b1e00c0a172a4015a5c948b6593af64b', '2', '面层', '1', 'AC20', 213, 0.23, 'de7a5e8231314c8897d321d38e68bf08', 0.22, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 00:42:14');
INSERT INTO `common_tdemo` VALUES ('b517be01d6584cfb908d0c49c8d2996e', '1', 'STR1', 'STR1', '', 0, 0.00, '1', 0.00, '0', '2022-03-24 21:12:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 10:49:54');
INSERT INTO `common_tdemo` VALUES ('cd6c7325710a4854a279cf9c54b44446', '1', '第5层', '5', 'GB', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.31, '0', '2023-04-11 16:54:20', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-29 23:48:08');
INSERT INTO `common_tdemo` VALUES ('cedb875c654d4629b2f62e0aff501f86', '1', 'STR11', 'STR11', NULL, 0, 0.00, '1', 0.00, '0', '2023-05-30 00:00:48', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('db35a2b8e2fa4aeba8e476527101fcba', '1', '第1层', '1', 'AC13', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.05, '0', '2023-04-11 15:46:31', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-29 23:48:08');
INSERT INTO `common_tdemo` VALUES ('de7a5e8231314c8897d321d38e68bf08', '1', 'STR2', 'STR2', NULL, 0, 0.00, '1', 0.00, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('dec755731f3d4b2cb14eed607366377c', '2', '444', '4', 'CS', 0, 18000.00, 'cedb875c654d4629b2f62e0aff501f86', 0.23, '0', '2023-05-30 00:00:48', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-30 00:03:46');
INSERT INTO `common_tdemo` VALUES ('f5a5a8dd38734b7882121ad3bdafbf68', '2', '111', '1', 'AC25', 213, 0.11, '0d657162cb964f5996042bf28a06071b', 0.11, '0', '2023-04-16 00:57:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('fc43ffebcee34221854df56d4207b37f', '1', '第6层', '6', 'CBG25', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.33, '0', '2023-04-13 22:42:22', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-29 23:48:08');
INSERT INTO `common_tdemo` VALUES ('feffd611cd8546709e8fbc1488da1c8e', '2', '222', '2', 'AC20', 0, 18000.00, 'cedb875c654d4629b2f62e0aff501f86', 0.11, '0', '2023-05-30 00:00:48', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-30 00:03:46');
COMMIT;

-- ----------------------------
-- Table structure for common_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `common_uploadfile`;
CREATE TABLE `common_uploadfile` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL COMMENT '主键id',
  `name` varchar(50) DEFAULT NULL COMMENT '附件名称',
  `desnames` varchar(50) DEFAULT NULL COMMENT '附件描述',
  `file_path` varchar(1200) DEFAULT NULL COMMENT '路径',
  `file_type` varchar(8) DEFAULT NULL COMMENT '附件类型',
  `file_size` varchar(8) DEFAULT NULL COMMENT '附件大小',
  `obj_id` varchar(50) DEFAULT NULL COMMENT '对象id',
  `child_obj_id` varchar(50) DEFAULT NULL COMMENT '子对象id',
  `file_suffix` varchar(50) DEFAULT NULL COMMENT '附件后缀',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公共附件表';

-- ----------------------------
-- Records of common_uploadfile
-- ----------------------------
BEGIN;
INSERT INTO `common_uploadfile` VALUES ('12a08e73d7194071852bab499b868c7c', '微信图片_20211129213512.png', '微信图片_20211129213512.png', 'common/2022-03-13/2022031316092095491914.png', 'png', '267733', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:09:21', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('2c97b025c9fe41c1824b19eb71d75cac', '微信图片_20211129215131.png', '微信图片_20211129215131.png', 'common/2022-03-13/2022031316303386632452.png', 'png', '355967', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:30:33', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('3bca3337789c4325960791c64841609f', 'chuancheng.png', 'chuancheng.png', 'common/2022-03-13/2022031316265935554993.png', 'png', '112534', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:26:59', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('4ec9fbf39f1d42ea879c7c9c411d9599', '微信图片_20211129213512.png', '微信图片_20211129213512.png', 'common/2022-03-13/2022031316251423930837.png', 'png', '267733', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:25:14', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('4ee8ed80d0ab46e2888c8c76dd192526', '微信图片_20211129215300.png', '微信图片_20211129215300.png', 'common/2022-03-13/2022031316361778711775.png', 'png', '290548', '4f398c282e9c46ba9eb509f87578c8af', NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:36:17', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2022-03-13 16:36:21');
INSERT INTO `common_uploadfile` VALUES ('5a006262381147b099929e0e62c1af25', '微信图片_20211129215300.png', '微信图片_20211129215300.png', 'common/2022-03-13/2022031315550072915951.png', 'png', '290548', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 15:55:00', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('5d082dc1bec84aed86832c6ac6888898', '微信图片_20211129215300.png', '微信图片_20211129215300.png', 'common/2022-03-13/2022031316534911048129.png', 'png', '290548', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:53:49', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('5e1d9b0bb78049baaf42cdc9f547a26a', '微信图片_20211129215300.png', '微信图片_20211129215300.png', 'common/2022-03-13/2022031316183556684589.png', 'png', '290548', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:18:35', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('6c5c988ea4e94c398d273d30053cfd15', '微信图片_20211129213013.png', '微信图片_20211129213013.png', 'common/2022-03-13/2022031316295474944682.png', 'png', '230059', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:29:54', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('718b54fe854844cf840c5b7413df5e92', '微信图片_20211129213512.png', '微信图片_20211129213512.png', 'common/2022-03-13/2022031316123381116686.png', 'png', '267733', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:12:33', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('99a9f7e2ebb94fe6b9f7206cc00393a2', '微信图片_20211129214724.png', '微信图片_20211129214724.png', 'common/2022-03-13/2022031316573038920133.png', 'png', '211720', '8acaccef6d834cdea02e17a0741d0bee', NULL, '.png', 'userAvatar', NULL, NULL, '2022-03-13 16:57:30', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2022-03-13 16:57:48');
INSERT INTO `common_uploadfile` VALUES ('a5421063f8984f408d234588d977e3aa', '3.jpg', '3.jpg', 'common/2022-03-13/2022031316271663589352.jpg', 'jpg', '73359', NULL, NULL, '.jpg', NULL, NULL, NULL, '2022-03-13 16:27:16', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('a5af168bc62a4c028086011406ebd232', '微信图片_20211129215300.png', '微信图片_20211129215300.png', 'common/2022-03-13/2022031316260469424090.png', 'png', '290548', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:26:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('acc71c9f2dc043f78cc3e0757cd7a54f', '微信图片_20211129213512.png', '微信图片_20211129213512.png', 'common/2022-03-13/2022031315590380341807.png', 'png', '267733', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 15:59:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('c72804df9fd0474fb69fe1d51c26ad02', 'chuancheng.png', 'chuancheng.png', 'common/2022-03-13/2022031315535895051284.png', 'png', '112534', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 15:53:58', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('c76a279efe064c9b8f2036f4254bcd59', '微信图片_20211129213512.png', '微信图片_20211129213512.png', 'common/2022-03-13/2022031316301979159950.png', 'png', '267733', NULL, NULL, '.png', NULL, NULL, NULL, '2022-03-13 16:30:19', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('ec107b16e5f04731ad7e0e210b13a5ad', '3.jpg', '3.jpg', 'common/2022-03-13/2022031315584141791899.jpg', 'jpg', '73359', NULL, NULL, '.jpg', NULL, NULL, NULL, '2022-03-13 15:58:41', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('f1714762f37146a7b9273bb16dd4ff5f', '微信图片_20220106215648.png', '微信图片_20220106215648.png', 'common/2022-03-25/2022032523155745041325.png', 'png', '2134793', NULL, NULL, '.png', 'remark', NULL, NULL, '2022-03-25 23:15:57', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_uploadfile` VALUES ('f17eb77d433c47b69c8e50764b644890', '微信图片_20220106215403.png', '微信图片_20220106215403.png', 'common/2022-03-25/2022032523180054892486.png', 'png', '491906', NULL, NULL, '.png', 'remark', NULL, NULL, '2022-03-25 23:18:00', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger1', '1', '0/5 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger12', '367bc284f13c4316922c494d9bb1fab9', '0/2 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger2323', '2', '0/5 * * * * ? *', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('Qingfeng_Cloud_Scheduler', '1', '1', '1', 'com.qingfeng.quartz.job.MessageJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('Qingfeng_Cloud_Scheduler', '12', '367bc284f13c4316922c494d9bb1fab9', '1#12', 'com.qingfeng.quartz.job.MessageJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('Qingfeng_Cloud_Scheduler', '2323', '2', '2', 'com.qingfeng.quartz.job.MessageJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('Qingfeng_Cloud_Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('Qingfeng_Cloud_Scheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('QuartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('QuartzScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('Qingfeng_Cloud_Scheduler', 'cicideiMac.lan1685437359568', 1685437697237, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('QuartzScheduler', 'cicideiMac.lan1685437358423', 1685437682181, 20000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger1', '1', '1', '1', NULL, 1647701970000, 1647701965000, 5, 'PAUSED', 'CRON', 1647701308000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger12', '367bc284f13c4316922c494d9bb1fab9', '12', '367bc284f13c4316922c494d9bb1fab9', NULL, 1647706108000, 1647706106000, 5, 'PAUSED', 'CRON', 1647705979000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger2323', '2', '2323', '2', NULL, 1647704745000, 1647704740000, 5, 'PAUSED', 'CRON', 1647703779000, 0, NULL, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for quartz_bustask
-- ----------------------------
DROP TABLE IF EXISTS `quartz_bustask`;
CREATE TABLE `quartz_bustask` (
  `id` varchar(50) DEFAULT NULL COMMENT '主键id',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `job_name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(50) DEFAULT NULL COMMENT '任务分组',
  `description` varchar(50) DEFAULT NULL COMMENT '任务描述',
  `notice_user` varchar(5000) DEFAULT NULL COMMENT '通知人',
  `job_class_name` varchar(120) DEFAULT NULL COMMENT '执行类',
  `cron_expression` varchar(50) DEFAULT NULL COMMENT '执行表达式',
  `trigger_time` varchar(50) DEFAULT NULL COMMENT '执行时间',
  `trigger_state` varchar(8) DEFAULT NULL COMMENT '执行状态',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时业务表';

-- ----------------------------
-- Records of quartz_bustask
-- ----------------------------
BEGIN;
INSERT INTO `quartz_bustask` VALUES ('a9ed6639899d4ef897e1ace678a51c7e', NULL, '12', '367bc284f13c4316922c494d9bb1fab9', '1', '12', 'com.qingfeng.quartz.job.MessageJob', '0/2 * * * * ? *', '2022-03-20 00:08:15', 'N', '1', '1', '2022-03-20 00:04:28', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-20 00:08:27');
COMMIT;

-- ----------------------------
-- Table structure for road_flatness
-- ----------------------------
DROP TABLE IF EXISTS `road_flatness`;
CREATE TABLE `road_flatness` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` int(2) DEFAULT NULL COMMENT '数据类型, 1->平整度, 2->抗滑性能, 3->平均温度, 4->轴次对数, 5->轴次, 6->车辙深度, 7->FWD弯沉盆, 8->T路表, 9->T大气',
  `name` varchar(50) DEFAULT NULL COMMENT '周期名称',
  `value` decimal(50,2) DEFAULT NULL COMMENT '类型值',
  `pid` varchar(50) DEFAULT NULL COMMENT '所属路面id',
  `pid_name` varchar(50) DEFAULT NULL COMMENT '所属路面名称',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=777 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of road_flatness
-- ----------------------------
BEGIN;
INSERT INTO `road_flatness` VALUES (00000000408, 1, 'N73', 2.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000409, 1, 'N74', 1.96, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000410, 1, 'N75', 1.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000411, 1, 'N76', 1.94, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000412, 1, 'N77', 1.89, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000413, 1, 'N78-', 1.68, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000414, 1, 'N78', 1.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000415, 1, 'N79-', 1.93, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000416, 1, 'N79', 1.97, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000417, 1, 'N80-', 1.96, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000418, 1, 'N80', 2.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000419, 1, 'N81-', 1.96, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000420, 1, 'N81', 2.01, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000421, 1, 'N82-', 1.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000422, 1, 'N82', 2.07, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000423, 1, 'N83-', 2.05, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000424, 1, 'N83', 2.07, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000425, 1, 'N84-', 1.96, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000426, 1, 'N84', 1.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000427, 1, 'N85-', 1.95, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000428, 1, 'N85', 1.95, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000429, 1, 'N86-', 1.95, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000430, 1, 'N86', 2.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000431, 1, 'N87-', 1.94, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000432, 1, 'N87', 1.90, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000433, 1, 'N88-', 1.90, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000434, 1, 'N88', 1.91, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000435, 1, 'N89-', 1.91, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000436, 1, 'N89', 1.91, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000437, 1, 'N90-', 1.89, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000438, 1, 'N90', 1.87, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000439, 1, 'N91-', 1.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000440, 1, 'N91', 1.91, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000441, 1, 'N92-', 1.92, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000442, 1, 'N92', 1.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000443, 1, 'N93-', 1.91, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000444, 1, 'N93', 1.97, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000445, 1, 'N94-', 1.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000446, 1, 'N94', 1.92, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000447, 2, 'N73', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000448, 2, 'N74', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000449, 2, 'N75', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000450, 2, 'N76', 0.84, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000451, 2, 'N77', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000452, 2, 'N78-', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000453, 2, 'N78', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000454, 2, 'N79-', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000455, 2, 'N79', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000456, 2, 'N80-', 0.84, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000457, 2, 'N80', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000458, 2, 'N81-', 0.80, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000459, 2, 'N81', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000460, 2, 'N82-', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000461, 2, 'N82', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000462, 2, 'N83-', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000463, 2, 'N83', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000464, 2, 'N84-', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000465, 2, 'N84', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000466, 2, 'N85-', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000467, 2, 'N85', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000468, 2, 'N86-', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000469, 2, 'N86', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000470, 2, 'N87-', 0.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000471, 2, 'N87', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000472, 2, 'N88-', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000473, 2, 'N88', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000474, 2, 'N89-', 0.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000475, 2, 'N89', 0.84, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000476, 2, 'N90-', 0.84, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000477, 2, 'N90', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000478, 2, 'N91-', 0.86, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000479, 2, 'N91', 0.85, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000480, 2, 'N92-', 0.86, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000481, 2, 'N92', 0.85, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000482, 2, 'N93-', 0.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000483, 2, 'N93', 0.87, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000484, 2, 'N94-', 0.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000485, 2, 'N94', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000486, 3, 'N73', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000487, 3, 'N74', 0.14, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000488, 3, 'N75', 14.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000489, 3, 'N76', 18.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000490, 3, 'N77', 18.34, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000491, 3, 'N78-', 23.23, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000492, 3, 'N78', 18.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000493, 3, 'N79-', 22.08, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000494, 3, 'N79', 24.46, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000495, 3, 'N80-', 27.04, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000496, 3, 'N80', 29.71, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000497, 3, 'N81-', 31.70, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000498, 3, 'N81', 29.01, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000499, 3, 'N82-', 28.52, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000500, 3, 'N82', 28.86, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000501, 3, 'N83-', 26.71, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000502, 3, 'N83', 30.03, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000503, 3, 'N84-', 30.58, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000504, 3, 'N84', 30.77, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000505, 3, 'N85-', 25.75, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000506, 3, 'N85', 26.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000507, 3, 'N86-', 27.32, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000508, 3, 'N86', 27.47, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000509, 3, 'N87-', 23.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000510, 3, 'N87', 23.74, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000511, 3, 'N88-', 18.39, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000512, 3, 'N88', 17.72, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000513, 3, 'N89-', 15.08, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000514, 3, 'N89', 15.30, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000515, 3, 'N90-', 13.42, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000516, 3, 'N90', 12.15, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000517, 3, 'N91-', 3.52, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000518, 3, 'N91', 2.35, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000519, 3, 'N92-', -0.40, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000520, 3, 'N92', -0.23, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000521, 3, 'N93-', -3.03, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000522, 3, 'N93', -3.84, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000523, 3, 'N94-', 1.44, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000524, 3, 'N94', 0.21, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000525, 4, 'N73', 7.36, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000526, 4, 'N74', 7.38, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000527, 4, 'N75', 7.40, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000528, 4, 'N76', 7.42, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000529, 4, 'N77', 7.43, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000530, 4, 'N78-', 7.44, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000531, 4, 'N78', 7.44, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000532, 4, 'N79-', 7.45, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000533, 4, 'N79', 7.46, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000534, 4, 'N80-', 7.46, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000535, 4, 'N80', 7.47, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000536, 4, 'N81-', 7.48, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000537, 4, 'N81', 7.48, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000538, 4, 'N82-', 7.48, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000539, 4, 'N82', 7.49, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000540, 4, 'N83-', 7.50, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000541, 4, 'N83', 7.50, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000542, 4, 'N84-', 7.51, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000543, 4, 'N84', 7.51, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000544, 4, 'N85-', 7.52, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000545, 4, 'N85', 7.52, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000546, 4, 'N86-', 7.52, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000547, 4, 'N86', 7.53, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000548, 4, 'N87-', 7.54, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000549, 4, 'N87', 7.54, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000550, 4, 'N88-', 7.54, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000551, 4, 'N88', 7.55, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000552, 4, 'N89-', 7.55, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000553, 4, 'N89', 7.56, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000554, 4, 'N90-', 7.56, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000555, 4, 'N90', 7.57, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000556, 4, 'N91-', 7.58, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000557, 4, 'N91', 7.58, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000558, 4, 'N92-', 7.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000559, 4, 'N92', 7.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000560, 4, 'N93-', 7.60, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000561, 4, 'N93', 7.61, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000562, 4, 'N94-', 7.61, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000563, 4, 'N94', 7.62, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000564, 5, 'N73', 22903081.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000565, 5, 'N74', 23957490.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000566, 5, 'N75', 25006377.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000567, 5, 'N76', 26046953.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000568, 5, 'N77', 27084898.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000569, 5, 'N78-', 27565644.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000570, 5, 'N78', 27825357.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000571, 5, 'N79-', 28235346.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000572, 5, 'N79', 28565262.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000573, 5, 'N80-', 28995652.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000574, 5, 'N80', 29310344.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000575, 5, 'N81-', 29867563.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000576, 5, 'N81', 30061447.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000577, 5, 'N82-', 30397695.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000578, 5, 'N82', 30814056.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000579, 5, 'N83-', 31281097.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000580, 5, 'N83', 31568347.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000581, 5, 'N84-', 32122462.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000582, 5, 'N84', 32325565.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000583, 5, 'N85-', 32748369.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000584, 5, 'N85', 33077420.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000585, 5, 'N86-', 33443681.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000586, 5, 'N86', 33829146.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000587, 5, 'N87-', 34316065.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000588, 5, 'N87', 34578819.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000589, 5, 'N88-', 34950409.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000590, 5, 'N88', 35333623.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000591, 5, 'N89-', 35773172.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000592, 5, 'N89', 36074361.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000593, 5, 'N90-', 36583164.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000594, 5, 'N90', 37138781.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000595, 5, 'N91-', 37675167.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000596, 5, 'N91', 38217128.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000597, 5, 'N92-', 38746004.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000598, 5, 'N92', 39289663.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000599, 5, 'N93-', 39801532.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000600, 5, 'N93', 40371377.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000601, 5, 'N94-', 40901122.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000602, 5, 'N94', 41442589.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000603, 6, 'N73', 46.95, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000604, 6, 'N74', 45.32, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000605, 6, 'N75', 48.30, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000606, 6, 'N76', 49.19, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000607, 6, 'N77', 51.04, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000608, 6, 'N78-', 48.72, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000609, 6, 'N78', 49.71, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000610, 6, 'N79-', 51.20, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000611, 6, 'N79', 49.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000612, 6, 'N80-', 52.28, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000613, 6, 'N80', 52.36, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000614, 6, 'N81-', 51.02, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000615, 6, 'N81', 53.05, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000616, 6, 'N82-', 52.28, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000617, 6, 'N82', 54.63, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000618, 6, 'N83-', 56.93, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000619, 6, 'N83', 53.90, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000620, 6, 'N84-', 56.20, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000621, 6, 'N84', 53.04, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000622, 6, 'N85-', 54.89, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000623, 6, 'N85', 55.90, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000624, 6, 'N86-', 56.01, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000625, 6, 'N86', 57.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000626, 6, 'N87-', 57.20, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000627, 6, 'N87', 54.18, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000628, 6, 'N88-', 53.25, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000629, 6, 'N88', 55.05, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000630, 6, 'N89-', 52.77, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000631, 6, 'N89', 61.31, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000632, 6, 'N90-', 52.60, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000633, 6, 'N90', 53.55, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000634, 6, 'N91-', 52.27, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000635, 6, 'N91', 50.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000636, 6, 'N92-', 51.66, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000637, 6, 'N92', 52.47, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000638, 6, 'N93-', 50.31, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000639, 6, 'N93', 49.83, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000640, 6, 'N94-', 51.61, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000641, 6, 'N94', 51.53, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000642, 7, 'N54', 4.63, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000643, 7, 'N55', 5.55, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000644, 7, 'N55-2', 5.05, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000645, 7, 'N56', 5.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000646, 7, 'N57', 5.28, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000647, 7, 'N58', 5.77, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000648, 7, 'N59', 5.99, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000649, 7, 'N60', 5.60, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000650, 7, 'N61', 6.04, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000651, 7, 'N62', 5.60, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000652, 7, 'N63', 6.50, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000653, 7, 'N64', 7.16, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000654, 7, 'N65-1', 6.29, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000655, 7, 'N65-2', 7.40, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000656, 7, 'N66', 5.99, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000657, 7, 'N67', 6.67, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000658, 7, 'N68', 6.14, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000659, 7, 'N69', 5.87, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000660, 7, 'N70', 5.79, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000661, 7, 'N71', 5.34, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000662, 7, 'N72', 5.50, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000663, 7, 'N73', 5.37, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000664, 7, 'N74', 5.24, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000665, 7, 'N74-2', 4.97, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000666, 7, 'N74-3', 5.36, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000667, 7, 'N75', 6.15, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000668, 7, 'N76', 6.47, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000669, 7, 'N77', 6.24, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000670, 7, 'N78', 6.39, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000671, 7, 'N79', 6.72, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000672, 7, 'N80', 7.27, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000673, 7, 'N81', 6.85, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000674, 7, 'N82', 6.96, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000675, 7, 'N83', 6.94, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000676, 7, 'N84', 8.60, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000677, 7, 'N85', 7.51, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000678, 7, 'N86', 7.37, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000679, 7, 'N87', 5.52, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000680, 7, 'N88', 5.77, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000681, 7, 'N89', 5.69, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000682, 7, 'N90', 4.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000683, 7, 'N91', 5.61, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000684, 7, 'N92', 5.40, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000685, 7, 'N93', 4.16, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000686, 7, 'N94', 4.70, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000687, 8, 'N54', 5.07, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000688, 8, 'N55', -1.08, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000689, 8, 'N55-2', 9.16, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000690, 8, 'N56', 18.11, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000691, 8, 'N57', 33.87, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000692, 8, 'N58', 24.07, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000693, 8, 'N59', 32.77, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000694, 8, 'N60', 39.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000695, 8, 'N61', 19.51, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000696, 8, 'N62', 39.88, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000697, 8, 'N63', 26.87, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000698, 8, 'N64', 29.81, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000699, 8, 'N65-1', 37.72, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000700, 8, 'N65-2', 43.56, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000701, 8, 'N66', 36.33, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000702, 8, 'N67', 41.94, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000703, 8, 'N68', 31.41, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000704, 8, 'N69', 26.12, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000705, 8, 'N70', 25.31, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000706, 8, 'N71', 14.87, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000707, 8, 'N72', 8.06, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000708, 8, 'N73', 1.13, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000709, 8, 'N74', 1.16, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000710, 8, 'N74-2', 8.43, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000711, 8, 'N74-3', 16.07, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000712, 8, 'N75', 30.53, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000713, 8, 'N76', 26.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000714, 8, 'N77', 18.41, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000715, 8, 'N78', 26.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000716, 8, 'N79', 35.02, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000717, 8, 'N80', 37.39, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000718, 8, 'N81', 24.77, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000719, 8, 'N82', 37.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000720, 8, 'N83', 31.53, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000721, 8, 'N84', 40.25, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000722, 8, 'N85', 28.18, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000723, 8, 'N86', 48.48, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000724, 8, 'N87', 24.37, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000725, 8, 'N88', 29.70, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000726, 8, 'N89', 23.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000727, 8, 'N90', 14.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000728, 8, 'N91', -1.43, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000729, 8, 'N92', 2.18, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000730, 8, 'N93', 2.69, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000731, 8, 'N94', -1.17, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000732, 9, 'N54', -4.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000733, 9, 'N55', 2.02, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000734, 9, 'N55-2', 10.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000735, 9, 'N56', 10.19, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000736, 9, 'N57', 24.19, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000737, 9, 'N58', 16.59, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000738, 9, 'N59', 22.02, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000739, 9, 'N60', 26.46, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000740, 9, 'N61', 20.75, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000741, 9, 'N62', 26.46, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000742, 9, 'N63', 28.40, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000743, 9, 'N64', 29.15, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000744, 9, 'N65-1', 30.97, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000745, 9, 'N65-2', 32.31, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000746, 9, 'N66', 25.34, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000747, 9, 'N67', 27.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000748, 9, 'N68', 19.79, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000749, 9, 'N69', 10.61, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000750, 9, 'N70', 8.56, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000751, 9, 'N71', 7.42, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000752, 9, 'N72', 4.44, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000753, 9, 'N73', 1.76, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000754, 9, 'N74', 2.98, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000755, 9, 'N74-2', 8.35, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000756, 9, 'N74-3', 12.37, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000757, 9, 'N75', 18.95, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000758, 9, 'N76', 19.73, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000759, 9, 'N77', 16.68, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000760, 9, 'N78', 21.20, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000761, 9, 'N79', 22.68, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000762, 9, 'N80', 29.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000763, 9, 'N81', 24.16, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000764, 9, 'N82', 27.01, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000765, 9, 'N83', 23.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000766, 9, 'N84', 35.13, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000767, 9, 'N85', 26.69, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000768, 9, 'N86', 33.73, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000769, 9, 'N87', 21.58, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000770, 9, 'N88', 22.23, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000771, 9, 'N89', 18.19, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000772, 9, 'N90', 12.25, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000773, 9, 'N91', 0.82, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000774, 9, 'N92', 7.07, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000775, 9, 'N93', -6.27, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
INSERT INTO `road_flatness` VALUES (00000000776, 9, 'N94', 2.73, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', NULL);
COMMIT;

-- ----------------------------
-- Table structure for road_structure
-- ----------------------------
DROP TABLE IF EXISTS `road_structure`;
CREATE TABLE `road_structure` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `value` decimal(50,2) DEFAULT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `pid_name` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of road_structure
-- ----------------------------
BEGIN;
INSERT INTO `road_structure` VALUES (00000000001, 'AC13-65(SBS)', 4.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', '2023-04-18 17:07:02');
INSERT INTO `road_structure` VALUES (00000000002, 'AC20(AH30#)', 8.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', '2023-04-18 17:07:04');
INSERT INTO `road_structure` VALUES (00000000003, 'CBG25-1', 20.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', '2023-04-18 17:07:07');
INSERT INTO `road_structure` VALUES (00000000004, 'CBG25-1', 20.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', '2023-04-18 17:07:08');
INSERT INTO `road_structure` VALUES (00000000005, 'CS', 20.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', '2023-04-18 17:07:10');
INSERT INTO `road_structure` VALUES (00000000006, 'CS', 20.00, 'b517be01d6584cfb908d0c49c8d2996e', 'STR1', '2023-04-18 17:07:11');
INSERT INTO `road_structure` VALUES (00000000007, 'AC13-65(SBS)', 4.00, 'de7a5e8231314c8897d321d38e68bf08', 'STR2', '2023-04-18 17:07:18');
INSERT INTO `road_structure` VALUES (00000000008, 'AC20(AH30#)', 8.00, 'de7a5e8231314c8897d321d38e68bf08', 'STR2', '2023-04-18 17:07:18');
INSERT INTO `road_structure` VALUES (00000000009, 'CBG25-1', 20.00, 'de7a5e8231314c8897d321d38e68bf08', 'STR2', '2023-04-18 17:07:18');
INSERT INTO `road_structure` VALUES (00000000010, 'CBG25-1', 20.00, 'de7a5e8231314c8897d321d38e68bf08', 'STR2', '2023-04-18 17:07:18');
INSERT INTO `road_structure` VALUES (00000000011, 'CS', 20.00, 'de7a5e8231314c8897d321d38e68bf08', 'STR2', '2023-04-18 17:07:18');
INSERT INTO `road_structure` VALUES (00000000012, 'AC13-70(SBS)', 4.00, '0d657162cb964f5996042bf28a06071b', 'STR3', '2023-04-18 17:07:29');
INSERT INTO `road_structure` VALUES (00000000013, 'AC20(AH30#)', 6.00, '0d657162cb964f5996042bf28a06071b', 'STR3', '2023-04-18 17:07:29');
INSERT INTO `road_structure` VALUES (00000000014, 'AC10(SBS)', 2.00, '0d657162cb964f5996042bf28a06071b', 'STR3', '2023-04-18 17:07:29');
INSERT INTO `road_structure` VALUES (00000000015, 'LCC', 24.00, '0d657162cb964f5996042bf28a06071b', 'STR3', '2023-04-18 17:07:29');
INSERT INTO `road_structure` VALUES (00000000016, 'CBG25-1', 20.00, '0d657162cb964f5996042bf28a06071b', 'STR3', '2023-04-18 17:07:29');
INSERT INTO `road_structure` VALUES (00000000017, 'GB', 20.00, '0d657162cb964f5996042bf28a06071b', 'STR3', '2023-04-18 17:07:29');
COMMIT;

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `dic_cascade` text COMMENT '级联字段',
  `name` varchar(50) NOT NULL COMMENT '字典名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '字典简称',
  `code` varchar(50) DEFAULT NULL COMMENT '字典编码',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) DEFAULT NULL COMMENT '等级',
  `status` varchar(8) DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典管理';

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `system_dictionary` VALUES ('09242d181b884c05b4bc52ac78436a95', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_09242d181b884c05b4bc52ac78436a95_', '水泥稳定级配碎石', 'CBG25', 'CBG25', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '6', NULL, '2023-04-13 22:41:38', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_dictionary` VALUES ('1422ec33af5f41208fc39cd0d2858c08', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_', '路面材料', '路面材料', 'lmcl', '1', '1', '0', '1', NULL, '2022-03-24 20:40:46', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 14:48:46');
INSERT INTO `system_dictionary` VALUES ('6254f019801d40be89adc3b3d3944bf3', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_6254f019801d40be89adc3b3d3944bf3_', '级配碎石', 'GB', 'GB', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '4', NULL, '2023-04-11 15:02:11', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_dictionary` VALUES ('8188c21484684ffb8eb76481634a9e4f', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_8188c21484684ffb8eb76481634a9e4f_', 'AC20沥青混合料', 'AC20', 'AC20', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '2', NULL, '2022-03-24 20:42:28', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 15:00:57');
INSERT INTO `system_dictionary` VALUES ('c0305cfb39534575a270b008b2313d48', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_c0305cfb39534575a270b008b2313d48_', 'AC25沥青混合料', 'AC25', 'AC25', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '3', NULL, '2022-03-24 20:42:08', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 15:00:28');
INSERT INTO `system_dictionary` VALUES ('cadf553c3e744f0382bf3cdcc86533d0', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_cadf553c3e744f0382bf3cdcc86533d0_', 'AC13沥青混合料', 'AC13', 'AC13', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '1', NULL, '2022-03-24 20:41:02', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 15:01:10');
INSERT INTO `system_dictionary` VALUES ('f502e704d10647d1a8a172e0a5285310', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_f502e704d10647d1a8a172e0a5285310_', '水泥稳定土', 'CS', 'CS', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '5', NULL, '2023-04-11 15:02:29', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_genfield
-- ----------------------------
DROP TABLE IF EXISTS `system_genfield`;
CREATE TABLE `system_genfield` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `table_id` varchar(50) DEFAULT NULL COMMENT '主表id',
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `field_comment` varchar(50) DEFAULT NULL COMMENT '字段描述',
  `field_type` varchar(50) DEFAULT NULL COMMENT '字段类型',
  `field_operat` varchar(8) DEFAULT NULL COMMENT '是否添加编辑',
  `field_list` varchar(8) DEFAULT NULL COMMENT '是否列表展示',
  `field_query` varchar(8) DEFAULT NULL COMMENT '是否查询展示',
  `query_type` varchar(8) DEFAULT NULL COMMENT '查询方式',
  `verify_rule` varchar(50) DEFAULT NULL COMMENT '校验规则',
  `show_type` varchar(8) DEFAULT NULL COMMENT '显示类型',
  `option_content` varchar(1200) DEFAULT NULL COMMENT '选项内容',
  `default_value` varchar(50) DEFAULT NULL COMMENT '默认值',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成字段表';

-- ----------------------------
-- Records of system_genfield
-- ----------------------------
BEGIN;
INSERT INTO `system_genfield` VALUES ('002a39bf7fa942acbdece2c62a901231', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'type', '类型', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '2', 'varchar(8)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('06832d55f4974e5199cc1c6c9fb0950f', '0', '3f5655e79f004f0b821d7937a2e756ba', 'name', '', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '2', 'varchar(255)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('0bcaa8ee3c584eb0897a24397c73db68', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'code', '字典编码', 'varchar', 'Y', 'Y', 'N', 'like', '', '3', 'flxx', NULL, '5', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('0c609a2263654bd3a8ff31c6190907f2', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'notice_user', '通知人', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '6', 'varchar(5000)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('0ca08d76f54c44049102f631617197fe', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'type', '类型', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '2', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('0ff72078f910440faaede1965a37f8ed', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'parent_id', '父级id', 'varchar', 'Y', 'N', 'N', '', '', '4', '0/北京;1/上海;2/深圳', NULL, '6', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('148d1dae218c46539cb93e1095035a11', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'create_user', '创建人', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '14', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('19c37a973b14416c8662397f8957477b', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'trigger_state', '执行状态', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '10', 'varchar(8)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('1df298de32e944c7809769328626657a', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'order_by', '排序', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '11', 'varchar(8)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('1f26481496ad4697b07a0b99d79916f2', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'child_obj_id', '子对象id', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '8', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('20b167a1b744425bb166797f58b2d9e9', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'obj_id', '对象id', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '7', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('2e9d5406b3794d40830da6974a3cc253', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'name', '字典名称', 'varchar', 'Y', 'Y', 'Y', 'like', 'required', '1', NULL, NULL, '3', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('2ebe95013d434428a4c8a1273b6eb5ce', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'cron_expression', '执行表达式', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '8', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('2f5be7ad7da84eebacc7106e560ceb34', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'name', '附件名称', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '2', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('30d83d30b9eb4243b38286aeb9eabc4e', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'create_organize', '创建组织', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '15', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('38dce31912d54856aecabea6a1c61233', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'id', '主键id', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '1', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('3a3380054487456b85bb727385dfc020', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'id', '主键id', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '1', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('3fc6603fa2014ea79e97924f9e2f8816', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'id', '主键id', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '1', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('469a644ccb1f47d3a7ae94571a9229b7', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'remark', '备注', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '12', 'varchar(500)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('48814d772e004d2fb656622af7c72d13', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'create_user', '创建人', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '14', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('53bc40d5434f4449be1b50afa9476e8e', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'job_name', '任务名称', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '3', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('6ddb1bb274dc4af99ca1bc52d5036470', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'file_suffix', '附件后缀', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '9', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('7438a03014564103ab4a8d6039d0a647', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'create_organize', '创建组织', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '15', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('75672eedd4ab40b2b48d9feb944f0ad4', '0', '3f5655e79f004f0b821d7937a2e756ba', 'remark', '', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '3', 'varchar(255)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('760e9d30303d458db6767ad2b398662d', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'update_user', '修改人', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '16', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('8071f47584e04c358f7b923ba6a82350', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'file_type', '附件类型', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '5', 'varchar(8)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('8072b851860f41a08aeb20124cfe2dca', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'trigger_time', '执行时间', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '9', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('81443b2e5f8b4a58b2f8f9f484dccc47', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'create_time', '创建时间', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '11', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('892a272e64dc4e5b80ad1d1c97c7689d', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'job_group', '任务分组', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '4', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('8c7bd82061e346019f348f5a869001bf', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'create_organize', '创建组织', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '13', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('92fa68c426dd43419c92fcdd1c720243', '0', '3f5655e79f004f0b821d7937a2e756ba', 'id', '', 'int', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '1', 'int', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('9548f0687f624476846864f6550b4a80', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'file_size', '附件大小', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '6', 'varchar(8)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('a200812236d14a66a92d23ab9891c4c9', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'status', '状态', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '7', 'varchar(8)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('a4a998431eb2464b9dbe349b63c7c9b3', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'update_time', '修改时间', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '15', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('ab08878d88d641228430a804193213b3', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'description', '任务描述', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '5', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('b117c9bf63e64e3499502317a0f98425', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'order_by', '排序', 'varchar', 'Y', 'Y', 'N', '', '', '5', '0/北京;1/上海;2/深圳', NULL, '9', 'varchar(8)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('b5997136c6d541789ad1fd68afeacdae', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'file_path', '路径', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '4', 'varchar(1200)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('b722b6520fd74a3c833d7062f5ebd284', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'job_class_name', '执行类', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '7', 'varchar(120)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('b74f8f79bed84e38a1a1e51089b22fc6', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'short_name', '字典简称', 'varchar', 'Y', 'Y', 'N', 'like', '', '3', '0/北京;1/上海;2/深圳', NULL, '4', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('caddafa9516240b796ba8b709d9d52d5', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'update_time', '修改时间', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '17', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('d7aa73c3213b4f85bdf3f52f97058e02', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'create_user', '创建人', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '12', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('db420e9091c7470c8182a68dd5fe87f4', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'create_time', '创建时间', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '13', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('ddd996c422344aa6953d682b34f6f527', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'source', '来源', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '10', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('dfb66beba5e54f21a682e778d405517b', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'desnames', '附件描述', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '3', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('e4350ab9672b4385b4c74f028d469e55', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'create_time', '创建时间', 'varchar', 'N', 'N', 'N', '', 'required', '1', NULL, NULL, '13', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('e46b2709ede748e4867be7112bbc0472', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'remark', '备注', 'varchar', 'Y', 'N', 'N', '', '', '8', 'flxx', '1', '10', 'varchar(500)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('e8198c81e8994fc384fc764b198cde7b', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'update_time', '修改时间', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '17', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('e97d0051d69b4c32a03415727dc7f8f7', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'order_by', '排序', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '11', 'varchar(8)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('ebff7603430c477c86a5dccda9a3de1d', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', 'remark', '备注', 'varchar', 'Y', 'Y', 'N', '', '', '1', NULL, NULL, '12', 'varchar(500)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('efe59003b19f4a6b81035eef3f668feb', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'update_user', '修改人', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '14', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('f66db36fcad244e39b1dc07e5e488a48', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'classify', '分类', 'varchar', 'Y', 'Y', 'N', '', '', '4', 'flxx', NULL, '8', 'varchar(50)', '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_genfield` VALUES ('f74d2cba38524365957c2b7a3ade8284', '0', 'f92ef73db5904f47a127dd437f0c16d6', 'update_user', '修改人', 'varchar', 'N', 'N', 'N', '', '', '1', NULL, NULL, '16', 'varchar(50)', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_genfield` VALUES ('fed7cbafed674cbba3ae304c13d83f3a', '0', '3f5655e79f004f0b821d7937a2e756ba', 'create_time', '', 'datetime', 'N', 'N', 'N', '', '', '1', NULL, NULL, '4', 'datetime', '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_gentable
-- ----------------------------
DROP TABLE IF EXISTS `system_gentable`;
CREATE TABLE `system_gentable` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `table_name` varchar(50) DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(50) DEFAULT NULL COMMENT '表描述',
  `temp_type` varchar(50) DEFAULT NULL COMMENT '模板类型',
  `pack_path` varchar(50) DEFAULT NULL COMMENT '生成包路径',
  `mod_name` varchar(50) DEFAULT NULL COMMENT '生成模块名',
  `bus_name` varchar(50) DEFAULT NULL COMMENT '生成业务名',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '功能名称',
  `menu_id` varchar(50) DEFAULT NULL COMMENT '上级菜单id',
  `gen_type` varchar(50) DEFAULT NULL COMMENT '生成方式',
  `gen_path` varchar(1200) DEFAULT NULL,
  `status_type` varchar(50) DEFAULT NULL,
  `tree_id` varchar(50) DEFAULT NULL COMMENT '树表id',
  `tree_pid` varchar(50) DEFAULT NULL COMMENT '树表父级id',
  `tree_name` varchar(50) DEFAULT NULL COMMENT '树表名称',
  `open_process` varchar(50) DEFAULT NULL COMMENT '开启流程',
  `process_key` varchar(50) DEFAULT NULL COMMENT '流程定义key',
  `order_by` varchar(8) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成主表';

-- ----------------------------
-- Records of system_gentable
-- ----------------------------
BEGIN;
INSERT INTO `system_gentable` VALUES ('3f5655e79f004f0b821d7937a2e756ba', '0', 'common_demo', '', '0', 'com.qingfeng', 'common', 'demo', '', NULL, '0', 'C://', '0', '3f5655e79f004f0b821d7937a2e756ba', NULL, NULL, NULL, NULL, '1', NULL, '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_gentable` VALUES ('ed44757f5ecb495b8126b730cc3ba522', '0', 'common_tdemo', '测试案例表', '1', 'com.qingfeng', 'common', 'tdemo', '测试案例表', '945dc8526a164812844f88f9a520590b', '0', 'C://', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'parent_id', 'name', NULL, NULL, '1', NULL, '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_gentable` VALUES ('eeaaaff1b9ce41b9a06c79579d23c892', '0', 'common_uploadfile', '公共附件表', '0', 'com.qingfeng', 'common', 'uploadfile', '公共附件表', NULL, '0', 'C://', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', NULL, NULL, NULL, NULL, '1', NULL, '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_gentable` VALUES ('f92ef73db5904f47a127dd437f0c16d6', '0', 'quartz_bustask', '定时业务表', '0', 'com.qingfeng', 'quartz', 'bustask', '定时业务表', NULL, '0', 'C://', '0', 'f92ef73db5904f47a127dd437f0c16d6', NULL, NULL, NULL, NULL, '1', NULL, '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `path` varchar(120) DEFAULT NULL COMMENT '请求路径',
  `redirect` varchar(120) DEFAULT NULL COMMENT '重定向路径',
  `component` varchar(120) DEFAULT NULL COMMENT '组件',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `keepAlive` varchar(50) DEFAULT NULL COMMENT 'keepAlive',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `permission` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `menu_cascade` text COMMENT '菜单级联',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '父级id',
  `status` varchar(50) DEFAULT NULL COMMENT '状态',
  `level_num` varchar(8) DEFAULT NULL COMMENT '等级',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` VALUES ('02144c3e53704b77b5a2bb846ce139f3', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_02144c3e53704b77b5a2bb846ce139f3_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '7', NULL, '2020-12-30 15:30:11', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('0a7931ffa3c04bacaadfac1838b47a0d', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_0a7931ffa3c04bacaadfac1838b47a0d_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '3', NULL, '2020-12-27 13:05:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('0e6a0155c44341b48e41a664662f41c3', '1', '角色管理', '/system/role', NULL, '/system/role', '角色管理', 'true', 'TrademarkCircleOutlined', 'role', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '3', NULL, '2020-12-27 13:06:44', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:03');
INSERT INTO `system_menu` VALUES ('17b8a177454140079b97602b5496e369', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_17b8a177454140079b97602b5496e369_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '4', NULL, '2020-12-27 13:18:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('1f34120ce93c452dbec4202206bc0b4a', '2', '添加', '/', NULL, '/', '添加', 'true', NULL, 'add', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '1', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('239336ba333e44808aa64169814f7aaa', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_239336ba333e44808aa64169814f7aaa_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '4', NULL, '2020-12-27 13:24:10', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('26fd01c0ebb24a26bd93f2757e18f479', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_26fd01c0ebb24a26bd93f2757e18f479_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '4', NULL, '2020-12-27 13:23:36', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('2f48e9a6dbf64f9ea052868bdb1da286', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_2f48e9a6dbf64f9ea052868bdb1da286_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '7', NULL, '2020-12-30 15:30:21', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('362250de48c947d38f07715d76ae5b4f', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_362250de48c947d38f07715d76ae5b4f_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '3', NULL, '2020-12-27 13:01:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('3ad803ca5e814dffa9f3ec90d2c0b385', '2', '设置组织', '/', NULL, NULL, '设置组织', NULL, NULL, 'resetOrganize', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_3ad803ca5e814dffa9f3ec90d2c0b385_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '6', NULL, '2020-12-28 21:19:49', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('40509619bd82474a860b7e57cf6f7e33', '1', '菜单管理', '/system/menu', NULL, '/system/menu', '菜单管理', 'true', 'MenuOutlined', 'menu', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '5', NULL, '2020-12-27 13:20:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:18');
INSERT INTO `system_menu` VALUES ('480a6e7f4eb3428ea7f02a2f9ede7401', '1', '仿真分析', '/simulation/emulation', NULL, '/simulation/modelAnalysis', '仿真分析', NULL, 'FunctionOutlined', NULL, 'menu_1_480a6e7f4eb3428ea7f02a2f9ede7401_', '1', '0', '1', '2.4', NULL, '2023-04-17 17:00:32', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-18 10:46:10');
INSERT INTO `system_menu` VALUES ('4ceba49ff1f74d149a292f4c741a67f5', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_4ceba49ff1f74d149a292f4c741a67f5_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '4', NULL, '2020-12-27 13:02:18', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('5b8f42cadc944aa4a98641557a8e2a34', '1', '构建模型', '/simulation/build', NULL, '/simulation/modelBuild', '构建模型', NULL, 'ThunderboltOutlined', NULL, 'menu_1_5b8f42cadc944aa4a98641557a8e2a34_', '1', '0', '2', '2.1', NULL, '2023-04-11 00:47:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-12 09:49:26');
INSERT INTO `system_menu` VALUES ('6140f94adc314920b43bc68a2cbe02cb', '1', '首页', '/dashboard/welcome', NULL, '/dashboard/welcome', '首页', NULL, 'AppstoreAddOutlined', '', 'menu_1_6140f94adc314920b43bc68a2cbe02cb_', '1', '0', '1', '1', NULL, '2023-04-10 14:49:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('62078ec10eff4cd0bc2c4a598875c848', '1', '内置Paraview', '/example/iframe', NULL, '/example/iframe', '内置Paraview', 'false', 'GlobalOutlined', NULL, 'menu_1_945dc8526a164812844f88f9a520590b_62078ec10eff4cd0bc2c4a598875c848_', '1', '0', '2', '2.5', NULL, '2020-12-31 00:20:21', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-18 22:12:24');
INSERT INTO `system_menu` VALUES ('6300d120f23149ab91f616e2fa70ab3a', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_6300d120f23149ab91f616e2fa70ab3a_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '2', NULL, '2020-12-27 13:00:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6b4063ed1fad47ee8e25f553aaf2a81e', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_6b4063ed1fad47ee8e25f553aaf2a81e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '2', NULL, '2020-12-27 13:09:16', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6c1ebec221154f38bf4a910cf48da48a', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_6c1ebec221154f38bf4a910cf48da48a_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '6', NULL, '2020-12-30 15:30:35', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6d31c7915084491cb645700792ec9c47', '2', '删除', '/', NULL, '/', '删除', 'true', NULL, 'del', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '3', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('7912c46721bd46f09c4d1a42bb233a52', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_7912c46721bd46f09c4d1a42bb233a52_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '2', NULL, '2020-12-27 13:23:54', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('80d1c5cf67bd4452ad7fb0661206e4b5', '0', '系统管理', '/system', '/system/user', NULL, '系统管理', 'true', 'HomeOutlined', NULL, 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_', '1', '0', '1', '3', '测试', '2020-12-27 12:28:37', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:23:57');
INSERT INTO `system_menu` VALUES ('82bd68fed9934717ad257ba7bf2d91a9', '2', '权限分配', '/', NULL, NULL, '权限分配', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_82bd68fed9934717ad257ba7bf2d91a9_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '7', NULL, '2020-12-28 21:19:59', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('8a3271ffe96b40399dd5bb3478702eda', '2', '详情', '/', NULL, '/', '详情', 'true', NULL, 'info', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '4', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('8f795f7f6d8b43f69ca9ef93aecb0d9d', '2', '编辑', '/', NULL, '/', '编辑', 'true', NULL, 'edit', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '2', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('8fe7e8a690f44d6bac073617efaa345a', '2', '密码重置', '/', NULL, NULL, '密码重置', NULL, NULL, 'resetPwd', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_8fe7e8a690f44d6bac073617efaa345a_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '5', NULL, '2020-12-28 21:19:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('97be74ae0ae342d3ade81d4969a83b1b', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_97be74ae0ae342d3ade81d4969a83b1b_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '1', NULL, '2020-12-27 13:07:41', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('a841c0a4a9014efeae9846a9214dc539', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_a841c0a4a9014efeae9846a9214dc539_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '1', NULL, '2020-12-27 13:23:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('a8b47ec9f9044f9e9c84b4104d5e7fd0', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_a8b47ec9f9044f9e9c84b4104d5e7fd0_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '1', NULL, '2020-12-27 13:23:47', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('a9740546d94f408dabedcc3458de57b5', '1', '仪表盘', '/chart/workplace', NULL, '/dtChart/roadDetail', '仪表盘', NULL, 'ProjectOutlined', NULL, 'menu_1_a9740546d94f408dabedcc3458de57b5_', '1', '0', '1', '1.1', NULL, '2023-04-16 17:15:42', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('ad664530d8df4a3cac9d8f2d07c256da', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_ad664530d8df4a3cac9d8f2d07c256da_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '5', NULL, '2020-12-28 21:30:28', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('ae75a81f9d68414bbb0edb4ea06da6e0', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_ae75a81f9d68414bbb0edb4ea06da6e0_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '3', NULL, '2020-12-27 13:24:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('af1921aee9734911a724341bb50054bc', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_af1921aee9734911a724341bb50054bc_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '2', NULL, '2020-12-27 13:23:15', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('b1f15d18323042498080be61f550234e', '2', '分配权限', '/', NULL, NULL, '分配权限', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_b1f15d18323042498080be61f550234e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '6', NULL, '2020-12-28 21:28:11', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('b93b5970dc4b44b582075726f34646c7', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_b93b5970dc4b44b582075726f34646c7_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '1', NULL, '2020-12-27 12:58:35', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('c39ead786e8a4e5f844ef30a5882d232', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_c39ead786e8a4e5f844ef30a5882d232_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '1', NULL, '2020-12-27 12:52:41', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('cdd48f81527946419d6807c7cfe03ac7', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_cdd48f81527946419d6807c7cfe03ac7_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '2', NULL, '2020-12-27 12:52:56', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('d1ccfade1a1b4a07b68c9865320d7d52', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_d1ccfade1a1b4a07b68c9865320d7d52_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '5', NULL, '2020-12-28 21:27:57', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('d3327d1977d7471d9faef1c75971d778', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_d3327d1977d7471d9faef1c75971d778_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '5', NULL, '2020-12-28 21:35:40', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('d5f7fbba01174e7480a37dcb52ac1867', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_d5f7fbba01174e7480a37dcb52ac1867_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '8', NULL, '2020-12-28 21:20:19', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('d6a49049221a461b8875bfe64c977008', '1', '用户管理', '/system/user', NULL, '/system/user', '用户管理', 'true', 'UserOutlined', 'user', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '1', NULL, '2020-12-27 12:46:13', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:12:42');
INSERT INTO `system_menu` VALUES ('d8fb09bcbd1c4eada6ab0e1b5668ff57', '2', '权限分配', '/', NULL, NULL, '权限分配', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_d8fb09bcbd1c4eada6ab0e1b5668ff57_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '6', NULL, '2020-12-28 21:23:48', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('dc1bbb3d93f0451a839a63b127f164fa', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_dc1bbb3d93f0451a839a63b127f164fa_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '3', NULL, '2020-12-27 13:23:28', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('dcf78e9836d64ea99b6a9e814a66d820', '1', '字典管理', '/system/dictionary', '', '/system/dictionary', '字典管理', 'true', 'ProfileOutlined', 'dictionary', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '4', NULL, '2020-12-27 13:19:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:11');
INSERT INTO `system_menu` VALUES ('e843b5fe9a7e425ca76c2a7c878ab83c', '1', '路面管理', '/simulation/tdemo', NULL, '/example/tdemo', '路面管理', 'true', 'DesktopOutlined', 'tdemo', NULL, '1', '0', NULL, '2.2', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-05-30 17:04:19');
INSERT INTO `system_menu` VALUES ('e893c10f9ff441b4b7481075b1941a41', '1', '组织管理', '/system/organize', '', '/system/organize', '组织管理', 'true', 'TeamOutlined', 'organize', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '2', NULL, '2020-12-27 12:47:25', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:12:53');
INSERT INTO `system_menu` VALUES ('eae7e221e92d4b8d8fa6235cbf269f55', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_eae7e221e92d4b8d8fa6235cbf269f55_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '3', NULL, '2020-12-27 13:18:06', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('eb55f3c2ad834c1f9c49250d1c3b9a4d', '1', '预览模型', '/simulation/tdemo/view', NULL, '/simulation/modelView', '预览模型', NULL, 'FundViewOutlined', NULL, 'menu_1_eb55f3c2ad834c1f9c49250d1c3b9a4d_', '1', '0', '2', '2.3', NULL, '2023-04-12 09:54:55', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 20:32:28');
INSERT INTO `system_menu` VALUES ('f34a435bc0a5489f81749a6b102c3ba5', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_f34a435bc0a5489f81749a6b102c3ba5_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '4', NULL, '2020-12-27 13:05:44', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('f7b434433fed4579a8846a5444ef5d6e', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_f7b434433fed4579a8846a5444ef5d6e_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '5', NULL, '2020-12-28 21:23:34', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('f9ed6e5b12bf4cb9a306c3fc654d64b2', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_f9ed6e5b12bf4cb9a306c3fc654d64b2_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '9', NULL, '2020-12-30 13:39:43', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2020-12-30 13:40:08');
COMMIT;

-- ----------------------------
-- Table structure for system_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_organize`;
CREATE TABLE `system_organize` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `org_cascade` text COMMENT '级联字段',
  `name` varchar(50) NOT NULL COMMENT '组织名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '组织简称',
  `code` varchar(50) DEFAULT NULL COMMENT '组织编码',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) DEFAULT NULL COMMENT '等级',
  `status` varchar(8) DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `depart_leader` varchar(100) DEFAULT NULL,
  `direct_leader` varchar(100) DEFAULT NULL,
  `branch_leader` varchar(100) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_organize
-- ----------------------------
BEGIN;
INSERT INTO `system_organize` VALUES ('367bc284f13c4316922c494d9bb1fab9', '1', 'org367bc284f13c4316922c494d9bb1fab9_', '组织信息', '组织信息', NULL, '1', '1', '0', '1', NULL, NULL, NULL, '', '2020-09-28 10:37:03', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2020-09-28 14:45:19');
INSERT INTO `system_organize` VALUES ('9f7969654fae4d4ca12c71d8a6cbe621', '1', 'org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_', '研发部', '研发部', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '5', NULL, NULL, NULL, '', '2020-09-28 10:37:58', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:25:58');
INSERT INTO `system_organize` VALUES ('a8ccfb355ec748579f8c3a3312e96871', '1', 'org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '人事部', '人事部', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '6', NULL, NULL, NULL, '', '2020-09-28 10:37:58', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:36:05');
COMMIT;

-- ----------------------------
-- Table structure for system_organize_role
-- ----------------------------
DROP TABLE IF EXISTS `system_organize_role`;
CREATE TABLE `system_organize_role` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `organize_id` varchar(50) NOT NULL COMMENT '组织id',
  `role_id` varchar(50) NOT NULL COMMENT '角色id',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_organize_role
-- ----------------------------
BEGIN;
INSERT INTO `system_organize_role` VALUES ('abc74edfe37b44f88abeb21936b1a7a6', 'a8ccfb355ec748579f8c3a3312e96871', 'b845d68a12f34dab88236bd45c8e3f90', '1', '2023-04-18 00:35:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '角色简称',
  `status` varchar(8) DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
BEGIN;
INSERT INTO `system_role` VALUES ('955390c0f7a84b76b2d155a4d44ca6ce', '1', '系统角色', '系统角色', '0', '1', 'admin', '2020-09-23 22:28:13', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:28:01');
INSERT INTO `system_role` VALUES ('b845d68a12f34dab88236bd45c8e3f90', '1', '组织角色', '组织角色', '0', '3', '', '2020-09-28 17:15:06', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2020-12-10 23:26:47');
COMMIT;

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `role_id` varchar(50) NOT NULL COMMENT '角色id',
  `menu_id` varchar(50) NOT NULL COMMENT '菜单id',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_role_menu` VALUES ('07c4a707bbba4f05abe4b0a7bfabedcf', 'b845d68a12f34dab88236bd45c8e3f90', 'c39ead786e8a4e5f844ef30a5882d232', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('08a2be12d19242ecb8e61273d1c6331e', '955390c0f7a84b76b2d155a4d44ca6ce', '17b8a177454140079b97602b5496e369', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('0cf7c204dddd4b339dfe50d9d459dc1e', '955390c0f7a84b76b2d155a4d44ca6ce', 'ae75a81f9d68414bbb0edb4ea06da6e0', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('0f045d2b5efe49e089c4deaad0d94395', '955390c0f7a84b76b2d155a4d44ca6ce', 'dc1bbb3d93f0451a839a63b127f164fa', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('0f5dab605cfd4544a9b68f249f1debc6', '955390c0f7a84b76b2d155a4d44ca6ce', 'f7b434433fed4579a8846a5444ef5d6e', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('0fe6b75c59a74422a0cd179a8ab13ff8', '955390c0f7a84b76b2d155a4d44ca6ce', '6c1ebec221154f38bf4a910cf48da48a', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('1053a87eda0a4740baa98765be39b699', 'b845d68a12f34dab88236bd45c8e3f90', '6140f94adc314920b43bc68a2cbe02cb', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('11e093afe8f34727a0e6560d8165fbcf', '955390c0f7a84b76b2d155a4d44ca6ce', '6b4063ed1fad47ee8e25f553aaf2a81e', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('121f9bb64a5c42f0a4765acd95956d28', 'b845d68a12f34dab88236bd45c8e3f90', 'f34a435bc0a5489f81749a6b102c3ba5', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('14301cbeb2cd4d4d9aa527d40a72733f', '955390c0f7a84b76b2d155a4d44ca6ce', '6140f94adc314920b43bc68a2cbe02cb', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('14f947941bea408889ee7e3c0100a44b', 'b845d68a12f34dab88236bd45c8e3f90', '239336ba333e44808aa64169814f7aaa', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('18c387b72f914c6496687964d250b175', '955390c0f7a84b76b2d155a4d44ca6ce', '40509619bd82474a860b7e57cf6f7e33', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('205ff7e6c8f84e8a8c9cf5aa847f7626', '955390c0f7a84b76b2d155a4d44ca6ce', 'f34a435bc0a5489f81749a6b102c3ba5', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('24f767efcc8542249a2dfb7a15bd0089', 'b845d68a12f34dab88236bd45c8e3f90', 'b1f15d18323042498080be61f550234e', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('25f680c459b843b6978345742da0d1d3', 'b845d68a12f34dab88236bd45c8e3f90', 'd6a49049221a461b8875bfe64c977008', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('2cf7c62bc54345f298b45e038a31645f', '955390c0f7a84b76b2d155a4d44ca6ce', 'dcf78e9836d64ea99b6a9e814a66d820', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('311efe3a1ac84907b883f63ed867e593', '955390c0f7a84b76b2d155a4d44ca6ce', 'a841c0a4a9014efeae9846a9214dc539', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('325800029052492abef4f187e144b18b', '955390c0f7a84b76b2d155a4d44ca6ce', 'd5f7fbba01174e7480a37dcb52ac1867', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('3318efc3d4074262b80710a8e6d493d7', '955390c0f7a84b76b2d155a4d44ca6ce', 'b1f15d18323042498080be61f550234e', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('36c2dc7c104a43a1874752a4951e1360', 'b845d68a12f34dab88236bd45c8e3f90', 'cdd48f81527946419d6807c7cfe03ac7', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('36e1e86080c446b691f4f0042b4b150a', 'b845d68a12f34dab88236bd45c8e3f90', '0a7931ffa3c04bacaadfac1838b47a0d', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('3a3f0243f5124eb5ba9f0f0dfb061814', '955390c0f7a84b76b2d155a4d44ca6ce', 'ad664530d8df4a3cac9d8f2d07c256da', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('3fb893b4e88c41cb8c50e02d308bf5c0', 'b845d68a12f34dab88236bd45c8e3f90', 'ad664530d8df4a3cac9d8f2d07c256da', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4478ba48b01b4ede978a7b848a57c5db', 'b845d68a12f34dab88236bd45c8e3f90', '7912c46721bd46f09c4d1a42bb233a52', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4875fb37a411401fbdcee39ca4e604b0', '955390c0f7a84b76b2d155a4d44ca6ce', 'eae7e221e92d4b8d8fa6235cbf269f55', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('4c2611f1800b45f1bba9e6e7bd0d2a9e', 'b845d68a12f34dab88236bd45c8e3f90', '97be74ae0ae342d3ade81d4969a83b1b', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4c797af525c9446ca9dd74f5efb42843', '955390c0f7a84b76b2d155a4d44ca6ce', 'e893c10f9ff441b4b7481075b1941a41', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('4d7703af92434004bbcff5c7b582515d', '955390c0f7a84b76b2d155a4d44ca6ce', '7912c46721bd46f09c4d1a42bb233a52', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('4da9a94828aa4f5d9efb627429583600', 'b845d68a12f34dab88236bd45c8e3f90', '40509619bd82474a860b7e57cf6f7e33', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4df293942df64aef908055591ef5ea10', 'b845d68a12f34dab88236bd45c8e3f90', '8fe7e8a690f44d6bac073617efaa345a', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4e3bfd175c1a4f259998d3d430047d09', 'b845d68a12f34dab88236bd45c8e3f90', 'f9ed6e5b12bf4cb9a306c3fc654d64b2', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('501792185e954d8383240f561754f2a8', 'b845d68a12f34dab88236bd45c8e3f90', 'f7b434433fed4579a8846a5444ef5d6e', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('53720f0c958440d3aea79df099a1913c', '955390c0f7a84b76b2d155a4d44ca6ce', '82bd68fed9934717ad257ba7bf2d91a9', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('5c4b09f92b3e4f6fa31d20bb7edc9f88', 'b845d68a12f34dab88236bd45c8e3f90', 'e893c10f9ff441b4b7481075b1941a41', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('609af70a3a4448dd98730218b583bdec', '955390c0f7a84b76b2d155a4d44ca6ce', '8f795f7f6d8b43f69ca9ef93aecb0d9d', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('60ea62c6f6864638b6c0e78124fdc567', 'b845d68a12f34dab88236bd45c8e3f90', 'a841c0a4a9014efeae9846a9214dc539', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('60ee34c9398d418a9b6c5d36fdfa4721', 'b845d68a12f34dab88236bd45c8e3f90', '0e6a0155c44341b48e41a664662f41c3', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('63dbbab1cf1d4e57bbe3af9589dd98dd', '955390c0f7a84b76b2d155a4d44ca6ce', 'af1921aee9734911a724341bb50054bc', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('6475a1b46a64418ab40772dfddd835a8', 'b845d68a12f34dab88236bd45c8e3f90', 'b93b5970dc4b44b582075726f34646c7', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('69c7814af034497dabb4ceb895cd1608', 'b845d68a12f34dab88236bd45c8e3f90', '6b4063ed1fad47ee8e25f553aaf2a81e', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('77765b27c9874dfcb8cc7b4a493ace1e', 'b845d68a12f34dab88236bd45c8e3f90', '17b8a177454140079b97602b5496e369', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('77fda4f1844946b3a2e713acce9347ca', 'b845d68a12f34dab88236bd45c8e3f90', '3ad803ca5e814dffa9f3ec90d2c0b385', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('79a4650172b0411993d45c6f3595c512', '955390c0f7a84b76b2d155a4d44ca6ce', '480a6e7f4eb3428ea7f02a2f9ede7401', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('7b458855db5b46309d0660dca351a03e', '955390c0f7a84b76b2d155a4d44ca6ce', 'e843b5fe9a7e425ca76c2a7c878ab83c', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('85166352670a4af390e46c7b4b0e7334', '955390c0f7a84b76b2d155a4d44ca6ce', '97be74ae0ae342d3ade81d4969a83b1b', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('8ff16b6e05364ebfbd9340e27a550d6e', '955390c0f7a84b76b2d155a4d44ca6ce', '3ad803ca5e814dffa9f3ec90d2c0b385', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('9786373ce2cf49a7ad13e8e229d73a91', 'b845d68a12f34dab88236bd45c8e3f90', '362250de48c947d38f07715d76ae5b4f', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('9c31af2247db4d3c8acffe4e9803d58f', '955390c0f7a84b76b2d155a4d44ca6ce', '4ceba49ff1f74d149a292f4c741a67f5', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('9ee18775e7f84f54af0c56bfbe62c3db', 'b845d68a12f34dab88236bd45c8e3f90', 'd1ccfade1a1b4a07b68c9865320d7d52', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a061982d19a54730b595e85fd4e781bd', '955390c0f7a84b76b2d155a4d44ca6ce', '6d31c7915084491cb645700792ec9c47', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('a0abd534bb964288b2d43b0abcaf06d9', 'b845d68a12f34dab88236bd45c8e3f90', '2f48e9a6dbf64f9ea052868bdb1da286', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a140817939ae4c9bacde5f4afa419082', 'b845d68a12f34dab88236bd45c8e3f90', 'eae7e221e92d4b8d8fa6235cbf269f55', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a246f52ed93e446095909a62cef06e80', 'b845d68a12f34dab88236bd45c8e3f90', 'ae75a81f9d68414bbb0edb4ea06da6e0', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a36421562fbd4548b2844e9cc55d67dd', '955390c0f7a84b76b2d155a4d44ca6ce', '1f34120ce93c452dbec4202206bc0b4a', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('a5a1d65b809843aeb91c6ef845503b79', 'b845d68a12f34dab88236bd45c8e3f90', '26fd01c0ebb24a26bd93f2757e18f479', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a5a79f04764d40c581a76669df568730', 'b845d68a12f34dab88236bd45c8e3f90', 'dcf78e9836d64ea99b6a9e814a66d820', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a6cb8163bb6d4714990d32c1c06a34a0', '955390c0f7a84b76b2d155a4d44ca6ce', 'a9740546d94f408dabedcc3458de57b5', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('aba22607fa6c45e7981e6b583572a918', '955390c0f7a84b76b2d155a4d44ca6ce', 'd1ccfade1a1b4a07b68c9865320d7d52', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('aed0f3cfb2be41b1a6d6c47a53770b2f', '955390c0f7a84b76b2d155a4d44ca6ce', '02144c3e53704b77b5a2bb846ce139f3', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('b0751c636c2248c797a0f42dbeb865e0', 'b845d68a12f34dab88236bd45c8e3f90', '02144c3e53704b77b5a2bb846ce139f3', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b0bccec9daf34c199e4c352ba2bc0abf', 'b845d68a12f34dab88236bd45c8e3f90', 'a8b47ec9f9044f9e9c84b4104d5e7fd0', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b161a3e2eb644ad49b700d10b4356852', 'b845d68a12f34dab88236bd45c8e3f90', 'd3327d1977d7471d9faef1c75971d778', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b177ec12889e430b9e170d56ac0be70d', '955390c0f7a84b76b2d155a4d44ca6ce', 'd3327d1977d7471d9faef1c75971d778', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('b2cd85d1a7f24b5085b5e784b38b7662', '955390c0f7a84b76b2d155a4d44ca6ce', '0a7931ffa3c04bacaadfac1838b47a0d', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('b68f2c2c12dc4f648b78abd6bd1b7abb', 'b845d68a12f34dab88236bd45c8e3f90', '6c1ebec221154f38bf4a910cf48da48a', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b78f7e828af34d19bf48b0f44c8f83b4', '955390c0f7a84b76b2d155a4d44ca6ce', '26fd01c0ebb24a26bd93f2757e18f479', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('bac7b96068c243bdad3f00a952edebdb', '955390c0f7a84b76b2d155a4d44ca6ce', 'c39ead786e8a4e5f844ef30a5882d232', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('bfb703c822c24e4e90104875f3b6f568', '955390c0f7a84b76b2d155a4d44ca6ce', '239336ba333e44808aa64169814f7aaa', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('c1bc1266824947feb308b745f01243e7', 'b845d68a12f34dab88236bd45c8e3f90', '82bd68fed9934717ad257ba7bf2d91a9', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('c76932eafcfc478da786e0f36bf31d7a', '955390c0f7a84b76b2d155a4d44ca6ce', 'b93b5970dc4b44b582075726f34646c7', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('cbf92e214fae44abb3215bd2e7fc7249', 'b845d68a12f34dab88236bd45c8e3f90', '4ceba49ff1f74d149a292f4c741a67f5', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('cfb79f7ece644f7eabeb8d54e02ba83a', '955390c0f7a84b76b2d155a4d44ca6ce', 'eb55f3c2ad834c1f9c49250d1c3b9a4d', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('d267205123cb4596a8973a297f197f6d', 'b845d68a12f34dab88236bd45c8e3f90', '80d1c5cf67bd4452ad7fb0661206e4b5', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('d5a34fe62635472b95dd12c2104cfbdf', '955390c0f7a84b76b2d155a4d44ca6ce', '0e6a0155c44341b48e41a664662f41c3', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('da0f6e7ff215440caa87df2d5bf5016b', '955390c0f7a84b76b2d155a4d44ca6ce', 'd8fb09bcbd1c4eada6ab0e1b5668ff57', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('db64302329de4aa98f353ca06a430cc3', '955390c0f7a84b76b2d155a4d44ca6ce', '5b8f42cadc944aa4a98641557a8e2a34', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('dd2a5d8aa8d5407eb27d8e8718ca6b8c', '955390c0f7a84b76b2d155a4d44ca6ce', '362250de48c947d38f07715d76ae5b4f', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('e15eb0c691af49b098129c1ce6561722', '955390c0f7a84b76b2d155a4d44ca6ce', 'a8b47ec9f9044f9e9c84b4104d5e7fd0', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('e62ff3969d894394aec4dfe4a520f6db', 'b845d68a12f34dab88236bd45c8e3f90', 'd8fb09bcbd1c4eada6ab0e1b5668ff57', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('e79e64fab05f4e1a939e87a78ce347fa', '955390c0f7a84b76b2d155a4d44ca6ce', '8fe7e8a690f44d6bac073617efaa345a', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('ecc88a5c68a14eb1bb2ea3deed14347f', 'b845d68a12f34dab88236bd45c8e3f90', '6300d120f23149ab91f616e2fa70ab3a', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('edc3b5e77e9c425794082a4adee275ae', '955390c0f7a84b76b2d155a4d44ca6ce', 'cdd48f81527946419d6807c7cfe03ac7', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('f1e1ee70add14824b0133d8455d4b291', 'b845d68a12f34dab88236bd45c8e3f90', 'af1921aee9734911a724341bb50054bc', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('f2352d68b2d44e55a6c2be676383713c', 'b845d68a12f34dab88236bd45c8e3f90', 'd5f7fbba01174e7480a37dcb52ac1867', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('f4963ca8add2484981a9d823667a409c', '955390c0f7a84b76b2d155a4d44ca6ce', '2f48e9a6dbf64f9ea052868bdb1da286', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('f88e88e2cf334a4492cbbefe909d3552', '955390c0f7a84b76b2d155a4d44ca6ce', '6300d120f23149ab91f616e2fa70ab3a', '1', '2023-04-18 15:13:53', NULL);
INSERT INTO `system_role_menu` VALUES ('faa6949bb87d4c93af2ce511c3a7c071', 'b845d68a12f34dab88236bd45c8e3f90', 'dc1bbb3d93f0451a839a63b127f164fa', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('fd490b60ff224160b422eef808653e0c', '955390c0f7a84b76b2d155a4d44ca6ce', '8a3271ffe96b40399dd5bb3478702eda', '1', '2023-04-18 15:13:53', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `login_name` varchar(50) NOT NULL COMMENT '登录名称',
  `login_password` varchar(120) NOT NULL COMMENT '登录密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `birth_date` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `live_address` varchar(120) DEFAULT NULL COMMENT '居住地',
  `birth_address` varchar(120) DEFAULT NULL COMMENT '籍贯地址',
  `head_address` varchar(1200) DEFAULT NULL COMMENT '头像地址',
  `motto` varchar(50) DEFAULT NULL COMMENT '座右铭',
  `last_login_time` varchar(50) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `ipaddr` varchar(50) DEFAULT NULL,
  `iprealaddr` varchar(50) DEFAULT NULL,
  `status` varchar(8) DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `open_id` varchar(50) DEFAULT NULL COMMENT '微信id',
  `init_password` varchar(8) DEFAULT NULL COMMENT '是否初始密码',
  `pwd_error_num` varchar(8) DEFAULT NULL COMMENT '密码输入错误次数',
  `pwd_error_time` varchar(50) DEFAULT NULL COMMENT '密码输入错误时间',
  `theme_id` varchar(50) DEFAULT NULL,
  `depart_leader` varchar(100) DEFAULT NULL,
  `direct_leader` varchar(100) DEFAULT NULL,
  `branch_leader` varchar(100) DEFAULT NULL,
  `token` varchar(1200) DEFAULT NULL,
  `token_refresh_time` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
BEGIN;
INSERT INTO `system_user` VALUES ('1', '0', 'admin', '$2a$10$R5sTyyPB4sRn1UzzcaHkuODnKJ2WYHKEvV7oG44aJ57q.zUdCSL92', '管理员', '1', '15552881678', 'aaxtaxt@163.com', '2022-03-21', '12', '2', '', '2', '2021-02-18 18:45:13', 'Chrome 8', 'Windows 10', '127.0.0.1', '内网IP', '0', '13', NULL, NULL, '0', '2021-02-18 18:45:13', '1', NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOjM2N2JjMjg0ZjEzYzQzMTY5MjJjNDk0ZDliYjFmYWI5Iiwic3ViIjoiYWRtaW4iLCJpc3MiOiJ2dWUiLCJpYXQiOjE2MTM2NDUxMTMsImV4cCI6MTYxMzY0NjkxM30.tfC7TFkInxYldGq3InjF-6iBggwBQHgtK4Mf5Ol_IRY', '2021-02-18 18:45:14', '23', '2020-09-28 11:09:24', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-21 23:50:37');
INSERT INTO `system_user` VALUES ('2', '1', '2', '2', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', '2', '2', '2');
INSERT INTO `system_user` VALUES ('8786cc08c0864653a1e8609ae08cec28', '1', 'qingfeng', 'maBV6z4oK11rxq2LS3Vhhw==', '青锋', '1', '', '', '', '', '', '', '', '2020-10-08 16:12:16', 'Firefox 8', 'Windows 10', '127.0.0.1', '内网IP', '0', '3', NULL, NULL, '0', '2020-10-08 16:12:16', '1', NULL, NULL, NULL, NULL, NULL, '', '2020-09-28 10:38:51', '1', '367bc284f13c4316922c494d9bb1fab9', '8786cc08c0864653a1e8609ae08cec28', '2020-10-08 16:12:16');
INSERT INTO `system_user` VALUES ('8c64320bba8443fd80ddebc558ff8e4c', '1', '张三', 'A3uVcOKOyx+QBbPvfFjUGQ==', '张三', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 17:05:50', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2020-12-17 17:05:50');
INSERT INTO `system_user` VALUES ('a431b847910e429597af749720c6d739', '1', '666666', '$2a$10$Wv9pNUWJrF3HP06NNPIsG.h/nfi43/JBOLsWiz9RgbEa4SEIUN7o2', '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '666666', '2021-03-14 22:26:26', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('b66892bc3f064d6ba44a8d13deed4c60', '1', 'hrAdmin', '$2a$10$1VB8gZvhFgsDSzbqEI6nie.qrvdlz9JoRQS37QxtgGKQg.5TzzCqm', 'renshi', '1', '11111111111', '1234567890@qq.com', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-04-18 00:35:03', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-18 00:36:28');
INSERT INTO `system_user` VALUES ('c5ec79344ac94585807793428a92342c', '1', '88888888', '$2a$10$wBiwZR1dMrLCqZO4VRpzWumPN4ExOcZQoLJpA9sZcwWqk2PS5FB/W', '88888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 22:41:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('e1c385bc3e7b4ddb8e8fbb77186d8e23', '1', '7777777', '$2a$10$NwBNl8lG1GpF1pziqSPXLO8tAumck6wcATkj2HSWTAnnJbm2FGEA2', '7777777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 22:42:09', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_user_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_user_organize`;
CREATE TABLE `system_user_organize` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `user_id` varchar(50) NOT NULL COMMENT '用户id',
  `organize_id` varchar(50) NOT NULL COMMENT '组织id',
  `type` varchar(8) NOT NULL COMMENT '类型',
  `position` varchar(50) DEFAULT NULL COMMENT '职务',
  `authOrgIds` text COMMENT '数据权限组织',
  `authParams` text COMMENT '数据权限参数',
  `authOrgCascade` text,
  `use_status` varchar(8) DEFAULT NULL,
  `order_by` varchar(8) DEFAULT NULL COMMENT '排序',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_organize
-- ----------------------------
BEGIN;
INSERT INTO `system_user_organize` VALUES ('1', '4be09410b5eb47f2a2c4967ee7e03964', 'a8ccfb355ec748579f8c3a3312e96871', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092810360602276109', 'c78a3c47ffae4f8580aeeae488644165', '0', '0', '管理员', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-09-28 10:36:06', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092811092466863588', '3d7d27ed861143a8a622f1d99ca8393e', '367bc284f13c4316922c494d9bb1fab9', '0', '', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-09-28 11:09:24', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092814300068842224', '1', '367bc284f13c4316922c494d9bb1fab9', '0', '', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871,36ef711413d84b30b4bc6d41d628bf7b,66568bb579874e1396ea0e297e112b68,fc49f352b956496a9c9be717529e9e9a', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y,36ef711413d84b30b4bc6d41d628bf7b:Y,66568bb579874e1396ea0e297e112b68:Y,fc49f352b956496a9c9be717529e9e9a:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_66568bb579874e1396ea0e297e112b68_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '1', '1', '1', '2020-09-28 14:30:00', '2022-03-22 08:10:30');
INSERT INTO `system_user_organize` VALUES ('2020092817030294357883', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '', NULL, NULL, NULL, '0', '3', '1', '2020-09-28 17:03:02', '2022-03-22 08:10:30');
INSERT INTO `system_user_organize` VALUES ('e4de9ad5c35b4c0fa7dd1b965eb84ac5', 'b66892bc3f064d6ba44a8d13deed4c60', 'a8ccfb355ec748579f8c3a3312e96871', '0', NULL, 'a8ccfb355ec748579f8c3a3312e96871,367bc284f13c4316922c494d9bb1fab9', 'a8ccfb355ec748579f8c3a3312e96871:Y,367bc284f13c4316922c494d9bb1fab9:Y', NULL, '0', '1', '1', '2023-04-18 00:35:03', '2023-04-18 00:36:56');
COMMIT;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `id` varchar(50) NOT NULL COMMENT '主键id',
  `role_id` varchar(50) NOT NULL COMMENT '角色id',
  `user_id` varchar(50) NOT NULL COMMENT '用户id',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
BEGIN;
INSERT INTO `system_user_role` VALUES ('09680853aae04ce0acf244e8176a78c9', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('373400eec810463b9ed5cfdcf003030f', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('73486353a2194591a08358b00f8fe8eb', 'b845d68a12f34dab88236bd45c8e3f90', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('aa89a49be03c4888ac399dc4ca426219', 'b845d68a12f34dab88236bd45c8e3f90', 'b66892bc3f064d6ba44a8d13deed4c60', '1', '2023-04-18 00:36:56', NULL);
INSERT INTO `system_user_role` VALUES ('dc1377c22cb6401badb03eaef2131dcc', 'b845d68a12f34dab88236bd45c8e3f90', '1', '1', '2022-03-19 00:41:22', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
