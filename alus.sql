/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : alus

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2016-01-11 18:29:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_item`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE `tbl_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) DEFAULT NULL,
  `itemType` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `itemPic` varchar(255) DEFAULT NULL,
  `itemDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_item
-- ----------------------------
INSERT INTO `tbl_item` VALUES ('1', 'TV', '3', '2', '1000', 'upload/nopic.jpg', 'TV Description');
INSERT INTO `tbl_item` VALUES ('2', 'aaa', '5', '1', '1000', 'upload/nopic.jpg', 'IBM台式机');
INSERT INTO `tbl_item` VALUES ('3', '风衣', '3', '1', '99', 'upload/nopic.jpg', 'IBM台式机');
INSERT INTO `tbl_item` VALUES ('4', '苹果电脑', '4', '1', '10000', 'upload/nopic.jpg', 'IBM台式机');
INSERT INTO `tbl_item` VALUES ('7', 'IBM台式机', '4', '1', '10000', 'upload/nopic.jpg', 'IBM台式机');
INSERT INTO `tbl_item` VALUES ('8', '中文', '4', '1', '10000', 'upload/nopic.jpg', 'IBM台式机');
INSERT INTO `tbl_item` VALUES ('9', '纽曼D618老人手机手写触屏直板按键大屏大声老年手机', '4', '1', '108', 'upload/nopic.jpg', 'Serenity');
INSERT INTO `tbl_item` VALUES ('10', 'HP/惠普 ENVY15-AE125TX I7-6500U IPS屏 全金属游戏笔记本 正品 ', '4', '1', '108', 'upload/nopic.jpg', '本店出售的均全新未开封正品行货，享受国家三包，全国联保。我们公司有天猫，淘宝，国美等网上店铺和上海实体店铺。我们以低廉的价格，优质的服务，完美的售后给您带来极致的购物体验。我们承诺绝不出售样机、翻新机、二手机。欢迎大家选购。');
INSERT INTO `tbl_item` VALUES ('11', 'TALK', '3', '2', '777', 'upload/nopic.jpg', 'description');

-- ----------------------------
-- Table structure for `tbl_item_cart`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_item_cart`;
CREATE TABLE `tbl_item_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `buyTime` varchar(50) NOT NULL,
  `buyTotal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_item_cart
-- ----------------------------
INSERT INTO `tbl_item_cart` VALUES ('3', '2', '4', '苹果电脑', '2015-11-30 08:57:43', '1');
INSERT INTO `tbl_item_cart` VALUES ('4', '2', '9', '纽曼D618老人手机手写触屏直板按键大屏大声老年手机', '2015-11-30 13:50:58', '1');
INSERT INTO `tbl_item_cart` VALUES ('11', '1', '4', '苹果电脑', '2015-11-30 15:06:47', '1');
INSERT INTO `tbl_item_cart` VALUES ('12', '1', '8', '中文', '2015-11-30 15:14:16', '1');
INSERT INTO `tbl_item_cart` VALUES ('14', '3', '1', 'TV', '2016-01-11 12:34:11', '1');
INSERT INTO `tbl_item_cart` VALUES ('16', '3', '8', '中文', '2016-01-11 15:03:32', '1');
INSERT INTO `tbl_item_cart` VALUES ('18', '3', '8', '中文', '2016-01-11 15:20:25', '1');
INSERT INTO `tbl_item_cart` VALUES ('19', '3', '9', '纽曼D618老人手机手写触屏直板按键大屏大声老年手机', '2016-01-11 15:21:44', '1');
INSERT INTO `tbl_item_cart` VALUES ('20', '3', '9', '纽曼D618老人手机手写触屏直板按键大屏大声老年手机', '2016-01-11 15:22:56', '1');
INSERT INTO `tbl_item_cart` VALUES ('21', '3', '9', '纽曼D618老人手机手写触屏直板按键大屏大声老年手机', '2016-01-11 15:23:00', '1');

