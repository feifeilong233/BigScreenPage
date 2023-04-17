/*
 Navicat Premium Data Transfer

 Source Server         : dt
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : frp.feifeilong.work:3306
 Source Schema         : dt_test

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 18/04/2023 01:19:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for common_demo
-- ----------------------------
DROP TABLE IF EXISTS `common_demo`;
CREATE TABLE `common_demo`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_demo
-- ----------------------------
INSERT INTO `common_demo` VALUES (3, '李六', '备注', '2022-01-11 00:00:00');

-- ----------------------------
-- Table structure for common_tdemo
-- ----------------------------
DROP TABLE IF EXISTS `common_tdemo`;
CREATE TABLE `common_tdemo`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路面名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层数',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路面材料',
  `classify` decimal(50, 0) NULL COMMENT '弹性模量',
  `remark` decimal(50, 2) NULL COMMENT '泊松比',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `order_by` decimal(50, 2) NULL COMMENT '厚度',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试案例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_tdemo
-- ----------------------------
INSERT INTO `common_tdemo` VALUES ('060beef563b64738b0a6932bfe10a0dd', '1', '第2层', '2', 'AC20', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.07, '0', '2023-04-11 17:20:53', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 21:13:47');
INSERT INTO `common_tdemo` VALUES ('0d657162cb964f5996042bf28a06071b', '1', 'STR3', 'STR3', NULL, 0, 0.00, '1', 0.00, '0', '2023-04-16 00:57:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('1f62ea8172af42c2973501de0ec68004', '2', '4444', '4', 'GB', 2333, 0.62, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('267d250d737441ab8717f3e4424d881b', '2', '5555', '5', 'GB', 2333, 0.22, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('29a7431e2afe451586e57fe355de0611', '2', '2222', '2', 'AC20', 2333, 0.23, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('2a7e1f842eac49429227b095fa095cd1', '2', '底基层', '3', 'CBG25', 233, 0.23, 'de7a5e8231314c8897d321d38e68bf08', 0.00, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 17:06:01');
INSERT INTO `common_tdemo` VALUES ('3d27dd4f1e04492f915749dfa8dc7d60', '1', '第4层', '4', 'CS', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.27, '0', '2023-04-11 16:53:52', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 21:13:47');
INSERT INTO `common_tdemo` VALUES ('437500317fc14ac9bcdeccccd6e03075', '1', 'STR4', 'STR4', NULL, 0, 0.00, '1', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('643f17d262be49d18391221f868ab143', '2', '中间层', '2', 'CBG25', 2333, 0.23, 'de7a5e8231314c8897d321d38e68bf08', 0.11, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 00:42:14');
INSERT INTO `common_tdemo` VALUES ('77fbbc105765468e95cb8aa1323f57fc', '2', '222', '2', 'CBG25', 234, 0.22, '0d657162cb964f5996042bf28a06071b', 0.22, '0', '2023-04-16 00:57:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('7995e911425f4ead8a41cebcaecad89e', '2', '3333', '3', 'CS', 2333, 0.23, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('8af1bc4fbfca435182bf46eef98ceb0e', '1', '第3层', '3', 'AC25', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.19, '0', '2023-04-11 17:22:15', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 21:13:47');
INSERT INTO `common_tdemo` VALUES ('b1e00c0a172a4015a5c948b6593af64b', '2', '面层', '1', 'AC20', 213, 0.23, 'de7a5e8231314c8897d321d38e68bf08', 0.22, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 00:42:14');
INSERT INTO `common_tdemo` VALUES ('b517be01d6584cfb908d0c49c8d2996e', '1', 'STR1', 'STR1', '', 0, 0.00, '1', 0.00, '0', '2022-03-24 21:12:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 10:49:54');
INSERT INTO `common_tdemo` VALUES ('cd6c7325710a4854a279cf9c54b44446', '1', '第5层', '5', 'GB', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.31, '0', '2023-04-11 16:54:20', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 21:13:47');
INSERT INTO `common_tdemo` VALUES ('db35a2b8e2fa4aeba8e476527101fcba', '1', '第1层', '1', 'AC13', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.05, '0', '2023-04-11 15:46:31', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 21:13:47');
INSERT INTO `common_tdemo` VALUES ('de7a5e8231314c8897d321d38e68bf08', '1', 'STR2', 'STR2', NULL, 0, 0.00, '1', 0.00, '0', '2023-04-15 22:22:37', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('ee110de65d3e4cf48622eca6b228749f', '2', '1111', '1', 'AC13', 2333, 0.21, '437500317fc14ac9bcdeccccd6e03075', 0.00, '0', '2023-04-16 15:06:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-16 15:08:32');
INSERT INTO `common_tdemo` VALUES ('f5a5a8dd38734b7882121ad3bdafbf68', '2', '111', '1', 'AC25', 213, 0.11, '0d657162cb964f5996042bf28a06071b', 0.11, '0', '2023-04-16 00:57:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('fc43ffebcee34221854df56d4207b37f', '1', '第6层', '6', 'CBG25', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', 0.33, '0', '2023-04-13 22:42:22', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 21:13:47');

-- ----------------------------
-- Table structure for common_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `common_uploadfile`;
CREATE TABLE `common_uploadfile`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `desnames` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件描述',
  `file_path` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `file_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件类型',
  `file_size` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `obj_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象id',
  `child_obj_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子对象id',
  `file_suffix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件后缀',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公共附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_uploadfile
-- ----------------------------
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

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger1', '1', '0/5 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger12', '367bc284f13c4316922c494d9bb1fab9', '0/2 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger2323', '2', '0/5 * * * * ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('Qingfeng_Cloud_Scheduler', '1', '1', '1', 'com.qingfeng.quartz.job.MessageJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('Qingfeng_Cloud_Scheduler', '12', '367bc284f13c4316922c494d9bb1fab9', '1#12', 'com.qingfeng.quartz.job.MessageJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('Qingfeng_Cloud_Scheduler', '2323', '2', '2', 'com.qingfeng.quartz.job.MessageJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('Qingfeng_Cloud_Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('Qingfeng_Cloud_Scheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('QuartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('QuartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('Qingfeng_Cloud_Scheduler', 'feifeilong2331681746629270', 1681751991803, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('QuartzScheduler', 'feifeilong2331681746628797', 1681751992281, 20000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger1', '1', '1', '1', NULL, 1647701970000, 1647701965000, 5, 'PAUSED', 'CRON', 1647701308000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger12', '367bc284f13c4316922c494d9bb1fab9', '12', '367bc284f13c4316922c494d9bb1fab9', NULL, 1647706108000, 1647706106000, 5, 'PAUSED', 'CRON', 1647705979000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('Qingfeng_Cloud_Scheduler', 'trigger2323', '2', '2323', '2', NULL, 1647704745000, 1647704740000, 5, 'PAUSED', 'CRON', 1647703779000, 0, NULL, 0, '');

-- ----------------------------
-- Table structure for quartz_bustask
-- ----------------------------
DROP TABLE IF EXISTS `quartz_bustask`;
CREATE TABLE `quartz_bustask`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `job_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `notice_user` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知人',
  `job_class_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类',
  `cron_expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行表达式',
  `trigger_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `trigger_state` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quartz_bustask
-- ----------------------------
INSERT INTO `quartz_bustask` VALUES ('a9ed6639899d4ef897e1ace678a51c7e', NULL, '12', '367bc284f13c4316922c494d9bb1fab9', '1', '12', 'com.qingfeng.quartz.job.MessageJob', '0/2 * * * * ? *', '2022-03-20 00:08:15', 'N', '1', '1', '2022-03-20 00:04:28', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-20 00:08:27');

-- ----------------------------
-- Table structure for system_area
-- ----------------------------
DROP TABLE IF EXISTS `system_area`;
CREATE TABLE `system_area`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `area_cascade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '级联字段',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地区名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区简称',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级',
  `en_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `en_short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文简称',
  `lng` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维度',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_area
-- ----------------------------
INSERT INTO `system_area` VALUES ('233af14d6af6435992c5f7ed01bcee26', '1', 'null233af14d6af6435992c5f7ed01bcee26_', '山东省', '山东省', '1', '1', NULL, NULL, NULL, NULL, '0', '1', NULL, '2022-03-12 00:16:32', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_area` VALUES ('6250a8fc24c748c5ab69930fb64bcc7b', '1', 'null6250a8fc24c748c5ab69930fb64bcc7b_', '济南市', '济南市', '233af14d6af6435992c5f7ed01bcee26', '2', NULL, NULL, NULL, NULL, '0', '1', NULL, '2022-03-12 00:16:44', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `dic_cascade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '级联字段',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典简称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
INSERT INTO `system_dictionary` VALUES ('09242d181b884c05b4bc52ac78436a95', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_09242d181b884c05b4bc52ac78436a95_', '水泥稳定级配碎石', 'CBG25', 'CBG25', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '6', NULL, '2023-04-13 22:41:38', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_dictionary` VALUES ('1422ec33af5f41208fc39cd0d2858c08', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_', '路面材料', '路面材料', 'lmcl', '1', '1', '0', '1', NULL, '2022-03-24 20:40:46', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 14:48:46');
INSERT INTO `system_dictionary` VALUES ('6254f019801d40be89adc3b3d3944bf3', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_6254f019801d40be89adc3b3d3944bf3_', '级配碎石', 'GB', 'GB', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '4', NULL, '2023-04-11 15:02:11', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_dictionary` VALUES ('8188c21484684ffb8eb76481634a9e4f', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_8188c21484684ffb8eb76481634a9e4f_', 'AC20沥青混合料', 'AC20', 'AC20', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '2', NULL, '2022-03-24 20:42:28', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 15:00:57');
INSERT INTO `system_dictionary` VALUES ('c0305cfb39534575a270b008b2313d48', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_c0305cfb39534575a270b008b2313d48_', 'AC25沥青混合料', 'AC25', 'AC25', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '3', NULL, '2022-03-24 20:42:08', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 15:00:28');
INSERT INTO `system_dictionary` VALUES ('cadf553c3e744f0382bf3cdcc86533d0', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_cadf553c3e744f0382bf3cdcc86533d0_', 'AC13沥青混合料', 'AC13', 'AC13', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '1', NULL, '2022-03-24 20:41:02', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 15:01:10');
INSERT INTO `system_dictionary` VALUES ('f502e704d10647d1a8a172e0a5285310', '1', 'dic_1_1422ec33af5f41208fc39cd0d2858c08_f502e704d10647d1a8a172e0a5285310_', '水泥稳定土', 'CS', 'CS', '1422ec33af5f41208fc39cd0d2858c08', '2', '0', '5', NULL, '2023-04-11 15:02:29', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);

-- ----------------------------
-- Table structure for system_genfield
-- ----------------------------
DROP TABLE IF EXISTS `system_genfield`;
CREATE TABLE `system_genfield`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `table_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主表id',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `field_comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段描述',
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_operat` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否添加编辑',
  `field_list` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表展示',
  `field_query` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询展示',
  `query_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式',
  `verify_rule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校验规则',
  `show_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型',
  `option_content` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项内容',
  `default_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_genfield
-- ----------------------------
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

-- ----------------------------
-- Table structure for system_gentable
-- ----------------------------
DROP TABLE IF EXISTS `system_gentable`;
CREATE TABLE `system_gentable`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表描述',
  `temp_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板类型',
  `pack_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `mod_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `bus_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `menu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级菜单id',
  `gen_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成方式',
  `gen_path` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tree_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树表id',
  `tree_pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树表父级id',
  `tree_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树表名称',
  `open_process` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开启流程',
  `process_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义key',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_gentable
-- ----------------------------
INSERT INTO `system_gentable` VALUES ('3f5655e79f004f0b821d7937a2e756ba', '0', 'common_demo', '', '0', 'com.qingfeng', 'common', 'demo', '', NULL, '0', 'C://', '0', '3f5655e79f004f0b821d7937a2e756ba', NULL, NULL, NULL, NULL, '1', NULL, '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_gentable` VALUES ('ed44757f5ecb495b8126b730cc3ba522', '0', 'common_tdemo', '测试案例表', '1', 'com.qingfeng', 'common', 'tdemo', '测试案例表', '945dc8526a164812844f88f9a520590b', '0', 'C://', '0', 'ed44757f5ecb495b8126b730cc3ba522', 'parent_id', 'name', NULL, NULL, '1', NULL, '2022-03-23 23:31:24', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 09:27:22');
INSERT INTO `system_gentable` VALUES ('eeaaaff1b9ce41b9a06c79579d23c892', '0', 'common_uploadfile', '公共附件表', '0', 'com.qingfeng', 'common', 'uploadfile', '公共附件表', NULL, '0', 'C://', '0', 'eeaaaff1b9ce41b9a06c79579d23c892', NULL, NULL, NULL, NULL, '1', NULL, '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_gentable` VALUES ('f92ef73db5904f47a127dd437f0c16d6', '0', 'quartz_bustask', '定时业务表', '0', 'com.qingfeng', 'quartz', 'bustask', '定时业务表', NULL, '0', 'C://', '0', 'f92ef73db5904f47a127dd437f0c16d6', NULL, NULL, NULL, NULL, '1', NULL, '2022-03-20 22:51:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `redirect` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向路径',
  `component` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `keepAlive` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'keepAlive',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `permission` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `menu_cascade` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单级联',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `level_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('02144c3e53704b77b5a2bb846ce139f3', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_02144c3e53704b77b5a2bb846ce139f3_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '7', NULL, '2020-12-30 15:30:11', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('0a7931ffa3c04bacaadfac1838b47a0d', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_0a7931ffa3c04bacaadfac1838b47a0d_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '3', NULL, '2020-12-27 13:05:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('0e6a0155c44341b48e41a664662f41c3', '1', '角色管理', '/system/role', NULL, '/system/role', '角色管理', 'true', 'TrademarkCircleOutlined', 'role', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '3', NULL, '2020-12-27 13:06:44', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:03');
INSERT INTO `system_menu` VALUES ('17b8a177454140079b97602b5496e369', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_17b8a177454140079b97602b5496e369_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '4', NULL, '2020-12-27 13:18:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('239336ba333e44808aa64169814f7aaa', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_239336ba333e44808aa64169814f7aaa_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '4', NULL, '2020-12-27 13:24:10', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('26fd01c0ebb24a26bd93f2757e18f479', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_26fd01c0ebb24a26bd93f2757e18f479_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '4', NULL, '2020-12-27 13:23:36', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('2f48e9a6dbf64f9ea052868bdb1da286', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_2f48e9a6dbf64f9ea052868bdb1da286_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '7', NULL, '2020-12-30 15:30:21', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('362250de48c947d38f07715d76ae5b4f', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_362250de48c947d38f07715d76ae5b4f_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '3', NULL, '2020-12-27 13:01:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('3ad803ca5e814dffa9f3ec90d2c0b385', '2', '设置组织', '/', NULL, NULL, '设置组织', NULL, NULL, 'resetOrganize', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_3ad803ca5e814dffa9f3ec90d2c0b385_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '6', NULL, '2020-12-28 21:19:49', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('40509619bd82474a860b7e57cf6f7e33', '1', '菜单管理', '/system/menu', NULL, '/system/menu', '菜单管理', 'true', 'MenuOutlined', 'menu', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '5', NULL, '2020-12-27 13:20:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:18');
INSERT INTO `system_menu` VALUES ('480a6e7f4eb3428ea7f02a2f9ede7401', '1', '仿真分析', '/simulation/emulation', NULL, '/simulation/roadAnalysis', '仿真分析', NULL, 'FunctionOutlined', NULL, 'menu_1_480a6e7f4eb3428ea7f02a2f9ede7401_', '1', '0', '1', '2.4', NULL, '2023-04-17 17:00:32', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('4ceba49ff1f74d149a292f4c741a67f5', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_4ceba49ff1f74d149a292f4c741a67f5_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '4', NULL, '2020-12-27 13:02:18', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('5b8f42cadc944aa4a98641557a8e2a34', '1', '构建模型', '/simulation/build', NULL, '/simulation/modelBuild', '构建模型', NULL, 'ThunderboltOutlined', NULL, 'menu_1_5b8f42cadc944aa4a98641557a8e2a34_', '1', '0', '2', '2.1', NULL, '2023-04-11 00:47:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-12 09:49:26');
INSERT INTO `system_menu` VALUES ('6140f94adc314920b43bc68a2cbe02cb', '1', '首页', '/dashboard/welcome', NULL, '/dashboard/welcome', '首页', NULL, 'AppstoreAddOutlined', '', 'menu_1_6140f94adc314920b43bc68a2cbe02cb_', '1', '0', '1', '1', NULL, '2023-04-10 14:49:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6300d120f23149ab91f616e2fa70ab3a', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_6300d120f23149ab91f616e2fa70ab3a_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '2', NULL, '2020-12-27 13:00:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6b4063ed1fad47ee8e25f553aaf2a81e', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_6b4063ed1fad47ee8e25f553aaf2a81e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '2', NULL, '2020-12-27 13:09:16', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6c1ebec221154f38bf4a910cf48da48a', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_6c1ebec221154f38bf4a910cf48da48a_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '6', NULL, '2020-12-30 15:30:35', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('7912c46721bd46f09c4d1a42bb233a52', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_7912c46721bd46f09c4d1a42bb233a52_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '2', NULL, '2020-12-27 13:23:54', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('80d1c5cf67bd4452ad7fb0661206e4b5', '0', '系统管理', '/system', '/system/user', NULL, '系统管理', 'true', 'HomeOutlined', NULL, 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_', '1', '0', '1', '3', '测试', '2020-12-27 12:28:37', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:23:57');
INSERT INTO `system_menu` VALUES ('82bd68fed9934717ad257ba7bf2d91a9', '2', '权限分配', '/', NULL, NULL, '权限分配', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_82bd68fed9934717ad257ba7bf2d91a9_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '7', NULL, '2020-12-28 21:19:59', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
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
INSERT INTO `system_menu` VALUES ('e893c10f9ff441b4b7481075b1941a41', '1', '组织管理', '/system/organize', '', '/system/organize', '组织管理', 'true', 'TeamOutlined', 'organize', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '2', NULL, '2020-12-27 12:47:25', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:12:53');
INSERT INTO `system_menu` VALUES ('eae7e221e92d4b8d8fa6235cbf269f55', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_eae7e221e92d4b8d8fa6235cbf269f55_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '3', NULL, '2020-12-27 13:18:06', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('eb55f3c2ad834c1f9c49250d1c3b9a4d', '1', '预览模型', '/simulation/tdemo/view', NULL, '/simulation/modelView', '预览模型', NULL, 'FundViewOutlined', NULL, 'menu_1_eb55f3c2ad834c1f9c49250d1c3b9a4d_', '1', '0', '2', '2.3', NULL, '2023-04-12 09:54:55', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-15 20:32:28');
INSERT INTO `system_menu` VALUES ('f34a435bc0a5489f81749a6b102c3ba5', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_f34a435bc0a5489f81749a6b102c3ba5_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '4', NULL, '2020-12-27 13:05:44', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('f7b434433fed4579a8846a5444ef5d6e', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_f7b434433fed4579a8846a5444ef5d6e_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '5', NULL, '2020-12-28 21:23:34', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('f9ed6e5b12bf4cb9a306c3fc654d64b2', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_f9ed6e5b12bf4cb9a306c3fc654d64b2_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '9', NULL, '2020-12-30 13:39:43', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2020-12-30 13:40:08');

-- ----------------------------
-- Table structure for system_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_organize`;
CREATE TABLE `system_organize`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `org_cascade` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '级联字段',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织名称',
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织简称',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `depart_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direct_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_organize
-- ----------------------------
INSERT INTO `system_organize` VALUES ('367bc284f13c4316922c494d9bb1fab9', '1', 'org367bc284f13c4316922c494d9bb1fab9_', '公司信息', '公司信息', NULL, '1', '1', '0', '1', NULL, NULL, NULL, '', '2020-09-28 10:37:03', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2020-09-28 14:45:19');
INSERT INTO `system_organize` VALUES ('9f7969654fae4d4ca12c71d8a6cbe621', '1', 'org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_', '研发部', '研发部', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '5', NULL, NULL, NULL, '', '2020-09-28 10:37:58', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:25:58');
INSERT INTO `system_organize` VALUES ('a8ccfb355ec748579f8c3a3312e96871', '1', 'org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '人事部', '人事部', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '6', NULL, NULL, NULL, '', '2020-09-28 10:37:58', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:36:05');

-- ----------------------------
-- Table structure for system_organize_role
-- ----------------------------
DROP TABLE IF EXISTS `system_organize_role`;
CREATE TABLE `system_organize_role`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `organize_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_organize_role
-- ----------------------------
INSERT INTO `system_organize_role` VALUES ('abc74edfe37b44f88abeb21936b1a7a6', 'a8ccfb355ec748579f8c3a3312e96871', 'b845d68a12f34dab88236bd45c8e3f90', '1', '2023-04-18 00:35:36', NULL);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色简称',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('955390c0f7a84b76b2d155a4d44ca6ce', '1', '系统角色', '系统角色', '0', '1', 'admin', '2020-09-23 22:28:13', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2023-04-18 00:28:01');
INSERT INTO `system_role` VALUES ('b845d68a12f34dab88236bd45c8e3f90', '1', '组织角色', '组织角色', '0', '3', '', '2020-09-28 17:15:06', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2020-12-10 23:26:47');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `menu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES ('07c4a707bbba4f05abe4b0a7bfabedcf', 'b845d68a12f34dab88236bd45c8e3f90', 'c39ead786e8a4e5f844ef30a5882d232', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('0ce1d40436a5457d802bf2f5974c333b', '955390c0f7a84b76b2d155a4d44ca6ce', '239336ba333e44808aa64169814f7aaa', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('1053a87eda0a4740baa98765be39b699', 'b845d68a12f34dab88236bd45c8e3f90', '6140f94adc314920b43bc68a2cbe02cb', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('121f9bb64a5c42f0a4765acd95956d28', 'b845d68a12f34dab88236bd45c8e3f90', 'f34a435bc0a5489f81749a6b102c3ba5', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('14f947941bea408889ee7e3c0100a44b', 'b845d68a12f34dab88236bd45c8e3f90', '239336ba333e44808aa64169814f7aaa', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('191a6bbbe87349248cd32193340d6f38', '955390c0f7a84b76b2d155a4d44ca6ce', '3ad803ca5e814dffa9f3ec90d2c0b385', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('23c815561315467c8810a217daec0593', '955390c0f7a84b76b2d155a4d44ca6ce', '6b4063ed1fad47ee8e25f553aaf2a81e', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('24eb02ab5a324add8a6793f85d745454', '955390c0f7a84b76b2d155a4d44ca6ce', '40509619bd82474a860b7e57cf6f7e33', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('24f767efcc8542249a2dfb7a15bd0089', 'b845d68a12f34dab88236bd45c8e3f90', 'b1f15d18323042498080be61f550234e', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('25f680c459b843b6978345742da0d1d3', 'b845d68a12f34dab88236bd45c8e3f90', 'd6a49049221a461b8875bfe64c977008', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('27705f54f6ae4f94b16abb9547d9284f', '955390c0f7a84b76b2d155a4d44ca6ce', 'eb55f3c2ad834c1f9c49250d1c3b9a4d', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('32265b47173448be90c8dd0401d8dd82', '955390c0f7a84b76b2d155a4d44ca6ce', '6140f94adc314920b43bc68a2cbe02cb', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('36c2dc7c104a43a1874752a4951e1360', 'b845d68a12f34dab88236bd45c8e3f90', 'cdd48f81527946419d6807c7cfe03ac7', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('36e1e86080c446b691f4f0042b4b150a', 'b845d68a12f34dab88236bd45c8e3f90', '0a7931ffa3c04bacaadfac1838b47a0d', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('3848f432c3fa4b8d8ecc89b4397c3b4b', '955390c0f7a84b76b2d155a4d44ca6ce', 'eae7e221e92d4b8d8fa6235cbf269f55', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('3cef6c22bd454956a8bddd1d23a29947', '955390c0f7a84b76b2d155a4d44ca6ce', 'a9740546d94f408dabedcc3458de57b5', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('3e23b9fe4d94497ab3544916e5842f28', '955390c0f7a84b76b2d155a4d44ca6ce', 'a8b47ec9f9044f9e9c84b4104d5e7fd0', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('3e910a91b95544a7a861789b4c6c99bf', '955390c0f7a84b76b2d155a4d44ca6ce', 'a841c0a4a9014efeae9846a9214dc539', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('3fb893b4e88c41cb8c50e02d308bf5c0', 'b845d68a12f34dab88236bd45c8e3f90', 'ad664530d8df4a3cac9d8f2d07c256da', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('3fe67199185f4e72bd4cb523308c895f', '955390c0f7a84b76b2d155a4d44ca6ce', 'e893c10f9ff441b4b7481075b1941a41', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('412e8604295d42d784e494f12cb7fd0b', '955390c0f7a84b76b2d155a4d44ca6ce', '7912c46721bd46f09c4d1a42bb233a52', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('4478ba48b01b4ede978a7b848a57c5db', 'b845d68a12f34dab88236bd45c8e3f90', '7912c46721bd46f09c4d1a42bb233a52', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4593a94903444044aeb42f9552ce1cf5', '955390c0f7a84b76b2d155a4d44ca6ce', 'f7b434433fed4579a8846a5444ef5d6e', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('4c2611f1800b45f1bba9e6e7bd0d2a9e', 'b845d68a12f34dab88236bd45c8e3f90', '97be74ae0ae342d3ade81d4969a83b1b', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4da9a94828aa4f5d9efb627429583600', 'b845d68a12f34dab88236bd45c8e3f90', '40509619bd82474a860b7e57cf6f7e33', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4df293942df64aef908055591ef5ea10', 'b845d68a12f34dab88236bd45c8e3f90', '8fe7e8a690f44d6bac073617efaa345a', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('4e3bfd175c1a4f259998d3d430047d09', 'b845d68a12f34dab88236bd45c8e3f90', 'f9ed6e5b12bf4cb9a306c3fc654d64b2', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('501792185e954d8383240f561754f2a8', 'b845d68a12f34dab88236bd45c8e3f90', 'f7b434433fed4579a8846a5444ef5d6e', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('560c51f3e7a14784929a0c4b6969ad39', '955390c0f7a84b76b2d155a4d44ca6ce', '97be74ae0ae342d3ade81d4969a83b1b', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('5971a13a8a544a8a80d2e631470d50fa', '955390c0f7a84b76b2d155a4d44ca6ce', '17b8a177454140079b97602b5496e369', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('59abf1cc74284a96b95d3eb3fa64f5b8', '955390c0f7a84b76b2d155a4d44ca6ce', 'b93b5970dc4b44b582075726f34646c7', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('5c4b09f92b3e4f6fa31d20bb7edc9f88', 'b845d68a12f34dab88236bd45c8e3f90', 'e893c10f9ff441b4b7481075b1941a41', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('60ea62c6f6864638b6c0e78124fdc567', 'b845d68a12f34dab88236bd45c8e3f90', 'a841c0a4a9014efeae9846a9214dc539', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('60ee34c9398d418a9b6c5d36fdfa4721', 'b845d68a12f34dab88236bd45c8e3f90', '0e6a0155c44341b48e41a664662f41c3', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('627a21d5886b4617b31a29b57be8bdcf', '955390c0f7a84b76b2d155a4d44ca6ce', 'd3327d1977d7471d9faef1c75971d778', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('6475a1b46a64418ab40772dfddd835a8', 'b845d68a12f34dab88236bd45c8e3f90', 'b93b5970dc4b44b582075726f34646c7', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('6944f9a00b804c1fb06c9a35ecfe7d5b', '955390c0f7a84b76b2d155a4d44ca6ce', 'b1f15d18323042498080be61f550234e', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('69c7814af034497dabb4ceb895cd1608', 'b845d68a12f34dab88236bd45c8e3f90', '6b4063ed1fad47ee8e25f553aaf2a81e', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('74d657f8f99447599fb4acbe0b86227d', '955390c0f7a84b76b2d155a4d44ca6ce', 'd8fb09bcbd1c4eada6ab0e1b5668ff57', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('77765b27c9874dfcb8cc7b4a493ace1e', 'b845d68a12f34dab88236bd45c8e3f90', '17b8a177454140079b97602b5496e369', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('77fda4f1844946b3a2e713acce9347ca', 'b845d68a12f34dab88236bd45c8e3f90', '3ad803ca5e814dffa9f3ec90d2c0b385', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('7bde369c1cf34bad9d3d6f7b441619d2', '955390c0f7a84b76b2d155a4d44ca6ce', '26fd01c0ebb24a26bd93f2757e18f479', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('7d965eb12c4b4a969b2a3fa9fbeec01e', '955390c0f7a84b76b2d155a4d44ca6ce', '8fe7e8a690f44d6bac073617efaa345a', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('801a753812974269aa66a89dceb9ac83', '955390c0f7a84b76b2d155a4d44ca6ce', '0a7931ffa3c04bacaadfac1838b47a0d', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('8035518308574590a6e2a31fb19216a9', '955390c0f7a84b76b2d155a4d44ca6ce', 'c39ead786e8a4e5f844ef30a5882d232', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('853e494c5975476dadcefeff39f66e49', '955390c0f7a84b76b2d155a4d44ca6ce', '6300d120f23149ab91f616e2fa70ab3a', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('96fc630b0563434696f4529e792c8d93', '955390c0f7a84b76b2d155a4d44ca6ce', '0e6a0155c44341b48e41a664662f41c3', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('9786373ce2cf49a7ad13e8e229d73a91', 'b845d68a12f34dab88236bd45c8e3f90', '362250de48c947d38f07715d76ae5b4f', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('98fd116d95ed4a19be2896604a6f1a41', '955390c0f7a84b76b2d155a4d44ca6ce', '02144c3e53704b77b5a2bb846ce139f3', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('9be09fedac8f4d0faa957cd9f47d7168', '955390c0f7a84b76b2d155a4d44ca6ce', '4ceba49ff1f74d149a292f4c741a67f5', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('9ee18775e7f84f54af0c56bfbe62c3db', 'b845d68a12f34dab88236bd45c8e3f90', 'd1ccfade1a1b4a07b68c9865320d7d52', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a0abd534bb964288b2d43b0abcaf06d9', 'b845d68a12f34dab88236bd45c8e3f90', '2f48e9a6dbf64f9ea052868bdb1da286', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a140817939ae4c9bacde5f4afa419082', 'b845d68a12f34dab88236bd45c8e3f90', 'eae7e221e92d4b8d8fa6235cbf269f55', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a246f52ed93e446095909a62cef06e80', 'b845d68a12f34dab88236bd45c8e3f90', 'ae75a81f9d68414bbb0edb4ea06da6e0', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a5a1d65b809843aeb91c6ef845503b79', 'b845d68a12f34dab88236bd45c8e3f90', '26fd01c0ebb24a26bd93f2757e18f479', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('a5a79f04764d40c581a76669df568730', 'b845d68a12f34dab88236bd45c8e3f90', 'dcf78e9836d64ea99b6a9e814a66d820', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('ab41acae975e4b0daa21a956108ea82b', '955390c0f7a84b76b2d155a4d44ca6ce', 'dc1bbb3d93f0451a839a63b127f164fa', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('b0751c636c2248c797a0f42dbeb865e0', 'b845d68a12f34dab88236bd45c8e3f90', '02144c3e53704b77b5a2bb846ce139f3', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b0bccec9daf34c199e4c352ba2bc0abf', 'b845d68a12f34dab88236bd45c8e3f90', 'a8b47ec9f9044f9e9c84b4104d5e7fd0', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b161a3e2eb644ad49b700d10b4356852', 'b845d68a12f34dab88236bd45c8e3f90', 'd3327d1977d7471d9faef1c75971d778', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b68f2c2c12dc4f648b78abd6bd1b7abb', 'b845d68a12f34dab88236bd45c8e3f90', '6c1ebec221154f38bf4a910cf48da48a', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('b769761681a34b51820e64b6ede278f7', '955390c0f7a84b76b2d155a4d44ca6ce', '82bd68fed9934717ad257ba7bf2d91a9', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('ba59b19a949f4f99a2c1c913671415eb', '955390c0f7a84b76b2d155a4d44ca6ce', '362250de48c947d38f07715d76ae5b4f', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('c1bc1266824947feb308b745f01243e7', 'b845d68a12f34dab88236bd45c8e3f90', '82bd68fed9934717ad257ba7bf2d91a9', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('cbf92e214fae44abb3215bd2e7fc7249', 'b845d68a12f34dab88236bd45c8e3f90', '4ceba49ff1f74d149a292f4c741a67f5', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('d0f902af67c34ddd9ed0a05a493586ed', '955390c0f7a84b76b2d155a4d44ca6ce', 'd5f7fbba01174e7480a37dcb52ac1867', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('d267205123cb4596a8973a297f197f6d', 'b845d68a12f34dab88236bd45c8e3f90', '80d1c5cf67bd4452ad7fb0661206e4b5', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('d74b3d4a52be44a6ad7f24dfa6001ed0', '955390c0f7a84b76b2d155a4d44ca6ce', '2f48e9a6dbf64f9ea052868bdb1da286', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('d75bf3480261480581976bf34a98a732', '955390c0f7a84b76b2d155a4d44ca6ce', 'af1921aee9734911a724341bb50054bc', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('dbd9e16c5ceb4f918bd650e6d4b819db', '955390c0f7a84b76b2d155a4d44ca6ce', 'dcf78e9836d64ea99b6a9e814a66d820', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('dffc2ed6d13a49b59c1fbcbb719fc9df', '955390c0f7a84b76b2d155a4d44ca6ce', '6c1ebec221154f38bf4a910cf48da48a', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('e035a3752b1a4b5b81a4d1596f1dae23', '955390c0f7a84b76b2d155a4d44ca6ce', 'ae75a81f9d68414bbb0edb4ea06da6e0', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('e1b9e1f4d6ad4b11904b6b8d70860abb', '955390c0f7a84b76b2d155a4d44ca6ce', 'ad664530d8df4a3cac9d8f2d07c256da', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('e392cf670aa042b6b1ecb5699073c1ea', '955390c0f7a84b76b2d155a4d44ca6ce', '5b8f42cadc944aa4a98641557a8e2a34', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('e62ff3969d894394aec4dfe4a520f6db', 'b845d68a12f34dab88236bd45c8e3f90', 'd8fb09bcbd1c4eada6ab0e1b5668ff57', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('ecc88a5c68a14eb1bb2ea3deed14347f', 'b845d68a12f34dab88236bd45c8e3f90', '6300d120f23149ab91f616e2fa70ab3a', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('f1e1ee70add14824b0133d8455d4b291', 'b845d68a12f34dab88236bd45c8e3f90', 'af1921aee9734911a724341bb50054bc', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('f20b80a6aeea45c8b2ac98fdb3ad770f', '955390c0f7a84b76b2d155a4d44ca6ce', '480a6e7f4eb3428ea7f02a2f9ede7401', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('f20c494d4aa947ec844d5d34358f0882', '955390c0f7a84b76b2d155a4d44ca6ce', 'f34a435bc0a5489f81749a6b102c3ba5', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('f2352d68b2d44e55a6c2be676383713c', 'b845d68a12f34dab88236bd45c8e3f90', 'd5f7fbba01174e7480a37dcb52ac1867', '1', '2023-04-18 01:07:58', NULL);
INSERT INTO `system_role_menu` VALUES ('f2ee77f195d141238fb2d518e12f9d17', '955390c0f7a84b76b2d155a4d44ca6ce', 'd1ccfade1a1b4a07b68c9865320d7d52', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('f31b17d5762343ec8ff9f63c408177e9', '955390c0f7a84b76b2d155a4d44ca6ce', 'cdd48f81527946419d6807c7cfe03ac7', '1', '2023-04-18 01:14:13', NULL);
INSERT INTO `system_role_menu` VALUES ('faa6949bb87d4c93af2ce511c3a7c071', 'b845d68a12f34dab88236bd45c8e3f90', 'dc1bbb3d93f0451a839a63b127f164fa', '1', '2023-04-18 01:07:58', NULL);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称',
  `login_password` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `birth_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `live_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地',
  `birth_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯地址',
  `head_address` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `motto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座右铭',
  `last_login_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iprealaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信id',
  `init_password` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否初始密码',
  `pwd_error_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码输入错误次数',
  `pwd_error_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码输入错误时间',
  `theme_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depart_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direct_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token_refresh_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '0', 'admin', '$2a$10$R5sTyyPB4sRn1UzzcaHkuODnKJ2WYHKEvV7oG44aJ57q.zUdCSL92', '管理员', '1', '15552881678', 'aaxtaxt@163.com', '2022-03-21', '12', '2', '', '2', '2021-02-18 18:45:13', 'Chrome 8', 'Windows 10', '127.0.0.1', '内网IP', '0', '13', NULL, NULL, '0', '2021-02-18 18:45:13', '1', NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOjM2N2JjMjg0ZjEzYzQzMTY5MjJjNDk0ZDliYjFmYWI5Iiwic3ViIjoiYWRtaW4iLCJpc3MiOiJ2dWUiLCJpYXQiOjE2MTM2NDUxMTMsImV4cCI6MTYxMzY0NjkxM30.tfC7TFkInxYldGq3InjF-6iBggwBQHgtK4Mf5Ol_IRY', '2021-02-18 18:45:14', '23', '2020-09-28 11:09:24', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-21 23:50:37');
INSERT INTO `system_user` VALUES ('2', '1', '2', '2', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', '2', '2', '2');
INSERT INTO `system_user` VALUES ('8786cc08c0864653a1e8609ae08cec28', '1', 'qingfeng', 'maBV6z4oK11rxq2LS3Vhhw==', '青锋', '1', '', '', '', '', '', '', '', '2020-10-08 16:12:16', 'Firefox 8', 'Windows 10', '127.0.0.1', '内网IP', '0', '3', NULL, NULL, '0', '2020-10-08 16:12:16', '1', NULL, NULL, NULL, NULL, NULL, '', '2020-09-28 10:38:51', '1', '367bc284f13c4316922c494d9bb1fab9', '8786cc08c0864653a1e8609ae08cec28', '2020-10-08 16:12:16');
INSERT INTO `system_user` VALUES ('8c64320bba8443fd80ddebc558ff8e4c', '1', '张三', 'A3uVcOKOyx+QBbPvfFjUGQ==', '张三', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 17:05:50', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2020-12-17 17:05:50');
INSERT INTO `system_user` VALUES ('a431b847910e429597af749720c6d739', '1', '666666', '$2a$10$Wv9pNUWJrF3HP06NNPIsG.h/nfi43/JBOLsWiz9RgbEa4SEIUN7o2', '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '666666', '2021-03-14 22:26:26', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('b66892bc3f064d6ba44a8d13deed4c60', '1', 'hrAdmin', '$2a$10$1VB8gZvhFgsDSzbqEI6nie.qrvdlz9JoRQS37QxtgGKQg.5TzzCqm', 'renshi', '1', '11111111111', '1234567890@qq.com', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-04-18 00:35:03', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-18 00:36:28');
INSERT INTO `system_user` VALUES ('c5ec79344ac94585807793428a92342c', '1', '88888888', '$2a$10$wBiwZR1dMrLCqZO4VRpzWumPN4ExOcZQoLJpA9sZcwWqk2PS5FB/W', '88888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 22:41:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('e1c385bc3e7b4ddb8e8fbb77186d8e23', '1', '7777777', '$2a$10$NwBNl8lG1GpF1pziqSPXLO8tAumck6wcATkj2HSWTAnnJbm2FGEA2', '7777777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 22:42:09', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);

-- ----------------------------
-- Table structure for system_user_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_user_organize`;
CREATE TABLE `system_user_organize`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `organize_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `authOrgIds` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据权限组织',
  `authParams` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据权限参数',
  `authOrgCascade` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `use_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_organize
-- ----------------------------
INSERT INTO `system_user_organize` VALUES ('1', '4be09410b5eb47f2a2c4967ee7e03964', 'a8ccfb355ec748579f8c3a3312e96871', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092810360602276109', 'c78a3c47ffae4f8580aeeae488644165', '0', '0', '管理员', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-09-28 10:36:06', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092811092466863588', '3d7d27ed861143a8a622f1d99ca8393e', '367bc284f13c4316922c494d9bb1fab9', '0', '', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-09-28 11:09:24', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092814300068842224', '1', '367bc284f13c4316922c494d9bb1fab9', '0', '', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871,36ef711413d84b30b4bc6d41d628bf7b,66568bb579874e1396ea0e297e112b68,fc49f352b956496a9c9be717529e9e9a', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y,36ef711413d84b30b4bc6d41d628bf7b:Y,66568bb579874e1396ea0e297e112b68:Y,fc49f352b956496a9c9be717529e9e9a:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_66568bb579874e1396ea0e297e112b68_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '1', '1', '1', '2020-09-28 14:30:00', '2022-03-22 08:10:30');
INSERT INTO `system_user_organize` VALUES ('2020092817030294357883', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '', NULL, NULL, NULL, '0', '3', '1', '2020-09-28 17:03:02', '2022-03-22 08:10:30');
INSERT INTO `system_user_organize` VALUES ('e4de9ad5c35b4c0fa7dd1b965eb84ac5', 'b66892bc3f064d6ba44a8d13deed4c60', 'a8ccfb355ec748579f8c3a3312e96871', '0', NULL, 'a8ccfb355ec748579f8c3a3312e96871,367bc284f13c4316922c494d9bb1fab9', 'a8ccfb355ec748579f8c3a3312e96871:Y,367bc284f13c4316922c494d9bb1fab9:Y', NULL, '0', '1', '1', '2023-04-18 00:35:03', '2023-04-18 00:36:56');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES ('09680853aae04ce0acf244e8176a78c9', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('373400eec810463b9ed5cfdcf003030f', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('73486353a2194591a08358b00f8fe8eb', 'b845d68a12f34dab88236bd45c8e3f90', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('aa89a49be03c4888ac399dc4ca426219', 'b845d68a12f34dab88236bd45c8e3f90', 'b66892bc3f064d6ba44a8d13deed4c60', '1', '2023-04-18 00:36:56', NULL);
INSERT INTO `system_user_role` VALUES ('dc1377c22cb6401badb03eaef2131dcc', 'b845d68a12f34dab88236bd45c8e3f90', '1', '1', '2022-03-19 00:41:22', NULL);

SET FOREIGN_KEY_CHECKS = 1;