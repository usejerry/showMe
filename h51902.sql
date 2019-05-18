/*
Navicat MySQL Data Transfer

Source Server         : mydbs
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : h51902

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-05-18 16:48:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_goods
-- ----------------------------
DROP TABLE IF EXISTS `car_goods`;
CREATE TABLE `car_goods` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_goods
-- ----------------------------

-- ----------------------------
-- Table structure for car_order
-- ----------------------------
DROP TABLE IF EXISTS `car_order`;
CREATE TABLE `car_order` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `count` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_order
-- ----------------------------

-- ----------------------------
-- Table structure for car_users
-- ----------------------------
DROP TABLE IF EXISTS `car_users`;
CREATE TABLE `car_users` (
  `uid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpars` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_users
-- ----------------------------

-- ----------------------------
-- Table structure for contents
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `dateline` int(10) unsigned DEFAULT '0',
  `support` int(11) unsigned DEFAULT '0',
  `oppose` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `oppose` (`oppose`),
  KEY `uid` (`uid`),
  KEY `support` (`support`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contents
-- ----------------------------
INSERT INTO `contents` VALUES ('44', '5', '??', '1556541928', '3', '1');
INSERT INTO `contents` VALUES ('45', '5', '??', '1556541929', '2', '1');
INSERT INTO `contents` VALUES ('46', '5', '??', '1556541929', '11', '1');
INSERT INTO `contents` VALUES ('47', '5', '??', '1556541929', '19', '0');
INSERT INTO `contents` VALUES ('48', '5', '??', '1556541930', '5', '0');
INSERT INTO `contents` VALUES ('49', '5', '??', '1556541930', '2', '0');
INSERT INTO `contents` VALUES ('50', '6', '156416', '1556546331', '0', '0');
INSERT INTO `contents` VALUES ('51', '6', '156416', '1556546448', '0', '0');
INSERT INTO `contents` VALUES ('52', '6', '15512', '1556546477', '1', '0');
INSERT INTO `contents` VALUES ('53', '6', '??????', '1556546508', '0', '0');
INSERT INTO `contents` VALUES ('54', '6', '??????', '1556546511', '0', '0');
INSERT INTO `contents` VALUES ('55', '6', '123', '1556591615', '0', '0');
INSERT INTO `contents` VALUES ('56', '6', '?????', '1556591932', '1', '0');
INSERT INTO `contents` VALUES ('57', '6', '?????', '1556591934', '0', '0');
INSERT INTO `contents` VALUES ('58', '2', '48?', '1556605607', '0', '0');
INSERT INTO `contents` VALUES ('59', '2', '??', '1556605631', '0', '0');
INSERT INTO `contents` VALUES ('60', '2', '??', '1556605673', '0', '0');
INSERT INTO `contents` VALUES ('61', '2', '???', '1556605679', '0', '0');
INSERT INTO `contents` VALUES ('62', '2', '??', '1556605877', '0', '0');
INSERT INTO `contents` VALUES ('63', '4', '???', '1556860120', '3', '0');
INSERT INTO `contents` VALUES ('64', '4', '??', '1556860301', '2', '0');
INSERT INTO `contents` VALUES ('65', '4', '??', '1556860327', '19', '2');
INSERT INTO `contents` VALUES ('66', '9', '???', '1557124541', '20', '2');
INSERT INTO `contents` VALUES ('67', '9', '??', '1557124573', '6', '6');

-- ----------------------------
-- Table structure for c_order
-- ----------------------------
DROP TABLE IF EXISTS `c_order`;
CREATE TABLE `c_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `usid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_order
-- ----------------------------
INSERT INTO `c_order` VALUES ('4', 'HUAWEI P20', '5888', '2', '5966', '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '8', '1');
INSERT INTO `c_order` VALUES ('7', '不要说', '1234', '12', '9000', '../img/1.op', null, null);
INSERT INTO `c_order` VALUES ('8', 'HUAWEI P20 Pro', '20549', '5', '9212', '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '4', '1');
INSERT INTO `c_order` VALUES ('9', 'HUAWEI P20', '5888', '2', '5966', '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '1', '1');
INSERT INTO `c_order` VALUES ('11', '不要说', '1234', '12', '9000', '../img/1.op', null, null);
INSERT INTO `c_order` VALUES ('12', 'HUAWEI P20', '44984', '10', '14622', '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '8', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `colors` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `g_num` int(11) DEFAULT NULL,
  `images_type` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '4884', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '1001');
INSERT INTO `goods` VALUES ('2', '5966', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '5888');
INSERT INTO `goods` VALUES ('3', '7048', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '10775');
INSERT INTO `goods` VALUES ('4', '8130', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '15662');
INSERT INTO `goods` VALUES ('5', '9212', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '20549');
INSERT INTO `goods` VALUES ('6', '10294', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '25436');
INSERT INTO `goods` VALUES ('7', '11376', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '30323');
INSERT INTO `goods` VALUES ('8', '12458', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '35210');
INSERT INTO `goods` VALUES ('9', '13540', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '40097');
INSERT INTO `goods` VALUES ('10', '14622', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '44984');
INSERT INTO `goods` VALUES ('11', '15704', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '49871');
INSERT INTO `goods` VALUES ('12', '16786', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '54758');
INSERT INTO `goods` VALUES ('13', '17868', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '15521');
INSERT INTO `goods` VALUES ('14', '18950', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '12313');
INSERT INTO `goods` VALUES ('15', '20032', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '1000');
INSERT INTO `goods` VALUES ('16', '21114', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '1122');
INSERT INTO `goods` VALUES ('17', '22196', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '1254');
INSERT INTO `goods` VALUES ('18', '23278', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '212');
INSERT INTO `goods` VALUES ('19', '24360', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '7894');
INSERT INTO `goods` VALUES ('20', '25442', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '23102');
INSERT INTO `goods` VALUES ('21', '26524', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '15555');
INSERT INTO `goods` VALUES ('22', '27606', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '15465');
INSERT INTO `goods` VALUES ('23', '28688', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '15646');
INSERT INTO `goods` VALUES ('24', '29770', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '15827');
INSERT INTO `goods` VALUES ('25', '30852', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '16008');
INSERT INTO `goods` VALUES ('26', '31934', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '16189');
INSERT INTO `goods` VALUES ('27', '33016', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '16370');
INSERT INTO `goods` VALUES ('28', '34098', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '16551');
INSERT INTO `goods` VALUES ('29', '35180', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '16732');
INSERT INTO `goods` VALUES ('30', '36262', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '16913');
INSERT INTO `goods` VALUES ('31', '37344', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '17094');
INSERT INTO `goods` VALUES ('32', '38426', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '17275');
INSERT INTO `goods` VALUES ('33', '39508', '亮黑色&极光色&宝石蓝', 'HUAWEI P20 Pro', '../images/w_p20pro_1.jpg&../images/w_p20pro_2.jpg&../images/w_p20pro_3.jpg&../images/w_p20pro_4.jpg&../images/w_p20pro_5.jpg&../images/w_p20pro_6.jpg', null, '../images/p20pro_1.png&../images/p20pro_2.png&../images/p20pro_3.png', '17456');
INSERT INTO `goods` VALUES ('34', '40590', '亮黑色&极光色&极光闪蝶', 'HUAWEI P20', '../images/w_p20_1.jpg&../images/w_p20_2.jpg&../images/w_p20_3.jpg&../images/w_p20_4.jpg&../images/w_p20_5.jpg&../images/w_p20_6.jpg', null, '../images/p20_1.png&../images/p20_2.png&../images/p20_3.png', '17637');
INSERT INTO `goods` VALUES ('35', '41672', '亮黑色&极光色&天空之境&赤茶橘&珠光贝母', 'HUAWEI P30', '../images/w_p30_1.png&../images/w_p30_2.png&../images/w_p30_3.png&../images/w_p30_4.png&../images/w_p30_5.png', null, '../images/p30_1.png&../images/p30_2.png&../images/p30_3.png&../images/p30_4.png&../images/p30_5.png', '17818');
INSERT INTO `goods` VALUES ('36', '42754', '亮黑色&极光色&天空之境&赤茶橘', 'HUAWEI P30 Pro', '../images/w_p30pro_1.png&../images/w_p30pro_2.png&../images/w_p30pro_3.png&../images/w_p30pro_4.png&../images/w_p30pro_5.png&../images/w_p30pro_6.png', null, '../images/p30pro_1.png&../images/p30pro_2.png&../images/p30pro_3.png&../images/p30pro_4.png', '17999');

-- ----------------------------
-- Table structure for message_board
-- ----------------------------
DROP TABLE IF EXISTS `message_board`;
CREATE TABLE `message_board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `messages` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_board
-- ----------------------------
INSERT INTO `message_board` VALUES ('60', '');
INSERT INTO `message_board` VALUES ('61', '打上');
INSERT INTO `message_board` VALUES ('62', '打上');
INSERT INTO `message_board` VALUES ('63', '打打分');
INSERT INTO `message_board` VALUES ('64', '15');
INSERT INTO `message_board` VALUES ('65', '15');
INSERT INTO `message_board` VALUES ('66', '15');
INSERT INTO `message_board` VALUES ('67', '15');
INSERT INTO `message_board` VALUES ('68', '15');
INSERT INTO `message_board` VALUES ('69', '878');
INSERT INTO `message_board` VALUES ('70', '878');
INSERT INTO `message_board` VALUES ('71', '87878');
INSERT INTO `message_board` VALUES ('72', '打');
INSERT INTO `message_board` VALUES ('73', 'dsa');
INSERT INTO `message_board` VALUES ('74', 'dsa');
INSERT INTO `message_board` VALUES ('75', 'das');
INSERT INTO `message_board` VALUES ('76', 'dsadsa');
INSERT INTO `message_board` VALUES ('77', '123');
INSERT INTO `message_board` VALUES ('78', '123');
INSERT INTO `message_board` VALUES ('79', '猪是傻子');
INSERT INTO `message_board` VALUES ('80', '***的，打');
INSERT INTO `message_board` VALUES ('81', '123');
INSERT INTO `message_board` VALUES ('82', '45');
INSERT INTO `message_board` VALUES ('83', '123');

-- ----------------------------
-- Table structure for sj_data
-- ----------------------------
DROP TABLE IF EXISTS `sj_data`;
CREATE TABLE `sj_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sj_data
-- ----------------------------
INSERT INTO `sj_data` VALUES ('1', '华为打小米1', '1956', 'huawei1');
INSERT INTO `sj_data` VALUES ('2', '华为1', '1957', 'huawei2');
INSERT INTO `sj_data` VALUES ('3', '华为2', '1958', 'huawei3');
INSERT INTO `sj_data` VALUES ('4', '华为3', '1959', 'huawei1');
INSERT INTO `sj_data` VALUES ('5', '华为4', '1960', 'huawei2');
INSERT INTO `sj_data` VALUES ('6', '华为5', '1961', 'huawei3');
INSERT INTO `sj_data` VALUES ('7', '华为6', '1962', 'huawei1');
INSERT INTO `sj_data` VALUES ('8', '华为7', '1963', 'huawei2');
INSERT INTO `sj_data` VALUES ('9', '华为8', '1964', 'huawei3');
INSERT INTO `sj_data` VALUES ('10', '华为9', '1965', 'huawei1');
INSERT INTO `sj_data` VALUES ('11', '华为10', '1966', 'huawei2');
INSERT INTO `sj_data` VALUES ('12', '华为11', '1967', 'huawei3');
INSERT INTO `sj_data` VALUES ('13', '华为12', '1968', 'huawei1');
INSERT INTO `sj_data` VALUES ('14', '华为13', '1969', 'huawei2');
INSERT INTO `sj_data` VALUES ('15', '华为14', '1970', 'huawei3');
INSERT INTO `sj_data` VALUES ('16', '华为15', '1971', 'huawei1');
INSERT INTO `sj_data` VALUES ('17', '华为16', '1972', 'huawei2');
INSERT INTO `sj_data` VALUES ('18', '华为17', '1973', 'huawei3');
INSERT INTO `sj_data` VALUES ('19', '华为18', '1974', 'huawei1');
INSERT INTO `sj_data` VALUES ('20', '华为19', '1975', 'huawei2');
INSERT INTO `sj_data` VALUES ('21', '华为20', '1976', 'huawei3');
INSERT INTO `sj_data` VALUES ('22', '华为21', '1977', 'huawei1');
INSERT INTO `sj_data` VALUES ('23', '华为22', '1978', 'huawei2');
INSERT INTO `sj_data` VALUES ('24', '华为23', '1979', 'huawei3');
INSERT INTO `sj_data` VALUES ('25', '华为24', '1980', 'huawei1');
INSERT INTO `sj_data` VALUES ('26', '华为25', '1981', 'huawei2');
INSERT INTO `sj_data` VALUES ('27', '华为26', '1982', 'huawei3');
INSERT INTO `sj_data` VALUES ('28', '华为27', '1983', 'huawei1');
INSERT INTO `sj_data` VALUES ('29', '华为28', '1984', 'huawei2');
INSERT INTO `sj_data` VALUES ('30', '华为29', '1985', 'huawei3');
INSERT INTO `sj_data` VALUES ('31', '华为30', '1986', 'huawei1');
INSERT INTO `sj_data` VALUES ('32', '华为31', '1987', 'huawei2');
INSERT INTO `sj_data` VALUES ('33', '华为32', '1988', 'huawei3');
INSERT INTO `sj_data` VALUES ('34', '华为33', '1989', 'huawei1');
INSERT INTO `sj_data` VALUES ('35', '华为34', '1990', 'huawei2');
INSERT INTO `sj_data` VALUES ('36', '华为35', '1991', 'huawei3');
INSERT INTO `sj_data` VALUES ('37', '华为36', '1992', 'huawei1');
INSERT INTO `sj_data` VALUES ('38', '华为37', '1993', 'huawei2');
INSERT INTO `sj_data` VALUES ('39', '华为38', '1994', 'huawei3');
INSERT INTO `sj_data` VALUES ('40', '华为39', '1995', 'huawei1');
INSERT INTO `sj_data` VALUES ('41', '华为40', '1996', 'huawei2');
INSERT INTO `sj_data` VALUES ('42', '华为41', '1997', 'huawei3');
INSERT INTO `sj_data` VALUES ('43', '华为42', '1998', 'huawei1');
INSERT INTO `sj_data` VALUES ('44', '华为43', '1999', 'huawei2');
INSERT INTO `sj_data` VALUES ('45', '华为44', '2000', 'huawei3');
INSERT INTO `sj_data` VALUES ('46', '华为45', '2001', 'huawei1');
INSERT INTO `sj_data` VALUES ('47', '华为46', '2002', 'huawei2');
INSERT INTO `sj_data` VALUES ('48', '华为47', '2003', 'huawei3');
INSERT INTO `sj_data` VALUES ('49', '华为48', '2004', 'huawei1');
INSERT INTO `sj_data` VALUES ('50', '华为49', '2005', 'huawei2');
INSERT INTO `sj_data` VALUES ('51', '华为50', '2006', 'huawei3');
INSERT INTO `sj_data` VALUES ('52', '华为51', '2007', 'huawei1');
INSERT INTO `sj_data` VALUES ('53', '华为52', '2008', 'huawei2');
INSERT INTO `sj_data` VALUES ('54', '华为53', '2009', 'huawei3');
INSERT INTO `sj_data` VALUES ('55', '华为54', '2010', 'huawei1');

-- ----------------------------
-- Table structure for studen
-- ----------------------------
DROP TABLE IF EXISTS `studen`;
CREATE TABLE `studen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dir` time DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studen
-- ----------------------------
INSERT INTO `studen` VALUES ('1', '梨花', null, '2019-04-25 16:26:20');
INSERT INTO `studen` VALUES ('2', 'dsa', null, '2019-04-25 17:13:03');
INSERT INTO `studen` VALUES ('3', '梨我', null, '2019-04-25 16:27:17');
INSERT INTO `studen` VALUES ('4', '梨我', null, '2019-04-25 16:27:24');
INSERT INTO `studen` VALUES ('5', '梨', null, '2019-04-25 16:27:54');
INSERT INTO `studen` VALUES ('6', '梨', null, '2019-04-25 16:32:38');
INSERT INTO `studen` VALUES ('7', '梨', null, '2019-04-25 17:04:44');
INSERT INTO `studen` VALUES ('8', '梨', null, '2019-04-25 17:08:35');
INSERT INTO `studen` VALUES ('9', '梨', null, '2019-04-25 17:10:12');
INSERT INTO `studen` VALUES ('10', '梨', null, '2019-04-25 17:10:18');
INSERT INTO `studen` VALUES ('11', '梨', null, '2019-04-25 17:11:54');
INSERT INTO `studen` VALUES ('12', '梨', null, '2019-04-25 17:12:06');
INSERT INTO `studen` VALUES ('13', '梨', null, '2019-04-25 17:12:45');
INSERT INTO `studen` VALUES ('14', '梨', null, '2019-04-25 17:12:53');
INSERT INTO `studen` VALUES ('15', '梨', null, '2019-04-25 17:13:03');
INSERT INTO `studen` VALUES ('16', '梨', null, '2019-04-25 17:13:10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(80) NOT NULL,
  `psw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('zhu', '12345');
INSERT INTO `user` VALUES ('malin', '1234567');
INSERT INTO `user` VALUES ('mlin', '1234567');
INSERT INTO `user` VALUES ('', '');
INSERT INTO `user` VALUES ('zh33r', 'da123');
INSERT INTO `user` VALUES ('这的', '123');
INSERT INTO `user` VALUES ('这的是', '123');
INSERT INTO `user` VALUES ('你是哈', '145');
INSERT INTO `user` VALUES ('恩', '1234');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(16) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `avatar` tinyint(1) unsigned DEFAULT '1',
  `login_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'sdfghj', '3545258378f2a3566e4a823d0ad28a3e', '1', null);
INSERT INTO `users` VALUES ('2', 'zhu', '827ccb0eea8a706c4c34a16891f84e7b', '1', null);
INSERT INTO `users` VALUES ('3', 'xzhu', '827ccb0eea8a706c4c34a16891f84e7b', '1', null);
INSERT INTO `users` VALUES ('4', 'malin', 'e10adc3949ba59abbe56e057f20f883e', '1', null);
INSERT INTO `users` VALUES ('5', 'daa', '202cb962ac59075b964b07152d234b70', '1', null);
INSERT INTO `users` VALUES ('6', 'love', 'e10adc3949ba59abbe56e057f20f883e', '1', null);
INSERT INTO `users` VALUES ('7', '78da', 'e10adc3949ba59abbe56e057f20f883e', '1', null);
INSERT INTO `users` VALUES ('8', '?', 'e10adc3949ba59abbe56e057f20f883e', '1', null);
INSERT INTO `users` VALUES ('9', '??', 'e10adc3949ba59abbe56e057f20f883e', '1', null);

-- ----------------------------
-- Table structure for zol_goods
-- ----------------------------
DROP TABLE IF EXISTS `zol_goods`;
CREATE TABLE `zol_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `g_type` varchar(255) DEFAULT NULL,
  `original_price` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `now_price` int(11) DEFAULT NULL,
  `price_coupon` int(11) DEFAULT NULL,
  `magges` varchar(255) DEFAULT NULL,
  `buy_time` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `storeName` varchar(255) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zol_goods
-- ----------------------------
INSERT INTO `zol_goods` VALUES ('1', 'phone', '4200', '【低价开团】现货荣耀Magic2 麒麟980AI智能芯片 8GB', '3220', '300', '国行原装正品，支持全国联保，麒麟980，6.39英寸全视屏，超广角AI三摄，魔法降临!', '2019/5/29 15:25:00', '渐变黑&渐变红&渐变蓝', 'magic2_1.jpg&magic2_2.jpg&magic2_3.jpg', '汇通数码风暴专营店', '101155');
INSERT INTO `zol_goods` VALUES ('2', 'phone', '3700', '【低价开团】OPPO OPPO A7x 全面屏', '2220', '300', '【新品上市】4+128大内存，水滴屏，AI智能双摄', '2019/5/25 15:25:00', '火焰蓝&星空紫', 'OPPO_A7x_1.jpg&OPPO_A7x_2.jpg', '环宇荣合专营店', '10112');
INSERT INTO `zol_goods` VALUES ('3', 'phone', '5700', '【新品低价开团】华为 P30 8GB麒麟980AI智能芯片', '4220', '200', '【华为官方直供货源】6.1英寸OLED全面屏，屏内指纹，超感光徕卡三摄，30倍数码变焦', '2019/5/22 15:25:00', '极光色&天空之境&亮黑色', 'p30_1.jpg&p30_2.jpg&p30_2.jpg', '甲骨龙旗舰店', '10113');
INSERT INTO `zol_goods` VALUES ('4', 'computer', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '400', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg&Y7000_2.jpg&Y7000_3.jpg', '汇通数码风暴专营店', '10114');
INSERT INTO `zol_goods` VALUES ('5', 'computer', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', '400', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg&YX570_2.jpg&YX570_3.jpg', '环宇荣合专营店', '10115');
INSERT INTO `zol_goods` VALUES ('6', 'computer', '6200', '华硕（ASUS） FX80GE8300 15.6英寸 商务办公', '5000', '200', 'i5 8G 256G 1050TI -4G 原装正品 全国联保 顺丰包邮', '2019/6/20 15:25:00', 'i5 8G 256G 1050TI -4G', 'FX80GE8300_1.jpg&FX80GE8300_2.jpg&FX80GE8300_3.jpg', '甲骨龙旗舰店', '10116');
INSERT INTO `zol_goods` VALUES ('7', 'DIY', '5003', '甲骨龙 九代I5 9400F RTX2070 8G独显', '4500', '100', '配置三', '2019/5/29 15:25:00', '配置-&配置二&配置三', '9400F.jpg', '汇通数码风暴专营店', '101');
INSERT INTO `zol_goods` VALUES ('8', 'DIY', '5203', '甲骨龙 新品9代I5 9600K RXT2060 6G独显 1T', '4700', '100', '标配加装1T机械盘', '2019/6/20 19:25:00', '配置-&配置二&配置三', '9600K.png', '环宇荣合专营店', '10118');
INSERT INTO `zol_goods` VALUES ('9', 'shuma', '3900', '佳能100d (EF 40mm f/2.8 STM)白色', '3000', '200', '限时甩 时尚小单反 轻便 Q版', '2019/6/29 19:25:00', '白色', '100d_1.jpg&100d_2.jpg', '甲骨龙旗舰店', '10119');
INSERT INTO `zol_goods` VALUES ('10', 'listen', '1000', 'difier/漫步者 G4电脑耳机头戴式电竞吃鸡游戏耳麦', '900', '80', '头戴式电竞吃鸡游戏耳麦', '2019/8/29 19:25:00', '红色', 'difier_1.jpg&difier_2.jpg', '汇通数码风暴专营店', '101234');
INSERT INTO `zol_goods` VALUES ('11', 'intel', '400', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人 粉色', '300', '30', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人', '2019/5/29 15:25:00', '白色&粉色', 'zhiqren.jpg', '环宇荣合专营店', '10121');
INSERT INTO `zol_goods` VALUES ('12', 'phone', '4200', '【低价开团】现货荣耀Magic2 麒麟980AI智能芯片 8GB', '3220', '300', '国行原装正品，支持全国联保，麒麟980，6.39英寸全视屏，超广角AI三摄，魔法降临!', '2019/5/22 15:25:00', '渐变黑&渐变红&渐变蓝', 'magic2_1.jpg&magic2_2.jpg&magic2_3.jpg', '甲骨龙旗舰店', '10122');
INSERT INTO `zol_goods` VALUES ('13', 'phone', '3700', '【低价开团】OPPO OPPO A7x 全面屏', '2220', '300', '【新品上市】4+128大内存，水滴屏，AI智能双摄', '2019/5/25 15:25:00', '火焰蓝&星空紫', 'OPPO_A7x_1.jpg&OPPO_A7x_2.jpg', '汇通数码风暴专营店', '10123');
INSERT INTO `zol_goods` VALUES ('14', 'phone', '5700', '【新品低价开团】华为 P30 8GB麒麟980AI智能芯片', '4220', '200', '【华为官方直供货源】6.1英寸OLED全面屏，屏内指纹，超感光徕卡三摄，30倍数码变焦', '2019/5/25 15:45:00', '极光色&天空之境&亮黑色', 'p30_1.jpg&p30_2.jpg&p30_2.jpg', '环宇荣合专营店', '1012');
INSERT INTO `zol_goods` VALUES ('15', 'computer', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '400', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg&Y7000_2.jpg&Y7000_3.jpg', '甲骨龙旗舰店', '10125');
INSERT INTO `zol_goods` VALUES ('16', 'computer', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', '400', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg&YX570_2.jpg&YX570_3.jpg', '汇通数码风暴专营店', '10126');
INSERT INTO `zol_goods` VALUES ('17', 'computer', '6200', '华硕（ASUS） FX80GE8300 15.6英寸 商务办公', '5000', '200', 'i5 8G 256G 1050TI -4G 原装正品 全国联保 顺丰包邮', '2019/6/20 15:25:00', 'i5 8G 256G 1050TI -4G', 'FX80GE8300_1.jpg&FX80GE8300_2.jpg&FX80GE8300_3.jpg', '环宇荣合专营店', '10127');
INSERT INTO `zol_goods` VALUES ('18', 'DIY', '5003', '甲骨龙 九代I5 9400F RTX2070 8G独显', '4500', '100', '配置三', '2019/6/20 13:25:00', '配置-&配置二&配置三', '9400F.jpg', '甲骨龙旗舰店', '3456');
INSERT INTO `zol_goods` VALUES ('19', 'DIY', '5203', '甲骨龙 新品9代I5 9600K RXT2060 6G独显 1T', '4700', '100', '标配加装1T机械盘', '2019/6/20 19:25:00', '配置-&配置二&配置三', '9600K.png', '汇通数码风暴专营店', '10129');
INSERT INTO `zol_goods` VALUES ('20', 'shuma', '3900', '佳能100d (EF 40mm f/2.8 STM)白色', '3000', '200', '限时甩 时尚小单反 轻便 Q版', '2019/6/29 19:25:00', '白色', '100d_1.jpg&100d_2.jpg', '环宇荣合专营店', '10130');
INSERT INTO `zol_goods` VALUES ('21', 'listen', '1000', 'difier/漫步者 G4电脑耳机头戴式电竞吃鸡游戏耳麦', '400', '80', '头戴式电竞吃鸡游戏耳麦', '2019/8/29 19:25:00', '红色', 'difier_1.jpg&difier_2.jpg', '甲骨龙旗舰店', '10131');
INSERT INTO `zol_goods` VALUES ('22', 'intel', '400', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人 粉色', '700', '80', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人', '2019/7/29 10:25:00', '白色&粉色', 'zhiqren.jpg', '汇通数码风暴专营店', '10132');
INSERT INTO `zol_goods` VALUES ('23', 'phone', '4200', '【低价开团】现货荣耀Magic2 麒麟980AI智能芯片 8GB', '3220', '300', '国行原装正品，支持全国联保，麒麟980，6.39英寸全视屏，超广角AI三摄，魔法降临!', '2019/5/22 15:25:00', '渐变黑&渐变红&渐变蓝', 'magic2_1.jpg&magic2_2.jpg&magic2_3.jpg', '环宇荣合专营店', '10133');
INSERT INTO `zol_goods` VALUES ('24', 'phone', '3700', '【低价开团】OPPO OPPO A7x 全面屏', '2220', '300', '【新品上市】4+128大内存，水滴屏，AI智能双摄', '2019/5/25 15:25:00', '火焰蓝&星空紫', 'OPPO_A7x_1.jpg&OPPO_A7x_2.jpg', '甲骨龙旗舰店', '10134');
INSERT INTO `zol_goods` VALUES ('25', 'phone', '5700', '【新品低价开团】华为 P30 8GB麒麟980AI智能芯片', '4220', '200', '【华为官方直供货源】6.1英寸OLED全面屏，屏内指纹，超感光徕卡三摄，30倍数码变焦', '2019/5/22 15:25:00', '极光色&天空之境&亮黑色', 'p30_1.jpg&p30_2.jpg&p30_2.jpg', '汇通数码风暴专营店', '10135');
INSERT INTO `zol_goods` VALUES ('26', 'computer', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '400', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg&Y7000_2.jpg&Y7000_3.jpg', '环宇荣合专营店', '10136');
INSERT INTO `zol_goods` VALUES ('27', 'computer', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', '400', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg&YX570_2.jpg&YX570_3.jpg', '甲骨龙旗舰店', '10137');
INSERT INTO `zol_goods` VALUES ('28', 'computer', '6200', '华硕（ASUS） FX80GE8300 15.6英寸 商务办公', '5000', '200', 'i5 8G 256G 1050TI -4G 原装正品 全国联保 顺丰包邮', '2019/6/20 15:25:00', 'i5 8G 256G 1050TI -4G', 'FX80GE8300_1.jpg&FX80GE8300_2.jpg&FX80GE8300_3.jpg', '汇通数码风暴专营店', '904');
INSERT INTO `zol_goods` VALUES ('29', 'DIY', '5003', '甲骨龙 九代I5 9400F RTX2070 8G独显', '4500', '100', '配置三', '2019/6/20 13:25:00', '配置-&配置二&配置三', '9400F.jpg', '环宇荣合专营店', '10139');
INSERT INTO `zol_goods` VALUES ('30', 'DIY', '5203', '甲骨龙 新品9代I5 9600K RXT2060 6G独显 1T', '4700', '100', '标配加装1T机械盘', '2019/6/20 19:25:00', '配置-&配置二&配置三', '9600K.png', '甲骨龙旗舰店', '10140');
INSERT INTO `zol_goods` VALUES ('31', 'shuma', '3900', '佳能100d (EF 40mm f/2.8 STM)白色', '3000', '200', '限时甩 时尚小单反 轻便 Q版', '2019/6/29 19:25:00', '白色', '100d_1.jpg&100d_2.jpg', '汇通数码风暴专营店', '10141');
INSERT INTO `zol_goods` VALUES ('32', 'listen', '1000', 'difier/漫步者 G4电脑耳机头戴式电竞吃鸡游戏耳麦', '1200', '100', '头戴式电竞吃鸡游戏耳麦', '2019/8/29 19:25:00', '红色', 'difier_1.jpg&difier_2.jpg', '环宇荣合专营店', '10142');
INSERT INTO `zol_goods` VALUES ('33', 'intel', '400', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人 粉色', '500', '3', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人', '2019/5/29 15:25:00', '白色&粉色', 'zhiqren.jpg', '甲骨龙旗舰店', '10143');
INSERT INTO `zol_goods` VALUES ('34', 'phone', '4200', '【低价开团】现货荣耀Magic2 麒麟980AI智能芯片 8GB', '3220', '300', '国行原装正品，支持全国联保，麒麟980，6.39英寸全视屏，超广角AI三摄，魔法降临!', '2019/5/25 15:23:00', '渐变黑&渐变红&渐变蓝', 'magic2_1.jpg&magic2_2.jpg&magic2_3.jpg', '汇通数码风暴专营店', '10144');
INSERT INTO `zol_goods` VALUES ('35', 'phone', '3700', '【低价开团】OPPO OPPO A7x 全面屏', '2220', '300', '【新品上市】4+128大内存，水滴屏，AI智能双摄', '2019/5/25 15:25:00', '火焰蓝&星空紫', 'OPPO_A7x_1.jpg&OPPO_A7x_2.jpg', '环宇荣合专营店', '10145');
INSERT INTO `zol_goods` VALUES ('36', 'phone', '5700', '【新品低价开团】华为 P30 8GB麒麟980AI智能芯片', '4220', '200', '【华为官方直供货源】6.1英寸OLED全面屏，屏内指纹，超感光徕卡三摄，30倍数码变焦', '2019/5/22 15:25:00', '极光色&天空之境&亮黑色', 'p30_1.jpg&p30_2.jpg&p30_2.jpg', '甲骨龙旗舰店', '10146');
INSERT INTO `zol_goods` VALUES ('37', 'computer', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '400', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg&Y7000_2.jpg&Y7000_3.jpg', '汇通数码风暴专营店', '10147');
INSERT INTO `zol_goods` VALUES ('38', 'computer', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', '400', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg&YX570_2.jpg&YX570_3.jpg', '环宇荣合专营店', '10148');
INSERT INTO `zol_goods` VALUES ('39', 'computer', '6200', '华硕（ASUS） FX80GE8300 15.6英寸 商务办公', '5000', '200', 'i5 8G 256G 1050TI -4G 原装正品 全国联保 顺丰包邮', '2019/6/20 15:25:00', 'i5 8G 256G 1050TI -4G', 'FX80GE8300_1.jpg&FX80GE8300_2.jpg&FX80GE8300_3.jpg', '甲骨龙旗舰店', '10149');
INSERT INTO `zol_goods` VALUES ('40', 'DIY', '5003', '甲骨龙 九代I5 9400F RTX2070 8G独显', '4500', '100', '配置三', '2019/6/20 13:25:00', '配置-&配置二&配置三', '9400F.jpg', '汇通数码风暴专营店', '10150');
INSERT INTO `zol_goods` VALUES ('41', 'DIY', '5203', '甲骨龙 新品9代I5 9600K RXT2060 6G独显 1T', '4700', '100', '标配加装1T机械盘', '2019/6/20 19:25:00', '配置-&配置二&配置三', '9600K.png', '环宇荣合专营店', '10151');
INSERT INTO `zol_goods` VALUES ('42', 'shuma', '3900', '佳能100d (EF 40mm f/2.8 STM)白色', '3000', '200', '限时甩 时尚小单反 轻便 Q版', '2019/6/29 19:25:00', '白色', '100d_1.jpg&100d_2.jpg', '甲骨龙旗舰店', '10152');
INSERT INTO `zol_goods` VALUES ('43', 'listen', '1000', 'difier/漫步者 G4电脑耳机头戴式电竞吃鸡游戏耳麦', '920', '10', '头戴式电竞吃鸡游戏耳麦', '2019/8/29 19:25:00', '红色', 'difier_1.jpg&difier_2.jpg', '汇通数码风暴专营店', '10153');
INSERT INTO `zol_goods` VALUES ('44', 'intel', '400', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人 粉色', '3000', '30', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人', '2019/6/29 9:25:00', '白色&粉色', 'zhiqren.jpg', '环宇荣合专营店', '10154');
INSERT INTO `zol_goods` VALUES ('45', 'phone', '4200', '【低价开团】现货荣耀Magic2 麒麟980AI智能芯片 8GB', '3220', '300', '国行原装正品，支持全国联保，麒麟980，6.39英寸全视屏，超广角AI三摄，魔法降临!', '2019/7/29 15:25:00', '渐变黑&渐变红&渐变蓝', 'magic2_1.jpg&magic2_2.jpg&magic2_3.jpg', '甲骨龙旗舰店', '10155');
INSERT INTO `zol_goods` VALUES ('46', 'phone', '3700', '【低价开团】OPPO OPPO A7x 全面屏', '2220', '300', '【新品上市】4+128大内存，水滴屏，AI智能双摄', '2019/5/25 15:25:00', '火焰蓝&星空紫', 'OPPO_A7x_1.jpg&OPPO_A7x_2.jpg', '汇通数码风暴专营店', '10156');
INSERT INTO `zol_goods` VALUES ('47', 'phone', '5700', '【新品低价开团】华为 P30 8GB麒麟980AI智能芯片', '4220', '200', '【华为官方直供货源】6.1英寸OLED全面屏，屏内指纹，超感光徕卡三摄，30倍数码变焦', '2019/5/22 15:25:00', '极光色&天空之境&亮黑色', 'p30_1.jpg&p30_2.jpg&p30_2.jpg', '环宇荣合专营店', '10157');
INSERT INTO `zol_goods` VALUES ('48', 'computer', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '400', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg&Y7000_2.jpg&Y7000_3.jpg', '甲骨龙旗舰店', '10158');
INSERT INTO `zol_goods` VALUES ('49', 'computer', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', '400', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg&YX570_2.jpg&YX570_3.jpg', '汇通数码风暴专营店', '10159');
INSERT INTO `zol_goods` VALUES ('50', 'computer', '6200', '华硕（ASUS） FX80GE8300 15.6英寸 商务办公', '5000', '200', 'i5 8G 256G 1050TI -4G 原装正品 全国联保 顺丰包邮', '2019/6/20 15:25:00', 'i5 8G 256G 1050TI -4G', 'FX80GE8300_1.jpg&FX80GE8300_2.jpg&FX80GE8300_3.jpg', '环宇荣合专营店', '10160');
INSERT INTO `zol_goods` VALUES ('51', 'DIY', '5003', '甲骨龙 九代I5 9400F RTX2070 8G独显', '4500', '100', '配置三', '2019/6/20 13:25:00', '配置-&配置二&配置三', '9400F.jpg', '甲骨龙旗舰店', '10161');
INSERT INTO `zol_goods` VALUES ('52', 'DIY', '5203', '甲骨龙 新品9代I5 9600K RXT2060 6G独显 1T', '4700', '100', '标配加装1T机械盘', '2019/6/20 19:25:00', '配置-&配置二&配置三', '9600K.png', '汇通数码风暴专营店', '10162');
INSERT INTO `zol_goods` VALUES ('53', 'shuma', '3900', '佳能100d (EF 40mm f/2.8 STM)白色', '3000', '200', '限时甩 时尚小单反 轻便 Q版', '2019/6/29 19:25:00', '白色', '100d_1.jpg&100d_2.jpg', '环宇荣合专营店', '10163');
INSERT INTO `zol_goods` VALUES ('54', 'listen', '1000', 'difier/漫步者 G4电脑耳机头戴式电竞吃鸡游戏耳麦', '900', '80', '头戴式电竞吃鸡游戏耳麦', '2019/8/29 19:22:00', '红色', 'difier_1.jpg&difier_2.jpg', '甲骨龙旗舰店', '10164');
INSERT INTO `zol_goods` VALUES ('55', 'intel', '400', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人 粉色', '300', '30', '讯飞淘云阿尔法蛋机智侠智能机器人讯飞淘云儿童早教机器人', '2019/6/29 17:25:00', '白色&粉色', 'zhiqren.jpg', '汇通数码风暴专营店', '10165');

-- ----------------------------
-- Table structure for zol_mes
-- ----------------------------
DROP TABLE IF EXISTS `zol_mes`;
CREATE TABLE `zol_mes` (
  `m_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_content` varchar(255) NOT NULL,
  `xingxing` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `m_time` varchar(255) DEFAULT NULL,
  `u_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zol_mes
-- ----------------------------
INSERT INTO `zol_mes` VALUES ('30', '我女朋友打我了', '3', '22', '2019-4-16', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('31', '她真的打我了 我想哭', '6', '22', '2019-4-16', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('32', '我先我是', '1', '22', '2019-4-16', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('35', '不好用啊', '4', '22', '2019-4-17', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('36', '不要这是 ', '6', '22', '2019-4-17', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('37', '这是打打', '3', '22', '2019-4-17', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('38', '不要试着是', '5', '23', '2019-4-17', 'zol_hf2xflxcx9');
INSERT INTO `zol_mes` VALUES ('39', '*** 打', '4', '22', '2019-4-17', 'zol_32muk9cbhj');
INSERT INTO `zol_mes` VALUES ('40', '你师弟是', '4', '26', '2019-4-18', 'zol_jk4r8y8zy5');

-- ----------------------------
-- Table structure for zol_order
-- ----------------------------
DROP TABLE IF EXISTS `zol_order`;
CREATE TABLE `zol_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `original_price` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `now_price` int(11) DEFAULT NULL,
  `magges` varchar(255) DEFAULT NULL,
  `buy_time` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `storeName` varchar(255) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `sale_num` int(11) DEFAULT NULL,
  `u_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zol_order
-- ----------------------------
INSERT INTO `zol_order` VALUES ('90', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg', '汇通数码风暴专营店', '4', '4', '14577845578');
INSERT INTO `zol_order` VALUES ('91', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg', '环宇荣合专营店', '5', '5', '14577845578');
INSERT INTO `zol_order` VALUES ('94', '5900', '联想(Lenovo)拯救者Y7000英特尔酷睿i5 15.6英寸', '6200', '全新正品 全国包邮 I5-8300H-8G-2T+128G-4G-W10', '2019/5/25 15:25:00', 'I5-8300H-8G-2T+128G-4G-W10', 'Y7000_1.jpg', '汇通数码风暴专营店', '4', '1', '15877845578');
INSERT INTO `zol_order` VALUES ('95', '5003', '甲骨龙 九代I5 9400F RTX2070 8G独显', '4500', '配置三', '2019/5/29 15:25:00', '配置三', '9400F.jpg', '汇通数码风暴专营店', '7', '3', '15877845578');
INSERT INTO `zol_order` VALUES ('98', '7900', '华硕（ASUS）华硕顽石热血版YX570笔记本电脑15.6英寸', '5200', 'R5 2500 4G 1T 1050-2G', '2019/6/25 15:25:00', 'R5 2500 4G 1T 1050-2G', 'YX570_1.jpg', '环宇荣合专营店', '5', '4', '13411328832');

-- ----------------------------
-- Table structure for zol_users
-- ----------------------------
DROP TABLE IF EXISTS `zol_users`;
CREATE TABLE `zol_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zol_users
-- ----------------------------
INSERT INTO `zol_users` VALUES ('22', 'zol_32muk9cbhj', '123456789', '15877845578');
INSERT INTO `zol_users` VALUES ('23', 'zol_hf2xflxcx9', '159753', '14577845578');
INSERT INTO `zol_users` VALUES ('26', 'zol_jk4r8y8zy5', '119119din', '13411328832');
INSERT INTO `zol_users` VALUES ('25', 'zol_xgkmj97c2x', '123456789', '13444574480');
SET FOREIGN_KEY_CHECKS=1;