-- ----------------------------
-- Table structure for `tbl_item_type`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_item_type`;
CREATE TABLE `tbl_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `typeName` varchar(30) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_item_type
-- ----------------------------
INSERT INTO `tbl_item_type` VALUES ('1', '0', '服装类', null);
INSERT INTO `tbl_item_type` VALUES ('2', '0', '电子类', null);
INSERT INTO `tbl_item_type` VALUES ('3', '1', '男装', null);
INSERT INTO `tbl_item_type` VALUES ('4', '2', '计算机', null);
INSERT INTO `tbl_item_type` VALUES ('5', '4', '笔记本电脑', null);
INSERT INTO `tbl_item_type` VALUES ('6', '3', '男士上衣', null);
INSERT INTO `tbl_item_type` VALUES ('7', '0', '家具类', null);
INSERT INTO `tbl_item_type` VALUES ('8', '7', '书架', null);
INSERT INTO `tbl_item_type` VALUES ('9', '4', '平板电脑', null);

-- ----------------------------
-- Table structure for `tbl_order`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `buyTime` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('3', '1', '8', '2015-11-30 09:47:27', '1', '1');
INSERT INTO `tbl_order` VALUES ('4', '1', '4', '2015-11-30 09:47:27', '1', '1');
INSERT INTO `tbl_order` VALUES ('5', '1', '8', '2015-11-30 10:54:57', '1', '0');
INSERT INTO `tbl_order` VALUES ('6', '1', '4', '2015-11-30 10:54:57', '1', '0');
INSERT INTO `tbl_order` VALUES ('7', '2', '4', '2015-11-30 01:51:17', '1', '1');
INSERT INTO `tbl_order` VALUES ('8', '2', '9', '2015-11-30 01:51:17', '1', '1');
INSERT INTO `tbl_order` VALUES ('9', '1', '8', '2015-11-30 02:47:28', '1', '0');
INSERT INTO `tbl_order` VALUES ('10', '1', '4', '2015-11-30 03:09:36', '1', '0');
INSERT INTO `tbl_order` VALUES ('11', '1', '4', '2015-11-30 03:10:29', '1', '0');
INSERT INTO `tbl_order` VALUES ('12', '3', '20', '2016-01-11 16:13:38', '1', '');
INSERT INTO `tbl_order` VALUES ('13', '3', '18', '2016-01-11 16:25:24', '1', '');
INSERT INTO `tbl_order` VALUES ('14', '3', '18', '2016-01-11 16:30:27', '1', '');
INSERT INTO `tbl_order` VALUES ('15', '3', '18', '2016-01-11 16:31:32', '1', '');
INSERT INTO `tbl_order` VALUES ('16', '3', '13', '2016-01-11 16:47:46', '1', '');
INSERT INTO `tbl_order` VALUES ('17', '3', '13', '2016-01-11 16:48:59', '1', '');
INSERT INTO `tbl_order` VALUES ('18', '3', '13', '2016-01-11 16:49:35', '1', '');
INSERT INTO `tbl_order` VALUES ('19', '3', '13', '2016-01-11 16:49:36', '1', '');
INSERT INTO `tbl_order` VALUES ('20', '3', '13', '2016-01-11 16:49:37', '1', '');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'Seller', '12', '1', '卖家', '999', '999', '南通科教城x-x-x');
INSERT INTO `tbl_user` VALUES ('2', 'James', '1234', '2', '买家', '999', '999', '南通科教城x-x-x');
INSERT INTO `tbl_user` VALUES ('3', 'admin', 'admin', '3', '管理员', '999', '999', '广州上海');
INSERT INTO `tbl_user` VALUES ('5', 'K', 'adf', '2', '卖家', '456', '543@fd.com', 'asdf');
INSERT INTO `tbl_user` VALUES ('7', 'K', 'zK', '1', null, '456', 'adfs@d.com', '908adf');
INSERT INTO `tbl_user` VALUES ('8', 'K', 'L', '1', null, '456', 'adfs@d.com', '908adf');
INSERT INTO `tbl_user` VALUES ('9', 'Ko', 'K', '1', '', '456', 'adfs@d.com', '908adf');
INSERT INTO `tbl_user` VALUES ('10', 'dfa', 'ssfg', '2', '卖家', '32', 'sfg@ed.com', 'df');

-- ----------------------------
-- Table structure for `tbl_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE `tbl_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user_role
-- ----------------------------
INSERT INTO `tbl_user_role` VALUES ('1', '卖家');
INSERT INTO `tbl_user_role` VALUES ('2', '买家');
INSERT INTO `tbl_user_role` VALUES ('3', '管理员');
