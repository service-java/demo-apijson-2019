-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 47.98.196.224    Database: sys
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apijson_user`
--

DROP TABLE IF EXISTS `apijson_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apijson_user` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别：\n0-男\n1-女',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `tag` varchar(45) DEFAULT NULL COMMENT '标签',
  `head` varchar(300) DEFAULT 'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png' COMMENT '头像url',
  `contactIdList` json DEFAULT NULL COMMENT '联系人id列表',
  `pictureList` json DEFAULT NULL COMMENT '照片列表',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1563605318976 DEFAULT CHARSET=utf8 COMMENT='用户公开信息表。\n对安全要求高，不想泄漏真实名称。对外名称为 User';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apijson_user`
--

LOCK TABLES `apijson_user` WRITE;
/*!40000 ALTER TABLE `apijson_user` DISABLE KEYS */;
INSERT INTO `apijson_user` VALUES (38710,0,'TommyLemon','Android&Java','http://static.oschina.net/uploads/user/1218/2437072_100.jpg?t=1461076033000','[82003, 82005, 90814, 82004, 82009, 82002, 82044, 93793, 70793]','[\"http://static.oschina.net/uploads/user/1218/2437072_100.jpg?t=1461076033000\", \"http://common.cnblogs.com/images/icon_weibo_24.png\"]','2017-02-01 11:21:50'),(70793,0,'Strong','djdj','http://static.oschina.net/uploads/user/585/1170143_50.jpg?t=1390226446000','[38710, 82002]','[\"http://static.oschina.net/uploads/img/201604/22172508_eGDi.jpg\", \"http://static.oschina.net/uploads/img/201604/22172507_rrZ5.jpg\", \"https://camo.githubusercontent.com/788c0a7e11a\", \"https://camo.githubusercontent.com/f513f67\"]','2017-02-01 11:21:50'),(82001,1,'测试账号','Dev','https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82012, 82003, 93794, 82006, 38710, 82004]','[\"http://common.cnblogs.com/images/icon_weibo_24.png\"]','2017-02-01 11:21:50'),(82002,1,'Happy~','iOS','http://static.oschina.net/uploads/user/1174/2348263_50.png?t=1439773471000','[82005, 82001, 38710]','[]','2017-02-01 11:21:50'),(82003,1,'Wechat',NULL,'http://common.cnblogs.com/images/wechat.png','[82001, 93793]','[]','2017-02-01 11:21:50'),(82004,0,'Tommy','fasef','http://static.oschina.net/uploads/user/1200/2400261_50.png?t=1439638750000','[]','[]','2017-02-01 11:21:50'),(82005,1,'Jan','AG','https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82001, 38710, 1532439021068]','[]','2017-02-01 11:21:50'),(82006,1,'Meria',NULL,'http://static.oschina.net/uploads/user/998/1997902_50.jpg?t=1407806577000','[]','[]','2017-02-01 11:21:50'),(82009,0,'God',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-02-01 11:21:50'),(82012,0,'Steve','FEWE','http://static.oschina.net/uploads/user/1/3064_50.jpg?t=1449566001000','[82004, 82002, 93793]','[]','2017-02-01 11:21:50'),(82020,0,'ORANGE',NULL,'http://static.oschina.net/uploads/user/48/96289_50.jpg?t=1452751699000','[]','[]','2017-02-01 11:21:50'),(82021,1,'Tommy',NULL,'http://static.oschina.net/uploads/user/19/39085_50.jpg','[]','[]','2017-02-01 11:21:50'),(82022,0,'Internet',NULL,'http://static.oschina.net/uploads/user/1332/2664107_50.jpg?t=1457405500000','[]','[]','2017-02-01 11:21:50'),(82023,0,'No1',NULL,'http://static.oschina.net/uploads/user/1385/2770216_50.jpg?t=1464405516000','[]','[]','2017-02-01 11:21:50'),(82024,0,'Lemon',NULL,'http://static.oschina.net/uploads/user/427/855532_50.jpg?t=1435030876000','[]','[]','2017-02-01 11:21:50'),(82025,1,'Tommy',NULL,'http://static.oschina.net/uploads/user/629/1258821_50.jpg?t=1378063141000','[]','[]','2017-02-01 11:21:50'),(82026,0,'iOS',NULL,'http://static.oschina.net/uploads/user/1200/2400261_50.png?t=1439638750000','[]','[]','2017-02-01 11:21:50'),(82027,0,'Yong',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-02-01 11:21:50'),(82028,1,'gaeg',NULL,'http://static.oschina.net/uploads/user/585/1170143_50.jpg?t=1390226446000','[]','[]','2017-02-01 11:21:50'),(82029,0,'GASG',NULL,'http://common.cnblogs.com/images/wechat.png','[]','[]','2017-02-01 11:21:50'),(82030,1,'Fun',NULL,'http://static.oschina.net/uploads/user/998/1997902_50.jpg?t=1407806577000','[]','[]','2017-02-01 11:21:50'),(82031,0,'Lemon',NULL,'http://static.oschina.net/uploads/user/48/96331_50.jpg','[]','[]','2017-02-01 11:21:50'),(82032,0,'Stack','fasdg','http://static.oschina.net/uploads/user/1385/2770216_50.jpg?t=1464405516000','[]','[]','2017-02-01 11:21:50'),(82033,1,'GAS',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-02-01 11:21:50'),(82034,1,'Jump',NULL,'http://static.oschina.net/uploads/user/1332/2664107_50.jpg?t=1457405500000','[]','[]','2017-02-01 11:21:50'),(82035,1,'Tab',NULL,'http://static.oschina.net/uploads/user/629/1258821_50.jpg?t=1378063141000','[]','[]','2017-02-01 11:21:50'),(82036,0,'SAG',NULL,'http://static.oschina.net/uploads/user/1332/2664107_50.jpg?t=1457405500000','[]','[]','2017-02-01 11:21:50'),(82037,0,'Test',NULL,'http://static.oschina.net/uploads/user/1200/2400261_50.png?t=1439638750000','[]','[]','2017-02-01 11:21:50'),(82038,0,'Battle',NULL,'http://static.oschina.net/uploads/user/48/96289_50.jpg?t=1452751699000','[]','[]','2017-02-01 11:21:50'),(82039,1,'Everyday',NULL,'http://common.cnblogs.com/images/icon_weibo_24.png','[]','[]','2017-02-19 13:57:56'),(82040,1,'Dream',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[70793]','[]','2017-03-02 16:44:26'),(82041,0,'Holo',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[38710, 82001]','[]','2017-03-04 09:59:34'),(82042,1,'Why',NULL,'http://static.oschina.net/uploads/user/585/1170143_50.jpg?t=1390226446000','[]','[]','2017-03-04 10:04:33'),(82043,0,'Holiday',NULL,'http://static.oschina.net/uploads/user/998/1997902_50.jpg?t=1407806577000','[70793, 82006]','[]','2017-03-04 10:05:04'),(82044,1,'Love',NULL,'http://static.oschina.net/uploads/user/1174/2348263_50.png?t=1439773471000','[82006]','[]','2017-03-04 10:20:27'),(82045,0,'Green',NULL,'http://common.cnblogs.com/images/wechat.png','[82001, 82002, 82003, 1485246481130]','[]','2017-03-04 10:22:39'),(82046,0,'Team',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[38710, 82002, 1485246481130]','[]','2017-03-04 15:11:17'),(82047,0,'Tesla',NULL,'http://common.cnblogs.com/images/wechat.png','[]','[]','2017-03-04 16:02:05'),(82048,0,'Moto',NULL,'http://static.oschina.net/uploads/user/48/96289_50.jpg?t=1452751699000','[]','[]','2017-03-04 16:04:02'),(82049,0,'ITMan',NULL,'http://static.oschina.net/uploads/user/629/1258821_50.jpg?t=1378063141000','[]','[]','2017-03-05 09:51:51'),(82050,0,'Parl',NULL,'http://static.oschina.net/uploads/user/998/1997902_50.jpg?t=1407806577000','[]','[]','2017-03-05 09:52:52'),(82051,0,'Girl',NULL,'http://static.oschina.net/uploads/user/1332/2664107_50.jpg?t=1457405500000','[]','[]','2017-03-05 09:53:37'),(82052,0,'Unbrella',NULL,'http://static.oschina.net/uploads/user/1385/2770216_50.jpg?t=1464405516000','[]','[]','2017-03-05 09:57:54'),(82053,0,'Alice',NULL,'http://common.cnblogs.com/images/wechat.png','[]','[]','2017-03-05 15:25:42'),(82054,0,'Harvey',NULL,'http://static.oschina.net/uploads/user/19/39085_50.jpg','[]','[]','2017-03-06 12:29:03'),(82055,1,'Solid',NULL,'http://static.oschina.net/uploads/user/19/39085_50.jpg','[38710, 82002]','[]','2017-03-11 15:04:00'),(82056,1,'IronMan',NULL,'http://static.oschina.net/uploads/user/48/96289_50.jpg?t=1452751699000','[]','[]','2017-03-11 15:32:25'),(82057,0,'NullPointerExeption',NULL,'http://static.oschina.net/uploads/user/1385/2770216_50.jpg?t=1464405516000','[]','[]','2017-03-12 06:01:23'),(82058,0,'StupidBird',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82001, 82002]','[]','2017-03-12 11:23:04'),(82059,1,'He&She',NULL,'http://static.oschina.net/uploads/user/585/1170143_50.jpg?t=1390226446000','[]','[]','2017-03-19 14:49:15'),(82060,1,'Anyway~',NULL,'http://static.oschina.net/uploads/user/1/3064_50.jpg?t=1449566001000','[]','[]','2017-03-21 14:10:18'),(90814,0,'007',NULL,'http://static.oschina.net/uploads/user/51/102723_50.jpg?t=1449212504000','[]','[]','2017-02-01 11:21:50'),(93793,0,'Mike','GES','http://static.oschina.net/uploads/user/48/96331_50.jpg','[]','[]','2017-02-01 11:21:50'),(93794,0,'Lemon',NULL,'http://static.oschina.net/uploads/user/48/97721_50.jpg?t=1451544779000','[]','[]','2017-02-01 11:21:50'),(1490109742863,1,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-03-21 15:22:22'),(1490109845208,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-03-21 15:24:05'),(1490420651686,1,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[70793]','[]','2017-03-25 05:44:11'),(1490427139175,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[38710, 70793]','[]','2017-03-25 07:32:19'),(1490427577823,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-03-25 07:39:37'),(1490584952968,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-03-27 03:22:32'),(1490973670928,1,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[70793, 93793]','[]','2017-03-31 15:21:10'),(1492936169722,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-04-23 08:29:29'),(1493480142628,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-04-29 15:35:42'),(1493747512860,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-02 17:51:52'),(1493747777770,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-02 17:56:17'),(1493748594003,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-02 18:09:54'),(1493748615711,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-02 18:10:15'),(1493749090643,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-02 18:18:10'),(1493836043151,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-03 18:27:23'),(1493883110132,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-04 07:31:50'),(1493890214167,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-04 09:30:14'),(1493890303473,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-05-04 09:31:43'),(1493890303474,0,'Test Post',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-06-12 15:50:44'),(1497792972314,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-06-18 13:36:12'),(1499057230629,0,'一二三',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-07-03 04:47:10'),(1500825221910,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-07-23 15:53:41'),(1502639062900,0,'TESLA',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-08-13 15:44:22'),(1502639424119,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-08-13 15:50:24'),(1507220582167,0,'APIJSONUser','通过APIJSONAuto的图像化界面注册，按Enter而不是Register','https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-10-05 16:23:02'),(1508072071492,0,'赵钱孙李',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-10-15 12:54:31'),(1508072105320,1,'周吴郑王',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-10-15 12:55:05'),(1508072160401,0,'四五六',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-10-15 12:56:00'),(1508072202871,0,'七八九十',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-10-15 12:56:42'),(1510495628760,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-11-12 14:07:08'),(1511407581570,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002, 82003, 82005, 82006, 82021, 82023, 82036, 82033]','[]','2017-11-23 03:26:21'),(1511761906715,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-11-27 05:51:46'),(1511965911349,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-11-29 14:31:51'),(1512387063078,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]','[]','2017-12-04 11:31:03'),(1512531601485,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82001]','[]','2017-12-06 03:40:01'),(1514623064133,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2017-12-30 08:37:44'),(1514625918255,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002, 93793]',NULL,'2017-12-30 09:25:18'),(1514626163032,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2017-12-30 09:29:23'),(1514858422969,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[93793, 82056]',NULL,'2018-01-02 02:00:22'),(1515565976140,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82003, 82021]',NULL,'2018-01-10 06:32:56'),(1518218350585,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-02-09 23:19:10'),(1519778917280,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-02-28 00:48:37'),(1520242280259,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002]',NULL,'2018-03-05 09:31:20'),(1521274648008,0,'Kiro',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-03-17 08:17:28'),(1521371722416,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-03-18 11:15:22'),(1521374327542,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-03-18 11:58:47'),(1523626157302,1,'Charlie_brown','','https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1523935772553, 93793]',NULL,'2018-04-13 13:29:17'),(1523935772553,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1523626157302]',NULL,'2018-04-17 03:29:32'),(1524042900591,1,'哈哈哈',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002, 82003]',NULL,'2018-04-18 09:15:00'),(1524298730523,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[]',NULL,'2018-04-21 08:18:50'),(1524878698882,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-04-28 01:24:58'),(1525677515673,0,'APIJSONUser',NULL,'http://static.oschina.net/uploads/user/48/96289_50.jpg?t=1452751699000','[82003, 82002, 38710]',NULL,'2018-05-07 07:18:35'),(1527495857924,0,'account',NULL,'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2510057322,2452415311&fm=27&gp=0.jpg','[1527821445610, 82012]',NULL,'2018-05-28 08:24:17'),(1527498229991,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1499057230629]',NULL,'2018-05-28 09:03:50'),(1527821445610,0,'accountt',NULL,'http://static.oschina.net/uploads/user/1332/2664107_50.jpg?t=1457405500000','[1527495857924]',NULL,'2018-06-01 02:50:45'),(1528250827953,1,'limengt',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1528264711016]',NULL,'2018-06-06 02:07:07'),(1528254173621,1,'A',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82001, 38710]',NULL,'2018-06-06 03:02:53'),(1528255497767,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002]',NULL,'2018-06-06 03:24:57'),(1528264711016,0,'梦',NULL,'http://static.oschina.net/uploads/user/629/1258821_50.jpg?t=1378063141000','[82021, 1528250827953]',NULL,'2018-06-06 05:58:31'),(1528339692804,1,'568599',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1528250827953, 1528264711016]',NULL,'2018-06-07 02:48:12'),(1528344980598,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-06-07 04:16:20'),(1528356470041,0,'aaaa',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1528339692804]',NULL,'2018-06-07 07:27:50'),(1531969715979,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002, 82003, 82005]',NULL,'2018-07-19 03:08:35'),(1532188114543,0,'宁旭',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-07-21 15:48:34'),(1532439021068,0,'huxiaofan',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[38710, 82002, 82003, 82006, 82021]',NULL,'2018-07-24 13:30:21'),(1533835176109,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1532188114543]',NULL,'2018-08-09 17:19:36'),(1534926301956,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82003, 82002, 82025]',NULL,'2018-08-22 08:25:01'),(1538504264944,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-10-02 18:17:44'),(1538504500574,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-10-02 18:21:40'),(1538987952996,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-10-08 08:39:13'),(1541583762603,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-11-07 09:42:42'),(1544276209348,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82002, 38710]',NULL,'2018-12-08 13:36:49'),(1544503822963,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[93793, 82003]',NULL,'2018-12-11 04:50:22'),(1545707526805,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-12-25 03:12:06'),(1545895694424,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2018-12-27 07:28:14'),(1547177436600,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2019-01-11 03:30:36'),(1548068043688,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2019-01-21 10:54:03'),(1553095415917,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[82001]',NULL,'2019-03-20 15:23:35'),(1553527700480,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2019-03-25 15:28:20'),(1559129626356,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png','[1507220582167]',NULL,'2019-05-29 11:33:46'),(1560409157504,0,'上邪',NULL,'最好的时光',NULL,NULL,'2019-06-13 06:59:17'),(1561539257158,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2019-06-26 08:54:17'),(1563605318975,0,'APIJSONUser',NULL,'https://raw.githubusercontent.com/TommyLemon/StaticResources/master/APIJSON_Logo.png',NULL,NULL,'2019-07-20 06:48:38');
/*!40000 ALTER TABLE `apijson_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-04 22:58:37
