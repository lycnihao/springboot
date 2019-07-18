/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : hom1db

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 16/07/2019 09:26:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links`  (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_touch` int(11) NULL DEFAULT NULL,
  `ordered` int(11) NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `visits` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = sjis COLLATE = sjis_japanese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES (1, 1560823939, 'https://img.bidianer.com/website/201804/04/5ac44552a3e2evhmhiA8XSyMQOBiS.svg', 1, 0, '随时随地发现新鲜事', '新浪微博', 'https://weibo.com/', 0);
INSERT INTO `links` VALUES (2, 1560823939, 'https://img.bidianer.com/website/201706/18/594684a44f53choOIjdfeHrLf15Zr.svg', 1, 0, '与世界分享你的知识，经验和见解', '知乎', 'https://www.zhihu.com/', 0);
INSERT INTO `links` VALUES (4, 1560823939, 'https://img.bidianer.com/website/201706/18/59468b3163ddeQTEjlPjd7Yv2ODbu.png', 1, 0, '国内最具影响力创意工作者和开发人员交流社区', 'v2ex', 'https://www.v2ex.com/', 0);
INSERT INTO `links` VALUES (3, 1560823939, 'https://img.bidianer.com/website/201808/13/5b715bdd8655csZmpQOtvYY_MO4eE.svg', 1, 0, '文艺小清新社区', '豆瓣', 'https://www.douban.com/', 0);
INSERT INTO `links` VALUES (5, 1560823939, 'https://img.bidianer.com/website/201808/13/5b715afb9e767IOQiz54KMB3SbDNc.svg', 1, 0, '国内最大开源社区', '开源中国', 'https://www.oschina.net/', 0);
INSERT INTO `links` VALUES (6, 1560823939, 'https://img.bidianer.com/website/201808/13/5b715c762b032XBQaVRcXskdu7BGB.svg', 1, 0, '网易旗下高质量音乐播放器', '网易云音乐', 'http://music.163.com/', 0);
INSERT INTO `links` VALUES (7, 1560823939, 'https://img.bidianer.com/website/201804/04/5ac44552a3e2evhmhiA8XSyMQOBiS.svg', 0, 0, '随时随地发现新鲜事', '新浪微博', 'https://weibo.com/', 0);
INSERT INTO `links` VALUES (8, 1560823939, 'https://img.bidianer.com/website/201706/18/594684a44f53choOIjdfeHrLf15Zr.svg', 0, 0, '与世界分享你的知识，经验和见解', '知乎', 'https://www.zhihu.com/', 0);
INSERT INTO `links` VALUES (9, 1560823939, 'https://img.bidianer.com/website/201706/18/59468b3163ddeQTEjlPjd7Yv2ODbu.png', 0, 0, '国内最具影响力创意工作者和开发人员交流社区', 'v2ex', 'https://www.v2ex.com/', 0);
INSERT INTO `links` VALUES (10, 1560823939, 'https://img.bidianer.com/website/201808/13/5b715bdd8655csZmpQOtvYY_MO4eE.svg', 0, 0, '文艺小清新社区', '豆瓣', 'https://www.douban.com/', 0);
INSERT INTO `links` VALUES (11, 1560823939, 'https://img.bidianer.com/website/201808/13/5b715afb9e767IOQiz54KMB3SbDNc.svg', 0, 0, '国内最大开源社区', '开源中国', 'https://www.oschina.net/', 0);
INSERT INTO `links` VALUES (12, 1560823939, 'https://img.bidianer.com/website/201808/13/5b715c762b032XBQaVRcXskdu7BGB.svg', 0, 0, '网易旗下高质量音乐播放器', '网易云音乐', 'http://music.163.com/', 0);

SET FOREIGN_KEY_CHECKS = 1;
