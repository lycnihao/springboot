/*
 Navicat Premium Data Transfer

 Source Server         : 106.54.255.9
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 106.54.255.9:3306
 Source Schema         : test_couldr

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/01/2020 22:31:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `attach_id` bigint(20) NOT NULL,
  `attach_created` datetime(0) NULL DEFAULT NULL,
  `attach_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_origin` int(11) NULL DEFAULT NULL,
  `attach_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_small_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attach_wh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attach_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('E87E1F2E367CE10DB70CFA29C28B0D75', 'http://thirdqq.qlogo.cn/g?b=oidb&k=c0wgiccp7EjbofKhK9NLmMA&s=100&t=1576728325', NULL, NULL, NULL, 0, '-', '尹深.@79xj.cn', NULL, 'QQ', '尹深.@79xj.cn');
INSERT INTO `auth_user` VALUES ('58302A0634AB6EAA50826B990ECCE64C', 'http://thirdqq.qlogo.cn/g?b=oidb&k=xQMdiaCNq4FK3KqOLR9RBcw&s=100&t=1571066314', NULL, NULL, NULL, 0, '湖南-长沙', '会飞的虾', NULL, 'QQ', '会飞的虾');
INSERT INTO `auth_user` VALUES ('137EECB321C1F1F9FD4E37184EC7B5DA', 'http://thirdqq.qlogo.cn/g?b=oidb&k=Vlfbav5mbqfIa0eyd8w3gA&s=100&t=1575102023', NULL, NULL, NULL, 0, '-', 'S7.', NULL, 'QQ', 'S7.');
INSERT INTO `auth_user` VALUES ('4F6080894621D7636F75E6FC158AF830', 'http://thirdqq.qlogo.cn/g?b=oidb&k=lt2kMrfA9wkSHovtlIMibyw&s=100&t=1575886103', NULL, NULL, NULL, 0, '-', '阿海云普网络⁠⁢工作室', NULL, 'QQ', '阿海云普网络⁠⁢工作室');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordered` int(11) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `slug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `cate_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (148, NULL, NULL, '设计兼职', 0, -1, 'workmodule3', 0, 0);
INSERT INTO `category` VALUES (147, NULL, NULL, '程序兼职', 19, 0, 'workmodule2', 0, 0);
INSERT INTO `category` VALUES (146, NULL, NULL, '招聘平台', 18, 0, 'workmodule1', 0, 0);
INSERT INTO `category` VALUES (145, NULL, NULL, '硬件系统', 0, -1, 'hardwaremodule2', 0, 0);
INSERT INTO `category` VALUES (144, NULL, NULL, '开发硬件', 0, -1, 'hardwaremodule1', 0, 0);
INSERT INTO `category` VALUES (143, NULL, NULL, 'ASO优化', 0, -1, 'operationmodule8', 0, 0);
INSERT INTO `category` VALUES (142, NULL, NULL, '网站收录', 17, 0, 'operationmodule7', 0, 0);
INSERT INTO `category` VALUES (141, NULL, NULL, '新媒工具', 16, 0, 'operationmodule6', 0, 0);
INSERT INTO `category` VALUES (140, NULL, NULL, '新媒平台', 15, 0, 'operationmodule5', 0, 0);
INSERT INTO `category` VALUES (139, NULL, NULL, '数据收集', 0, -1, 'operationmodule4', 0, 0);
INSERT INTO `category` VALUES (138, NULL, NULL, '数据工具', 0, -1, 'operationmodule3', 0, 0);
INSERT INTO `category` VALUES (137, NULL, NULL, '数据分析', 14, 0, 'operationmodule2', 0, 0);
INSERT INTO `category` VALUES (136, NULL, NULL, '域名注册', 0, -1, 'operationmodule1', 0, 0);
INSERT INTO `category` VALUES (135, NULL, NULL, '交流社区', 13, 0, 'researchmodule10', 0, 0);
INSERT INTO `category` VALUES (134, NULL, NULL, '开放资源', 0, -1, 'researchmodule9', 0, 0);
INSERT INTO `category` VALUES (133, NULL, NULL, '学习教程', 0, -1, 'researchmodule8', 0, 0);
INSERT INTO `category` VALUES (132, NULL, NULL, '开发工具', 0, -1, 'researchmodule7', 0, 0);
INSERT INTO `category` VALUES (131, NULL, NULL, '代码托管', 0, -1, 'researchmodule6', 0, 0);
INSERT INTO `category` VALUES (130, NULL, NULL, '内容管理', 0, -1, 'researchmodule5', 0, 0);
INSERT INTO `category` VALUES (129, NULL, NULL, '个人框架', 0, -1, 'researchmodule4', 0, 0);
INSERT INTO `category` VALUES (128, NULL, NULL, '检查测试', 0, -1, 'researchmodule3', 0, 0);
INSERT INTO `category` VALUES (127, NULL, NULL, '后端系统', 0, -1, 'researchmodule2', 0, 0);
INSERT INTO `category` VALUES (126, NULL, NULL, '前端框架', 0, -1, 'researchmodule1', 0, 0);
INSERT INTO `category` VALUES (125, NULL, NULL, '交流社区', 0, -1, 'designmodule13', 0, 0);
INSERT INTO `category` VALUES (124, NULL, NULL, '学习教程', 0, -1, 'designmodule12', 0, 0);
INSERT INTO `category` VALUES (123, NULL, NULL, '设计团队', 0, -1, 'designmodule11', 0, 0);
INSERT INTO `category` VALUES (122, NULL, NULL, '设计工具', 12, 0, 'designmodule10', 0, 0);
INSERT INTO `category` VALUES (121, NULL, NULL, '设计规范', 0, -1, 'designmodule9', 0, 0);
INSERT INTO `category` VALUES (120, NULL, NULL, '字体字形', 11, 0, 'designmodule8', 0, 0);
INSERT INTO `category` VALUES (119, NULL, NULL, '颜色搭配', 10, 0, 'designmodule7', 0, 0);
INSERT INTO `category` VALUES (118, NULL, NULL, '优质图库', 9, 0, 'designmodule6', 0, 0);
INSERT INTO `category` VALUES (117, NULL, NULL, '设计素材', 8, 0, 'designmodule5', 0, 0);
INSERT INTO `category` VALUES (116, NULL, NULL, 'icon图标', 7, 0, 'designmodule4', 0, 0);
INSERT INTO `category` VALUES (115, NULL, NULL, '交互案例', 6, 0, 'designmodule3', 0, 0);
INSERT INTO `category` VALUES (108, NULL, NULL, '原型工具', 5, 0, 'productmodule2', 0, 0);
INSERT INTO `category` VALUES (109, NULL, NULL, '思维导图', 4, 0, 'productmodule3', 0, 0);
INSERT INTO `category` VALUES (110, NULL, NULL, '协同工作', 3, 0, 'productmodule4', 0, 0);
INSERT INTO `category` VALUES (111, NULL, NULL, '文档编辑', 2, 0, 'productmodule5', 0, 0);
INSERT INTO `category` VALUES (112, NULL, NULL, '云盘存储', 0, -1, 'productmodule6', 0, 0);
INSERT INTO `category` VALUES (113, NULL, NULL, '灵感收录', 1, 0, 'designmodule1', 0, 0);
INSERT INTO `category` VALUES (114, NULL, NULL, '设计资讯', 20, 0, 'designmodule2', 0, 0);
INSERT INTO `category` VALUES (107, NULL, NULL, '平台资讯', 0, 0, 'productmodule1', 0, 0);
INSERT INTO `category` VALUES (149, NULL, NULL, '我的常用网址', 0, 0, '我的常用网址', 0, 1);
INSERT INTO `category` VALUES (151, NULL, NULL, '我的常用地址', 0, 0, '我的常用地址', 35, 1);
INSERT INTO `category` VALUES (157, NULL, NULL, '我的常用网址2', 0, 0, '我的常用网址2', 35, 1);
INSERT INTO `category` VALUES (158, NULL, NULL, '我的常用网址', 0, 0, '我的常用网址', 30, 1);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `option_name` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `option_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`option_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_time` datetime(0) NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (30, '2020-01-16 13:44:17', '38707145@qq.com', '2020-01-16 22:08:29', 'iksen', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, 'https://www.168dh.cn/favicon.ico', 'iksen', NULL, '192.168.152.1', 0);
INSERT INTO `user` VALUES (31, '2019-12-12 09:47:16', '38707145@qq.com', '2020-01-12 13:57:49', '会飞的虾', 'f992ae49dd4622ca6874d4ad4914de76', NULL, 1, NULL, '/upload/img/2019/11/wallpaper1_aacd26120191225162406101.jpg', '会飞的虾', '58302A0634AB6EAA50826B990ECCE64C', NULL, NULL);
INSERT INTO `user` VALUES (32, '2019-12-15 10:59:26', '93051889@qq.com', '2019-12-29 20:11:53', 'marshalxu', 'f0576e1a8df24a393b0b1513cc94026c', NULL, 1, NULL, 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 'marshalxu', NULL, NULL, NULL);
INSERT INTO `user` VALUES (33, '2019-12-24 08:33:21', NULL, '2019-12-24 08:33:23', '尹深.@79xj.cn', '2f9b9a07bce6f35e6a88da3d31a0d7e9', NULL, 1, NULL, 'http://thirdqq.qlogo.cn/g?b=oidb&k=c0wgiccp7EjbofKhK9NLmMA&s=100&t=1576728325', '尹深.@79xj.cn', 'E87E1F2E367CE10DB70CFA29C28B0D75', NULL, NULL);
INSERT INTO `user` VALUES (34, '2019-12-29 23:20:15', '78963386@qq.com', NULL, 'asd11688', 'a2e6eb21bae3260fcb491e3f2b066418', NULL, 1, NULL, 'https://www.168dh.cn/favicon.ico', 'asd11688', NULL, NULL, NULL);
INSERT INTO `user` VALUES (35, '2020-01-01 17:04:07', 'gyhqcs@163.com', '2020-01-04 09:43:40', 'gyhqcs', '52c69e3a57331081823331c4e69d3f2e', NULL, 1, NULL, 'https://www.168dh.cn/favicon.ico', 'gyhqcs', NULL, NULL, NULL);
INSERT INTO `user` VALUES (36, '2020-01-10 19:57:08', NULL, '2020-01-10 19:57:11', 'S7.', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, 'http://thirdqq.qlogo.cn/g?b=oidb&k=Vlfbav5mbqfIa0eyd8w3gA&s=100&t=1575102023', 'S7.', '137EECB321C1F1F9FD4E37184EC7B5DA', NULL, NULL);
INSERT INTO `user` VALUES (37, '2020-01-13 21:07:19', NULL, '2020-01-13 21:07:19', '阿海云普网络⁠⁢工作室', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, 'http://thirdqq.qlogo.cn/g?b=oidb&k=lt2kMrfA9wkSHovtlIMibyw&s=100&t=1575886103', '803e29f8ecbfdf33e9e0e10ef1b07ec5', '4F6080894621D7636F75E6FC158AF830', NULL, NULL);

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website`  (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordered` int(11) NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `visits` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`website_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1499 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES (1406, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-8e7b49cf5bd94a419bdb7963951512b7.png', 0, '提供产品咨询、众测方案', '外包大师', 'public', 'http://www.waibaodashi.com/', 1);
INSERT INTO `website` VALUES (1405, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-b01bf5f0b52a43fe94ad107c286711ed.png', 0, '创作者的极简变现工具', '面包多', 'public', 'https://mianbaoduo.com/?from=czs', 1);
INSERT INTO `website` VALUES (1404, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-cf95cc23e6de4c11b572e2a9e28acd92.png', 0, '设计创意需求解决平台', '特赞', 'public', 'https://www.tezign.com/', 1);
INSERT INTO `website` VALUES (1402, '2020-01-12 23:07:15', NULL, 0, 'WEB和移动设计项目兼职平台', 'Crew', 'public', 'https://crew.co/', 1);
INSERT INTO `website` VALUES (1403, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-7811aa2d9e9443e2a292c0aa6a9630d8.png', 0, '拉勾旗下按需雇佣平台', '大鲲', 'public', 'https://www.lagou.com/about.html', 0);
INSERT INTO `website` VALUES (1401, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-a781cc69137f4499bb542d4f32108b74.png', 0, '按需雇佣BAT工程师、设计师', '实现网', 'public', 'https://shixian.com/', 0);
INSERT INTO `website` VALUES (1400, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-696ab4f55413431baf0c76b7321ef8de.png', 0, '程序员的经纪人', '程序员客栈', 'public', 'https://www.proginn.com/', 0);
INSERT INTO `website` VALUES (1399, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-06cac5b42da84d7e8fd158fb75fc09d9.png', 0, '基于云技术的软件外包服务平台', '码市', 'private', 'https://codemart.com/', 0);
INSERT INTO `website` VALUES (1398, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-aadcd7c4f03b42efb49adabe68e176ce.png', 0, '国外职业众包平台', 'Fiverr', 'private', 'https://www.fiverr.com/', 0);
INSERT INTO `website` VALUES (1397, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-d5bc9a5ee992441ab713bfdb5aca4b50.png', 0, '全球最大平台：程序丨设计', 'Freelancer', 'private', 'https://www.freelancer.com/', 0);
INSERT INTO `website` VALUES (1395, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-b574a64b6b634424a3d292dcc7bbce50.png', 0, '全球领先的职业社交网站', 'Linkedin', 'private', 'https://www.linkedin.com/', 0);
INSERT INTO `website` VALUES (1396, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-46ac4aa96d324d7ebd845afa82cc603a.png', 0, '全球最专业平台：程序丨设计丨文案', 'Upwork', 'private', 'https://www.upwork.com/', 1);
INSERT INTO `website` VALUES (1394, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-1c3462c37af84832b30b5f72ebe58758.png', 0, '年轻人专属社交招聘平台', '大街', 'private', 'https://www.dajie.com/', 1);
INSERT INTO `website` VALUES (1393, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-fef52eb4e0e74eb9b2c1ea71e4fc4b20.png', 0, '专注互联网职业招聘平台', '拉勾', 'private', 'https://www.lagou.com/', 0);
INSERT INTO `website` VALUES (1392, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-3ebe3d50c54f47c582db5bd9db9c7a7e.png', 0, '精英职业发展平台', '猎聘', 'private', 'https://www.liepin.com/', 0);
INSERT INTO `website` VALUES (1390, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-b04afcce75bf4a2b913e66e47f19d5b3.png', 0, '专业人才招聘网站', '前程无忧', 'private', 'https://www.51job.com/', 0);
INSERT INTO `website` VALUES (1391, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-93ea0ee55db442b985e0a2ff2f1ba7cd.png', 0, '生活分类信息网站', '58同城', 'private', 'https://sh.58.com/', 0);
INSERT INTO `website` VALUES (1387, '2020-01-12 23:04:11', NULL, 0, 'Android的物联网嵌入式操作系统', 'Android Things', 'private', 'https://developer.android.com/things/get-started/', 0);
INSERT INTO `website` VALUES (1388, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-69347a9c12e848568d30a99ef84d0de2.png', 0, '3D打印服务器', 'OctoPrint', 'private', 'https://octoprint.org/', 1);
INSERT INTO `website` VALUES (1389, '2020-01-12 23:07:15', 'upload/2020/1/couldr_com_-85f71c9250f8413180cd8fb69b0e4a74.png', 0, '权威的求职找工作平台', '智联招聘', 'private', 'https://www.zhaopin.com/', 0);
INSERT INTO `website` VALUES (1386, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-dc517a7f14294940ac64a13c944d28a0.png', 0, '为ARM开发板专门发行轻量级Debian', 'Armbian', 'private', 'https://www.armbian.com/', 0);
INSERT INTO `website` VALUES (1385, '2020-01-12 23:04:11', NULL, 0, '开源多平台轻量快速BT下载客户端', 'Transmissionbt', 'private', 'https://transmissionbt.com/', 0);
INSERT INTO `website` VALUES (1384, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-017cd41067854b41b078f2a5ecc7e810.png', 0, '基于Python3的开源智能家居平台', 'Home Assistant', 'private', 'https://www.home-assistant.io/', 0);
INSERT INTO `website` VALUES (1383, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-30f1477d84224d1aba96011494cce75f.png', 0, 'linux免费开源多媒体播放器', 'OSMC', 'private', 'https://osmc.tv/', 0);
INSERT INTO `website` VALUES (1382, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-45194fdeda224cff9ee15822dc89d7af.png', 0, '专注于迷你linux板精简化Kodi系统', 'LibreELEC', 'private', 'https://libreelec.tv/', 0);
INSERT INTO `website` VALUES (1380, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-43948ed150a442ca9bed530f1cf05937.png', 0, '基于Debian的存储(NAS)系统', 'OpenMediaVault', 'private', 'https://www.openmediavault.org/', 0);
INSERT INTO `website` VALUES (1381, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-ed2f1315608544178a2a048204b3422a.png', 0, '开源家庭多媒体影音中心播放器', 'Kodi', 'private', 'https://kodi.tv/', 0);
INSERT INTO `website` VALUES (1379, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-a0447777319748e0920912c245dfeccf.png', 0, '嵌入式的Linux发行版路由器系统', 'OpenWrt', 'private', 'https://openwrt.org/downloads', 0);
INSERT INTO `website` VALUES (1378, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-2615917081524e58ba93d9548e6255aa.png', 0, '基于ARM的UNIX操作系统', 'FreeBSD-ARM', 'private', 'https://www.freebsd.org/platforms/arm.html', 0);
INSERT INTO `website` VALUES (1376, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-ef6e665f35e44c1fa5a51bb702913908.png', 0, '轻量简洁为设计理念的Linux发行版', 'ArchLinux', 'private', 'https://archlinuxarm.org/platforms', 1);
INSERT INTO `website` VALUES (1377, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-8c859ea3517b4723b7393a6e13598edb.png', 0, '基于ARM版本的linux黑客安防渗透系统', 'Kali-ARM', 'private', 'https://www.offensive-security.com/kali-linux-arm-images/', 0);
INSERT INTO `website` VALUES (1375, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-befe1beff31142ab812c1f23b5ef3c4c.png', 0, '针对物联网的一个发行版本', 'Ubuntu Core	Ubuntu', 'private', 'https://ubuntu.com/download/iot/raspberry-pi', 0);
INSERT INTO `website` VALUES (1374, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-1f6ad648a2e84b1fad01896175c6c28b.png', 0, '面向ARM硬件架构的CentOS7系统', 'CentOS-ARM', 'private', 'http://isoredirect.centos.org/altarch/7/isos/armhfp/', 1);
INSERT INTO `website` VALUES (1373, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-68ef884b53e34ef699072c986a50ba5e.png', 0, '微软windows10物联网系统', 'Windows10 IoT', 'private', 'https://developer.microsoft.com/en-us/windows/iot/getstarted', 1);
INSERT INTO `website` VALUES (1372, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-ba3ddad1aa1e457e94fb98fb005cdc4b.png', 0, '树莓派官方推荐的Linux系统', 'Raspbian', 'private', 'https://www.raspberrypi.org/downloads/', 0);
INSERT INTO `website` VALUES (1371, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-f88c6afc8769416a8acf46d15dedd748.png', 0, '英特尔X86迷你主机电脑', '英特尔®NUC', 'private', 'https://www.intel.cn/content/www/cn/zh/products/boards-kits/nuc.html', 0);
INSERT INTO `website` VALUES (1369, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-a0bfedab9fe64e0b992096f1f8e9e083.png', 0, '64位单片机微电脑(支持linux和安卓)', 'PINE64', 'private', 'https://www.pine64.org/', 0);
INSERT INTO `website` VALUES (1370, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-6f768aecaf4d43f0a820685f1cdd2d6d.png', 0, '国内开源的商业单板电脑', '香橙派', 'private', 'http://www.orangepi.cn/', 1);
INSERT INTO `website` VALUES (1368, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-dc1ee44d2d41445fa291b5aa02842470.png', 0, '树莓派笔记本模块化电脑', 'pi-top', 'private', 'https://www.pi-top.com/', 1);
INSERT INTO `website` VALUES (1367, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-f4ae617dfab64318ab46dd3597057a7f.png', 0, 'U盘大小的微型计算机', 'USBArmory', 'private', 'https://inversepath.com/usbarmory', 0);
INSERT INTO `website` VALUES (1366, '2020-01-12 23:04:11', NULL, 0, '国内开源无线创客板', 'NanoPi', 'private', 'http://nanopi.org/', 0);
INSERT INTO `website` VALUES (1365, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-e061f1f3a2864cee9bd5cbcee643392f.png', 0, '超迷你单片机', 'vocore', 'private', 'https://vocore.io/', 0);
INSERT INTO `website` VALUES (1363, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-618bc3512a714129af58ca06a48da9a3.png', 0, '便捷灵活的开发版', 'Arduino', 'private', 'https://www.arduino.cc/', 0);
INSERT INTO `website` VALUES (1364, '2020-01-12 23:04:11', NULL, 0, '国产卡片式微型计算机', '香蕉派', 'private', 'http://www.banana-pi.com/eindex.asp', 0);
INSERT INTO `website` VALUES (1362, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-d1a725bbeb9642e4ac3987dead0284f8.png', 0, '支持Android和Linux双系统开发主板', 'UDOO', 'private', 'https://www.udoo.org/udoo-neo/', 0);
INSERT INTO `website` VALUES (1361, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-4a58961b636e4768a85d7d4a530d6c2f.png', 0, '基于Python的物联网单片机', 'MicroPython', 'private', 'https://micropython.org/', 1);
INSERT INTO `website` VALUES (1359, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-d6a5d3e8be75445db1f9c1b3ce959732.png', 0, '[国内]移动APP推广数据分析平台', 'aso100', 'private', 'https://www.qimai.cn/', 0);
INSERT INTO `website` VALUES (1360, '2020-01-12 23:04:11', 'upload/2020/1/couldr_com_-58c7017b4cb94dc5ac6082bf616a90f9.png', 0, '全球热捧基于ARM的微型电脑主板', '树莓派', 'private', 'https://www.raspberrypi.org', 1);
INSERT INTO `website` VALUES (1358, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-cdf8fac90e204771b371e93f5783d2c5.png', 0, '提升IOS和Andriod排名可见度', 'AsoDesk', 'private', 'https://asodesk.com/', 0);
INSERT INTO `website` VALUES (1357, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-2f0a72d0766c4c078974fb4914ce8cbe.png', 0, 'App Store数据优化工具', 'Apptweak', 'private', 'https://www.apptweak.com/', 0);
INSERT INTO `website` VALUES (1355, '2020-01-12 23:00:51', NULL, 0, '免费的APP Store关键词优化', 'KeywordTool', 'private', 'https://keywordtool.io/app-store', 0);
INSERT INTO `website` VALUES (1356, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-08924c1463754bc189b2292f8c4c3ebd.png', 0, '移动数据分析和优化工具', 'MobileAction', 'private', 'https://www.mobileaction.co/', 0);
INSERT INTO `website` VALUES (1354, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-d5e93428acd64ed784af26d4fcb8346f.png', 0, '移动端APP应用分析和市场数据', 'Appannie', 'private', 'https://www.appannie.com/cn/', 0);
INSERT INTO `website` VALUES (1353, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-3d2be7de6c14433999d6e259c1585845.png', 0, 'UC浏览器移动平台搜索提交入口', '神马搜索收录', 'private', 'https://zhanzhang.sm.cn/', 0);
INSERT INTO `website` VALUES (1352, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-5d1ddcbd1e784b6588a4fca8a7e50c66.png', 0, '搜狗搜索网站提交收录入口', '搜狗收录', 'private', 'http://fankui.help.sogou.com/index.php/web/web/index?type=9', 0);
INSERT INTO `website` VALUES (1351, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-5816c9ce6558400fb72d648078456396.png', 0, '360搜索网站提交收录入口', '360收录', 'private', 'http://info.so.360.cn/site_submit.html', 0);
INSERT INTO `website` VALUES (1350, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-cb13ee83278e492885bd482a5fa91105.png', 0, 'Bing搜索网站提交收录入口', 'Bing收录', 'private', 'https://blogs.bing.com/webmaster/september-2018/Anonymous-URL-Submission-Tool-Being-Retired', 0);
INSERT INTO `website` VALUES (1349, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-9c7eece3bd5748069cfc8e7aae11d906.png', 0, '百度搜索网站提交收录入口', '百度收录', 'private', 'https://ziyuan.baidu.com/linksubmit/url', 0);
INSERT INTO `website` VALUES (1348, '2020-01-12 23:00:51', NULL, 0, 'Google搜索网站提交收录入口[需登录]', 'Google收录', 'private', 'https://www.google.com/webmasters/tools/submit-ur', 0);
INSERT INTO `website` VALUES (1347, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-09c89a101ffe4935a311e2479ecbdd42.png', 0, '阿里人工智能电商Banner广告图制作', '鹿班', 'private', 'https://luban.aliyun.com/', 0);
INSERT INTO `website` VALUES (1346, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-13b18a83b88d4d55b46c1609ea3f1ff8.png', 0, '特赞旗下的营销热点日历', 'Event', 'private', 'https://cal.tezign.com/home', 1);
INSERT INTO `website` VALUES (1345, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-8cef4c1363d0460fbda124dd906ac753.png', 0, '免费H5页面微场景制作工具', '易企秀', 'private', 'http://www.eqxiu.com/', 0);
INSERT INTO `website` VALUES (1343, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-ae08196bba454f0f89e55da3e6163b80.png', 0, '微信公众号编辑器Chrome插件', '壹伴', 'private', 'https://yiban.io/', 0);
INSERT INTO `website` VALUES (1344, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-b3d5f9feadda40debf973e90c1eb18c2.png', 0, 'H5制作及图文排版在线工具', '秀米', 'private', 'https://xiumi.us/#/', 0);
INSERT INTO `website` VALUES (1342, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-ea5c1cf7cd9a45899f669043195c0495.png', 0, '今日头条旗下新兴创作平台', '头条号', 'private', 'https://mp.toutiao.com/auth/page/login/?redirect_url=JTJG', 0);
INSERT INTO `website` VALUES (1341, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-3e01fd0298d442bfa0b38bc5ff0e5ba5.png', 0, '百度旗下自媒体', '熊掌号', 'private', 'https://xiongzhang.baidu.com/id/regid/index?castk=LTE%3D', 0);
INSERT INTO `website` VALUES (1340, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-79cf817ddb014c92ab90518e6797e9bf.png', 0, 'UC旗下自媒体平台', 'UC云观', 'private', 'https://mp.dayu.com/', 0);
INSERT INTO `website` VALUES (1339, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-e4b4b295d8b0466bb37ee0da77e7d8ae.png', 0, '写作与阅读整合一起的博客平台', '简书', 'private', 'https://www.jianshu.com/', 0);
INSERT INTO `website` VALUES (1337, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-908f8c5b95984f01a3657e83cc2a7e78.png', 0, '腾讯订阅、服务号的平台', '微信公众号', 'private', 'https://mp.weixin.qq.com/', 0);
INSERT INTO `website` VALUES (1338, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-fc8dfc60e33f47aa9a17747c6e3a1ac7.png', 0, '知乎随心写作，自由表达平台', '知乎专栏', 'private', 'https://zhuanlan.zhihu.com/', 0);
INSERT INTO `website` VALUES (1336, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-4341510bec7a4398abde7237f7f1d2f5.png', 0, '国内使用较多的问卷调查表', '问卷星', 'private', 'https://www.wjx.cn/', 0);
INSERT INTO `website` VALUES (1335, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-835958af17004932b3bcfb991428290e.png', 0, '简洁易用的表单制作与联系人管理工具', '麦客', 'private', 'http://www.mikecrm.com/', 0);
INSERT INTO `website` VALUES (1334, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-ec545d6acd8a4231b5dac9093fe33ba9.png', 0, '腾讯问卷调查', '腾讯问卷', 'private', 'https://wj.qq.com/', 0);
INSERT INTO `website` VALUES (1333, '2020-01-12 23:00:51', NULL, 0, 'Google创建调查问卷和分析结果', 'Google表单', 'private', 'https://www.google.com/intl/zh-CN/forms/about/', 0);
INSERT INTO `website` VALUES (1331, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-0633a5845b704d39b31d5f0f18ffbf94.png', 0, '可编辑web数据可视化', 'Datamatic', 'private', 'https://datamatic.io/', 1);
INSERT INTO `website` VALUES (1332, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-4b1fd6854b454c1a8380271dec03c03e.png', 0, '全球著名的在线问卷调查服务', 'SurveyMonkey', 'private', 'https://www.surveymonkey.com/', 0);
INSERT INTO `website` VALUES (1330, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-a88d2f6a75b9439aa7b94c6852a3270b.png', 0, '现代炫酷的商业数据可视化科学', 'Plotly', 'private', 'https://plot.ly/', 0);
INSERT INTO `website` VALUES (1329, '2020-01-12 23:00:51', NULL, 0, '百度数据可视化', 'Echarts', 'private', 'https://www.echartsjs.com/zh/index.html', 0);
INSERT INTO `website` VALUES (1328, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-00dbff87da23493293c26b0c16a30e7a.png', 0, '在线地图可视化应用', 'Pixelmap', 'private', 'https://pixelmap.amcharts.com/', 0);
INSERT INTO `website` VALUES (1327, '2020-01-12 23:00:51', NULL, 0, '蚂蚁金服专业数据可视化规范', 'Antv', 'private', 'https://antv.alipay.com/zh-cn/index.html', 1);
INSERT INTO `website` VALUES (1325, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-a5bf3e9a5baa4d07b573b87b2c197a4d.png', 0, '移动端APP应用分析和市场数据', 'Appannie', 'private', 'https://www.appannie.com/cn/', 0);
INSERT INTO `website` VALUES (1326, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-13e6c638a9d5457887814553bcbe2f88.png', 0, '好用的网站排名丨流量数据分析', 'Similarweb', 'private', 'https://www.similarweb.com/', 0);
INSERT INTO `website` VALUES (1324, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-452a1fc4b09046bdaf899f13a4f41382.png', 0, '互联网网站的世界排名', 'Alexa排名', 'private', 'https://www.alexa.com/', 0);
INSERT INTO `website` VALUES (1323, '2020-01-12 23:00:51', NULL, 0, '能查找到网页历史缓存界面', 'Archive', 'private', 'https://archive.org/web/', 0);
INSERT INTO `website` VALUES (1322, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-0aba7ba8c1224bf2821b66afef43c423.png', 0, '站长工具数据查询网站', '站长工具', 'private', 'http://tool.chinaz.com/', 0);
INSERT INTO `website` VALUES (1321, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-5ae32f6ebda14a64a1b0e7f90861546b.png', 0, '查找企业信息资质', '天眼查', 'private', 'https://www.tianyancha.com/', 0);
INSERT INTO `website` VALUES (1320, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-69ccf2f0e77e48b48eb8109af834fe2e.png', 0, '电商行业价格、供应、采购趋势分析', '阿里指数', 'private', 'https://login.taobao.com/member/login.jhtml?redirectURL=http%3A%2F%2Falizs.taobao.com%2F', 0);
INSERT INTO `website` VALUES (1319, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-2c90a2c07d564234a8fc535a3f1ce003.png', 0, '百度互联网数据分享平台', '百度指数', 'private', 'http://index.baidu.com/v2/index.html#/', 0);
INSERT INTO `website` VALUES (1318, '2020-01-12 23:00:51', NULL, 0, 'google数据和图表了解全球热度', 'Google趋势', 'private', 'https://trends.google.com/trends/?geo=US', 0);
INSERT INTO `website` VALUES (1317, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-bb31b0e7d1b94c7994ade16d37f6d1e8.png', 0, '简约强大的极客域名查询购买', 'ZEIT', 'private', 'https://zeit.co/', 0);
INSERT INTO `website` VALUES (1315, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-272ee6610365419bb061f8ad3b535c68.png', 0, '提供各大服务商域名价格对比', 'Domcomp', 'private', 'https://www.domcomp.com/', 0);
INSERT INTO `website` VALUES (1316, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-eb9ee1e8431c4a5aa92361d8d4fc76db.png', 0, '全球首家表情域名注册', 'Emoji域名', 'private', 'https://xn--i-7iq.ws/', 0);
INSERT INTO `website` VALUES (1314, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-5c3cf1b9d3504d798169e6e4d49acbb9.png', 0, '中国最大的域名交易平台', '易名中国', 'private', 'https://www.ename.com/', 1);
INSERT INTO `website` VALUES (1313, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-faf497ae4cfa4053b5565368c4a81371.png', 0, '国外国别后缀最多的域名提供商', 'Gandi', 'private', 'https://www.gandi.net/zh-hans', 0);
INSERT INTO `website` VALUES (1312, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-c4b5f211638f4230ab9d4b09d683b361.png', 0, '强大简洁的域名多后缀搜索', 'Domainr', 'private', 'https://domainr.com/', 0);
INSERT INTO `website` VALUES (1311, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-73ea1ef2916543d4aa4e234302d1ae77.png', 0, '提供永久的免费域名隐私保护', 'Namesilo', 'private', 'https://www.namesilo.com/', 0);
INSERT INTO `website` VALUES (1309, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-f7683ccf351d4a55878e24d9d6b103a7.png', 0, '美国老牌全球最大的域名服务商', 'Godaddy', 'private', 'https://sg.godaddy.com/zh', 0);
INSERT INTO `website` VALUES (1310, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-4f02aaf69ef34a32ab6670f7bdc0e05b.png', 0, '优惠比较多的域名品牌商', 'Namecheap', 'private', 'https://www.namecheap.com/', 0);
INSERT INTO `website` VALUES (1308, '2020-01-12 23:00:51', 'upload/2020/1/couldr_com_-a6bc5be5f27e40ceb58e905938936fe9.png', 0, '中国域名主流服务提供商', '阿里万网', 'private', 'https://wanwang.aliyun.com/', 0);
INSERT INTO `website` VALUES (1307, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-27205ccb1acb487faa9dcc61699c9ae5.png', 0, '日文的开发者技能分享，知识交流社区', 'Qiita', 'private', 'https://qiita.com/', 0);
INSERT INTO `website` VALUES (1305, '2020-01-12 22:57:32', NULL, 0, '在线编辑、分享JavaScript代码社区', 'RunJS', 'private', 'https://runjs.cn/', 0);
INSERT INTO `website` VALUES (1306, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c3c9d28da2144ddebc16878fd73b59db.png', 0, '武汉光谷互联网IT社区', '光谷社区', 'private', 'http://www.guanggoo.com/', 0);
INSERT INTO `website` VALUES (1304, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-4e470ebaa2984f9b82e3a73b26c947e6.png', 0, 'web前端开发资源库', 'awesomes', 'private', 'https://www.awesomes.cn/', 0);
INSERT INTO `website` VALUES (1303, '2020-01-12 22:57:32', NULL, 0, '开发者交流分享社区', 'Coding冒泡', 'private', 'https://coding.net/pp', 0);
INSERT INTO `website` VALUES (1301, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-76a554d7a49e46f78034ae3552922ceb.png', 0, '致力于构建开发工程师社区', 'DiyCode', 'private', 'https://www.diycode.cc/', 0);
INSERT INTO `website` VALUES (1300, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-6240f92d64504eaebb63f5d8786f72de.png', 0, 'PHP和Laravel开发者社区', 'LaravelChina', 'private', 'https://learnku.com/laravel', 0);
INSERT INTO `website` VALUES (1298, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-d28e582b48304984acc8d8b5c4a5d5ff.png', 0, '目前国内最大的开源技术社区', '开源中国', 'private', 'https://www.oschina.net/', 0);
INSERT INTO `website` VALUES (1299, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-f3776d5e99a84f13b8808b4d40405659.png', 0, '高质量的技术社区', '掘金', 'private', 'https://juejin.im/', 0);
INSERT INTO `website` VALUES (1297, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-1a29266a98194ff99f0edabaca836dd2.png', 0, '面向开源及私有软件项目的托管平台', 'Github', 'private', 'https://github.com/', 0);
INSERT INTO `website` VALUES (1296, '2020-01-12 22:57:32', NULL, 0, 'HackerNews黑客极客社区', 'HackerNews', 'private', 'https://news.ycombinator.com/', 0);
INSERT INTO `website` VALUES (1294, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-8c2491c396c74de2aa9ba61b5c9b1b55.png', 0, '全球专业的程序员IT技术问答社区', 'Stackoverflow', 'private', 'https://stackoverflow.com/', 0);
INSERT INTO `website` VALUES (1295, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-b906ad2eada84d65862b8489bd3a94f5.png', 0, '全球著名的前端图标字体库', 'Fontawesome', 'private', 'https://fontawesome.com/', 0);
INSERT INTO `website` VALUES (1293, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-9516bdda483a4f0f9b22cd4bd97d68d1.png', 0, 'js专业中文社区', 'cnode', 'private', 'https://cnodejs.org/', 0);
INSERT INTO `website` VALUES (1291, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c4c3178a37e64886872faf681ebc3289.png', 0, '优秀的CSS前端技术分享博客', 'CSS-Tricks', 'private', 'https://css-tricks.com/', 1);
INSERT INTO `website` VALUES (1292, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-61936b0aad064ab3a54482f282899b91.png', 0, 'IT创意工作者社区', 'V2EX', 'private', 'https://www.v2ex.com/', 1);
INSERT INTO `website` VALUES (1290, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-b14ad5a3e6984be5b57124c2ad0421a6.png', 0, 'web网站技术调查报告', 'w3techs', 'private', 'https://w3techs.com/', 0);
INSERT INTO `website` VALUES (1289, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-436a9a58515d40afa5ec8b616268bb01.png', 0, '编程教育而设计的微电脑', '树莓派', 'private', 'https://www.raspberrypi.org/', 0);
INSERT INTO `website` VALUES (1287, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-cc6c136e80af4416b6d77bac764f9f9d.png', 0, 'HTML5的web浏览技术图谱', 'html5 Platform', 'private', 'https://platform.html5.org/', 0);
INSERT INTO `website` VALUES (1288, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-3f4298e0edaf421d81e109ca798c8c05.png', 0, '为开发者设计的一套免费开源图标库', '草莓图标', 'private', 'http://chuangzaoshi.com/icon/', 0);
INSERT INTO `website` VALUES (1286, '2020-01-12 22:57:32', NULL, 0, '在线CSS前端代码Demo样式效果', 'CSSDeck', 'private', 'http://cssdeck.com/', 0);
INSERT INTO `website` VALUES (1285, '2020-01-12 22:57:32', NULL, 0, '特殊符号大全表', 'copypastecharacter', 'private', 'https://www.copypastecharacter.com/', 0);
INSERT INTO `website` VALUES (1284, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-3697bae00ebd4ad3bf77ae81cf8c6cbc.png', 0, '提供HMTL的特殊符号', 'htmlarrows', 'private', 'https://www.toptal.com/designers/htmlarrows/', 0);
INSERT INTO `website` VALUES (1282, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-95e30103def9431e9a85160076a640be.png', 0, '采集有趣的网站UI代码片段', 'codemyui', 'private', 'https://codemyui.com/', 1);
INSERT INTO `website` VALUES (1280, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-8813fb15675a4fa9b6fbec5d8f0d59fc.png', 0, 'SVG动效的JS库', 'SnapSVG', 'private', 'http://snapsvg.io/', 0);
INSERT INTO `website` VALUES (1281, '2020-01-12 22:57:32', NULL, 0, '在线实时JS测试编程', 'Jsfiddle', 'private', 'https://jsfiddle.net/', 0);
INSERT INTO `website` VALUES (1279, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-555df749d2f346c9af01c27e6671f856.png', 0, '微信官方小程序UI样式库', 'WEUI', 'private', 'https://weui.io/', 0);
INSERT INTO `website` VALUES (1278, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-66de5215e4ab40b2b894c0ca9dc42321.png', 0, '力荐：精品编程教程技术大牛博客', '廖雪峰', 'private', 'https://www.liaoxuefeng.com/', 0);
INSERT INTO `website` VALUES (1276, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-5520a4a5bd6d4bdb922254d0223ac912.png', 0, '每天一条JS小知识点', 'Jstips', 'private', 'http://www.jstips.co/', 0);
INSERT INTO `website` VALUES (1277, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-5c1c27d45110413383beb25efe3951df.png', 0, '国外程序编程直播平台', 'LiveEdu', 'private', 'https://www.education-ecosystem.com/', 0);
INSERT INTO `website` VALUES (1275, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-02d0300af615433c80c52541ea7f73ef.png', 0, '适用于初级的免费游戏式编程教学', 'CODE', 'private', 'https://code.org/', 0);
INSERT INTO `website` VALUES (1274, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-0343f7de16e447a9a090a03a97286a8d.png', 0, '著名的非营利在线教育网站', '可汗学院', 'private', 'https://www.khanacademy.org/', 0);
INSERT INTO `website` VALUES (1273, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-329d552b7867485fb14f9f6d55356fdf.png', 0, '发布Web标准有关的最新以及高品质信息', 'webplatform', 'private', 'https://webplatform.github.io/', 0);
INSERT INTO `website` VALUES (1272, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-0871fe517e09465db93291eebf540aa0.png', 0, '开发者网络(MDN)提供有关开放网络技术', 'mozilla开发者', 'private', 'https://developer.mozilla.org/zh-CN/', 0);
INSERT INTO `website` VALUES (1271, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-297e27117e414fdfa0a460b06b4b8325.png', 0, '传授硅谷的名企官方课程', 'udacity', 'private', 'https://cn.udacity.com/', 0);
INSERT INTO `website` VALUES (1269, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-3400be29f85d4594bab81f0777ed8c1a.png', 0, '非常棒的免费的CSS属性指导手册', 'CSS Reference', 'private', 'https://cssreference.io/', 0);
INSERT INTO `website` VALUES (1270, '2020-01-12 22:57:32', NULL, 0, '在线趣味互动模式编程学习平台', 'CodeCademy', 'private', 'https://www.codecademy.com/', 0);
INSERT INTO `website` VALUES (1268, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-b67d652bd55d454a8c82aac67deae44f.png', 0, '编程入门学习及技术文档查询网站', 'w3school中文', 'private', 'https://www.w3school.com.cn/', 0);
INSERT INTO `website` VALUES (1267, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-fa23676b87c84aef9a2d1136976f46fe.png', 0, '一款很棒的编程学习APP', 'Mimo APP', 'private', 'https://getmimo.com/', 0);
INSERT INTO `website` VALUES (1265, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-362e7d9f5f18427682707e0cdc1a2e75.png', 0, 'facebook出品新型包管理器', 'Yarn', 'private', 'https://yarnpkg.com/zh-Hans/', 0);
INSERT INTO `website` VALUES (1266, '2020-01-12 22:57:32', NULL, 0, 'facebook出品新型包管理器', 'Animista', 'private', 'http://animista.net/', 0);
INSERT INTO `website` VALUES (1264, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-19c1cd9b789a4fe680e54a4d6b612366.png', 0, '用于前端开发的开源工具包', 'Bootstrap', 'private', 'https://getbootstrap.com/', 0);
INSERT INTO `website` VALUES (1263, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c77c331b3be046cea3abca577e6d43ca.png', 0, '客户端技术的软件包管理器', 'Bower', 'private', 'https://bower.io/', 0);
INSERT INTO `website` VALUES (1261, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-7f5709af6fa145a89c5272fd7f671f2d.png', 0, 'CSS各种对象样式和效果在线生成', 'CSSgenerator', 'private', 'https://cssgenerator.org/', 0);
INSERT INTO `website` VALUES (1262, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-be038c9f08e14e56a7cef739d874fdd4.png', 0, 'CSS3动效预设收藏集合', 'AniCollection', 'private', 'https://anicollection.github.io/', 0);
INSERT INTO `website` VALUES (1260, '2020-01-12 22:57:32', NULL, 0, '前端炫酷样式技能效果', 'codepen', 'private', 'https://codepen.io/', 0);
INSERT INTO `website` VALUES (1259, '2020-01-12 22:57:32', NULL, 0, 'CSS/JS炫酷前端动效', 'Navnav', 'private', 'https://navnav.co/', 0);
INSERT INTO `website` VALUES (1257, '2020-01-12 22:57:32', NULL, 0, '一款强大的预设css3动画库', 'AnimateCss', 'private', 'https://daneden.github.io/animate.css/', 0);
INSERT INTO `website` VALUES (1256, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-ac808bbb87a64017bda65705eee4cc68.png', 0, 'font-face网页字体文件格式转换', 'Everythingfonts', 'private', 'https://everythingfonts.com/font-face', 0);
INSERT INTO `website` VALUES (1255, '2020-01-12 22:57:32', NULL, 0, '将字体转成网页webfont专用字体', 'FontConverter', 'private', 'http://www.freefontconverter.com/', 0);
INSERT INTO `website` VALUES (1254, '2020-01-12 22:57:32', NULL, 0, 'CSS贝塞尔动画在线调试工具', 'Ceaser', 'private', 'https://matthewlein.com/tools/ceaser', 0);
INSERT INTO `website` VALUES (1253, '2020-01-12 22:57:32', NULL, 0, 'CSS3贝塞尔曲线在线调试工具', 'CubicBezier', 'private', 'https://cubic-bezier.com/#.17,.67,.83,.67', 0);
INSERT INTO `website` VALUES (1251, '2020-01-12 22:57:32', NULL, 0, 'CSS动态效果样式在线自定义', 'Animista', 'private', 'http://animista.net/', 0);
INSERT INTO `website` VALUES (1252, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-4b10ed84ee3844e3a56b0901ae16e6c0.png', 0, '先进的CSS3可视化在线编程', 'EnjoyCSS', 'private', 'https://enjoycss.com/LnM/4/code/#transform', 0);
INSERT INTO `website` VALUES (1250, '2020-01-12 22:57:32', NULL, 0, '一个超棒的CSS属性排序工具', 'CSScomb', 'private', 'https://park.zunmi.cn/?acct=1223&site=csscomb.com', 0);
INSERT INTO `website` VALUES (1249, '2020-01-12 22:57:32', NULL, 0, '一款简单前端在线编辑器', 'Dabblet', 'private', 'http://dabblet.com/', 0);
INSERT INTO `website` VALUES (1248, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-ad29d0590ea34c0caa860de0c7ff2022.png', 0, 'CSS按钮样式在线生成', 'CSS按钮生成', 'private', 'http://www.cssbuttongenerator.com/', 0);
INSERT INTO `website` VALUES (1246, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-e01f22361ad745c18b4bbb8cbfa4923e.png', 0, '模拟生成JSON数据', 'json-generator', 'private', 'http://jsongenerator.com/', 0);
INSERT INTO `website` VALUES (1247, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-5e77474374dd44b29b6662e9b65a6478.png', 0, 'JS和CSS的代码片段在线调试', 'Jsbin', 'private', 'http://jsbin.com/', 0);
INSERT INTO `website` VALUES (1245, '2020-01-12 22:57:32', NULL, 0, 'css三角形样式在线生成', 'CSS triangle', 'private', 'http://apps.eky.hk/css-triangle-generator/', 0);
INSERT INTO `website` VALUES (1243, '2020-01-12 22:57:32', NULL, 0, '在线实时编程预览', 'CodeCast', 'private', 'http://codecast.me/launch/', 0);
INSERT INTO `website` VALUES (1244, '2020-01-12 22:57:32', NULL, 0, '在线实时JS测试编程', 'Jsfiddle', 'private', 'https://jsfiddle.net/', 0);
INSERT INTO `website` VALUES (1242, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-486c8b8ebf3641d4abd29b4c48cdaed8.png', 0, 'JS管理包及强大的构建工具', 'Npmjs', 'private', 'https://www.npmjs.com/', 0);
INSERT INTO `website` VALUES (1240, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-defe8a094aee4cf6a052d5b2eba41aac.png', 0, '前端构建脚手架', 'Yeoman', 'private', 'https://yeoman.io/', 0);
INSERT INTO `website` VALUES (1241, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-680a067f799c42358deb11caae0bd574.png', 0, '模块加载器兼打包工具', 'webpack', 'private', 'https://webpack.github.io/', 0);
INSERT INTO `website` VALUES (1232, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-2b00d1e5abcc4c4688ca94fd51c0c50f.png', 0, '开放源代码软件开发平台和仓库', 'Sourceforge', 'private', 'https://sourceforge.net/', 0);
INSERT INTO `website` VALUES (1231, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-f741a33a642445b5837f5ee9049ab8c7.png', 0, '采用Mercurial和Git的分布式版本控制', 'Bitbucket', 'private', 'https://bitbucket.org/', 0);
INSERT INTO `website` VALUES (1230, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-595a7f192a664e76a9658b108e103c04.png', 0, '免费无限制的开源及私有项目托管', 'gitlab', 'private', 'https://about.gitlab.com/', 0);
INSERT INTO `website` VALUES (1229, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c000ad63b7774ec7855eca172e020a8f.png', 0, '全球知名的开源及私有项目托管平台', 'Github', 'private', 'https://github.com/', 0);
INSERT INTO `website` VALUES (1227, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-a554e4480195405fbc0c3c6c45ef8563.png', 0, 'Node.js构建的开源博客平台', 'Ghost', 'private', 'https://ghost.org/', 0);
INSERT INTO `website` VALUES (1228, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-e4ae1c7686654886872298afa33f18b4.png', 0, '免费的响应式商业化建站方案', 'Wix', 'private', 'https://zh.wix.com/', 0);
INSERT INTO `website` VALUES (1226, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-817b3c41cd8b4dc98a44ee813226f69a.png', 0, '简单静态网页博客程序', 'Jekyll', 'private', 'https://jekyllrb.com/', 0);
INSERT INTO `website` VALUES (1224, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-e1a998ae9951481eb455bef9b3b84102.png', 0, '轻量级博客程序', 'Typecho', 'private', 'http://typecho.org/', 0);
INSERT INTO `website` VALUES (1225, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-26680ebd7ffa4ee29a1d80a138358aad.png', 0, 'Github旗下免费的无限流量博客', 'Gitpage', 'private', 'https://pages.github.com/', 0);
INSERT INTO `website` VALUES (1223, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-6861b4425bca442ebd40364811d7bfa4.png', 0, '比较极客的简洁轻便的博文平台', 'Hexo', 'private', 'https://hexo.io/', 0);
INSERT INTO `website` VALUES (1222, '2020-01-12 22:57:32', NULL, 0, '优雅简洁漂亮的轻论坛系统', 'Flarum', 'private', 'https://flarum.org/', 0);
INSERT INTO `website` VALUES (1220, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-e5dd4bf90b1c43258c5123d978cbc98a.png', 0, 'Java 开发的博客系统', 'Halo', 'private', 'https://github.com/halo-dev/halo', 0);
INSERT INTO `website` VALUES (1221, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-4a211b063fa14bbb858a5a6416f27f6a.png', 0, '功能强大的内容管理系统', 'Wordpress', 'private', 'https://wordpress.org/', 0);
INSERT INTO `website` VALUES (1219, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-d385c630eb684e4e93ee96f855a196d0.png', 0, '一套基于 Vue.js 的高质量 UI 组件库', 'iView', 'private', 'https://www.iviewui.com/', 0);
INSERT INTO `website` VALUES (1218, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-55dd34bded2c46fd96c2d3e9b2118d2b.png', 0, '腾讯旗下团队 web UI解决方案', 'QMUIweb', 'private', 'https://qmuiteam.com/web/page/index.html', 0);
INSERT INTO `website` VALUES (1216, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-7dd5e94788a34892b5c317ba0e6f3c5f.png', 0, '基于Vue和 Weui的移动端框架', 'vux', 'private', 'https://vux.li/', 0);
INSERT INTO `website` VALUES (1217, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-754c4c56a76140bbbbb43c8f4718783d.png', 0, '腾讯旗下团队 IOS UI解决方案', 'QMUIios', 'private', 'https://qmuiteam.com/ios', 0);
INSERT INTO `website` VALUES (1215, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-4c6c41753f91451f92fd61bc61caf963.png', 0, '面向前后端程序员的模块化前端框架', 'layui', 'private', 'https://www.layui.com/', 0);
INSERT INTO `website` VALUES (1214, '2020-01-12 22:57:32', NULL, 0, '轻量级的Material Design前端框架', 'MDUI', 'private', 'https://www.mdui.org/docs/', 0);
INSERT INTO `website` VALUES (1213, '2020-01-12 22:57:32', NULL, 0, '轻量灵活的移动端 CSS 框架', 'Mobi.css', 'private', 'http://getmobicss.com/', 0);
INSERT INTO `website` VALUES (1212, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-902ca495c6874a37a05ce5b2fa775b9e.png', 0, '各大平台浏览器兼容性在线测试', 'Browser Sandbox', 'private', 'https://turbo.net/browsers', 0);
INSERT INTO `website` VALUES (1210, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-b525e2706f4a462b809df26c82658cc8.png', 0, 'W3C的CSS有效性验证', 'CSS validator', 'private', 'https://jigsaw.w3.org/css-validator/', 0);
INSERT INTO `website` VALUES (1209, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-3e2f7536454447f1847a2c3eea986714.png', 0, 'W3C的HTML有效性验证', 'HTML validator', 'private', 'https://validator.w3.org/', 0);
INSERT INTO `website` VALUES (1207, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-fe129e41e00447d598cf5149ba4c9817.png', 0, '网站在线性能测试分析、优化建议', 'Gtmetrix', 'private', 'https://gtmetrix.com/', 0);
INSERT INTO `website` VALUES (1208, '2020-01-12 22:57:32', NULL, 0, 'Google在线性能测试网站、优化建议', 'PageSpeed', 'private', 'https://developers.google.com/speed', 0);
INSERT INTO `website` VALUES (1205, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-bee297b8e11542b397884aa9ac2bf8aa.png', 0, '免费强大的HTTP调试抓包代理软件', 'Fiddler', 'private', 'https://www.telerik.com/fiddler', 0);
INSERT INTO `website` VALUES (1206, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c06bc812a1ac49caa320f359d514b319.png', 0, '一款强大的网页HTTP数据分析软件', 'HttpWatch', 'private', 'https://www.httpwatch.com/', 0);
INSERT INTO `website` VALUES (1203, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-1588b191e8d643c0add964ab2626d63a.png', 0, '应用最广泛的商业Linux系统', 'Redhat', 'private', 'https://www.redhat.com/en', 0);
INSERT INTO `website` VALUES (1204, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-6bed6237bd36465ea1d40b0475c9d7a2.png', 0, 'Redhat内核开源免费的linux系统', 'Centos', 'private', 'https://www.centos.org/', 0);
INSERT INTO `website` VALUES (1189, '2020-01-12 22:57:32', NULL, 0, '扁平化多彩风格UI', 'Flat UI', 'private', 'https://designmodo.github.io/Flat-UI/', 0);
INSERT INTO `website` VALUES (1190, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-f5e45442f94446289ba3561cf8d3fa07.png', 0, '轻型响应式CSS框架', 'Pure', 'private', 'https://purecss.io/', 0);
INSERT INTO `website` VALUES (1191, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-6180f76cfc154d2c8c1944c4ae6259ef.png', 0, '语义化设计的前端开源框架', 'Semantic UI', 'private', 'https://semantic-ui.com/', 0);
INSERT INTO `website` VALUES (1192, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-01850eb4af7140d38f8075aa99021dfa.png', 0, '饿了么出品基于Vue2.0前端组件库', 'Element', 'private', 'https://element.eleme.io/#/zh-CN', 0);
INSERT INTO `website` VALUES (1193, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-76715e776794454a96c91363d0de016c.png', 0, '蚂蚁金服的UI设计语言', 'AntDesign', 'private', 'https://ant.design/index-cn', 0);
INSERT INTO `website` VALUES (1194, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-87403a3711444fd49d2b9a3bb4876859.png', 0, 'Bootstrap中文爱好者网站', 'Bootcss', 'private', 'https://www.bootcss.com/', 0);
INSERT INTO `website` VALUES (1195, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-e0160592247d43d4b3d5683174e10379.png', 0, 'CSS一种动态样式预处理语言', 'Less', 'private', 'http://lesscss.org/', 0);
INSERT INTO `website` VALUES (1196, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-8cd13b775c3f4b1b9f49ef46ee2c1fb7.png', 0, 'Web应用程序开发的MVC框架', 'Emberjs', 'private', 'https://emberjs.com/', 0);
INSERT INTO `website` VALUES (1197, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-f9463a0e79a34f2b8683838593c72e99.png', 0, 'javaScript客户端框架', 'Aurelia', 'private', 'https://aurelia.io/', 0);
INSERT INTO `website` VALUES (1198, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-7e5801871370476f9b05650972c56bdf.png', 0, '一套简洁优雅的PHP Web开发框架', 'Laravel', 'private', 'https://laravel.com/', 0);
INSERT INTO `website` VALUES (1199, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-0f89c1bc2a964f81bcbd5a2e38d47dcd.png', 0, 'Google跨平台(iOS和Android)原生应用UI框架', 'Flutter', 'private', 'https://flutter.dev/', 0);
INSERT INTO `website` VALUES (1200, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c33c8ad9aa714cd6b6eb476c4cb508a5.png', 0, '优雅的前端组件开发库', 'StoryBook', 'private', 'https://storybook.js.org/', 0);
INSERT INTO `website` VALUES (1201, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-c616b961af2b4279a2ea2d2a1f3069a8.png', 0, '以桌面应用为主的开源Linux操作系统', 'ubuntu', 'private', 'https://cn.ubuntu.com/', 0);
INSERT INTO `website` VALUES (1202, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-d0ff24f86b8742d192f47917945a60fe.png', 0, '最遵GNU规范的开源Linux系统', 'Debian', 'private', 'https://www.debian.org/', 0);
INSERT INTO `website` VALUES (1187, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-d813baeeecb74a659a1c6298d7a3bb74.png', 0, 'Google官方轻量级MaterialDesignLite版', 'MaterialDesignLite', 'private', 'https://getmdl.io/', 0);
INSERT INTO `website` VALUES (1188, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-d83c59c8817d46dfbe7b4cf7920e4005.png', 0, 'Google官方MaterialDesign指南', 'MaterialDesign', 'private', 'https://material.io/design/', 0);
INSERT INTO `website` VALUES (1185, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-7e6fac90e28d481fbe0dcf83107d644f.png', 0, '小巧精致,渐进式JavaScript 框架', 'Vuejs', 'private', 'https://cn.vuejs.org/', 0);
INSERT INTO `website` VALUES (1186, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-3c3cf1ff616f47b8b2353099d32727f4.png', 0, '世界级强大的专业CSS扩展语言', 'Sass', 'private', 'https://sass-lang.com/', 0);
INSERT INTO `website` VALUES (1173, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4ad36a541ee34012ac392e9adb2e22ca.png', 0, '国内UI设计垂直社区', 'UI中国', 'private', 'https://www.ui.cn/', 0);
INSERT INTO `website` VALUES (1174, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7b78cc2cd8d44bf6ba9040447ae3c1b4.png', 0, '游戏类UI设计师作品展示与交流平台', 'Game UI', 'private', 'http://www.gameui.cn/', 0);
INSERT INTO `website` VALUES (1175, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-abac0212ac084c2b95684a9c966f12aa.png', 0, '原画、插画、CG交流社区', 'CG部落', 'private', 'http://www.cgbolo.com/', 0);
INSERT INTO `website` VALUES (1176, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f9eabe09df414f5a8d1543ded498895d.png', 0, '中国字体品牌设计师交流网', '字体传奇网', 'private', 'http://www.ziticq.com/', 0);
INSERT INTO `website` VALUES (1177, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e694342c6cef42eb8c8976ede331e101.png', 0, '国内工业设计师交流展示平台', '普象网', 'private', 'https://www.puxiang.com/', 0);
INSERT INTO `website` VALUES (1178, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7903fac105fe4e929d3f1a367bab6697.png', 0, '在线技能学习社区', 'Skillshare', 'private', 'https://www.skillshare.com/', 0);
INSERT INTO `website` VALUES (1179, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-83802be5a09a4a6aa5d542b06fa7e706.png', 0, '国内原创绘画社交网站', '涂鸦王国', 'private', 'https://gracg.com/', 0);
INSERT INTO `website` VALUES (1180, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-8daff98544814a00ab79805ca820df03.png', 0, 'facebook强大的JavaScript框架', 'React', 'private', 'https://reactjs.org/', 0);
INSERT INTO `website` VALUES (1181, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-0c9a1091c279498591563baba00a44dd.png', 0, 'Google开发的前端技术框架', 'Angularjs', 'private', 'https://angularjs.org/', 0);
INSERT INTO `website` VALUES (1182, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-f6df9b638f604320bbab6d4a53958d47.png', 0, '一个快速、简洁的JavaScript框架', 'Jquery', 'private', 'https://jquery.com/', 0);
INSERT INTO `website` VALUES (1183, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-ee86fde809144ea5ade7e530b0e01c11.png', 0, '高级响应式前端框架', 'Foundation', 'private', 'https://foundation.zurb.com/', 0);
INSERT INTO `website` VALUES (1184, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-0cc18073c04646409d1f6e5ee8341daa.png', 0, '一组反应元件，实现谷歌的材料设计', 'Material UI', 'private', 'https://material.io/design/', 0);
INSERT INTO `website` VALUES (1172, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-bbd062acc2b44e9ba06019ff64b0159f.png', 0, 'WEB设计开发杂志博客', 'Smashing', 'private', 'https://www.smashingmagazine.com/', 0);
INSERT INTO `website` VALUES (1170, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-073c87ba4b184c9bbe37ab13e04678b1.png', 0, '话题非常广的设计师FM播客', '异能电台', 'private', 'https://www.yineng.fm/', 0);
INSERT INTO `website` VALUES (1171, '2020-01-12 22:48:47', NULL, 0, '卡通角色插画设计教程(YouTube频道)', 'Gigantic', 'private', 'https://www.youtube.com/channel/UCX4mqbvv5lGqLpI4FYlJt4w/videos', 0);
INSERT INTO `website` VALUES (1168, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-2909770a3b2a438a8961434d6d3bc672.png', 0, '网页设计教程和文章学习平台', 'webdesignerdepot', 'private', 'https://www.webdesignerdepot.com/', 0);
INSERT INTO `website` VALUES (1169, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7e223f0abe93430e9dfdc490cb5dfbc3.png', 0, '专注于Text文字特效教程收录', 'Textuts', 'private', 'https://textuts.com/', 0);
INSERT INTO `website` VALUES (1156, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-407221f6912a4ad8bc94ca059f2c64b6.png', 0, '在视觉和界面领域比较有名的工作者', 'Tubik Studio', 'private', 'https://tubikstudio.com/', 0);
INSERT INTO `website` VALUES (1157, '2020-01-12 22:48:47', NULL, 0, 'Facebook设计团队网站', 'Facebook Design', 'private', 'https://facebook.design/', 0);
INSERT INTO `website` VALUES (1158, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-857149d476124966b8ca70bd850a3023.png', 0, '创新型用户体验设计公司', '大邦创新', 'private', 'http://www.bigbang-consulting.com/', 0);
INSERT INTO `website` VALUES (1159, '2020-01-12 22:48:47', NULL, 0, '国外精美的设计文章欣赏', 'Medium', 'private', 'https://medium.design/', 0);
INSERT INTO `website` VALUES (1160, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4cdceffdab59465d8e2dca4a24f5f36b.png', 0, 'sketch中国资源插件分享社区', 'sketchchina', 'private', 'http://www.sketchchina.com/', 0);
INSERT INTO `website` VALUES (1161, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-46dd5ac12b3b4d44ae8f59a4d28b810a.png', 0, '设计经验、历程杂谈的一款播客节目', 'AnywayFM', 'private', 'https://anyway.fm/', 0);
INSERT INTO `website` VALUES (1162, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-47e4e0ad7ab9440ca80cc97d9d6de7ca.png', 0, '国内设计师教程分享文章', '优设', 'private', 'https://www.uisdc.com/', 0);
INSERT INTO `website` VALUES (1163, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b0747984862d40abb1523baaaf135746.png', 0, 'Envato时尚设计效果教程', 'Envato教程', 'private', 'https://design.tutsplus.com/tutorials', 0);
INSERT INTO `website` VALUES (1164, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-cac1db8be5d748389f2bcd2a9b7fa0f5.png', 0, '关注产品设计和注用户体验FM播客', 'UX Coffee', 'private', 'https://uxcoffee.com/', 0);
INSERT INTO `website` VALUES (1165, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-d9c9a80ffde54eef84312b1a6b7ce6d2.png', 0, '华语字体排印主题FM播客节目', '字谈字畅', 'private', 'https://www.lizhi.fm/user/14363280', 0);
INSERT INTO `website` VALUES (1166, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-29b661e944a14d1c909ef970be0098b6.png', 0, 'JJYing的界面设计个人博客', '图月志', 'private', 'http://iconmoon.com/blog2/', 0);
INSERT INTO `website` VALUES (1167, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e3bec77e398b4cada54e362f8752600f.png', 0, '设计师和前端开发者的美文收录', 'Heydesigner', 'private', 'https://heydesigner.com/', 0);
INSERT INTO `website` VALUES (1155, '2020-01-12 22:48:47', NULL, 0, '京东设计中心', 'JDC', 'private', 'https://jdc.jd.com/', 0);
INSERT INTO `website` VALUES (1153, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b6462b259b2b43f9a71c5bd6c475e2e8.png', 0, '腾讯游戏官方设计团队', 'Tgideas', 'private', 'https://tgideas.qq.com/', 0);
INSERT INTO `website` VALUES (1154, '2020-01-12 22:48:47', NULL, 0, '360UXC用户体验设计中心', '360UXC', 'private', 'http://uxc.360.cn/', 0);
INSERT INTO `website` VALUES (1151, '2020-01-12 22:48:47', NULL, 0, '百度用户体验中心', '百度MUX', 'private', 'http://eux.baidu.com/', 0);
INSERT INTO `website` VALUES (1152, '2020-01-12 22:48:47', NULL, 0, '网易用户体验设计中心', 'udec', 'private', 'http://gux.163.com/	udec', 0);
INSERT INTO `website` VALUES (1149, '2020-01-12 22:48:47', NULL, 0, '百度企业产品用户中心', '百度EUX', 'private', 'http://eux.baidu.com/', 0);
INSERT INTO `website` VALUES (1150, '2020-01-12 22:48:47', NULL, 0, '网易游戏用户体验中心', '网易GUX', 'private', 'http://gux.163.com/', 0);
INSERT INTO `website` VALUES (1138, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-942a4ff5654e4733818ae42a3947846a.png', 0, '在线免费创建简单logo及名片设计', 'Logaster', 'private', 'https://www.logaster.cn/', 0);
INSERT INTO `website` VALUES (1139, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-bbb4ad2182cc4dd4b1603bff8cafc295.png', 0, 'Loading加载动画在线制作', 'Preloaders', 'private', 'https://icons8.com/preloaders/', 0);
INSERT INTO `website` VALUES (1140, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b549780b61844df38c2743d813294e17.png', 0, '在线抠图工具', 'ClippingMagic', 'private', 'https://clippingmagic.com/', 0);
INSERT INTO `website` VALUES (1141, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-faf5590b299343e08c35d205b0a1395e.png', 0, 'Google在线优化压缩图片(支持webp)', 'Squoosh', 'private', 'https://squoosh.app/', 0);
INSERT INTO `website` VALUES (1142, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4676bcbff4bd4377bdf043a5c2843c6c.png', 0, '在线打开PSD丨Sketch丨Gimp编辑器', 'Photopea', 'private', 'https://www.photopea.com/', 0);
INSERT INTO `website` VALUES (1143, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-9e9687ef184745a286c3de3f2c1c4e6b.png', 0, '阿里人工智能电商Banner广告图制作', '鹿班', 'private', 'https://luban.aliyun.com/', 0);
INSERT INTO `website` VALUES (1144, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-5fa436144df448d7829921376499db6e.png', 0, '国内专业界设计团队', 'eicodesign', 'private', 'http://eicoinc.com/', 0);
INSERT INTO `website` VALUES (1145, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a22fbc92bb474d28b0e52bdaf4c9dbbe.png', 0, '社交用户体验设计', '腾讯ISUX', 'private', 'https://isux.tencent.com/', 0);
INSERT INTO `website` VALUES (1146, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-75d87ac7590642169e2058441d9a711d.png', 0, '腾讯用户研究与体验设计中心', '腾讯CDC', 'private', 'https://cdc.tencent.com/', 0);
INSERT INTO `website` VALUES (1147, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-74ee42a30dec435d90017bbc09506a6a.png', 0, '阿里妈妈MUX', '阿里妈妈MUX', 'private', 'https://mux.alimama.com/', 0);
INSERT INTO `website` VALUES (1148, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-973ce99a61e9474b91e80768bbfa9b27.png', 0, '跨国设计与战略咨询公司', 'Frog设计', 'private', 'https://www.frogdesign.cn/', 0);
INSERT INTO `website` VALUES (1137, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ae00264bc0904a6b99ddc71208a4989d.png', 0, '制作GIF丨SVG丨CSS加载动画图标', 'Loading', 'private', 'https://loading.io/', 0);
INSERT INTO `website` VALUES (1135, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e7ff0fe3745b4b90b940c3b570be8b08.png', 0, '谷歌绘画智能匹配相应图形[需翻墙]', 'Autodraw', 'private', 'https://www.autodraw.com/', 0);
INSERT INTO `website` VALUES (1136, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-2e035cd8cede4d8e9e1fa001838f34cd.png', 0, '网页网格栅格化工具', 'Grid', 'private', 'http://grid.guide/', 0);
INSERT INTO `website` VALUES (1122, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-8297c959f83d45708992eed858485df5.png', 0, 'JPG图片压缩工具', 'Jpegmini', 'private', 'https://www.jpegmini.com/', 0);
INSERT INTO `website` VALUES (1123, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e20e0b08b85347a3b223d0bbf1210464.png', 0, '专注于PDF格式互转、压缩等功能', 'Smallpdf', 'private', 'https://smallpdf.com/cn', 0);
INSERT INTO `website` VALUES (1124, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-dc6408bfeabd44c5ad36105d998154ea.png', 0, '根据条件匹配在线生成Logo', 'Logojoy', 'private', 'https://looka.com/logo-maker/', 0);
INSERT INTO `website` VALUES (1125, '2020-01-12 22:48:47', NULL, 0, '贝塞尔曲线练习', 'Bezier Game', 'private', 'https://bezier.method.ac/', 0);
INSERT INTO `website` VALUES (1126, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b216511c699045cc983b91fe655bdee5.png', 0, '汇集众多常用PDF在线工具', 'PDFcandy', 'private', 'https://pdfcandy.com/', 0);
INSERT INTO `website` VALUES (1127, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-03d18481cb2c44f6a50901c60356f0af.png', 0, '国外创建二维码在线应用', 'Qrhacker', 'private', 'https://www.qrhacker.com/', 0);
INSERT INTO `website` VALUES (1128, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7b56b657f49e47be951124764b4b6516.png', 0, '国内创建二维码在线应用', '草料二维码', 'private', 'https://cli.im/', 0);
INSERT INTO `website` VALUES (1129, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c3781d057e6c4253b002b5ff1756ba31.png', 0, '支持JPEG和PNG格式在线压缩', 'optimizilla', 'private', 'https://imagecompressor.com/', 0);
INSERT INTO `website` VALUES (1130, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-aefc363b21e14a6c960274d0c5151be7.png', 0, '图片智能算法无损放大', 'waifu2x', 'private', 'http://waifu2x.udp.jp/', 0);
INSERT INTO `website` VALUES (1131, '2020-01-12 22:48:47', NULL, 0, '收费！非常强大的位图转矢量图', 'VectorMagic', 'private', 'https://vectormagic.com/', 0);
INSERT INTO `website` VALUES (1132, '2020-01-12 22:48:47', NULL, 0, '图标长投影在线生成', 'FlattyShadow', 'private', 'http://ww7.flattyshadow.com/', 0);
INSERT INTO `website` VALUES (1133, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b8b3eebab6be4790b725b407b4872131.png', 0, '炫酷对称艺术纹理特效绘制', 'WeaveSilk', 'private', 'http://weavesilk.com/', 0);
INSERT INTO `website` VALUES (1134, '2020-01-12 22:48:47', NULL, 0, '台湾一家二维码在线制作和APP程序', 'QuickMark', 'private', 'http://www.quickmark.com.tw/cht/qrcode-datamatrix-generator/?qrLink', 0);
INSERT INTO `website` VALUES (1120, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4594777929914e248ace6783998fe47f.png', 0, '中文上传图片字体查找', 'qiuziti', 'private', 'http://www.qiuziti.com/', 0);
INSERT INTO `website` VALUES (1121, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-1d9acdff23cf409896395c012a1635df.png', 0, '高效易用的自动标注工具', 'PxCook', 'private', 'https://fancynode.com.cn/pxcook', 0);
INSERT INTO `website` VALUES (1119, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-3c6fe265517f47c58fa171fd9d219028.png', 0, '英文上传图片查找字体', 'FindMyfont', 'private', 'https://www.myfonts.com/WhatTheFont/', 0);
INSERT INTO `website` VALUES (1115, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a3be83c359cd4f82b3f157b67a87f19e.png', 0, '微软Modern官方设计语言', 'Modern设计', 'private', 'https://www.microsoft.com/design', 0);
INSERT INTO `website` VALUES (1116, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c406a450aa0e486d80990b22dbcea548.png', 0, '云端在线图片格式转换', 'CloudConvert', 'private', 'https://cloudconvert.org/', 0);
INSERT INTO `website` VALUES (1117, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7fb78cc0c73e48d1b7f5b6546f300e93.png', 0, '2019年设计师必备设计神器', '摹客iDoc', 'private', 'https://www.mockplus.cn/idoc', 0);
INSERT INTO `website` VALUES (1118, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-5c0aaa8e72274e87a585d1eae41d099c.png', 0, '超完美PNG压缩工具', 'TinyPng', 'private', 'https://tinypng.com/', 0);
INSERT INTO `website` VALUES (1114, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-85c3550f426147a58333b3fddf464639.png', 0, 'MaterialDesign设计官方指南', 'Material设计', 'private', 'https://material.io/', 0);
INSERT INTO `website` VALUES (1113, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-aeb422120233430aa42d45a9c321deac.png', 0, '移动屏幕尺寸规范', 'Screensiz', 'private', 'http://screensiz.es/phone', 0);
INSERT INTO `website` VALUES (1095, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f97a60d0d46144b5b061dafcdc71af42.png', 0, '炫酷多边形背景色块生成', 'Trianglify', 'private', 'https://trianglify.io/about', 0);
INSERT INTO `website` VALUES (1096, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-0427913caca44b92a93ed63717dadb69.png', 0, '全球设计师色彩分享交流社区', 'ColourLovers', 'private', 'https://www.colourlovers.com/', 0);
INSERT INTO `website` VALUES (1097, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-5468c8bb131b4e1786b0e358c40fd8b7.png', 0, '通过网址获取分析网站配色', 'WebColourData', 'private', 'http://webcolourdata.com/', 0);
INSERT INTO `website` VALUES (1098, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c8f73127fe7c451f8b4f34757ce7684b.png', 0, '中科院色谱的中国传统色', '中国传统色', 'private', 'http://zhongguose.com/', 0);
INSERT INTO `website` VALUES (1099, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a16f7386b43b46e6a38366999d970605.png', 0, '色彩搜索引擎', 'Picular', 'private', 'https://picular.co/flower', 0);
INSERT INTO `website` VALUES (1100, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-311c837846d944d5bfa3e2e967829105.png', 0, '免费英文字体下载库', 'Fontsup', 'private', 'https://fontsup.com/', 0);
INSERT INTO `website` VALUES (1101, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-0fd9c2a1b30243d58289efe35fa54060.png', 0, '详细分类免费字体搜索下载库', 'Fonts2u', 'private', 'https://zh.fonts2u.com/', 0);
INSERT INTO `website` VALUES (1102, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c906c9cb958443ea9919003570f684da.png', 0, '最新时尚的商业英文字体', 'MyFont', 'private', 'https://www.myfonts.com/', 0);
INSERT INTO `website` VALUES (1103, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-732a5368daef49dfb04f3fd75aa10fa8.png', 0, '免费英文字体搜索下载站', 'Urbanfonts', 'private', 'https://www.urbanfonts.com/', 0);
INSERT INTO `website` VALUES (1104, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4dad1e9c69454138b33a8eefbab95331.png', 0, '苹果最新的系统界面字体San Francisco', '苹方字体', 'private', 'https://developer.apple.com/fonts/', 0);
INSERT INTO `website` VALUES (1105, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ab1d45fc8d064e81aa161fff93a35386.png', 0, 'Adobe、Google出品的开源中文黑体', '思源黑体', 'private', 'https://fonts.adobe.com/fonts/source-han-sans-simplified-chinese', 0);
INSERT INTO `website` VALUES (1106, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e1534adce69744cc854c16c7f6662ee2.png', 0, '免费手写可爱字体官网下载', 'Comicneue', 'private', 'http://comicneue.com/', 0);
INSERT INTO `website` VALUES (1107, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a2dbf0f8161d4e1b9eb0f925fa4509ff.png', 0, 'Adobe出品的web在线字库', 'Typekit', 'private', 'https://fonts.adobe.com/', 0);
INSERT INTO `website` VALUES (1108, '2020-01-12 22:48:47', NULL, 0, 'Adobe、Google出品的开源中文宋体', '思源宋体', 'private', 'https://source.typekit.com/source-han-serif/', 0);
INSERT INTO `website` VALUES (1109, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-9329d9b69aca41c587b6c49b461f1bc4.png', 0, '查版权，免纠纷', '360查字体', 'private', 'https://fonts.safe.360.cn/', 0);
INSERT INTO `website` VALUES (1110, '2020-01-12 22:48:47', NULL, 0, '安卓官方设计指南', 'Android设计', 'private', 'https://developer.android.com/design/index.html', 0);
INSERT INTO `website` VALUES (1111, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ed250bc92689420abc4fe53c515f3f48.png', 0, 'Google安卓主流设备尺寸', '安卓尺寸', 'private', 'https://material.io/resources/devices/', 0);
INSERT INTO `website` VALUES (1112, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-89343647818e4f0b8837ade980e26489.png', 0, '苹果官方设计指南', 'Apple设计', 'private', 'https://developer.apple.com/design/', 0);
INSERT INTO `website` VALUES (1094, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-638a3c92b0244dd3b22033cd1d4c56f5.png', 0, 'itmeo旗下180个漂亮渐变色模板', 'webgradients', 'private', 'https://webgradients.com/', 0);
INSERT INTO `website` VALUES (1092, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-3c4548e5a15d482a84ecdf227bbcd637.png', 0, '简洁舒服的渐变配色', 'UIgradients', 'private', 'https://uigradients.com/#Stripe', 0);
INSERT INTO `website` VALUES (1093, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-bbe6829a999a409db88e7ab343bf9dd1.png', 0, 'MaterialDesign强大的在线配色', 'MD调色器', 'private', 'https://www.materialpalette.com/indigo/blue', 0);
INSERT INTO `website` VALUES (1091, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7f731539ba2e4c2da5905299e55fc5a2.png', 0, '流行的网格渐变背景免费下载', 'Mesh Gradients', 'private', 'https://www.ls.graphics/meshgradients', 0);
INSERT INTO `website` VALUES (1086, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-62813f0030da44d895232985db42d007.png', 0, 'Adobe专业配色工具', 'AdobeColor', 'private', 'https://color.adobe.com/', 0);
INSERT INTO `website` VALUES (1087, '2020-01-12 22:48:47', NULL, 0, '日本古典传统配色网站', 'Nipponcolors', 'private', 'http://nipponcolors.com/', 0);
INSERT INTO `website` VALUES (1088, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-149fcadd7cb946e0a7862c6103653a71.png', 0, '上传并匹配提取图片风格的颜色', 'Colorfavs', 'private', 'http://www.colorfavs.com/', 0);
INSERT INTO `website` VALUES (1089, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-0c7a931a1f824ee192d7e65724de2ed2.png', 0, '在线快速配色生成工具', 'Coolors', 'private', 'https://coolors.co/', 0);
INSERT INTO `website` VALUES (1090, '2020-01-12 22:48:47', NULL, 0, '每天更新一组简洁舒服的配色方案', 'Colorhunt', 'private', 'http://www.colorhunt.co/', 0);
INSERT INTO `website` VALUES (1084, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-38728e9b6fdf480fa1aa6d113040852d.png', 0, '每周免版权高清图片分享', 'Stocksnap', 'private', 'https://stocksnap.io/', 0);
INSERT INTO `website` VALUES (1085, '2020-01-12 22:48:47', NULL, 0, '站酷海洛创意收费正版图库', 'Hellorf', 'private', 'https://www.hellorf.com/', 0);
INSERT INTO `website` VALUES (1082, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-3eeeb625f53e45d98e9338f7ec410087.png', 0, '免费的高清图片、矢量图片、艺术插花', 'Pixabay', 'private', 'https://pixabay.com/', 0);
INSERT INTO `website` VALUES (1083, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-031b7412ecf04d7480cc4d9ed6238a0a.png', 0, '日式照片素材免费分享站点', 'Pakutaso', 'private', 'https://www.pakutaso.com/', 0);
INSERT INTO `website` VALUES (1080, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-0aff1cb087c24880af1694a91dcd2d12.png', 0, '全球著名摄影师图片展示和售卖平台', '500px', 'private', 'https://web.500px.com/', 0);
INSERT INTO `website` VALUES (1081, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-9b98778620744ddbb87c3eb3ba1d6e45.png', 0, '专注于免费食品图片素材的分享', 'FoodiesFeed', 'private', 'https://www.foodiesfeed.com/', 0);
INSERT INTO `website` VALUES (1078, '2020-01-12 22:48:47', NULL, 0, '精品免费图库分享', 'Pexels', 'private', 'https://www.pexels.com/', 0);
INSERT INTO `website` VALUES (1079, '2020-01-12 22:48:47', NULL, 0, '雅虎旗下摄影师图片分享网站', 'Flickr', 'private', 'https://www.flickr.com/explore', 0);
INSERT INTO `website` VALUES (1075, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4cd88f2c4d4242858c558525a52f7ee2.png', 0, '初创公司精品免费图库', 'Startupstockp', 'private', 'https://startupstockphotos.com/', 0);
INSERT INTO `website` VALUES (1076, '2020-01-12 22:48:47', NULL, 0, '免费高清灵感图片', 'Magdeleine', 'private', 'https://magdeleine.co/', 0);
INSERT INTO `website` VALUES (1077, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f4527e083c1b4c17975923d5388e30b3.png', 0, '免费高清摄影图库', 'Splitshire', 'private', 'https://www.splitshire.com/', 0);
INSERT INTO `website` VALUES (1074, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-739669a4a18c4b54955622395d9a2350.png', 0, '高质量免费版权的图库素材', 'Unsplash', 'private', 'https://unsplash.com/', 0);
INSERT INTO `website` VALUES (1072, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-bc1455dec8334de9a5dfdabb4fe7f374.png', 0, '国外免费设计素材模板下载站', 'GraphicsFuel', 'private', 'https://www.graphicsfuel.com/', 0);
INSERT INTO `website` VALUES (1073, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-6c8a02f221264f19ae8d7b4fc090369f.png', 0, '聚合各大免费高清图库的APP', 'ZoommyAPP', 'private', 'https://zoommyapp.com/', 0);
INSERT INTO `website` VALUES (1071, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e9a4827ad6234d57b5de254d35009b56.png', 0, '免费高质量设计素材模板分享', 'Pixeden', 'private', 'https://www.pixeden.com/', 0);
INSERT INTO `website` VALUES (1069, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ae3e82abc0d74627a6dbbe97d7e37207.png', 0, '免费矢量素材搜索和下载', 'Vecteezy', 'private', 'https://www.vecteezy.com/', 0);
INSERT INTO `website` VALUES (1070, '2020-01-12 22:48:47', NULL, 0, '矢量和CSS网页背景纹理配色生成', 'HeroPatterns', 'private', 'http://www.heropatterns.com/', 0);
INSERT INTO `website` VALUES (1067, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ea62a3b62f474ada9c85cf8d20a3dc01.png', 0, '海量免费素材共享平台', '素材中国', 'private', 'http://www.sccnn.com/', 0);
INSERT INTO `website` VALUES (1068, '2020-01-12 22:48:47', NULL, 0, '随机下拉背景纹理', 'PatternLibrary', 'private', 'http://thepatternlibrary.com/', 0);
INSERT INTO `website` VALUES (1066, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-9e3d89c8ceb74831b2c06dd92f6367bc.png', 0, '国内海量平面免费素材下载', '昵图网', 'private', 'http://www.nipic.com/index.html', 0);
INSERT INTO `website` VALUES (1063, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b6e192699e5a446d8ab9998dd626f49c.png', 0, '对设计和开发有帮助的优质设计资源', 'CSSauthor', 'private', 'https://cssauthor.com/', 0);
INSERT INTO `website` VALUES (1064, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-2a795f622ceb467fa743d286b4f395d9.png', 0, '高质量Principle原型丨动效设计资源', 'Principlerepo', 'private', 'http://www.principlerepo.com/', 0);
INSERT INTO `website` VALUES (1065, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a977a086667b41ccbd0f708df893a569.png', 0, '海量原创设计模板免费下载', '千图网', 'private', 'https://www.58pic.com/', 0);
INSERT INTO `website` VALUES (1062, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-57eb1e13f69d42dfbf39353cd760c780.png', 0, '3D建模纹理特效素材', 'Texturer', 'private', 'http://texturer.com/', 0);
INSERT INTO `website` VALUES (1061, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-3355c8a46c464827b9797dbeb76622fe.png', 0, '国内不错的Sketch站点资源', 'Sketch.im', 'private', 'https://oursketch.com/', 0);
INSERT INTO `website` VALUES (1060, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-320712707b044cf8a181cd842ff20f64.png', 0, 'Dribbble上一些免费的设计PSD源文件', 'Fribbble', 'private', 'https://designwoop.com/free-design-resources?utm_medium=referral&utm_source=fribbble.com&utm_campaign=redirect', 0);
INSERT INTO `website` VALUES (1057, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-3bdfcbead8c847baafd3cfddb7a6e4d4.png', 0, '海报模板输出设计', 'Canva', 'private', 'https://www.canva.com/', 0);
INSERT INTO `website` VALUES (1058, '2020-01-12 22:48:47', NULL, 0, '主题森林-全球UI作品出售平台', 'Themeforest', 'private', 'https://themeforest.net/', 0);
INSERT INTO `website` VALUES (1059, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-da8f47bd8925495b9f5156a10ff7718d.png', 0, '漂亮的商业UI模板售卖平台', 'UI8', 'private', 'https://ui8.net/', 0);
INSERT INTO `website` VALUES (1056, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ac2f9dd4c9fb4e20a3d0c1d35479cae1.png', 0, '平面海报、设备场景模板下载', 'Graphictwister', 'private', 'https://graphictwister.com/', 0);
INSERT INTO `website` VALUES (1055, '2020-01-12 22:48:47', NULL, 0, '智能设备场景模板下载', 'Dunnnk', 'private', 'http://dunnnk.com/', 0);
INSERT INTO `website` VALUES (1054, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-0302d5d8fce140aca569736f9f96f55e.png', 0, '收费高质量的专业mockup模板', 'Mockup', 'private', 'https://mockup.zone/', 0);
INSERT INTO `website` VALUES (1052, '2020-01-12 22:48:47', NULL, 0, '简洁大气的背景纹理素材', 'Subtlepatterns', 'private', 'https://www.toptal.com/designers/subtlepatterns/', 0);
INSERT INTO `website` VALUES (1053, '2020-01-12 22:48:47', NULL, 0, 'Firmbee精品设备和场景mockup素材', 'Firmbee', 'private', 'https://firmbee.com/', 0);
INSERT INTO `website` VALUES (1050, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f86f877550a94a1da08a444cf1b7bbda.png', 0, '免费高质量矢量图下载', 'Freepik', 'private', 'https://www.freepik.com/', 0);
INSERT INTO `website` VALUES (1051, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-abe1503bb3284df380b2d5bbfc23b5d3.png', 0, '免版权小人场景矢量插画素材', 'manypixels', 'private', 'https://www.manypixels.co/gallery/', 0);
INSERT INTO `website` VALUES (1049, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-75aa6615980c43a293a47cde111bf069.png', 0, '免费优质的图标库', 'Nucleo', 'private', 'https://nucleoapp.com/', 0);
INSERT INTO `website` VALUES (1048, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a251c52ea9b94499a538046a800edcfa.png', 0, '一套界面中的图标动态效果包', 'Flight icon', 'private', 'https://www.flighticon.co/', 0);
INSERT INTO `website` VALUES (1047, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-2d31ac0f1bb44f6dbb421e69ffe0e5e5.png', 0, '一套微型的图标动态效果库', 'UseAnimations', 'private', 'https://useanimations.com/', 0);
INSERT INTO `website` VALUES (1044, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e68bb88cb5214e338f9ee4f25ad09864.png', 0, '为开发者设计的一套免费开源图标库', '草莓图标', 'private', 'http://chuangzaoshi.com/icon/', 0);
INSERT INTO `website` VALUES (1045, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-b13b2a23ce7f43e1b5f88928f43de231.png', 0, '完全可定制和使用的矢量图标库', 'Ikonate', 'private', 'https://ikonate.com/', 0);
INSERT INTO `website` VALUES (1046, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7c12205503d74319bc0cf351b1c6b7aa.png', 0, '帮设计师只管检查logo的工具', 'logolab', 'private', 'https://logolab.app/home', 0);
INSERT INTO `website` VALUES (1043, '2020-01-12 22:48:47', NULL, 0, 'iOS系统应用图标收集和分享', 'iconsfeed', 'private', 'http://www.iconsfeed.com/', 0);
INSERT INTO `website` VALUES (1040, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-18e1d23fcb5e4334875273df28caca6c.png', 0, 'IOS平台APP图标收录和欣赏', 'IOSicongallery', 'private', 'https://www.iosicongallery.com/', 0);
INSERT INTO `website` VALUES (1041, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-10420b4af5d243e89d37dfcc431ddf16.png', 0, 'Emoji表情图标整理', 'Emojione', 'private', 'https://www.joypixels.com/demo/', 0);
INSERT INTO `website` VALUES (1042, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c0938e5c4e4746779b57dc880b68c72e.png', 0, '海量图标搜索可生成css sprites', 'iconninja', 'private', 'https://www.iconninja.com/', 0);
INSERT INTO `website` VALUES (1039, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-92fdb9863d344f288dc1a673c7fbed1b.png', 0, '各大国际品牌logo矢量图', 'Logoeps', 'private', 'https://logoeps.com/', 0);
INSERT INTO `website` VALUES (1038, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7bc22ca119764f8a9b7fcb39f40f3525.png', 0, '免费商用的高质量图标素材站', 'iconstore', 'private', 'https://iconstore.co/', 0);
INSERT INTO `website` VALUES (1036, '2020-01-12 22:48:47', NULL, 0, '特赞！提供开源免费的LOGO', 'Logodust', 'private', 'https://logodust.com/', 0);
INSERT INTO `website` VALUES (1037, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-95e8095ee6aa45889fc32301cf2b1bd8.png', 0, '海量扁平化免费的图标库', 'Flaticon', 'private', 'https://www.flaticon.com/', 0);
INSERT INTO `website` VALUES (1034, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-25af022063ce413cbd1ffcbf28fed486.png', 0, '精美免费简洁icon', 'iconmonstr', 'private', 'https://iconmonstr.com/', 0);
INSERT INTO `website` VALUES (1035, '2020-01-12 22:48:47', NULL, 0, '国外LOGO展示社区', 'Logopond', 'private', 'https://logopond.com/', 0);
INSERT INTO `website` VALUES (1031, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-222455d66b384f0ea2d2818258d0dbc6.png', 0, '高质量图标下载', 'TheNounProject', 'private', 'https://thenounproject.com/', 0);
INSERT INTO `website` VALUES (1032, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e6a7eaa09ba14a9e9a6621b961f79a60.png', 0, '高质量付费图标下载', 'iconfinder', 'private', 'https://www.iconfinder.com/', 0);
INSERT INTO `website` VALUES (1033, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-115c80e29cfc4dd38e13c0ffcfa76e95.png', 0, '一套免费特色iconfont图标支持WP插件', 'themify', 'private', 'https://themify.me/themify-icons', 0);
INSERT INTO `website` VALUES (1030, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-9703daf02ce141f8ab3b0cd51a61144c.png', 0, '图标搜索大全', 'Easyicon', 'private', 'https://www.easyicon.net/', 0);
INSERT INTO `website` VALUES (1026, '2020-01-12 22:48:47', NULL, 0, '可爱的UI手机界面设计搜集', 'lovelyUI', 'private', 'https://www.lovelyui.com/', 0);
INSERT INTO `website` VALUES (1027, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4ccf4450664b417992e40ac63818a57d.png', 0, '矢量图打包成图标字体的技术平台', 'icomoon', 'private', 'https://icomoon.io/', 0);
INSERT INTO `website` VALUES (1028, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c55153be3f6a40c4929b97b578a29466.png', 0, '免费优质的图标库', 'Nucleo', 'private', 'https://nucleoapp.com/', 0);
INSERT INTO `website` VALUES (1029, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e9fc00c18d7442f19cfc656d9b7777aa.png', 0, '阿里团队图标字体及图标素材下', 'iconfont', 'private', 'https://www.iconfont.cn/plus', 0);
INSERT INTO `website` VALUES (1024, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-d0e4298d92cc496688d04e60eb001d45.png', 0, '优秀网页设计展示平台', 'SiteinSpire', 'private', 'https://www.siteinspire.com/', 0);
INSERT INTO `website` VALUES (1025, '2020-01-12 22:48:47', NULL, 0, '界面交互响应设计收录网站', 'UseYourlnterface', 'private', 'http://ww1.useyourinterface.com/', 0);
INSERT INTO `website` VALUES (1022, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-35612ecfddf34dc5b639bdee546c6c45.png', 0, '丰富的日式响应式设计收录站点', 'webdesignclip', 'private', 'https://www.webdesignclip.com/', 0);
INSERT INTO `website` VALUES (1023, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-855a90718c9c44c182e363b18fcbc804.png', 0, '优秀CSS网站界面和交互设计获奖', 'CSSwinner', 'private', 'https://www.csswinner.com/', 0);
INSERT INTO `website` VALUES (1020, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-6dcaf4b08f5543889fb804931a8a388c.png', 0, '漂亮的酷站收集展示', 'BestWebsite', 'private', 'https://bestwebsite.gallery/', 0);
INSERT INTO `website` VALUES (1021, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ade143df39ac401e80a6b1a9004e6525.png', 0, '日式风格设计网页收录展示', 'Straightline', 'private', 'http://bm.straightline.jp/', 0);
INSERT INTO `website` VALUES (1019, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-83561ddd290544e2988e25cd2ca96e9e.png', 0, '收录漂亮的界面设计网站', 'sitesee', 'private', 'https://sitesee.co/', 0);
INSERT INTO `website` VALUES (1016, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-483c9205277e40ff950d53bb640203d4.png', 0, '收集优秀UI组件元素设计的站点', 'Calltoidea', 'private', 'https://www.calltoidea.com/', 0);
INSERT INTO `website` VALUES (1017, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ef19680bce5f4ea2abcee4a4543c6a29.png', 0, '日本漂亮的酷站收集[需翻墙]', 'muuuuu', 'private', 'https://muuuuu.org/', 0);
INSERT INTO `website` VALUES (1018, '2020-01-12 22:48:47', NULL, 0, '收集科幻电影场景里UI交互界面', 'Noteloop', 'private', 'https://www.noteloop.com/kit/fui/', 0);
INSERT INTO `website` VALUES (1014, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ad67363876024f73a367086e55a4baa7.png', 0, 'UI灵感收集聚合站点', 'Uigarage', 'private', 'https://uigarage.net/', 0);
INSERT INTO `website` VALUES (1015, '2020-01-12 22:48:47', NULL, 0, '设计细节动效灵感分享网站', 'littlebigdetails', 'private', 'https://littlebigdetails.com/', 0);
INSERT INTO `website` VALUES (1008, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-1132a41922334c98a42e9c778b50a2ba.png', 0, '专业收集APP截图的网站', 'Pttrns', 'private', 'https://pttrns.com/', 0);
INSERT INTO `website` VALUES (1009, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-071b8225418c4d8d9fb1034f3804a094.png', 0, '设计师灵感设计案例作品的站点', 'collectUI', 'private', 'http://collectui.com/', 0);
INSERT INTO `website` VALUES (1010, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a265458993db4bedb1b2264e9c7f420f.png', 0, '采集前端作品设计、iOS UI设计', 'uplabs', 'private', 'https://www.uplabs.com/', 0);
INSERT INTO `website` VALUES (1011, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7552f0107d6345a2a98350e4e6bf5ef3.png', 0, '网站和APP单页界面欣赏', 'OnePageLove', 'private', 'https://onepagelove.com/', 0);
INSERT INTO `website` VALUES (1012, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f4e277cdacb348de812fbd8f2ed23a12.png', 0, '为精美及创意的设计UI颁奖站点', 'Awwwards', 'private', 'https://www.awwwards.com/', 0);
INSERT INTO `website` VALUES (1013, '2020-01-12 22:48:47', NULL, 0, '高质量设计网站、资源聚合站点', 'Freebiesbug', 'private', 'https://freebiesbug.com/', 0);
INSERT INTO `website` VALUES (1005, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-c1fe97fe9949444d82de8e5f813d5231.png', 0, '优秀APP交互动效收集', 'Elasticode', 'private', 'http://www.elasticode.com/', 0);
INSERT INTO `website` VALUES (1006, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-06224589dda24987a0f9c091fcaa4b83.png', 0, '日本网页设计风格展', '4DB', 'private', 'http://4db.cc/', 0);
INSERT INTO `website` VALUES (1007, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-bd506be0f8664016bd0f0759ab9d7275.png', 0, 'MG动态效果展示', 'Freshdesign', 'private', 'https://freshdesign.io/', 0);
INSERT INTO `website` VALUES (1004, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-edbcebc2b8254012b247f667450470d1.png', 0, '移动界面UI动效展示', 'Uimovement', 'private', 'https://uimovement.com/', 0);
INSERT INTO `website` VALUES (1003, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-608c59e73f564145a6d47219ab4354d6.png', 0, '全球最火热的酷站画廊', 'Reeoo', 'private', 'http://reeoo.com/', 0);
INSERT INTO `website` VALUES (1000, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-d712233763a64014a9c9c620b1238107.png', 0, '工业设计资讯及项目展示', 'Core77', 'private', 'https://www.core77.com/', 0);
INSERT INTO `website` VALUES (1001, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-611eedff6e16414eb96f7f222d73bd35.png', 0, '欧美创意资讯汇总', 'NOTCOT', 'private', 'http://www.notcot.org/', 1);
INSERT INTO `website` VALUES (1002, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-32e4ae39dffd464db625c015c63aeec9.png', 0, '日本新鲜设计资讯', 'JDN', 'private', 'https://www.japandesign.ne.jp/', 1);
INSERT INTO `website` VALUES (999, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-2de5a32220ea48e493d630d066a341d8.png', 0, '世界各地设计文化创意新鲜事', 'The World\'s Best Ever', 'private', 'http://theworldsbestever.com/', 0);
INSERT INTO `website` VALUES (996, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-6f434f1b059b4d5d93a1852dea7de4f4.png', 0, '发现有趣的设计生活', '设计癖', 'private', 'http://www.shejipi.com/', 0);
INSERT INTO `website` VALUES (997, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ad1e3653fe5740ca95cbab77394271f3.png', 0, '众多领域服务设计案例', 'SDN', 'private', 'https://www.service-design-network.org/', 0);
INSERT INTO `website` VALUES (995, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-2a6f7c0fb914412fbff71252af9c69b5.png', 0, '设计师也感兴趣的技术文章', '凹凸实验室', 'private', 'https://aotu.io/', 0);
INSERT INTO `website` VALUES (992, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-a8a3eb2e0065421f9f1bd20bd16c76eb.png', 0, '全球优秀CSS网页设计奖提名网', 'CSS设计奖', 'private', 'https://www.cssdesignawards.com/', 0);
INSERT INTO `website` VALUES (990, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-7c70abf21ad84a9186580976db80af94.png', 0, '精挑细选的美站收集', 'Land-book', 'private', 'https://land-book.com/', 0);
INSERT INTO `website` VALUES (991, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4921c529f72142758f528d9fee9eebb5.png', 0, '台湾灵感创意视觉资讯收集网', '淘靈感', 'private', 'https://www.mydesy.com/', 0);
INSERT INTO `website` VALUES (986, '2020-01-12 22:48:47', NULL, 0, '分享各类艺术创作的设计社区', 'Deviantart', 'private', 'https://www.deviantart.com/', 0);
INSERT INTO `website` VALUES (994, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ae86c1511be646619398b3952f89780f.png', 0, '创意工作者网络社区和资讯', 'Ello', 'private', 'https://ello.co/', 0);
INSERT INTO `website` VALUES (993, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-e5056330b59e4c50add7874eb0bb34c6.png', 0, '创意灵感收录集合', 'SpirationGrid', 'private', 'https://theinspirationgrid.com/', 0);
INSERT INTO `website` VALUES (989, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-12a241359c924e66ab52c045a9ffa782.png', 0, '产品丨界面丨插画灵感设计画廊', 'Bestfolios', 'private', 'https://www.bestfolios.com/home', 0);
INSERT INTO `website` VALUES (988, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-de76afb0669a4106a197e0def16ac5c7.png', 0, '创意灵感和教程的设计博客', 'abduzeedo', 'private', 'https://abduzeedo.com/', 0);
INSERT INTO `website` VALUES (987, '2020-01-12 22:48:47', NULL, 0, '365天每天推荐一个设计师作品', '365designers', 'private', 'http://365awesomedesigners.com/', 0);
INSERT INTO `website` VALUES (985, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-1d876fc893f24dfb8558a70697e940bd.png', 0, '创意媒体艺术设计作品展', 'FWA', 'private', 'https://thefwa.com/', 0);
INSERT INTO `website` VALUES (983, '2020-01-12 22:48:47', NULL, 0, '视频分享平台创意动画频道[需要翻墙]', 'Vimeo动画', 'private', 'https://vimeo.com/categories/animation', 0);
INSERT INTO `website` VALUES (984, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-29783e1fe10e45249e82432093d20e2f.png', 0, '视觉创意和艺术爱好者网站', 'MyModernMet', 'private', 'https://mymodernmet.com/', 0);
INSERT INTO `website` VALUES (982, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ae8eface45824645905ca7e5dfb1273f.png', 0, '全球最极致3D设计模型在线展示平台', 'Sketchfab', 'private', 'https://sketchfab.com/', 1);
INSERT INTO `website` VALUES (981, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-4844039356e2427c900b660c984e2147.png', 0, '法国每日新鲜创意灵感分享', 'Fubiz', 'private', 'http://www.fubiz.net/', 0);
INSERT INTO `website` VALUES (980, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f9ec4d14a2ca4314934c4c5e0ba61cea.png', 0, '优秀LandingPage落地页收集', 'lapa', 'private', 'https://www.lapa.ninja/', 0);
INSERT INTO `website` VALUES (977, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-80000371c2d84d569abbc46e655b60d2.png', 0, '中国美图收藏采集站', '花瓣', 'private', 'http://huaban.com/', 0);
INSERT INTO `website` VALUES (978, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-3fcee0a7debc4646be5ce930a2edadd9.png', 0, '中国本地化UI设计展示平台', 'UI中国', 'private', 'https://www.ui.cn/', 0);
INSERT INTO `website` VALUES (979, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-f90a58ff11354a64be4faa56e8fbee24.png', 0, '国内综合设计展示平台', '站酷', 'private', 'https://www.zcool.com.cn/', 0);
INSERT INTO `website` VALUES (975, '2020-01-12 22:48:47', NULL, 0, '球美图收藏采集站', 'Pinterest', 'private', 'https://www.pinterest.com', 0);
INSERT INTO `website` VALUES (976, '2020-01-12 22:48:47', NULL, 0, '设计作品和资讯文摘订阅平台', 'Panda', 'private', 'http://usepanda.com/app/', 0);
INSERT INTO `website` VALUES (974, '2020-01-12 22:48:47', NULL, 0, 'Adobe旗下设计师创意视觉社区', 'Behance', 'private', 'https://www.behance.net/', 0);
INSERT INTO `website` VALUES (973, '2020-01-12 22:48:47', NULL, 0, '全球UI设计师作品秀社区', 'Dribbble', 'private', 'https://dribbble.com/', 1);
INSERT INTO `website` VALUES (972, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-fc3753f883fd45a89beb2300c9629763.png', 0, '设计灵感资源聚合', 'Muzli', 'private', 'http://muz.li/', 0);
INSERT INTO `website` VALUES (971, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-aac223aa433f4fdf8c7688be8384d2ce.png', 0, '小众服务稳定的网盘', '坚果云', 'private', 'https://www.jianguoyun.com/', 0);
INSERT INTO `website` VALUES (969, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-66e1d88dc352476a8cc5eeb29b22af25.png', 0, '国内最大百度旗下网盘服务', '百度网盘', 'private', 'https://pan.baidu.com/disk/home?#/all?path=%2F&vmode=list', 0);
INSERT INTO `website` VALUES (970, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-40e4193e41f24e65a7a185d6f920d23c.png', 0, '腾讯QQ网盘服务', '微云', 'private', 'https://www.weiyun.com/', 0);
INSERT INTO `website` VALUES (966, '2020-01-12 22:41:25', NULL, 0, '全球最优秀的在线云存储', 'DropBox', 'private', 'https://www.dropbox.com/', 0);
INSERT INTO `website` VALUES (967, '2020-01-12 22:41:25', NULL, 0, 'Google在线云存储服务', 'GoogleDrive', 'private', 'https://www.google.com/intl/zh-CN/drive/', 0);
INSERT INTO `website` VALUES (968, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-cf1fa00c920c4dbba884f90f74802910.png', 0, '苹果在线存储和云服务', 'iCloud', 'private', 'https://www.icloud.com/', 0);
INSERT INTO `website` VALUES (929, '2020-01-12 22:41:25', NULL, 0, '国外的互联网新产品资讯新闻', 'TechCrunch', 'private', 'http://techcrunch.com/', 0);
INSERT INTO `website` VALUES (930, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-973eefd7848a4da7b336d5172fac60ab.png', 0, '美国最酷科技媒体', 'The Verge', 'private', 'https://www.theverge.com/', 0);
INSERT INTO `website` VALUES (931, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-ecd585c9efc54edd902420af298049d1.png', 0, '产品经理、产品爱好者学习交流平台', '人人都是产品经理', 'private', 'http://www.woshipm.com/', 0);
INSERT INTO `website` VALUES (932, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-004257bbca8947bf92e5371a2539e976.png', 0, '为创业者提供最好的产品和服务', '36氪', 'private', 'https://36kr.com/', 0);
INSERT INTO `website` VALUES (933, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-e8a0a6bf67b04d6fb423900aa71a8abe.png', 0, '热点产品的深度分析,发掘产品和趋势的价值', '极客公园', 'private', 'http://www.geekpark.net/', 0);
INSERT INTO `website` VALUES (934, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-a176b137569c4025bc6ed9ab3a534407.png', 0, '专注于移动APP编辑精选', '少数派', 'private', 'https://sspai.com/', 0);
INSERT INTO `website` VALUES (935, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-3e490e93081e49c9ad92a7926069027e.png', 0, '科技达人王自如数码产品测评平台', 'zealer', 'private', 'https://www.zealer.com/', 0);
INSERT INTO `website` VALUES (936, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-43cca059da944240ac31876aa17e084e.png', 0, '产品经理的社区和资讯站点', 'PMCAFF', 'private', 'https://coffee.pmcaff.com/', 0);
INSERT INTO `website` VALUES (937, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-b00cc75dffc44da496d6af2620bd84f0.png', 0, '分享免费、小巧、有趣、实用软件的网站', '小众软件', 'private', 'https://www.appinn.com/', 0);
INSERT INTO `website` VALUES (938, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-556039888ef84e78959fc623729320d8.png', 0, '专注于微软产品和技术的资讯博客', 'LiveSino', 'private', 'https://livesino.net/', 0);
INSERT INTO `website` VALUES (939, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-60f4e1082dad4034bb046f2b93ec16a5.png', 0, '全球最新潮的科技类新品站', 'Producthunt', 'private', 'https://www.producthunt.com/', 0);
INSERT INTO `website` VALUES (940, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-baa9a11797c54975bf095da7b9a967f4.png', 0, '全球最大的综合性数字发行平台', 'Steam', 'private', 'https://store.steampowered.com/', 0);
INSERT INTO `website` VALUES (965, '2020-01-12 22:41:25', NULL, 0, '微软云存储，支持在线Offiec编辑', 'OneDrive', 'private', 'https://onedrive.live.com/about/zh-cn/', 0);
INSERT INTO `website` VALUES (964, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-2df5eaeeb3df42a2a69d3ce154cc0244.png', 0, '持多人在线编辑Word、Excel和PPT文档', '腾讯文档', 'private', 'https://docs.qq.com/index.html', 0);
INSERT INTO `website` VALUES (963, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-ff759f5157f84938bf040dcab6a75316.png', 0, '让您的小组和您的工作充满活力', 'Quip', 'private', 'https://quip.com/', 0);
INSERT INTO `website` VALUES (962, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-429993867b53401e9159504dc9b42607.png', 0, '微软Word丨PPT丨Excel等文档办公套装', '微软Office', 'private', 'https://products.office.com/zh-cn/home', 0);
INSERT INTO `website` VALUES (961, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-7d6a87fbe9234965acb8e18c2671f1bb.png', 0, '支持多人协作的在线文档', '石墨文档', 'private', 'https://shimo.im/welcome', 0);
INSERT INTO `website` VALUES (960, '2020-01-12 22:41:25', NULL, 0, 'Google免费在线创建和编辑文档', 'Google文档', 'private', 'https://www.google.com/intl/zh-CN/docs/about/', 0);
INSERT INTO `website` VALUES (958, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-6bbb34b6449d46b88caba99d7c1462a1.png', 0, '设计师的产品协作平台', '蓝湖', 'private', 'https://lanhuapp.com/', 0);
INSERT INTO `website` VALUES (959, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-c0f543e14b3f4b8aaca6d79066eddab2.png', 0, '集文档丨wiki丨任务的协同创作平台', 'Notion', 'private', 'https://www.notion.so/', 0);
INSERT INTO `website` VALUES (957, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-adb0e911214c43c2ad93e92b78164fc9.png', 0, '项目进度管理和发布、协同工作平台', 'Trello', 'private', 'https://trello.com/', 0);
INSERT INTO `website` VALUES (956, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-b5f925d11d3f48359e5e20f4c82740e8.png', 0, '简洁好用的云笔记', '印象笔记', 'private', 'https://www.yinxiang.com/', 0);
INSERT INTO `website` VALUES (955, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-9a5865b34214476dbc7d3759bd597b39.png', 0, '微软强大的云笔记，支持多用户协作', 'Onenote', 'private', 'https://products.office.com/zh-cn/onenote/digital-note-taking-app?rtc=1', 0);
INSERT INTO `website` VALUES (954, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-be260d57831249ffa1da8c1edc003ba1.png', 0, '国内领先的团队协作工具', 'Teambition', 'private', 'https://www.teambition.com/', 0);
INSERT INTO `website` VALUES (953, '2020-01-12 22:41:25', NULL, 0, '在线团队协同办公、项目管理工具', 'Worktile', 'private', 'https://worktile.com/', 0);
INSERT INTO `website` VALUES (952, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-be4a1055df524373bb960037e0cd99f1.png', 0, '独特强大可创建3D视角的思维导图', 'iMindmap', 'private', 'https://imindmap.com/zh-cn/', 0);
INSERT INTO `website` VALUES (951, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-121a3212ef9d4b4089b0946124a65ac1.png', 0, '思维导图和PPT融合在一起', 'Novamind', 'private', 'https://www.novamind.com/', 0);
INSERT INTO `website` VALUES (950, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-e0b41859d3b044f7a28620899c050f63.png', 0, '简单强大的心智图', 'MindManager', 'private', 'https://www.mindjet.com/', 0);
INSERT INTO `website` VALUES (949, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-f721246a3a2c4d9d9a9d03e994d1730b.png', 0, '百度便捷的流程图思维工具', '百度脑图', 'private', 'https://naotu.baidu.com/', 0);
INSERT INTO `website` VALUES (948, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-2ae320f576e64714b1aa587ffc438509.png', 0, '非常优秀思维导图APP', 'Mindnode', 'private', 'https://mindnode.com/', 0);
INSERT INTO `website` VALUES (947, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-24cb02f3a2954f9abecd5ef3d6051a85.png', 0, '一款非常实用的商业思维导图软件', 'Xmind', 'private', 'https://www.xmind.cn/', 0);
INSERT INTO `website` VALUES (946, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-6efcbb2aec5e4acd85b950008d7e2a01.png', 0, '简洁快速的原型图设计工具', 'Mockplus', 'private', 'https://www.mockplus.cn/', 0);
INSERT INTO `website` VALUES (945, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-77c8996ce60e4a37ac56eb12deaa97b6.png', 0, '专注于UI设计+原型图工具', 'Sketch', 'private', 'http://www.sketchcn.com/', 0);
INSERT INTO `website` VALUES (944, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-c27b7190aa0a465bae27d479f48105a0.png', 0, '专业制作移动APP应用原型工具', '墨刀', 'private', 'https://modao.cc/', 0);
INSERT INTO `website` VALUES (943, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-d2894acea4364f9da2f936640cd16471.png', 0, '专业的快速原型设计工具', 'Axure', 'private', 'https://www.axure.com/', 0);
INSERT INTO `website` VALUES (942, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-8c3216fa7e1a459092400bf06eaaadef.png', 0, '一站式搞定PPT设计导航站点', '三顿PPT导航', 'private', 'https://sandunppt.com/', 1);
INSERT INTO `website` VALUES (1302, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-24f85df45fb049bc9be96b035184ed78.png', 0, '编程爱好者技术交流的平台', 'Segmentfault', 'private', 'https://segmentfault.com/', 0);
INSERT INTO `website` VALUES (1283, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-2a4525955af445949e968e052c229ae3.png', 0, '网站UI交互源码分享', 'codrops', 'private', 'https://tympanus.net/codrops/', 0);
INSERT INTO `website` VALUES (1258, '2020-01-12 22:57:32', NULL, 0, '在线实时编程预览', 'CodeCast', 'private', 'http://codecast.me/', 0);
INSERT INTO `website` VALUES (1233, '2020-01-12 22:57:32', NULL, 0, '面向开发者的云端开发托管平台', 'Coding', 'private', 'https://coding.net/', 0);
INSERT INTO `website` VALUES (1234, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-18e8e5bdc253452d86f98f8c7743f1c6.png', 0, '开源中国代码托管平台', 'Coding', 'private', 'https://gitee.com/', 0);
INSERT INTO `website` VALUES (1235, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-cbf81943ae9d4583813f720b0cf66cc2.png', 0, 'CSDN代码托管平台', 'CODE', 'private', 'https://www.csdn.net/', 0);
INSERT INTO `website` VALUES (1236, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-6ae8cf71e9a8401e878144e126cdfb5a.png', 0, '阿里云代码托管平台', 'Kelude', 'private', 'https://account.aliyun.com/login/login.htm?from_type=codealiyun&&oauth_callback=http%3A%2F%2Fcode.aliyun.com%2F', 0);
INSERT INTO `website` VALUES (1237, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-dba713950e2a4200abd9723cc36e0022.png', 0, '于ChromeV8引擎的JS运行环境', 'Nodejs', 'private', 'https://nodejs.org/en/', 0);
INSERT INTO `website` VALUES (1238, '2020-01-12 22:57:32', 'upload/2020/1/couldr_com_-9aa553f6e6ed489b915e5ed9762b23c7.png', 0, 'JavaScript世界的构建工具', 'Grunt', 'private', 'https://gruntjs.com/', 0);
INSERT INTO `website` VALUES (1239, '2020-01-12 22:57:32', NULL, 0, '基于流的自动化构建工具', 'Gulp', 'private', 'https://gulpjs.com/', 0);
INSERT INTO `website` VALUES (1211, '2020-01-12 22:57:32', NULL, 0, '各大尺寸设备响应式屏幕效果显示', 'Responsinator', 'private', 'http://www.responsinator.com/', 0);
INSERT INTO `website` VALUES (998, '2020-01-12 22:48:47', 'upload/2020/1/couldr_com_-ddd300b1284040c88129881a1d0ead00.png', 0, '每日新鲜设计资讯', 'Sidebar', 'private', 'https://sidebar.io/', 0);
INSERT INTO `website` VALUES (941, '2020-01-12 22:41:25', 'upload/2020/1/couldr_com_-8699471d29e446eebc9cfa2ac658fd4e.png', 0, '微信小程序应用商店和大全', '知晓程序', 'private', 'https://minapp.com/miniapp/', 0);
INSERT INTO `website` VALUES (1409, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-2696aafe0bb74ed1a2ac5e20b4d8b09d.png', 0, NULL, '中国银河证券-客服中心', 'private', 'http://www.chinastock.com.cn/yhwz/service/download.shtml', 0);
INSERT INTO `website` VALUES (1410, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-de5185b9ff6c4ea2bd9b20b0e30f48b5.png', 0, NULL, '文件夹加密-宏杰文件夹加密软件', 'private', 'http://www.55tools.com/', 0);
INSERT INTO `website` VALUES (1411, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-95a9867874204ca2a47865cbf75e38f1.png', 0, NULL, '知了 - 你的智能主页', 'private', 'https://zhi.hao123.com/', 0);
INSERT INTO `website` VALUES (1412, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-ea2fd23128b340458bd0cb77bc1bb753.png', 0, NULL, '东方财富终端--东方财富新版体验', 'private', 'https://emdesk.eastmoney.com/pc_activity/Pages/VIPTrade/pages/trial.html', 0);
INSERT INTO `website` VALUES (1413, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-0e739dfbeafb42ca8dc571dd2f78b175.png', 0, NULL, '偷渡鱼_最好用的网址导航', 'private', 'https://touduyu.com/', 0);
INSERT INTO `website` VALUES (1414, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-638c4aa5b243418f8615fbf94127b251.png', 0, NULL, 'Her′s 轻快上网体验', 'private', 'http://her.oneboys.cn/', 0);
INSERT INTO `website` VALUES (1415, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-8b414f3bc1dd438692909afc98722ccf.png', 0, NULL, '初中化学所有反应公式_百度作业帮', 'private', 'http://www.zybang.com/question/a71816230e406b1e4abbd82db2645dbf.html', 0);
INSERT INTO `website` VALUES (1416, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-b6b3bd8f3abd4ace8107540037d0bc54.png', 0, NULL, '蝶_崔伟立__高音质在线试听_酒醉的蝴蝶歌词|歌曲下载_酷狗音乐酒醉的蝴', 'private', 'http://www.kugou.com/song-36/yavyv32.html#hash=04E4C1D0AFB9DEEF3B0834AA1F71B654&album_id=0', 0);
INSERT INTO `website` VALUES (1417, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-d3626550bfff4e6baf229960264db543.png', 0, NULL, '益学堂——金融实战培训平台、在线炒股学习', 'private', 'http://www.yxcps.cn/', 0);
INSERT INTO `website` VALUES (1418, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-c5dd9558c35f4c7a8d9312f70027a95f.png', 0, NULL, '广告净化器(yiclear.com),净化您的生活!广告防御者', 'private', 'https://www.yiclear.com/', 0);
INSERT INTO `website` VALUES (1419, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-db9323c0f890444d8b3858bbd1dd3838.png', 0, NULL, '成都志愿者网', 'private', 'http://www.cdvolunteer.com/index.html', 0);
INSERT INTO `website` VALUES (1420, '2020-01-16 14:46:47', NULL, 0, NULL, '深刻Office- 简洁、好用的办公软件', 'private', 'http://think.cqyzzkj.cn/', 0);
INSERT INTO `website` VALUES (1421, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-2ab4ce79b6ed4ed1ac4187931f9af41e.png', 0, NULL, '好866上网首页--简单 精致 权威', 'private', 'http://hao866.com/', 0);
INSERT INTO `website` VALUES (1422, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-07deaf5c33f2449a8dc5bf53f34fff13.png', 0, NULL, '极速Office 2017 个人版 - 追求高效的办公平台，最新免费下载官网!', 'private', 'https://www.jisuoffice.com/personal.html', 0);
INSERT INTO `website` VALUES (1423, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-413f8b9fc9f041b09ed3090720976659.png', 0, NULL, '学而思网校-在线学习更有效', 'private', 'https://www.xueersi.com/?xeswx_sourceid=38156196&xeswx_adsiteid=257253&xeswx_siteid=54&xeswx_extra=&referer=aHR0cHM6Ly9zcDAuYmFpZHUuY29tLzlxOUpjREhhMmdVMnBNYmdvWTNLL2FkcmMucGhwP3Q9MDZLTDAwYzAwZlppQjlzMEtXN3gwMHotSDZhTU9RN1UwMDAwMGNoWkxkYjAwMDAwSW1FUDlqLlRITHdHZVUzemVzMFVXZEJteS1iSWZLMTV5TmhQakstcnlta25qMHNQSG0xdUhEMElIWXZQV1Jzd1dOQXdiN0FySFBLckRjMW5idURmVzZ6d0Rtc1BiUnNuMXVEbmZLOTVnVHFGaGRXcHlmcW4xRFlQalQzcmo2em56dXNUaHFicHlmcW5IbTB1SGRDSVp3c3JCdEVJTElMUU05ZHV5TnpUdmI4bXZxVlFMOS1UejRzcFowT1R2cWRUaFAtNUhuM25IUnZuSGJ2Rk1QR0lBTnhweWZxUEhmaG15dzFwZ3ctZ3YtYjVIY2RQMWNkbnNLV1RobnFQSGJrUEgwJnRwbD10cGxfMTE1MzRfMTgyOTJfMTQxMzAmbD0xNTA3ODIxNDQ5JmF0dGFjaD1sb2NhdGlvbiUzRCUyNmxpbmtOYW1lJTNEJTI1RTYlMjVBMCUyNTg3JTI1RTUlMjU4NyUyNTg2JTI1RTUlMjVBNCUyNUI0JTI1RTklMjU4MyUyNUE4LSUyNUU2JTI1QTAlMjU4NyUyNUU5JTI1QTIlMjU5OC0lMjVFNCUyNUI4JTI1QkIlMjVFNiUyNUEwJTI1ODclMjVFOSUyNUEyJTI1OTglMjZsaW5rVGV4dCUzRCUyNUU1JTI1OUMlMjVBOCUyNUU3JTI1QkElMjVCRiUyNUU1JTI1QUQlMjVBNiUyNUU0JTI1QjklMjVBMCUyNUVGJTI1QkMlMjU4QyUyNUU0JTI1QjglMjU4QSUyNUU1JTI1QUQlMjVBNiUyNUU4JTI1ODAlMjU4QyUyNUU2JTI1ODAlMjU5RCUyNUU3JTI1QkQlMjU5MSUyNUU2JTI1QTAlMjVBMSUyNUVGJTI1QkMlMjU4MSUyNnhwJTNEaWQoJTI1MjJtMzE0NDc4ODgyM19jYW52YXMlMjUyMiklMjUyRkRJViUyNTVCMSUyNTVEJTI1MkZESVYlMjU1QjElMjU1RCUyNTJGRElWJTI1NUIxJTI1NUQlMjUyRkRJViUyNTVCMSUyNTVEJTI1MkZESVYlMjU1QjElMjU1RCUyNTJGSDIlMjU1QjElMjU1RCUyNTJGQSUyNTVCMSUyNTVEJTI2bGlua1R5cGUlM0QlMjZjaGVja3N1bSUzRDYxJmllPXV0Zi04JmY9OCZ0bj1iYWlkdSZ3ZD0lRTUlQUQlQTYlRTglODAlOEMlRTYlODAlOUQmb3E9JUU1JUFEJUE2JUU4JTgwJThDJUU2JTgwJTlEJnJxbGFuZz1jbiZzZWFyY2hfc2VsZWN0PWVuZ2luZV80&hot_url=aHR0cDovL3d3dy54dWVlcnNpLmNvbS94ZXMucGhwP3NvdXJjZT0zODE1NjE5NiZzaXRlX2lkPTU0JmFkc2l0ZV9pZD0yNTcyNTM=', 0);
INSERT INTO `website` VALUES (1424, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-a8eca06a6f7a4d2299e19d851c0803aa.png', 0, NULL, 'Mem Reduct', 'private', 'https://www.henrypp.org/product/memreduct', 0);
INSERT INTO `website` VALUES (1425, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-3f13ce9b0dc14248b9208d356be26064.png', 0, NULL, '简法主页-轻快上网体验', 'private', 'http://www.jianfast.com/?sj1', 0);
INSERT INTO `website` VALUES (1426, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-13a2acdad3cf438eaba18952629fd46b.png', 0, NULL, '笔记本网址导航_我的笔记本电脑上网主页_本本啦网址导航_最好的网址导航', 'private', 'http://www.benbenla.com/', 0);
INSERT INTO `website` VALUES (1427, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-d834b047be8a4c20aae4e10f1760e58c.png', 0, NULL, '升学e网通、升学助考一网通', 'private', 'https://www.ewt360.com/', 0);
INSERT INTO `website` VALUES (1428, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-5101ea5932c9459c993c983bd758c110.png', 0, NULL, '简单导航，简约网址大全！', 'private', 'http://www.66360.cn/', 0);
INSERT INTO `website` VALUES (1429, '2020-01-16 14:46:47', NULL, 0, NULL, '中国普法网', 'private', 'http://www.legalinfo.gov.cn/', 0);
INSERT INTO `website` VALUES (1430, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-d55fd6ea623f4e3d805f0f637b3807b1.png', 0, NULL, '易数一键还原，比Ghost更好用的系统备份与还原软件 -- 支持EFI启动的一键还原产品', 'private', 'https://www.onekeyrestore.cn/', 0);
INSERT INTO `website` VALUES (1431, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-ca4ed90a98aa4a4f8bf1d3b16338f2d6.png', 0, NULL, '智多赢选股专业版,服务电话01087417777', 'private', 'http://fxg.xinlande.com.cn/', 0);
INSERT INTO `website` VALUES (1432, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-d707339ccc584943a65560842682a279.png', 0, NULL, '【2018-暑】十次课学完数学高一上（课改）-学而思网校', 'private', 'http://www.xueersi.com/kc/49665-0-80964.html', 0);
INSERT INTO `website` VALUES (1433, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-78e750b97dbf48afbed3e84ac117740a.png', 0, NULL, '快捷导航 - 简单实用的上网导航！', 'private', 'http://www.31992.com/', 0);
INSERT INTO `website` VALUES (1434, '2020-01-16 14:46:47', NULL, 0, NULL, '成都市教育局', 'private', 'http://edu.chengdu.gov.cn/', 0);
INSERT INTO `website` VALUES (1435, '2020-01-16 14:46:47', NULL, 0, NULL, '成都市招生考试委员会办公室', 'private', 'https://www.cdzk.org/online_zk.html', 0);
INSERT INTO `website` VALUES (1436, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-7359daf4bcad4c338b2c4e13f5d2517d.png', 0, NULL, 'Yunqi Browser - 云起浏览器, 绿色双核浏览器', 'private', 'http://yunqi.arswp.com/', 0);
INSERT INTO `website` VALUES (1437, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-459cff43684a48c1bc28d896285361f0.png', 0, NULL, '财急送-下载列表', 'private', 'http://www.cjs.com.cn/download/applist.html?p=pc', 0);
INSERT INTO `website` VALUES (1438, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-5682fdf2a39a485f930b769290a0976a.png', 0, NULL, '优品财富 - 证券、股票、财经新媒体，金融科技大数据驱动涨停', 'private', 'http://www.upchina.com/', 0);
INSERT INTO `website` VALUES (1439, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-e993adbfd4a245e593f0ff74255fc376.png', 0, NULL, '星愿浏览器 - 大学生都爱用的浏览器 [官方网站]', 'private', 'https://www.twinkstar.com/', 0);
INSERT INTO `website` VALUES (1440, '2020-01-16 14:46:47', NULL, 0, NULL, '中信建投证券', 'private', 'https://www.csc108.com/rjxz/glrj.jspx#rjxz-1', 0);
INSERT INTO `website` VALUES (1441, '2020-01-16 14:46:47', NULL, 0, NULL, '黑点导航', 'private', 'http://www.ihddh.com/', 0);
INSERT INTO `website` VALUES (1442, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-d3277adc1e034a0b88b7ab4ede2d356b.png', 0, NULL, '天下网址导航 - 简洁而不简单的网址导航', 'private', 'http://hao.ilxtx.com/', 0);
INSERT INTO `website` VALUES (1443, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-2fd8af80f9e849d0882ca652166e2c7f.png', 0, NULL, 'gyhqcs - 雪球', 'private', 'https://xueqiu.com/3675395164', 0);
INSERT INTO `website` VALUES (1444, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-9a1f6f0129644735bc886b816f4dd348.png', 0, NULL, '淘股吧-中国最旺的财经社区 _股票论坛_股吧_博客_财经_股票_金融_美股_港股_实盘', 'private', 'https://www.taoguba.com.cn/', 0);
INSERT INTO `website` VALUES (1445, '2020-01-16 14:46:47', NULL, 0, NULL, '天风高财生_天风高财生交易软件官方下载中心_天风证券极速开户', 'private', 'http://tfgcs.tfzq.com/m_tf/gcs/views/download/index.html#/pc/downLoadPc', 0);
INSERT INTO `website` VALUES (1446, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-d18493311f7741e69fb4b14729c62818.png', 0, NULL, '小刺客炒股助手_股票软件_炒股软件', 'private', 'http://www.xcike.com/', 0);
INSERT INTO `website` VALUES (1447, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-bb0d01cfc859473d9a615e054f2241da.png', 0, NULL, '东北证券', 'private', 'http://www.nesc.cn/', 0);
INSERT INTO `website` VALUES (1448, '2020-01-16 14:46:47', NULL, 0, NULL, '同花顺免费炒股软件下载_股票软件_同花顺下载中心', 'private', 'http://download.10jqka.com.cn/free/', 0);
INSERT INTO `website` VALUES (1449, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-df901d60ed644456ab4746d27c112f58.png', 0, NULL, '来语直搜 - 去你想去的地方 青年上网主页', 'private', 'http://www.zhisou.cc/', 0);
INSERT INTO `website` VALUES (1450, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-352cbfe605694bc087c979202ad280b3.png', 0, NULL, '股票灯塔官网_智能机器人炒股神器', 'private', 'https://www.wedengta.com/', 0);
INSERT INTO `website` VALUES (1451, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-9ecdff92f7394b91959fcc7c9040b333.png', 0, NULL, '百分浏览器 - 追求速度、简约和安全的网络浏览器', 'private', 'https://www.centbrowser.cn/', 0);
INSERT INTO `website` VALUES (1452, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-ce89e91f81004b54ab0e2f7cadd87062.png', 0, NULL, '树德中学（光华校区）-学校首页', 'private', 'http://www.houxue.com/xuexiao/62450/', 0);
INSERT INTO `website` VALUES (1453, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-72dfe01351164df1a442d82bc5e08aae.png', 0, NULL, '笔点 - 用心做最简洁的网址导航_首页', 'private', 'https://www.bidianer.com/#/', 0);
INSERT INTO `website` VALUES (1454, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-93487d7e6c5c4106bef83dfd337170d4.png', 0, NULL, '习网-在线学习-习信-互联网教育第一平台', 'private', 'http://www.ciwong.com/', 0);
INSERT INTO `website` VALUES (1455, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-ee854373e023440185da9e7550aa1706.png', 0, NULL, '股吧_东方财富网旗下股票社区_东方财富网股吧', 'private', 'http://guba.eastmoney.com/', 0);
INSERT INTO `website` VALUES (1456, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-0661f7f890f6405085ef9e2aae232b21.png', 0, NULL, '招商证券', 'private', 'http://www.newone.com.cn/', 0);
INSERT INTO `website` VALUES (1457, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-ca98a06313fd4d7099ba7c3bc346c0b8.png', 0, NULL, '证券交易软件下载-国信证券公司官网', 'private', 'https://www.guosen.com.cn/gs/software/index.html', 0);
INSERT INTO `website` VALUES (1458, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-8616bf5bdcb3490c9a47b90180172245.png', 0, NULL, '交易师，交易师软件下载，交易师培训课程', 'private', 'http://www.ktkt.com/download/', 0);
INSERT INTO `website` VALUES (1459, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-ff71d99ca4d64b51ae28327281568aff.png', 0, NULL, '韩博士一键重装系统_电脑重装系统_韩博士装机大师官网', 'private', 'https://www.hanboshi.com/', 0);
INSERT INTO `website` VALUES (1460, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-42516e62f1f045ac8eebfb1f8b281a0d.png', 0, NULL, '成都市_安全教育平台', 'private', 'https://chengdu.safetree.com.cn/MainPage.html', 0);
INSERT INTO `website` VALUES (1461, '2020-01-16 14:46:47', NULL, 0, NULL, '华西证券', 'private', 'http://www.hx168.com.cn/hxzq/hxindex.html', 0);
INSERT INTO `website` VALUES (1462, '2020-01-16 14:46:47', NULL, 0, NULL, '懂牛股票官方网站', 'private', 'http://bj.dn8188.com/product.html', 0);
INSERT INTO `website` VALUES (1463, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-30ed2d71295b44f3a54e27dad694be87.png', 0, NULL, '成都市人力资源和社会保障局', 'private', 'http://cdhrss.chengdu.gov.cn/', 0);
INSERT INTO `website` VALUES (1464, '2020-01-16 14:46:47', NULL, 0, NULL, '开始', 'private', 'https://a.maorx.cn/', 0);
INSERT INTO `website` VALUES (1465, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-f8719a0077d94f0e89d24831786ec41d.png', 0, NULL, '麻子365(清爽版) — 我的上网主页，网址导航', 'private', 'http://www.mazi365.com/qc.html', 0);
INSERT INTO `website` VALUES (1466, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-e7a0e338d9c9468fbf4d0aced232eff2.png', 0, NULL, '便查网-个性首页|便民查询|便利查|网址导航', 'private', 'https://www.52blc.com/', 0);
INSERT INTO `website` VALUES (1467, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-c5e75fa87ad34c838d2ac538cbae8ab0.png', 0, NULL, '某柠檬_柠檬味的导航', 'private', 'http://www.moulem.com/?h01z', 0);
INSERT INTO `website` VALUES (1468, '2020-01-16 14:46:47', 'upload/2020/1/couldr_com_-fdaea719b86e4d58aab150a38778f178.png', 0, NULL, 'Seiore浏览器|Seiore浏览器下载 v1.3396.00_ - pc6下载站', 'private', 'http://www.pc6.com/softview/SoftView_657718.html', 0);
INSERT INTO `website` VALUES (1475, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574394895548jd.svg', 0, '', '京东商城', 'private', 'https://union-click.jd.com/jdc?e=&p=AyIGZRprFDJWWA1FBCVbV0IUWVALHFRBEwQAQB1AWQkFaxxfaF4TYDpdYRFTTwUFa1UVfz1dB3UOHjdVE14dBREEUxpbJQITBlUSUhwCFAVlK1sUMllpVCtbHQYXA1AZXRwAIgdRHV8WBxoAXRJYHAUiAFUSa05XfAEGSw8QCxZTXE9aFAciN2UYayUyEgdlG2tKRk9aZRlaFAYb', 0);
INSERT INTO `website` VALUES (1476, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574402313228xiecheng.svg', 0, '', '携程网', 'private', '//www.ctrip.com/?AllianceID=1113213&sid=2592216&ouid=&app=0101F00', 0);
INSERT INTO `website` VALUES (1477, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574402445651feizhu.svg', 0, '', '飞猪旅行', 'private', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DxZbBSgQNCogcQipKwQzePCperVdZeJviEViQ0P1Vf2kguMN8XjClAnXpJ%2FfwZLjhPhnZriqYkOOWL3sRPByx3uAF3mBPtQfmMXl86FjfSnuBai7QrjX6CpdjKbsmTHrTfu6rqwtgiq7RDtA7JsJpDL0CYBEjBf0r6du04PdR3OeCGs2WW5w7s021PSszE7caBHoGxfzSt73C45iNpd3bHT7gIqY5cpkX8ymtlBYDG%2FjGDF1NzTQoPw%3D%3D', 0);
INSERT INTO `website` VALUES (1478, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574397741691suning.svg', 0, '', '苏宁电器', 'private', 'https://sugs.suning.com/outstation.htm?p=BFAGFlINVAAQQhVjenFkXUsYVhAAR3duYn1QDCQ1dXNbSVINYzkoIh0XHREaHh0TZxRaIhQISRQ8V1UPVFoDGlBXGEJPCEoKWEtSLjo7aUtdHggSCgcmdyY6BwYvNGolDh5JDS45d30JBRoWGBMEG2cIFmwGREBSclBbRlBPGA', 0);
INSERT INTO `website` VALUES (1479, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574398211213taobao.svg', 0, '', '淘宝网', 'private', 'https://www.taobao.com/', 0);
INSERT INTO `website` VALUES (1480, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574398320508tmall.svg', 0, '', '天猫', 'private', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DaL%2BQgG63yqocQipKwQzePCperVdZeJvipRe%2F8jaAHci5VBFTL4hn2aWk728G9XronwuRopoI2iPYPGzLAI3NESZwJQ0Ki2xHblYPHSKLwaje4GwpZvtc324LYGCG7y%2BCQBRB1XJCO291csUTtILxeLHfv3%2BBYcPWXmPstG5W4bHGJe8N%2FwNpGw%3D%3D', 0);
INSERT INTO `website` VALUES (1481, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574398443756amazon.svg', 0, '', '亚马逊', 'private', 'https://www.amazon.cn/', 0);
INSERT INTO `website` VALUES (1482, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574398792388kaola.svg', 0, '', '考拉海购', 'private', 'https://www.kaola.com/', 0);
INSERT INTO `website` VALUES (1483, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574398927288aliyun.svg', 0, '', '阿里云', 'private', 'https://s.click.taobao.com/7gUrfuv', 0);
INSERT INTO `website` VALUES (1484, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574399812291bilibili.svg', 0, '', '哔哩哔哩', 'private', 'https://www.bilibili.com/', 0);
INSERT INTO `website` VALUES (1485, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574409294618v2ex.png', 0, '', 'v2ex', 'private', 'https://www.v2ex.com/', 0);
INSERT INTO `website` VALUES (1486, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574409299898juejin.svg', 0, '', '掘金', 'private', 'https://juejin.im/', 0);
INSERT INTO `website` VALUES (1487, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574409591168douban.svg', 0, '', '豆瓣', 'private', 'https://www.douban.com/', 0);
INSERT INTO `website` VALUES (1488, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574409590807zhihu.svg', 0, '', '知乎', 'private', 'https://www.zhihu.com/', 0);
INSERT INTO `website` VALUES (1489, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574409589994weibo.svg', 0, '', '新浪微博', 'private', 'http://weibo.com/', 0);
INSERT INTO `website` VALUES (1490, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1576043939448huya.svg', 0, '', '虎牙直播', 'private', 'https://www.huya.com/', 0);
INSERT INTO `website` VALUES (1491, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1576044033399douyu.svg', 0, '', '斗鱼', 'private', 'https://www.douyu.com/', 0);
INSERT INTO `website` VALUES (1492, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1576044185796fanyi.png', 0, '', '百度翻译', 'private', 'http://www.168dh.cn', 0);
INSERT INTO `website` VALUES (1493, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574399865411iqiyi.svg', 0, '', '爱奇艺', 'private', 'https://www.iqiyi.com/', 0);
INSERT INTO `website` VALUES (1494, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574399928451tengxunshipin.svg', 0, '', '腾讯视频', 'private', 'https://v.qq.com/', 0);
INSERT INTO `website` VALUES (1495, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574400003893youku.svg', 0, '', '优酷', 'private', 'https://www.youku.com/', 0);
INSERT INTO `website` VALUES (1496, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/157604535119558.png', 0, '', '58同城', 'private', 'https://www.58.com/', 0);
INSERT INTO `website` VALUES (1497, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1574404772897tengxunxinwen.svg', 0, '', '腾讯新闻', 'private', 'https://news.qq.com/', 0);
INSERT INTO `website` VALUES (1498, '2020-01-16 22:20:42', 'http://img.168dh.cn/website/1576045754356qqemail.png', 0, '', 'QQ邮箱', 'private', 'https://mail.qq.com/', 0);

-- ----------------------------
-- Table structure for website_category
-- ----------------------------
DROP TABLE IF EXISTS `website_category`;
CREATE TABLE `website_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NULL DEFAULT NULL,
  `website_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1433 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of website_category
-- ----------------------------
INSERT INTO `website_category` VALUES (1346, 148, 1406);
INSERT INTO `website_category` VALUES (1345, 148, 1405);
INSERT INTO `website_category` VALUES (1344, 148, 1404);
INSERT INTO `website_category` VALUES (1343, 147, 1403);
INSERT INTO `website_category` VALUES (1342, 147, 1402);
INSERT INTO `website_category` VALUES (1341, 147, 1401);
INSERT INTO `website_category` VALUES (1340, 147, 1400);
INSERT INTO `website_category` VALUES (1339, 147, 1399);
INSERT INTO `website_category` VALUES (1338, 147, 1398);
INSERT INTO `website_category` VALUES (1337, 147, 1397);
INSERT INTO `website_category` VALUES (1336, 147, 1396);
INSERT INTO `website_category` VALUES (1335, 146, 1395);
INSERT INTO `website_category` VALUES (1334, 146, 1394);
INSERT INTO `website_category` VALUES (1333, 146, 1393);
INSERT INTO `website_category` VALUES (1332, 146, 1392);
INSERT INTO `website_category` VALUES (1331, 146, 1391);
INSERT INTO `website_category` VALUES (1330, 146, 1390);
INSERT INTO `website_category` VALUES (1329, 146, 1389);
INSERT INTO `website_category` VALUES (1328, 145, 1388);
INSERT INTO `website_category` VALUES (1327, 145, 1387);
INSERT INTO `website_category` VALUES (1326, 145, 1386);
INSERT INTO `website_category` VALUES (1325, 145, 1385);
INSERT INTO `website_category` VALUES (1324, 145, 1384);
INSERT INTO `website_category` VALUES (1323, 145, 1383);
INSERT INTO `website_category` VALUES (1322, 145, 1382);
INSERT INTO `website_category` VALUES (1321, 145, 1381);
INSERT INTO `website_category` VALUES (1320, 145, 1380);
INSERT INTO `website_category` VALUES (1319, 145, 1379);
INSERT INTO `website_category` VALUES (1318, 145, 1378);
INSERT INTO `website_category` VALUES (1317, 145, 1377);
INSERT INTO `website_category` VALUES (1316, 145, 1376);
INSERT INTO `website_category` VALUES (1315, 145, 1375);
INSERT INTO `website_category` VALUES (1314, 145, 1374);
INSERT INTO `website_category` VALUES (1313, 145, 1373);
INSERT INTO `website_category` VALUES (1312, 145, 1372);
INSERT INTO `website_category` VALUES (1311, 144, 1371);
INSERT INTO `website_category` VALUES (1310, 144, 1370);
INSERT INTO `website_category` VALUES (1309, 144, 1369);
INSERT INTO `website_category` VALUES (1308, 144, 1368);
INSERT INTO `website_category` VALUES (1307, 144, 1367);
INSERT INTO `website_category` VALUES (1306, 144, 1366);
INSERT INTO `website_category` VALUES (1305, 144, 1365);
INSERT INTO `website_category` VALUES (1304, 144, 1364);
INSERT INTO `website_category` VALUES (1303, 144, 1363);
INSERT INTO `website_category` VALUES (1302, 144, 1362);
INSERT INTO `website_category` VALUES (1301, 144, 1361);
INSERT INTO `website_category` VALUES (1300, 144, 1360);
INSERT INTO `website_category` VALUES (1299, 143, 1359);
INSERT INTO `website_category` VALUES (1298, 143, 1358);
INSERT INTO `website_category` VALUES (1297, 143, 1357);
INSERT INTO `website_category` VALUES (1296, 143, 1356);
INSERT INTO `website_category` VALUES (1295, 143, 1355);
INSERT INTO `website_category` VALUES (1294, 143, 1354);
INSERT INTO `website_category` VALUES (1293, 142, 1353);
INSERT INTO `website_category` VALUES (1292, 142, 1352);
INSERT INTO `website_category` VALUES (1291, 142, 1351);
INSERT INTO `website_category` VALUES (1290, 142, 1350);
INSERT INTO `website_category` VALUES (1289, 142, 1349);
INSERT INTO `website_category` VALUES (1288, 142, 1348);
INSERT INTO `website_category` VALUES (1287, 141, 1347);
INSERT INTO `website_category` VALUES (1286, 141, 1346);
INSERT INTO `website_category` VALUES (1285, 141, 1345);
INSERT INTO `website_category` VALUES (1284, 141, 1344);
INSERT INTO `website_category` VALUES (1283, 141, 1343);
INSERT INTO `website_category` VALUES (1282, 140, 1342);
INSERT INTO `website_category` VALUES (1281, 140, 1341);
INSERT INTO `website_category` VALUES (1280, 140, 1340);
INSERT INTO `website_category` VALUES (1279, 140, 1339);
INSERT INTO `website_category` VALUES (1278, 140, 1338);
INSERT INTO `website_category` VALUES (1277, 140, 1337);
INSERT INTO `website_category` VALUES (1276, 139, 1336);
INSERT INTO `website_category` VALUES (1275, 139, 1335);
INSERT INTO `website_category` VALUES (1274, 139, 1334);
INSERT INTO `website_category` VALUES (1273, 139, 1333);
INSERT INTO `website_category` VALUES (1272, 139, 1332);
INSERT INTO `website_category` VALUES (1271, 138, 1331);
INSERT INTO `website_category` VALUES (1270, 138, 1330);
INSERT INTO `website_category` VALUES (1269, 138, 1329);
INSERT INTO `website_category` VALUES (1268, 138, 1328);
INSERT INTO `website_category` VALUES (1267, 138, 1327);
INSERT INTO `website_category` VALUES (1266, 137, 1326);
INSERT INTO `website_category` VALUES (1265, 137, 1325);
INSERT INTO `website_category` VALUES (1264, 137, 1324);
INSERT INTO `website_category` VALUES (1263, 137, 1323);
INSERT INTO `website_category` VALUES (1262, 137, 1322);
INSERT INTO `website_category` VALUES (1261, 137, 1321);
INSERT INTO `website_category` VALUES (1260, 137, 1320);
INSERT INTO `website_category` VALUES (1259, 137, 1319);
INSERT INTO `website_category` VALUES (1258, 137, 1318);
INSERT INTO `website_category` VALUES (1257, 136, 1317);
INSERT INTO `website_category` VALUES (1256, 136, 1316);
INSERT INTO `website_category` VALUES (1255, 136, 1315);
INSERT INTO `website_category` VALUES (1254, 136, 1314);
INSERT INTO `website_category` VALUES (1253, 136, 1313);
INSERT INTO `website_category` VALUES (1252, 136, 1312);
INSERT INTO `website_category` VALUES (1251, 136, 1311);
INSERT INTO `website_category` VALUES (1250, 136, 1310);
INSERT INTO `website_category` VALUES (1249, 136, 1309);
INSERT INTO `website_category` VALUES (1248, 136, 1308);
INSERT INTO `website_category` VALUES (1247, 135, 1307);
INSERT INTO `website_category` VALUES (1246, 135, 1306);
INSERT INTO `website_category` VALUES (1245, 135, 1305);
INSERT INTO `website_category` VALUES (1244, 135, 1304);
INSERT INTO `website_category` VALUES (1243, 135, 1303);
INSERT INTO `website_category` VALUES (1242, 135, 1302);
INSERT INTO `website_category` VALUES (1241, 135, 1301);
INSERT INTO `website_category` VALUES (1240, 135, 1300);
INSERT INTO `website_category` VALUES (1239, 135, 1299);
INSERT INTO `website_category` VALUES (1238, 135, 1298);
INSERT INTO `website_category` VALUES (1237, 135, 1297);
INSERT INTO `website_category` VALUES (1236, 135, 1296);
INSERT INTO `website_category` VALUES (1235, 135, 1295);
INSERT INTO `website_category` VALUES (1234, 135, 1294);
INSERT INTO `website_category` VALUES (1233, 135, 1293);
INSERT INTO `website_category` VALUES (1232, 135, 1292);
INSERT INTO `website_category` VALUES (1231, 134, 1291);
INSERT INTO `website_category` VALUES (1230, 134, 1290);
INSERT INTO `website_category` VALUES (1229, 134, 1289);
INSERT INTO `website_category` VALUES (1228, 134, 1288);
INSERT INTO `website_category` VALUES (1227, 134, 1287);
INSERT INTO `website_category` VALUES (1226, 134, 1286);
INSERT INTO `website_category` VALUES (1225, 134, 1285);
INSERT INTO `website_category` VALUES (1224, 134, 1284);
INSERT INTO `website_category` VALUES (1223, 134, 1283);
INSERT INTO `website_category` VALUES (1222, 134, 1282);
INSERT INTO `website_category` VALUES (1221, 134, 1281);
INSERT INTO `website_category` VALUES (1220, 134, 1280);
INSERT INTO `website_category` VALUES (1219, 134, 1279);
INSERT INTO `website_category` VALUES (1218, 133, 1278);
INSERT INTO `website_category` VALUES (1217, 133, 1277);
INSERT INTO `website_category` VALUES (1216, 133, 1276);
INSERT INTO `website_category` VALUES (1215, 133, 1275);
INSERT INTO `website_category` VALUES (1214, 133, 1274);
INSERT INTO `website_category` VALUES (1213, 133, 1273);
INSERT INTO `website_category` VALUES (1212, 133, 1272);
INSERT INTO `website_category` VALUES (1211, 133, 1271);
INSERT INTO `website_category` VALUES (1210, 133, 1270);
INSERT INTO `website_category` VALUES (1209, 133, 1269);
INSERT INTO `website_category` VALUES (1208, 133, 1268);
INSERT INTO `website_category` VALUES (1207, 133, 1267);
INSERT INTO `website_category` VALUES (1206, 132, 1266);
INSERT INTO `website_category` VALUES (1205, 132, 1265);
INSERT INTO `website_category` VALUES (1204, 132, 1264);
INSERT INTO `website_category` VALUES (1203, 132, 1263);
INSERT INTO `website_category` VALUES (1202, 132, 1262);
INSERT INTO `website_category` VALUES (1201, 132, 1261);
INSERT INTO `website_category` VALUES (1200, 132, 1260);
INSERT INTO `website_category` VALUES (1199, 132, 1259);
INSERT INTO `website_category` VALUES (1198, 132, 1258);
INSERT INTO `website_category` VALUES (1197, 132, 1257);
INSERT INTO `website_category` VALUES (1196, 132, 1256);
INSERT INTO `website_category` VALUES (1195, 132, 1255);
INSERT INTO `website_category` VALUES (1194, 132, 1254);
INSERT INTO `website_category` VALUES (1193, 132, 1253);
INSERT INTO `website_category` VALUES (1192, 132, 1252);
INSERT INTO `website_category` VALUES (1191, 132, 1251);
INSERT INTO `website_category` VALUES (1190, 132, 1250);
INSERT INTO `website_category` VALUES (1189, 132, 1249);
INSERT INTO `website_category` VALUES (1188, 132, 1248);
INSERT INTO `website_category` VALUES (1187, 132, 1247);
INSERT INTO `website_category` VALUES (1186, 132, 1246);
INSERT INTO `website_category` VALUES (1185, 132, 1245);
INSERT INTO `website_category` VALUES (1184, 132, 1244);
INSERT INTO `website_category` VALUES (1183, 132, 1243);
INSERT INTO `website_category` VALUES (1182, 132, 1242);
INSERT INTO `website_category` VALUES (1181, 132, 1241);
INSERT INTO `website_category` VALUES (1180, 132, 1240);
INSERT INTO `website_category` VALUES (1179, 132, 1239);
INSERT INTO `website_category` VALUES (1178, 132, 1238);
INSERT INTO `website_category` VALUES (1177, 132, 1237);
INSERT INTO `website_category` VALUES (1176, 131, 1236);
INSERT INTO `website_category` VALUES (1175, 131, 1235);
INSERT INTO `website_category` VALUES (1174, 131, 1234);
INSERT INTO `website_category` VALUES (1173, 131, 1233);
INSERT INTO `website_category` VALUES (1172, 131, 1232);
INSERT INTO `website_category` VALUES (1171, 131, 1231);
INSERT INTO `website_category` VALUES (1170, 131, 1230);
INSERT INTO `website_category` VALUES (1169, 131, 1229);
INSERT INTO `website_category` VALUES (1168, 130, 1228);
INSERT INTO `website_category` VALUES (1167, 130, 1227);
INSERT INTO `website_category` VALUES (1166, 130, 1226);
INSERT INTO `website_category` VALUES (1165, 130, 1225);
INSERT INTO `website_category` VALUES (1164, 130, 1224);
INSERT INTO `website_category` VALUES (1163, 130, 1223);
INSERT INTO `website_category` VALUES (1162, 130, 1222);
INSERT INTO `website_category` VALUES (1161, 130, 1221);
INSERT INTO `website_category` VALUES (1160, 129, 1220);
INSERT INTO `website_category` VALUES (1159, 129, 1219);
INSERT INTO `website_category` VALUES (1158, 129, 1218);
INSERT INTO `website_category` VALUES (1157, 129, 1217);
INSERT INTO `website_category` VALUES (1156, 129, 1216);
INSERT INTO `website_category` VALUES (1155, 129, 1215);
INSERT INTO `website_category` VALUES (1154, 129, 1214);
INSERT INTO `website_category` VALUES (1153, 129, 1213);
INSERT INTO `website_category` VALUES (1152, 128, 1212);
INSERT INTO `website_category` VALUES (1151, 128, 1211);
INSERT INTO `website_category` VALUES (1150, 128, 1210);
INSERT INTO `website_category` VALUES (1149, 128, 1209);
INSERT INTO `website_category` VALUES (1148, 128, 1208);
INSERT INTO `website_category` VALUES (1147, 128, 1207);
INSERT INTO `website_category` VALUES (1146, 128, 1206);
INSERT INTO `website_category` VALUES (1145, 128, 1205);
INSERT INTO `website_category` VALUES (1144, 127, 1204);
INSERT INTO `website_category` VALUES (1143, 127, 1203);
INSERT INTO `website_category` VALUES (1142, 127, 1202);
INSERT INTO `website_category` VALUES (1141, 127, 1201);
INSERT INTO `website_category` VALUES (1140, 126, 1200);
INSERT INTO `website_category` VALUES (1139, 126, 1199);
INSERT INTO `website_category` VALUES (1138, 126, 1198);
INSERT INTO `website_category` VALUES (1137, 126, 1197);
INSERT INTO `website_category` VALUES (1136, 126, 1196);
INSERT INTO `website_category` VALUES (1135, 126, 1195);
INSERT INTO `website_category` VALUES (1134, 126, 1194);
INSERT INTO `website_category` VALUES (1133, 126, 1193);
INSERT INTO `website_category` VALUES (1132, 126, 1192);
INSERT INTO `website_category` VALUES (1131, 126, 1191);
INSERT INTO `website_category` VALUES (1130, 126, 1190);
INSERT INTO `website_category` VALUES (1129, 126, 1189);
INSERT INTO `website_category` VALUES (1128, 126, 1188);
INSERT INTO `website_category` VALUES (1127, 126, 1187);
INSERT INTO `website_category` VALUES (1126, 126, 1186);
INSERT INTO `website_category` VALUES (1125, 126, 1185);
INSERT INTO `website_category` VALUES (1124, 126, 1184);
INSERT INTO `website_category` VALUES (1123, 126, 1183);
INSERT INTO `website_category` VALUES (1122, 126, 1182);
INSERT INTO `website_category` VALUES (1121, 126, 1181);
INSERT INTO `website_category` VALUES (1120, 126, 1180);
INSERT INTO `website_category` VALUES (1119, 125, 1179);
INSERT INTO `website_category` VALUES (1118, 125, 1178);
INSERT INTO `website_category` VALUES (1117, 125, 1177);
INSERT INTO `website_category` VALUES (1116, 125, 1176);
INSERT INTO `website_category` VALUES (1115, 125, 1175);
INSERT INTO `website_category` VALUES (1114, 125, 1174);
INSERT INTO `website_category` VALUES (1113, 125, 1173);
INSERT INTO `website_category` VALUES (1112, 124, 1172);
INSERT INTO `website_category` VALUES (1111, 124, 1171);
INSERT INTO `website_category` VALUES (1110, 124, 1170);
INSERT INTO `website_category` VALUES (1109, 124, 1169);
INSERT INTO `website_category` VALUES (1108, 124, 1168);
INSERT INTO `website_category` VALUES (1107, 124, 1167);
INSERT INTO `website_category` VALUES (1106, 124, 1166);
INSERT INTO `website_category` VALUES (1105, 124, 1165);
INSERT INTO `website_category` VALUES (1104, 124, 1164);
INSERT INTO `website_category` VALUES (1103, 124, 1163);
INSERT INTO `website_category` VALUES (1102, 124, 1162);
INSERT INTO `website_category` VALUES (1101, 124, 1161);
INSERT INTO `website_category` VALUES (1100, 124, 1160);
INSERT INTO `website_category` VALUES (1099, 124, 1159);
INSERT INTO `website_category` VALUES (1098, 123, 1158);
INSERT INTO `website_category` VALUES (1097, 123, 1157);
INSERT INTO `website_category` VALUES (1096, 123, 1156);
INSERT INTO `website_category` VALUES (1095, 123, 1155);
INSERT INTO `website_category` VALUES (1094, 123, 1154);
INSERT INTO `website_category` VALUES (1093, 123, 1153);
INSERT INTO `website_category` VALUES (1092, 123, 1152);
INSERT INTO `website_category` VALUES (1091, 123, 1151);
INSERT INTO `website_category` VALUES (1090, 123, 1150);
INSERT INTO `website_category` VALUES (1089, 123, 1149);
INSERT INTO `website_category` VALUES (1088, 123, 1148);
INSERT INTO `website_category` VALUES (1087, 123, 1147);
INSERT INTO `website_category` VALUES (1086, 123, 1146);
INSERT INTO `website_category` VALUES (1085, 123, 1145);
INSERT INTO `website_category` VALUES (1084, 123, 1144);
INSERT INTO `website_category` VALUES (1083, 122, 1143);
INSERT INTO `website_category` VALUES (1082, 122, 1142);
INSERT INTO `website_category` VALUES (1081, 122, 1141);
INSERT INTO `website_category` VALUES (1080, 122, 1140);
INSERT INTO `website_category` VALUES (1079, 122, 1139);
INSERT INTO `website_category` VALUES (1078, 122, 1138);
INSERT INTO `website_category` VALUES (1077, 122, 1137);
INSERT INTO `website_category` VALUES (1076, 122, 1136);
INSERT INTO `website_category` VALUES (1075, 122, 1135);
INSERT INTO `website_category` VALUES (1074, 122, 1134);
INSERT INTO `website_category` VALUES (1073, 122, 1133);
INSERT INTO `website_category` VALUES (1072, 122, 1132);
INSERT INTO `website_category` VALUES (1071, 122, 1131);
INSERT INTO `website_category` VALUES (1070, 122, 1130);
INSERT INTO `website_category` VALUES (1069, 122, 1129);
INSERT INTO `website_category` VALUES (1068, 122, 1128);
INSERT INTO `website_category` VALUES (1067, 122, 1127);
INSERT INTO `website_category` VALUES (1066, 122, 1126);
INSERT INTO `website_category` VALUES (1065, 122, 1125);
INSERT INTO `website_category` VALUES (1064, 122, 1124);
INSERT INTO `website_category` VALUES (1063, 122, 1123);
INSERT INTO `website_category` VALUES (1062, 122, 1122);
INSERT INTO `website_category` VALUES (1061, 122, 1121);
INSERT INTO `website_category` VALUES (1060, 122, 1120);
INSERT INTO `website_category` VALUES (1059, 122, 1119);
INSERT INTO `website_category` VALUES (1058, 122, 1118);
INSERT INTO `website_category` VALUES (1057, 122, 1117);
INSERT INTO `website_category` VALUES (1056, 122, 1116);
INSERT INTO `website_category` VALUES (1055, 121, 1115);
INSERT INTO `website_category` VALUES (1054, 121, 1114);
INSERT INTO `website_category` VALUES (1053, 121, 1113);
INSERT INTO `website_category` VALUES (1052, 121, 1112);
INSERT INTO `website_category` VALUES (1051, 121, 1111);
INSERT INTO `website_category` VALUES (1050, 121, 1110);
INSERT INTO `website_category` VALUES (1049, 120, 1109);
INSERT INTO `website_category` VALUES (1048, 120, 1108);
INSERT INTO `website_category` VALUES (1047, 120, 1107);
INSERT INTO `website_category` VALUES (1046, 120, 1106);
INSERT INTO `website_category` VALUES (1045, 120, 1105);
INSERT INTO `website_category` VALUES (1044, 120, 1104);
INSERT INTO `website_category` VALUES (1043, 120, 1103);
INSERT INTO `website_category` VALUES (1042, 120, 1102);
INSERT INTO `website_category` VALUES (1041, 120, 1101);
INSERT INTO `website_category` VALUES (1040, 120, 1100);
INSERT INTO `website_category` VALUES (1039, 119, 1099);
INSERT INTO `website_category` VALUES (1038, 119, 1098);
INSERT INTO `website_category` VALUES (1037, 119, 1097);
INSERT INTO `website_category` VALUES (1036, 119, 1096);
INSERT INTO `website_category` VALUES (1035, 119, 1095);
INSERT INTO `website_category` VALUES (1034, 119, 1094);
INSERT INTO `website_category` VALUES (1033, 119, 1093);
INSERT INTO `website_category` VALUES (1032, 119, 1092);
INSERT INTO `website_category` VALUES (1031, 119, 1091);
INSERT INTO `website_category` VALUES (1030, 119, 1090);
INSERT INTO `website_category` VALUES (1029, 119, 1089);
INSERT INTO `website_category` VALUES (1028, 119, 1088);
INSERT INTO `website_category` VALUES (1027, 119, 1087);
INSERT INTO `website_category` VALUES (1026, 119, 1086);
INSERT INTO `website_category` VALUES (1025, 118, 1085);
INSERT INTO `website_category` VALUES (1024, 118, 1084);
INSERT INTO `website_category` VALUES (1023, 118, 1083);
INSERT INTO `website_category` VALUES (1022, 118, 1082);
INSERT INTO `website_category` VALUES (1021, 118, 1081);
INSERT INTO `website_category` VALUES (1020, 118, 1080);
INSERT INTO `website_category` VALUES (1019, 118, 1079);
INSERT INTO `website_category` VALUES (1018, 118, 1078);
INSERT INTO `website_category` VALUES (1017, 118, 1077);
INSERT INTO `website_category` VALUES (1016, 118, 1076);
INSERT INTO `website_category` VALUES (1015, 118, 1075);
INSERT INTO `website_category` VALUES (1014, 118, 1074);
INSERT INTO `website_category` VALUES (1013, 118, 1073);
INSERT INTO `website_category` VALUES (1012, 117, 1072);
INSERT INTO `website_category` VALUES (1011, 117, 1071);
INSERT INTO `website_category` VALUES (1010, 117, 1070);
INSERT INTO `website_category` VALUES (1009, 117, 1069);
INSERT INTO `website_category` VALUES (1008, 117, 1068);
INSERT INTO `website_category` VALUES (1007, 117, 1067);
INSERT INTO `website_category` VALUES (1006, 117, 1066);
INSERT INTO `website_category` VALUES (1005, 117, 1065);
INSERT INTO `website_category` VALUES (1004, 117, 1064);
INSERT INTO `website_category` VALUES (1003, 117, 1063);
INSERT INTO `website_category` VALUES (1002, 117, 1062);
INSERT INTO `website_category` VALUES (1001, 117, 1061);
INSERT INTO `website_category` VALUES (1000, 117, 1060);
INSERT INTO `website_category` VALUES (999, 117, 1059);
INSERT INTO `website_category` VALUES (998, 117, 1058);
INSERT INTO `website_category` VALUES (997, 117, 1057);
INSERT INTO `website_category` VALUES (996, 117, 1056);
INSERT INTO `website_category` VALUES (995, 117, 1055);
INSERT INTO `website_category` VALUES (994, 117, 1054);
INSERT INTO `website_category` VALUES (993, 117, 1053);
INSERT INTO `website_category` VALUES (992, 117, 1052);
INSERT INTO `website_category` VALUES (991, 117, 1051);
INSERT INTO `website_category` VALUES (990, 117, 1050);
INSERT INTO `website_category` VALUES (989, 116, 1049);
INSERT INTO `website_category` VALUES (988, 116, 1048);
INSERT INTO `website_category` VALUES (987, 116, 1047);
INSERT INTO `website_category` VALUES (986, 116, 1046);
INSERT INTO `website_category` VALUES (985, 116, 1045);
INSERT INTO `website_category` VALUES (984, 116, 1044);
INSERT INTO `website_category` VALUES (983, 116, 1043);
INSERT INTO `website_category` VALUES (982, 116, 1042);
INSERT INTO `website_category` VALUES (981, 116, 1041);
INSERT INTO `website_category` VALUES (980, 116, 1040);
INSERT INTO `website_category` VALUES (979, 116, 1039);
INSERT INTO `website_category` VALUES (978, 116, 1038);
INSERT INTO `website_category` VALUES (977, 116, 1037);
INSERT INTO `website_category` VALUES (976, 116, 1036);
INSERT INTO `website_category` VALUES (975, 116, 1035);
INSERT INTO `website_category` VALUES (974, 116, 1034);
INSERT INTO `website_category` VALUES (973, 116, 1033);
INSERT INTO `website_category` VALUES (972, 116, 1032);
INSERT INTO `website_category` VALUES (971, 116, 1031);
INSERT INTO `website_category` VALUES (970, 116, 1030);
INSERT INTO `website_category` VALUES (969, 116, 1029);
INSERT INTO `website_category` VALUES (968, 116, 1028);
INSERT INTO `website_category` VALUES (967, 116, 1027);
INSERT INTO `website_category` VALUES (966, 115, 1026);
INSERT INTO `website_category` VALUES (965, 115, 1025);
INSERT INTO `website_category` VALUES (964, 115, 1024);
INSERT INTO `website_category` VALUES (963, 115, 1023);
INSERT INTO `website_category` VALUES (962, 115, 1022);
INSERT INTO `website_category` VALUES (961, 115, 1021);
INSERT INTO `website_category` VALUES (960, 115, 1020);
INSERT INTO `website_category` VALUES (959, 115, 1019);
INSERT INTO `website_category` VALUES (958, 115, 1018);
INSERT INTO `website_category` VALUES (957, 115, 1017);
INSERT INTO `website_category` VALUES (956, 115, 1016);
INSERT INTO `website_category` VALUES (955, 115, 1015);
INSERT INTO `website_category` VALUES (954, 115, 1014);
INSERT INTO `website_category` VALUES (953, 115, 1013);
INSERT INTO `website_category` VALUES (952, 115, 1012);
INSERT INTO `website_category` VALUES (951, 115, 1011);
INSERT INTO `website_category` VALUES (950, 115, 1010);
INSERT INTO `website_category` VALUES (949, 115, 1009);
INSERT INTO `website_category` VALUES (948, 115, 1008);
INSERT INTO `website_category` VALUES (947, 115, 1007);
INSERT INTO `website_category` VALUES (946, 115, 1006);
INSERT INTO `website_category` VALUES (945, 115, 1005);
INSERT INTO `website_category` VALUES (944, 115, 1004);
INSERT INTO `website_category` VALUES (943, 115, 1003);
INSERT INTO `website_category` VALUES (942, 114, 1002);
INSERT INTO `website_category` VALUES (941, 114, 1001);
INSERT INTO `website_category` VALUES (940, 114, 1000);
INSERT INTO `website_category` VALUES (939, 114, 999);
INSERT INTO `website_category` VALUES (938, 114, 998);
INSERT INTO `website_category` VALUES (937, 114, 997);
INSERT INTO `website_category` VALUES (936, 114, 996);
INSERT INTO `website_category` VALUES (935, 114, 995);
INSERT INTO `website_category` VALUES (934, 114, 994);
INSERT INTO `website_category` VALUES (933, 113, 993);
INSERT INTO `website_category` VALUES (932, 113, 992);
INSERT INTO `website_category` VALUES (931, 113, 991);
INSERT INTO `website_category` VALUES (930, 113, 990);
INSERT INTO `website_category` VALUES (929, 113, 989);
INSERT INTO `website_category` VALUES (928, 113, 988);
INSERT INTO `website_category` VALUES (927, 113, 987);
INSERT INTO `website_category` VALUES (926, 113, 986);
INSERT INTO `website_category` VALUES (925, 113, 985);
INSERT INTO `website_category` VALUES (924, 113, 984);
INSERT INTO `website_category` VALUES (923, 113, 983);
INSERT INTO `website_category` VALUES (922, 113, 982);
INSERT INTO `website_category` VALUES (921, 113, 981);
INSERT INTO `website_category` VALUES (920, 113, 980);
INSERT INTO `website_category` VALUES (919, 113, 979);
INSERT INTO `website_category` VALUES (918, 113, 978);
INSERT INTO `website_category` VALUES (917, 113, 977);
INSERT INTO `website_category` VALUES (916, 113, 976);
INSERT INTO `website_category` VALUES (915, 113, 975);
INSERT INTO `website_category` VALUES (914, 113, 974);
INSERT INTO `website_category` VALUES (913, 113, 973);
INSERT INTO `website_category` VALUES (912, 113, 972);
INSERT INTO `website_category` VALUES (911, 112, 971);
INSERT INTO `website_category` VALUES (910, 112, 970);
INSERT INTO `website_category` VALUES (909, 112, 969);
INSERT INTO `website_category` VALUES (908, 112, 968);
INSERT INTO `website_category` VALUES (907, 112, 967);
INSERT INTO `website_category` VALUES (906, 112, 966);
INSERT INTO `website_category` VALUES (905, 112, 965);
INSERT INTO `website_category` VALUES (904, 111, 964);
INSERT INTO `website_category` VALUES (903, 111, 963);
INSERT INTO `website_category` VALUES (902, 111, 962);
INSERT INTO `website_category` VALUES (901, 111, 961);
INSERT INTO `website_category` VALUES (900, 111, 960);
INSERT INTO `website_category` VALUES (899, 111, 959);
INSERT INTO `website_category` VALUES (898, 110, 958);
INSERT INTO `website_category` VALUES (897, 110, 957);
INSERT INTO `website_category` VALUES (896, 110, 956);
INSERT INTO `website_category` VALUES (895, 110, 955);
INSERT INTO `website_category` VALUES (894, 110, 954);
INSERT INTO `website_category` VALUES (893, 110, 953);
INSERT INTO `website_category` VALUES (892, 109, 952);
INSERT INTO `website_category` VALUES (891, 109, 951);
INSERT INTO `website_category` VALUES (890, 109, 950);
INSERT INTO `website_category` VALUES (889, 109, 949);
INSERT INTO `website_category` VALUES (888, 109, 948);
INSERT INTO `website_category` VALUES (887, 109, 947);
INSERT INTO `website_category` VALUES (886, 108, 946);
INSERT INTO `website_category` VALUES (885, 108, 945);
INSERT INTO `website_category` VALUES (884, 108, 944);
INSERT INTO `website_category` VALUES (883, 108, 943);
INSERT INTO `website_category` VALUES (882, 107, 942);
INSERT INTO `website_category` VALUES (881, 107, 941);
INSERT INTO `website_category` VALUES (880, 107, 940);
INSERT INTO `website_category` VALUES (879, 107, 939);
INSERT INTO `website_category` VALUES (878, 107, 938);
INSERT INTO `website_category` VALUES (877, 107, 937);
INSERT INTO `website_category` VALUES (876, 107, 936);
INSERT INTO `website_category` VALUES (875, 107, 935);
INSERT INTO `website_category` VALUES (874, 107, 934);
INSERT INTO `website_category` VALUES (873, 107, 933);
INSERT INTO `website_category` VALUES (872, 107, 932);
INSERT INTO `website_category` VALUES (871, 107, 931);
INSERT INTO `website_category` VALUES (870, 107, 930);
INSERT INTO `website_category` VALUES (869, 107, 929);
INSERT INTO `website_category` VALUES (1349, 151, 1409);
INSERT INTO `website_category` VALUES (1350, 151, 1410);
INSERT INTO `website_category` VALUES (1351, 151, 1411);
INSERT INTO `website_category` VALUES (1352, 151, 1412);
INSERT INTO `website_category` VALUES (1353, 151, 1413);
INSERT INTO `website_category` VALUES (1354, 151, 1414);
INSERT INTO `website_category` VALUES (1355, 151, 1415);
INSERT INTO `website_category` VALUES (1356, 151, 1416);
INSERT INTO `website_category` VALUES (1357, 151, 1417);
INSERT INTO `website_category` VALUES (1358, 151, 1418);
INSERT INTO `website_category` VALUES (1359, 151, 1419);
INSERT INTO `website_category` VALUES (1360, 151, 1420);
INSERT INTO `website_category` VALUES (1361, 151, 1421);
INSERT INTO `website_category` VALUES (1362, 151, 1422);
INSERT INTO `website_category` VALUES (1363, 151, 1423);
INSERT INTO `website_category` VALUES (1364, 151, 1424);
INSERT INTO `website_category` VALUES (1365, 151, 1425);
INSERT INTO `website_category` VALUES (1366, 151, 1426);
INSERT INTO `website_category` VALUES (1367, 151, 1427);
INSERT INTO `website_category` VALUES (1368, 151, 1428);
INSERT INTO `website_category` VALUES (1369, 151, 1429);
INSERT INTO `website_category` VALUES (1370, 151, 1430);
INSERT INTO `website_category` VALUES (1371, 151, 1431);
INSERT INTO `website_category` VALUES (1372, 151, 1432);
INSERT INTO `website_category` VALUES (1373, 151, 1433);
INSERT INTO `website_category` VALUES (1374, 151, 1434);
INSERT INTO `website_category` VALUES (1375, 151, 1435);
INSERT INTO `website_category` VALUES (1376, 151, 1436);
INSERT INTO `website_category` VALUES (1377, 151, 1437);
INSERT INTO `website_category` VALUES (1378, 151, 1438);
INSERT INTO `website_category` VALUES (1379, 151, 1439);
INSERT INTO `website_category` VALUES (1380, 151, 1440);
INSERT INTO `website_category` VALUES (1381, 151, 1441);
INSERT INTO `website_category` VALUES (1382, 151, 1442);
INSERT INTO `website_category` VALUES (1383, 151, 1443);
INSERT INTO `website_category` VALUES (1384, 151, 1444);
INSERT INTO `website_category` VALUES (1385, 151, 1445);
INSERT INTO `website_category` VALUES (1386, 151, 1446);
INSERT INTO `website_category` VALUES (1387, 151, 1447);
INSERT INTO `website_category` VALUES (1388, 151, 1448);
INSERT INTO `website_category` VALUES (1389, 151, 1449);
INSERT INTO `website_category` VALUES (1390, 151, 1450);
INSERT INTO `website_category` VALUES (1391, 151, 1451);
INSERT INTO `website_category` VALUES (1392, 151, 1452);
INSERT INTO `website_category` VALUES (1393, 151, 1453);
INSERT INTO `website_category` VALUES (1394, 151, 1454);
INSERT INTO `website_category` VALUES (1395, 151, 1455);
INSERT INTO `website_category` VALUES (1396, 151, 1456);
INSERT INTO `website_category` VALUES (1397, 151, 1457);
INSERT INTO `website_category` VALUES (1398, 151, 1458);
INSERT INTO `website_category` VALUES (1399, 151, 1459);
INSERT INTO `website_category` VALUES (1400, 151, 1460);
INSERT INTO `website_category` VALUES (1401, 151, 1461);
INSERT INTO `website_category` VALUES (1402, 151, 1462);
INSERT INTO `website_category` VALUES (1403, 151, 1463);
INSERT INTO `website_category` VALUES (1404, 151, 1464);
INSERT INTO `website_category` VALUES (1405, 151, 1465);
INSERT INTO `website_category` VALUES (1406, 151, 1466);
INSERT INTO `website_category` VALUES (1407, 151, 1467);
INSERT INTO `website_category` VALUES (1408, 151, 1468);
INSERT INTO `website_category` VALUES (1409, 149, 1475);
INSERT INTO `website_category` VALUES (1410, 149, 1476);
INSERT INTO `website_category` VALUES (1411, 149, 1477);
INSERT INTO `website_category` VALUES (1412, 149, 1478);
INSERT INTO `website_category` VALUES (1413, 149, 1479);
INSERT INTO `website_category` VALUES (1414, 149, 1480);
INSERT INTO `website_category` VALUES (1415, 149, 1481);
INSERT INTO `website_category` VALUES (1416, 149, 1482);
INSERT INTO `website_category` VALUES (1417, 149, 1483);
INSERT INTO `website_category` VALUES (1418, 149, 1484);
INSERT INTO `website_category` VALUES (1419, 149, 1485);
INSERT INTO `website_category` VALUES (1420, 149, 1486);
INSERT INTO `website_category` VALUES (1421, 149, 1487);
INSERT INTO `website_category` VALUES (1422, 149, 1488);
INSERT INTO `website_category` VALUES (1423, 149, 1489);
INSERT INTO `website_category` VALUES (1424, 149, 1490);
INSERT INTO `website_category` VALUES (1425, 149, 1491);
INSERT INTO `website_category` VALUES (1426, 149, 1492);
INSERT INTO `website_category` VALUES (1427, 149, 1493);
INSERT INTO `website_category` VALUES (1428, 149, 1494);
INSERT INTO `website_category` VALUES (1429, 149, 1495);
INSERT INTO `website_category` VALUES (1430, 149, 1496);
INSERT INTO `website_category` VALUES (1431, 149, 1497);
INSERT INTO `website_category` VALUES (1432, 149, 1498);

-- ----------------------------
-- Table structure for website_library
-- ----------------------------
DROP TABLE IF EXISTS `website_library`;
CREATE TABLE `website_library`  (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `edit_time` datetime(0) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`website_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for website_user
-- ----------------------------
DROP TABLE IF EXISTS `website_user`;
CREATE TABLE `website_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `website_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
