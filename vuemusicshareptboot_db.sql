/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : vuemusicshareptboot_db

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2022-03-25 22:17:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '华语');
INSERT INTO `area` VALUES ('2', '美国');
INSERT INTO `area` VALUES ('3', '日本');
INSERT INTO `area` VALUES ('4', '韩国');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `title` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  `lookcs` int(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `sectionid` int(11) default NULL,
  `isjh` varchar(255) default NULL,
  `dznum` int(11) default NULL,
  `movieid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_article_member` (`memberid`),
  KEY `fk_article_section` (`sectionid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`sectionid`) REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('12', '35', '啊啊啊', null, '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2022-03-25 21:49:39', '3', null, '1', 'no', '1', '11');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('12', 'DJ神曲');
INSERT INTO `category` VALUES ('13', '戏曲');
INSERT INTO `category` VALUES ('19', '情歌');
INSERT INTO `category` VALUES ('21', '经典老歌');
INSERT INTO `category` VALUES ('22', '网络歌曲');
INSERT INTO `category` VALUES ('24', 'KTV金曲');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `movieid` int(11) default NULL,
  `sheetid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_collect_member` (`memberid`),
  KEY `fk_collect_movieid` (`movieid`),
  CONSTRAINT `fk_collect_member` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collect_movieid` FOREIGN KEY (`movieid`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('11', '14', '7', '1');
INSERT INTO `collect` VALUES ('13', '14', '8', '1');
INSERT INTO `collect` VALUES ('14', '14', '11', '1');
INSERT INTO `collect` VALUES ('15', '14', '11', '2');
INSERT INTO `collect` VALUES ('16', '14', '12', '1');
INSERT INTO `collect` VALUES ('18', '31', '11', '6');
INSERT INTO `collect` VALUES ('19', '31', '10', '6');
INSERT INTO `collect` VALUES ('20', '31', '4', '6');
INSERT INTO `collect` VALUES ('21', '31', '1', '6');
INSERT INTO `collect` VALUES ('22', '32', '11', '7');
INSERT INTO `collect` VALUES ('23', '32', '10', '7');
INSERT INTO `collect` VALUES ('24', '32', '12', '7');
INSERT INTO `collect` VALUES ('25', '32', '5', '7');
INSERT INTO `collect` VALUES ('26', '33', '12', '10');
INSERT INTO `collect` VALUES ('27', '33', '11', '10');
INSERT INTO `collect` VALUES ('28', '33', '10', '10');
INSERT INTO `collect` VALUES ('29', '34', '11', '12');
INSERT INTO `collect` VALUES ('30', '34', '10', '12');
INSERT INTO `collect` VALUES ('31', '34', '8', '12');
INSERT INTO `collect` VALUES ('32', '34', '5', '12');
INSERT INTO `collect` VALUES ('33', '34', '12', '12');
INSERT INTO `collect` VALUES ('34', '35', '9', '14');
INSERT INTO `collect` VALUES ('35', '35', '4', '14');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `movieid` int(11) default NULL,
  `score` int(11) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  `hfcontent` text,
  PRIMARY KEY  (`id`),
  KEY `fk_comment_member` (`memberid`),
  KEY `fk_comment_news` (`movieid`),
  CONSTRAINT `fk_comment_member` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_movie` FOREIGN KEY (`movieid`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '14', '4', '4', 'first and last name in the “To” field to personalize their emails. Gravity letters it amongst herself dearest an windows by. Wooded ladies she basket season age her uneasy saw.', '2022-03-24 12:59:21', 'etters it amongst herself dearest an windows by.');
INSERT INTO `comment` VALUES ('4', '28', '9', '5', 'Gravity letters it amongst herself dearest an windows by. Wooded ladies she basket season age her uneasy saw.', '2022-03-24 13:42:25', null);
INSERT INTO `comment` VALUES ('5', '29', '8', '4', '6666666666', '2022-03-24 12:11:32', '999999');
INSERT INTO `comment` VALUES ('6', '30', '11', '5', '666', '2022-03-24 19:12:05', null);
INSERT INTO `comment` VALUES ('7', '31', '9', '5', '6555555555', '2022-03-24 14:15:53', null);
INSERT INTO `comment` VALUES ('8', '32', '10', '5', '喜欢 ', '2022-03-24 16:01:00', null);
INSERT INTO `comment` VALUES ('9', '33', '4', '5', '哦哈做啥事', '2022-03-24 23:50:03', '555');
INSERT INTO `comment` VALUES ('10', '34', '4', '5', '恩恩', '2022-03-24 22:33:33', null);
INSERT INTO `comment` VALUES ('11', '34', '12', '5', 'aaa', '2022-03-24 22:34:00', null);

-- ----------------------------
-- Table structure for `ddinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ddinfo`;
CREATE TABLE `ddinfo` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `movieid` int(11) default NULL,
  `ddno` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `fkstatus` varchar(255) default NULL,
  `fee` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ddinfo
-- ----------------------------
INSERT INTO `ddinfo` VALUES ('4', '14', '12', '0310124438', '2022-03-24 12:44:38', '已付款', '10');
INSERT INTO `ddinfo` VALUES ('5', '31', '12', '0310021230', '2022-03-24 14:12:30', '已付款', '10');
INSERT INTO `ddinfo` VALUES ('6', '32', '12', '0312040154', '2022-03-24 16:01:54', '已付款', '10');
INSERT INTO `ddinfo` VALUES ('7', '33', '12', '0315115046', '2022-03-24 23:50:46', '已付款', '10');
INSERT INTO `ddinfo` VALUES ('8', '34', '12', '0316103351', '2022-03-24 22:33:51', '已付款', '10');

-- ----------------------------
-- Table structure for `dzrecord`
-- ----------------------------
DROP TABLE IF EXISTS `dzrecord`;
CREATE TABLE `dzrecord` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `movieid` int(11) default NULL,
  `categroyid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dzrecord
-- ----------------------------
INSERT INTO `dzrecord` VALUES ('2', '14', '11', '24');
INSERT INTO `dzrecord` VALUES ('3', '14', '10', '24');
INSERT INTO `dzrecord` VALUES ('4', '14', '13', '24');
INSERT INTO `dzrecord` VALUES ('5', '28', '11', '24');
INSERT INTO `dzrecord` VALUES ('6', '28', '8', '21');
INSERT INTO `dzrecord` VALUES ('7', '28', '9', '21');
INSERT INTO `dzrecord` VALUES ('8', '35', '9', '21');
INSERT INTO `dzrecord` VALUES ('9', '35', '4', '24');

-- ----------------------------
-- Table structure for `imgadv`
-- ----------------------------
DROP TABLE IF EXISTS `imgadv`;
CREATE TABLE `imgadv` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgadv
-- ----------------------------
INSERT INTO `imgadv` VALUES ('26', 'f0d33e49-83c0-48c2-a9d8-b298ea0341e7.jpg', 'moviedetails.html?id=1');
INSERT INTO `imgadv` VALUES ('27', 'a737d55d-006a-4aff-b43a-768a010324a8.jpg', 'moviedetails.html?id=4');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('14', 'H001', '123', '丁国华', '0c8d4483-736c-4e2b-969b-213051c918d4.jpg', '13877665523', '女', '3809283092', 'H001@126.com');
INSERT INTO `member` VALUES ('28', 'H002', '123', 'H002', 'icon1.png', '13890765544', '女', '438043894', 'H002@126.com');
INSERT INTO `member` VALUES ('29', 'H003', '123', 'H003', '104fdfee-1846-4fe3-920e-544f18b52968.jpg', '13890765544', '女', '4830984093', 'H003@126.com');
INSERT INTO `member` VALUES ('30', 'H005', '123', '小西子', 'f6d365b3-c8c2-4da5-9da8-565a47cdee1f.jpg', '15526525874', '男', '9876357', 'H005@163.com');
INSERT INTO `member` VALUES ('31', 'H009', '123', '小强', '55fd5a6c-7cb3-4ed2-af47-595f6f0b7498.jpg', '18854587485', '男', '347345345', 'H009@163.com');
INSERT INTO `member` VALUES ('32', 'Y001', '123', '小立', 'd9035526-4bb6-48b6-8a88-b8f940053165.jpg', '18852541585', '男', '6846354', 'Y001@163.com');
INSERT INTO `member` VALUES ('33', 'H010', '123', '小强', '5c9ae619-dd0c-41fe-bb1b-807f5d934bb7.jpg', '15521541585', '男', '45743553', 'h010@163.com');
INSERT INTO `member` VALUES ('34', 'H011', '123', '小强子', '3a4b17c7-21b2-4b40-9b8f-74160c524464.jpg', '15523658485', '男', '987354648', 'h011@163.com');
INSERT INTO `member` VALUES ('35', 'H115', '123', '小果子', '083a52fe-fecb-403a-b866-f01c9079668e.jpg', '15523625985', '男', 'w456456345', 'H115@163.com');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  `hfcontent` text,
  PRIMARY KEY  (`id`),
  KEY `fk_message_member` (`memberid`),
  CONSTRAINT `fk_message_member` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('15', '29', '99999999', '2022-03-24 12:11:54', '0000000000');
INSERT INTO `message` VALUES ('16', '31', '55', '2022-03-24 14:16:28', 't');
INSERT INTO `message` VALUES ('17', '32', '2453564', '2022-03-24 16:02:26', '66');
INSERT INTO `message` VALUES ('18', '33', '2354245', '2022-03-24 23:52:07', '66');
INSERT INTO `message` VALUES ('19', '34', '3245', '2022-03-24 22:34:49', 'tt');
INSERT INTO `message` VALUES ('20', '35', '3345', '2022-03-25 21:50:25', 'e瑞特让他');

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `videoname` varchar(255) default NULL,
  `categoryid` int(11) default NULL,
  `areaid` int(11) default NULL,
  `author` varchar(255) default NULL,
  `yeartime` varchar(255) default NULL,
  `playtime` varchar(255) default NULL,
  `content` text,
  `cs` int(11) default NULL,
  `score` decimal(10,2) default NULL,
  `isfree` varchar(255) default NULL,
  `fee` decimal(10,2) default NULL,
  `zan` int(11) default NULL,
  `memberid` varchar(255) default NULL,
  `shstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_movie_category` (`categoryid`),
  KEY `fk_movie_area` (`areaid`),
  CONSTRAINT `fk_movie_area` FOREIGN KEY (`areaid`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '红茶馆', '63a3c2ad-c506-4625-a65c-1dee697d1065.jpg', '1ca2cfed-6f1b-4a90-93f5-2124b4173945.mp3', '24', '1', '陈慧娴', '2011', '2022-03-14', '<div>\n	陈慧娴（Priscilla Chan），1965年7月28日出生于香港，中国香港女歌手。\n</div>\n<div>\n	1984年凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%80%9D%E5%8E%BB%E7%9A%84%E8%AF%BA%E8%A8%80/1258023\">逝去的诺言</a>》出道；同年获得十大中文金曲最有前途新人奖&nbsp;[1]<a></a>&nbsp;&nbsp;。1985年因演唱歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E5%BA%97/13678734\">花店</a>》而在香港歌坛受到关注。1986年演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B7%B3%E8%88%9E%E8%A1%97/6563342\">跳舞街</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E5%8A%B2%E6%AD%8C%E9%87%91%E6%9B%B2/3919497\">十大劲歌金曲</a>最受欢迎Disco歌曲奖&nbsp;[2]<a></a>&nbsp;&nbsp;。1988年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A7%8B%E8%89%B2/13016557\">秋色</a>》，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%BA%E7%94%9F%E4%BD%95%E5%A4%84%E4%B8%8D%E7%9B%B8%E9%80%A2/9484341\">人生何处不相逢</a>》成为其歌唱生涯的代表作品之一&nbsp;[3]<a></a>&nbsp;&nbsp;。1989年推出粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B0%B8%E8%BF%9C%E6%98%AF%E4%BD%A0%E7%9A%84%E6%9C%8B%E5%8F%8B/2938762\">永远是你的朋友</a>》，其中主打歌《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%83%E5%8D%83%E9%98%99%E6%AD%8C/9134820\">千千阙歌</a>》在华语地区获得关注，并获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E4%B8%AD%E6%96%87%E9%87%91%E6%9B%B2/823339\">十大中文金曲</a>奖以及十大劲歌金曲奖，同年宣布告别乐坛&nbsp;[4-5]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	1992年发行的粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BD%92%E6%9D%A5%E5%90%A7/19186516\">归来吧</a>》取得四白金销量成绩，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%A2%E8%8C%B6%E9%A6%86\">红茶馆</a>》获得香港电台十大中文金曲奖&nbsp;[6]<a></a>&nbsp;&nbsp;。1995年正式回归乐坛，并发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Welcome%20back\">Welcome back</a>》。1996年在香港红磡体育馆举行10场“雪映美白演唱会”。2000年在推出专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%BA%E4%BD%A0%E5%A5%BD/2935892\">为你好</a>》后淡出歌坛。2003年重返歌坛并签约环球唱片公司。2004年宣布退出歌坛&nbsp;[7]<a></a>&nbsp;&nbsp;。2008年获得9+2音乐先锋榜乐坛贡献奖&nbsp;[8]<a></a>&nbsp;&nbsp;。2010年复出歌坛并发行国语单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9B%AA%E9%A3%9E%E8%8A%B1/2472493\">雪飞花</a>》&nbsp;[9]<a></a>&nbsp;&nbsp;。2015年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Evolve/22069823\">Evolve</a>》。2016年在香港红磡体育馆举行“陈慧娴Priscilla-ism演唱会”。2019年11月24日在海口举行陈慧娴Priscilla-ism中国巡回演唱会&nbsp;[10]<a></a>&nbsp;&nbsp;。\n</div>', '3', '0.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('2', '南方姑娘', '461c9b5c-4ce0-4100-990b-be110a4a897e.jpg', 'ed41b667-48b3-4359-a5d7-ebbc4c874338.mp3', '24', '1', '赵雷', '2020', '2022-03-14', '<div>\n	赵雷，1986年7月20日出生于北京市，中国内地民谣男歌手、词曲创作者。\n</div>\n<div>\n	2009年，推出个人民谣单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC%E7%9A%84%E5%86%AC%E5%A4%A9/16198505\">北京的冬天</a>》&nbsp;[2]<a></a>&nbsp;&nbsp;。2010年，参加湖南卫视选秀娱乐节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/2010%E5%BF%AB%E4%B9%90%E7%94%B7%E5%A3%B0/2542340\">2010快乐男声</a>》，最终获得全国总决赛第14名&nbsp;[2]<a></a>&nbsp;&nbsp;[18]<a></a>&nbsp;&nbsp;[25]<a></a>&nbsp;&nbsp;。2011年，推出首张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B5%B5%E5%B0%8F%E9%9B%B7/2769668\">赵小雷</a>》&nbsp;[6]<a></a>&nbsp;&nbsp;。2014年，参加CCTV-3原创音乐真人秀节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E5%A5%BD%E6%AD%8C%E6%9B%B2%E7%AC%AC%E4%B8%80%E5%AD%A3/16465709\">中国好歌曲第一季</a>》，获得刘欢组8强；同年，推出第2张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%89%E5%A7%86%E9%A4%90%E5%8E%85/15112833\">吉姆餐厅</a>》。2016年，推出第3张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%97%A0%E6%B3%95%E9%95%BF%E5%A4%A7/20305930\">无法长大</a>》，他凭借该专辑获得第25届东方风云榜最佳创作歌手奖&nbsp;[1]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2017年，作为补位歌手参加湖南卫视音乐竞技节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AD%8C%E6%89%8B2017/20391941\">歌手2017</a>》，他也因此受到更多关注&nbsp;[14]<a></a>&nbsp;&nbsp;。2018年，获得2017放肆一下移动视频风云盛典年度民谣音乐典范人物奖&nbsp;[31]<a></a>&nbsp;&nbsp;。2019年，他演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%90%E9%83%BD/18301509\">成都</a>》入选“歌声唱响中国”——最美城市音乐名片优秀歌曲&nbsp;[29]<a></a>&nbsp;&nbsp;。2021年5月3日，参加第3届太湖湾音乐节&nbsp;[32]<a></a>&nbsp;&nbsp;。\n</div>', '2', '0.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('3', '风再起时', 'bffc560b-e860-4b5b-87d7-a96465658e44.jpg', 'c8ccd896-a72f-4edf-82ba-cae523fe4eda.mp3', '21', '1', '张国荣', '2010', '2022-03-14', '<p style=\"text-indent:2em;\">\n	张国荣（1956年9月12日-2003年4月1日），出生于香港，中国香港男歌手、演员、音乐人。1977年获得丽的电视亚洲歌唱大赛香港区亚军，从而进入歌坛。1983年以歌曲《风继续吹》获得关注。1984年演唱的《Monica》是香港歌坛第一支同获十大中文金曲、十大劲歌金曲的舞曲。1986年凭借歌曲《有谁共鸣》获得劲歌金曲金奖。\n</p>', '0', '0.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('4', '成都', '73cafe42-a9a9-4a83-9460-d9add505e6aa.jpg', '0bf57976-7ef2-4a80-8ce9-bafef7f7bddb.mp3', '24', '1', '赵雷', '2018', '2022-03-14', '<div>\n	赵雷，1986年7月20日出生于北京市，中国内地民谣男歌手、词曲创作者。\n</div>\n<div>\n	2009年，推出个人民谣单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC%E7%9A%84%E5%86%AC%E5%A4%A9/16198505\">北京的冬天</a>》&nbsp;[2]<a></a>&nbsp;&nbsp;。2010年，参加湖南卫视选秀娱乐节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/2010%E5%BF%AB%E4%B9%90%E7%94%B7%E5%A3%B0/2542340\">2010快乐男声</a>》，最终获得全国总决赛第14名&nbsp;[2]<a></a>&nbsp;&nbsp;[18]<a></a>&nbsp;&nbsp;[25]<a></a>&nbsp;&nbsp;。2011年，推出首张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B5%B5%E5%B0%8F%E9%9B%B7/2769668\">赵小雷</a>》&nbsp;[6]<a></a>&nbsp;&nbsp;。2014年，参加CCTV-3原创音乐真人秀节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E5%A5%BD%E6%AD%8C%E6%9B%B2%E7%AC%AC%E4%B8%80%E5%AD%A3/16465709\">中国好歌曲第一季</a>》，获得刘欢组8强；同年，推出第2张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%89%E5%A7%86%E9%A4%90%E5%8E%85/15112833\">吉姆餐厅</a>》。2016年，推出第3张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%97%A0%E6%B3%95%E9%95%BF%E5%A4%A7/20305930\">无法长大</a>》，他凭借该专辑获得第25届东方风云榜最佳创作歌手奖&nbsp;[1]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2017年，作为补位歌手参加湖南卫视音乐竞技节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AD%8C%E6%89%8B2017/20391941\">歌手2017</a>》，他也因此受到更多关注&nbsp;[14]<a></a>&nbsp;&nbsp;。2018年，获得2017放肆一下移动视频风云盛典年度民谣音乐典范人物奖&nbsp;[31]<a></a>&nbsp;&nbsp;。2019年，他演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%90%E9%83%BD/18301509\">成都</a>》入选“歌声唱响中国”——最美城市音乐名片优秀歌曲&nbsp;[29]<a></a>&nbsp;&nbsp;。2021年5月3日，参加第3届太湖湾音乐节&nbsp;[32]<a></a>&nbsp;&nbsp;。\n</div>', '11', '4.75', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('5', '月半小夜曲', 'b7f0c29f-844f-4ae1-ba3c-1c1b234bee71.jpg', 'bbdcf677-fe22-4224-9da0-20d0b2d5dab2.mp3', '24', '1', '陈慧娴', '2016', '2022-03-14', '<div>\n	陈慧娴（Priscilla Chan），1965年7月28日出生于香港，中国香港女歌手。\n</div>\n<div>\n	1984年凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%80%9D%E5%8E%BB%E7%9A%84%E8%AF%BA%E8%A8%80/1258023\">逝去的诺言</a>》出道；同年获得十大中文金曲最有前途新人奖&nbsp;[1]<a></a>&nbsp;&nbsp;。1985年因演唱歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E5%BA%97/13678734\">花店</a>》而在香港歌坛受到关注。1986年演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B7%B3%E8%88%9E%E8%A1%97/6563342\">跳舞街</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E5%8A%B2%E6%AD%8C%E9%87%91%E6%9B%B2/3919497\">十大劲歌金曲</a>最受欢迎Disco歌曲奖&nbsp;[2]<a></a>&nbsp;&nbsp;。1988年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A7%8B%E8%89%B2/13016557\">秋色</a>》，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%BA%E7%94%9F%E4%BD%95%E5%A4%84%E4%B8%8D%E7%9B%B8%E9%80%A2/9484341\">人生何处不相逢</a>》成为其歌唱生涯的代表作品之一&nbsp;[3]<a></a>&nbsp;&nbsp;。1989年推出粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B0%B8%E8%BF%9C%E6%98%AF%E4%BD%A0%E7%9A%84%E6%9C%8B%E5%8F%8B/2938762\">永远是你的朋友</a>》，其中主打歌《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%83%E5%8D%83%E9%98%99%E6%AD%8C/9134820\">千千阙歌</a>》在华语地区获得关注，并获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E4%B8%AD%E6%96%87%E9%87%91%E6%9B%B2/823339\">十大中文金曲</a>奖以及十大劲歌金曲奖，同年宣布告别乐坛&nbsp;[4-5]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	1992年发行的粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BD%92%E6%9D%A5%E5%90%A7/19186516\">归来吧</a>》取得四白金销量成绩，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%A2%E8%8C%B6%E9%A6%86\">红茶馆</a>》获得香港电台十大中文金曲奖&nbsp;[6]<a></a>&nbsp;&nbsp;。1995年正式回归乐坛，并发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Welcome%20back\">Welcome back</a>》。1996年在香港红磡体育馆举行10场“雪映美白演唱会”。2000年在推出专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%BA%E4%BD%A0%E5%A5%BD/2935892\">为你好</a>》后淡出歌坛。2003年重返歌坛并签约环球唱片公司。2004年宣布退出歌坛&nbsp;[7]<a></a>&nbsp;&nbsp;。2008年获得9+2音乐先锋榜乐坛贡献奖&nbsp;[8]<a></a>&nbsp;&nbsp;。2010年复出歌坛并发行国语单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9B%AA%E9%A3%9E%E8%8A%B1/2472493\">雪飞花</a>》&nbsp;[9]<a></a>&nbsp;&nbsp;。2015年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Evolve/22069823\">Evolve</a>》。2016年在香港红磡体育馆举行“陈慧娴Priscilla-ism演唱会”。2019年11月24日在海口举行陈慧娴Priscilla-ism中国巡回演唱会&nbsp;[10]<a></a>&nbsp;&nbsp;。\n</div>', '2', '0.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('6', '吉姆餐厅', 'da735a35-ad49-40f4-a575-bad55c4b77d9.jpg', '1f9e0028-1e3b-45fc-abda-96efa70f2635.mp3', '24', '1', '赵雷', '2021', '2022-03-14', '<div>\n	赵雷，1986年7月20日出生于北京市，中国内地民谣男歌手、词曲创作者。\n</div>\n<div>\n	2009年，推出个人民谣单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%97%E4%BA%AC%E7%9A%84%E5%86%AC%E5%A4%A9/16198505\">北京的冬天</a>》&nbsp;[2]<a></a>&nbsp;&nbsp;。2010年，参加湖南卫视选秀娱乐节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/2010%E5%BF%AB%E4%B9%90%E7%94%B7%E5%A3%B0/2542340\">2010快乐男声</a>》，最终获得全国总决赛第14名&nbsp;[2]<a></a>&nbsp;&nbsp;[18]<a></a>&nbsp;&nbsp;[25]<a></a>&nbsp;&nbsp;。2011年，推出首张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B5%B5%E5%B0%8F%E9%9B%B7/2769668\">赵小雷</a>》&nbsp;[6]<a></a>&nbsp;&nbsp;。2014年，参加CCTV-3原创音乐真人秀节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E5%A5%BD%E6%AD%8C%E6%9B%B2%E7%AC%AC%E4%B8%80%E5%AD%A3/16465709\">中国好歌曲第一季</a>》，获得刘欢组8强；同年，推出第2张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%89%E5%A7%86%E9%A4%90%E5%8E%85/15112833\">吉姆餐厅</a>》。2016年，推出第3张个人音乐专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%97%A0%E6%B3%95%E9%95%BF%E5%A4%A7/20305930\">无法长大</a>》，他凭借该专辑获得第25届东方风云榜最佳创作歌手奖&nbsp;[1]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2017年，作为补位歌手参加湖南卫视音乐竞技节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AD%8C%E6%89%8B2017/20391941\">歌手2017</a>》，他也因此受到更多关注&nbsp;[14]<a></a>&nbsp;&nbsp;。2018年，获得2017放肆一下移动视频风云盛典年度民谣音乐典范人物奖&nbsp;[31]<a></a>&nbsp;&nbsp;。2019年，他演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%90%E9%83%BD/18301509\">成都</a>》入选“歌声唱响中国”——最美城市音乐名片优秀歌曲&nbsp;[29]<a></a>&nbsp;&nbsp;。2021年5月3日，参加第3届太湖湾音乐节&nbsp;[32]<a></a>&nbsp;&nbsp;。\n</div>', '0', '0.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('7', '爱和承诺', 'f0f4c922-f1c6-413e-8582-c6657a1bc62e.jpg', '929fce28-d0cb-43cb-acfa-0c542e43f8d3.mp3', '21', '1', '张学友', '2010', '2022-03-14', '<div>\n	张学友（Jacky Cheung），1961年7月10日出生于香港，中国香港流行乐男歌手、影视演员、作曲人，毕业于香港崇文英文书院。\n</div>\n<div>\n	1984年因获得首届香港十八区业余歌唱大赛冠军而出道&nbsp;[181]<a></a>&nbsp;&nbsp;。1985年发行个人首张专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Smile/10216590\">Smile</a>》。1986年凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%81%A5%E8%BF%9C%E7%9A%84%E5%A5%B9/6644093\">遥远的她</a>》在香港乐坛获得关注；同年出演个人首部电影《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9C%B9%E9%9B%B3%E5%A4%A7%E5%96%87%E5%8F%AD/2927043\">霹雳大喇叭</a>》。1989年凭借剧情片《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%97%BA%E8%A7%92%E5%8D%A1%E9%97%A8/27681\">旺角卡门</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%AC%AC8%E5%B1%8A%E9%A6%99%E6%B8%AF%E7%94%B5%E5%BD%B1%E9%87%91%E5%83%8F%E5%A5%96/10427913\">第8届香港电影金像奖</a>最佳男配角奖&nbsp;[10]<a></a>&nbsp;&nbsp;。1990年凭借武侠片《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%AC%91%E5%82%B2%E6%B1%9F%E6%B9%96/8469351\">笑傲江湖</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%AC%AC27%E5%B1%8A%E5%8F%B0%E6%B9%BE%E7%94%B5%E5%BD%B1%E9%87%91%E9%A9%AC%E5%A5%96/10538181\">第27届台湾电影金马奖</a>最佳男配角奖&nbsp;[11]<a></a>&nbsp;&nbsp;。1991年演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%AF%8F%E5%A4%A9%E7%88%B1%E4%BD%A0%E5%A4%9A%E4%B8%80%E4%BA%9B\">每天爱你多一些</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8A%B2%E6%AD%8C%E9%87%91%E6%9B%B2%E9%87%91%E5%A5%96/8794989\">劲歌金曲金奖</a>&nbsp;[150]<a></a>&nbsp;&nbsp;[154]<a></a>&nbsp;&nbsp;。1993年发行的专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%BB%E5%88%AB/14937710\">吻别</a>》打破华语唱片在台湾的销量纪录&nbsp;[1]<a></a>&nbsp;&nbsp;。1995年起连续两年获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%96%E7%95%8C%E9%9F%B3%E4%B9%90%E5%A4%A7%E5%A5%96/6690633\">世界音乐大奖</a>全球销量最高华人歌手奖&nbsp;[2-3]<a></a>&nbsp;&nbsp;。1997年参与策划并主演音乐剧《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9B%AA%E7%8B%BC%E6%B9%96/69095\">雪狼湖</a>》。1998年凭借专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%83%B3%E5%92%8C%E4%BD%A0%E5%8E%BB%E5%90%B9%E5%90%B9%E9%A3%8E/2585011\">想和你去吹吹风</a>》获得第9届<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%B0%E6%B9%BE%E9%87%91%E6%9B%B2%E5%A5%96/4113339\">台湾金曲奖</a>最佳国语男歌手奖&nbsp;[4]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2001年获得十大中文金曲<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%87%91%E9%92%88%E5%A5%96/4407048\">金针奖</a>&nbsp;[5]<a></a>&nbsp;&nbsp;。2002年凭借文艺片《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%94%B7%E4%BA%BA%E5%9B%9B%E5%8D%81/17425\">男人四十</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%B0%E5%BA%A6%E5%9B%BD%E9%99%85%E7%94%B5%E5%BD%B1%E8%8A%82/8648231\">印度国际电影节</a>最佳男演员奖&nbsp;[12]<a></a>&nbsp;&nbsp;。2004年发行个人首张全创作专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Life%20Is%20Like%20A%20Dream\">Life Is Like A Dream</a>》&nbsp;[6]<a></a>&nbsp;&nbsp;。2007年在<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A6%99%E6%B8%AF%E6%98%9F%E5%85%89%E5%A4%A7%E9%81%93/3556325\">香港星光大道</a>留下手印。2012年举行的“1/2世纪世界巡回演唱会”被<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%89%E5%B0%BC%E6%96%AF%E4%B8%96%E7%95%8C%E7%BA%AA%E5%BD%95/1069992\">吉尼斯世界纪录</a>认证为“12个月内观众人数最多的巡回演唱会”&nbsp;[7]<a></a>&nbsp;&nbsp;。2013年获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E4%B8%AD%E6%96%87%E9%87%91%E6%9B%B2/823339\">十大中文金曲</a>金曲35周年荣誉大奖&nbsp;[8]<a></a>&nbsp;&nbsp;。2014年发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%86%92%E7%9D%80%E5%81%9A%E6%A2%A6\">醒着做梦</a>》&nbsp;[94]<a></a>&nbsp;&nbsp;。2021年发行歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%9D%9A%E6%8C%81%E7%9A%84%E6%84%8F%E4%B9%89/57784787\">坚持的意义</a>》&nbsp;[165]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	演艺事业外，张学友关心公益慈善。1998年当选<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A6%99%E6%B8%AF%E5%8D%81%E5%A4%A7%E6%9D%B0%E5%87%BA%E9%9D%92%E5%B9%B4/7656308\">香港十大杰出青年</a>&nbsp;[15]<a></a>&nbsp;&nbsp;。1999年当选<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%96%E7%95%8C%E5%8D%81%E5%A4%A7%E6%9D%B0%E5%87%BA%E9%9D%92%E5%B9%B4/4506685\">世界十大杰出青年</a>&nbsp;[16]<a></a>&nbsp;&nbsp;。2003年起连续7年担任<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A6%99%E6%B8%AF%E6%BC%94%E8%89%BA%E4%BA%BA%E5%8D%8F%E4%BC%9A/10821259\">香港演艺人协会</a>副会长&nbsp;[17]<a></a>&nbsp;&nbsp;。\n</div>', '0', '0.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('8', '玻璃窗的爱', 'ba7af27a-6c37-4719-b373-e6d96b857792.jpg', '3270f0fd-a67f-4719-9dd9-8e11d1487682.mp3', '21', '1', '陈慧娴', '2010', '2022-03-14', '<div>\n	陈慧娴（Priscilla Chan），1965年7月28日出生于香港，中国香港女歌手。\n</div>\n<div>\n	1984年凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%80%9D%E5%8E%BB%E7%9A%84%E8%AF%BA%E8%A8%80/1258023\">逝去的诺言</a>》出道；同年获得十大中文金曲最有前途新人奖&nbsp;[1]<a></a>&nbsp;&nbsp;。1985年因演唱歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E5%BA%97/13678734\">花店</a>》而在香港歌坛受到关注。1986年演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B7%B3%E8%88%9E%E8%A1%97/6563342\">跳舞街</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E5%8A%B2%E6%AD%8C%E9%87%91%E6%9B%B2/3919497\">十大劲歌金曲</a>最受欢迎Disco歌曲奖&nbsp;[2]<a></a>&nbsp;&nbsp;。1988年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A7%8B%E8%89%B2/13016557\">秋色</a>》，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%BA%E7%94%9F%E4%BD%95%E5%A4%84%E4%B8%8D%E7%9B%B8%E9%80%A2/9484341\">人生何处不相逢</a>》成为其歌唱生涯的代表作品之一&nbsp;[3]<a></a>&nbsp;&nbsp;。1989年推出粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B0%B8%E8%BF%9C%E6%98%AF%E4%BD%A0%E7%9A%84%E6%9C%8B%E5%8F%8B/2938762\">永远是你的朋友</a>》，其中主打歌《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%83%E5%8D%83%E9%98%99%E6%AD%8C/9134820\">千千阙歌</a>》在华语地区获得关注，并获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E4%B8%AD%E6%96%87%E9%87%91%E6%9B%B2/823339\">十大中文金曲</a>奖以及十大劲歌金曲奖，同年宣布告别乐坛&nbsp;[4-5]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	1992年发行的粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BD%92%E6%9D%A5%E5%90%A7/19186516\">归来吧</a>》取得四白金销量成绩，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%A2%E8%8C%B6%E9%A6%86\">红茶馆</a>》获得香港电台十大中文金曲奖&nbsp;[6]<a></a>&nbsp;&nbsp;。1995年正式回归乐坛，并发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Welcome%20back\">Welcome back</a>》。1996年在香港红磡体育馆举行10场“雪映美白演唱会”。2000年在推出专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%BA%E4%BD%A0%E5%A5%BD/2935892\">为你好</a>》后淡出歌坛。2003年重返歌坛并签约环球唱片公司。2004年宣布退出歌坛&nbsp;[7]<a></a>&nbsp;&nbsp;。2008年获得9+2音乐先锋榜乐坛贡献奖&nbsp;[8]<a></a>&nbsp;&nbsp;。2010年复出歌坛并发行国语单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9B%AA%E9%A3%9E%E8%8A%B1/2472493\">雪飞花</a>》&nbsp;[9]<a></a>&nbsp;&nbsp;。2015年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Evolve/22069823\">Evolve</a>》。2016年在香港红磡体育馆举行“陈慧娴Priscilla-ism演唱会”。2019年11月24日在海口举行陈慧娴Priscilla-ism中国巡回演唱会&nbsp;[10]<a></a>&nbsp;&nbsp;。\n</div>', '1', '4.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('9', '飘洋过海来看你', '45e53bd2-e8b8-4e55-a517-0ee6ac5b0cab.jpg', '616defca-ca18-4322-aa07-5f30ee702bbc.mp3', '21', '1', '金智娟', '2010', '2022-03-14', '<p style=\"text-indent:2em;\">\n	金智娟（Wawa King），艺名娃娃，1964年10月4日出生于台湾高雄市冈山区，1981年和朋友组成<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%98%E4%B8%98%E5%90%88%E5%94%B1%E5%9B%A2/10573888\">丘丘合唱团</a>，担任主唱。加盟新格唱片，1982年首张专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B0%B1%E5%9C%A8%E4%BB%8A%E5%A4%9C/7257436\">就在今夜</a>》出版，同名歌曲及《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%BA%E4%BD%95%E6%A2%A6%E8%A7%81%E4%BB%96/18335443\">为何梦见他</a>》红遍大街小巷。娃娃从此被列为台湾摇滚女歌手第一人。\n</p>', '11', '5.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('10', '演员', '8423f29e-5e13-4714-9473-8499c4d6e1b9.jpg', '37ec1e8f-fb25-4323-8440-d84ef53f3172.mp3', '24', '1', '薛之谦', '2019', '2022-03-14', '<div>\n	薛之谦（Joker Xue），1983年7月17日出生于上海市，中国内地流行乐男歌手、音乐制作人、影视演员，毕业于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A0%BC%E9%87%8C%E6%98%82%E9%85%92%E5%BA%97%E7%AE%A1%E7%90%86%E5%AD%A6%E9%99%A2/10076173\">格里昂酒店管理学院</a>。\n</div>\n<div>\n	2005年，因参加选秀节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%91%E5%9E%8B%E6%88%91%E7%A7%80/232671\">我型我秀</a>》而正式出道&nbsp;[1]<a></a>&nbsp;&nbsp;。2006年，发行首张同名专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%96%9B%E4%B9%8B%E8%B0%A6/15417194\">薛之谦</a>》&nbsp;[169]<a></a>&nbsp;&nbsp;，随后凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AE%A4%E7%9C%9F%E7%9A%84%E9%9B%AA/6488943\">认真的雪</a>》获得广泛关注&nbsp;[2-3]<a></a>&nbsp;&nbsp;。2007年，凭借专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BD%A0%E8%BF%87%E5%BE%97%E5%A5%BD%E5%90%97/16742992\">你过得好吗</a>》获得MusicRadio中国TOP排行榜内地年度最受欢迎男歌手奖。2008年，发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B7%B1%E6%B7%B1%E7%88%B1%E8%BF%87%E4%BD%A0/8100457\">深深爱过你</a>》，同年在上海举行个人首场演唱会“谦年传说”&nbsp;[4-5]<a></a>&nbsp;&nbsp;。2013年，专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%87%A0%E4%B8%AA%E8%96%9B%E4%B9%8B%E8%B0%A6/1198713\">几个薛之谦</a>》获得MusicRadio中国TOP排行榜内地推荐唱片&nbsp;[6]<a></a>&nbsp;&nbsp;；同年，发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%84%8F%E5%A4%96/12425817\">意外</a>》&nbsp;[170]<a></a>&nbsp;&nbsp;。2014年，获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%AC%AC21%E5%B1%8A%E4%B8%9C%E6%96%B9%E9%A3%8E%E4%BA%91%E6%A6%9C/13235756\">第21届东方风云榜</a>最佳唱作人奖&nbsp;[171]<a></a>&nbsp;&nbsp;；同年他还获得音悦V榜年度盛典年度创作歌手奖&nbsp;[7]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2015年6月，薛之谦首度担当制作人并发行原创EP《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%85%E5%A3%AB/17600189\">绅士</a>》&nbsp;[8]<a></a>&nbsp;&nbsp;；同年，他还主演都市励志剧《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A6%88%E5%A6%88%E5%83%8F%E8%8A%B1%E5%84%BF%E4%B8%80%E6%A0%B7/16724359\">妈妈像花儿一样</a>》&nbsp;[9]<a></a>&nbsp;&nbsp;。2016年，凭借EP《绅士》、《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%80%E5%8D%8A/18725743\">一半</a>》获得第16届全球华语歌曲排行榜最受欢迎男歌手、五大最受欢迎男歌手奖、上海地区杰出歌手奖及最受欢迎创作歌手奖，而歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%9D%E5%AD%A6%E8%80%85/19674635\">初学者</a>》则获得年度二十大金曲奖&nbsp;[10-11]<a></a>&nbsp;&nbsp;。2017年4月，开启“我好像在哪见过你”全国巡回演唱会&nbsp;[12]<a></a>&nbsp;&nbsp;；同年，薛之谦获得第7届全球流行音乐年度盛典年度最佳男歌手及MusicRadio榜中国TOP排行榜内地最佳男歌手&nbsp;[13-14]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2018年7月，薛之谦“摩天大楼”世界巡回演唱会于北京站启程，整个巡演横跨4大洲，8个国家，21个城市，累计上演场次23场&nbsp;[15]<a></a>&nbsp;&nbsp;。2019年，发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B0%98/23595421\">尘</a>》&nbsp;[172]<a></a>&nbsp;&nbsp;。2020年12月31日，发行第11张个人专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E5%A4%96%E6%9D%A5%E7%89%A9/52319492\">天外来物</a>》&nbsp;[16]<a></a>&nbsp;&nbsp;。\n</div>', '4', '5.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('11', '认真的雪', '166a70cb-5d53-42cd-b4dd-5a0e881ce1da.jpg', '66d08ab4-20ce-4125-8b3a-e11e5108852f.mp3', '24', '1', '薛之谦', '2019', '2022-03-14', '<div>\n	薛之谦（Joker Xue），1983年7月17日出生于上海市，中国内地流行乐男歌手、音乐制作人、影视演员，毕业于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A0%BC%E9%87%8C%E6%98%82%E9%85%92%E5%BA%97%E7%AE%A1%E7%90%86%E5%AD%A6%E9%99%A2/10076173\">格里昂酒店管理学院</a>。\n</div>\n<div>\n	2005年，因参加选秀节目《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%91%E5%9E%8B%E6%88%91%E7%A7%80/232671\">我型我秀</a>》而正式出道&nbsp;[1]<a></a>&nbsp;&nbsp;。2006年，发行首张同名专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%96%9B%E4%B9%8B%E8%B0%A6/15417194\">薛之谦</a>》&nbsp;[169]<a></a>&nbsp;&nbsp;，随后凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AE%A4%E7%9C%9F%E7%9A%84%E9%9B%AA/6488943\">认真的雪</a>》获得广泛关注&nbsp;[2-3]<a></a>&nbsp;&nbsp;。2007年，凭借专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BD%A0%E8%BF%87%E5%BE%97%E5%A5%BD%E5%90%97/16742992\">你过得好吗</a>》获得MusicRadio中国TOP排行榜内地年度最受欢迎男歌手奖。2008年，发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B7%B1%E6%B7%B1%E7%88%B1%E8%BF%87%E4%BD%A0/8100457\">深深爱过你</a>》，同年在上海举行个人首场演唱会“谦年传说”&nbsp;[4-5]<a></a>&nbsp;&nbsp;。2013年，专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%87%A0%E4%B8%AA%E8%96%9B%E4%B9%8B%E8%B0%A6/1198713\">几个薛之谦</a>》获得MusicRadio中国TOP排行榜内地推荐唱片&nbsp;[6]<a></a>&nbsp;&nbsp;；同年，发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%84%8F%E5%A4%96/12425817\">意外</a>》&nbsp;[170]<a></a>&nbsp;&nbsp;。2014年，获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%AC%AC21%E5%B1%8A%E4%B8%9C%E6%96%B9%E9%A3%8E%E4%BA%91%E6%A6%9C/13235756\">第21届东方风云榜</a>最佳唱作人奖&nbsp;[171]<a></a>&nbsp;&nbsp;；同年他还获得音悦V榜年度盛典年度创作歌手奖&nbsp;[7]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2015年6月，薛之谦首度担当制作人并发行原创EP《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%85%E5%A3%AB/17600189\">绅士</a>》&nbsp;[8]<a></a>&nbsp;&nbsp;；同年，他还主演都市励志剧《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A6%88%E5%A6%88%E5%83%8F%E8%8A%B1%E5%84%BF%E4%B8%80%E6%A0%B7/16724359\">妈妈像花儿一样</a>》&nbsp;[9]<a></a>&nbsp;&nbsp;。2016年，凭借EP《绅士》、《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%80%E5%8D%8A/18725743\">一半</a>》获得第16届全球华语歌曲排行榜最受欢迎男歌手、五大最受欢迎男歌手奖、上海地区杰出歌手奖及最受欢迎创作歌手奖，而歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%9D%E5%AD%A6%E8%80%85/19674635\">初学者</a>》则获得年度二十大金曲奖&nbsp;[10-11]<a></a>&nbsp;&nbsp;。2017年4月，开启“我好像在哪见过你”全国巡回演唱会&nbsp;[12]<a></a>&nbsp;&nbsp;；同年，薛之谦获得第7届全球流行音乐年度盛典年度最佳男歌手及MusicRadio榜中国TOP排行榜内地最佳男歌手&nbsp;[13-14]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	2018年7月，薛之谦“摩天大楼”世界巡回演唱会于北京站启程，整个巡演横跨4大洲，8个国家，21个城市，累计上演场次23场&nbsp;[15]<a></a>&nbsp;&nbsp;。2019年，发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B0%98/23595421\">尘</a>》&nbsp;[172]<a></a>&nbsp;&nbsp;。2020年12月31日，发行第11张个人专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E5%A4%96%E6%9D%A5%E7%89%A9/52319492\">天外来物</a>》&nbsp;[16]<a></a>&nbsp;&nbsp;。\n</div>', '2', '5.00', '是', '0.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('12', '千千阙歌', '07003396-6df6-4a3a-9e60-f64bbf5992e8.jpg', '334b1423-625e-4744-a778-8d37939ef236.mp3', '21', '1', '陈慧娴', '2021', '2022-03-14', '<div>\n	陈慧娴（Priscilla Chan），1965年7月28日出生于香港，中国香港女歌手。\n</div>\n<div>\n	1984年凭借歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%80%9D%E5%8E%BB%E7%9A%84%E8%AF%BA%E8%A8%80/1258023\">逝去的诺言</a>》出道；同年获得十大中文金曲最有前途新人奖&nbsp;[1]<a></a>&nbsp;&nbsp;。1985年因演唱歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E5%BA%97/13678734\">花店</a>》而在香港歌坛受到关注。1986年演唱的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B7%B3%E8%88%9E%E8%A1%97/6563342\">跳舞街</a>》获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E5%8A%B2%E6%AD%8C%E9%87%91%E6%9B%B2/3919497\">十大劲歌金曲</a>最受欢迎Disco歌曲奖&nbsp;[2]<a></a>&nbsp;&nbsp;。1988年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A7%8B%E8%89%B2/13016557\">秋色</a>》，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%BA%E7%94%9F%E4%BD%95%E5%A4%84%E4%B8%8D%E7%9B%B8%E9%80%A2/9484341\">人生何处不相逢</a>》成为其歌唱生涯的代表作品之一&nbsp;[3]<a></a>&nbsp;&nbsp;。1989年推出粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B0%B8%E8%BF%9C%E6%98%AF%E4%BD%A0%E7%9A%84%E6%9C%8B%E5%8F%8B/2938762\">永远是你的朋友</a>》，其中主打歌《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%83%E5%8D%83%E9%98%99%E6%AD%8C/9134820\">千千阙歌</a>》在华语地区获得关注，并获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E4%B8%AD%E6%96%87%E9%87%91%E6%9B%B2/823339\">十大中文金曲</a>奖以及十大劲歌金曲奖，同年宣布告别乐坛&nbsp;[4-5]<a></a>&nbsp;&nbsp;。\n</div>\n<div>\n	1992年发行的粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BD%92%E6%9D%A5%E5%90%A7/19186516\">归来吧</a>》取得四白金销量成绩，专辑中的歌曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%A2%E8%8C%B6%E9%A6%86\">红茶馆</a>》获得香港电台十大中文金曲奖&nbsp;[6]<a></a>&nbsp;&nbsp;。1995年正式回归乐坛，并发行专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Welcome%20back\">Welcome back</a>》。1996年在香港红磡体育馆举行10场“雪映美白演唱会”。2000年在推出专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%BA%E4%BD%A0%E5%A5%BD/2935892\">为你好</a>》后淡出歌坛。2003年重返歌坛并签约环球唱片公司。2004年宣布退出歌坛&nbsp;[7]<a></a>&nbsp;&nbsp;。2008年获得9+2音乐先锋榜乐坛贡献奖&nbsp;[8]<a></a>&nbsp;&nbsp;。2010年复出歌坛并发行国语单曲《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9B%AA%E9%A3%9E%E8%8A%B1/2472493\">雪飞花</a>》&nbsp;[9]<a></a>&nbsp;&nbsp;。2015年发行粤语专辑《<a target=\"_blank\" href=\"https://baike.baidu.com/item/Evolve/22069823\">Evolve</a>》。2016年在香港红磡体育馆举行“陈慧娴Priscilla-ism演唱会”。2019年11月24日在海口举行陈慧娴Priscilla-ism中国巡回演唱会&nbsp;[10]<a></a>&nbsp;&nbsp;。\n</div>', '7', '5.00', '否', '10.00', null, '0', '通过');
INSERT INTO `movie` VALUES ('13', '谭维维的歌', 'b94ab285-c494-4432-bd73-547032f60857.jpg', '8d2f3c40-fcb9-424a-8b5d-fc48beda11ad.mp3', '24', '1', '谭维维', '2022', '2022-03-25', '<p style=\"text-indent:2em;\">\n	<span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁</span><span>谭维维是谁ff</span>\n</p>', '1', '0.00', '是', '0.00', '0', '14', '通过');
INSERT INTO `movie` VALUES ('16', '8888', 'fa2b6b47-94a4-46f6-a6dc-51a66dd41cd3.jpg', 'cd720f66-87f8-430e-b7fc-a11bc02aa9e3.mp3', '24', '2', '小华华', '2022', '2022-03-25', '11111112222222223333333', '2', '5.00', '是', '0.00', '0', '35', '通过');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('14', '国内首档外交主题青少年竞技综艺“外交新力量”即将上线', '088f628a-ff53-489c-8086-91a5133f3290.jpg', '展示青少年外交天赋，挖掘青少年外交潜能，搭建国际交流桥梁，一档名为“外交新力量”的青少年综艺节目近期将在中国新闻网上线，这也是国内首档以外交和国际文化交流为主题的青少年竞技展示视频节目。<br />\n<br />\n“外交新力量”以爱国主义为核心，“一带一路”青少年艺术文化交流为主题，通过“外交”主题的特色竞赛和研学等活动，组织引导青少年学习外交、文化知识，观摩体验国际文化交流工作，培养拓宽国际视野，进而帮助青少年进一步树立文化自信和爱国情怀。<br />\n<br />\n“外交新力量”由北京⼀路星光国际传媒有限公司（下称“一路星光”）、中国新闻网、南海影业联合主办，中科心理学研究（广州）中心协办，中国搜索、花漾搜索提供技术支持。作为业内知名的影视传媒公司，一路星光近年来创办运营了电影学院指数、长江国际影展等事业群，也是中国新闻社南海影业的战略合作伙伴。该综艺节目的技术支持则由搜索领域的“国家队”中国搜索领衔，中国搜索旗下青少年搜索引擎花漾搜索也将为节目助力。<br />', '2022-03-24 18:38:39');
INSERT INTO `news` VALUES ('15', '中国电影视觉艺术高峰论坛在琼举办', '4f98258f-c057-4af6-a48d-4842464db5cc.jpg', '&nbsp;2021年3月24-25日，中国电影视觉艺术高峰论坛在琼举办。电影行业权威人士齐聚海口，共同探讨影视设计制作和中国电影美学的创新与发展。<br />\n<br />\n&nbsp;在海南自贸港建设的大背景下，中国电影美术学会在海口举办中国电影视觉艺术高峰论坛正逢其时。行业嘉宾们将共同探讨如何让我们文化具有更广泛的传播力，把中国的名片通过电影传达到世界不同的文化领域，对文化强国的战略实施具有深远的意义，是中国开启未来向更强电影大国发展的重要之举。<br />', '2022-03-14 18:42:36');
INSERT INTO `news` VALUES ('16', '​电影《何以阳光》开镜 导演樊昊仑再次拍摄励志搏击题材影片', '0ac9845f-5a0a-405b-9ef9-b484ad24c4cf.jpg', '近日，亲情、励志、搏击题材电影《何以阳光》在重庆永川板桥镇正式开机，导演樊昊仑携主演景珂、宇桐非、郑龙、张绮烟、李华、苏一龙亮相发布会现场，作为樊昊仑的第三部导演作品，影片主要讲述了父亲肖首英曾经是一名当地很有名的拳手，经过一次事件后，他放弃了比赛生涯，在当地开设了一家搏击俱乐部，肖首英的儿子肖凯一直想和父亲学习搏击，但父亲一直百般阻止，为此父子二人10多年来一直斗争、争吵，肖凯长大后偷偷报名参加了区里的搏击精英选拔赛，并获得了去市里参加决赛的资格，父亲肖首英无奈成为儿子肖凯的教练，最后帮助肖凯获得冠军，化解了父子间一直以来的恩怨和误解。', '2022-03-24 18:43:13');

-- ----------------------------
-- Table structure for `playrecord`
-- ----------------------------
DROP TABLE IF EXISTS `playrecord`;
CREATE TABLE `playrecord` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `movieid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_playrecord_member` (`memberid`),
  KEY `fk_playrecord_movieid` (`movieid`),
  CONSTRAINT `fk_playrecord_member` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playrecord_movieid` FOREIGN KEY (`movieid`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playrecord
-- ----------------------------
INSERT INTO `playrecord` VALUES ('1', '14', '9');
INSERT INTO `playrecord` VALUES ('2', '14', '4');
INSERT INTO `playrecord` VALUES ('3', '28', '9');
INSERT INTO `playrecord` VALUES ('4', '29', '8');
INSERT INTO `playrecord` VALUES ('5', '30', '9');
INSERT INTO `playrecord` VALUES ('6', '30', '2');
INSERT INTO `playrecord` VALUES ('7', '30', '11');
INSERT INTO `playrecord` VALUES ('8', '14', '11');
INSERT INTO `playrecord` VALUES ('9', '14', '12');
INSERT INTO `playrecord` VALUES ('10', '31', '1');
INSERT INTO `playrecord` VALUES ('11', '31', '1');
INSERT INTO `playrecord` VALUES ('12', '31', '1');
INSERT INTO `playrecord` VALUES ('13', '31', '9');
INSERT INTO `playrecord` VALUES ('14', '31', '9');
INSERT INTO `playrecord` VALUES ('15', '31', '2');
INSERT INTO `playrecord` VALUES ('16', '32', '9');
INSERT INTO `playrecord` VALUES ('17', '32', '9');
INSERT INTO `playrecord` VALUES ('18', '32', '9');
INSERT INTO `playrecord` VALUES ('19', '32', '10');
INSERT INTO `playrecord` VALUES ('20', '32', '10');
INSERT INTO `playrecord` VALUES ('21', '32', '10');
INSERT INTO `playrecord` VALUES ('22', '32', '10');
INSERT INTO `playrecord` VALUES ('23', '33', '4');
INSERT INTO `playrecord` VALUES ('24', '33', '4');
INSERT INTO `playrecord` VALUES ('25', '33', '4');
INSERT INTO `playrecord` VALUES ('26', '33', '4');
INSERT INTO `playrecord` VALUES ('27', '33', '4');
INSERT INTO `playrecord` VALUES ('28', '33', '12');
INSERT INTO `playrecord` VALUES ('29', '33', '12');
INSERT INTO `playrecord` VALUES ('30', '34', '5');
INSERT INTO `playrecord` VALUES ('31', '34', '5');
INSERT INTO `playrecord` VALUES ('32', '34', '4');
INSERT INTO `playrecord` VALUES ('33', '34', '4');
INSERT INTO `playrecord` VALUES ('34', '34', '12');
INSERT INTO `playrecord` VALUES ('35', '14', '13');
INSERT INTO `playrecord` VALUES ('36', '35', '4');
INSERT INTO `playrecord` VALUES ('37', '35', '4');
INSERT INTO `playrecord` VALUES ('38', '35', '9');
INSERT INTO `playrecord` VALUES ('39', '35', '9');
INSERT INTO `playrecord` VALUES ('40', '35', '16');
INSERT INTO `playrecord` VALUES ('41', '35', '16');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `articleid` int(11) default NULL,
  `content` text,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reply_member` (`memberid`),
  KEY `fk_reply_article` (`articleid`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('11', '35', '12', '234234', '2022-03-25 21:49:43');
INSERT INTO `reply` VALUES ('12', '35', '12', '356356', '2022-03-25 21:49:45');
INSERT INTO `reply` VALUES ('13', '35', '12', '㐱', '2022-03-25 21:50:57');

-- ----------------------------
-- Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', '原创分享', '0');
INSERT INTO `section` VALUES ('2', '唱歌技巧分享', '0');

-- ----------------------------
-- Table structure for `sheet`
-- ----------------------------
DROP TABLE IF EXISTS `sheet`;
CREATE TABLE `sheet` (
  `id` int(11) NOT NULL auto_increment,
  `memberid` int(11) default NULL,
  `name` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sheet
-- ----------------------------
INSERT INTO `sheet` VALUES ('1', '14', '歌单一', '0');
INSERT INTO `sheet` VALUES ('2', '14', '歌单二', '0');
INSERT INTO `sheet` VALUES ('5', '14', '歌单三', '0');
INSERT INTO `sheet` VALUES ('6', '31', '我的第一个歌单', '0');
INSERT INTO `sheet` VALUES ('7', '32', '歌单一', '0');
INSERT INTO `sheet` VALUES ('8', '32', '歌单二', '0');
INSERT INTO `sheet` VALUES ('9', '32', '歌单三', '0');
INSERT INTO `sheet` VALUES ('10', '33', '小强歌单', '0');
INSERT INTO `sheet` VALUES ('11', '33', '女友歌单', '0');
INSERT INTO `sheet` VALUES ('12', '34', '强子歌单一', '0');
INSERT INTO `sheet` VALUES ('13', '34', '强子歌单二', '0');
INSERT INTO `sheet` VALUES ('14', '35', '果子的歌单一', '0');
INSERT INTO `sheet` VALUES ('15', '35', '果子的歌单二', '0');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(20) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `utype` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('9', 'admin', '123', '高手栽民间', '13887890066', '管理员', '0', 'a5f17be3-be04-497c-b5d0-f730f757d9bb.jpg');
