/*
 Navicat Premium Data Transfer

 Source Server         : 6
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : frp.feifeilong.work:3306
 Source Schema         : dt_test

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 12/04/2023 12:50:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for common_demo
-- ----------------------------
DROP TABLE IF EXISTS `common_demo`;
CREATE TABLE `common_demo` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路面名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '层数',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路面材料',
  `classify` decimal(50,0) DEFAULT '0' COMMENT '弹性模量',
  `remark` decimal(50,2) DEFAULT '0.00' COMMENT '泊松比',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级id',
  `order_by` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排序',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='测试案例表';

-- ----------------------------
-- Records of common_tdemo
-- ----------------------------
BEGIN;
INSERT INTO `common_tdemo` VALUES ('060beef563b64738b0a6932bfe10a0dd', '1', '第2层', '2', '8188c21484684ffb8eb76481634a9e4f', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', NULL, '0', '2023-04-11 17:20:53', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('3d27dd4f1e04492f915749dfa8dc7d60', '1', '第4层', '4', '6254f019801d40be89adc3b3d3944bf3', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', NULL, '0', '2023-04-11 16:53:52', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:22:00');
INSERT INTO `common_tdemo` VALUES ('8af1bc4fbfca435182bf46eef98ceb0e', '1', '第3层', '3', 'c0305cfb39534575a270b008b2313d48', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', NULL, '0', '2023-04-11 17:22:15', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo` VALUES ('b517be01d6584cfb908d0c49c8d2996e', '1', 'STR1', 'STR1', '', 0, 0.00, '1', '', '0', '2022-03-24 21:12:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:01:35');
INSERT INTO `common_tdemo` VALUES ('cd6c7325710a4854a279cf9c54b44446', '1', '第5层', '5', 'f502e704d10647d1a8a172e0a5285310', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', NULL, '0', '2023-04-11 16:54:20', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:21:06');
INSERT INTO `common_tdemo` VALUES ('db35a2b8e2fa4aeba8e476527101fcba', '1', '第1层', '1', 'cadf553c3e744f0382bf3cdcc86533d0', 18000, 0.34, 'b517be01d6584cfb908d0c49c8d2996e', NULL, '0', '2023-04-11 15:46:31', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:21:16');
COMMIT;

-- ----------------------------
-- Table structure for common_tdemo_copy1
-- ----------------------------
DROP TABLE IF EXISTS `common_tdemo_copy1`;
CREATE TABLE `common_tdemo_copy1` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典简称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典编码',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级id',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `classify` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类',
  `order_by` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='测试案例表';

-- ----------------------------
-- Records of common_tdemo_copy1
-- ----------------------------
BEGIN;
INSERT INTO `common_tdemo_copy1` VALUES ('1c5bd580f6014bd79a5e7dec1c093182', '1', '7', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:09', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('2f3dd25601144c0baab1a2f9326569e8', '1', '5', '0', '8188c21484684ffb8eb76481634a9e4f', '6f3c16a830ab41adafda022849b54a45', '0', '8188c21484684ffb8eb76481634a9e4f', '1', '微信图片_20211129215300.png#common/2022-03-26/2022032621202814891585.png', '2022-03-26 21:20:30', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('373c350eeb0d45c58922d8c39982c2ad', '1', '5656', '0', '', NULL, '0', '', '2#中国', '1', '2022-03-26 20:59:20', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('38f3871edf144b45a2ede4a0290a49a4', '1', '4', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:21:58', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('3b35f9ea960449f0afe53dde32bbb084', '1', '3', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:21:54', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('484c2ea6e00e41728dbefcbdca8dd086', '1', '9', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:16', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('66364b72addc432da177aa74e8a7333d', '1', '1', '1', '', '228c7cdc6804471987583ac3a1e34530', '0', '', '', '1', '2022-03-26 10:01:31', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('67bfcb5d5f874f0686023af93cc63013', '1', '1', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:21:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('6f3c16a830ab41adafda022849b54a45', '1', '555', '1', 'c0305cfb39534575a270b008b2313d48', '0', '0', 'cadf553c3e744f0382bf3cdcc86533d0', '0', '1', '2022-03-24 22:35:31', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 08:22:47');
INSERT INTO `common_tdemo_copy1` VALUES ('76cd76d3c9b7480baf6d64510aeea1f3', '1', '12', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:31', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('7d175b86ea3a47888f8616dc2275b1f5', '1', '5', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:01', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('7e7a9ae408ef4f37bbbb76e993416c26', '1', '666', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '1,2', '1', '2022-03-26 21:16:48', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-26 21:45:27');
INSERT INTO `common_tdemo_copy1` VALUES ('98b3709018794eb599a0f4f7beccbba8', '1', '8', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:12', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('b517be01d6584cfb908d0c49c8d2996e', '1', '666', '2', 'c0305cfb39534575a270b008b2313d48', '1', '0', '8188c21484684ffb8eb76481634a9e4f', '2#中国', '1', '2022-03-24 21:12:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-27 11:09:11');
INSERT INTO `common_tdemo_copy1` VALUES ('cfcedd9eb943447b9f1cd836376d08b0', '1', '1', '0', '', 'b517be01d6584cfb908d0c49c8d2996e', '0', '', '', '1', '2022-03-26 09:59:40', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('ef3ad81dd5ae42558a67d7a13b68b8b0', '1', '2', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:21:51', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('f11171304eb2464ca9c16b9833a3606b', '1', '6', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:04', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('f52b29d935074212a97d725fe6b6016b', '1', '3333', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-26 21:16:02', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `common_tdemo_copy1` VALUES ('fd8fce58db41487bafa72e1fc461fe26', '1', '11', '', '', '6f3c16a830ab41adafda022849b54a45', '0', '', '', '1', '2022-03-27 00:22:28', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for common_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `common_uploadfile`;
CREATE TABLE `common_uploadfile` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '附件名称',
  `desnames` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '附件描述',
  `file_path` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路径',
  `file_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '附件类型',
  `file_size` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '附件大小',
  `obj_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '对象id',
  `child_obj_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '子对象id',
  `file_suffix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '附件后缀',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='公共附件表';

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('Qingfeng_Cloud_Scheduler', 'cicideiMac.lan1681274913749', 1681275022973, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('QuartzScheduler', 'cicideiMac.lan1681274912902', 1681275034111, 20000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
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
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

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
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `job_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务分组',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务描述',
  `notice_user` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通知人',
  `job_class_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行类',
  `cron_expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行表达式',
  `trigger_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行时间',
  `trigger_state` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='定时业务表';

-- ----------------------------
-- Records of quartz_bustask
-- ----------------------------
BEGIN;
INSERT INTO `quartz_bustask` VALUES ('a9ed6639899d4ef897e1ace678a51c7e', NULL, '12', '367bc284f13c4316922c494d9bb1fab9', '1', '12', 'com.qingfeng.quartz.job.MessageJob', '0/2 * * * * ? *', '2022-03-20 00:08:15', 'N', '1', '1', '2022-03-20 00:04:28', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-20 00:08:27');
COMMIT;

-- ----------------------------
-- Table structure for system_area
-- ----------------------------
DROP TABLE IF EXISTS `system_area`;
CREATE TABLE `system_area` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `area_cascade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '级联字段',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地区名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地区简称',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '等级',
  `en_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '英文名称',
  `en_short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '英文简称',
  `lng` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '维度',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='地区管理';

-- ----------------------------
-- Records of system_area
-- ----------------------------
BEGIN;
INSERT INTO `system_area` VALUES ('233af14d6af6435992c5f7ed01bcee26', '1', 'null233af14d6af6435992c5f7ed01bcee26_', '山东省', '山东省', '1', '1', NULL, NULL, NULL, NULL, '0', '1', NULL, '2022-03-12 00:16:32', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_area` VALUES ('6250a8fc24c748c5ab69930fb64bcc7b', '1', 'null6250a8fc24c748c5ab69930fb64bcc7b_', '济南市', '济南市', '233af14d6af6435992c5f7ed01bcee26', '2', NULL, NULL, NULL, NULL, '0', '1', NULL, '2022-03-12 00:16:44', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `dic_cascade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '级联字段',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典简称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典编码',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '等级',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典管理';

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
BEGIN;
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
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `table_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主表id',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段名称',
  `field_comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段描述',
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段类型',
  `field_operat` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否添加编辑',
  `field_list` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否列表展示',
  `field_query` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否查询展示',
  `query_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '查询方式',
  `verify_rule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '校验规则',
  `show_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示类型',
  `option_content` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项内容',
  `default_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代码生成字段表';

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
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名称',
  `table_comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表描述',
  `temp_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板类型',
  `pack_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成包路径',
  `mod_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成模块名',
  `bus_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成业务名',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能名称',
  `menu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上级菜单id',
  `gen_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成方式',
  `gen_path` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tree_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '树表id',
  `tree_pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '树表父级id',
  `tree_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '树表名称',
  `open_process` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开启流程',
  `process_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '流程定义key',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代码生成主表';

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
-- Table structure for system_group
-- ----------------------------
DROP TABLE IF EXISTS `system_group`;
CREATE TABLE `system_group` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群组名称',
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '群组简称',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_group
-- ----------------------------
BEGIN;
INSERT INTO `system_group` VALUES ('03e7c1ed01524305b928c8abcec662d6', '1', '内部邮件', '12', '0', '1', NULL, '2021-05-27 00:14:30', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_group` VALUES ('319cbf04fe664388a633fce4d32938b0', '1', '人事领导1', '人事领导1', '0', '1', '', '2020-09-28 14:40:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_group` VALUES ('42f9825323bd45ff89e59eba5ce618df', '1', '人事职员2', '人事职员2', '0', '2', '', '2020-09-28 14:41:13', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_group` VALUES ('bb1d32508d3348b4991e48ead541c33f', '1', '人事职员1', '人事职员1', '0', '1', '', '2020-09-28 14:41:13', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2021-09-21 23:59:14');
INSERT INTO `system_group` VALUES ('bcad50f0bcd84f03b89b37e130c02c0f', '1', '人事领导2', '人事领导2', '0', '2', '', '2020-09-28 14:40:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求路径',
  `redirect` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '重定向路径',
  `component` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `keepAlive` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'keepAlive',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `permission` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `menu_cascade` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '菜单级联',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级id',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `level_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` VALUES ('0e6a0155c44341b48e41a664662f41c3', '1', '角色管理', '/system/role', NULL, '/system/role', '角色管理', 'true', 'TrademarkCircleOutlined', 'role', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '3', NULL, '2020-12-27 13:06:44', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:03');
INSERT INTO `system_menu` VALUES ('17b8a177454140079b97602b5496e369', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_17b8a177454140079b97602b5496e369_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '4', NULL, '2020-12-27 13:18:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('1da885461bf442b898eca8d07b80ac77', '1', '仪表盘', '/chart/workplace', NULL, '/dtChart/roadDetail', '仪表盘', NULL, 'CalculatorOutlined', NULL, 'menu_1_a9ae1e95305a4ffc9c81701b4c89703c_1da885461bf442b898eca8d07b80ac77_', 'a9ae1e95305a4ffc9c81701b4c89703c', '0', '2', '1.1', NULL, '2023-04-10 16:54:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-10 17:05:14');
INSERT INTO `system_menu` VALUES ('1f34120ce93c452dbec4202206bc0b4a', '2', '添加', '/', NULL, '/', '添加', 'true', NULL, 'add', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '1', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('239336ba333e44808aa64169814f7aaa', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_239336ba333e44808aa64169814f7aaa_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '4', NULL, '2020-12-27 13:24:10', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('26fd01c0ebb24a26bd93f2757e18f479', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_26fd01c0ebb24a26bd93f2757e18f479_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '4', NULL, '2020-12-27 13:23:36', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('2f48e9a6dbf64f9ea052868bdb1da286', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_2f48e9a6dbf64f9ea052868bdb1da286_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '7', NULL, '2020-12-30 15:30:21', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('35ff387c6a94466a938580250be625e3', '0', '模拟仿真', '/simulation', '/simulation/build', NULL, '模拟仿真', 'false', 'FunctionOutlined', NULL, 'menu_1_35ff387c6a94466a938580250be625e3_', '1', '0', '1', '1.2', NULL, '2023-04-11 00:47:13', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-12 09:48:46');
INSERT INTO `system_menu` VALUES ('40509619bd82474a860b7e57cf6f7e33', '1', '菜单管理', '/system/menu', NULL, '/system/menu', '菜单管理', 'true', 'MenuOutlined', 'menu', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '5', NULL, '2020-12-27 13:20:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:18');
INSERT INTO `system_menu` VALUES ('5b8f42cadc944aa4a98641557a8e2a34', '1', '构建模型', '/simulation/build', NULL, '/simulation/modelBuild', '构建模型', NULL, 'ThunderboltOutlined', NULL, 'menu_1_35ff387c6a94466a938580250be625e3_5b8f42cadc944aa4a98641557a8e2a34_', '35ff387c6a94466a938580250be625e3', '0', '2', '2.1', NULL, '2023-04-11 00:47:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-12 09:49:26');
INSERT INTO `system_menu` VALUES ('6140f94adc314920b43bc68a2cbe02cb', '1', '首页', '/dashboard/welcome', NULL, '/dashboard/welcome', '首页', NULL, 'AppstoreAddOutlined', '', 'menu_1_6140f94adc314920b43bc68a2cbe02cb_', '1', '0', '1', '1', NULL, '2023-04-10 14:49:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6b4063ed1fad47ee8e25f553aaf2a81e', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_6b4063ed1fad47ee8e25f553aaf2a81e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '2', NULL, '2020-12-27 13:09:16', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6c1ebec221154f38bf4a910cf48da48a', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_6c1ebec221154f38bf4a910cf48da48a_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '6', NULL, '2020-12-30 15:30:35', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('6d31c7915084491cb645700792ec9c47', '2', '删除', '/', NULL, '/', '删除', 'true', NULL, 'del', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '3', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('7912c46721bd46f09c4d1a42bb233a52', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_7912c46721bd46f09c4d1a42bb233a52_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '2', NULL, '2020-12-27 13:23:54', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('80d1c5cf67bd4452ad7fb0661206e4b5', '0', '系统管理', '/system', '/system/user', NULL, '系统管理', 'true', 'HomeOutlined', NULL, 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_', '1', '0', '1', '2', '测试', '2020-12-27 12:28:37', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:11:40');
INSERT INTO `system_menu` VALUES ('8a3271ffe96b40399dd5bb3478702eda', '2', '详情', '/', NULL, '/', '详情', 'true', NULL, 'info', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '4', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('8f795f7f6d8b43f69ca9ef93aecb0d9d', '2', '编辑', '/', NULL, '/', '编辑', 'true', NULL, 'edit', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '2', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('97be74ae0ae342d3ade81d4969a83b1b', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_97be74ae0ae342d3ade81d4969a83b1b_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '1', NULL, '2020-12-27 13:07:41', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('a841c0a4a9014efeae9846a9214dc539', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_a841c0a4a9014efeae9846a9214dc539_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '1', NULL, '2020-12-27 13:23:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('a8b47ec9f9044f9e9c84b4104d5e7fd0', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_a8b47ec9f9044f9e9c84b4104d5e7fd0_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '1', NULL, '2020-12-27 13:23:47', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('a9ae1e95305a4ffc9c81701b4c89703c', '0', '报表', '/chart', '/chart/workplace', NULL, '报表', 'false', 'ProjectOutlined', NULL, 'menu_1_a9ae1e95305a4ffc9c81701b4c89703c_', '1', '0', '1', '1.1', NULL, '2023-04-10 16:53:44', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu` VALUES ('ad664530d8df4a3cac9d8f2d07c256da', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_ad664530d8df4a3cac9d8f2d07c256da_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '5', NULL, '2020-12-28 21:30:28', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('ae75a81f9d68414bbb0edb4ea06da6e0', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_ae75a81f9d68414bbb0edb4ea06da6e0_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '3', NULL, '2020-12-27 13:24:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('af1921aee9734911a724341bb50054bc', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_af1921aee9734911a724341bb50054bc_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '2', NULL, '2020-12-27 13:23:15', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('b1f15d18323042498080be61f550234e', '2', '分配权限', '/', NULL, NULL, '分配权限', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_b1f15d18323042498080be61f550234e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '6', NULL, '2020-12-28 21:28:11', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('d1ccfade1a1b4a07b68c9865320d7d52', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_d1ccfade1a1b4a07b68c9865320d7d52_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '5', NULL, '2020-12-28 21:27:57', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('d3327d1977d7471d9faef1c75971d778', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_d3327d1977d7471d9faef1c75971d778_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '5', NULL, '2020-12-28 21:35:40', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('dc1bbb3d93f0451a839a63b127f164fa', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_dc1bbb3d93f0451a839a63b127f164fa_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '3', NULL, '2020-12-27 13:23:28', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('dcf78e9836d64ea99b6a9e814a66d820', '1', '字典管理', '/system/dictionary', '', '/system/dictionary', '字典管理', 'true', 'ProfileOutlined', 'dictionary', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '4', NULL, '2020-12-27 13:19:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:11');
INSERT INTO `system_menu` VALUES ('e843b5fe9a7e425ca76c2a7c878ab83c', '1', '路面详情', '/example/tdemo', NULL, '/example/tdemo', '路面详情', 'true', 'DesktopOutlined', 'tdemo', NULL, '35ff387c6a94466a938580250be625e3', '0', NULL, '2.2', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-12 09:52:29');
INSERT INTO `system_menu` VALUES ('eae7e221e92d4b8d8fa6235cbf269f55', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_eae7e221e92d4b8d8fa6235cbf269f55_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '3', NULL, '2020-12-27 13:18:06', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu` VALUES ('eb55f3c2ad834c1f9c49250d1c3b9a4d', '1', '预览模型', '/simulation/view', NULL, '/simulation/modelView', '预览模型', NULL, 'FundViewOutlined', NULL, 'menu_1_35ff387c6a94466a938580250be625e3_eb55f3c2ad834c1f9c49250d1c3b9a4d_', '35ff387c6a94466a938580250be625e3', '0', '2', '2.3', NULL, '2023-04-12 09:54:55', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_menu_copy1
-- ----------------------------
DROP TABLE IF EXISTS `system_menu_copy1`;
CREATE TABLE `system_menu_copy1` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求路径',
  `redirect` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '重定向路径',
  `component` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `keepAlive` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'keepAlive',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `permission` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `menu_cascade` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '菜单级联',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级id',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `level_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_menu_copy1
-- ----------------------------
BEGIN;
INSERT INTO `system_menu_copy1` VALUES ('02144c3e53704b77b5a2bb846ce139f3', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_02144c3e53704b77b5a2bb846ce139f3_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '7', NULL, '2020-12-30 15:30:11', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('0a7931ffa3c04bacaadfac1838b47a0d', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_0a7931ffa3c04bacaadfac1838b47a0d_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '3', NULL, '2020-12-27 13:05:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('0e6a0155c44341b48e41a664662f41c3', '1', '角色管理', '/system/role', NULL, '/system/role', '角色管理', 'true', 'TrademarkCircleOutlined', 'role', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '3', NULL, '2020-12-27 13:06:44', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:03');
INSERT INTO `system_menu_copy1` VALUES ('119ebce29dad4c34a31d595361ccbffa', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_6a083f0aa6d44d88b53dbfb08c8d2355_119ebce29dad4c34a31d595361ccbffa_', '6a083f0aa6d44d88b53dbfb08c8d2355', '0', '3', '6', NULL, '2020-12-30 15:30:56', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('17b8a177454140079b97602b5496e369', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_17b8a177454140079b97602b5496e369_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '4', NULL, '2020-12-27 13:18:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('1da885461bf442b898eca8d07b80ac77', '1', '仪表盘', '/chart/workplace', NULL, '/dtChart/roadDetail', '仪表盘', NULL, 'CalculatorOutlined', NULL, 'menu_1_a9ae1e95305a4ffc9c81701b4c89703c_1da885461bf442b898eca8d07b80ac77_', 'a9ae1e95305a4ffc9c81701b4c89703c', '0', '2', '1.1', NULL, '2023-04-10 16:54:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-10 17:05:14');
INSERT INTO `system_menu_copy1` VALUES ('1f34120ce93c452dbec4202206bc0b4a', '2', '添加', '/', NULL, '/', '添加', 'true', NULL, 'add', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '1', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('239336ba333e44808aa64169814f7aaa', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_239336ba333e44808aa64169814f7aaa_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '4', NULL, '2020-12-27 13:24:10', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('26fd01c0ebb24a26bd93f2757e18f479', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_26fd01c0ebb24a26bd93f2757e18f479_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '4', NULL, '2020-12-27 13:23:36', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('27e7c10127a24b3bb9aa25af5ec3cb69', '2', '删除', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_27e7c10127a24b3bb9aa25af5ec3cb69_', 'ec442a81fa184af9a954efc4bc44eda3', '0', '3', '3', NULL, '2020-12-31 11:29:43', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('2f48e9a6dbf64f9ea052868bdb1da286', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_2f48e9a6dbf64f9ea052868bdb1da286_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '7', NULL, '2020-12-30 15:30:21', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('35ff387c6a94466a938580250be625e3', '0', '模拟仿真', '/simulation', '/simulation/build', NULL, '模拟仿真', 'false', 'FunctionOutlined', NULL, 'menu_1_35ff387c6a94466a938580250be625e3_', '1', '0', '1', '1.2', NULL, '2023-04-11 00:47:13', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:27:48');
INSERT INTO `system_menu_copy1` VALUES ('362250de48c947d38f07715d76ae5b4f', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_362250de48c947d38f07715d76ae5b4f_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '3', NULL, '2020-12-27 13:01:25', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('3670777ee49a48e9bfede6813edfc531', '2', '编辑', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_3670777ee49a48e9bfede6813edfc531_', 'ec442a81fa184af9a954efc4bc44eda3', '0', '3', '2', NULL, '2020-12-31 11:29:34', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('3ad803ca5e814dffa9f3ec90d2c0b385', '2', '设置组织', '/', NULL, NULL, '设置组织', NULL, NULL, 'resetOrganize', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_3ad803ca5e814dffa9f3ec90d2c0b385_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '6', NULL, '2020-12-28 21:19:49', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('3e7387978dfb47cf80f2e7e3329f74b7', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_566e0e7f8703467fb823ad17e82ffafa_3e7387978dfb47cf80f2e7e3329f74b7_', '566e0e7f8703467fb823ad17e82ffafa', '0', '3', '2', NULL, '2020-12-27 13:25:05', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('40509619bd82474a860b7e57cf6f7e33', '1', '菜单管理', '/system/menu', NULL, '/system/menu', '菜单管理', 'true', 'MenuOutlined', 'menu', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '5', NULL, '2020-12-27 13:20:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:18');
INSERT INTO `system_menu_copy1` VALUES ('40671f8311954515a5c0d6f67c7ff09d', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_566e0e7f8703467fb823ad17e82ffafa_40671f8311954515a5c0d6f67c7ff09d_', '566e0e7f8703467fb823ad17e82ffafa', '0', '3', '4', NULL, '2020-12-27 13:25:19', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('41da59e3ea7947518776248a0cd48564', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_6a083f0aa6d44d88b53dbfb08c8d2355_41da59e3ea7947518776248a0cd48564_', '6a083f0aa6d44d88b53dbfb08c8d2355', '0', '3', '4', NULL, '2020-12-27 13:24:47', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('4ceba49ff1f74d149a292f4c741a67f5', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_4ceba49ff1f74d149a292f4c741a67f5_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '4', NULL, '2020-12-27 13:02:18', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('4e02de211df5451aa9a75c0ecd0c463a', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_6a083f0aa6d44d88b53dbfb08c8d2355_4e02de211df5451aa9a75c0ecd0c463a_', '6a083f0aa6d44d88b53dbfb08c8d2355', '0', '3', '1', NULL, '2020-12-27 13:24:20', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('4ef1b5ba5c91469ebbf89f5ccec045d6', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_566e0e7f8703467fb823ad17e82ffafa_4ef1b5ba5c91469ebbf89f5ccec045d6_', '566e0e7f8703467fb823ad17e82ffafa', '0', '3', '5', NULL, '2020-12-28 21:33:06', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('510b099d71c348e698234b364a2ef2f3', '2', '详情', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'null510b099d71c348e698234b364a2ef2f3_', 'a254e7ccf3b347a792c33eb359e7d940', '0', '2', '4', NULL, '2022-03-20 09:40:29', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('59c2230ec03d4aad978337c161e51477', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_566e0e7f8703467fb823ad17e82ffafa_59c2230ec03d4aad978337c161e51477_', '566e0e7f8703467fb823ad17e82ffafa', '0', '3', '6', NULL, '2020-12-30 15:31:08', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('5a35d63ddcca4b249a44b68bf3b7d60a', '2', '删除', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'null5a35d63ddcca4b249a44b68bf3b7d60a_', 'a254e7ccf3b347a792c33eb359e7d940', '0', '2', '6', NULL, '2022-03-20 09:41:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('5b8f42cadc944aa4a98641557a8e2a34', '1', '构建模型', '/simulation/build', NULL, '/simulation/modelBuild', '构建模型', NULL, 'ThunderboltOutlined', NULL, 'menu_1_35ff387c6a94466a938580250be625e3_5b8f42cadc944aa4a98641557a8e2a34_', '35ff387c6a94466a938580250be625e3', '0', '2', '2.1', NULL, '2023-04-11 00:47:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:15:54');
INSERT INTO `system_menu_copy1` VALUES ('5e3b0429b70a4a40aa48b7e4f2f8de2f', '1', 'Cron表达式', '/quartz/cron', NULL, '/quartz/cron', 'Cron表达式', 'true', 'FieldTimeOutlined', NULL, 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_5e3b0429b70a4a40aa48b7e4f2f8de2f_', 'b77c6dfb6f2d4736b5616be4c4e00834', '0', '2', '1', NULL, '2020-12-30 17:56:40', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-27 21:15:03');
INSERT INTO `system_menu_copy1` VALUES ('6140f94adc314920b43bc68a2cbe02cb', '1', '首页', '/dashboard/welcome', NULL, '/dashboard/welcome', '首页', NULL, 'AppstoreAddOutlined', '', 'menu_1_6140f94adc314920b43bc68a2cbe02cb_', '1', '0', '1', '1', NULL, '2023-04-10 14:49:19', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('6300d120f23149ab91f616e2fa70ab3a', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_6300d120f23149ab91f616e2fa70ab3a_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '2', NULL, '2020-12-27 13:00:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('6ae1b5005ae84de1b383e59b342005d9', '2', '执行', '/', NULL, NULL, '执行', NULL, NULL, 'execution', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_6ae1b5005ae84de1b383e59b342005d9_', 'ec442a81fa184af9a954efc4bc44eda3', '0', '3', '5', NULL, '2020-12-31 12:10:28', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('6b4063ed1fad47ee8e25f553aaf2a81e', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_6b4063ed1fad47ee8e25f553aaf2a81e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '2', NULL, '2020-12-27 13:09:16', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('6c1ebec221154f38bf4a910cf48da48a', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_6c1ebec221154f38bf4a910cf48da48a_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '6', NULL, '2020-12-30 15:30:35', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('6d31c7915084491cb645700792ec9c47', '2', '删除', '/', NULL, '/', '删除', 'true', NULL, 'del', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '3', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('71df8da725434f17bbf8d8d2ff82b84d', '1', 'quartz任务管理', '/quartz/timTask', NULL, '/quartz/timTask', 'quartz任务管理', 'true', 'ProfileOutlined', 'timTask', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_', 'b77c6dfb6f2d4736b5616be4c4e00834', '0', '2', '2', NULL, '2020-12-30 23:42:34', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-27 21:15:11');
INSERT INTO `system_menu_copy1` VALUES ('7912c46721bd46f09c4d1a42bb233a52', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_7912c46721bd46f09c4d1a42bb233a52_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '2', NULL, '2020-12-27 13:23:54', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('7c92bda696ac441cbb807ed87b28f4f9', '2', '添加', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_7c92bda696ac441cbb807ed87b28f4f9_', 'ec442a81fa184af9a954efc4bc44eda3', '0', '3', '1', NULL, '2020-12-31 11:29:26', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('80d1c5cf67bd4452ad7fb0661206e4b5', '0', '系统管理', '/system', '/system/user', NULL, '系统管理', 'true', 'HomeOutlined', NULL, 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_', '1', '0', '1', '2', '测试', '2020-12-27 12:28:37', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:11:40');
INSERT INTO `system_menu_copy1` VALUES ('80deaf1606bb42cd88c1dba791ce05bf', '2', '详情', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_80deaf1606bb42cd88c1dba791ce05bf_', 'ec442a81fa184af9a954efc4bc44eda3', '0', '3', '4', NULL, '2020-12-31 11:29:49', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('82bd68fed9934717ad257ba7bf2d91a9', '2', '权限分配', '/', NULL, NULL, '权限分配', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_82bd68fed9934717ad257ba7bf2d91a9_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '7', NULL, '2020-12-28 21:19:59', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('8a3271ffe96b40399dd5bb3478702eda', '2', '详情', '/', NULL, '/', '详情', 'true', NULL, 'info', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '4', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('8ac1769930bf4db18f24a1e340f8a09a', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'stopOrRestore', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_8ac1769930bf4db18f24a1e340f8a09a_', '71df8da725434f17bbf8d8d2ff82b84d', '0', '3', '6', NULL, '2020-12-30 23:47:17', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('8b50ab464acf4211928bd2d9c433ee7a', '1', '首页', '/dashboard/welcome', NULL, '/dashboard/welcome', '首页', '0', 'AppstoreOutlined', NULL, 'menu_1_2b5eb81e26764b48a8cc27419bc56923_8b50ab464acf4211928bd2d9c433ee7a_', '2b5eb81e26764b48a8cc27419bc56923', '0', '2', '1', NULL, '2020-12-27 20:55:25', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:12:33');
INSERT INTO `system_menu_copy1` VALUES ('8f795f7f6d8b43f69ca9ef93aecb0d9d', '2', '编辑', '/', NULL, '/', '编辑', 'true', NULL, 'edit', NULL, 'e843b5fe9a7e425ca76c2a7c878ab83c', '0', NULL, '2', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('8fe7e8a690f44d6bac073617efaa345a', '2', '密码重置', '/', NULL, NULL, '密码重置', NULL, NULL, 'resetPwd', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_8fe7e8a690f44d6bac073617efaa345a_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '5', NULL, '2020-12-28 21:19:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('97be74ae0ae342d3ade81d4969a83b1b', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_97be74ae0ae342d3ade81d4969a83b1b_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '1', NULL, '2020-12-27 13:07:41', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('992f6a5e06ae48bca761d97746777a20', '2', '编辑', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'null992f6a5e06ae48bca761d97746777a20_', 'a254e7ccf3b347a792c33eb359e7d940', '0', '2', '5', NULL, '2022-03-20 09:40:50', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('9a77acd22b3a4508994f3563f430eb3a', '2', '代码生成', NULL, NULL, NULL, '代码生成', NULL, NULL, 'gencode', 'null9a77acd22b3a4508994f3563f430eb3a_', 'a254e7ccf3b347a792c33eb359e7d940', '0', '2', '1', NULL, '2022-03-20 09:20:30', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('a708fb5607404867928bb4e69d12edec', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_566e0e7f8703467fb823ad17e82ffafa_a708fb5607404867928bb4e69d12edec_', '566e0e7f8703467fb823ad17e82ffafa', '0', '3', '3', NULL, '2020-12-27 13:25:13', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('a841c0a4a9014efeae9846a9214dc539', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_a841c0a4a9014efeae9846a9214dc539_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '1', NULL, '2020-12-27 13:23:04', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('a8b47ec9f9044f9e9c84b4104d5e7fd0', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_a8b47ec9f9044f9e9c84b4104d5e7fd0_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '1', NULL, '2020-12-27 13:23:47', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('a9ae1e95305a4ffc9c81701b4c89703c', '0', '报表', '/chart', '/chart/workplace', NULL, '报表', 'false', 'ProjectOutlined', NULL, 'menu_1_a9ae1e95305a4ffc9c81701b4c89703c_', '1', '0', '1', '1.1', NULL, '2023-04-10 16:53:44', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('aa561cf56a5c468f90c458758d8da665', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_566e0e7f8703467fb823ad17e82ffafa_aa561cf56a5c468f90c458758d8da665_', '566e0e7f8703467fb823ad17e82ffafa', '0', '3', '1', NULL, '2020-12-27 13:24:57', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('ad664530d8df4a3cac9d8f2d07c256da', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_ad664530d8df4a3cac9d8f2d07c256da_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '5', NULL, '2020-12-28 21:30:28', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('ae75a81f9d68414bbb0edb4ea06da6e0', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_40509619bd82474a860b7e57cf6f7e33_ae75a81f9d68414bbb0edb4ea06da6e0_', '40509619bd82474a860b7e57cf6f7e33', '0', '3', '3', NULL, '2020-12-27 13:24:03', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('af1921aee9734911a724341bb50054bc', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_af1921aee9734911a724341bb50054bc_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '2', NULL, '2020-12-27 13:23:15', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('b1f15d18323042498080be61f550234e', '2', '分配权限', '/', NULL, NULL, '分配权限', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_b1f15d18323042498080be61f550234e_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '6', NULL, '2020-12-28 21:28:11', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('b35e1e0a8e6440128d1835391a6c67d4', '2', '预览', '/', NULL, NULL, '预览', NULL, NULL, 'viewCode', 'nullb35e1e0a8e6440128d1835391a6c67d4_', 'a254e7ccf3b347a792c33eb359e7d940', '0', '2', '3', NULL, '2022-03-20 09:38:54', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('b92e8200e0f14e8384b4bca11df965e4', '2', '详情', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_b92e8200e0f14e8384b4bca11df965e4_', '71df8da725434f17bbf8d8d2ff82b84d', '0', '3', '4', NULL, '2020-12-30 23:46:33', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('b93b5970dc4b44b582075726f34646c7', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_b93b5970dc4b44b582075726f34646c7_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '1', NULL, '2020-12-27 12:58:35', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('ba0e624e1b9647dcad7e1ed76603f796', '1', '预览模型', '/simulation/view', NULL, '/simulation/modelView', '预览模型', NULL, 'FundViewOutlined', NULL, 'menu_1_35ff387c6a94466a938580250be625e3_ba0e624e1b9647dcad7e1ed76603f796_', '35ff387c6a94466a938580250be625e3', '0', '2', '2.3', NULL, '2023-04-11 17:27:15', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('bb71d246f26246bf9eaa411a9f601feb', '2', '删除', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_bb71d246f26246bf9eaa411a9f601feb_', '71df8da725434f17bbf8d8d2ff82b84d', '0', '3', '3', NULL, '2020-12-30 23:46:18', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('c39ead786e8a4e5f844ef30a5882d232', '2', 'tj', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_c39ead786e8a4e5f844ef30a5882d232_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '1', NULL, '2020-12-27 12:52:41', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('cd3a93d7e84e4ae69c2aadb25d42f5d1', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_6a083f0aa6d44d88b53dbfb08c8d2355_cd3a93d7e84e4ae69c2aadb25d42f5d1_', '6a083f0aa6d44d88b53dbfb08c8d2355', '0', '3', '3', NULL, '2020-12-27 13:24:36', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('cdd48f81527946419d6807c7cfe03ac7', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_cdd48f81527946419d6807c7cfe03ac7_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '2', NULL, '2020-12-27 12:52:56', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('cddfffc5e14841a0918e03bb7fcb9b0e', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'stopOrRestore', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_cddfffc5e14841a0918e03bb7fcb9b0e_', 'ec442a81fa184af9a954efc4bc44eda3', '0', '3', '6', NULL, '2020-12-31 12:10:47', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('d1ccfade1a1b4a07b68c9865320d7d52', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_d1ccfade1a1b4a07b68c9865320d7d52_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '5', NULL, '2020-12-28 21:27:57', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('d3327d1977d7471d9faef1c75971d778', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_d3327d1977d7471d9faef1c75971d778_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '5', NULL, '2020-12-28 21:35:40', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('d5f7fbba01174e7480a37dcb52ac1867', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_d5f7fbba01174e7480a37dcb52ac1867_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '8', NULL, '2020-12-28 21:20:19', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('d8fb09bcbd1c4eada6ab0e1b5668ff57', '2', '权限分配', '/', NULL, NULL, '权限分配', NULL, NULL, 'assignAuth', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_d8fb09bcbd1c4eada6ab0e1b5668ff57_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '6', NULL, '2020-12-28 21:23:48', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('dc1bbb3d93f0451a839a63b127f164fa', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_dc1bbb3d93f0451a839a63b127f164fa_', 'dcf78e9836d64ea99b6a9e814a66d820', '0', '3', '3', NULL, '2020-12-27 13:23:28', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('dcf78e9836d64ea99b6a9e814a66d820', '1', '字典管理', '/system/dictionary', '', '/system/dictionary', '字典管理', 'true', 'ProfileOutlined', 'dictionary', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_dcf78e9836d64ea99b6a9e814a66d820_', '80d1c5cf67bd4452ad7fb0661206e4b5', '0', '2', '4', NULL, '2020-12-27 13:19:51', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-27 21:13:11');
INSERT INTO `system_menu_copy1` VALUES ('df36f5e57c2040dc85f9c13d7808c8b6', '2', 'bj', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_6a083f0aa6d44d88b53dbfb08c8d2355_df36f5e57c2040dc85f9c13d7808c8b6_', '6a083f0aa6d44d88b53dbfb08c8d2355', '0', '3', '2', NULL, '2020-12-27 13:24:27', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('e080747853a6432b8d7bdad81099be40', '2', '添加', '/', NULL, NULL, '添加', NULL, NULL, 'add', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_e080747853a6432b8d7bdad81099be40_', '71df8da725434f17bbf8d8d2ff82b84d', '0', '3', '1', NULL, '2020-12-30 23:45:11', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('e327d159dcfa4e948380b7ba6072335c', '2', '编辑', '/', NULL, NULL, '编辑', NULL, NULL, 'edit', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_e327d159dcfa4e948380b7ba6072335c_', '71df8da725434f17bbf8d8d2ff82b84d', '0', '3', '2', NULL, '2020-12-30 23:46:10', '1', '9f7969654fae4d4ca12c71d8a6cbe621', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('e843b5fe9a7e425ca76c2a7c878ab83c', '1', '路面详情', '/example/tdemo', NULL, '/example/tdemo', '路面详情', 'true', 'FileSearchOutlined', 'tdemo', NULL, '35ff387c6a94466a938580250be625e3', '0', NULL, '2.2', '', '2022-03-24 00:10:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2023-04-11 17:16:01');
INSERT INTO `system_menu_copy1` VALUES ('eae7e221e92d4b8d8fa6235cbf269f55', '2', 'sc', '/', NULL, NULL, '删除', NULL, NULL, 'del', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_0e6a0155c44341b48e41a664662f41c3_eae7e221e92d4b8d8fa6235cbf269f55_', '0e6a0155c44341b48e41a664662f41c3', '0', '3', '3', NULL, '2020-12-27 13:18:06', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('ebb7fa8bc47242a2ab99ea6d17d0727f', '2', '执行', '/', NULL, NULL, '执行', NULL, NULL, 'execution', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_71df8da725434f17bbf8d8d2ff82b84d_ebb7fa8bc47242a2ab99ea6d17d0727f_', '71df8da725434f17bbf8d8d2ff82b84d', '0', '3', '5', NULL, '2020-12-30 23:46:59', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2020-12-31 10:10:29');
INSERT INTO `system_menu_copy1` VALUES ('ec442a81fa184af9a954efc4bc44eda3', '1', '业务任务案例', '/quartz/busTask', NULL, '/quartz/busTask', '业务任务案例', 'true', 'BarsOutlined', 'busTask', 'menu_1_b77c6dfb6f2d4736b5616be4c4e00834_ec442a81fa184af9a954efc4bc44eda3_', 'b77c6dfb6f2d4736b5616be4c4e00834', '0', '2', '3', NULL, '2020-12-31 11:28:34', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2022-03-27 21:15:18');
INSERT INTO `system_menu_copy1` VALUES ('f34a435bc0a5489f81749a6b102c3ba5', '2', 'xq', '/', NULL, NULL, '详情', NULL, NULL, 'info', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_f34a435bc0a5489f81749a6b102c3ba5_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '4', NULL, '2020-12-27 13:05:44', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('f6d9671f77c84b53b1b8ee150770aa0b', '2', '导入', NULL, NULL, NULL, '导入', NULL, NULL, 'import', 'nullf6d9671f77c84b53b1b8ee150770aa0b_', 'a254e7ccf3b347a792c33eb359e7d940', '0', '2', '2', NULL, '2022-03-20 09:21:02', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('f7b434433fed4579a8846a5444ef5d6e', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_e893c10f9ff441b4b7481075b1941a41_f7b434433fed4579a8846a5444ef5d6e_', 'e893c10f9ff441b4b7481075b1941a41', '0', '3', '5', NULL, '2020-12-28 21:23:34', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('f827689a435f437abf0a3dc958280860', '2', '状态管理', '/', NULL, NULL, '状态管理', NULL, NULL, 'status', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_6a083f0aa6d44d88b53dbfb08c8d2355_f827689a435f437abf0a3dc958280860_', '6a083f0aa6d44d88b53dbfb08c8d2355', '0', '3', '5', NULL, '2020-12-28 21:44:57', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_menu_copy1` VALUES ('f9ed6e5b12bf4cb9a306c3fc654d64b2', '2', '导出', '/', NULL, NULL, '导出', NULL, NULL, 'download', 'menu_1_80d1c5cf67bd4452ad7fb0661206e4b5_d6a49049221a461b8875bfe64c977008_f9ed6e5b12bf4cb9a306c3fc654d64b2_', 'd6a49049221a461b8875bfe64c977008', '0', '3', '9', NULL, '2020-12-30 13:39:43', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '2020-12-30 13:40:08');
COMMIT;

-- ----------------------------
-- Table structure for system_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_organize`;
CREATE TABLE `system_organize` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `org_cascade` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '级联字段',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织名称',
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织简称',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织编码',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级id',
  `level_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `depart_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `direct_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `branch_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_organize
-- ----------------------------
BEGIN;
INSERT INTO `system_organize` VALUES ('367bc284f13c4316922c494d9bb1fab9', '1', 'org367bc284f13c4316922c494d9bb1fab9_', '青锋信息有限公司', '青锋信息有限公司', NULL, '1', '1', '0', '1', NULL, NULL, NULL, '', '2020-09-28 10:37:03', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2020-09-28 14:45:19');
INSERT INTO `system_organize` VALUES ('36ef711413d84b30b4bc6d41d628bf7b', '1', 'org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_', '小青娱乐分公司', '小青娱乐分公司', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '8', NULL, NULL, NULL, '', '2020-10-01 18:19:26', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2020-10-01 18:19:26');
INSERT INTO `system_organize` VALUES ('66568bb579874e1396ea0e297e112b68', '1', 'org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_66568bb579874e1396ea0e297e112b68_', '娱乐酒吧', '娱乐酒吧', NULL, '36ef711413d84b30b4bc6d41d628bf7b', '3', '0', '1', NULL, NULL, NULL, '', '2020-10-01 18:19:53', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2021-03-17 11:37:02');
INSERT INTO `system_organize` VALUES ('9f7969654fae4d4ca12c71d8a6cbe621', '1', 'org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_', '人事部', '人事部', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '5', NULL, NULL, NULL, '', '2020-09-28 10:37:58', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_organize` VALUES ('a8ccfb355ec748579f8c3a3312e96871', '1', 'org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '财务部', '财务部', NULL, '367bc284f13c4316922c494d9bb1fab9', '2', '0', '6', NULL, NULL, NULL, '', '2020-09-28 10:37:58', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_organize` VALUES ('fc49f352b956496a9c9be717529e9e9a', '1', 'org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '娱乐KTV', '娱乐KTV', NULL, '36ef711413d84b30b4bc6d41d628bf7b', '3', '0', '1', NULL, NULL, NULL, '', '2020-10-01 18:19:53', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_organize_role
-- ----------------------------
DROP TABLE IF EXISTS `system_organize_role`;
CREATE TABLE `system_organize_role` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `organize_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_organize_role
-- ----------------------------
BEGIN;
INSERT INTO `system_organize_role` VALUES ('151ce73dfaee4fcd820d8427857973ad', '9f7969654fae4d4ca12c71d8a6cbe621', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '2022-03-15 22:59:02', NULL);
INSERT INTO `system_organize_role` VALUES ('4f5c874141ee4bd3ae50fb8bc624e6fc', '9f7969654fae4d4ca12c71d8a6cbe621', 'b845d68a12f34dab88236bd45c8e3f90', '1', '2022-03-15 22:59:02', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色简称',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
BEGIN;
INSERT INTO `system_role` VALUES ('955390c0f7a84b76b2d155a4d44ca6ce', '1', '系统角色', '系统角色', '0', '1', '4', '2020-09-23 22:28:13', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-10 22:36:56');
INSERT INTO `system_role` VALUES ('b845d68a12f34dab88236bd45c8e3f90', '1', '组织角色', '组织角色', '0', '3', '', '2020-09-28 17:15:06', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2020-12-10 23:26:47');
COMMIT;

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `menu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_role_menu` VALUES ('04e74ea804c64fb3a33436d0a9e729a4', '955390c0f7a84b76b2d155a4d44ca6ce', 'a8b47ec9f9044f9e9c84b4104d5e7fd0', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('05cd42330d7b4b93b1c7d20910add6a4', 'b845d68a12f34dab88236bd45c8e3f90', 'dcf78e9836d64ea99b6a9e814a66d820', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('089bc269ca9e4458af000a71eb357979', '955390c0f7a84b76b2d155a4d44ca6ce', '6b4063ed1fad47ee8e25f553aaf2a81e', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('08d2e8b9fffc4b5c94c778858175e16e', 'b845d68a12f34dab88236bd45c8e3f90', '0e6a0155c44341b48e41a664662f41c3', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('08e1e7cf9e6e457aa6788b3422f34814', 'b845d68a12f34dab88236bd45c8e3f90', 'f9ed6e5b12bf4cb9a306c3fc654d64b2', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('14e0faf27a7443a29719f586634e6a67', '955390c0f7a84b76b2d155a4d44ca6ce', 'eb55f3c2ad834c1f9c49250d1c3b9a4d', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('158c1b03aca6401b8215345d295423c2', '955390c0f7a84b76b2d155a4d44ca6ce', 'af1921aee9734911a724341bb50054bc', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('1939c5fc6f8e49e3b8437245cc5eba3f', '955390c0f7a84b76b2d155a4d44ca6ce', 'dc1bbb3d93f0451a839a63b127f164fa', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('19c26527ef8249e7b2b9f005b0758c00', 'b845d68a12f34dab88236bd45c8e3f90', 'df36f5e57c2040dc85f9c13d7808c8b6', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('1b3ae6fabea84540b5db8e4c1dbeec4c', '955390c0f7a84b76b2d155a4d44ca6ce', '5b8f42cadc944aa4a98641557a8e2a34', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('2030957e404545b9a8166a7e744a0e2c', 'b845d68a12f34dab88236bd45c8e3f90', 'a708fb5607404867928bb4e69d12edec', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('206c212ff5af486bb70be2d135c44efc', 'b845d68a12f34dab88236bd45c8e3f90', 'e893c10f9ff441b4b7481075b1941a41', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('2252e9b1c50e461b9f45365f596b5c83', 'b845d68a12f34dab88236bd45c8e3f90', 'a8b47ec9f9044f9e9c84b4104d5e7fd0', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('2260ca6e459f40c8ae9e0322d79e8552', '955390c0f7a84b76b2d155a4d44ca6ce', '1da885461bf442b898eca8d07b80ac77', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('22d1df00b7784c2a8b087916eb916e04', '955390c0f7a84b76b2d155a4d44ca6ce', 'b1f15d18323042498080be61f550234e', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('2444ceca9e164432ba438fd67471cfe1', 'b845d68a12f34dab88236bd45c8e3f90', 'ec6a036eaf424f04952a82604346f17c', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('269901287fe64820b3b42c96ef210f17', 'b845d68a12f34dab88236bd45c8e3f90', 'd1ccfade1a1b4a07b68c9865320d7d52', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('271dfdbeae244be49c7f66638aa57410', '955390c0f7a84b76b2d155a4d44ca6ce', 'e843b5fe9a7e425ca76c2a7c878ab83c', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('296006ee67df4673bdb66c4216a218ad', 'b845d68a12f34dab88236bd45c8e3f90', 'b93b5970dc4b44b582075726f34646c7', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('2c6f00e1ff2440fca27421610f0b81fa', '955390c0f7a84b76b2d155a4d44ca6ce', '6d31c7915084491cb645700792ec9c47', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('3192d8248ce94be8a09883ca68551c77', '955390c0f7a84b76b2d155a4d44ca6ce', '7912c46721bd46f09c4d1a42bb233a52', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('3c606b3c8bf84db3a31337cf200dab98', 'b845d68a12f34dab88236bd45c8e3f90', 'ad664530d8df4a3cac9d8f2d07c256da', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('3ed8dfb133d747c1b19a0117bd221e0f', '955390c0f7a84b76b2d155a4d44ca6ce', '8a3271ffe96b40399dd5bb3478702eda', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('3ee8dc91fba743cab4bbb2450eb2ce4f', 'b845d68a12f34dab88236bd45c8e3f90', '17b8a177454140079b97602b5496e369', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('436161ef88ae4bc69ab6bd355bd02253', '955390c0f7a84b76b2d155a4d44ca6ce', '239336ba333e44808aa64169814f7aaa', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('467c4e3769254922ad2fe87a2e1ed9df', 'b845d68a12f34dab88236bd45c8e3f90', 'd5f7fbba01174e7480a37dcb52ac1867', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('4acf8fbd75664754ab15e3903b8a7620', '955390c0f7a84b76b2d155a4d44ca6ce', '2f48e9a6dbf64f9ea052868bdb1da286', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('4c8fd6913757438aa8dab37e5c85d947', '955390c0f7a84b76b2d155a4d44ca6ce', '6c1ebec221154f38bf4a910cf48da48a', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('4cdf70eff1454eef85ad69fbf7437a83', 'b845d68a12f34dab88236bd45c8e3f90', '7912c46721bd46f09c4d1a42bb233a52', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('4f1d05fb41a84b46840c15d917ef1581', '955390c0f7a84b76b2d155a4d44ca6ce', 'd1ccfade1a1b4a07b68c9865320d7d52', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('50e337929f854cedb7ffc4f5a0725cc5', '955390c0f7a84b76b2d155a4d44ca6ce', '40509619bd82474a860b7e57cf6f7e33', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('53e7c80d8cce447cbead06cc368fb137', 'b845d68a12f34dab88236bd45c8e3f90', 'ae75a81f9d68414bbb0edb4ea06da6e0', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('59e7e7b133674832b99325d8437e9205', '955390c0f7a84b76b2d155a4d44ca6ce', '6140f94adc314920b43bc68a2cbe02cb', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('5abd48739afa4176a3eb414bf9af36eb', '955390c0f7a84b76b2d155a4d44ca6ce', 'ae75a81f9d68414bbb0edb4ea06da6e0', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('601f6474560a4d99876370bf6a852518', '955390c0f7a84b76b2d155a4d44ca6ce', '17b8a177454140079b97602b5496e369', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('63fa89cacda9409189e13eb578b84c20', 'b845d68a12f34dab88236bd45c8e3f90', '26fd01c0ebb24a26bd93f2757e18f479', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('64ae63b5497540a79ca44d575ef051c5', 'b845d68a12f34dab88236bd45c8e3f90', '6b4063ed1fad47ee8e25f553aaf2a81e', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('681be977a34746378e2fb270aef794b0', 'b845d68a12f34dab88236bd45c8e3f90', '59c2230ec03d4aad978337c161e51477', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('6996f4270f8d4d92bde23404c0623073', 'b845d68a12f34dab88236bd45c8e3f90', 'd3327d1977d7471d9faef1c75971d778', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('6b8f62342fc14b9ea4afbeff2ac534d0', 'b845d68a12f34dab88236bd45c8e3f90', '6c1ebec221154f38bf4a910cf48da48a', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('6f84c75e86c64e6a9d107de531d8bcda', 'b845d68a12f34dab88236bd45c8e3f90', '40509619bd82474a860b7e57cf6f7e33', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('72016c8400394b5398b323ad763138d4', '955390c0f7a84b76b2d155a4d44ca6ce', '80d1c5cf67bd4452ad7fb0661206e4b5', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('7e9bac9d4abf4a69a9ed25a2a9276b3e', 'b845d68a12f34dab88236bd45c8e3f90', '4e02de211df5451aa9a75c0ecd0c463a', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('7f3271e5f2f943918aedaec4b54f6c61', 'b845d68a12f34dab88236bd45c8e3f90', '41da59e3ea7947518776248a0cd48564', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('83cfce383d6642628b5786b57e736280', 'b845d68a12f34dab88236bd45c8e3f90', '82bd68fed9934717ad257ba7bf2d91a9', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('8c3bf22498e7481dafdaa46f2e63309f', '955390c0f7a84b76b2d155a4d44ca6ce', 'dcf78e9836d64ea99b6a9e814a66d820', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('929825750e17407e84eb8e8047e1c355', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('93c3e0c186fd4da39b38cda45fbed8a6', 'b845d68a12f34dab88236bd45c8e3f90', '0a7931ffa3c04bacaadfac1838b47a0d', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('95a3be0e5e814438924c265f610d3a05', '955390c0f7a84b76b2d155a4d44ca6ce', 'd3327d1977d7471d9faef1c75971d778', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('97306c33b15c49078aae9190a3747e88', 'b845d68a12f34dab88236bd45c8e3f90', '362250de48c947d38f07715d76ae5b4f', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('9baab590dde74a0ca8bca69aba74fc42', 'b845d68a12f34dab88236bd45c8e3f90', '3e7387978dfb47cf80f2e7e3329f74b7', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('9c17b97d86414e0bb5fd0a9fb20de752', 'b845d68a12f34dab88236bd45c8e3f90', 'f34a435bc0a5489f81749a6b102c3ba5', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('9e2e8a3d543042b0991801631eb007e0', 'b845d68a12f34dab88236bd45c8e3f90', '6300d120f23149ab91f616e2fa70ab3a', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('9f5f36d957634496999a7bb4a5177725', '955390c0f7a84b76b2d155a4d44ca6ce', '0e6a0155c44341b48e41a664662f41c3', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('a05d24ec4c8e4df5860e90e05b868af6', 'b845d68a12f34dab88236bd45c8e3f90', 'aa561cf56a5c468f90c458758d8da665', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('a08a9c41e0ea43838ad8af489b3547a5', '955390c0f7a84b76b2d155a4d44ca6ce', '97be74ae0ae342d3ade81d4969a83b1b', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('a1be121ba3cb4aaabb3c55465831f23f', 'b845d68a12f34dab88236bd45c8e3f90', '8b50ab464acf4211928bd2d9c433ee7a', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('a3feca3d52794512a66fbf609f5e9bd5', 'b845d68a12f34dab88236bd45c8e3f90', 'f7b434433fed4579a8846a5444ef5d6e', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('a6b41da76f7a4ca99d3cd240673fc29d', '955390c0f7a84b76b2d155a4d44ca6ce', '26fd01c0ebb24a26bd93f2757e18f479', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('aca1f577faae4f778c31c6557d7177d2', '955390c0f7a84b76b2d155a4d44ca6ce', 'a841c0a4a9014efeae9846a9214dc539', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('b19c127a979c43019f417100f87aa692', 'b845d68a12f34dab88236bd45c8e3f90', 'f827689a435f437abf0a3dc958280860', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('b29e5b0f6ce6413b86412143707a941c', 'b845d68a12f34dab88236bd45c8e3f90', 'af1921aee9734911a724341bb50054bc', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('b3703013e26749dbb758a003dc5a13ac', 'b845d68a12f34dab88236bd45c8e3f90', 'eae7e221e92d4b8d8fa6235cbf269f55', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('b5495e4e49d842fc983071cf13c61731', '955390c0f7a84b76b2d155a4d44ca6ce', '1f34120ce93c452dbec4202206bc0b4a', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('bb6d66e477a047a4b5ede0e46f120173', 'b845d68a12f34dab88236bd45c8e3f90', 'd8fb09bcbd1c4eada6ab0e1b5668ff57', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('c14ec8c30c9f4047818debe6a33ee315', 'b845d68a12f34dab88236bd45c8e3f90', '2f48e9a6dbf64f9ea052868bdb1da286', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('c235d57089e64862908f6824e5a2fedd', 'b845d68a12f34dab88236bd45c8e3f90', '40671f8311954515a5c0d6f67c7ff09d', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('c492c67b21be40949e9a7073857942c6', 'b845d68a12f34dab88236bd45c8e3f90', '6a083f0aa6d44d88b53dbfb08c8d2355', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('c6baa48687914941a5925436de4bb712', 'b845d68a12f34dab88236bd45c8e3f90', 'cd3a93d7e84e4ae69c2aadb25d42f5d1', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('c705db270052421fbed26794db43aaf2', 'b845d68a12f34dab88236bd45c8e3f90', '239336ba333e44808aa64169814f7aaa', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('ce46fbb2e7c14f2c921fdb304100488f', 'b845d68a12f34dab88236bd45c8e3f90', '02144c3e53704b77b5a2bb846ce139f3', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('cf5efcb65fe541458fd2217b2b1149ec', '955390c0f7a84b76b2d155a4d44ca6ce', 'ad664530d8df4a3cac9d8f2d07c256da', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('d159ee4b9a45488fb858ef11d5b9250d', '955390c0f7a84b76b2d155a4d44ca6ce', '35ff387c6a94466a938580250be625e3', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('d6a79d6f562d4ffa9391ca0faf978b21', 'b845d68a12f34dab88236bd45c8e3f90', '566e0e7f8703467fb823ad17e82ffafa', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('d74d54ba87ca4642b39f81bc82b82f12', 'b845d68a12f34dab88236bd45c8e3f90', 'cdd48f81527946419d6807c7cfe03ac7', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('d85b0e0e69f2485bb301bf81e7d39e17', '955390c0f7a84b76b2d155a4d44ca6ce', 'eae7e221e92d4b8d8fa6235cbf269f55', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('daff4b00087d44fab0bcd52fe84e5fee', 'b845d68a12f34dab88236bd45c8e3f90', '119ebce29dad4c34a31d595361ccbffa', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('e01065d9bdf746fa8550a5a942acbac0', 'b845d68a12f34dab88236bd45c8e3f90', 'b1f15d18323042498080be61f550234e', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('e286206ddd0f4283af167a5b580e006b', '955390c0f7a84b76b2d155a4d44ca6ce', 'a9ae1e95305a4ffc9c81701b4c89703c', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('e35bbff21ec1446bac0fba83a01cf04b', 'b845d68a12f34dab88236bd45c8e3f90', '2b5eb81e26764b48a8cc27419bc56923', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('e7e7a44b8b204e028aa00adddcb2c694', 'b845d68a12f34dab88236bd45c8e3f90', '97be74ae0ae342d3ade81d4969a83b1b', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('ed50939194364610af2a87e29cf2e086', 'b845d68a12f34dab88236bd45c8e3f90', '8fe7e8a690f44d6bac073617efaa345a', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('edf4d74154784bb28ef4edc82c324184', '955390c0f7a84b76b2d155a4d44ca6ce', '8f795f7f6d8b43f69ca9ef93aecb0d9d', '1', '2023-04-12 12:49:09', NULL);
INSERT INTO `system_role_menu` VALUES ('f3ffde1247284c4fa37ddadb0fa9cf55', 'b845d68a12f34dab88236bd45c8e3f90', '3ad803ca5e814dffa9f3ec90d2c0b385', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('f4fcd4c515bb462cb53455a6abfecf94', 'b845d68a12f34dab88236bd45c8e3f90', 'a841c0a4a9014efeae9846a9214dc539', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('f58dd47de0004f39ab1d0b05162a2798', 'b845d68a12f34dab88236bd45c8e3f90', '4ceba49ff1f74d149a292f4c741a67f5', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('f91c4237511645a5bbd84de6f6976011', 'b845d68a12f34dab88236bd45c8e3f90', 'dc1bbb3d93f0451a839a63b127f164fa', '1', '2022-03-15 22:06:11', NULL);
INSERT INTO `system_role_menu` VALUES ('facb3655d2e44b938018bd0f3c64582f', 'b845d68a12f34dab88236bd45c8e3f90', '4ef1b5ba5c91469ebbf89f5ccec045d6', '1', '2022-03-15 22:06:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称',
  `login_password` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电子邮箱',
  `birth_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出生日期',
  `live_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '居住地',
  `birth_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '籍贯地址',
  `head_address` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `motto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '座右铭',
  `last_login_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `iprealaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信id',
  `init_password` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否初始密码',
  `pwd_error_num` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码输入错误次数',
  `pwd_error_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码输入错误时间',
  `theme_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `depart_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `direct_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `branch_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token_refresh_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_organize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建组织',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
BEGIN;
INSERT INTO `system_user` VALUES ('1', '0', 'admin', '$2a$10$R5sTyyPB4sRn1UzzcaHkuODnKJ2WYHKEvV7oG44aJ57q.zUdCSL92', '管理员', '1', '15552881678', 'aaxtaxt@163.com', '2022-03-21', '12', '2', '', '2', '2021-02-18 18:45:13', 'Chrome 8', 'Windows 10', '127.0.0.1', '内网IP', '0', '13', NULL, NULL, '0', '2021-02-18 18:45:13', '1', NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOjM2N2JjMjg0ZjEzYzQzMTY5MjJjNDk0ZDliYjFmYWI5Iiwic3ViIjoiYWRtaW4iLCJpc3MiOiJ2dWUiLCJpYXQiOjE2MTM2NDUxMTMsImV4cCI6MTYxMzY0NjkxM30.tfC7TFkInxYldGq3InjF-6iBggwBQHgtK4Mf5Ol_IRY', '2021-02-18 18:45:14', '23', '2020-09-28 11:09:24', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-21 23:50:37');
INSERT INTO `system_user` VALUES ('1b5133a874a649499768bb46257b6c40', '1', 'ceshi123', '', '99888891', '2', '18353192647', 'ww@ww.qq', '2021-05-22', '5', '5', NULL, '5', NULL, NULL, NULL, NULL, NULL, '0', '5', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '2021-05-22 10:41:18', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2021-05-22 11:40:25');
INSERT INTO `system_user` VALUES ('1d69f8d83e054c63813ac4d31ae49b41', '1', '测试009', 'Bn4zbtl27vQngVFSZYtO3w==', '测试009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 22:43:45', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2020-12-23 22:43:45');
INSERT INTO `system_user` VALUES ('2', '1', '2', '2', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2', '2', '2', '2');
INSERT INTO `system_user` VALUES ('256064363106405d825d819912ea563d', '1', 'qingfeng002', 'VjJVbF5ZvKyz4dmKbhbRqg==', 'qingfeng002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 10:37:53', 'Chrome', 'Windows 10', '127.0.0.1', '内网IP', '0', NULL, NULL, NULL, '0', '2020-12-30 10:37:53', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 10:16:19', '1', '367bc284f13c4316922c494d9bb1fab9', '256064363106405d825d819912ea563d', '2020-12-30 10:37:53');
INSERT INTO `system_user` VALUES ('34e12da0229e4aa88d4e932fecb1f844', '1', '1212', '$2a$10$we1sBl/0mNeu8uTryL0D9u0yHOco2wysCyuTTEPuaKnv/k2yjzEp6', '326', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-03-13 20:52:24', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-13 20:52:32');
INSERT INTO `system_user` VALUES ('4b92f0fa78cc43fcb3a09eb873c9cad1', '1', '李四', 'E/MR1IypDCfOXykUDB+5/Q==', '李四', '2', '1', '1', '1', '1', '1', NULL, '1', '2021-01-06 17:10:42', 'Chrome', 'Windows 10', '127.0.0.1', '内网IP', '0', '1', NULL, NULL, '0', '2021-01-06 17:10:42', '1', NULL, NULL, NULL, '', '2021-01-08 18:04:55', '112', '2020-12-17 17:29:46', '1', '367bc284f13c4316922c494d9bb1fab9', '4b92f0fa78cc43fcb3a09eb873c9cad1', '2021-01-08 18:04:55');
INSERT INTO `system_user` VALUES ('617cc12d723245858350c0043a772c40', '1', '111', '$2a$10$0Nvh4FImDlYU7EdWTl9hSeJOOzQ7WQ69gQf.CnLVRujXXs.Gw8RTm', '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-13 15:12:31', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-13 20:53:55');
INSERT INTO `system_user` VALUES ('689af338538541bca3359b293fcaef93', '1', '111111', '$2a$10$Ta23.BnxklnwfzIIiG6Q3.Jh0KQXX/onxkjj828qLvlaROsiYpR4.', '111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 23:18:15', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('6905a03a0f5748ca984e008cb9d7ffff', '1', 'rsld', '$2a$10$KK.ph4.wyI5xswxu9D4HZedqD7AZZ4NEcuBPiN777kPflKTkKzlXy', '人事领导', '1', '18363819204', 'axtaxt@1k3.cls', '2020-01-01', '济南', '济南', '', '我是英雄', NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, NULL, '0', '2020-10-01 20:45:37', '1', NULL, NULL, NULL, NULL, NULL, '济南', '2020-09-28 11:14:28', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2021-06-20 23:41:21');
INSERT INTO `system_user` VALUES ('85e207fe792b41788e99c2685bf5554b', '1', 'qingfeng001', '$2a$10$ddPkRbWW8fdc5mdoa.uYbuY1RXc9Jn.NXJcSI63CLSLQpZcbmFKKm', 'qingfeng001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 16:52:50', 'Chrome', 'Windows 10', '127.0.0.1', '内网IP', '0', NULL, NULL, NULL, '0', '2020-12-30 16:52:50', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 10:16:07', '1', '367bc284f13c4316922c494d9bb1fab9', '85e207fe792b41788e99c2685bf5554b', '2021-06-20 23:46:12');
INSERT INTO `system_user` VALUES ('8786cc08c0864653a1e8609ae08cec28', '1', 'qingfeng', 'maBV6z4oK11rxq2LS3Vhhw==', '青锋', '1', '', '', '', '', '', '', '', '2020-10-08 16:12:16', 'Firefox 8', 'Windows 10', '127.0.0.1', '内网IP', '0', '3', NULL, NULL, '0', '2020-10-08 16:12:16', '1', NULL, NULL, NULL, NULL, NULL, '', '2020-09-28 10:38:51', '1', '367bc284f13c4316922c494d9bb1fab9', '8786cc08c0864653a1e8609ae08cec28', '2020-10-08 16:12:16');
INSERT INTO `system_user` VALUES ('8acaccef6d834cdea02e17a0741d0bee', '1', '12', '$2a$10$sSR7KR7sfOi7KQEmfjya5.fNgZy6JE4NwDdFcivznV.mcfmatG/NC', '0', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-03-13 16:57:48', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2022-03-13 20:52:09');
INSERT INTO `system_user` VALUES ('8c64320bba8443fd80ddebc558ff8e4c', '1', '张三', 'A3uVcOKOyx+QBbPvfFjUGQ==', '张三', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 17:05:50', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, '2020-12-17 17:05:50');
INSERT INTO `system_user` VALUES ('a431b847910e429597af749720c6d739', '1', '666666', '$2a$10$Wv9pNUWJrF3HP06NNPIsG.h/nfi43/JBOLsWiz9RgbEa4SEIUN7o2', '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '666666', '2021-03-14 22:26:26', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('aa5bd62fad59490d84d0502e2d609392', '1', 'rszy', 'e10adc3949ba59abbe56e057f20f883e', '人事职员', '1', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '0', '2', NULL, NULL, '0', '2020-09-28 14:40:46', '1', NULL, NULL, NULL, NULL, NULL, '', '2020-09-28 11:14:09', '1', '367bc284f13c4316922c494d9bb1fab9', 'aa5bd62fad59490d84d0502e2d609392', '2020-09-28 14:40:46');
INSERT INTO `system_user` VALUES ('c5ec79344ac94585807793428a92342c', '1', '88888888', '$2a$10$wBiwZR1dMrLCqZO4VRpzWumPN4ExOcZQoLJpA9sZcwWqk2PS5FB/W', '88888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 22:41:37', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('df564cde5fab4f5286fdce7ef9f01f01', '1', '测试头像', '$2a$10$cIQEcBo16EWMTycihldMre7XqakeJH3Uen3IkjqfTGUgsTqRsNz/e', '测试头像', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2', '2020-12-17 22:08:43', '1', '367bc284f13c4316922c494d9bb1fab9', '1', '2021-05-22 16:54:59');
INSERT INTO `system_user` VALUES ('e1c385bc3e7b4ddb8e8fbb77186d8e23', '1', '7777777', '$2a$10$NwBNl8lG1GpF1pziqSPXLO8tAumck6wcATkj2HSWTAnnJbm2FGEA2', '7777777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 22:42:09', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
INSERT INTO `system_user` VALUES ('ef837d56af5b418da600b3992c41b14f', '1', '7', '7', '7', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-03-13 16:30:42', '1', '367bc284f13c4316922c494d9bb1fab9', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_user_group
-- ----------------------------
DROP TABLE IF EXISTS `system_user_group`;
CREATE TABLE `system_user_group` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名称',
  `group_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_group
-- ----------------------------
BEGIN;
INSERT INTO `system_user_group` VALUES ('1af5cdd3bed74bebbfe88d9402b79c33', '1b5133a874a649499768bb46257b6c40', '99888891', '73f06bcab68344d7b5b07738cd45c164', '1', '2021-05-27 00:03:06', NULL);
INSERT INTO `system_user_group` VALUES ('2876fb59981f4e4d8d92a3eb961c0575', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', 'e6571404cc714d9b9e87d0b772caefeb', '1', '2021-05-27 00:12:01', NULL);
INSERT INTO `system_user_group` VALUES ('292c64f865c242f7a934d5ea632c8ad8', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '254b5310e8984767bbf77d03defd205d', '1', '2021-05-27 00:09:15', NULL);
INSERT INTO `system_user_group` VALUES ('2fc14a9ed6e945329b14ea765a9ea9dd', '1', '管理员', '6fab38e782d247c19d80cf6c75bc54ad', '1', '2022-03-15 00:05:01', NULL);
INSERT INTO `system_user_group` VALUES ('4fa5476a425c4841b2648a1fadf6eea9', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '49e73cf347024e81be0c9b2d5dcc781d', '1', '2022-03-15 00:09:42', NULL);
INSERT INTO `system_user_group` VALUES ('5448c0d728774c23a07c6d38f80840bb', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '03e7c1ed01524305b928c8abcec662d6', '1', '2021-05-27 00:14:30', NULL);
INSERT INTO `system_user_group` VALUES ('551438f19ee04c39af3c5dbf59838267', 'df564cde5fab4f5286fdce7ef9f01f01', '测试头像', '03e7c1ed01524305b928c8abcec662d6', '1', '2021-05-27 00:14:30', NULL);
INSERT INTO `system_user_group` VALUES ('5d54437ae87348d595120a52f8cb7b6e', '1b5133a874a649499768bb46257b6c40', '99888891', '254b5310e8984767bbf77d03defd205d', '1', '2021-05-27 00:09:15', NULL);
INSERT INTO `system_user_group` VALUES ('638541d733a340d4ae90d59239743934', 'df564cde5fab4f5286fdce7ef9f01f01', '测试头像', '6e58420b13ce46df953c8e5cfa801d97', '1', '2021-03-22 00:23:09', NULL);
INSERT INTO `system_user_group` VALUES ('6dc3cc1d0c724a329839179f28d94f08', '1b5133a874a649499768bb46257b6c40', '99888891', '959cec38718c44db834e7d5b7c6a7034', '1', '2021-10-11 22:36:49', NULL);
INSERT INTO `system_user_group` VALUES ('71db7e81afc34ebb9ec576419758469c', '6905a03a0f5748ca984e008cb9d7ffff', '人事领导', 'bb1d32508d3348b4991e48ead541c33f', '1', '2021-09-21 23:59:14', NULL);
INSERT INTO `system_user_group` VALUES ('76a65a42ee3f47ff85e90df62c7ef13e', '1', '管理员', '49e73cf347024e81be0c9b2d5dcc781d', '1', '2022-03-15 00:09:42', NULL);
INSERT INTO `system_user_group` VALUES ('78e2730998fc4cf084cb669db81c3180', 'df564cde5fab4f5286fdce7ef9f01f01', '测试头像', '5f98696f710f40e1a6d73df7ad1d8f86', '1', '2021-03-22 00:26:38', NULL);
INSERT INTO `system_user_group` VALUES ('8acfda9cea8e47f99a068c9d2059f6a3', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '6fab38e782d247c19d80cf6c75bc54ad', '1', '2022-03-15 00:05:01', NULL);
INSERT INTO `system_user_group` VALUES ('924d108f1bcd4fc6a487d139ca590faa', '1b5133a874a649499768bb46257b6c40', '99888891', '6fab38e782d247c19d80cf6c75bc54ad', '1', '2022-03-15 00:05:01', NULL);
INSERT INTO `system_user_group` VALUES ('924ff4fae37647538c420c9d4f611c2b', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '73f06bcab68344d7b5b07738cd45c164', '1', '2021-05-27 00:03:06', NULL);
INSERT INTO `system_user_group` VALUES ('ab472617fbc7451c982090bfe273fe13', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '5f98696f710f40e1a6d73df7ad1d8f86', '1', '2021-03-22 00:26:38', NULL);
INSERT INTO `system_user_group` VALUES ('acb5ca728620480f9bf2b8dba4caadba', 'aa5bd62fad59490d84d0502e2d609392', '人事职员', 'bb1d32508d3348b4991e48ead541c33f', '1', '2021-09-21 23:59:14', NULL);
INSERT INTO `system_user_group` VALUES ('d66982d9fff546d1a2703aeb43ce8061', 'df564cde5fab4f5286fdce7ef9f01f01', '测试头像', 'e6571404cc714d9b9e87d0b772caefeb', '1', '2021-05-27 00:12:01', NULL);
INSERT INTO `system_user_group` VALUES ('d8114297320d4c04baca8b8f6d6afb30', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', 'ee6ed8cba09a4bf38d0d4143302ee522', '1', '2022-03-15 00:03:55', NULL);
INSERT INTO `system_user_group` VALUES ('eb1e749a54d743d694ff1e1b61d900f7', '4b92f0fa78cc43fcb3a09eb873c9cad1', '李四', '6e58420b13ce46df953c8e5cfa801d97', '1', '2021-03-22 00:23:09', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_user_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_user_organize`;
CREATE TABLE `system_user_organize` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `organize_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织id',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务',
  `authOrgIds` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '数据权限组织',
  `authParams` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '数据权限参数',
  `authOrgCascade` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `use_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_by` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_organize
-- ----------------------------
BEGIN;
INSERT INTO `system_user_organize` VALUES ('1', '4be09410b5eb47f2a2c4967ee7e03964', 'a8ccfb355ec748579f8c3a3312e96871', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092810360602276109', 'c78a3c47ffae4f8580aeeae488644165', '0', '0', '管理员', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-09-28 10:36:06', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092811092466863588', '3d7d27ed861143a8a622f1d99ca8393e', '367bc284f13c4316922c494d9bb1fab9', '0', '', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-09-28 11:09:24', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092811140923261932', 'aa5bd62fad59490d84d0502e2d609392', '9f7969654fae4d4ca12c71d8a6cbe621', '0', '', '', '', '', '0', '1', '1', '2020-09-28 11:14:09', NULL);
INSERT INTO `system_user_organize` VALUES ('2020092811142844750864', '6905a03a0f5748ca984e008cb9d7ffff', '9f7969654fae4d4ca12c71d8a6cbe621', '0', '', 'a8ccfb355ec748579f8c3a3312e96871,36ef711413d84b30b4bc6d41d628bf7b,367bc284f13c4316922c494d9bb1fab9,66568bb579874e1396ea0e297e112b68,fc49f352b956496a9c9be717529e9e9a', 'a8ccfb355ec748579f8c3a3312e96871:N,36ef711413d84b30b4bc6d41d628bf7b:N,367bc284f13c4316922c494d9bb1fab9:N,66568bb579874e1396ea0e297e112b68:N,fc49f352b956496a9c9be717529e9e9a:N', 'org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_,org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_66568bb579874e1396ea0e297e112b68_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '0', '1', '1', '2020-09-28 11:14:28', '2021-09-20 10:48:30');
INSERT INTO `system_user_organize` VALUES ('2020092814300068842224', '1', '367bc284f13c4316922c494d9bb1fab9', '0', '', '367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff,ebd1212aae1e48259174aaa85c4e21f4,e2fb8ce91fe6427f9fca22f8868095ea,cab9013c4e984f079ed697cbfc86242f,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871,36ef711413d84b30b4bc6d41d628bf7b,66568bb579874e1396ea0e297e112b68,fc49f352b956496a9c9be717529e9e9a', '367bc284f13c4316922c494d9bb1fab9:Y,04a4542c3d5646fbb8b8038d4baa0dff:Y,ebd1212aae1e48259174aaa85c4e21f4:Y,e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:Y,36ef711413d84b30b4bc6d41d628bf7b:Y,66568bb579874e1396ea0e297e112b68:Y,fc49f352b956496a9c9be717529e9e9a:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_04a4542c3d5646fbb8b8038d4baa0dff_,org367bc284f13c4316922c494d9bb1fab9_ebd1212aae1e48259174aaa85c4e21f4_,org367bc284f13c4316922c494d9bb1fab9_e2fb8ce91fe6427f9fca22f8868095ea_,org367bc284f13c4316922c494d9bb1fab9_cab9013c4e984f079ed697cbfc86242f_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_66568bb579874e1396ea0e297e112b68_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '1', '1', '1', '2020-09-28 14:30:00', '2022-03-22 08:10:30');
INSERT INTO `system_user_organize` VALUES ('2020092817030294357883', '1', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '', NULL, NULL, NULL, '0', '3', '1', '2020-09-28 17:03:02', '2022-03-22 08:10:30');
INSERT INTO `system_user_organize` VALUES ('2020092817162903511247', '6905a03a0f5748ca984e008cb9d7ffff', 'a8ccfb355ec748579f8c3a3312e96871', '1', '', NULL, NULL, NULL, '1', '2', '1', '2020-09-28 17:16:29', '2020-09-28 17:23:20');
INSERT INTO `system_user_organize` VALUES ('2020121717294696393187', '4b92f0fa78cc43fcb3a09eb873c9cad1', '367bc284f13c4316922c494d9bb1fab9', '0', '1', '9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871', '9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:N', 'org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-12-17 17:29:46', '2021-03-16 23:17:20');
INSERT INTO `system_user_organize` VALUES ('2020121722084347540095', 'df564cde5fab4f5286fdce7ef9f01f01', '367bc284f13c4316922c494d9bb1fab9', '0', NULL, '367bc284f13c4316922c494d9bb1fab9,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871,36ef711413d84b30b4bc6d41d628bf7b,66568bb579874e1396ea0e297e112b68,fc49f352b956496a9c9be717529e9e9a', '367bc284f13c4316922c494d9bb1fab9:N,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:N,36ef711413d84b30b4bc6d41d628bf7b:Y,66568bb579874e1396ea0e297e112b68:N,fc49f352b956496a9c9be717529e9e9a:Y', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_', '0', '1', '1', '2020-12-17 22:08:43', '2022-03-19 00:29:49');
INSERT INTO `system_user_organize` VALUES ('2020122322434562565210', '1d69f8d83e054c63813ac4d31ae49b41', '9f7969654fae4d4ca12c71d8a6cbe621', '0', '1', '367bc284f13c4316922c494d9bb1fab9,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871,fc49f352b956496a9c9be717529e9e9a', '367bc284f13c4316922c494d9bb1fab9:Y,9f7969654fae4d4ca12c71d8a6cbe621:Y,a8ccfb355ec748579f8c3a3312e96871:N,fc49f352b956496a9c9be717529e9e9a:N', 'org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '0', '1', '1', '2020-12-23 22:43:45', '2021-05-27 22:17:39');
INSERT INTO `system_user_organize` VALUES ('2020123010160775053888', '85e207fe792b41788e99c2685bf5554b', '36ef711413d84b30b4bc6d41d628bf7b', '0', NULL, '36ef711413d84b30b4bc6d41d628bf7b,367bc284f13c4316922c494d9bb1fab9,9f7969654fae4d4ca12c71d8a6cbe621,a8ccfb355ec748579f8c3a3312e96871,66568bb579874e1396ea0e297e112b68,fc49f352b956496a9c9be717529e9e9a', '36ef711413d84b30b4bc6d41d628bf7b:N,367bc284f13c4316922c494d9bb1fab9:N,9f7969654fae4d4ca12c71d8a6cbe621:N,a8ccfb355ec748579f8c3a3312e96871:N,66568bb579874e1396ea0e297e112b68:N,fc49f352b956496a9c9be717529e9e9a:N', 'org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_,org367bc284f13c4316922c494d9bb1fab9_,org367bc284f13c4316922c494d9bb1fab9_9f7969654fae4d4ca12c71d8a6cbe621_,org367bc284f13c4316922c494d9bb1fab9_a8ccfb355ec748579f8c3a3312e96871_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_66568bb579874e1396ea0e297e112b68_,org367bc284f13c4316922c494d9bb1fab9_36ef711413d84b30b4bc6d41d628bf7b_fc49f352b956496a9c9be717529e9e9a_', '0', '1', '1', '2020-12-30 10:16:07', '2021-06-20 23:46:33');
INSERT INTO `system_user_organize` VALUES ('2020123010161913470282', '256064363106405d825d819912ea563d', '36ef711413d84b30b4bc6d41d628bf7b', '0', NULL, '', '', '', '0', '1', '1', '2020-12-30 10:16:19', NULL);
INSERT INTO `system_user_organize` VALUES ('22cd05a0651f4edabb412b59941d6b2a', 'df564cde5fab4f5286fdce7ef9f01f01', '9f7969654fae4d4ca12c71d8a6cbe621', '1', '12', NULL, NULL, NULL, '0', '12', '1', '2021-05-27 23:57:43', '2021-05-28 00:01:49');
INSERT INTO `system_user_organize` VALUES ('4813fd96d05645c698f17a3ad60ad367', '1b5133a874a649499768bb46257b6c40', '367bc284f13c4316922c494d9bb1fab9', '0', NULL, NULL, NULL, NULL, '0', '1', '1', '2021-05-22 10:41:18', NULL);
INSERT INTO `system_user_organize` VALUES ('9111be0d5e8442148e1a434c8f63c9cc', 'ef837d56af5b418da600b3992c41b14f', '66568bb579874e1396ea0e297e112b68', '0', NULL, NULL, NULL, NULL, '0', '1', '1', '2022-03-13 16:30:42', NULL);
INSERT INTO `system_user_organize` VALUES ('c4dc2d241b1446399222a31525f23784', '34e12da0229e4aa88d4e932fecb1f844', '66568bb579874e1396ea0e297e112b68', '0', NULL, NULL, NULL, NULL, '0', '1', '1', '2022-03-13 20:52:24', NULL);
INSERT INTO `system_user_organize` VALUES ('e13f24ceaef24b62be8737f520e398e7', '8acaccef6d834cdea02e17a0741d0bee', '367bc284f13c4316922c494d9bb1fab9', '0', NULL, 'fc49f352b956496a9c9be717529e9e9a,66568bb579874e1396ea0e297e112b68', 'fc49f352b956496a9c9be717529e9e9a:Y,66568bb579874e1396ea0e297e112b68:N', NULL, '0', '1', '1', '2022-03-13 16:57:48', '2022-03-19 00:41:10');
INSERT INTO `system_user_organize` VALUES ('ec0d78cc770d429b8476b28b7c25bc1f', '689af338538541bca3359b293fcaef93', 'fc49f352b956496a9c9be717529e9e9a', '0', NULL, NULL, NULL, NULL, '0', '1', '1', '2021-03-16 23:18:15', NULL);
INSERT INTO `system_user_organize` VALUES ('ec7e7755be3b4ce694611ebd82d82f46', '617cc12d723245858350c0043a772c40', '66568bb579874e1396ea0e297e112b68', '0', NULL, NULL, NULL, NULL, '0', '1', '1', '2022-03-13 15:12:31', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
BEGIN;
INSERT INTO `system_user_role` VALUES ('09680853aae04ce0acf244e8176a78c9', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('373400eec810463b9ed5cfdcf003030f', '955390c0f7a84b76b2d155a4d44ca6ce', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('73486353a2194591a08358b00f8fe8eb', 'b845d68a12f34dab88236bd45c8e3f90', '1', '1', '2022-03-19 00:41:22', NULL);
INSERT INTO `system_user_role` VALUES ('dc1377c22cb6401badb03eaef2131dcc', 'b845d68a12f34dab88236bd45c8e3f90', '1', '1', '2022-03-19 00:41:22', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
