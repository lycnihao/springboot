/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : hom1db

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-01-14 16:08:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `attach_id` bigint(20) NOT NULL,
  `attach_created` datetime DEFAULT NULL,
  `attach_location` varchar(255) DEFAULT NULL,
  `attach_name` varchar(255) DEFAULT NULL,
  `attach_origin` int(11) DEFAULT NULL,
  `attach_path` varchar(255) DEFAULT NULL,
  `attach_size` varchar(255) DEFAULT NULL,
  `attach_small_path` varchar(255) DEFAULT NULL,
  `attach_suffix` varchar(255) DEFAULT NULL,
  `attach_type` varchar(255) DEFAULT NULL,
  `attach_wh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attach_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attachment
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `uuid` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `blog` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('58302A0634AB6EAA50826B990ECCE64C', 'http://thirdqq.qlogo.cn/g?b=oidb&k=xQMdiaCNq4FK3KqOLR9RBcw&s=100&t=1571066314', null, null, null, '0', '湖南-长沙', '会飞的虾', null, 'QQ', '会飞的虾');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ordered` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cate_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('148', null, null, '设计兼职', '0', '-1', 'workmodule3', '0', '0');
INSERT INTO `category` VALUES ('147', null, null, '程序兼职', '0', '0', 'workmodule2', '0', '0');
INSERT INTO `category` VALUES ('146', null, null, '招聘平台', '0', '0', 'workmodule1', '0', '0');
INSERT INTO `category` VALUES ('145', null, null, '硬件系统', '0', '-1', 'hardwaremodule2', '0', '0');
INSERT INTO `category` VALUES ('144', null, null, '开发硬件', '0', '-1', 'hardwaremodule1', '0', '0');
INSERT INTO `category` VALUES ('143', null, null, 'ASO优化', '0', '-1', 'operationmodule8', '0', '0');
INSERT INTO `category` VALUES ('142', null, null, '网站收录', '0', '0', 'operationmodule7', '0', '0');
INSERT INTO `category` VALUES ('141', null, null, '新媒工具', '0', '0', 'operationmodule6', '0', '0');
INSERT INTO `category` VALUES ('140', null, null, '新媒平台', '0', '0', 'operationmodule5', '0', '0');
INSERT INTO `category` VALUES ('139', null, null, '数据收集', '0', '-1', 'operationmodule4', '0', '0');
INSERT INTO `category` VALUES ('138', null, null, '数据工具', '0', '-1', 'operationmodule3', '0', '0');
INSERT INTO `category` VALUES ('137', null, null, '数据分析', '0', '0', 'operationmodule2', '0', '0');
INSERT INTO `category` VALUES ('136', null, null, '域名注册', '0', '-1', 'operationmodule1', '0', '0');
INSERT INTO `category` VALUES ('135', null, null, '交流社区', '0', '0', 'researchmodule10', '0', '0');
INSERT INTO `category` VALUES ('134', null, null, '开放资源', '0', '-1', 'researchmodule9', '0', '0');
INSERT INTO `category` VALUES ('133', null, null, '学习教程', '0', '-1', 'researchmodule8', '0', '0');
INSERT INTO `category` VALUES ('132', null, null, '开发工具', '0', '-1', 'researchmodule7', '0', '0');
INSERT INTO `category` VALUES ('131', null, null, '代码托管', '0', '-1', 'researchmodule6', '0', '0');
INSERT INTO `category` VALUES ('130', null, null, '内容管理', '0', '-1', 'researchmodule5', '0', '0');
INSERT INTO `category` VALUES ('129', null, null, '个人框架', '0', '-1', 'researchmodule4', '0', '0');
INSERT INTO `category` VALUES ('128', null, null, '检查测试', '0', '-1', 'researchmodule3', '0', '0');
INSERT INTO `category` VALUES ('127', null, null, '后端系统', '0', '-1', 'researchmodule2', '0', '0');
INSERT INTO `category` VALUES ('126', null, null, '前端框架', '0', '-1', 'researchmodule1', '0', '0');
INSERT INTO `category` VALUES ('125', null, null, '交流社区', '0', '-1', 'designmodule13', '0', '0');
INSERT INTO `category` VALUES ('124', null, null, '学习教程', '0', '-1', 'designmodule12', '0', '0');
INSERT INTO `category` VALUES ('123', null, null, '设计团队', '0', '-1', 'designmodule11', '0', '0');
INSERT INTO `category` VALUES ('122', null, null, '设计工具', '0', '0', 'designmodule10', '0', '0');
INSERT INTO `category` VALUES ('121', null, null, '设计规范', '0', '-1', 'designmodule9', '0', '0');
INSERT INTO `category` VALUES ('120', null, null, '字体字形', '0', '0', 'designmodule8', '0', '0');
INSERT INTO `category` VALUES ('119', null, null, '颜色搭配', '0', '0', 'designmodule7', '0', '0');
INSERT INTO `category` VALUES ('118', null, null, '优质图库', '0', '0', 'designmodule6', '0', '0');
INSERT INTO `category` VALUES ('117', null, null, '设计素材', '0', '0', 'designmodule5', '0', '0');
INSERT INTO `category` VALUES ('116', null, null, 'icon图标', '0', '0', 'designmodule4', '0', '0');
INSERT INTO `category` VALUES ('115', null, null, '交互案例', '0', '0', 'designmodule3', '0', '0');
INSERT INTO `category` VALUES ('108', null, null, '原型工具', '0', '0', 'productmodule2', '0', '0');
INSERT INTO `category` VALUES ('109', null, null, '思维导图', '0', '0', 'productmodule3', '0', '0');
INSERT INTO `category` VALUES ('110', null, null, '协同工作', '0', '0', 'productmodule4', '0', '0');
INSERT INTO `category` VALUES ('111', null, null, '文档编辑', '0', '0', 'productmodule5', '0', '0');
INSERT INTO `category` VALUES ('112', null, null, '云盘存储', '0', '-1', 'productmodule6', '0', '0');
INSERT INTO `category` VALUES ('113', null, null, '灵感收录', '0', '0', 'designmodule1', '0', '0');
INSERT INTO `category` VALUES ('114', null, null, '设计资讯', '0', '-1', 'designmodule2', '0', '0');
INSERT INTO `category` VALUES ('107', null, null, '平台资讯', '0', '0', 'productmodule1', '0', '0');
INSERT INTO `category` VALUES ('149', null, null, '我的常用网址', '0', '0', 'home', '0', '1');

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('1');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_name` varchar(127) NOT NULL,
  `option_value` longtext,
  PRIMARY KEY (`option_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of options
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `ordered` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` text,
  `visits` int(11) DEFAULT NULL,
  PRIMARY KEY (`website_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1407 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('1406', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-0701ddca0aa64f7da6b96a036012f30c.png', '0', '提供产品咨询、众测方案', '外包大师', 'public', 'http://www.waibaodashi.com/', '1');
INSERT INTO `website` VALUES ('1405', '2020-01-12 23:07:15', 'upload/2020\\1\\/favicon-37fc4831379e422cac17445e71ca0a60.ico', '0', '创作者的极简变现工具', '面包多', 'public', 'https://mianbaoduo.com/?from=czs', '1');
INSERT INTO `website` VALUES ('1404', '2020-01-12 23:07:15', 'upload/2020\\1\\/tezign-favicon-09b4d2b83d894e22bd1c064248ef39de.ico', '0', '设计创意需求解决平台', '特赞', 'public', 'https://www.tezign.com/', '1');
INSERT INTO `website` VALUES ('1402', '2020-01-12 23:07:15', null, '0', 'WEB和移动设计项目兼职平台', 'Crew', 'public', 'https://crew.co/', '0');
INSERT INTO `website` VALUES ('1403', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-f8e5deda30404065b6a09b79530cc11b.png', '0', '拉勾旗下按需雇佣平台', '大鲲', 'public', 'https://www.lagou.com/about.html', '0');
INSERT INTO `website` VALUES ('1401', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-0494b110686a46b4919bbe3c749dc1ef.png', '0', '按需雇佣BAT工程师、设计师', '实现网', 'public', 'https://shixian.com/', '0');
INSERT INTO `website` VALUES ('1400', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-f32bb6b8053e4ee0a3b9d58a083f4b28.png', '0', '程序员的经纪人', '程序员客栈', 'public', 'https://www.proginn.com/', '0');
INSERT INTO `website` VALUES ('1399', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-02b9962c4af44882bff1d676365e2b4f.png', '0', '基于云技术的软件外包服务平台', '码市', 'private', 'https://codemart.com/', '0');
INSERT INTO `website` VALUES ('1398', '2020-01-12 23:07:15', 'upload/2020\\1\\/favicon-9cd6ba087ca9476c8bb03d421c418d64.ico', '0', '国外职业众包平台', 'Fiverr', 'private', 'https://www.fiverr.com/', '0');
INSERT INTO `website` VALUES ('1397', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-aefdae275e814837aa8259f384946bba.png', '0', '全球最大平台：程序丨设计', 'Freelancer', 'private', 'https://www.freelancer.com/', '0');
INSERT INTO `website` VALUES ('1395', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-fbb7916ce4654434a4b0f8cca6fc8e87.png', '0', '全球领先的职业社交网站', 'Linkedin', 'private', 'https://www.linkedin.com/', '0');
INSERT INTO `website` VALUES ('1396', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-7fc4c85890e54c16bcf4bef805910303.png', '0', '全球最专业平台：程序丨设计丨文案', 'Upwork', 'private', 'https://www.upwork.com/', '1');
INSERT INTO `website` VALUES ('1394', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-fb990e4895214dc2a445a72a018442f9.png', '0', '年轻人专属社交招聘平台', '大街', 'private', 'https://www.dajie.com/', '1');
INSERT INTO `website` VALUES ('1393', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-08b165fa1c594e788db1afeb7880aff4.png', '0', '专注互联网职业招聘平台', '拉勾', 'private', 'https://www.lagou.com/', '0');
INSERT INTO `website` VALUES ('1392', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-85e15d94eb614dda884c2d998a649548.png', '0', '精英职业发展平台', '猎聘', 'private', 'https://www.liepin.com/', '0');
INSERT INTO `website` VALUES ('1390', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-b14594cbf1c04d02bd096f8d4058e168.png', '0', '专业人才招聘网站', '前程无忧', 'private', 'https://www.51job.com/', '0');
INSERT INTO `website` VALUES ('1391', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-094d2ef0f948407f88f95f9ec1980e18.png', '0', '生活分类信息网站', '58同城', 'private', 'https://sh.58.com/', '0');
INSERT INTO `website` VALUES ('1387', '2020-01-12 23:04:11', null, '0', 'Android的物联网嵌入式操作系统', 'Android Things', 'private', 'https://developer.android.com/things/get-started/', '0');
INSERT INTO `website` VALUES ('1388', '2020-01-12 23:04:11', 'upload/2020\\1\\/tentacle-32x32-e40875efa0e5457a851acecc38c338cf.png', '0', '3D打印服务器', 'OctoPrint', 'private', 'https://octoprint.org/', '1');
INSERT INTO `website` VALUES ('1389', '2020-01-12 23:07:15', 'upload/2020\\1\\couldr_com_-4cc2984f3d41424f97eae46553735580.png', '0', '权威的求职找工作平台', '智联招聘', 'private', 'https://www.zhaopin.com/', '0');
INSERT INTO `website` VALUES ('1386', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-6d50855f3b4b4102bf12f98cbddc509b.png', '0', '为ARM开发板专门发行轻量级Debian', 'Armbian', 'private', 'https://www.armbian.com/', '0');
INSERT INTO `website` VALUES ('1385', '2020-01-12 23:04:11', null, '0', '开源多平台轻量快速BT下载客户端', 'Transmissionbt', 'private', 'https://transmissionbt.com/', '0');
INSERT INTO `website` VALUES ('1384', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-c3ebe03ea3db4f22bccd5e9a4eda6a3e.ico', '0', '基于Python3的开源智能家居平台', 'Home Assistant', 'private', 'https://www.home-assistant.io/', '0');
INSERT INTO `website` VALUES ('1383', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-f1e11b2992464b85bd62f7347317a142.png', '0', 'linux免费开源多媒体播放器', 'OSMC', 'private', 'https://osmc.tv/', '0');
INSERT INTO `website` VALUES ('1382', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-0235b026cee844c88424922eed5166f9.ico', '0', '专注于迷你linux板精简化Kodi系统', 'LibreELEC', 'private', 'https://libreelec.tv/', '0');
INSERT INTO `website` VALUES ('1380', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-73e03d2a92c5462ab8d86aebe698c437.png', '0', '基于Debian的存储(NAS)系统', 'OpenMediaVault', 'private', 'https://www.openmediavault.org/', '0');
INSERT INTO `website` VALUES ('1381', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-4b7dd7852c604d37a0cf4e210a8bc3bf.png', '0', '开源家庭多媒体影音中心播放器', 'Kodi', 'private', 'https://kodi.tv/', '0');
INSERT INTO `website` VALUES ('1379', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-f107a55b78b44e799715365c036e047b.ico', '0', '嵌入式的Linux发行版路由器系统', 'OpenWrt', 'private', 'https://openwrt.org/downloads', '0');
INSERT INTO `website` VALUES ('1378', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-3a4962d1669e4a83a613cda5b0179415.png', '0', '基于ARM的UNIX操作系统', 'FreeBSD-ARM', 'private', 'https://www.freebsd.org/platforms/arm.html', '0');
INSERT INTO `website` VALUES ('1376', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-e64cbb5a5e414b21b4646178c2440bfb.png', '0', '轻量简洁为设计理念的Linux发行版', 'ArchLinux', 'private', 'https://archlinuxarm.org/platforms', '1');
INSERT INTO `website` VALUES ('1377', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-e142c06b7ee544e484f2be4118d7b40a.png', '0', '基于ARM版本的linux黑客安防渗透系统', 'Kali-ARM', 'private', 'https://www.offensive-security.com/kali-linux-arm-images/', '0');
INSERT INTO `website` VALUES ('1375', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-c07171768b0c4f968f0a34878c1cbacc.png', '0', '针对物联网的一个发行版本', 'Ubuntu Core	Ubuntu', 'private', 'https://ubuntu.com/download/iot/raspberry-pi', '0');
INSERT INTO `website` VALUES ('1374', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-a34722adc30743fcbc4e82769efc3761.ico', '0', '面向ARM硬件架构的CentOS7系统', 'CentOS-ARM', 'private', 'http://isoredirect.centos.org/altarch/7/isos/armhfp/', '1');
INSERT INTO `website` VALUES ('1373', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-fde5bf24914248b9a8daccd95a29d3df.png', '0', '微软windows10物联网系统', 'Windows10 IoT', 'private', 'https://developer.microsoft.com/en-us/windows/iot/getstarted', '1');
INSERT INTO `website` VALUES ('1372', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-50bccb57d6bb4b31b1a73b57a1a914bb.png', '0', '树莓派官方推荐的Linux系统', 'Raspbian', 'private', 'https://www.raspberrypi.org/downloads/', '0');
INSERT INTO `website` VALUES ('1371', '2020-01-12 23:04:11', null, '0', '英特尔X86迷你主机电脑', '英特尔®NUC', 'private', 'https://www.intel.cn/content/www/cn/zh/products/boards-kits/nuc.html', '0');
INSERT INTO `website` VALUES ('1369', '2020-01-12 23:04:11', null, '0', '64位单片机微电脑(支持linux和安卓)', 'PINE64', 'private', 'https://www.pine64.org/', '0');
INSERT INTO `website` VALUES ('1370', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-c47c5db91dcf46c89532eb07513fe7b9.png', '0', '国内开源的商业单板电脑', '香橙派', 'private', 'http://www.orangepi.cn/', '1');
INSERT INTO `website` VALUES ('1368', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-7e8c45b9cd704168a83f46a6dbef7e4b.png', '0', '树莓派笔记本模块化电脑', 'pi-top', 'private', 'https://www.pi-top.com/', '1');
INSERT INTO `website` VALUES ('1367', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-6abb29bc2fcc4944b90078daaccf74e8.png', '0', 'U盘大小的微型计算机', 'USBArmory', 'private', 'https://inversepath.com/usbarmory', '0');
INSERT INTO `website` VALUES ('1366', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-4c78f2eddd3f4517abc9ef140dfc0f40.ico', '0', '国内开源无线创客板', 'NanoPi', 'private', 'http://nanopi.org/', '0');
INSERT INTO `website` VALUES ('1365', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-bd4bdf7831e947a4b0b877edcf6f0f23.png', '0', '超迷你单片机', 'vocore', 'private', 'https://vocore.io/', '0');
INSERT INTO `website` VALUES ('1363', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-85914211d0174aa08dd3e6df79be5ad1.png', '0', '便捷灵活的开发版', 'Arduino', 'private', 'https://www.arduino.cc/', '0');
INSERT INTO `website` VALUES ('1364', '2020-01-12 23:04:11', null, '0', '国产卡片式微型计算机', '香蕉派', 'private', 'http://www.banana-pi.com/eindex.asp', '0');
INSERT INTO `website` VALUES ('1362', '2020-01-12 23:04:11', 'upload/2020\\1\\/logo_udoo_32-f9458369d90840669d0bbca6c835c902.ico', '0', '支持Android和Linux双系统开发主板', 'UDOO', 'private', 'https://www.udoo.org/udoo-neo/', '0');
INSERT INTO `website` VALUES ('1361', '2020-01-12 23:04:11', 'upload/2020\\1\\couldr_com_-84254c474afc4eee8453761f8521f72d.png', '0', '基于Python的物联网单片机', 'MicroPython', 'private', 'https://micropython.org/', '1');
INSERT INTO `website` VALUES ('1359', '2020-01-12 23:00:51', 'upload/2020\\1\\/bitbug_favicon-ae8451e20c8b4873977935ba572f70a2.ico', '0', '[国内]移动APP推广数据分析平台', 'aso100', 'private', 'https://www.qimai.cn/', '0');
INSERT INTO `website` VALUES ('1360', '2020-01-12 23:04:11', 'upload/2020\\1\\/favicon-3b0b41f7f02b412d96ae6091f005f3cf.png', '0', '全球热捧基于ARM的微型电脑主板', '树莓派', 'private', 'https://www.raspberrypi.org', '1');
INSERT INTO `website` VALUES ('1358', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-d41c28b13a5a443eaebae7648e21a1ba.png', '0', '提升IOS和Andriod排名可见度', 'AsoDesk', 'private', 'https://asodesk.com/', '0');
INSERT INTO `website` VALUES ('1357', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-c7ae35f4fe3a46b383c9270aa304d6f7.png', '0', 'App Store数据优化工具', 'Apptweak', 'private', 'https://www.apptweak.com/', '0');
INSERT INTO `website` VALUES ('1355', '2020-01-12 23:00:51', null, '0', '免费的APP Store关键词优化', 'KeywordTool', 'private', 'https://keywordtool.io/app-store', '0');
INSERT INTO `website` VALUES ('1356', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-bfbbad99df5948d290f1497b407a3cfa.png', '0', '移动数据分析和优化工具', 'MobileAction', 'private', 'https://www.mobileaction.co/', '0');
INSERT INTO `website` VALUES ('1354', '2020-01-12 23:00:51', null, '0', '移动端APP应用分析和市场数据', 'Appannie', 'private', 'https://www.appannie.com/cn/', '0');
INSERT INTO `website` VALUES ('1353', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-1a99bcb5c9624e25b8901796fc6ae51b.ico', '0', 'UC浏览器移动平台搜索提交入口', '神马搜索收录', 'private', 'https://zhanzhang.sm.cn/', '0');
INSERT INTO `website` VALUES ('1352', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-47a1a007c886493f8b5d1c435a2eae87.png', '0', '搜狗搜索网站提交收录入口', '搜狗收录', 'private', 'http://fankui.help.sogou.com/index.php/web/web/index?type=9', '0');
INSERT INTO `website` VALUES ('1351', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-5453bba703bd447f9440a27ab64d7b24.png', '0', '360搜索网站提交收录入口', '360收录', 'private', 'http://info.so.360.cn/site_submit.html', '0');
INSERT INTO `website` VALUES ('1350', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-a775149f529a4b24a3169c9e0c169a4e.ico', '0', 'Bing搜索网站提交收录入口', 'Bing收录', 'private', 'https://blogs.bing.com/webmaster/september-2018/Anonymous-URL-Submission-Tool-Being-Retired', '0');
INSERT INTO `website` VALUES ('1349', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-4d38353eaf89449abebfb50a1b5cd380.png', '0', '百度搜索网站提交收录入口', '百度收录', 'private', 'https://ziyuan.baidu.com/linksubmit/url', '0');
INSERT INTO `website` VALUES ('1348', '2020-01-12 23:00:51', null, '0', 'Google搜索网站提交收录入口[需登录]', 'Google收录', 'private', 'https://www.google.com/webmasters/tools/submit-ur', '0');
INSERT INTO `website` VALUES ('1347', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-ee3a91b6599941ca9a1b0f0224d0ea8d.png', '0', '阿里人工智能电商Banner广告图制作', '鹿班', 'private', 'https://luban.aliyun.com/', '0');
INSERT INTO `website` VALUES ('1346', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon_event_tezign-89935794c47c4d68a4e829d70d03ef79.ico', '0', '特赞旗下的营销热点日历', 'Event', 'private', 'https://cal.tezign.com/home', '1');
INSERT INTO `website` VALUES ('1345', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-c2dc5081e9a34f65950fda11acfd6b63.ico', '0', '免费H5页面微场景制作工具', '易企秀', 'private', 'http://www.eqxiu.com/', '0');
INSERT INTO `website` VALUES ('1343', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-new-8615028296-dcedca45bd60458bbc6046b48063583d.ico', '0', '微信公众号编辑器Chrome插件', '壹伴', 'private', 'https://yiban.io/', '0');
INSERT INTO `website` VALUES ('1344', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-d87011339be2444cb2da1fb82c01bf08.png', '0', 'H5制作及图文排版在线工具', '秀米', 'private', 'https://xiumi.us/#/', '0');
INSERT INTO `website` VALUES ('1342', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-78ca448c73ac486ebc9d35cecd0e1e11.png', '0', '今日头条旗下新兴创作平台', '头条号', 'private', 'https://mp.toutiao.com/auth/page/login/?redirect_url=JTJG', '0');
INSERT INTO `website` VALUES ('1341', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-77a75401cb6544e6947dda6a19a10cc9.png', '0', '百度旗下自媒体', '熊掌号', 'private', 'https://xiongzhang.baidu.com/id/regid/index?castk=LTE%3D', '0');
INSERT INTO `website` VALUES ('1340', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-6f26cebb9ca047dea5802ddcd2e3aee9.ico', '0', 'UC旗下自媒体平台', 'UC云观', 'private', 'https://mp.dayu.com/', '0');
INSERT INTO `website` VALUES ('1339', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-9050c83c21f04f01bbebb42439f2dc08.png', '0', '写作与阅读整合一起的博客平台', '简书', 'private', 'https://www.jianshu.com/', '0');
INSERT INTO `website` VALUES ('1337', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-7da4cf80066c4ad2a9656e7fb440c861.png', '0', '腾讯订阅、服务号的平台', '微信公众号', 'private', 'https://mp.weixin.qq.com/', '0');
INSERT INTO `website` VALUES ('1338', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-a1cd2a7ad15443fe927acf07674d90f8.png', '0', '知乎随心写作，自由表达平台', '知乎专栏', 'private', 'https://zhuanlan.zhihu.com/', '0');
INSERT INTO `website` VALUES ('1336', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-b263b2ebf1f0462e858f6709c8bb39a8.png', '0', '国内使用较多的问卷调查表', '问卷星', 'private', 'https://www.wjx.cn/', '0');
INSERT INTO `website` VALUES ('1335', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-2c8be7e8cf1049c38ca892721f3473e0.png', '0', '简洁易用的表单制作与联系人管理工具', '麦客', 'private', 'http://www.mikecrm.com/', '0');
INSERT INTO `website` VALUES ('1334', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-0f15f6bc57c94acebef262997c1f67f7.png', '0', '腾讯问卷调查', '腾讯问卷', 'private', 'https://wj.qq.com/', '0');
INSERT INTO `website` VALUES ('1333', '2020-01-12 23:00:51', null, '0', 'Google创建调查问卷和分析结果', 'Google表单', 'private', 'https://www.google.com/intl/zh-CN/forms/about/', '0');
INSERT INTO `website` VALUES ('1331', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-3eaaa52268254af4b0a2bfe56ea2c91b.ico', '0', '可编辑web数据可视化', 'Datamatic', 'private', 'https://datamatic.io/', '1');
INSERT INTO `website` VALUES ('1332', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-18c3b40a17f9408a9272547e9204a48f.png', '0', '全球著名的在线问卷调查服务', 'SurveyMonkey', 'private', 'https://www.surveymonkey.com/', '0');
INSERT INTO `website` VALUES ('1330', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-2a962663b9d641cda0e1d94117c7cfa8.png', '0', '现代炫酷的商业数据可视化科学', 'Plotly', 'private', 'https://plot.ly/', '0');
INSERT INTO `website` VALUES ('1329', '2020-01-12 23:00:51', null, '0', '百度数据可视化', 'Echarts', 'private', 'https://www.echartsjs.com/zh/index.html', '0');
INSERT INTO `website` VALUES ('1328', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-ff0be53aa5914a19bb729b8ab55573be.ico', '0', '在线地图可视化应用', 'Pixelmap', 'private', 'https://pixelmap.amcharts.com/', '0');
INSERT INTO `website` VALUES ('1327', '2020-01-12 23:00:51', null, '0', '蚂蚁金服专业数据可视化规范', 'Antv', 'private', 'https://antv.alipay.com/zh-cn/index.html', '1');
INSERT INTO `website` VALUES ('1325', '2020-01-12 23:00:51', null, '0', '移动端APP应用分析和市场数据', 'Appannie', 'private', 'https://www.appannie.com/cn/', '0');
INSERT INTO `website` VALUES ('1326', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-e2391a1801494ebc98011c824b32f3b1.png', '0', '好用的网站排名丨流量数据分析', 'Similarweb', 'private', 'https://www.similarweb.com/', '0');
INSERT INTO `website` VALUES ('1324', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-5fbc6ad3331444be9264bd9c11b7cdbe.png', '0', '互联网网站的世界排名', 'Alexa排名', 'private', 'https://www.alexa.com/', '0');
INSERT INTO `website` VALUES ('1323', '2020-01-12 23:00:51', null, '0', '能查找到网页历史缓存界面', 'Archive', 'private', 'https://archive.org/web/', '0');
INSERT INTO `website` VALUES ('1322', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-710bcd19cd4d4c83910bf02406870c78.ico', '0', '站长工具数据查询网站', '站长工具', 'private', 'http://tool.chinaz.com/', '0');
INSERT INTO `website` VALUES ('1321', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-71012fe35fc9484ca459f00d38c03296.png', '0', '查找企业信息资质', '天眼查', 'private', 'https://www.tianyancha.com/', '0');
INSERT INTO `website` VALUES ('1320', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-3425288e57404ec0865ddcb2ad6e6068.png', '0', '电商行业价格、供应、采购趋势分析', '阿里指数', 'private', 'https://login.taobao.com/member/login.jhtml?redirectURL=http%3A%2F%2Falizs.taobao.com%2F', '0');
INSERT INTO `website` VALUES ('1319', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-3b96e2c3c51041bcaa625b4c034dfb01.png', '0', '百度互联网数据分享平台', '百度指数', 'private', 'http://index.baidu.com/v2/index.html#/', '0');
INSERT INTO `website` VALUES ('1318', '2020-01-12 23:00:51', null, '0', 'google数据和图表了解全球热度', 'Google趋势', 'private', 'https://trends.google.com/trends/?geo=US', '0');
INSERT INTO `website` VALUES ('1317', '2020-01-12 23:00:51', 'upload/2020\\1\\/57x57-bc7b072116e64910bc71aab6dde6997d.png', '0', '简约强大的极客域名查询购买', 'ZEIT', 'private', 'https://zeit.co/', '0');
INSERT INTO `website` VALUES ('1315', '2020-01-12 23:00:51', 'upload/2020\\1\\/icon16-35d985b759784d388a07f927b1931f33.png', '0', '提供各大服务商域名价格对比', 'Domcomp', 'private', 'https://www.domcomp.com/', '0');
INSERT INTO `website` VALUES ('1316', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-b28a4e2303a24592975e7c515b251ad2.png', '0', '全球首家表情域名注册', 'Emoji域名', 'private', 'https://xn--i-7iq.ws/', '0');
INSERT INTO `website` VALUES ('1314', '2020-01-12 23:00:51', null, '0', '中国最大的域名交易平台', '易名中国', 'private', 'https://www.ename.com/', '1');
INSERT INTO `website` VALUES ('1313', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-fdeaeaa0a26944979d7cf8d910b58185.png', '0', '国外国别后缀最多的域名提供商', 'Gandi', 'private', 'https://www.gandi.net/zh-hans', '0');
INSERT INTO `website` VALUES ('1312', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-22470daea3ca45f39b4f994fc52e393f.png', '0', '强大简洁的域名多后缀搜索', 'Domainr', 'private', 'https://domainr.com/', '0');
INSERT INTO `website` VALUES ('1311', '2020-01-12 23:00:51', 'upload/2020\\1\\couldr_com_-38f15f0e02e2460ca450c722d0196f6b.png', '0', '提供永久的免费域名隐私保护', 'Namesilo', 'private', 'https://www.namesilo.com/', '0');
INSERT INTO `website` VALUES ('1309', '2020-01-12 23:00:51', 'upload/2020\\1\\/apple-icon-57x57-ac705cba74154da98c68af9abd1cac6d.png', '0', '美国老牌全球最大的域名服务商', 'Godaddy', 'private', 'https://sg.godaddy.com/zh', '0');
INSERT INTO `website` VALUES ('1310', '2020-01-12 23:00:51', 'upload/2020\\1\\/favicon-22efce242c0a4974b6470c5853f5b2b7.ico', '0', '优惠比较多的域名品牌商', 'Namecheap', 'private', 'https://www.namecheap.com/', '0');
INSERT INTO `website` VALUES ('1308', '2020-01-12 23:00:51', 'upload/2020\\1\\/TB1_ZXuNcfpK1RjSZFOXXa6nFXa-32-32-24dc57d5c39d4d0e908c56258f3c5944.ico', '0', '中国域名主流服务提供商', '阿里万网', 'private', 'https://wanwang.aliyun.com/', '0');
INSERT INTO `website` VALUES ('1307', '2020-01-12 22:57:32', 'upload/2020\\1\\/production-c620d3e403342b1022967ba5e3db1aaa-25f748d3ddc24d54bbebd17b0a93d009.ico', '0', '日文的开发者技能分享，知识交流社区', 'Qiita', 'private', 'https://qiita.com/', '0');
INSERT INTO `website` VALUES ('1305', '2020-01-12 22:57:32', null, '0', '在线编辑、分享JavaScript代码社区', 'RunJS', 'private', 'https://runjs.cn/', '0');
INSERT INTO `website` VALUES ('1306', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-94323eb303ed4717b45537a872aa8dfa.png', '0', '武汉光谷互联网IT社区', '光谷社区', 'private', 'http://www.guanggoo.com/', '0');
INSERT INTO `website` VALUES ('1304', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-6df3174f78e54d418066c133aed0294a.png', '0', 'web前端开发资源库', 'awesomes', 'private', 'https://www.awesomes.cn/', '0');
INSERT INTO `website` VALUES ('1303', '2020-01-12 22:57:32', null, '0', '开发者交流分享社区', 'Coding冒泡', 'private', 'https://coding.net/pp', '0');
INSERT INTO `website` VALUES ('1301', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-6200a4759942579bd403b10460911e7576be30b6ac3d88b6454a2a2544be70b5-b43d667095c24d7a99c6d2f0c1f72bcd.ico', '0', '致力于构建开发工程师社区', 'DiyCode', 'private', 'https://www.diycode.cc/', '0');
INSERT INTO `website` VALUES ('1300', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-b962998ea510461fbc8a6bab05bf4d06.png', '0', 'PHP和Laravel开发者社区', 'LaravelChina', 'private', 'https://learnku.com/laravel', '0');
INSERT INTO `website` VALUES ('1298', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-58b898f095444806bb54c6b4e53b56d3.png', '0', '目前国内最大的开源技术社区', '开源中国', 'private', 'https://www.oschina.net/', '0');
INSERT INTO `website` VALUES ('1299', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-554bf79762644f009caaf0f6ec63fb39.png', '0', '高质量的技术社区', '掘金', 'private', 'https://juejin.im/', '0');
INSERT INTO `website` VALUES ('1297', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-a32a52a106034273bad5a636eb1c18ab.png', '0', '面向开源及私有软件项目的托管平台', 'Github', 'private', 'https://github.com/', '0');
INSERT INTO `website` VALUES ('1296', '2020-01-12 22:57:32', null, '0', 'HackerNews黑客极客社区', 'HackerNews', 'private', 'https://news.ycombinator.com/', '0');
INSERT INTO `website` VALUES ('1294', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-45952e1cbdf04133bd44e275eb1c3ae3.png', '0', '全球专业的程序员IT技术问答社区', 'Stackoverflow', 'private', 'https://stackoverflow.com/', '0');
INSERT INTO `website` VALUES ('1295', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-11365c8b3a684f59a5e2cf033d82eac2.png', '0', '全球著名的前端图标字体库', 'Fontawesome', 'private', 'https://fontawesome.com/', '0');
INSERT INTO `website` VALUES ('1293', '2020-01-12 22:57:32', 'upload/2020\\1\\/cnode_icon_32-64159f07873d4493bb4a576a954a8e8b.png', '0', 'js专业中文社区', 'cnode', 'private', 'https://cnodejs.org/', '0');
INSERT INTO `website` VALUES ('1291', '2020-01-12 22:57:32', 'upload/2020\\1\\/apple-touch-icon-a0a7c18653e142d58987d4982032a006.png', '0', '优秀的CSS前端技术分享博客', 'CSS-Tricks', 'private', 'https://css-tricks.com/', '1');
INSERT INTO `website` VALUES ('1292', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-b986abc6fc79473bb1b376083d0d50cf.png', '0', 'IT创意工作者社区', 'V2EX', 'private', 'https://www.v2ex.com/', '1');
INSERT INTO `website` VALUES ('1290', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-584d0d9ad0df4765bc8011a64f2ef6e3.png', '0', 'web网站技术调查报告', 'w3techs', 'private', 'https://w3techs.com/', '0');
INSERT INTO `website` VALUES ('1289', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-eaf727de62f04535bff8a31eaac74907.png', '0', '编程教育而设计的微电脑', '树莓派', 'private', 'https://www.raspberrypi.org/', '0');
INSERT INTO `website` VALUES ('1287', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-4901ec6e03b44e958d9296dc064f323b.png', '0', 'HTML5的web浏览技术图谱', 'html5 Platform', 'private', 'https://platform.html5.org/', '0');
INSERT INTO `website` VALUES ('1288', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-420f3497131f4a1cb5e15304bc0b8444.png', '0', '为开发者设计的一套免费开源图标库', '草莓图标', 'private', 'http://chuangzaoshi.com/icon/', '0');
INSERT INTO `website` VALUES ('1286', '2020-01-12 22:57:32', null, '0', '在线CSS前端代码Demo样式效果', 'CSSDeck', 'private', 'http://cssdeck.com/', '0');
INSERT INTO `website` VALUES ('1285', '2020-01-12 22:57:32', null, '0', '特殊符号大全表', 'copypastecharacter', 'private', 'https://www.copypastecharacter.com/', '0');
INSERT INTO `website` VALUES ('1284', '2020-01-12 22:57:32', 'upload/2020\\1\\/dc6dd9c05d2d594b9fd0310ca1982f35-a78afe47c9a94f8baa4210e2e7030622.png', '0', '提供HMTL的特殊符号', 'htmlarrows', 'private', 'https://www.toptal.com/designers/htmlarrows/', '0');
INSERT INTO `website` VALUES ('1282', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-592dd1f80b9f4799a4c2d50be9380b0e.png', '0', '采集有趣的网站UI代码片段', 'codemyui', 'private', 'https://codemyui.com/', '1');
INSERT INTO `website` VALUES ('1280', '2020-01-12 22:57:32', null, '0', 'SVG动效的JS库', 'SnapSVG', 'private', 'http://snapsvg.io/', '0');
INSERT INTO `website` VALUES ('1281', '2020-01-12 22:57:32', null, '0', '在线实时JS测试编程', 'Jsfiddle', 'private', 'https://jsfiddle.net/', '0');
INSERT INTO `website` VALUES ('1279', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-74248cee8f334e5eb267825f8177e595.png', '0', '微信官方小程序UI样式库', 'WEUI', 'private', 'https://weui.io/', '0');
INSERT INTO `website` VALUES ('1278', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-1172fb2efe2040a19ecb3b50f8ddcf08.png', '0', '力荐：精品编程教程技术大牛博客', '廖雪峰', 'private', 'https://www.liaoxuefeng.com/', '0');
INSERT INTO `website` VALUES ('1276', '2020-01-12 22:57:32', null, '0', '每天一条JS小知识点', 'Jstips', 'private', 'http://www.jstips.co/', '0');
INSERT INTO `website` VALUES ('1277', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-468a98a8f14e4cad92e89c6a8f427555.ico', '0', '国外程序编程直播平台', 'LiveEdu', 'private', 'https://www.education-ecosystem.com/', '0');
INSERT INTO `website` VALUES ('1275', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-fc31c84d98ca4f36ae3a8f392a3a97ba.ico', '0', '适用于初级的免费游戏式编程教学', 'CODE', 'private', 'https://code.org/', '0');
INSERT INTO `website` VALUES ('1274', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-deb86ae82ebc457f805f6ec4cfa07b70.png', '0', '著名的非营利在线教育网站', '可汗学院', 'private', 'https://www.khanacademy.org/', '0');
INSERT INTO `website` VALUES ('1273', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-f94f08cdcd354e0d8a5128c1380b3e2e.png', '0', '发布Web标准有关的最新以及高品质信息', 'webplatform', 'private', 'https://webplatform.github.io/', '0');
INSERT INTO `website` VALUES ('1272', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-2475a9582c614b479403dcb44030b3e0.png', '0', '开发者网络(MDN)提供有关开放网络技术', 'mozilla开发者', 'private', 'https://developer.mozilla.org/zh-CN/', '0');
INSERT INTO `website` VALUES ('1271', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-c73e2e9ebe5c4bd39f8f439c257f805e.ico', '0', '传授硅谷的名企官方课程', 'udacity', 'private', 'https://cn.udacity.com/', '0');
INSERT INTO `website` VALUES ('1269', '2020-01-12 22:57:32', null, '0', '非常棒的免费的CSS属性指导手册', 'CSS Reference', 'private', 'https://cssreference.io/', '0');
INSERT INTO `website` VALUES ('1270', '2020-01-12 22:57:32', null, '0', '在线趣味互动模式编程学习平台', 'CodeCademy', 'private', 'https://www.codecademy.com/', '0');
INSERT INTO `website` VALUES ('1268', '2020-01-12 22:57:32', 'upload/2020\\1\\/logo-16-red-570f70c76eb74804807202e2847878c4.png', '0', '编程入门学习及技术文档查询网站', 'w3school中文', 'private', 'https://www.w3school.com.cn/', '0');
INSERT INTO `website` VALUES ('1267', '2020-01-12 22:57:32', null, '0', '一款很棒的编程学习APP', 'Mimo APP', 'private', 'https://getmimo.com/', '0');
INSERT INTO `website` VALUES ('1265', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-2c6b1b9c47c544a6b2e1bf83e50e072c.png', '0', 'facebook出品新型包管理器', 'Yarn', 'private', 'https://yarnpkg.com/zh-Hans/', '0');
INSERT INTO `website` VALUES ('1266', '2020-01-12 22:57:32', 'upload/2020\\1\\/safari-pinned-tab-3f2613c405494224b701f95ff9894fc9.svg', '0', 'facebook出品新型包管理器', 'Animista', 'private', 'http://animista.net/', '0');
INSERT INTO `website` VALUES ('1264', '2020-01-12 22:57:32', 'upload/2020\\1\\/apple-touch-icon-6cfa3a814e8e4035bcd68605db63eff8.png', '0', '用于前端开发的开源工具包', 'Bootstrap', 'private', 'https://getbootstrap.com/', '0');
INSERT INTO `website` VALUES ('1263', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-05976e3df6de4c2884c6dbee05710fb8.png', '0', '客户端技术的软件包管理器', 'Bower', 'private', 'https://bower.io/', '0');
INSERT INTO `website` VALUES ('1261', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-3eeb7ce2ac874202a7c03b46d69303ca.png', '0', 'CSS各种对象样式和效果在线生成', 'CSSgenerator', 'private', 'https://cssgenerator.org/', '0');
INSERT INTO `website` VALUES ('1262', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-e569b38417ae4f6f8347f26c4ea6a10c.png', '0', 'CSS3动效预设收藏集合', 'AniCollection', 'private', 'https://anicollection.github.io/', '0');
INSERT INTO `website` VALUES ('1260', '2020-01-12 22:57:32', null, '0', '前端炫酷样式技能效果', 'codepen', 'private', 'https://codepen.io/', '0');
INSERT INTO `website` VALUES ('1259', '2020-01-12 22:57:32', 'upload/2020\\1\\/avatar_864c49f49415_128-8cfb1cdf551540dba2950598036822ba.pnj', '0', 'CSS/JS炫酷前端动效', 'Navnav', 'private', 'https://navnav.co/', '0');
INSERT INTO `website` VALUES ('1257', '2020-01-12 22:57:32', null, '0', '一款强大的预设css3动画库', 'AnimateCss', 'private', 'https://daneden.github.io/animate.css/', '0');
INSERT INTO `website` VALUES ('1256', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-79b933dce9ce4253a4407205c019aeb8.png', '0', 'font-face网页字体文件格式转换', 'Everythingfonts', 'private', 'https://everythingfonts.com/font-face', '0');
INSERT INTO `website` VALUES ('1255', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-ece866abfff24ab9893f8216d0bdeb84.ico', '0', '将字体转成网页webfont专用字体', 'FontConverter', 'private', 'http://www.freefontconverter.com/', '0');
INSERT INTO `website` VALUES ('1254', '2020-01-12 22:57:32', null, '0', 'CSS贝塞尔动画在线调试工具', 'Ceaser', 'private', 'https://matthewlein.com/tools/ceaser', '0');
INSERT INTO `website` VALUES ('1253', '2020-01-12 22:57:32', null, '0', 'CSS3贝塞尔曲线在线调试工具', 'CubicBezier', 'private', 'https://cubic-bezier.com/#.17,.67,.83,.67', '0');
INSERT INTO `website` VALUES ('1251', '2020-01-12 22:57:32', 'upload/2020\\1\\/safari-pinned-tab-2bbb2153da4c45bf98f44519f36fcf35.svg', '0', 'CSS动态效果样式在线自定义', 'Animista', 'private', 'http://animista.net/', '0');
INSERT INTO `website` VALUES ('1252', '2020-01-12 22:57:32', null, '0', '先进的CSS3可视化在线编程', 'EnjoyCSS', 'private', 'https://enjoycss.com/LnM/4/code/#transform', '0');
INSERT INTO `website` VALUES ('1250', '2020-01-12 22:57:32', null, '0', '一个超棒的CSS属性排序工具', 'CSScomb', 'private', 'https://park.zunmi.cn/?acct=1223&site=csscomb.com', '0');
INSERT INTO `website` VALUES ('1249', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-c91126ffbc9e436d8eebcf676d47ca48.png', '0', '一款简单前端在线编辑器', 'Dabblet', 'private', 'http://dabblet.com/', '0');
INSERT INTO `website` VALUES ('1248', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-7b2d658f36714720a1b17cf6bf31cfac.ico', '0', 'CSS按钮样式在线生成', 'CSS按钮生成', 'private', 'http://www.cssbuttongenerator.com/', '0');
INSERT INTO `website` VALUES ('1246', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-ed801dd88c062243f5e43cb5f8fced0a080ad854030ada505303e144c104f04b-e29504655bfa45f2a40d410862a7e1c9.ico', '0', '模拟生成JSON数据', 'json-generator', 'private', 'http://jsongenerator.com/', '0');
INSERT INTO `website` VALUES ('1247', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-9663d14687a947b99ce41143152d2d7b.png', '0', 'JS和CSS的代码片段在线调试', 'Jsbin', 'private', 'http://jsbin.com/', '0');
INSERT INTO `website` VALUES ('1245', '2020-01-12 22:57:32', null, '0', 'css三角形样式在线生成', 'CSS triangle', 'private', 'http://apps.eky.hk/css-triangle-generator/', '0');
INSERT INTO `website` VALUES ('1243', '2020-01-12 22:57:32', null, '0', '在线实时编程预览', 'CodeCast', 'private', 'http://codecast.me/launch/', '0');
INSERT INTO `website` VALUES ('1244', '2020-01-12 22:57:32', null, '0', '在线实时JS测试编程', 'Jsfiddle', 'private', 'https://jsfiddle.net/', '0');
INSERT INTO `website` VALUES ('1242', '2020-01-12 22:57:32', 'upload/2020\\1\\/58a19602036db1daee0d7863c94673a4-f92ba3bff9414e4ab05e68706bca518c.png', '0', 'JS管理包及强大的构建工具', 'Npmjs', 'private', 'https://www.npmjs.com/', '0');
INSERT INTO `website` VALUES ('1240', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-2412a5433c62426db27be1b832522d62.png', '0', '前端构建脚手架', 'Yeoman', 'private', 'https://yeoman.io/', '0');
INSERT INTO `website` VALUES ('1241', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-231699172ca446c69f767c12c01d5b28.png', '0', '模块加载器兼打包工具', 'webpack', 'private', 'https://webpack.github.io/', '0');
INSERT INTO `website` VALUES ('1232', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-a38bf12018874a2f8c2f3994ac745257.png', '0', '开放源代码软件开发平台和仓库', 'Sourceforge', 'private', 'https://sourceforge.net/', '0');
INSERT INTO `website` VALUES ('1231', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-5db8a73792fd40f4bde3cb3f4ce726c2.png', '0', '采用Mercurial和Git的分布式版本控制', 'Bitbucket', 'private', 'https://bitbucket.org/', '0');
INSERT INTO `website` VALUES ('1230', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-8caee2438ae64c059a0a10cfcbcbf12f.ico', '0', '免费无限制的开源及私有项目托管', 'gitlab', 'private', 'https://about.gitlab.com/', '0');
INSERT INTO `website` VALUES ('1229', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-98d942c9a8514dc788aff83f127c74a9.png', '0', '全球知名的开源及私有项目托管平台', 'Github', 'private', 'https://github.com/', '0');
INSERT INTO `website` VALUES ('1227', '2020-01-12 22:57:32', null, '0', 'Node.js构建的开源博客平台', 'Ghost', 'private', 'https://ghost.org/', '0');
INSERT INTO `website` VALUES ('1228', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-1d649953e6f146eea795609ef8344ac8.png', '0', '免费的响应式商业化建站方案', 'Wix', 'private', 'https://zh.wix.com/', '0');
INSERT INTO `website` VALUES ('1226', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-ba67206134d74661a39d5fe677ee3960.png', '0', '简单静态网页博客程序', 'Jekyll', 'private', 'https://jekyllrb.com/', '0');
INSERT INTO `website` VALUES ('1224', '2020-01-12 22:57:32', null, '0', '轻量级博客程序', 'Typecho', 'private', 'http://typecho.org/', '0');
INSERT INTO `website` VALUES ('1225', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-4abfba44eb60485d9135dbe7c5210946.png', '0', 'Github旗下免费的无限流量博客', 'Gitpage', 'private', 'https://pages.github.com/', '0');
INSERT INTO `website` VALUES ('1223', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-66a8332f70b54a8da273ca6d0275ed8a.png', '0', '比较极客的简洁轻便的博文平台', 'Hexo', 'private', 'https://hexo.io/', '0');
INSERT INTO `website` VALUES ('1222', '2020-01-12 22:57:32', null, '0', '优雅简洁漂亮的轻论坛系统', 'Flarum', 'private', 'https://flarum.org/', '0');
INSERT INTO `website` VALUES ('1220', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-aeab7704b5cc41bd9c6c99a803befe02.png', '0', 'Java 开发的博客系统', 'Halo', 'private', 'https://github.com/halo-dev/halo', '0');
INSERT INTO `website` VALUES ('1221', '2020-01-12 22:57:32', null, '0', '功能强大的内容管理系统', 'Wordpress', 'private', 'https://wordpress.org/', '0');
INSERT INTO `website` VALUES ('1219', '2020-01-12 22:57:32', 'upload/2020\\1\\/iview-design-favicon-050b722e4fa34d3dbbe41c696e0d271c.ico', '0', '一套基于 Vue.js 的高质量 UI 组件库', 'iView', 'private', 'https://www.iviewui.com/', '0');
INSERT INTO `website` VALUES ('1218', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-ae633ea2a7014ad9acd31d740e38f496.png', '0', '腾讯旗下团队 web UI解决方案', 'QMUIweb', 'private', 'https://qmuiteam.com/web/page/index.html', '0');
INSERT INTO `website` VALUES ('1216', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-0e9696acae224e6e9ad48773c30d6618.png', '0', '基于Vue和 Weui的移动端框架', 'vux', 'private', 'https://vux.li/', '0');
INSERT INTO `website` VALUES ('1217', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-00b7ebafc02849c5ae914cf247f135a3.png', '0', '腾讯旗下团队 IOS UI解决方案', 'QMUIios', 'private', 'https://qmuiteam.com/ios', '0');
INSERT INTO `website` VALUES ('1215', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-9dd12612578043aeac154968479540be.png', '0', '面向前后端程序员的模块化前端框架', 'layui', 'private', 'https://www.layui.com/', '0');
INSERT INTO `website` VALUES ('1214', '2020-01-12 22:57:32', null, '0', '轻量级的Material Design前端框架', 'MDUI', 'private', 'https://www.mdui.org/docs/', '0');
INSERT INTO `website` VALUES ('1213', '2020-01-12 22:57:32', null, '0', '轻量灵活的移动端 CSS 框架', 'Mobi.css', 'private', 'http://getmobicss.com/', '0');
INSERT INTO `website` VALUES ('1212', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-bc048f4be0a4443eb023008c5ecf9d60.png', '0', '各大平台浏览器兼容性在线测试', 'Browser Sandbox', 'private', 'https://turbo.net/browsers', '0');
INSERT INTO `website` VALUES ('1210', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-a6c2267a092241bdb84b1eafab8b4118.png', '0', 'W3C的CSS有效性验证', 'CSS validator', 'private', 'https://jigsaw.w3.org/css-validator/', '0');
INSERT INTO `website` VALUES ('1209', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-6e202124645d4f3a88a3c002b9a81489.ico', '0', 'W3C的HTML有效性验证', 'HTML validator', 'private', 'https://validator.w3.org/', '0');
INSERT INTO `website` VALUES ('1207', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-fd83e4b2993848eb9f1cdc7950efe637.png', '0', '网站在线性能测试分析、优化建议', 'Gtmetrix', 'private', 'https://gtmetrix.com/', '0');
INSERT INTO `website` VALUES ('1208', '2020-01-12 22:57:32', null, '0', 'Google在线性能测试网站、优化建议', 'PageSpeed', 'private', 'https://developers.google.com/speed', '0');
INSERT INTO `website` VALUES ('1205', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-21e37dcaffe74b789b9f65c20487eb12.png', '0', '免费强大的HTTP调试抓包代理软件', 'Fiddler', 'private', 'https://www.telerik.com/fiddler', '0');
INSERT INTO `website` VALUES ('1206', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-8501a5e42a514884962b43fa577fba6c.png', '0', '一款强大的网页HTTP数据分析软件', 'HttpWatch', 'private', 'https://www.httpwatch.com/', '0');
INSERT INTO `website` VALUES ('1203', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-d58c889a57b349b28d3b811a27faa918.png', '0', '应用最广泛的商业Linux系统', 'Redhat', 'private', 'https://www.redhat.com/en', '0');
INSERT INTO `website` VALUES ('1204', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-ec9e895913fd4fa28edba2c987356408.png', '0', 'Redhat内核开源免费的linux系统', 'Centos', 'private', 'https://www.centos.org/', '0');
INSERT INTO `website` VALUES ('1189', '2020-01-12 22:57:32', null, '0', '扁平化多彩风格UI', 'Flat UI', 'private', 'https://designmodo.github.io/Flat-UI/', '0');
INSERT INTO `website` VALUES ('1190', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-0cb9307a94a84aa8a580c7e8390092c1.png', '0', '轻型响应式CSS框架', 'Pure', 'private', 'https://purecss.io/', '0');
INSERT INTO `website` VALUES ('1191', '2020-01-12 22:57:32', null, '0', '语义化设计的前端开源框架', 'Semantic UI', 'private', 'https://semantic-ui.com/', '0');
INSERT INTO `website` VALUES ('1192', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-c53e15b6804e4813b92aeb78ebf7cf64.png', '0', '饿了么出品基于Vue2.0前端组件库', 'Element', 'private', 'https://element.eleme.io/#/zh-CN', '0');
INSERT INTO `website` VALUES ('1193', '2020-01-12 22:57:32', 'upload/2020\\1\\/rlpTLlbMzTNYuZGGCVYM-d9101396f95b468faad017f3b4c0a7ce.png', '0', '蚂蚁金服的UI设计语言', 'AntDesign', 'private', 'https://ant.design/index-cn', '0');
INSERT INTO `website` VALUES ('1194', '2020-01-12 22:57:32', 'upload/2020\\1\\/apple-touch-icon-precomposed-9b79d5e5483d4ef8a96ee3701f42dd4c.png', '0', 'Bootstrap中文爱好者网站', 'Bootcss', 'private', 'https://www.bootcss.com/', '0');
INSERT INTO `website` VALUES ('1195', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-da41817b416b4128a6530f69ba040929.ico', '0', 'CSS一种动态样式预处理语言', 'Less', 'private', 'http://lesscss.org/', '0');
INSERT INTO `website` VALUES ('1196', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-f2d07120d2bb7f0d4a63810011903d75-8622a5f11c7644979a98b6a86dde6053.png', '0', 'Web应用程序开发的MVC框架', 'Emberjs', 'private', 'https://emberjs.com/', '0');
INSERT INTO `website` VALUES ('1197', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-ee36e103d8084207b1ee247c90d67fd2.png', '0', 'javaScript客户端框架', 'Aurelia', 'private', 'https://aurelia.io/', '0');
INSERT INTO `website` VALUES ('1198', '2020-01-12 22:57:32', 'upload/2020\\1\\/apple-touch-icon-1f2032d992e04408b91c760c3bc64098.png', '0', '一套简洁优雅的PHP Web开发框架', 'Laravel', 'private', 'https://laravel.com/', '0');
INSERT INTO `website` VALUES ('1199', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-cbb152258c8742c8875341042527cd07.png', '0', 'Google跨平台(iOS和Android)原生应用UI框架', 'Flutter', 'private', 'https://flutter.dev/', '0');
INSERT INTO `website` VALUES ('1200', '2020-01-12 22:57:32', 'upload/2020\\1\\/icon-storybook-da7d653ab2874a90a55bd156b957b55c.png', '0', '优雅的前端组件开发库', 'StoryBook', 'private', 'https://storybook.js.org/', '0');
INSERT INTO `website` VALUES ('1201', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-bde345ea3b894b4a95638c0435bd30c2.ico', '0', '以桌面应用为主的开源Linux操作系统', 'ubuntu', 'private', 'https://cn.ubuntu.com/', '0');
INSERT INTO `website` VALUES ('1202', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-a712186cc2f64f3ba7009f125d65a572.png', '0', '最遵GNU规范的开源Linux系统', 'Debian', 'private', 'https://www.debian.org/', '0');
INSERT INTO `website` VALUES ('1187', '2020-01-12 22:57:32', 'upload/2020\\1\\/android-desktop-95839df0f71b45289c54a0ef5451ef18.png', '0', 'Google官方轻量级MaterialDesignLite版', 'MaterialDesignLite', 'private', 'https://getmdl.io/', '0');
INSERT INTO `website` VALUES ('1188', '2020-01-12 22:57:32', null, '0', 'Google官方MaterialDesign指南', 'MaterialDesign', 'private', 'https://material.io/design/', '0');
INSERT INTO `website` VALUES ('1185', '2020-01-12 22:57:32', 'upload/2020\\1\\/apple-icon-57x57-f6d39ea3fc094fa290862528f0ba46d6.png', '0', '小巧精致,渐进式JavaScript 框架', 'Vuejs', 'private', 'https://cn.vuejs.org/', '0');
INSERT INTO `website` VALUES ('1186', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-0e5f8c863c3347d190c13ea1c1e8d7ec.png', '0', '世界级强大的专业CSS扩展语言', 'Sass', 'private', 'https://sass-lang.com/', '0');
INSERT INTO `website` VALUES ('1173', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e4f43fed6f034fbb8d082e2b48663799.png', '0', '国内UI设计垂直社区', 'UI中国', 'private', 'https://www.ui.cn/', '0');
INSERT INTO `website` VALUES ('1174', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-521bfd9280ab4e4698033b99f6eaea5c.png', '0', '游戏类UI设计师作品展示与交流平台', 'Game UI', 'private', 'http://www.gameui.cn/', '0');
INSERT INTO `website` VALUES ('1175', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-3dbad0b51a904e02b5278dd7ca49d0ef.png', '0', '原画、插画、CG交流社区', 'CG部落', 'private', 'http://www.cgbolo.com/', '0');
INSERT INTO `website` VALUES ('1176', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-8aa7ede0863d47b99471c9164b53c525.png', '0', '中国字体品牌设计师交流网', '字体传奇网', 'private', 'http://www.ziticq.com/', '0');
INSERT INTO `website` VALUES ('1177', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-dca57d67a40f43c7a46c038d39d816de.png', '0', '国内工业设计师交流展示平台', '普象网', 'private', 'https://www.puxiang.com/', '0');
INSERT INTO `website` VALUES ('1178', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-342b650311d24c8f8ea7de9c26fb217c.ico', '0', '在线技能学习社区', 'Skillshare', 'private', 'https://www.skillshare.com/', '0');
INSERT INTO `website` VALUES ('1179', '2020-01-12 22:48:47', 'upload/2020\\1\\/gracg_favicon-7d4bf4c27af840f68e8c7b5eb75e9a51.ico', '0', '国内原创绘画社交网站', '涂鸦王国', 'private', 'https://gracg.com/', '0');
INSERT INTO `website` VALUES ('1180', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-522fb38f5fbc4e4d9807d6c693c5a8d9.png', '0', 'facebook强大的JavaScript框架', 'React', 'private', 'https://reactjs.org/', '0');
INSERT INTO `website` VALUES ('1181', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-9bed281cf3bf4d879ef77c92906a72be.png', '0', 'Google开发的前端技术框架', 'Angularjs', 'private', 'https://angularjs.org/', '0');
INSERT INTO `website` VALUES ('1182', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-b103485cfc6b466eaf08b31555436c59.ico', '0', '一个快速、简洁的JavaScript框架', 'Jquery', 'private', 'https://jquery.com/', '0');
INSERT INTO `website` VALUES ('1183', '2020-01-12 22:57:32', 'upload/2020\\1\\/foundation-favicon-8cbb9083a43341219aad26931dfc1656.ico', '0', '高级响应式前端框架', 'Foundation', 'private', 'https://foundation.zurb.com/', '0');
INSERT INTO `website` VALUES ('1184', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-70a3c3b2b08a47559eae0d5d91b4c30e.png', '0', '一组反应元件，实现谷歌的材料设计', 'Material UI', 'private', 'https://material.io/design/', '0');
INSERT INTO `website` VALUES ('1172', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-0f503949a0e24d22b67f7506e31845a0.png', '0', 'WEB设计开发杂志博客', 'Smashing', 'private', 'https://www.smashingmagazine.com/', '0');
INSERT INTO `website` VALUES ('1170', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-9c156dd6ab82429aaddaaf00b8e1d10d.png', '0', '话题非常广的设计师FM播客', '异能电台', 'private', 'https://www.yineng.fm/', '0');
INSERT INTO `website` VALUES ('1171', '2020-01-12 22:48:47', null, '0', '卡通角色插画设计教程(YouTube频道)', 'Gigantic', 'private', 'https://www.youtube.com/channel/UCX4mqbvv5lGqLpI4FYlJt4w/videos', '0');
INSERT INTO `website` VALUES ('1168', '2020-01-12 22:48:47', 'upload/2020\\1\\/cropped-favicon-32x32-21d7dba259194afc9634e541db629396.png', '0', '网页设计教程和文章学习平台', 'webdesignerdepot', 'private', 'https://www.webdesignerdepot.com/', '0');
INSERT INTO `website` VALUES ('1169', '2020-01-12 22:48:47', 'upload/2020\\1\\/icon-29eb15a4850742c09e89a5698ef73b35.ico', '0', '专注于Text文字特效教程收录', 'Textuts', 'private', 'https://textuts.com/', '0');
INSERT INTO `website` VALUES ('1156', '2020-01-12 22:48:47', 'upload/2020\\1\\/fav-0b9b92b7b1294a428532d147e08529bb.png', '0', '在视觉和界面领域比较有名的工作者', 'Tubik Studio', 'private', 'https://tubikstudio.com/', '0');
INSERT INTO `website` VALUES ('1157', '2020-01-12 22:48:47', null, '0', 'Facebook设计团队网站', 'Facebook Design', 'private', 'https://facebook.design/', '0');
INSERT INTO `website` VALUES ('1158', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-814d803865b14718b181f385351cd15c.ico', '0', '创新型用户体验设计公司', '大邦创新', 'private', 'http://www.bigbang-consulting.com/', '0');
INSERT INTO `website` VALUES ('1159', '2020-01-12 22:48:47', null, '0', '国外精美的设计文章欣赏', 'Medium', 'private', 'https://medium.design/', '0');
INSERT INTO `website` VALUES ('1160', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-88278a4493734732a6b83e52cbce9d21.png', '0', 'sketch中国资源插件分享社区', 'sketchchina', 'private', 'http://www.sketchchina.com/', '0');
INSERT INTO `website` VALUES ('1161', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-669e7b9fc37f40baa11952ecc4b59a84.png', '0', '设计经验、历程杂谈的一款播客节目', 'AnywayFM', 'private', 'https://anyway.fm/', '0');
INSERT INTO `website` VALUES ('1162', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-2a69638e473c455e8a9291d375cba43d.png', '0', '国内设计师教程分享文章', '优设', 'private', 'https://www.uisdc.com/', '0');
INSERT INTO `website` VALUES ('1163', '2020-01-12 22:48:47', null, '0', 'Envato时尚设计效果教程', 'Envato教程', 'private', 'https://design.tutsplus.com/tutorials', '0');
INSERT INTO `website` VALUES ('1164', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon_16-caa307bef982426ba40509456d512c30.png', '0', '关注产品设计和注用户体验FM播客', 'UX Coffee', 'private', 'https://uxcoffee.com/', '0');
INSERT INTO `website` VALUES ('1165', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-bbcde392678542a99fa0292cdffe35eb.png', '0', '华语字体排印主题FM播客节目', '字谈字畅', 'private', 'https://www.lizhi.fm/user/14363280', '0');
INSERT INTO `website` VALUES ('1166', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-401b954ee48e4e10bb45bd1fddc134e6.png', '0', 'JJYing的界面设计个人博客', '图月志', 'private', 'http://iconmoon.com/blog2/', '0');
INSERT INTO `website` VALUES ('1167', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-a0ded976202f4303a09b30b115de5981.png', '0', '设计师和前端开发者的美文收录', 'Heydesigner', 'private', 'https://heydesigner.com/', '0');
INSERT INTO `website` VALUES ('1155', '2020-01-12 22:48:47', null, '0', '京东设计中心', 'JDC', 'private', 'https://jdc.jd.com/', '0');
INSERT INTO `website` VALUES ('1153', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e293c5c4c04e43e2a4fcbe109f71d07b.png', '0', '腾讯游戏官方设计团队', 'Tgideas', 'private', 'https://tgideas.qq.com/', '0');
INSERT INTO `website` VALUES ('1154', '2020-01-12 22:48:47', 'upload/2020\\1\\/upload_a9da7b78fab8eb652fa327c428f676b0-4834f93d3b0c4ee5809b9662e0e8930d.ico', '0', '360UXC用户体验设计中心', '360UXC', 'private', 'http://uxc.360.cn/', '0');
INSERT INTO `website` VALUES ('1151', '2020-01-12 22:48:47', null, '0', '百度用户体验中心', '百度MUX', 'private', 'http://eux.baidu.com/', '0');
INSERT INTO `website` VALUES ('1152', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-1406197f7291498c9dea84f3081c4c96.png', '0', '网易用户体验设计中心', 'udec', 'private', 'http://gux.163.com/	udec', '0');
INSERT INTO `website` VALUES ('1149', '2020-01-12 22:48:47', null, '0', '百度企业产品用户中心', '百度EUX', 'private', 'http://eux.baidu.com/', '0');
INSERT INTO `website` VALUES ('1150', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-a595b1b278914745b1b174c89f5cb512.png', '0', '网易游戏用户体验中心', '网易GUX', 'private', 'http://gux.163.com/', '0');
INSERT INTO `website` VALUES ('1138', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-f6e5d234d2874fc592b85b328aed4fb4.png', '0', '在线免费创建简单logo及名片设计', 'Logaster', 'private', 'https://www.logaster.cn/', '0');
INSERT INTO `website` VALUES ('1139', '2020-01-12 22:48:47', 'upload/2020\\1\\/icons8_fav_16×16-dc7b81cbedb84a5789610b51c0734de9.png', '0', 'Loading加载动画在线制作', 'Preloaders', 'private', 'https://icons8.com/preloaders/', '0');
INSERT INTO `website` VALUES ('1140', '2020-01-12 22:48:47', 'upload/2020\\1\\/clipping-magic-apple-icon_1ec18ad5baa5a28e56f00ae987aac501-dc78f0a242044fbf987f187896d764e7.png', '0', '在线抠图工具', 'ClippingMagic', 'private', 'https://clippingmagic.com/', '0');
INSERT INTO `website` VALUES ('1141', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-8801acb53bbb47f7a1fb54b47154d241.ico', '0', 'Google在线优化压缩图片(支持webp)', 'Squoosh', 'private', 'https://squoosh.app/', '0');
INSERT INTO `website` VALUES ('1142', '2020-01-12 22:48:47', 'upload/2020\\1\\/icon512-cf7c59262f8e4983b7fedbea77de35d8.png', '0', '在线打开PSD丨Sketch丨Gimp编辑器', 'Photopea', 'private', 'https://www.photopea.com/', '0');
INSERT INTO `website` VALUES ('1143', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-8718860a3fb84fee85daab2eff86396c.png', '0', '阿里人工智能电商Banner广告图制作', '鹿班', 'private', 'https://luban.aliyun.com/', '0');
INSERT INTO `website` VALUES ('1144', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-f151bd80630f44d4bca4a7164b61a664.ico', '0', '国内专业界设计团队', 'eicodesign', 'private', 'http://eicoinc.com/', '0');
INSERT INTO `website` VALUES ('1145', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-981c77c6ff9b4d418580ec95041370da.svg', '0', '社交用户体验设计', '腾讯ISUX', 'private', 'https://isux.tencent.com/', '0');
INSERT INTO `website` VALUES ('1146', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-2ef5f3bcc15a44ee8dc75b89ec190ccc.png', '0', '腾讯用户研究与体验设计中心', '腾讯CDC', 'private', 'https://cdc.tencent.com/', '0');
INSERT INTO `website` VALUES ('1147', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-5bff337a733e36a7bcfcdedd44f454a2-1c334347a40d426fbd72c47945d47c66.ico', '0', '阿里妈妈MUX', '阿里妈妈MUX', 'private', 'https://mux.alimama.com/', '0');
INSERT INTO `website` VALUES ('1148', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-2698e7b0cc874361ac2152adae410224.png', '0', '跨国设计与战略咨询公司', 'Frog设计', 'private', 'https://www.frogdesign.cn/', '0');
INSERT INTO `website` VALUES ('1137', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-7bc4b8f3347041a88730da558ef7c82e.ico', '0', '制作GIF丨SVG丨CSS加载动画图标', 'Loading', 'private', 'https://loading.io/', '0');
INSERT INTO `website` VALUES ('1135', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-b8133f74986d4a9483324c6fc7192542.png', '0', '谷歌绘画智能匹配相应图形[需翻墙]', 'Autodraw', 'private', 'https://www.autodraw.com/', '0');
INSERT INTO `website` VALUES ('1136', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-57x57-4dae160231ec493dbbbd6c5ded091b03.png', '0', '网页网格栅格化工具', 'Grid', 'private', 'http://grid.guide/', '0');
INSERT INTO `website` VALUES ('1122', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-f22fac03a3b248bb9ce7cb2aac6f543a.ico', '0', 'JPG图片压缩工具', 'Jpegmini', 'private', 'https://www.jpegmini.com/', '0');
INSERT INTO `website` VALUES ('1123', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-b26bd9a085ab4b3297d4595d4ec00d4a.png', '0', '专注于PDF格式互转、压缩等功能', 'Smallpdf', 'private', 'https://smallpdf.com/cn', '0');
INSERT INTO `website` VALUES ('1124', '2020-01-12 22:48:47', 'upload/2020\\1\\/cropped-favicon-32x32-0acdbd55b94a4a0a816b37d728c67cc8.png', '0', '根据条件匹配在线生成Logo', 'Logojoy', 'private', 'https://looka.com/logo-maker/', '0');
INSERT INTO `website` VALUES ('1125', '2020-01-12 22:48:47', null, '0', '贝塞尔曲线练习', 'Bezier Game', 'private', 'https://bezier.method.ac/', '0');
INSERT INTO `website` VALUES ('1126', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon3-4569377571c94324acfa300d64ab094e.ico', '0', '汇集众多常用PDF在线工具', 'PDFcandy', 'private', 'https://pdfcandy.com/', '0');
INSERT INTO `website` VALUES ('1127', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-92d1f30ec63542b2a3f72761e18b6f8f.png', '0', '国外创建二维码在线应用', 'Qrhacker', 'private', 'https://www.qrhacker.com/', '0');
INSERT INTO `website` VALUES ('1128', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-0f62df4d66244317a5c570b9e77769b8.ico', '0', '国内创建二维码在线应用', '草料二维码', 'private', 'https://cli.im/', '0');
INSERT INTO `website` VALUES ('1129', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-0cdba2328ada457e93582c88433ab133.png', '0', '支持JPEG和PNG格式在线压缩', 'optimizilla', 'private', 'https://imagecompressor.com/', '0');
INSERT INTO `website` VALUES ('1130', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-4bd4eae96b8c4c78bf2daa0dba025b80.png', '0', '图片智能算法无损放大', 'waifu2x', 'private', 'http://waifu2x.udp.jp/', '0');
INSERT INTO `website` VALUES ('1131', '2020-01-12 22:48:47', null, '0', '收费！非常强大的位图转矢量图', 'VectorMagic', 'private', 'https://vectormagic.com/', '0');
INSERT INTO `website` VALUES ('1132', '2020-01-12 22:48:47', null, '0', '图标长投影在线生成', 'FlattyShadow', 'private', 'http://ww7.flattyshadow.com/', '0');
INSERT INTO `website` VALUES ('1133', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-073f0b5d3d76436fa419f31b16fdf1ae.png', '0', '炫酷对称艺术纹理特效绘制', 'WeaveSilk', 'private', 'http://weavesilk.com/', '0');
INSERT INTO `website` VALUES ('1134', '2020-01-12 22:48:47', null, '0', '台湾一家二维码在线制作和APP程序', 'QuickMark', 'private', 'http://www.quickmark.com.tw/cht/qrcode-datamatrix-generator/?qrLink', '0');
INSERT INTO `website` VALUES ('1120', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-5adea9380aed4bfaa300187a2fed6cb4.png', '0', '中文上传图片字体查找', 'qiuziti', 'private', 'http://www.qiuziti.com/', '0');
INSERT INTO `website` VALUES ('1121', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-f86b7a464453424080e3c32309455650.png', '0', '高效易用的自动标注工具', 'PxCook', 'private', 'https://fancynode.com.cn/pxcook', '0');
INSERT INTO `website` VALUES ('1119', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-144x144-f1c0121fede8452c98314cda347077a3.png', '0', '英文上传图片查找字体', 'FindMyfont', 'private', 'https://www.myfonts.com/WhatTheFont/', '0');
INSERT INTO `website` VALUES ('1115', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-49ab4f91bf8e4cb8a5c878557384ec8f.png', '0', '微软Modern官方设计语言', 'Modern设计', 'private', 'https://www.microsoft.com/design', '0');
INSERT INTO `website` VALUES ('1116', '2020-01-12 22:48:47', 'upload/2020\\1\\/logo_flat_32-b382a20900684bf887da1abf406aa2e3.png', '0', '云端在线图片格式转换', 'CloudConvert', 'private', 'https://cloudconvert.org/', '0');
INSERT INTO `website` VALUES ('1117', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-b2d6da902e904fc6a0b487ec4eeab529.png', '0', '2019年设计师必备设计神器', '摹客iDoc', 'private', 'https://www.mockplus.cn/idoc', '0');
INSERT INTO `website` VALUES ('1118', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-85223789d2ca47589f5be9c8e1e40ebb.ico', '0', '超完美PNG压缩工具', 'TinyPng', 'private', 'https://tinypng.com/', '0');
INSERT INTO `website` VALUES ('1114', '2020-01-12 22:48:47', null, '0', 'MaterialDesign设计官方指南', 'Material设计', 'private', 'https://material.io/', '0');
INSERT INTO `website` VALUES ('1113', '2020-01-12 22:48:47', null, '0', '移动屏幕尺寸规范', 'Screensiz', 'private', 'http://screensiz.es/phone', '0');
INSERT INTO `website` VALUES ('1095', '2020-01-12 22:48:47', null, '0', '炫酷多边形背景色块生成', 'Trianglify', 'private', 'https://trianglify.io/about', '0');
INSERT INTO `website` VALUES ('1096', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-27f60c9bf04045afb360109a54026b7a.png', '0', '全球设计师色彩分享交流社区', 'ColourLovers', 'private', 'https://www.colourlovers.com/', '0');
INSERT INTO `website` VALUES ('1097', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-81a12b26f485404587ed91232e3ab7dc.ico', '0', '通过网址获取分析网站配色', 'WebColourData', 'private', 'http://webcolourdata.com/', '0');
INSERT INTO `website` VALUES ('1098', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-fb949d1371dd4410a5bf11f3b99ca754.png', '0', '中科院色谱的中国传统色', '中国传统色', 'private', 'http://zhongguose.com/', '0');
INSERT INTO `website` VALUES ('1099', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-ef73096c902345f2b55973be8b85d592.png', '0', '色彩搜索引擎', 'Picular', 'private', 'https://picular.co/flower', '0');
INSERT INTO `website` VALUES ('1100', '2020-01-12 22:48:47', null, '0', '免费英文字体下载库', 'Fontsup', 'private', 'https://fontsup.com/', '0');
INSERT INTO `website` VALUES ('1101', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-796e7f2053dd4d75a3958c762eb6829c.png', '0', '详细分类免费字体搜索下载库', 'Fonts2u', 'private', 'https://zh.fonts2u.com/', '0');
INSERT INTO `website` VALUES ('1102', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-144x144-ccf6a23dbf9f494dacbca3069500b3ed.png', '0', '最新时尚的商业英文字体', 'MyFont', 'private', 'https://www.myfonts.com/', '0');
INSERT INTO `website` VALUES ('1103', '2020-01-12 22:48:47', null, '0', '免费英文字体搜索下载站', 'Urbanfonts', 'private', 'https://www.urbanfonts.com/', '0');
INSERT INTO `website` VALUES ('1104', '2020-01-12 22:48:47', null, '0', '苹果最新的系统界面字体San Francisco', '苹方字体', 'private', 'https://developer.apple.com/fonts/', '0');
INSERT INTO `website` VALUES ('1105', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-9ea4ce9d9d604249866ef608bfd33c51.png', '0', 'Adobe、Google出品的开源中文黑体', '思源黑体', 'private', 'https://fonts.adobe.com/fonts/source-han-sans-simplified-chinese', '0');
INSERT INTO `website` VALUES ('1106', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-78807237fdc4433182e236cfe9c04805.png', '0', '免费手写可爱字体官网下载', 'Comicneue', 'private', 'http://comicneue.com/', '0');
INSERT INTO `website` VALUES ('1107', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-806c080e043843c29c720bdcd1b95d9d.png', '0', 'Adobe出品的web在线字库', 'Typekit', 'private', 'https://fonts.adobe.com/', '0');
INSERT INTO `website` VALUES ('1108', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-32681a5d35b349eea6885bbd5638f18b.png', '0', 'Adobe、Google出品的开源中文宋体', '思源宋体', 'private', 'https://source.typekit.com/source-han-serif/', '0');
INSERT INTO `website` VALUES ('1109', '2020-01-12 22:48:47', 'upload/2020\\1\\/t014de4ba13ada26743-9a955e338ea944d8a6b87ab2368ffbf4.png', '0', '查版权，免纠纷', '360查字体', 'private', 'https://fonts.safe.360.cn/', '0');
INSERT INTO `website` VALUES ('1110', '2020-01-12 22:48:47', null, '0', '安卓官方设计指南', 'Android设计', 'private', 'https://developer.android.com/design/index.html', '0');
INSERT INTO `website` VALUES ('1111', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-2257772ebe474cac9ac0250337bb76d5.png', '0', 'Google安卓主流设备尺寸', '安卓尺寸', 'private', 'https://material.io/resources/devices/', '0');
INSERT INTO `website` VALUES ('1112', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-55c77208d7b54897abcb6a3cfb647f77.png', '0', '苹果官方设计指南', 'Apple设计', 'private', 'https://developer.apple.com/design/', '0');
INSERT INTO `website` VALUES ('1094', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-57x57-de585588b5e6472cbe0c08e0f6e83a3e.png', '0', 'itmeo旗下180个漂亮渐变色模板', 'webgradients', 'private', 'https://webgradients.com/', '0');
INSERT INTO `website` VALUES ('1092', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-32x32-c7531a9b16df47f9a98f5a85fcbe4323.png', '0', '简洁舒服的渐变配色', 'UIgradients', 'private', 'https://uigradients.com/#Stripe', '0');
INSERT INTO `website` VALUES ('1093', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-194de522705d2d8afb93874e197fa6f14188290aaf3625007bf4774933901cc1-e50aa83205874f3f95cdf2a76d72a9ec.ico', '0', 'MaterialDesign强大的在线配色', 'MD调色器', 'private', 'https://www.materialpalette.com/indigo/blue', '0');
INSERT INTO `website` VALUES ('1091', '2020-01-12 22:48:47', 'upload/2020\\1\\/5bfd1275cc56e1e12950b249_icon_small-69dfd0a956fa4d63987fea0599220d99.png', '0', '流行的网格渐变背景免费下载', 'Mesh Gradients', 'private', 'https://www.ls.graphics/meshgradients', '0');
INSERT INTO `website` VALUES ('1086', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-da2c934340f948af82bb06d927d6ed2a.png', '0', 'Adobe专业配色工具', 'AdobeColor', 'private', 'https://color.adobe.com/', '0');
INSERT INTO `website` VALUES ('1087', '2020-01-12 22:48:47', null, '0', '日本古典传统配色网站', 'Nipponcolors', 'private', 'http://nipponcolors.com/', '0');
INSERT INTO `website` VALUES ('1088', '2020-01-12 22:48:47', 'upload/2020\\1\\/heart-5b3b9d48bc2b452793267b82b575cde8.png', '0', '上传并匹配提取图片风格的颜色', 'Colorfavs', 'private', 'http://www.colorfavs.com/', '0');
INSERT INTO `website` VALUES ('1089', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-84d5c5f15e124f85b69a1dd985fd38fa.png', '0', '在线快速配色生成工具', 'Coolors', 'private', 'https://coolors.co/', '0');
INSERT INTO `website` VALUES ('1090', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-4eb94e62f1bf43dcb1cff0567ac1e3e5.gif', '0', '每天更新一组简洁舒服的配色方案', 'Colorhunt', 'private', 'http://www.colorhunt.co/', '0');
INSERT INTO `website` VALUES ('1084', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-065b07d67e454c86a5dbee89e0c22fc6.ico', '0', '每周免版权高清图片分享', 'Stocksnap', 'private', 'https://stocksnap.io/', '0');
INSERT INTO `website` VALUES ('1085', '2020-01-12 22:48:47', null, '0', '站酷海洛创意收费正版图库', 'Hellorf', 'private', 'https://www.hellorf.com/', '0');
INSERT INTO `website` VALUES ('1082', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-2c2bef18bc1a46bfbde78a5de8463340.png', '0', '免费的高清图片、矢量图片、艺术插花', 'Pixabay', 'private', 'https://pixabay.com/', '0');
INSERT INTO `website` VALUES ('1083', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-74f2b7962dfc4f3db40463e0b42aff10.png', '0', '日式照片素材免费分享站点', 'Pakutaso', 'private', 'https://www.pakutaso.com/', '0');
INSERT INTO `website` VALUES ('1080', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-2d75d9a3694442d981c102ef2c713bb7.png', '0', '全球著名摄影师图片展示和售卖平台', '500px', 'private', 'https://web.500px.com/', '0');
INSERT INTO `website` VALUES ('1081', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-4594801d6ea443a1a071a9d2b26bd3ab.png', '0', '专注于免费食品图片素材的分享', 'FoodiesFeed', 'private', 'https://www.foodiesfeed.com/', '0');
INSERT INTO `website` VALUES ('1078', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-8607a14e7fc246a5b9cebd0abb3bada4.ico', '0', '精品免费图库分享', 'Pexels', 'private', 'https://www.pexels.com/', '0');
INSERT INTO `website` VALUES ('1079', '2020-01-12 22:48:47', null, '0', '雅虎旗下摄影师图片分享网站', 'Flickr', 'private', 'https://www.flickr.com/explore', '0');
INSERT INTO `website` VALUES ('1075', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-357b5af452bb4dcd99d8e22c2a37c715.png', '0', '初创公司精品免费图库', 'Startupstockp', 'private', 'https://startupstockphotos.com/', '0');
INSERT INTO `website` VALUES ('1076', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-840ea482c921468e81a1b3132f3eb84a.png', '0', '免费高清灵感图片', 'Magdeleine', 'private', 'https://magdeleine.co/', '0');
INSERT INTO `website` VALUES ('1077', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-c51999c305024df0850537ac968f9c08.png', '0', '免费高清摄影图库', 'Splitshire', 'private', 'https://www.splitshire.com/', '0');
INSERT INTO `website` VALUES ('1074', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-5fe7da561c054fe1b183a5f6cba20926.png', '0', '高质量免费版权的图库素材', 'Unsplash', 'private', 'https://unsplash.com/', '0');
INSERT INTO `website` VALUES ('1072', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-ca8c7cc2c60c47db97df32f961a642a8.png', '0', '国外免费设计素材模板下载站', 'GraphicsFuel', 'private', 'https://www.graphicsfuel.com/', '0');
INSERT INTO `website` VALUES ('1073', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-21e0ab49bcf24416a88659e4548d01e0.png', '0', '聚合各大免费高清图库的APP', 'ZoommyAPP', 'private', 'https://zoommyapp.com/', '0');
INSERT INTO `website` VALUES ('1071', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-2e8be9ca73aa41379d6d82132230421b.ico', '0', '免费高质量设计素材模板分享', 'Pixeden', 'private', 'https://www.pixeden.com/', '0');
INSERT INTO `website` VALUES ('1069', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-fcc709328c474091b5b6102c449d0d3c.ico', '0', '免费矢量素材搜索和下载', 'Vecteezy', 'private', 'https://www.vecteezy.com/', '0');
INSERT INTO `website` VALUES ('1070', '2020-01-12 22:48:47', null, '0', '矢量和CSS网页背景纹理配色生成', 'HeroPatterns', 'private', 'http://www.heropatterns.com/', '0');
INSERT INTO `website` VALUES ('1067', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-65545a630e134cbfb0b88e7e8225e300.png', '0', '海量免费素材共享平台', '素材中国', 'private', 'http://www.sccnn.com/', '0');
INSERT INTO `website` VALUES ('1068', '2020-01-12 22:48:47', null, '0', '随机下拉背景纹理', 'PatternLibrary', 'private', 'http://thepatternlibrary.com/', '0');
INSERT INTO `website` VALUES ('1066', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-60de2dfbad694ab19d13277bfbca0e28.ico', '0', '国内海量平面免费素材下载', '昵图网', 'private', 'http://www.nipic.com/index.html', '0');
INSERT INTO `website` VALUES ('1063', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-6cc95106e22c4ecba99d17150155ace7.png', '0', '对设计和开发有帮助的优质设计资源', 'CSSauthor', 'private', 'https://cssauthor.com/', '0');
INSERT INTO `website` VALUES ('1064', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-b2dc0d6bf9ce4b72887bae6b92719f5e.ico', '0', '高质量Principle原型丨动效设计资源', 'Principlerepo', 'private', 'http://www.principlerepo.com/', '0');
INSERT INTO `website` VALUES ('1065', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-4c50e29ce1a74b189235881ab1a331fe.png', '0', '海量原创设计模板免费下载', '千图网', 'private', 'https://www.58pic.com/', '0');
INSERT INTO `website` VALUES ('1062', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-e93aaf2b7a674591b764dde13909bfc2.gif', '0', '3D建模纹理特效素材', 'Texturer', 'private', 'http://texturer.com/', '0');
INSERT INTO `website` VALUES ('1061', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-4c17b09644934f80aafc803661be8e21.png', '0', '国内不错的Sketch站点资源', 'Sketch.im', 'private', 'https://oursketch.com/', '0');
INSERT INTO `website` VALUES ('1060', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e9e0700daf16490c895878adeb8db6ea.png', '0', 'Dribbble上一些免费的设计PSD源文件', 'Fribbble', 'private', 'https://designwoop.com/free-design-resources?utm_medium=referral&utm_source=fribbble.com&utm_campaign=redirect', '0');
INSERT INTO `website` VALUES ('1057', '2020-01-12 22:48:47', null, '0', '海报模板输出设计', 'Canva', 'private', 'https://www.canva.com/', '0');
INSERT INTO `website` VALUES ('1058', '2020-01-12 22:48:47', null, '0', '主题森林-全球UI作品出售平台', 'Themeforest', 'private', 'https://themeforest.net/', '0');
INSERT INTO `website` VALUES ('1059', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-15a7e399f67a409cb0842633177798bd.ico', '0', '漂亮的商业UI模板售卖平台', 'UI8', 'private', 'https://ui8.net/', '0');
INSERT INTO `website` VALUES ('1056', '2020-01-12 22:48:47', 'upload/2020\\1\\/GRAPHIC-TWISTER-32c4970711064f318336065bb3a27c12.png', '0', '平面海报、设备场景模板下载', 'Graphictwister', 'private', 'https://graphictwister.com/', '0');
INSERT INTO `website` VALUES ('1055', '2020-01-12 22:48:47', null, '0', '智能设备场景模板下载', 'Dunnnk', 'private', 'http://dunnnk.com/', '0');
INSERT INTO `website` VALUES ('1054', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-fc16e43d39f14e4a93525c5a80e2470e.png', '0', '收费高质量的专业mockup模板', 'Mockup', 'private', 'https://mockup.zone/', '0');
INSERT INTO `website` VALUES ('1052', '2020-01-12 22:48:47', 'upload/2020\\1\\/dc6dd9c05d2d594b9fd0310ca1982f35-9bf5beb0f02443abb340d54138fc0a57.png', '0', '简洁大气的背景纹理素材', 'Subtlepatterns', 'private', 'https://www.toptal.com/designers/subtlepatterns/', '0');
INSERT INTO `website` VALUES ('1053', '2020-01-12 22:48:47', null, '0', 'Firmbee精品设备和场景mockup素材', 'Firmbee', 'private', 'https://firmbee.com/', '0');
INSERT INTO `website` VALUES ('1050', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-7da5351ec2ab458f85dcd2addb825cda.png', '0', '免费高质量矢量图下载', 'Freepik', 'private', 'https://www.freepik.com/', '0');
INSERT INTO `website` VALUES ('1051', '2020-01-12 22:48:47', null, '0', '免版权小人场景矢量插画素材', 'manypixels', 'private', 'https://www.manypixels.co/gallery/', '0');
INSERT INTO `website` VALUES ('1049', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-8b5bb3d4613a4978ba6c3ced80369fd8.png', '0', '免费优质的图标库', 'Nucleo', 'private', 'https://nucleoapp.com/', '0');
INSERT INTO `website` VALUES ('1048', '2020-01-12 22:48:47', 'upload/2020\\1\\/5cbff95f3e4dd15d79936458_favicon-543b39f72f39421eb4107eaa102ec118.png', '0', '一套界面中的图标动态效果包', 'Flight icon', 'private', 'https://www.flighticon.co/', '0');
INSERT INTO `website` VALUES ('1047', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-f77fe8c3f18d44ba8923ed3d3a318e7e.png', '0', '一套微型的图标动态效果库', 'UseAnimations', 'private', 'https://useanimations.com/', '0');
INSERT INTO `website` VALUES ('1044', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-7bce1eacdfbe41f185ae9889c0095194.png', '0', '为开发者设计的一套免费开源图标库', '草莓图标', 'private', 'http://chuangzaoshi.com/icon/', '0');
INSERT INTO `website` VALUES ('1045', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-81dfc2ec0e124465a6ba607146cc9964.png', '0', '完全可定制和使用的矢量图标库', 'Ikonate', 'private', 'https://ikonate.com/', '0');
INSERT INTO `website` VALUES ('1046', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-66649f92e51945cdaca8111e6db89177.png', '0', '帮设计师只管检查logo的工具', 'logolab', 'private', 'https://logolab.app/home', '0');
INSERT INTO `website` VALUES ('1043', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-d0ffe184161d44a6b963b88243443faa.png', '0', 'iOS系统应用图标收集和分享', 'iconsfeed', 'private', 'http://www.iconsfeed.com/', '0');
INSERT INTO `website` VALUES ('1040', '2020-01-12 22:48:47', 'upload/2020\\1\\/ios-favicon-a53108ad0cbf4d97a3a150e315319276.ico', '0', 'IOS平台APP图标收录和欣赏', 'IOSicongallery', 'private', 'https://www.iosicongallery.com/', '0');
INSERT INTO `website` VALUES ('1041', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-32x32-8b576f385481477da8bbb0282fce21c0.png', '0', 'Emoji表情图标整理', 'Emojione', 'private', 'https://www.joypixels.com/demo/', '0');
INSERT INTO `website` VALUES ('1042', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-f4ccee493b1345d49836e5172b1e87f6.ico', '0', '海量图标搜索可生成css sprites', 'iconninja', 'private', 'https://www.iconninja.com/', '0');
INSERT INTO `website` VALUES ('1039', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-495bc046da344c479fea38858bc96eb2.png', '0', '各大国际品牌logo矢量图', 'Logoeps', 'private', 'https://logoeps.com/', '0');
INSERT INTO `website` VALUES ('1038', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-2a0e1abda00849fa8e2090a399d0a584.ico', '0', '免费商用的高质量图标素材站', 'iconstore', 'private', 'https://iconstore.co/', '0');
INSERT INTO `website` VALUES ('1036', '2020-01-12 22:48:47', null, '0', '特赞！提供开源免费的LOGO', 'Logodust', 'private', 'https://logodust.com/', '0');
INSERT INTO `website` VALUES ('1037', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-bf8098ee31f8406c91ff4147b3695eac.png', '0', '海量扁平化免费的图标库', 'Flaticon', 'private', 'https://www.flaticon.com/', '0');
INSERT INTO `website` VALUES ('1034', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-e1cf147692294fed9391d3b7c4f3b489.ico', '0', '精美免费简洁icon', 'iconmonstr', 'private', 'https://iconmonstr.com/', '0');
INSERT INTO `website` VALUES ('1035', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-8478543515314d848098c279a20c8efc.png', '0', '国外LOGO展示社区', 'Logopond', 'private', 'https://logopond.com/', '0');
INSERT INTO `website` VALUES ('1031', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon.7fb1143e988e-386cf4d61deb4b5f9fa40f257f7e9f93.png', '0', '高质量图标下载', 'TheNounProject', 'private', 'https://thenounproject.com/', '0');
INSERT INTO `website` VALUES ('1032', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-ac8cfeb12e684ca1a8154e4f550bf3d4.png', '0', '高质量付费图标下载', 'iconfinder', 'private', 'https://www.iconfinder.com/', '0');
INSERT INTO `website` VALUES ('1033', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-5cb8ee502f1c470896a1ae5d61e3fc2a.png', '0', '一套免费特色iconfont图标支持WP插件', 'themify', 'private', 'https://themify.me/themify-icons', '0');
INSERT INTO `website` VALUES ('1030', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-faff74493b98405c933b3f540e96b30c.png', '0', '图标搜索大全', 'Easyicon', 'private', 'https://www.easyicon.net/', '0');
INSERT INTO `website` VALUES ('1026', '2020-01-12 22:48:47', null, '0', '可爱的UI手机界面设计搜集', 'lovelyUI', 'private', 'https://www.lovelyui.com/', '0');
INSERT INTO `website` VALUES ('1027', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-1fdcf09f7df44edca75e6d92518a3fa8.png', '0', '矢量图打包成图标字体的技术平台', 'icomoon', 'private', 'https://icomoon.io/', '0');
INSERT INTO `website` VALUES ('1028', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-6681ab9828d2433b87a15e0af5435cdc.png', '0', '免费优质的图标库', 'Nucleo', 'private', 'https://nucleoapp.com/', '0');
INSERT INTO `website` VALUES ('1029', '2020-01-12 22:48:47', 'upload/2020\\1\\/TB1_oz6GVXXXXaFXpXXJDFnIXXX-64-64-3e6a71154b2844cfad697b58991d107d.ico', '0', '阿里团队图标字体及图标素材下', 'iconfont', 'private', 'https://www.iconfont.cn/plus', '0');
INSERT INTO `website` VALUES ('1024', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-c5be0a15498a4ff1b8310015f521e783.png', '0', '优秀网页设计展示平台', 'SiteinSpire', 'private', 'https://www.siteinspire.com/', '0');
INSERT INTO `website` VALUES ('1025', '2020-01-12 22:48:47', null, '0', '界面交互响应设计收录网站', 'UseYourlnterface', 'private', 'http://ww1.useyourinterface.com/', '0');
INSERT INTO `website` VALUES ('1022', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-148168eaa2cc4fa2b8956d591181affc.png', '0', '丰富的日式响应式设计收录站点', 'webdesignclip', 'private', 'https://www.webdesignclip.com/', '0');
INSERT INTO `website` VALUES ('1023', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-472376e48a714227aa4a0d879c0f6163.png', '0', '优秀CSS网站界面和交互设计获奖', 'CSSwinner', 'private', 'https://www.csswinner.com/', '0');
INSERT INTO `website` VALUES ('1020', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-d71a8e0424c345afb56a388ba43bd3af.png', '0', '漂亮的酷站收集展示', 'BestWebsite', 'private', 'https://bestwebsite.gallery/', '0');
INSERT INTO `website` VALUES ('1021', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-dc284264163d4de0843ac783752c408f.ico', '0', '日式风格设计网页收录展示', 'Straightline', 'private', 'http://bm.straightline.jp/', '0');
INSERT INTO `website` VALUES ('1019', '2020-01-12 22:48:47', 'upload/2020\\1\\/favi-64-12544c52d80e46a6aaf0223472ab6031.ico', '0', '收录漂亮的界面设计网站', 'sitesee', 'private', 'https://sitesee.co/', '0');
INSERT INTO `website` VALUES ('1016', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-4b7805c23fb84bd2999ea7cf996addf0.ico', '0', '收集优秀UI组件元素设计的站点', 'Calltoidea', 'private', 'https://www.calltoidea.com/', '0');
INSERT INTO `website` VALUES ('1017', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-71d8ea933b7a47a998df192107999a1d.png', '0', '日本漂亮的酷站收集[需翻墙]', 'muuuuu', 'private', 'https://muuuuu.org/', '0');
INSERT INTO `website` VALUES ('1018', '2020-01-12 22:48:47', null, '0', '收集科幻电影场景里UI交互界面', 'Noteloop', 'private', 'https://www.noteloop.com/kit/fui/', '0');
INSERT INTO `website` VALUES ('1014', '2020-01-12 22:48:47', 'upload/2020\\1\\/LogoNew-1-2b484ae4cd6f475d846a383583127e8b.jpg', '0', 'UI灵感收集聚合站点', 'Uigarage', 'private', 'https://uigarage.net/', '0');
INSERT INTO `website` VALUES ('1015', '2020-01-12 22:48:47', 'upload/2020\\1\\/avatar_21babec3285d_128-4990fe1a65874fc7bcfc6abaf427504d.pnj', '0', '设计细节动效灵感分享网站', 'littlebigdetails', 'private', 'https://littlebigdetails.com/', '0');
INSERT INTO `website` VALUES ('1008', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-57x57-2ca80527f9e6418a86ae363d351f60a5.png', '0', '专业收集APP截图的网站', 'Pttrns', 'private', 'https://pttrns.com/', '0');
INSERT INTO `website` VALUES ('1009', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-02a81bbcf0b8422e950d1e7c34c722b2.ico', '0', '设计师灵感设计案例作品的站点', 'collectUI', 'private', 'http://collectui.com/', '0');
INSERT INTO `website` VALUES ('1010', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-a7daf015756b4dea9405eef70c4c138c.ico', '0', '采集前端作品设计、iOS UI设计', 'uplabs', 'private', 'https://www.uplabs.com/', '0');
INSERT INTO `website` VALUES ('1011', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-94845fbb6476489bbdd47029ffb0afb9.png', '0', '网站和APP单页界面欣赏', 'OnePageLove', 'private', 'https://onepagelove.com/', '0');
INSERT INTO `website` VALUES ('1012', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-1f98db1e7d704386bf9f2b3a9574e427.png', '0', '为精美及创意的设计UI颁奖站点', 'Awwwards', 'private', 'https://www.awwwards.com/', '0');
INSERT INTO `website` VALUES ('1013', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-7e4e1f0f8d2b4d6d873c3b3f70bee45d.png', '0', '高质量设计网站、资源聚合站点', 'Freebiesbug', 'private', 'https://freebiesbug.com/', '0');
INSERT INTO `website` VALUES ('1005', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-53c9440e08a04a168b7cbc0da0557ed6.png', '0', '优秀APP交互动效收集', 'Elasticode', 'private', 'http://www.elasticode.com/', '0');
INSERT INTO `website` VALUES ('1006', '2020-01-12 22:48:47', 'upload/2020\\1\\/4db-791ed134821e4bec9d391020f8c4759b.ico', '0', '日本网页设计风格展', '4DB', 'private', 'http://4db.cc/', '0');
INSERT INTO `website` VALUES ('1007', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-0c4ccf4c3d284363a5434505da42af17.ico', '0', 'MG动态效果展示', 'Freshdesign', 'private', 'https://freshdesign.io/', '0');
INSERT INTO `website` VALUES ('1004', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-d2e05924c01f4b37ae1d55c873d23f59.ico', '0', '移动界面UI动效展示', 'Uimovement', 'private', 'https://uimovement.com/', '0');
INSERT INTO `website` VALUES ('1003', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-edb897a10bbe43ec8eff4f94ffa0b303.ico', '0', '全球最火热的酷站画廊', 'Reeoo', 'private', 'http://reeoo.com/', '0');
INSERT INTO `website` VALUES ('1000', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-1b42eb0984d64b67b4e41e553a9c267e.png', '0', '工业设计资讯及项目展示', 'Core77', 'private', 'https://www.core77.com/', '0');
INSERT INTO `website` VALUES ('1001', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e8413ee9ade5488498e3b6fa6e8341cb.png', '0', '欧美创意资讯汇总', 'NOTCOT', 'private', 'http://www.notcot.org/', '1');
INSERT INTO `website` VALUES ('1002', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-a55ae28ede9149f890e2ebb4d3bc4168.png', '0', '日本新鲜设计资讯', 'JDN', 'private', 'https://www.japandesign.ne.jp/', '1');
INSERT INTO `website` VALUES ('999', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e727ac325e004f7ab63d8f73cc3b651f.png', '0', '世界各地设计文化创意新鲜事', 'The World\'s Best Ever', 'private', 'http://theworldsbestever.com/', '0');
INSERT INTO `website` VALUES ('996', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-944f7105a0424dff995f92f7aa97253e.png', '0', '发现有趣的设计生活', '设计癖', 'private', 'http://www.shejipi.com/', '0');
INSERT INTO `website` VALUES ('997', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-57x57-98f75d8699784a1f85d03e3388028b79.png', '0', '众多领域服务设计案例', 'SDN', 'private', 'https://www.service-design-network.org/', '0');
INSERT INTO `website` VALUES ('995', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-3b5aaa4ee40e40afa1db758a55d9bbea.ico', '0', '设计师也感兴趣的技术文章', '凹凸实验室', 'private', 'https://aotu.io/', '0');
INSERT INTO `website` VALUES ('992', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-5cfe4da7601f48a68e4b8fb61fd59b11.png', '0', '全球优秀CSS网页设计奖提名网', 'CSS设计奖', 'private', 'https://www.cssdesignawards.com/', '0');
INSERT INTO `website` VALUES ('990', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-68215fec14624cedbddfa0b0bada7ca7.png', '0', '精挑细选的美站收集', 'Land-book', 'private', 'https://land-book.com/', '0');
INSERT INTO `website` VALUES ('991', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-7d2485f417c54876a1c8955726f5e814.png', '0', '台湾灵感创意视觉资讯收集网', '淘靈感', 'private', 'https://www.mydesy.com/', '0');
INSERT INTO `website` VALUES ('986', '2020-01-12 22:48:47', null, '0', '分享各类艺术创作的设计社区', 'Deviantart', 'private', 'https://www.deviantart.com/', '0');
INSERT INTO `website` VALUES ('994', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-touch-icon-8b569c73044045f4b5f81feac48abeb4.png', '0', '创意工作者网络社区和资讯', 'Ello', 'private', 'https://ello.co/', '0');
INSERT INTO `website` VALUES ('993', '2020-01-12 22:48:47', null, '0', '创意灵感收录集合', 'SpirationGrid', 'private', 'https://theinspirationgrid.com/', '0');
INSERT INTO `website` VALUES ('989', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-b4d0b10d59db47ab8715bd800fa402a5.png', '0', '产品丨界面丨插画灵感设计画廊', 'Bestfolios', 'private', 'https://www.bestfolios.com/home', '0');
INSERT INTO `website` VALUES ('988', '2020-01-12 22:48:47', 'upload/2020\\1\\/apple-icon-57x57-d91b16c60dec4f278b7344c41fbe6564.png', '0', '创意灵感和教程的设计博客', 'abduzeedo', 'private', 'https://abduzeedo.com/', '0');
INSERT INTO `website` VALUES ('987', '2020-01-12 22:48:47', null, '0', '365天每天推荐一个设计师作品', '365designers', 'private', 'http://365awesomedesigners.com/', '0');
INSERT INTO `website` VALUES ('985', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-dad5dcb1b00640169d73d072e84f418c.png', '0', '创意媒体艺术设计作品展', 'FWA', 'private', 'https://thefwa.com/', '0');
INSERT INTO `website` VALUES ('983', '2020-01-12 22:48:47', null, '0', '视频分享平台创意动画频道[需要翻墙]', 'Vimeo动画', 'private', 'https://vimeo.com/categories/animation', '0');
INSERT INTO `website` VALUES ('984', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-eb5ef6d1866a46f289f7577624632d7c.ico', '0', '视觉创意和艺术爱好者网站', 'MyModernMet', 'private', 'https://mymodernmet.com/', '0');
INSERT INTO `website` VALUES ('982', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-b4dc3774e1594c6eb247221316916e9b.png', '0', '全球最极致3D设计模型在线展示平台', 'Sketchfab', 'private', 'https://sketchfab.com/', '1');
INSERT INTO `website` VALUES ('981', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-857dd343e1ce4082821dbcad18388bb0.png', '0', '法国每日新鲜创意灵感分享', 'Fubiz', 'private', 'http://www.fubiz.net/', '0');
INSERT INTO `website` VALUES ('980', '2020-01-12 22:48:47', null, '0', '优秀LandingPage落地页收集', 'lapa', 'private', 'https://www.lapa.ninja/', '0');
INSERT INTO `website` VALUES ('977', '2020-01-12 22:48:47', 'upload/2020\\1\\/touch-icon-iphone-6a81810f1ffa4e40936570e7affe1ff6.png', '0', '中国美图收藏采集站', '花瓣', 'private', 'http://huaban.com/', '0');
INSERT INTO `website` VALUES ('978', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e2e4c7c04d9e4bca8c60b5b8e8801eef.png', '0', '中国本地化UI设计展示平台', 'UI中国', 'private', 'https://www.ui.cn/', '0');
INSERT INTO `website` VALUES ('979', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-e4f3381531954535ae0ed02c3391b570.png', '0', '国内综合设计展示平台', '站酷', 'private', 'https://www.zcool.com.cn/', '0');
INSERT INTO `website` VALUES ('975', '2020-01-12 22:48:47', null, '0', '球美图收藏采集站', 'Pinterest', 'private', 'https://www.pinterest.com', '0');
INSERT INTO `website` VALUES ('976', '2020-01-12 22:48:47', null, '0', '设计作品和资讯文摘订阅平台', 'Panda', 'private', 'http://usepanda.com/app/', '0');
INSERT INTO `website` VALUES ('974', '2020-01-12 22:48:47', null, '0', 'Adobe旗下设计师创意视觉社区', 'Behance', 'private', 'https://www.behance.net/', '0');
INSERT INTO `website` VALUES ('973', '2020-01-12 22:48:47', 'upload/2020\\1\\/dribbble-vector-ball-95ca193529993e9b3904f7adb541680aba196642f557cfaf3cdbb0a48a284be4-e98d8a8e0c874a6ea6d5abbd8f238aed.svg', '0', '全球UI设计师作品秀社区', 'Dribbble', 'private', 'https://dribbble.com/', '0');
INSERT INTO `website` VALUES ('972', '2020-01-12 22:48:47', 'upload/2020\\1\\couldr_com_-1d87f68b543c4ee1b6ebaa15b28cb981.png', '0', '设计灵感资源聚合', 'Muzli', 'private', 'http://muz.li/', '0');
INSERT INTO `website` VALUES ('971', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-278ba429a5374c778bf4fb13c20524a9.png', '0', '小众服务稳定的网盘', '坚果云', 'private', 'https://www.jianguoyun.com/', '0');
INSERT INTO `website` VALUES ('969', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-37f3045def4846acb1d57424d116c4c5.ico', '0', '国内最大百度旗下网盘服务', '百度网盘', 'private', 'https://pan.baidu.com/disk/home?#/all?path=%2F&vmode=list', '0');
INSERT INTO `website` VALUES ('970', '2020-01-12 22:41:25', null, '0', '腾讯QQ网盘服务', '微云', 'private', 'https://www.weiyun.com/', '0');
INSERT INTO `website` VALUES ('966', '2020-01-12 22:41:25', null, '0', '全球最优秀的在线云存储', 'DropBox', 'private', 'https://www.dropbox.com/', '0');
INSERT INTO `website` VALUES ('967', '2020-01-12 22:41:25', null, '0', 'Google在线云存储服务', 'GoogleDrive', 'private', 'https://www.google.com/intl/zh-CN/drive/', '0');
INSERT INTO `website` VALUES ('968', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-3f6a189d58354cb1be9263e9cd00bcb8.png', '0', '苹果在线存储和云服务', 'iCloud', 'private', 'https://www.icloud.com/', '0');
INSERT INTO `website` VALUES ('929', '2020-01-12 22:41:25', null, '0', '国外的互联网新产品资讯新闻', 'TechCrunch', 'private', 'http://techcrunch.com/', '0');
INSERT INTO `website` VALUES ('930', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-64x64.0-86db33adbde74ff7991091820c93e967.ico', '0', '美国最酷科技媒体', 'The Verge', 'private', 'https://www.theverge.com/', '0');
INSERT INTO `website` VALUES ('931', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-c577138826504edbb3bdaa6abbb5922e.png', '0', '产品经理、产品爱好者学习交流平台', '人人都是产品经理', 'private', 'http://www.woshipm.com/', '0');
INSERT INTO `website` VALUES ('932', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-588d8ec466174579962363945973e209.png', '0', '为创业者提供最好的产品和服务', '36氪', 'private', 'https://36kr.com/', '0');
INSERT INTO `website` VALUES ('933', '2020-01-12 22:41:25', 'upload/2020\\1\\/geekpark-icon-196-03ac430f5643fc17aba3b3f5429a287d-f08a7504d13e42b088fde1d8094cea3b.png', '0', '热点产品的深度分析,发掘产品和趋势的价值', '极客公园', 'private', 'http://www.geekpark.net/', '0');
INSERT INTO `website` VALUES ('934', '2020-01-12 22:41:25', 'upload/2020\\1\\/icon-5fc0060ef4a74746815a20f7e1591b81.ico', '0', '专注于移动APP编辑精选', '少数派', 'private', 'https://sspai.com/', '0');
INSERT INTO `website` VALUES ('935', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-8bbab130fdf347deb341224c265167b4.ico', '0', '科技达人王自如数码产品测评平台', 'zealer', 'private', 'https://www.zealer.com/', '0');
INSERT INTO `website` VALUES ('936', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-fdcec7c595fe495db0f0de125c0d4e24.png', '0', '产品经理的社区和资讯站点', 'PMCAFF', 'private', 'https://coffee.pmcaff.com/', '0');
INSERT INTO `website` VALUES ('937', '2020-01-12 22:41:25', 'upload/2020\\1\\/Appinn-icon-32-16497f770efb49ee85f3384864f14e3e.jpg', '0', '分享免费、小巧、有趣、实用软件的网站', '小众软件', 'private', 'https://www.appinn.com/', '0');
INSERT INTO `website` VALUES ('938', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-4e6261578eb74db0afcee7543afa6f6b.png', '0', '专注于微软产品和技术的资讯博客', 'LiveSino', 'private', 'https://livesino.net/', '0');
INSERT INTO `website` VALUES ('939', '2020-01-12 22:41:25', 'upload/2020\\1\\/ph-ios-icon-e1733530a1bfc41080db8161823f1ef262cdbbc933800c0a2a706f70eb9c277a-c860e051a1cc4dc5a1b601d0ff5ce064.png', '0', '全球最新潮的科技类新品站', 'Producthunt', 'private', 'https://www.producthunt.com/', '0');
INSERT INTO `website` VALUES ('940', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-7b5f10330dfb401ca8c7d703f19f9343.png', '0', '全球最大的综合性数字发行平台', 'Steam', 'private', 'https://store.steampowered.com/', '0');
INSERT INTO `website` VALUES ('965', '2020-01-12 22:41:25', null, '0', '微软云存储，支持在线Offiec编辑', 'OneDrive', 'private', 'https://onedrive.live.com/about/zh-cn/', '0');
INSERT INTO `website` VALUES ('964', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-aa394e8c0d8c4f1cb22ebcfd1177c6de.png', '0', '持多人在线编辑Word、Excel和PPT文档', '腾讯文档', 'private', 'https://docs.qq.com/index.html', '0');
INSERT INTO `website` VALUES ('963', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-50c9dc9f85a74649842d6c3f1a1fa3df.png', '0', '让您的小组和您的工作充满活力', 'Quip', 'private', 'https://quip.com/', '0');
INSERT INTO `website` VALUES ('962', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-5abb8b939fa04028b32b791e6306e3c4.png', '0', '微软Word丨PPT丨Excel等文档办公套装', '微软Office', 'private', 'https://products.office.com/zh-cn/home', '0');
INSERT INTO `website` VALUES ('961', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-f94e6e36134b4235ba04f90de02077a0.png', '0', '支持多人协作的在线文档', '石墨文档', 'private', 'https://shimo.im/welcome', '0');
INSERT INTO `website` VALUES ('960', '2020-01-12 22:41:25', null, '0', 'Google免费在线创建和编辑文档', 'Google文档', 'private', 'https://www.google.com/intl/zh-CN/docs/about/', '0');
INSERT INTO `website` VALUES ('958', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-37e231d99141445588a45eb4e06fdb63.ico', '0', '设计师的产品协作平台', '蓝湖', 'private', 'https://lanhuapp.com/', '0');
INSERT INTO `website` VALUES ('959', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-1487f1ee5f0244e4ac0693f879c79c1a.ico', '0', '集文档丨wiki丨任务的协同创作平台', 'Notion', 'private', 'https://www.notion.so/', '0');
INSERT INTO `website` VALUES ('957', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-0681b72c0f08492c9d2aa614d2647edf.png', '0', '项目进度管理和发布、协同工作平台', 'Trello', 'private', 'https://trello.com/', '0');
INSERT INTO `website` VALUES ('956', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-53fb8df8f5f442d6890a5c499057a9cf.png', '0', '简洁好用的云笔记', '印象笔记', 'private', 'https://www.yinxiang.com/', '0');
INSERT INTO `website` VALUES ('955', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-06e102ca960d4a67a39ea2a99cf505cf.png', '0', '微软强大的云笔记，支持多用户协作', 'Onenote', 'private', 'https://products.office.com/zh-cn/onenote/digital-note-taking-app?rtc=1', '0');
INSERT INTO `website` VALUES ('954', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-fe667f6534b348acb9acf9849f1f8126.png', '0', '国内领先的团队协作工具', 'Teambition', 'private', 'https://www.teambition.com/', '0');
INSERT INTO `website` VALUES ('953', '2020-01-12 22:41:25', null, '0', '在线团队协同办公、项目管理工具', 'Worktile', 'private', 'https://worktile.com/', '0');
INSERT INTO `website` VALUES ('952', '2020-01-12 22:41:25', 'upload/2020\\1\\/cropped-imm11_icon-1-32x32-30ba536bec25481a9182c0644c9ac89a.png', '0', '独特强大可创建3D视角的思维导图', 'iMindmap', 'private', 'https://imindmap.com/zh-cn/', '0');
INSERT INTO `website` VALUES ('951', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-7713b9190dcd4e4482114e397dc63966.ico', '0', '思维导图和PPT融合在一起', 'Novamind', 'private', 'https://www.novamind.com/', '0');
INSERT INTO `website` VALUES ('950', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-932cdd9d71ed44c4975e49cafdff8f05.ico', '0', '简单强大的心智图', 'MindManager', 'private', 'https://www.mindjet.com/', '0');
INSERT INTO `website` VALUES ('949', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-c6a627aa918e470f85b62810f0b4528b.png', '0', '百度便捷的流程图思维工具', '百度脑图', 'private', 'https://naotu.baidu.com/', '0');
INSERT INTO `website` VALUES ('948', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-06567c132b0540098d2e41d312903a51.png', '0', '非常优秀思维导图APP', 'Mindnode', 'private', 'https://mindnode.com/', '0');
INSERT INTO `website` VALUES ('947', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-bfe93be6b88741349552f4aafcfdd4a1.png', '0', '一款非常实用的商业思维导图软件', 'Xmind', 'private', 'https://www.xmind.cn/', '0');
INSERT INTO `website` VALUES ('946', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-1210d5c0709e4d70b7da1fffa279442a.png', '0', '简洁快速的原型图设计工具', 'Mockplus', 'private', 'https://www.mockplus.cn/', '0');
INSERT INTO `website` VALUES ('945', '2020-01-12 22:41:25', null, '0', '专注于UI设计+原型图工具', 'Sketch', 'private', 'http://www.sketchcn.com/', '0');
INSERT INTO `website` VALUES ('944', '2020-01-12 22:41:25', 'upload/2020\\1\\couldr_com_-a475f8128c8b4c1fbd634b1fc70ff685.png', '0', '专业制作移动APP应用原型工具', '墨刀', 'private', 'https://modao.cc/', '0');
INSERT INTO `website` VALUES ('943', '2020-01-12 22:41:25', 'upload/2020\\1\\/favicon-6212db66f4574582953a289c7919caa7.ico', '0', '专业的快速原型设计工具', 'Axure', 'private', 'https://www.axure.com/', '0');
INSERT INTO `website` VALUES ('942', '2020-01-12 22:41:25', 'upload/2020\\1\\/未标题-3-a428beb89fea465b9020a349c3c6f9db.jpg', '0', '一站式搞定PPT设计导航站点', '三顿PPT导航', 'private', 'https://sandunppt.com/', '0');
INSERT INTO `website` VALUES ('1302', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-5876f96335704ced9cf5fe04de24eb47.png', '0', '编程爱好者技术交流的平台', 'Segmentfault', 'private', 'https://segmentfault.com/', '0');
INSERT INTO `website` VALUES ('1283', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-c9ab3552c1a340e9859dd47132898901.png', '0', '网站UI交互源码分享', 'codrops', 'private', 'https://tympanus.net/codrops/', '0');
INSERT INTO `website` VALUES ('1258', '2020-01-12 22:57:32', null, '0', '在线实时编程预览', 'CodeCast', 'private', 'http://codecast.me/', '0');
INSERT INTO `website` VALUES ('1233', '2020-01-12 22:57:32', null, '0', '面向开发者的云端开发托管平台', 'Coding', 'private', 'https://coding.net/', '0');
INSERT INTO `website` VALUES ('1234', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-e87ded4710611ed62adc859698277663-3f4162dbc7e14ac0a526224427451b29.ico', '0', '开源中国代码托管平台', 'Coding', 'private', 'https://gitee.com/', '0');
INSERT INTO `website` VALUES ('1235', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-8ba002db84e14a8bb2a795273e95eab8.png', '0', 'CSDN代码托管平台', 'CODE', 'private', 'https://www.csdn.net/', '0');
INSERT INTO `website` VALUES ('1236', '2020-01-12 22:57:32', null, '0', '阿里云代码托管平台', 'Kelude', 'private', 'https://account.aliyun.com/login/login.htm?from_type=codealiyun&&oauth_callback=http%3A%2F%2Fcode.aliyun.com%2F', '0');
INSERT INTO `website` VALUES ('1237', '2020-01-12 22:57:32', 'upload/2020\\1\\couldr_com_-0c62b906045e4d3f93df85efa85a8f0c.png', '0', '于ChromeV8引擎的JS运行环境', 'Nodejs', 'private', 'https://nodejs.org/en/', '0');
INSERT INTO `website` VALUES ('1238', '2020-01-12 22:57:32', 'upload/2020\\1\\/apple-touch-icon-952d02d3d7ba4ec293a9f1668d5e0d9c.png', '0', 'JavaScript世界的构建工具', 'Grunt', 'private', 'https://gruntjs.com/', '0');
INSERT INTO `website` VALUES ('1239', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-ec4a1dcedc9349fc85d68672400a9d50.png', '0', '基于流的自动化构建工具', 'Gulp', 'private', 'https://gulpjs.com/', '0');
INSERT INTO `website` VALUES ('1211', '2020-01-12 22:57:32', 'upload/2020\\1\\/favicon-fd5a8f23cd02487ab9ae1d0f5cc1e907.ico', '0', '各大尺寸设备响应式屏幕效果显示', 'Responsinator', 'private', 'http://www.responsinator.com/', '0');
INSERT INTO `website` VALUES ('998', '2020-01-12 22:48:47', 'upload/2020\\1\\/favicon-ad2ac7edb1f54843b8ba86c1201de084.ico', '0', '每日新鲜设计资讯', 'Sidebar', 'private', 'https://sidebar.io/', '0');
INSERT INTO `website` VALUES ('941', '2020-01-12 22:41:25', 'upload/2020\\1\\/trochili-fav-192-f67020744ab6408785bc23cbf9217bf2.png', '0', '微信小程序应用商店和大全', '知晓程序', 'private', 'https://minapp.com/miniapp/', '0');

-- ----------------------------
-- Table structure for website_category
-- ----------------------------
DROP TABLE IF EXISTS `website_category`;
CREATE TABLE `website_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `website_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1347 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of website_category
-- ----------------------------
INSERT INTO `website_category` VALUES ('1346', '148', '1406');
INSERT INTO `website_category` VALUES ('1345', '148', '1405');
INSERT INTO `website_category` VALUES ('1344', '148', '1404');
INSERT INTO `website_category` VALUES ('1343', '147', '1403');
INSERT INTO `website_category` VALUES ('1342', '147', '1402');
INSERT INTO `website_category` VALUES ('1341', '147', '1401');
INSERT INTO `website_category` VALUES ('1340', '147', '1400');
INSERT INTO `website_category` VALUES ('1339', '147', '1399');
INSERT INTO `website_category` VALUES ('1338', '147', '1398');
INSERT INTO `website_category` VALUES ('1337', '147', '1397');
INSERT INTO `website_category` VALUES ('1336', '147', '1396');
INSERT INTO `website_category` VALUES ('1335', '146', '1395');
INSERT INTO `website_category` VALUES ('1334', '146', '1394');
INSERT INTO `website_category` VALUES ('1333', '146', '1393');
INSERT INTO `website_category` VALUES ('1332', '146', '1392');
INSERT INTO `website_category` VALUES ('1331', '146', '1391');
INSERT INTO `website_category` VALUES ('1330', '146', '1390');
INSERT INTO `website_category` VALUES ('1329', '146', '1389');
INSERT INTO `website_category` VALUES ('1328', '145', '1388');
INSERT INTO `website_category` VALUES ('1327', '145', '1387');
INSERT INTO `website_category` VALUES ('1326', '145', '1386');
INSERT INTO `website_category` VALUES ('1325', '145', '1385');
INSERT INTO `website_category` VALUES ('1324', '145', '1384');
INSERT INTO `website_category` VALUES ('1323', '145', '1383');
INSERT INTO `website_category` VALUES ('1322', '145', '1382');
INSERT INTO `website_category` VALUES ('1321', '145', '1381');
INSERT INTO `website_category` VALUES ('1320', '145', '1380');
INSERT INTO `website_category` VALUES ('1319', '145', '1379');
INSERT INTO `website_category` VALUES ('1318', '145', '1378');
INSERT INTO `website_category` VALUES ('1317', '145', '1377');
INSERT INTO `website_category` VALUES ('1316', '145', '1376');
INSERT INTO `website_category` VALUES ('1315', '145', '1375');
INSERT INTO `website_category` VALUES ('1314', '145', '1374');
INSERT INTO `website_category` VALUES ('1313', '145', '1373');
INSERT INTO `website_category` VALUES ('1312', '145', '1372');
INSERT INTO `website_category` VALUES ('1311', '144', '1371');
INSERT INTO `website_category` VALUES ('1310', '144', '1370');
INSERT INTO `website_category` VALUES ('1309', '144', '1369');
INSERT INTO `website_category` VALUES ('1308', '144', '1368');
INSERT INTO `website_category` VALUES ('1307', '144', '1367');
INSERT INTO `website_category` VALUES ('1306', '144', '1366');
INSERT INTO `website_category` VALUES ('1305', '144', '1365');
INSERT INTO `website_category` VALUES ('1304', '144', '1364');
INSERT INTO `website_category` VALUES ('1303', '144', '1363');
INSERT INTO `website_category` VALUES ('1302', '144', '1362');
INSERT INTO `website_category` VALUES ('1301', '144', '1361');
INSERT INTO `website_category` VALUES ('1300', '144', '1360');
INSERT INTO `website_category` VALUES ('1299', '143', '1359');
INSERT INTO `website_category` VALUES ('1298', '143', '1358');
INSERT INTO `website_category` VALUES ('1297', '143', '1357');
INSERT INTO `website_category` VALUES ('1296', '143', '1356');
INSERT INTO `website_category` VALUES ('1295', '143', '1355');
INSERT INTO `website_category` VALUES ('1294', '143', '1354');
INSERT INTO `website_category` VALUES ('1293', '142', '1353');
INSERT INTO `website_category` VALUES ('1292', '142', '1352');
INSERT INTO `website_category` VALUES ('1291', '142', '1351');
INSERT INTO `website_category` VALUES ('1290', '142', '1350');
INSERT INTO `website_category` VALUES ('1289', '142', '1349');
INSERT INTO `website_category` VALUES ('1288', '142', '1348');
INSERT INTO `website_category` VALUES ('1287', '141', '1347');
INSERT INTO `website_category` VALUES ('1286', '141', '1346');
INSERT INTO `website_category` VALUES ('1285', '141', '1345');
INSERT INTO `website_category` VALUES ('1284', '141', '1344');
INSERT INTO `website_category` VALUES ('1283', '141', '1343');
INSERT INTO `website_category` VALUES ('1282', '140', '1342');
INSERT INTO `website_category` VALUES ('1281', '140', '1341');
INSERT INTO `website_category` VALUES ('1280', '140', '1340');
INSERT INTO `website_category` VALUES ('1279', '140', '1339');
INSERT INTO `website_category` VALUES ('1278', '140', '1338');
INSERT INTO `website_category` VALUES ('1277', '140', '1337');
INSERT INTO `website_category` VALUES ('1276', '139', '1336');
INSERT INTO `website_category` VALUES ('1275', '139', '1335');
INSERT INTO `website_category` VALUES ('1274', '139', '1334');
INSERT INTO `website_category` VALUES ('1273', '139', '1333');
INSERT INTO `website_category` VALUES ('1272', '139', '1332');
INSERT INTO `website_category` VALUES ('1271', '138', '1331');
INSERT INTO `website_category` VALUES ('1270', '138', '1330');
INSERT INTO `website_category` VALUES ('1269', '138', '1329');
INSERT INTO `website_category` VALUES ('1268', '138', '1328');
INSERT INTO `website_category` VALUES ('1267', '138', '1327');
INSERT INTO `website_category` VALUES ('1266', '137', '1326');
INSERT INTO `website_category` VALUES ('1265', '137', '1325');
INSERT INTO `website_category` VALUES ('1264', '137', '1324');
INSERT INTO `website_category` VALUES ('1263', '137', '1323');
INSERT INTO `website_category` VALUES ('1262', '137', '1322');
INSERT INTO `website_category` VALUES ('1261', '137', '1321');
INSERT INTO `website_category` VALUES ('1260', '137', '1320');
INSERT INTO `website_category` VALUES ('1259', '137', '1319');
INSERT INTO `website_category` VALUES ('1258', '137', '1318');
INSERT INTO `website_category` VALUES ('1257', '136', '1317');
INSERT INTO `website_category` VALUES ('1256', '136', '1316');
INSERT INTO `website_category` VALUES ('1255', '136', '1315');
INSERT INTO `website_category` VALUES ('1254', '136', '1314');
INSERT INTO `website_category` VALUES ('1253', '136', '1313');
INSERT INTO `website_category` VALUES ('1252', '136', '1312');
INSERT INTO `website_category` VALUES ('1251', '136', '1311');
INSERT INTO `website_category` VALUES ('1250', '136', '1310');
INSERT INTO `website_category` VALUES ('1249', '136', '1309');
INSERT INTO `website_category` VALUES ('1248', '136', '1308');
INSERT INTO `website_category` VALUES ('1247', '135', '1307');
INSERT INTO `website_category` VALUES ('1246', '135', '1306');
INSERT INTO `website_category` VALUES ('1245', '135', '1305');
INSERT INTO `website_category` VALUES ('1244', '135', '1304');
INSERT INTO `website_category` VALUES ('1243', '135', '1303');
INSERT INTO `website_category` VALUES ('1242', '135', '1302');
INSERT INTO `website_category` VALUES ('1241', '135', '1301');
INSERT INTO `website_category` VALUES ('1240', '135', '1300');
INSERT INTO `website_category` VALUES ('1239', '135', '1299');
INSERT INTO `website_category` VALUES ('1238', '135', '1298');
INSERT INTO `website_category` VALUES ('1237', '135', '1297');
INSERT INTO `website_category` VALUES ('1236', '135', '1296');
INSERT INTO `website_category` VALUES ('1235', '135', '1295');
INSERT INTO `website_category` VALUES ('1234', '135', '1294');
INSERT INTO `website_category` VALUES ('1233', '135', '1293');
INSERT INTO `website_category` VALUES ('1232', '135', '1292');
INSERT INTO `website_category` VALUES ('1231', '134', '1291');
INSERT INTO `website_category` VALUES ('1230', '134', '1290');
INSERT INTO `website_category` VALUES ('1229', '134', '1289');
INSERT INTO `website_category` VALUES ('1228', '134', '1288');
INSERT INTO `website_category` VALUES ('1227', '134', '1287');
INSERT INTO `website_category` VALUES ('1226', '134', '1286');
INSERT INTO `website_category` VALUES ('1225', '134', '1285');
INSERT INTO `website_category` VALUES ('1224', '134', '1284');
INSERT INTO `website_category` VALUES ('1223', '134', '1283');
INSERT INTO `website_category` VALUES ('1222', '134', '1282');
INSERT INTO `website_category` VALUES ('1221', '134', '1281');
INSERT INTO `website_category` VALUES ('1220', '134', '1280');
INSERT INTO `website_category` VALUES ('1219', '134', '1279');
INSERT INTO `website_category` VALUES ('1218', '133', '1278');
INSERT INTO `website_category` VALUES ('1217', '133', '1277');
INSERT INTO `website_category` VALUES ('1216', '133', '1276');
INSERT INTO `website_category` VALUES ('1215', '133', '1275');
INSERT INTO `website_category` VALUES ('1214', '133', '1274');
INSERT INTO `website_category` VALUES ('1213', '133', '1273');
INSERT INTO `website_category` VALUES ('1212', '133', '1272');
INSERT INTO `website_category` VALUES ('1211', '133', '1271');
INSERT INTO `website_category` VALUES ('1210', '133', '1270');
INSERT INTO `website_category` VALUES ('1209', '133', '1269');
INSERT INTO `website_category` VALUES ('1208', '133', '1268');
INSERT INTO `website_category` VALUES ('1207', '133', '1267');
INSERT INTO `website_category` VALUES ('1206', '132', '1266');
INSERT INTO `website_category` VALUES ('1205', '132', '1265');
INSERT INTO `website_category` VALUES ('1204', '132', '1264');
INSERT INTO `website_category` VALUES ('1203', '132', '1263');
INSERT INTO `website_category` VALUES ('1202', '132', '1262');
INSERT INTO `website_category` VALUES ('1201', '132', '1261');
INSERT INTO `website_category` VALUES ('1200', '132', '1260');
INSERT INTO `website_category` VALUES ('1199', '132', '1259');
INSERT INTO `website_category` VALUES ('1198', '132', '1258');
INSERT INTO `website_category` VALUES ('1197', '132', '1257');
INSERT INTO `website_category` VALUES ('1196', '132', '1256');
INSERT INTO `website_category` VALUES ('1195', '132', '1255');
INSERT INTO `website_category` VALUES ('1194', '132', '1254');
INSERT INTO `website_category` VALUES ('1193', '132', '1253');
INSERT INTO `website_category` VALUES ('1192', '132', '1252');
INSERT INTO `website_category` VALUES ('1191', '132', '1251');
INSERT INTO `website_category` VALUES ('1190', '132', '1250');
INSERT INTO `website_category` VALUES ('1189', '132', '1249');
INSERT INTO `website_category` VALUES ('1188', '132', '1248');
INSERT INTO `website_category` VALUES ('1187', '132', '1247');
INSERT INTO `website_category` VALUES ('1186', '132', '1246');
INSERT INTO `website_category` VALUES ('1185', '132', '1245');
INSERT INTO `website_category` VALUES ('1184', '132', '1244');
INSERT INTO `website_category` VALUES ('1183', '132', '1243');
INSERT INTO `website_category` VALUES ('1182', '132', '1242');
INSERT INTO `website_category` VALUES ('1181', '132', '1241');
INSERT INTO `website_category` VALUES ('1180', '132', '1240');
INSERT INTO `website_category` VALUES ('1179', '132', '1239');
INSERT INTO `website_category` VALUES ('1178', '132', '1238');
INSERT INTO `website_category` VALUES ('1177', '132', '1237');
INSERT INTO `website_category` VALUES ('1176', '131', '1236');
INSERT INTO `website_category` VALUES ('1175', '131', '1235');
INSERT INTO `website_category` VALUES ('1174', '131', '1234');
INSERT INTO `website_category` VALUES ('1173', '131', '1233');
INSERT INTO `website_category` VALUES ('1172', '131', '1232');
INSERT INTO `website_category` VALUES ('1171', '131', '1231');
INSERT INTO `website_category` VALUES ('1170', '131', '1230');
INSERT INTO `website_category` VALUES ('1169', '131', '1229');
INSERT INTO `website_category` VALUES ('1168', '130', '1228');
INSERT INTO `website_category` VALUES ('1167', '130', '1227');
INSERT INTO `website_category` VALUES ('1166', '130', '1226');
INSERT INTO `website_category` VALUES ('1165', '130', '1225');
INSERT INTO `website_category` VALUES ('1164', '130', '1224');
INSERT INTO `website_category` VALUES ('1163', '130', '1223');
INSERT INTO `website_category` VALUES ('1162', '130', '1222');
INSERT INTO `website_category` VALUES ('1161', '130', '1221');
INSERT INTO `website_category` VALUES ('1160', '129', '1220');
INSERT INTO `website_category` VALUES ('1159', '129', '1219');
INSERT INTO `website_category` VALUES ('1158', '129', '1218');
INSERT INTO `website_category` VALUES ('1157', '129', '1217');
INSERT INTO `website_category` VALUES ('1156', '129', '1216');
INSERT INTO `website_category` VALUES ('1155', '129', '1215');
INSERT INTO `website_category` VALUES ('1154', '129', '1214');
INSERT INTO `website_category` VALUES ('1153', '129', '1213');
INSERT INTO `website_category` VALUES ('1152', '128', '1212');
INSERT INTO `website_category` VALUES ('1151', '128', '1211');
INSERT INTO `website_category` VALUES ('1150', '128', '1210');
INSERT INTO `website_category` VALUES ('1149', '128', '1209');
INSERT INTO `website_category` VALUES ('1148', '128', '1208');
INSERT INTO `website_category` VALUES ('1147', '128', '1207');
INSERT INTO `website_category` VALUES ('1146', '128', '1206');
INSERT INTO `website_category` VALUES ('1145', '128', '1205');
INSERT INTO `website_category` VALUES ('1144', '127', '1204');
INSERT INTO `website_category` VALUES ('1143', '127', '1203');
INSERT INTO `website_category` VALUES ('1142', '127', '1202');
INSERT INTO `website_category` VALUES ('1141', '127', '1201');
INSERT INTO `website_category` VALUES ('1140', '126', '1200');
INSERT INTO `website_category` VALUES ('1139', '126', '1199');
INSERT INTO `website_category` VALUES ('1138', '126', '1198');
INSERT INTO `website_category` VALUES ('1137', '126', '1197');
INSERT INTO `website_category` VALUES ('1136', '126', '1196');
INSERT INTO `website_category` VALUES ('1135', '126', '1195');
INSERT INTO `website_category` VALUES ('1134', '126', '1194');
INSERT INTO `website_category` VALUES ('1133', '126', '1193');
INSERT INTO `website_category` VALUES ('1132', '126', '1192');
INSERT INTO `website_category` VALUES ('1131', '126', '1191');
INSERT INTO `website_category` VALUES ('1130', '126', '1190');
INSERT INTO `website_category` VALUES ('1129', '126', '1189');
INSERT INTO `website_category` VALUES ('1128', '126', '1188');
INSERT INTO `website_category` VALUES ('1127', '126', '1187');
INSERT INTO `website_category` VALUES ('1126', '126', '1186');
INSERT INTO `website_category` VALUES ('1125', '126', '1185');
INSERT INTO `website_category` VALUES ('1124', '126', '1184');
INSERT INTO `website_category` VALUES ('1123', '126', '1183');
INSERT INTO `website_category` VALUES ('1122', '126', '1182');
INSERT INTO `website_category` VALUES ('1121', '126', '1181');
INSERT INTO `website_category` VALUES ('1120', '126', '1180');
INSERT INTO `website_category` VALUES ('1119', '125', '1179');
INSERT INTO `website_category` VALUES ('1118', '125', '1178');
INSERT INTO `website_category` VALUES ('1117', '125', '1177');
INSERT INTO `website_category` VALUES ('1116', '125', '1176');
INSERT INTO `website_category` VALUES ('1115', '125', '1175');
INSERT INTO `website_category` VALUES ('1114', '125', '1174');
INSERT INTO `website_category` VALUES ('1113', '125', '1173');
INSERT INTO `website_category` VALUES ('1112', '124', '1172');
INSERT INTO `website_category` VALUES ('1111', '124', '1171');
INSERT INTO `website_category` VALUES ('1110', '124', '1170');
INSERT INTO `website_category` VALUES ('1109', '124', '1169');
INSERT INTO `website_category` VALUES ('1108', '124', '1168');
INSERT INTO `website_category` VALUES ('1107', '124', '1167');
INSERT INTO `website_category` VALUES ('1106', '124', '1166');
INSERT INTO `website_category` VALUES ('1105', '124', '1165');
INSERT INTO `website_category` VALUES ('1104', '124', '1164');
INSERT INTO `website_category` VALUES ('1103', '124', '1163');
INSERT INTO `website_category` VALUES ('1102', '124', '1162');
INSERT INTO `website_category` VALUES ('1101', '124', '1161');
INSERT INTO `website_category` VALUES ('1100', '124', '1160');
INSERT INTO `website_category` VALUES ('1099', '124', '1159');
INSERT INTO `website_category` VALUES ('1098', '123', '1158');
INSERT INTO `website_category` VALUES ('1097', '123', '1157');
INSERT INTO `website_category` VALUES ('1096', '123', '1156');
INSERT INTO `website_category` VALUES ('1095', '123', '1155');
INSERT INTO `website_category` VALUES ('1094', '123', '1154');
INSERT INTO `website_category` VALUES ('1093', '123', '1153');
INSERT INTO `website_category` VALUES ('1092', '123', '1152');
INSERT INTO `website_category` VALUES ('1091', '123', '1151');
INSERT INTO `website_category` VALUES ('1090', '123', '1150');
INSERT INTO `website_category` VALUES ('1089', '123', '1149');
INSERT INTO `website_category` VALUES ('1088', '123', '1148');
INSERT INTO `website_category` VALUES ('1087', '123', '1147');
INSERT INTO `website_category` VALUES ('1086', '123', '1146');
INSERT INTO `website_category` VALUES ('1085', '123', '1145');
INSERT INTO `website_category` VALUES ('1084', '123', '1144');
INSERT INTO `website_category` VALUES ('1083', '122', '1143');
INSERT INTO `website_category` VALUES ('1082', '122', '1142');
INSERT INTO `website_category` VALUES ('1081', '122', '1141');
INSERT INTO `website_category` VALUES ('1080', '122', '1140');
INSERT INTO `website_category` VALUES ('1079', '122', '1139');
INSERT INTO `website_category` VALUES ('1078', '122', '1138');
INSERT INTO `website_category` VALUES ('1077', '122', '1137');
INSERT INTO `website_category` VALUES ('1076', '122', '1136');
INSERT INTO `website_category` VALUES ('1075', '122', '1135');
INSERT INTO `website_category` VALUES ('1074', '122', '1134');
INSERT INTO `website_category` VALUES ('1073', '122', '1133');
INSERT INTO `website_category` VALUES ('1072', '122', '1132');
INSERT INTO `website_category` VALUES ('1071', '122', '1131');
INSERT INTO `website_category` VALUES ('1070', '122', '1130');
INSERT INTO `website_category` VALUES ('1069', '122', '1129');
INSERT INTO `website_category` VALUES ('1068', '122', '1128');
INSERT INTO `website_category` VALUES ('1067', '122', '1127');
INSERT INTO `website_category` VALUES ('1066', '122', '1126');
INSERT INTO `website_category` VALUES ('1065', '122', '1125');
INSERT INTO `website_category` VALUES ('1064', '122', '1124');
INSERT INTO `website_category` VALUES ('1063', '122', '1123');
INSERT INTO `website_category` VALUES ('1062', '122', '1122');
INSERT INTO `website_category` VALUES ('1061', '122', '1121');
INSERT INTO `website_category` VALUES ('1060', '122', '1120');
INSERT INTO `website_category` VALUES ('1059', '122', '1119');
INSERT INTO `website_category` VALUES ('1058', '122', '1118');
INSERT INTO `website_category` VALUES ('1057', '122', '1117');
INSERT INTO `website_category` VALUES ('1056', '122', '1116');
INSERT INTO `website_category` VALUES ('1055', '121', '1115');
INSERT INTO `website_category` VALUES ('1054', '121', '1114');
INSERT INTO `website_category` VALUES ('1053', '121', '1113');
INSERT INTO `website_category` VALUES ('1052', '121', '1112');
INSERT INTO `website_category` VALUES ('1051', '121', '1111');
INSERT INTO `website_category` VALUES ('1050', '121', '1110');
INSERT INTO `website_category` VALUES ('1049', '120', '1109');
INSERT INTO `website_category` VALUES ('1048', '120', '1108');
INSERT INTO `website_category` VALUES ('1047', '120', '1107');
INSERT INTO `website_category` VALUES ('1046', '120', '1106');
INSERT INTO `website_category` VALUES ('1045', '120', '1105');
INSERT INTO `website_category` VALUES ('1044', '120', '1104');
INSERT INTO `website_category` VALUES ('1043', '120', '1103');
INSERT INTO `website_category` VALUES ('1042', '120', '1102');
INSERT INTO `website_category` VALUES ('1041', '120', '1101');
INSERT INTO `website_category` VALUES ('1040', '120', '1100');
INSERT INTO `website_category` VALUES ('1039', '119', '1099');
INSERT INTO `website_category` VALUES ('1038', '119', '1098');
INSERT INTO `website_category` VALUES ('1037', '119', '1097');
INSERT INTO `website_category` VALUES ('1036', '119', '1096');
INSERT INTO `website_category` VALUES ('1035', '119', '1095');
INSERT INTO `website_category` VALUES ('1034', '119', '1094');
INSERT INTO `website_category` VALUES ('1033', '119', '1093');
INSERT INTO `website_category` VALUES ('1032', '119', '1092');
INSERT INTO `website_category` VALUES ('1031', '119', '1091');
INSERT INTO `website_category` VALUES ('1030', '119', '1090');
INSERT INTO `website_category` VALUES ('1029', '119', '1089');
INSERT INTO `website_category` VALUES ('1028', '119', '1088');
INSERT INTO `website_category` VALUES ('1027', '119', '1087');
INSERT INTO `website_category` VALUES ('1026', '119', '1086');
INSERT INTO `website_category` VALUES ('1025', '118', '1085');
INSERT INTO `website_category` VALUES ('1024', '118', '1084');
INSERT INTO `website_category` VALUES ('1023', '118', '1083');
INSERT INTO `website_category` VALUES ('1022', '118', '1082');
INSERT INTO `website_category` VALUES ('1021', '118', '1081');
INSERT INTO `website_category` VALUES ('1020', '118', '1080');
INSERT INTO `website_category` VALUES ('1019', '118', '1079');
INSERT INTO `website_category` VALUES ('1018', '118', '1078');
INSERT INTO `website_category` VALUES ('1017', '118', '1077');
INSERT INTO `website_category` VALUES ('1016', '118', '1076');
INSERT INTO `website_category` VALUES ('1015', '118', '1075');
INSERT INTO `website_category` VALUES ('1014', '118', '1074');
INSERT INTO `website_category` VALUES ('1013', '118', '1073');
INSERT INTO `website_category` VALUES ('1012', '117', '1072');
INSERT INTO `website_category` VALUES ('1011', '117', '1071');
INSERT INTO `website_category` VALUES ('1010', '117', '1070');
INSERT INTO `website_category` VALUES ('1009', '117', '1069');
INSERT INTO `website_category` VALUES ('1008', '117', '1068');
INSERT INTO `website_category` VALUES ('1007', '117', '1067');
INSERT INTO `website_category` VALUES ('1006', '117', '1066');
INSERT INTO `website_category` VALUES ('1005', '117', '1065');
INSERT INTO `website_category` VALUES ('1004', '117', '1064');
INSERT INTO `website_category` VALUES ('1003', '117', '1063');
INSERT INTO `website_category` VALUES ('1002', '117', '1062');
INSERT INTO `website_category` VALUES ('1001', '117', '1061');
INSERT INTO `website_category` VALUES ('1000', '117', '1060');
INSERT INTO `website_category` VALUES ('999', '117', '1059');
INSERT INTO `website_category` VALUES ('998', '117', '1058');
INSERT INTO `website_category` VALUES ('997', '117', '1057');
INSERT INTO `website_category` VALUES ('996', '117', '1056');
INSERT INTO `website_category` VALUES ('995', '117', '1055');
INSERT INTO `website_category` VALUES ('994', '117', '1054');
INSERT INTO `website_category` VALUES ('993', '117', '1053');
INSERT INTO `website_category` VALUES ('992', '117', '1052');
INSERT INTO `website_category` VALUES ('991', '117', '1051');
INSERT INTO `website_category` VALUES ('990', '117', '1050');
INSERT INTO `website_category` VALUES ('989', '116', '1049');
INSERT INTO `website_category` VALUES ('988', '116', '1048');
INSERT INTO `website_category` VALUES ('987', '116', '1047');
INSERT INTO `website_category` VALUES ('986', '116', '1046');
INSERT INTO `website_category` VALUES ('985', '116', '1045');
INSERT INTO `website_category` VALUES ('984', '116', '1044');
INSERT INTO `website_category` VALUES ('983', '116', '1043');
INSERT INTO `website_category` VALUES ('982', '116', '1042');
INSERT INTO `website_category` VALUES ('981', '116', '1041');
INSERT INTO `website_category` VALUES ('980', '116', '1040');
INSERT INTO `website_category` VALUES ('979', '116', '1039');
INSERT INTO `website_category` VALUES ('978', '116', '1038');
INSERT INTO `website_category` VALUES ('977', '116', '1037');
INSERT INTO `website_category` VALUES ('976', '116', '1036');
INSERT INTO `website_category` VALUES ('975', '116', '1035');
INSERT INTO `website_category` VALUES ('974', '116', '1034');
INSERT INTO `website_category` VALUES ('973', '116', '1033');
INSERT INTO `website_category` VALUES ('972', '116', '1032');
INSERT INTO `website_category` VALUES ('971', '116', '1031');
INSERT INTO `website_category` VALUES ('970', '116', '1030');
INSERT INTO `website_category` VALUES ('969', '116', '1029');
INSERT INTO `website_category` VALUES ('968', '116', '1028');
INSERT INTO `website_category` VALUES ('967', '116', '1027');
INSERT INTO `website_category` VALUES ('966', '115', '1026');
INSERT INTO `website_category` VALUES ('965', '115', '1025');
INSERT INTO `website_category` VALUES ('964', '115', '1024');
INSERT INTO `website_category` VALUES ('963', '115', '1023');
INSERT INTO `website_category` VALUES ('962', '115', '1022');
INSERT INTO `website_category` VALUES ('961', '115', '1021');
INSERT INTO `website_category` VALUES ('960', '115', '1020');
INSERT INTO `website_category` VALUES ('959', '115', '1019');
INSERT INTO `website_category` VALUES ('958', '115', '1018');
INSERT INTO `website_category` VALUES ('957', '115', '1017');
INSERT INTO `website_category` VALUES ('956', '115', '1016');
INSERT INTO `website_category` VALUES ('955', '115', '1015');
INSERT INTO `website_category` VALUES ('954', '115', '1014');
INSERT INTO `website_category` VALUES ('953', '115', '1013');
INSERT INTO `website_category` VALUES ('952', '115', '1012');
INSERT INTO `website_category` VALUES ('951', '115', '1011');
INSERT INTO `website_category` VALUES ('950', '115', '1010');
INSERT INTO `website_category` VALUES ('949', '115', '1009');
INSERT INTO `website_category` VALUES ('948', '115', '1008');
INSERT INTO `website_category` VALUES ('947', '115', '1007');
INSERT INTO `website_category` VALUES ('946', '115', '1006');
INSERT INTO `website_category` VALUES ('945', '115', '1005');
INSERT INTO `website_category` VALUES ('944', '115', '1004');
INSERT INTO `website_category` VALUES ('943', '115', '1003');
INSERT INTO `website_category` VALUES ('942', '114', '1002');
INSERT INTO `website_category` VALUES ('941', '114', '1001');
INSERT INTO `website_category` VALUES ('940', '114', '1000');
INSERT INTO `website_category` VALUES ('939', '114', '999');
INSERT INTO `website_category` VALUES ('938', '114', '998');
INSERT INTO `website_category` VALUES ('937', '114', '997');
INSERT INTO `website_category` VALUES ('936', '114', '996');
INSERT INTO `website_category` VALUES ('935', '114', '995');
INSERT INTO `website_category` VALUES ('934', '114', '994');
INSERT INTO `website_category` VALUES ('933', '113', '993');
INSERT INTO `website_category` VALUES ('932', '113', '992');
INSERT INTO `website_category` VALUES ('931', '113', '991');
INSERT INTO `website_category` VALUES ('930', '113', '990');
INSERT INTO `website_category` VALUES ('929', '113', '989');
INSERT INTO `website_category` VALUES ('928', '113', '988');
INSERT INTO `website_category` VALUES ('927', '113', '987');
INSERT INTO `website_category` VALUES ('926', '113', '986');
INSERT INTO `website_category` VALUES ('925', '113', '985');
INSERT INTO `website_category` VALUES ('924', '113', '984');
INSERT INTO `website_category` VALUES ('923', '113', '983');
INSERT INTO `website_category` VALUES ('922', '113', '982');
INSERT INTO `website_category` VALUES ('921', '113', '981');
INSERT INTO `website_category` VALUES ('920', '113', '980');
INSERT INTO `website_category` VALUES ('919', '113', '979');
INSERT INTO `website_category` VALUES ('918', '113', '978');
INSERT INTO `website_category` VALUES ('917', '113', '977');
INSERT INTO `website_category` VALUES ('916', '113', '976');
INSERT INTO `website_category` VALUES ('915', '113', '975');
INSERT INTO `website_category` VALUES ('914', '113', '974');
INSERT INTO `website_category` VALUES ('913', '113', '973');
INSERT INTO `website_category` VALUES ('912', '113', '972');
INSERT INTO `website_category` VALUES ('911', '112', '971');
INSERT INTO `website_category` VALUES ('910', '112', '970');
INSERT INTO `website_category` VALUES ('909', '112', '969');
INSERT INTO `website_category` VALUES ('908', '112', '968');
INSERT INTO `website_category` VALUES ('907', '112', '967');
INSERT INTO `website_category` VALUES ('906', '112', '966');
INSERT INTO `website_category` VALUES ('905', '112', '965');
INSERT INTO `website_category` VALUES ('904', '111', '964');
INSERT INTO `website_category` VALUES ('903', '111', '963');
INSERT INTO `website_category` VALUES ('902', '111', '962');
INSERT INTO `website_category` VALUES ('901', '111', '961');
INSERT INTO `website_category` VALUES ('900', '111', '960');
INSERT INTO `website_category` VALUES ('899', '111', '959');
INSERT INTO `website_category` VALUES ('898', '110', '958');
INSERT INTO `website_category` VALUES ('897', '110', '957');
INSERT INTO `website_category` VALUES ('896', '110', '956');
INSERT INTO `website_category` VALUES ('895', '110', '955');
INSERT INTO `website_category` VALUES ('894', '110', '954');
INSERT INTO `website_category` VALUES ('893', '110', '953');
INSERT INTO `website_category` VALUES ('892', '109', '952');
INSERT INTO `website_category` VALUES ('891', '109', '951');
INSERT INTO `website_category` VALUES ('890', '109', '950');
INSERT INTO `website_category` VALUES ('889', '109', '949');
INSERT INTO `website_category` VALUES ('888', '109', '948');
INSERT INTO `website_category` VALUES ('887', '109', '947');
INSERT INTO `website_category` VALUES ('886', '108', '946');
INSERT INTO `website_category` VALUES ('885', '108', '945');
INSERT INTO `website_category` VALUES ('884', '108', '944');
INSERT INTO `website_category` VALUES ('883', '108', '943');
INSERT INTO `website_category` VALUES ('882', '107', '942');
INSERT INTO `website_category` VALUES ('881', '107', '941');
INSERT INTO `website_category` VALUES ('880', '107', '940');
INSERT INTO `website_category` VALUES ('879', '107', '939');
INSERT INTO `website_category` VALUES ('878', '107', '938');
INSERT INTO `website_category` VALUES ('877', '107', '937');
INSERT INTO `website_category` VALUES ('876', '107', '936');
INSERT INTO `website_category` VALUES ('875', '107', '935');
INSERT INTO `website_category` VALUES ('874', '107', '934');
INSERT INTO `website_category` VALUES ('873', '107', '933');
INSERT INTO `website_category` VALUES ('872', '107', '932');
INSERT INTO `website_category` VALUES ('871', '107', '931');
INSERT INTO `website_category` VALUES ('870', '107', '930');
INSERT INTO `website_category` VALUES ('869', '107', '929');

-- ----------------------------
-- Table structure for website_library
-- ----------------------------
DROP TABLE IF EXISTS `website_library`;
CREATE TABLE `website_library` (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`website_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of website_library
-- ----------------------------
INSERT INTO `website_library` VALUES ('2', '2020-01-04 23:03:40', null, null, '', '酷达导航', 0x687474703A2F2F31363864682E636E);
INSERT INTO `website_library` VALUES ('3', '2020-01-04 23:26:55', null, null, 'http://img.168dh.cn/website/1574400003893youku.svg', '优酷', 0x68747470733A2F2F7777772E796F756B752E636F6D2F);
INSERT INTO `website_library` VALUES ('4', '2020-01-04 23:27:06', null, null, 'http://img.168dh.cn/website/1574400069739mgtv.svg', '芒果TV', 0x68747470733A2F2F7777772E6D6774762E636F6D2F);

-- ----------------------------
-- Table structure for website_user
-- ----------------------------
DROP TABLE IF EXISTS `website_user`;
CREATE TABLE `website_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `website_category` varchar(255) DEFAULT NULL,
  `website_icon` varchar(255) DEFAULT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of website_user
-- ----------------------------
