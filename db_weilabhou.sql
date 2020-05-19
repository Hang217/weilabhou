/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : db_weilabhou

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 27/04/2020 13:13:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `userpwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'admin', '超级管理员');
INSERT INTO `t_admin` VALUES (2, 'yx', '1', '管理员');

-- ----------------------------
-- Table structure for t_shebei
-- ----------------------------
DROP TABLE IF EXISTS `t_shebei`;
CREATE TABLE `t_shebei`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shebeino` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `leixing` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `fujian` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备简介',
  `jiaoshiname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属教室',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `addshijian` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `erweima` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jiage` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shebei
-- ----------------------------
INSERT INTO `t_shebei` VALUES (1, 'SB_1001', '设备1', '普通设备', NULL, '设备信息简介1111', '101教室', '正常', '2020-04-01', NULL, NULL, '/upload/erweima//1587962819467.jpg', 10000);
INSERT INTO `t_shebei` VALUES (2, 'SB_1002', '试验台', '台子', NULL, '试验台简介信息随便写', '103教室', '正常', '2020-04-05', NULL, NULL, '/upload/erweima//1586054169437.jpg', 18000);
INSERT INTO `t_shebei` VALUES (3, 'SB_1003', '试管架', '小型设备', NULL, '设备信息简介3333', '102教室', '正常', '2020-04-05', NULL, NULL, '/upload/erweima//1586054170626.jpg', 15890);
INSERT INTO `t_shebei` VALUES (4, 'SB_1005', '试管', '小设备', NULL, '试管信息简介11111', '106教室', '正常', '2020-04-05', NULL, NULL, '/upload/erweima//1586059391525.jpg', 18);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帐号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `usertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `emall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `addtime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间',
  `blacktime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '黑名单时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '用户状态',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jifen` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'user', '123456', '普通用户', '111', '13625884751', '11@qq.com', 'sdsfd', NULL, '2030-12-22 23:04:27', 0, '男', 0);
INSERT INTO `t_user` VALUES (2, 'user1', '123456', '普通用户', '张三', '13625884751', '11@qq.com', '备注', '10-102', '', 0, '男', 0);
INSERT INTO `t_user` VALUES (3, 'user2', '123456', NULL, '张三', '1598855888', '2323@qq.com', NULL, '2019-11-13 01:46:59', NULL, 0, '男', 0);
INSERT INTO `t_user` VALUES (4, 'user3', '123456', NULL, '张三', '15888888888', '23233@qq.com', NULL, '2019-11-13 01:48:27', NULL, 0, '男', 0);
INSERT INTO `t_user` VALUES (5, 'user4', '123456', NULL, '11', '11', NULL, NULL, '2019-11-21 19:31:52', '', 0, '111', 0);

SET FOREIGN_KEY_CHECKS = 1;
