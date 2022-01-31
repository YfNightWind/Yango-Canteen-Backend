/*
 Navicat Premium Data Transfer

 Source Server         : AlexLin
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 114.215.209.136:3306
 Source Schema         : schoolfood

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 31/01/2022 16:21:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `name` varchar(20) NOT NULL,
  `explain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('便餐类', '各楼层的快餐');
INSERT INTO `category` VALUES ('套餐类', '有菜又有饭的，或者标明是套餐的');
INSERT INTO `category` VALUES ('小吃类', '顾名思义，火腿肠，汉堡，烤冷面，白果之类的单品，别把饮品写进来');
INSERT INTO `category` VALUES ('早餐类', '无法归属于其它类的早餐食物，例如某些楼早上特有的卤蛋，或者烧卖之类的');
INSERT INTO `category` VALUES ('杂项类', '香锅，麻辣烫之类的菜品');
INSERT INTO `category` VALUES ('汤类', '顾名思义');
INSERT INTO `category` VALUES ('粥类', '顾名思义');
INSERT INTO `category` VALUES ('面食类', '包子，馒头，有汤有粉，或有汤有面等由面粉制作的食物');
INSERT INTO `category` VALUES ('饮品类', '顾名思义');
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `comment` text NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_username` (`username`),
  CONSTRAINT `comment_username` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
INSERT INTO `comments` VALUES (8, 'user', 'delicious', '2021-06-09 17:56:31');
INSERT INTO `comments` VALUES (9, 'user', '喜刷刷', '2021-06-09 18:01:04');
INSERT INTO `comments` VALUES (10, 'user', '啦啦啦', '2021-06-24 23:52:14');
COMMIT;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `username` varchar(30) NOT NULL,
  `favorite` varchar(60) NOT NULL,
  PRIMARY KEY (`username`,`favorite`),
  CONSTRAINT `favorite_username` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------
BEGIN;
INSERT INTO `favorite` VALUES ('user', '粉面世家');
COMMIT;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `username` varchar(30) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `feedback` text NOT NULL,
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
BEGIN;
INSERT INTO `feedback` VALUES ('280', 'contact', 'ff');
INSERT INTO `feedback` VALUES ('user', 'fd', '');
INSERT INTO `feedback` VALUES ('user', 'ffdd', 'dffdfdf');
INSERT INTO `feedback` VALUES ('undefined', 'woshinidie', '13809563579');
INSERT INTO `feedback` VALUES ('undefined', '丰富的腹股沟', '233');
INSERT INTO `feedback` VALUES ('undefined', '徐哈哈哈', '');
INSERT INTO `feedback` VALUES ('undefined', '个人奋斗通过', '');
INSERT INTO `feedback` VALUES ('undefined', '测试成功', '13809563579');
INSERT INTO `feedback` VALUES ('undefined', '不给你危险2', '最终测试成功，功能一万次2');
INSERT INTO `feedback` VALUES ('user', 'f13414}', 'ffdfdf');
INSERT INTO `feedback` VALUES ('undefined', '18120911190}', '我是傻逼');
INSERT INTO `feedback` VALUES ('280', 'contact', 'ff');
INSERT INTO `feedback` VALUES ('undefined', '977782528}', 'Test');
INSERT INTO `feedback` VALUES ('undefined', 'vbhh}', 'bbvbj');
INSERT INTO `feedback` VALUES ('undefined', '1637827581}', '莫得食欲');
INSERT INTO `feedback` VALUES ('undefined', '18120911190}', '啧啧啧');
INSERT INTO `feedback` VALUES ('undefined', '}', '还行吧');
INSERT INTO `feedback` VALUES ('undefined', '}', '嘤嘤嘤');
INSERT INTO `feedback` VALUES ('undefined', '}', '。。。。');
INSERT INTO `feedback` VALUES ('undefined', '}', '嗨咯，小黑');
INSERT INTO `feedback` VALUES ('undefined', '}', '嗨咯，小鹦鹉');
INSERT INTO `feedback` VALUES ('undefined', '}', '嗨咯，小');
INSERT INTO `feedback` VALUES ('user', '123', '无');
INSERT INTO `feedback` VALUES ('2807', 'eijejssjejsjsjsjeejejej}', 'eusueiwieiowowowow');
INSERT INTO `feedback` VALUES ('dad', '}', 'fuck of little yuhon');
INSERT INTO `feedback` VALUES ('dad', '}', '嘤嘤嘤');
INSERT INTO `feedback` VALUES ('dad', '}', '');
INSERT INTO `feedback` VALUES ('dad', '}', '');
INSERT INTO `feedback` VALUES ('dad', '}', '');
INSERT INTO `feedback` VALUES ('dad', '}', '1');
INSERT INTO `feedback` VALUES ('alex', 'alex新注册用户}', '查看用户名是否正确以及 是否反馈成功');
INSERT INTO `feedback` VALUES ('a', 'springboot测试2', '13809563579');
INSERT INTO `feedback` VALUES ('a', 'springboot测试3', '13809563579');
INSERT INTO `feedback` VALUES ('a', '2', '2');
INSERT INTO `feedback` VALUES ('a', '3', '3');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `name` varchar(15) NOT NULL,
  `restaurant` varchar(15) NOT NULL,
  `category` varchar(15) NOT NULL,
  `price` varchar(4) NOT NULL,
  `score` int(1) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurant`,`name`),
  KEY `catogory` (`category`),
  CONSTRAINT `catogory` FOREIGN KEY (`category`) REFERENCES `category` (`name`),
  CONSTRAINT `restaurant_name` FOREIGN KEY (`restaurant`) REFERENCES `restaurant` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('荤素一个价', '3楼麻辣香锅(1.98/50g', '套餐类', '1.98', NULL, NULL);
INSERT INTO `menu` VALUES ('一颗柠檬红', 'D杯', '饮品类', '9.90', NULL, NULL);
INSERT INTO `menu` VALUES ('一颗柠檬绿', 'D杯', '饮品类', '9.90', NULL, NULL);
INSERT INTO `menu` VALUES ('七分甜', 'D杯', '杂项类', '0.00', NULL, NULL);
INSERT INTO `menu` VALUES ('芋泥波波奶茶/奶绿（中杯）', 'D杯', '饮品类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青翠茉莉+鲜奶盖（大杯）', 'D杯', '饮品类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青翠茉莉+鲜奶盖（超大杯1L）', 'D杯', '饮品类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青翠茉莉（大杯）', 'D杯', '饮品类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('青翠茉莉（超大杯1L）', 'D杯', '饮品类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜奶盖', 'D杯', '杂项类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('麻薯', 'D杯', '杂项类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('F+牛肉饭', 'F牛肉饭', '套餐类', '18.0', NULL, NULL);
INSERT INTO `menu` VALUES ('可乐鸡', 'F牛肉饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('台湾卤肉', 'F牛肉饭', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('宫保鸡丁', 'F牛肉饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('巴西烤香鸡', 'F牛肉饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡扒拼牛肉', 'F牛肉饭', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡扒拼茄子', 'F牛肉饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('黑椒鸡扒', 'F牛肉饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('原味渔粉', '五谷渔粉', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('小笼包', '五谷渔粉', '面食类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('拌面', '五谷渔粉', '面食类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('招牌渔粉', '五谷渔粉', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('清汤面', '五谷渔粉', '面食类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('牛杂汤', '五谷渔粉', '汤类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('牛杂汤+芋头饭', '五谷渔粉', '早餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('香辣培根粉', '五谷渔粉', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('香辣肥肠粉', '五谷渔粉', '面食类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鱼丸粉', '五谷渔粉', '面食类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鱼头渔粉', '五谷渔粉', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鱼豆腐粉', '五谷渔粉', '面食类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡排粉', '五谷渔粉', '面食类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣牛肉粉', '五谷渔粉', '面食类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('龙利渔粉', '五谷渔粉', '面食类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('兰州炒饭', '兰州拉面', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('回锅牛肉盖浇面', '兰州拉面', '面食类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('牛肉烩面', '兰州拉面', '面食类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青椒土豆丝盖浇面', '兰州拉面', '面食类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青椒土豆丝盖浇饭', '兰州拉面', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青椒牛肉盖浇面', '兰州拉面', '面食类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('五香卷', '回洋號', '杂项类', '4.50', NULL, NULL);
INSERT INTO `menu` VALUES ('削骨肉', '回洋號', '杂项类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('卤大肠', '回洋號', '杂项类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('卤小肠', '回洋號', '杂项类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('卤笋', '回洋號', '杂项类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('卤罗汉肉', '回洋號', '杂项类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('豆美丝', '回洋號', '杂项类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('金针茹', '回洋號', '杂项类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('飘香拌面/粉', '回洋號', '面食类', '4.00', NULL, NULL);
INSERT INTO `menu` VALUES ('招牌烤猪肉饭（小份）', '土耳其烤肉饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('招牌烤鸡肉饭', '土耳其烤肉饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('海带萝卜排骨汤', '土耳其烤肉饭', '汤类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('米饭+小菜+炝肉汤', '土耳其烤肉饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('肉夹馍+海带萝卜排骨汤', '土耳其烤肉饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('肉夹馍+香菇豆腐炝肉汤', '土耳其烤肉饭', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('香菇豆腐炝肉汤', '土耳其烤肉饭', '汤类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('土豆卷', '好粥道', '早餐类', '4.50', NULL, NULL);
INSERT INTO `menu` VALUES ('奶黄包', '好粥道', '早餐类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('寿司', '好粥道', '早餐类', '4.50', NULL, NULL);
INSERT INTO `menu` VALUES ('马拉糕', '好粥道', '早餐类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡排饼', '好粥道', '面食类', '5.50', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡柳饼', '好粥道', '早餐类', '4.50', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡蛋肉饼', '好粥道', '面食类', '5.50', NULL, NULL);
INSERT INTO `menu` VALUES ('小明家', '小明家1.98/50g', '杂项类', '1.98', NULL, NULL);
INSERT INTO `menu` VALUES ('上校炸鸡块', '小鲜肉快餐', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('八宝粥', '小黑餐点', '早餐类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉包', '小黑餐点', '面食类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡蛋饼', '小黑餐点', '面食类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣豆腐包', '小黑餐点', '面食类', '1.50', NULL, NULL);
INSERT INTO `menu` VALUES ('卤猪头饭', '木桶盖浇饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('泡菜鸡肉（微酸微辣）', '水煮世家', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('泡菜黑鱼（微酸微辣）', '水煮世家', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('金汤柠檬馋嘴蛙（偏酸微辣）', '水煮世家', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('金汤柠檬鱼片（偏酸微辣）', '水煮世家', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('金汤酸菜鱼片（偏酸微辣）', '水煮世家', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('金汤鸡肉（偏酸微辣）', '水煮世家', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('金汤黑鱼（偏酸微辣）', '水煮世家', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青椒土豆丝炒饭', '水煮世家', '套餐类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('培根烫饭', '江左盟主', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣烫鸡肉面/饭', '江左盟主', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣烫鸭心面/饭', '江左盟主', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣烫鸭腿面/饭', '江左盟主', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('香锅荤素一口价，口味：清炒、微', '江左盟主（1.9/50g）', '杂项类', '1.90', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣烫荤素一口价，口味：锅底高', '江左盟主（1.9/50g）', '套餐类', '1.90', NULL, NULL);
INSERT INTO `menu` VALUES ('丸子+三素', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('奥尔良腿排+三素', '海南鸡饭', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('孜然烤肠+两素+卤蛋', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('椰子鸡汤', '海南鸡饭', '汤类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('洋烧排+两素+卤蛋', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('滑炒牛片+两素+卤蛋', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('里脊肉+三素', '海南鸡饭', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('飘香里脊焖饭', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡柳+三素', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭杂+三素', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('黑椒肉柳焖饭', '海南鸡饭', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('三鲜水饺（大份）', '淳百味', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('三鲜水饺（小份）', '淳百味', '面食类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('五香蛋', '淳百味', '小吃类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('原味扁肉', '淳百味', '面食类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('台式卤肉饭', '淳百味', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('咸肉拌饭', '淳百味', '套餐类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('套餐1 飘香拌面+原味扁肉', '淳百味', '套餐类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('套餐A 咸肉拌饭+鲍汁鱼丸', '淳百味', '套餐类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('套餐B 咸肉拌饭+原味扁肉', '淳百味', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('套餐C 咸肉拌饭+牛肉羹', '淳百味', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('情侣锅贴（大）', '淳百味', '小吃类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('情侣锅贴（小）', '淳百味', '小吃类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('香菇肉丝面', '源味沙县', '面食类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鱼丸汤', '源味沙县', '汤类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉水饺', '源味沙县', '面食类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡蛋肉丝面', '源味沙县', '面食类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('9.9元/3两', '烤盘饭', '杂项类', '9.90', NULL, NULL);
INSERT INTO `menu` VALUES ('培根肉土豆片', '烤盘饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('菜花烤盘饭', '烤盘饭', '套餐类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('风味烤盘土豆片', '烤盘饭', '套餐类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡柳烤杏鲍菇', '烤盘饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES (' 鸡蛋肉泥', '烤肉拌饭瓦罐', '汤类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('全肉烤肉拌饭（大）', '烤肉拌饭瓦罐', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('全肉烤肉拌饭（小）', '烤肉拌饭瓦罐', '套餐类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('虫草花上排', '烤肉拌饭瓦罐', '汤类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('蜜汁烤肉拌饭（大）', '烤肉拌饭瓦罐', '套餐类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('蜜汁烤肉拌饭（小）', '烤肉拌饭瓦罐', '套餐类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('豆腐上排', '烤肉拌饭瓦罐', '汤类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣鲜香烤鱼', '烤鱼饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣鲜香锅包肉/鸡翅根', '烤鱼饭', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣鲜香雪鱼', '烤鱼饭', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣鲜香鱼饭(炝锅)', '烤鱼饭', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('黑椒牛肉(炝牛肉)', '烤鱼饭', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('荤素一个价，口味：清汤、微辣、', '王喜峰麻辣烫(1.98/50g', '杂项类', '1.98', NULL, NULL);
INSERT INTO `menu` VALUES ('云海大红袍', '益禾堂', '饮品类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('冻柠咖', '益禾堂', '饮品类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('日照红茶', '益禾堂', '饮品类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('杨枝甘露', '益禾堂', '饮品类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('桃桃么么茶', '益禾堂', '饮品类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('泷洙奶茶', '益禾堂', '饮品类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('牛奶烧仙草', '益禾堂', '饮品类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('23', '石锅坊', '套餐类', '20.0', NULL, NULL);
INSERT INTO `menu` VALUES ('233', '石锅坊', '套餐类', '20.0', NULL, NULL);
INSERT INTO `menu` VALUES ('2333', '石锅坊', '套餐类', '20.0', NULL, NULL);
INSERT INTO `menu` VALUES ('23334', '石锅坊', '套餐类', '20.0', NULL, NULL);
INSERT INTO `menu` VALUES ('五花肉+泡菜石锅拌饭', '石锅坊', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('猪肉+奥尔良鸡肉石锅拌饭', '石锅坊', '套餐类', '17.0', NULL, NULL);
INSERT INTO `menu` VALUES ('猪肉石锅拌饭', '石锅坊', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('芝士+泡菜石锅拌饭', '石锅坊', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('芝士+鸡肉石锅拌饭', '石锅坊', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('芝士石锅拌饭', '石锅坊', '套餐类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡汤', '福味團團', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡腿', '福味團團', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭汤', '福味團團', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭血', '福味團團', '便餐类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('五香卷粉', '粉面世家', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('五香卷面', '粉面世家', '面食类', '13.0', NULL, NULL);
INSERT INTO `menu` VALUES ('卤蛋', '粉面世家', '小吃类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭血粉', '粉面世家', '面食类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭血面', '粉面世家', '面食类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('石锅小鲜肉', '缘味先石锅饭', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('石锅焖面', '缘味先石锅饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('石锅肥牛', '缘味先石锅饭', '套餐类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('红烧肉', '美味自选快餐', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('红烧茄子', '美味自选快餐', '便餐类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('全家福大馄饨（小碗）', '老上海馄饨', '面食类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('卤肉粉', '老上海馄饨', '面食类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('卤肉面', '老上海馄饨', '面食类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('干贝大馄饨（大碗）', '老上海馄饨', '面食类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('干贝大馄饨（小碗）', '老上海馄饨', '面食类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉小馄饨（大碗）', '老上海馄饨', '面食类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭腿饭+烫嘴豆腐', '老北京杂酱面', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('蜜枣花生粽', '肠粉肉粽', '小吃类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉双蛋肠粉', '肠粉肉粽', '小吃类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉蛋玉米肠粉', '肠粉肉粽', '小吃类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉蛋粉+福鼎肉片', '肠粉肉粽', '套餐类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉蛋肠粉', '肠粉肉粽', '小吃类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('水煮豆花鱼片饭（麻辣）', '苗家酸菜鱼饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('水煮鸡肉饭（麻辣）', '苗家酸菜鱼饭', '套餐类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('水煮鸭胗饭（麻辣）', '苗家酸菜鱼饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('韩式泡菜煲（含饭）', '苗家酸菜鱼饭', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鱼头豆腐煲（含饭）', '苗家酸菜鱼饭', '套餐类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES (' 叉烧包', '营养快餐', '早餐类', '3.50', NULL, NULL);
INSERT INTO `menu` VALUES (' 烧麦', '营养快餐', '早餐类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('豆干片', '营养快餐', '便餐类', '1.00', NULL, NULL);
INSERT INTO `menu` VALUES ('豆芽（小份）', '营养快餐', '便餐类', '1.00', NULL, NULL);
INSERT INTO `menu` VALUES ('辣子鸡', '营养快餐', '便餐类', '5.50', NULL, NULL);
INSERT INTO `menu` VALUES ('酸菜鱼', '营养快餐', '便餐类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('七喜', '豪客吉', '饮品类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('七虾堡', '豪客吉', '小吃类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('三人套餐(中式鸡腿堡+鸡蛋培根', '豪客吉', '套餐类', '61.0', NULL, NULL);
INSERT INTO `menu` VALUES ('中式藤椒鸡腿堡', '豪客吉', '小吃类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('劲脆七虾堡', '豪客吉', '小吃类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('可乐', '豪客吉', '饮品类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('周一特惠套餐(中式鸡腿堡+香辣', '豪客吉', '套餐类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('套餐A(中式鸡腿堡+薯条+中可', '豪客吉', '套餐类', '22.0', NULL, NULL);
INSERT INTO `menu` VALUES ('套餐B(鸭皇堡+傲娇辣翅+中可', '豪客吉', '套餐类', '27.0', NULL, NULL);
INSERT INTO `menu` VALUES ('香芋甜心', '豪客吉', '小吃类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('香辣鸡腿堡', '豪客吉', '小吃类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡米花', '豪客吉', '小吃类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡肉卷', '豪客吉', '小吃类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸡蛋培根堡', '豪客吉', '小吃类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭皇堡', '豪客吉', '小吃类', '16.0', NULL, NULL);
INSERT INTO `menu` VALUES ('黑椒鸡块', '豪客吉', '小吃类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('三鲜猪肉水饺', '重庆小面', '面食类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('五香牛肉面/粉', '重庆小面', '面食类', '15.0', NULL, NULL);
INSERT INTO `menu` VALUES ('重庆小面', '重庆小面', '面食类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('重庆担担面', '重庆小面', '面食类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('重庆炸酱面', '重庆小面', '面食类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('重庆酸辣粉', '重庆小面', '面食类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('青椒肉丝面/粉', '重庆小面', '面食类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('韭菜猪肉水饺', '重庆小面', '面食类', '10.0', NULL, NULL);
INSERT INTO `menu` VALUES ('八宝粥', '面夫子', '粥类', '2.50', NULL, NULL);
INSERT INTO `menu` VALUES ('八珍糯米包', '面夫子', '面食类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('南瓜蒸糕', '面夫子', '面食类', '2.50', NULL, NULL);
INSERT INTO `menu` VALUES ('鲜肉包', '面夫子', '面食类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('黑米粥', '面夫子', '粥类', '2.50', NULL, NULL);
INSERT INTO `menu` VALUES ('前提子', '饭大人自选餐厅', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('卤蛋', '饭大人自选餐厅', '便餐类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('卤鸡腿', '饭大人自选餐厅', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('同安封肉', '饭大人自选餐厅', '便餐类', '5.00', NULL, NULL);
INSERT INTO `menu` VALUES ('啤酒鸭', '饭大人自选餐厅', '便餐类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('回锅肉', '饭大人自选餐厅', '便餐类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('宫保鸡丁', '饭大人自选餐厅', '便餐类', '3.00', NULL, NULL);
INSERT INTO `menu` VALUES ('原味奶茶绿', '鸡排风云', '饮品类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('台南花枝丸（大）', '鸡排风云', '小吃类', '12.0', NULL, NULL);
INSERT INTO `menu` VALUES ('台南花枝丸（标）', '鸡排风云', '小吃类', '7.00', NULL, NULL);
INSERT INTO `menu` VALUES ('台式薯条（大）', '鸡排风云', '小吃类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('台式薯条（标）', '鸡排风云', '小吃类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('喷香三角骨（大）', '鸡排风云', '小吃类', '14.0', NULL, NULL);
INSERT INTO `menu` VALUES ('喷香三角骨（标）', '鸡排风云', '小吃类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('奶香沙拉芝士棒（标）', '鸡排风云', '小吃类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('寒天', '鸡排风云', '杂项类', '2.00', NULL, NULL);
INSERT INTO `menu` VALUES ('寒天奶茶红', '鸡排风云', '饮品类', '9.00', NULL, NULL);
INSERT INTO `menu` VALUES ('蜂蜜红茶', '鸡排风云', '饮品类', '6.00', NULL, NULL);
INSERT INTO `menu` VALUES ('辣热脆皮鸡块（标）', '鸡排风云', '小吃类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('金桔柠檬', '鸡排风云', '饮品类', '8.00', NULL, NULL);
INSERT INTO `menu` VALUES ('鸭腿饭', '鸭寨夫人', '套餐类', '11.0', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣香锅 荤素搭配 不辣、微辣', '麻辣香锅(1.98/50g)', '杂项类', '1.98', NULL, NULL);
INSERT INTO `menu` VALUES ('麻辣香锅', '麻辣香锅1.98/50g 四楼', '杂项类', '1.98', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `name` varchar(15) NOT NULL,
  `floor` int(1) NOT NULL,
  `score` int(1) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
BEGIN;
INSERT INTO `restaurant` VALUES ('3楼麻辣香锅(1.98/50g', 3, NULL);
INSERT INTO `restaurant` VALUES ('7°sky', 3, NULL);
INSERT INTO `restaurant` VALUES ('D杯', 6, NULL);
INSERT INTO `restaurant` VALUES ('F牛肉饭', 5, NULL);
INSERT INTO `restaurant` VALUES ('五谷渔粉', 4, NULL);
INSERT INTO `restaurant` VALUES ('兰州拉面', 7, NULL);
INSERT INTO `restaurant` VALUES ('北方煎饼', 6, NULL);
INSERT INTO `restaurant` VALUES ('回洋號', 6, NULL);
INSERT INTO `restaurant` VALUES ('土耳其烤肉饭', 4, NULL);
INSERT INTO `restaurant` VALUES ('好粥道', 3, NULL);
INSERT INTO `restaurant` VALUES ('小明家1.98/50g', 4, NULL);
INSERT INTO `restaurant` VALUES ('小鲜肉快餐', 4, NULL);
INSERT INTO `restaurant` VALUES ('小黑餐点', 4, NULL);
INSERT INTO `restaurant` VALUES ('木桶盖浇饭', 7, NULL);
INSERT INTO `restaurant` VALUES ('水煮世家', 6, NULL);
INSERT INTO `restaurant` VALUES ('江左盟主', 6, NULL);
INSERT INTO `restaurant` VALUES ('江左盟主（1.9/50g）', 6, NULL);
INSERT INTO `restaurant` VALUES ('江左盟煮', 6, NULL);
INSERT INTO `restaurant` VALUES ('测试案例', 6, NULL);
INSERT INTO `restaurant` VALUES ('测试案例2', 6, NULL);
INSERT INTO `restaurant` VALUES ('海南鸡饭', 6, NULL);
INSERT INTO `restaurant` VALUES ('淳百味', 5, NULL);
INSERT INTO `restaurant` VALUES ('港式扒饭', 3, NULL);
INSERT INTO `restaurant` VALUES ('港式铁板烧', 6, NULL);
INSERT INTO `restaurant` VALUES ('源味沙县', 3, NULL);
INSERT INTO `restaurant` VALUES ('烤盘饭', 5, NULL);
INSERT INTO `restaurant` VALUES ('烤肉拌饭瓦罐', 7, NULL);
INSERT INTO `restaurant` VALUES ('烤鱼饭', 3, NULL);
INSERT INTO `restaurant` VALUES ('牛牛麻辣烫1.98/50g', 7, NULL);
INSERT INTO `restaurant` VALUES ('王喜峰麻辣烫(1.98/50g', 5, NULL);
INSERT INTO `restaurant` VALUES ('益禾堂', 4, NULL);
INSERT INTO `restaurant` VALUES ('石锅坊', 3, NULL);
INSERT INTO `restaurant` VALUES ('福味團團', 3, NULL);
INSERT INTO `restaurant` VALUES ('粉面世家', 7, NULL);
INSERT INTO `restaurant` VALUES ('缘味先石锅饭', 5, NULL);
INSERT INTO `restaurant` VALUES ('美味自选快餐', 2, NULL);
INSERT INTO `restaurant` VALUES ('老上海馄饨', 7, NULL);
INSERT INTO `restaurant` VALUES ('老北京杂酱面', 2, NULL);
INSERT INTO `restaurant` VALUES ('肠粉肉粽', 3, NULL);
INSERT INTO `restaurant` VALUES ('苗家酸菜鱼饭', 4, NULL);
INSERT INTO `restaurant` VALUES ('营养快餐', 7, NULL);
INSERT INTO `restaurant` VALUES ('豪客吉', 3, NULL);
INSERT INTO `restaurant` VALUES ('重庆小面', 4, NULL);
INSERT INTO `restaurant` VALUES ('闽南猪脚饭', 7, NULL);
INSERT INTO `restaurant` VALUES ('闽味熏鸭', 6, NULL);
INSERT INTO `restaurant` VALUES ('闽菜盖浇饭', 7, NULL);
INSERT INTO `restaurant` VALUES ('阳光小厨', 6, NULL);
INSERT INTO `restaurant` VALUES ('面夫子', 5, NULL);
INSERT INTO `restaurant` VALUES ('饭大人自选餐厅', 5, NULL);
INSERT INTO `restaurant` VALUES ('鸡排风云', 6, NULL);
INSERT INTO `restaurant` VALUES ('鸭寨夫人', 4, NULL);
INSERT INTO `restaurant` VALUES ('麻辣香锅(1.98/50g)', 5, NULL);
INSERT INTO `restaurant` VALUES ('麻辣香锅1.98/50g 四楼', 4, NULL);
COMMIT;

-- ----------------------------
-- Table structure for soup
-- ----------------------------
DROP TABLE IF EXISTS `soup`;
CREATE TABLE `soup` (
  `floor` int(1) NOT NULL,
  `name` varchar(15) NOT NULL,
  `week` int(1) NOT NULL,
  `score` int(1) DEFAULT NULL,
  PRIMARY KEY (`floor`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soup
-- ----------------------------
BEGIN;
INSERT INTO `soup` VALUES (5, '冬瓜海带汤', 1, NULL);
INSERT INTO `soup` VALUES (5, '心灵鸡汤', 5, NULL);
INSERT INTO `soup` VALUES (5, '番茄鸡蛋汤', 2, NULL);
INSERT INTO `soup` VALUES (5, '紫菜鸡蛋汤', 4, NULL);
INSERT INTO `soup` VALUES (5, '萝卜排骨汤', 6, NULL);
INSERT INTO `soup` VALUES (5, '豆腐肉丝汤', 3, NULL);
INSERT INTO `soup` VALUES (5, '金针菇蛋花汤', 7, NULL);
COMMIT;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `identity` int(1) NOT NULL DEFAULT '1',
  `token` longtext,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
BEGIN;
INSERT INTO `userinfo` VALUES ('280', '2802', 1, NULL);
INSERT INTO `userinfo` VALUES ('2802', '280code', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjI4MDIiLCJwYXNzd29yZCI6IjI4MGNvZGUiLCJpYXQiOjE2MjQ1MzE1MjcsImV4cCI6MTYyNzIwOTkyN30.tpyO0R97WM05KDUxyR6Z7qZ_D7VNEzyqcpSLwnnws-A');
INSERT INTO `userinfo` VALUES ('28022', '280code', 1, NULL);
INSERT INTO `userinfo` VALUES ('280222', '280code', 1, NULL);
INSERT INTO `userinfo` VALUES ('2807', 'eeee', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjI4MDciLCJwYXNzd29yZCI6ImVlZWUiLCJpYXQiOjE2MjQ3MTg4MDcsImV4cCI6MTYyNzM5NzIwN30.t7tODlIXkZ3oYvbyVbcNpGIAwSWryIRjnMRcy1JgGAE');
INSERT INTO `userinfo` VALUES ('280sb', '12345', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjI4MHNiIiwicGFzc3dvcmQiOiIxMjM0NSIsImlhdCI6MTYyNTU2NTg1MSwiZXhwIjoxNjI4MjQ0MjUxfQ.YWIkajfciAfOcBHhTZJB_PFjaFcePN_ub78ExniMYPo');
INSERT INTO `userinfo` VALUES ('a', '1', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImEiLCJwYXNzd29yZCI6IjEiLCJpYXQiOjE2Mzk5ODI4MDUsImV4cCI6MTY0MjY2MTIwNX0.5MxF9ar7_axrwr-upmwHkLT-E_OkNkYK2gVxgxCCnf8');
INSERT INTO `userinfo` VALUES ('administrator', 'admin', 1, NULL);
INSERT INTO `userinfo` VALUES ('alex', '12345', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZXgiLCJwYXNzd29yZCI6IjEyMzQ1IiwiaWF0IjoxNjI1OTMyNTAyLCJleHAiOjE2Mjg2MTA5MDJ9.KQiPCCqYE7orWhjq8apAeb_MnCCL5Y7raGMIPDqox5I');
INSERT INTO `userinfo` VALUES ('dad', '123', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZCIsInBhc3N3b3JkIjoiMTIzIiwiaWF0IjoxNjI0NzE4Nzg4LCJleHAiOjE2MjczOTcxODh9.R5IS3JBNQ_Tc_GHEigyfHgQo2k4jbLqKUmOtLSHEikU');
INSERT INTO `userinfo` VALUES ('llz', '12345', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImxseiIsInBhc3N3b3JkIjoiMTIzNDUiLCJpYXQiOjE2MjU5Mjk2NzUsImV4cCI6MTYyODYwODA3NX0.W7W6tfxsH_NnWPesJaQjJB9MD5_OT7vr5hx3LOnB5Ng');
INSERT INTO `userinfo` VALUES ('springtest', '1', 1, NULL);
INSERT INTO `userinfo` VALUES ('springtest2,1', '123,1', 1, NULL);
INSERT INTO `userinfo` VALUES ('user', '280code', 1, NULL);
INSERT INTO `userinfo` VALUES ('张国霖', '2880', 1, NULL);
INSERT INTO `userinfo` VALUES ('我是傻逼', '12345', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IuaIkeaYr-WCu-mAvCIsInBhc3N3b3JkIjoiMTIzNDUiLCJpYXQiOjE2MjU1NjUxNzEsImV4cCI6MTYyODI0MzU3MX0.26zH3bIBsRlPwCLiSUEWsMxzOn9Eq17IjQbrvgg4FRE');
INSERT INTO `userinfo` VALUES ('来自移动端的测试', '123', 1, NULL);
INSERT INTO `userinfo` VALUES ('来自移动端第二次测试', '1234', 1, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
