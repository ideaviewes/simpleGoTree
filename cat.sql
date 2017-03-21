/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 100121
Source Host           : localhost:3306
Source Database       : learn

Target Server Type    : MYSQL
Target Server Version : 100121
File Encoding         : 65001

Date: 2017-03-21 13:50:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fid` int(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cat
-- ----------------------------
INSERT INTO `cat` VALUES ('1', '0', '衣服');
INSERT INTO `cat` VALUES ('2', '0', '书籍');
INSERT INTO `cat` VALUES ('3', '1', 'T恤');
INSERT INTO `cat` VALUES ('4', '1', '裤子');
INSERT INTO `cat` VALUES ('5', '1', '鞋子');
INSERT INTO `cat` VALUES ('6', '5', '皮鞋');
INSERT INTO `cat` VALUES ('7', '5', '运动鞋');
INSERT INTO `cat` VALUES ('8', '7', '耐克');
INSERT INTO `cat` VALUES ('9', '3', '耐克');
INSERT INTO `cat` VALUES ('10', '7', '鸿星尔克');
INSERT INTO `cat` VALUES ('11', '2', '小说');
INSERT INTO `cat` VALUES ('12', '11', '科幻小说');
INSERT INTO `cat` VALUES ('13', '11', '古典名著');
INSERT INTO `cat` VALUES ('14', '2', '文学');
INSERT INTO `cat` VALUES ('15', '14', '四书五经');
