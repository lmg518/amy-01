/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : amy_jpminsu01

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-10-09 20:53:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `house_status`
-- ----------------------------
DROP TABLE IF EXISTS `house_status`;
CREATE TABLE `house_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_infos_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `price` double DEFAULT NULL,
  `row_num` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_status
-- ----------------------------
INSERT INTO `house_status` VALUES ('1', '1001', 'meijinglongtang', '2017-10-01 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('2', '1001', 'meijinglongtang', '2017-10-02 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('3', '1001', 'meijinglongtang', '2017-10-03 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('4', '1001', 'meijinglongtang', '2017-10-04 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('5', '1001', 'meijinglongtang', '2017-10-05 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('6', '1001', 'meijinglongtang', '2017-10-06 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('7', '1001', 'meijinglongtang', '2017-10-07 00:00:00', '298', '1');
INSERT INTO `house_status` VALUES ('8', '1002', 'zhongyuanwanda', '2017-10-01 00:00:00', '398', '1');
INSERT INTO `house_status` VALUES ('9', '1002', 'zhongyuanwanda', '2017-10-02 00:00:00', '398', '1');
INSERT INTO `house_status` VALUES ('10', '1002', 'zhongyuanwanda', '2017-10-03 00:00:00', '398', '1');
INSERT INTO `house_status` VALUES ('11', '1002', 'zhongyuanwanda', '2017-10-04 00:00:00', '398', '1');
INSERT INTO `house_status` VALUES ('12', '1002', 'zhongyuanwanda', '2017-10-05 00:00:00', '398', '1');
INSERT INTO `house_status` VALUES ('13', '1002', 'zhongyuanwanda', '2017-10-06 00:00:00', '398', '1');
INSERT INTO `house_status` VALUES ('14', '1002', 'zhongyuanwanda', '2017-10-07 00:00:00', '398', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `tell_code` varchar(20) DEFAULT NULL,
  `sms_code` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `invite_code` varchar(50) DEFAULT NULL,
  `com_info` varchar(50) DEFAULT NULL,
  `coupons_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', '李明', '18838214018', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('2', null, '李明贵', '13663963981', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('3', null, 'lmg01', '15716786634', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('4', null, 'lmg02', '156785965', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('5', null, 'lmg03', '158', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('6', null, 'lmg04', '156', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('7', null, 'lmg05', '1568', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('8', null, 'lmg06', '156', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('9', null, 'lmg07', '158', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('10', null, 'lmg08', '1256', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('11', null, 'lmg10', '45687', null, null, '123', null, null, null);
INSERT INTO `users` VALUES ('12', null, 'lmg11', '1587', null, null, '1223', null, null, null);
