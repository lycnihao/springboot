/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : hom1db

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-11-22 16:50:05
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
  PRIMARY KEY (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '2019-11-22 11:54:57', 'qiniu', 'jd.svg', '0', 'http://q1clvr752.bkt.clouddn.com/website/1574394895548jd.svg', '930B', 'http://q1clvr752.bkt.clouddn.com/website/1574394895548jd.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('2', '2019-11-22 12:42:22', 'qiniu', 'suning.svg', '0', 'http://img.168dh.cn/website/1574397741691suning.svg', '1KB', 'http://img.168dh.cn/website/1574397741691suning.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('3', '2019-11-22 12:44:26', 'qiniu', 'guomei.png', '0', 'http://img.168dh.cn/website/1574397866063guomei.png', '24KB', 'http://img.168dh.cn/website/1574397866063guomei.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('4', '2019-11-22 12:48:28', 'qiniu', 'dangdang.svg', '0', 'http://img.168dh.cn/website/1574398107759dangdang.svg', '2KB', 'http://img.168dh.cn/website/1574398107759dangdang.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('5', '2019-11-22 12:50:13', 'qiniu', 'taobao.svg', '0', 'http://img.168dh.cn/website/1574398211213taobao.svg', '4KB', 'http://img.168dh.cn/website/1574398211213taobao.svg', '.svg', 'image/svg+xml', '256x256');
INSERT INTO `attachment` VALUES ('6', '2019-11-22 12:52:01', 'qiniu', 'tmall.svg', '0', 'http://img.168dh.cn/website/1574398320508tmall.svg', '5KB', 'http://img.168dh.cn/website/1574398320508tmall.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('7', '2019-11-22 12:54:04', 'qiniu', 'amazon.svg', '0', 'http://img.168dh.cn/website/1574398443756amazon.svg', '974B', 'http://img.168dh.cn/website/1574398443756amazon.svg', '.svg', 'image/svg+xml', '31x32');
INSERT INTO `attachment` VALUES ('8', '2019-11-22 12:55:42', 'qiniu', 'juhuasuan.svg', '0', 'http://img.168dh.cn/website/1574398541667juhuasuan.svg', '3KB', 'http://img.168dh.cn/website/1574398541667juhuasuan.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('9', '2019-11-22 12:58:43', 'qiniu', 'aitaobao.svg', '0', 'http://img.168dh.cn/website/1574398723004aitaobao.svg', '2KB', 'http://img.168dh.cn/website/1574398723004aitaobao.svg', '.svg', 'image/svg+xml', '247x200');
INSERT INTO `attachment` VALUES ('10', '2019-11-22 12:59:53', 'qiniu', 'kaola.svg', '0', 'http://img.168dh.cn/website/1574398792388kaola.svg', '2KB', 'http://img.168dh.cn/website/1574398792388kaola.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('11', '2019-11-22 13:01:13', 'qiniu', 'yanxuan.svg', '0', 'http://img.168dh.cn/website/1574398872764yanxuan.svg', '9KB', 'http://img.168dh.cn/website/1574398872764yanxuan.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('12', '2019-11-22 13:02:08', 'qiniu', 'aliyun.svg', '0', 'http://img.168dh.cn/website/1574398927288aliyun.svg', '1KB', 'http://img.168dh.cn/website/1574398927288aliyun.svg', '.svg', 'image/svg+xml', '308x200');
INSERT INTO `attachment` VALUES ('13', '2019-11-22 13:16:53', 'qiniu', 'bilibili.svg', '0', 'http://img.168dh.cn/website/1574399812291bilibili.svg', '2KB', 'http://img.168dh.cn/website/1574399812291bilibili.svg', '.svg', 'image/svg+xml', '221x200');
INSERT INTO `attachment` VALUES ('14', '2019-11-22 13:17:46', 'qiniu', 'iqiyi.svg', '0', 'http://img.168dh.cn/website/1574399865411iqiyi.svg', '5KB', 'http://img.168dh.cn/website/1574399865411iqiyi.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('15', '2019-11-22 13:18:49', 'qiniu', 'tengxunshipin.svg', '0', 'http://img.168dh.cn/website/1574399928451tengxunshipin.svg', '4KB', 'http://img.168dh.cn/website/1574399928451tengxunshipin.svg', '.svg', 'image/svg+xml', '221x200');
INSERT INTO `attachment` VALUES ('16', '2019-11-22 13:20:04', 'qiniu', 'youku.svg', '0', 'http://img.168dh.cn/website/1574400003893youku.svg', '5KB', 'http://img.168dh.cn/website/1574400003893youku.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('17', '2019-11-22 13:21:10', 'qiniu', 'mgtv.svg', '0', 'http://img.168dh.cn/website/1574400069739mgtv.svg', '1KB', 'http://img.168dh.cn/website/1574400069739mgtv.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('18', '2019-11-22 13:35:05', 'qiniu', 'tudou.svg', '0', 'http://img.168dh.cn/website/1574400904165tudou.svg', '1KB', 'http://img.168dh.cn/website/1574400904165tudou.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('19', '2019-11-22 13:36:10', 'qiniu', 'cctv.png', '0', 'http://img.168dh.cn/website/1574400969331cctv.png', '18KB', 'http://img.168dh.cn/website/1574400969331cctv.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('20', '2019-11-22 13:42:33', 'qiniu', 'music163.svg', '0', 'http://img.168dh.cn/website/1574401352898music163.svg', '2KB', 'http://img.168dh.cn/website/1574401352898music163.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('21', '2019-11-22 13:44:07', 'qiniu', 'kugou.svg', '0', 'http://img.168dh.cn/website/1574401446562kugou.svg', '1KB', 'http://img.168dh.cn/website/1574401446562kugou.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('22', '2019-11-22 13:45:14', 'qiniu', 'musicqq.svg', '0', 'http://img.168dh.cn/website/1574401513418musicqq.svg', '1KB', 'http://img.168dh.cn/website/1574401513418musicqq.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('23', '2019-11-22 13:46:25', 'qiniu', 'xiami.svg', '0', 'http://img.168dh.cn/website/1574401585186xiami.svg', '3KB', 'http://img.168dh.cn/website/1574401585186xiami.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('24', '2019-11-22 13:47:33', 'qiniu', 'kuwo.svg', '0', 'http://img.168dh.cn/website/1574401652651kuwo.svg', '4KB', 'http://img.168dh.cn/website/1574401652651kuwo.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('25', '2019-11-22 13:48:40', 'qiniu', 'doubanfm.png', '0', 'http://img.168dh.cn/website/1574401719347doubanfm.png', '2KB', 'http://img.168dh.cn/website/1574401719347doubanfm.png', '.png', 'image/png', '32x32');
INSERT INTO `attachment` VALUES ('26', '2019-11-22 13:58:34', 'qiniu', 'xiecheng.svg', '0', 'http://img.168dh.cn/website/1574402313228xiecheng.svg', '2KB', 'http://img.168dh.cn/website/1574402313228xiecheng.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('27', '2019-11-22 14:00:46', 'qiniu', 'feizhu.svg', '0', 'http://img.168dh.cn/website/1574402445651feizhu.svg', '3KB', 'http://img.168dh.cn/website/1574402445651feizhu.svg', '.svg', 'image/svg+xml', '233x200');
INSERT INTO `attachment` VALUES ('28', '2019-11-22 14:02:22', 'qiniu', 'tongcheng.png', '0', 'http://img.168dh.cn/website/1574402541908tongcheng.png', '4KB', 'http://img.168dh.cn/website/1574402541908tongcheng.png', '.png', 'image/png', '0x0');
INSERT INTO `attachment` VALUES ('29', '2019-11-22 14:03:41', 'qiniu', 'tuniu.png', '0', 'http://img.168dh.cn/website/1574402620867tuniu.png', '1KB', 'http://img.168dh.cn/website/1574402620867tuniu.png', '.png', 'image/png', '100x107');
INSERT INTO `attachment` VALUES ('30', '2019-11-22 14:04:51', 'qiniu', 'qunaer.svg', '0', 'http://img.168dh.cn/website/1574402690939qunaer.svg', '5KB', 'http://img.168dh.cn/website/1574402690939qunaer.svg', '.svg', 'image/svg+xml', '64x64');
INSERT INTO `attachment` VALUES ('31', '2019-11-22 14:06:53', 'qiniu', 'lvmama.png', '0', 'http://img.168dh.cn/website/1574402811626lvmama.png', '4KB', 'http://img.168dh.cn/website/1574402811626lvmama.png', '.png', 'image/png', '0x0');
INSERT INTO `attachment` VALUES ('32', '2019-11-22 14:20:55', 'qiniu', '36kr.png', '0', 'http://img.168dh.cn/website/157440365453136kr.png', '879B', 'http://img.168dh.cn/website/157440365453136kr.png', '.png', 'image/png', '32x32');
INSERT INTO `attachment` VALUES ('33', '2019-11-22 14:23:31', 'qiniu', 'huxiu.png', '0', 'http://img.168dh.cn/website/1574403810205huxiu.png', '965B', 'http://img.168dh.cn/website/1574403810205huxiu.png', '.png', 'image/png', '100x100');
INSERT INTO `attachment` VALUES ('34', '2019-11-22 14:25:24', 'qiniu', 'wanqu.png', '0', 'http://img.168dh.cn/website/1574403923350wanqu.png', '8KB', 'http://img.168dh.cn/website/1574403923350wanqu.png', '.png', 'image/png', '512x512');
INSERT INTO `attachment` VALUES ('35', '2019-11-22 14:28:28', 'qiniu', 'solidot.png', '0', 'http://img.168dh.cn/website/1574404107115solidot.png', '14KB', 'http://img.168dh.cn/website/1574404107115solidot.png', '.png', 'image/png', '256x256');
INSERT INTO `attachment` VALUES ('36', '2019-11-22 14:31:11', 'qiniu', 'geekpark.png', '0', 'http://img.168dh.cn/website/1574404270503geekpark.png', '1KB', 'http://img.168dh.cn/website/1574404270503geekpark.png', '.png', 'image/png', '30x30');
INSERT INTO `attachment` VALUES ('37', '2019-11-22 14:36:20', 'qiniu', 'ifeng.svg', '0', 'http://img.168dh.cn/website/1574404579218ifeng.svg', '7KB', 'http://img.168dh.cn/website/1574404579218ifeng.svg', '.svg', 'image/svg+xml', '200x200');
INSERT INTO `attachment` VALUES ('38', '2019-11-22 14:37:22', 'qiniu', 'huanqiu.png', '0', 'http://img.168dh.cn/website/1574404641111huanqiu.png', '18KB', 'http://img.168dh.cn/website/1574404641111huanqiu.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('39', '2019-11-22 14:38:29', 'qiniu', 'thepaper.png', '0', 'http://img.168dh.cn/website/1574404708388thepaper.png', '25KB', 'http://img.168dh.cn/website/1574404708388thepaper.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('40', '2019-11-22 14:39:33', 'qiniu', 'tengxunxinwen.svg', '0', 'http://img.168dh.cn/website/1574404772897tengxunxinwen.svg', '3KB', 'http://img.168dh.cn/website/1574404772897tengxunxinwen.svg', '.svg', 'image/svg+xml', '512x512');
INSERT INTO `attachment` VALUES ('41', '2019-11-22 14:40:40', 'qiniu', 'xinlangxinwen.svg', '0', 'http://img.168dh.cn/website/1574404840081xinlangxinwen.svg', '5KB', 'http://img.168dh.cn/website/1574404840081xinlangxinwen.svg', '.svg', 'image/svg+xml', '512x512');
INSERT INTO `attachment` VALUES ('42', '2019-11-22 14:42:08', 'qiniu', 'sohuxinwen.svg', '0', 'http://img.168dh.cn/website/1574404927164sohuxinwen.svg', '3KB', 'http://img.168dh.cn/website/1574404927164sohuxinwen.svg', '.svg', 'image/svg+xml', '202x200');
INSERT INTO `attachment` VALUES ('43', '2019-11-22 14:43:01', 'qiniu', 'wangyixinwen.png', '0', 'http://img.168dh.cn/website/1574404980203wangyixinwen.png', '18KB', 'http://img.168dh.cn/website/1574404980203wangyixinwen.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('44', '2019-11-22 14:43:49', 'qiniu', 'guanchazhe.png', '0', 'http://img.168dh.cn/website/1574405028321guanchazhe.png', '21KB', 'http://img.168dh.cn/website/1574405028321guanchazhe.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('45', '2019-11-22 14:49:47', 'qiniu', 'jiemian.png', '0', 'http://img.168dh.cn/website/1574405386475jiemian.png', '16KB', 'http://img.168dh.cn/website/1574405386475jiemian.png', '.png', 'image/png', '64x64');
INSERT INTO `attachment` VALUES ('46', '2019-11-22 15:42:57', 'qiniu', 'junshitoutiao.png', '0', 'http://img.168dh.cn/website/1574408576405junshitoutiao.png', '21KB', 'http://img.168dh.cn/website/1574408576405junshitoutiao.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('47', '2019-11-22 15:42:58', 'qiniu', 'zhonghuajunshi.png', '0', 'http://img.168dh.cn/website/1574408577537zhonghuajunshi.png', '18KB', 'http://img.168dh.cn/website/1574408577537zhonghuajunshi.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('48', '2019-11-22 15:42:58', 'qiniu', 'tiexuejunshi.png', '0', 'http://img.168dh.cn/website/1574408578025tiexuejunshi.png', '18KB', 'http://img.168dh.cn/website/1574408578025tiexuejunshi.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('49', '2019-11-22 15:42:59', 'qiniu', 'tengxunjunshi.svg', '0', 'http://img.168dh.cn/website/1574408578551tengxunjunshi.svg', '12KB', 'http://img.168dh.cn/website/1574408578551tengxunjunshi.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('50', '2019-11-22 15:43:00', 'qiniu', 'renminjunshi.svg', '0', 'http://img.168dh.cn/website/1574408579071renminjunshi.svg', '1KB', 'http://img.168dh.cn/website/1574408579071renminjunshi.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('51', '2019-11-22 15:43:00', 'qiniu', 'mier.png', '0', 'http://img.168dh.cn/website/1574408579606mier.png', '18KB', 'http://img.168dh.cn/website/1574408579606mier.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('52', '2019-11-22 15:43:00', 'qiniu', 'xinlanjunshi.svg', '0', 'http://img.168dh.cn/website/1574408580076xinlanjunshi.svg', '5KB', 'http://img.168dh.cn/website/1574408580076xinlanjunshi.svg', '.svg', '', '512x512');
INSERT INTO `attachment` VALUES ('53', '2019-11-22 15:43:01', 'qiniu', 'huanqiujunshi.png', '0', 'http://img.168dh.cn/website/1574408580494huanqiujunshi.png', '18KB', 'http://img.168dh.cn/website/1574408580494huanqiujunshi.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('54', '2019-11-22 15:43:01', 'qiniu', 'fenghuanjunshi.svg', '0', 'http://img.168dh.cn/website/1574408580903fenghuanjunshi.svg', '2KB', 'http://img.168dh.cn/website/1574408580903fenghuanjunshi.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('55', '2019-11-22 15:48:41', 'qiniu', 'eastmoney.svg', '0', 'http://img.168dh.cn/website/1574408919877eastmoney.svg', '1KB', 'http://img.168dh.cn/website/1574408919877eastmoney.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('56', '2019-11-22 15:48:41', 'qiniu', 'finance.png', '0', 'http://img.168dh.cn/website/1574408920765finance.png', '17KB', 'http://img.168dh.cn/website/1574408920765finance.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('57', '2019-11-22 15:48:42', 'qiniu', 'hexun.png', '0', 'http://img.168dh.cn/website/1574408921224hexun.png', '18KB', 'http://img.168dh.cn/website/1574408921224hexun.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('58', '2019-11-22 15:48:42', 'qiniu', 'yicai.png', '0', 'http://img.168dh.cn/website/1574408921764yicai.png', '17KB', 'http://img.168dh.cn/website/1574408921764yicai.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('59', '2019-11-22 15:48:43', 'qiniu', 'caixin.png', '0', 'http://img.168dh.cn/website/1574408922276caixin.png', '17KB', 'http://img.168dh.cn/website/1574408922276caixin.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('60', '2019-11-22 15:48:43', 'qiniu', 'ce.png', '0', 'http://img.168dh.cn/website/1574408922740ce.png', '21KB', 'http://img.168dh.cn/website/1574408922740ce.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('61', '2019-11-22 15:48:44', 'qiniu', 'money163.png', '0', 'http://img.168dh.cn/website/1574408923287money163.png', '16KB', 'http://img.168dh.cn/website/1574408923287money163.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('62', '2019-11-22 15:48:45', 'qiniu', 'stockstar.png', '0', 'http://img.168dh.cn/website/1574408924015stockstar.png', '17KB', 'http://img.168dh.cn/website/1574408924015stockstar.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('63', '2019-11-22 15:48:46', 'qiniu', 'xueqiu.svg', '0', 'http://img.168dh.cn/website/1574408924868xueqiu.svg', '2KB', 'http://img.168dh.cn/website/1574408924868xueqiu.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('64', '2019-11-22 15:49:28', 'qiniu', 'nba.png', '0', 'http://img.168dh.cn/website/1574408967151nba.png', '17KB', 'http://img.168dh.cn/website/1574408967151nba.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('65', '2019-11-22 15:49:28', 'qiniu', 'cctv.png', '0', 'http://img.168dh.cn/website/1574408967930cctv.png', '18KB', 'http://img.168dh.cn/website/1574408967930cctv.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('66', '2019-11-22 15:49:29', 'qiniu', '163tiyu.png', '0', 'http://img.168dh.cn/website/1574408968402163tiyu.png', '18KB', 'http://img.168dh.cn/website/1574408968402163tiyu.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('67', '2019-11-22 15:49:29', 'qiniu', 'zhiboba.png', '0', 'http://img.168dh.cn/website/1574408968876zhiboba.png', '18KB', 'http://img.168dh.cn/website/1574408968876zhiboba.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('68', '2019-11-22 15:49:30', 'qiniu', 'dongqiudi.png', '0', 'http://img.168dh.cn/website/1574408969280dongqiudi.png', '5KB', 'http://img.168dh.cn/website/1574408969280dongqiudi.png', '.png', '', '208x206');
INSERT INTO `attachment` VALUES ('69', '2019-11-22 15:49:30', 'qiniu', 'huputiyu.svg', '0', 'http://img.168dh.cn/website/1574408969667huputiyu.svg', '3KB', 'http://img.168dh.cn/website/1574408969667huputiyu.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('70', '2019-11-22 15:49:30', 'qiniu', 'xinlangtiyu.png', '0', 'http://img.168dh.cn/website/1574408970074xinlangtiyu.png', '17KB', 'http://img.168dh.cn/website/1574408970074xinlangtiyu.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('71', '2019-11-22 15:49:31', 'qiniu', 'tengxuntiyu.svg', '0', 'http://img.168dh.cn/website/1574408970533tengxuntiyu.svg', '3KB', 'http://img.168dh.cn/website/1574408970533tengxuntiyu.svg', '.svg', '', '512x512');
INSERT INTO `attachment` VALUES ('72', '2019-11-22 15:49:31', 'qiniu', 'souhutiyu.png', '0', 'http://img.168dh.cn/website/1574408971008souhutiyu.png', '21KB', 'http://img.168dh.cn/website/1574408971008souhutiyu.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('73', '2019-11-22 15:50:17', 'qiniu', 'autohome.png', '0', 'http://img.168dh.cn/website/1574409016795autohome.png', '3KB', 'http://img.168dh.cn/website/1574409016795autohome.png', '.png', '', '0x0');
INSERT INTO `attachment` VALUES ('74', '2019-11-22 15:50:18', 'qiniu', 'taipingyangqiche.png', '0', 'http://img.168dh.cn/website/1574409017660taipingyangqiche.png', '19KB', 'http://img.168dh.cn/website/1574409017660taipingyangqiche.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('75', '2019-11-22 15:50:19', 'qiniu', 'yiche.png', '0', 'http://img.168dh.cn/website/1574409018166yiche.png', '20KB', 'http://img.168dh.cn/website/1574409018166yiche.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('76', '2019-11-22 15:50:19', 'qiniu', 'renrenche.png', '0', 'http://img.168dh.cn/website/1574409018641renrenche.png', '19KB', 'http://img.168dh.cn/website/1574409018641renrenche.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('77', '2019-11-22 15:50:19', 'qiniu', 'youxin.svg', '0', 'http://img.168dh.cn/website/1574409019059youxin.svg', '4KB', 'http://img.168dh.cn/website/1574409019059youxin.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('78', '2019-11-22 15:50:20', 'qiniu', 'guazi.png', '0', 'http://img.168dh.cn/website/1574409019472guazi.png', '20KB', 'http://img.168dh.cn/website/1574409019472guazi.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('79', '2019-11-22 15:50:20', 'qiniu', 'aikaqiche.png', '0', 'http://img.168dh.cn/website/1574409019935aikaqiche.png', '18KB', 'http://img.168dh.cn/website/1574409019935aikaqiche.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('80', '2019-11-22 15:50:21', 'qiniu', '122nkg.svg', '0', 'http://img.168dh.cn/website/1574409020421122nkg.svg', '1KB', 'http://img.168dh.cn/website/1574409020421122nkg.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('81', '2019-11-22 15:50:21', 'qiniu', 'jd.svg', '0', 'http://img.168dh.cn/website/1574409020806jd.svg', '930B', 'http://img.168dh.cn/website/1574409020806jd.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('82', '2019-11-22 15:51:18', 'qiniu', 'zol.svg', '0', 'http://img.168dh.cn/website/1574409077929zol.svg', '1KB', 'http://img.168dh.cn/website/1574409077929zol.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('83', '2019-11-22 15:51:19', 'qiniu', 'pconline.png', '0', 'http://img.168dh.cn/website/1574409078792pconline.png', '22KB', 'http://img.168dh.cn/website/1574409078792pconline.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('84', '2019-11-22 15:51:20', 'qiniu', 'engadget.png', '0', 'http://img.168dh.cn/website/1574409079344engadget.png', '16KB', 'http://img.168dh.cn/website/1574409079344engadget.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('85', '2019-11-22 15:51:21', 'qiniu', 'ithome.png', '0', 'http://img.168dh.cn/website/1574409079768ithome.png', '17KB', 'http://img.168dh.cn/website/1574409079768ithome.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('86', '2019-11-22 15:51:21', 'qiniu', 'zealer.png', '0', 'http://img.168dh.cn/website/1574409080984zealer.png', '18KB', 'http://img.168dh.cn/website/1574409080984zealer.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('87', '2019-11-22 15:51:22', 'qiniu', 'dgtle.png', '0', 'http://img.168dh.cn/website/1574409081532dgtle.png', '23KB', 'http://img.168dh.cn/website/1574409081532dgtle.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('88', '2019-11-22 15:51:23', 'qiniu', 'chiphell.png', '0', 'http://img.168dh.cn/website/1574409082070chiphell.png', '14KB', 'http://img.168dh.cn/website/1574409082070chiphell.png', '.png', '', '0x0');
INSERT INTO `attachment` VALUES ('89', '2019-11-22 15:51:23', 'qiniu', 'suning.svg', '0', 'http://img.168dh.cn/website/1574409083014suning.svg', '1KB', 'http://img.168dh.cn/website/1574409083014suning.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('90', '2019-11-22 15:51:24', 'qiniu', 'jd.svg', '0', 'http://img.168dh.cn/website/1574409083499jd.svg', '930B', 'http://img.168dh.cn/website/1574409083499jd.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('91', '2019-11-22 15:54:54', 'qiniu', 'github.svg', '0', 'http://img.168dh.cn/website/1574409292845github.svg', '2KB', 'http://img.168dh.cn/website/1574409292845github.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('92', '2019-11-22 15:54:54', 'qiniu', 'oschina.svg', '0', 'http://img.168dh.cn/website/1574409293803oschina.svg', '964B', 'http://img.168dh.cn/website/1574409293803oschina.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('93', '2019-11-22 15:54:55', 'qiniu', 'segmentfault.png', '0', 'http://img.168dh.cn/website/1574409294273segmentfault.png', '19KB', 'http://img.168dh.cn/website/1574409294273segmentfault.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('94', '2019-11-22 15:54:55', 'qiniu', 'v2ex.png', '0', 'http://img.168dh.cn/website/1574409294618v2ex.png', '2KB', 'http://img.168dh.cn/website/1574409294618v2ex.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('95', '2019-11-22 15:54:55', 'qiniu', 'csdn.svg', '0', 'http://img.168dh.cn/website/1574409295061csdn.svg', '862B', 'http://img.168dh.cn/website/1574409295061csdn.svg', '.svg', '', '64x64');
INSERT INTO `attachment` VALUES ('96', '2019-11-22 15:54:56', 'qiniu', 'cnblogs.png', '0', 'http://img.168dh.cn/website/1574409295395cnblogs.png', '3KB', 'http://img.168dh.cn/website/1574409295395cnblogs.png', '.png', '', '48x47');
INSERT INTO `attachment` VALUES ('97', '2019-11-22 15:54:56', 'qiniu', 'aliyun.svg', '0', 'http://img.168dh.cn/website/1574409295753aliyun.svg', '1KB', 'http://img.168dh.cn/website/1574409295753aliyun.svg', '.svg', '', '308x200');
INSERT INTO `attachment` VALUES ('98', '2019-11-22 15:55:00', 'qiniu', 'toutiaoio.png', '0', 'http://img.168dh.cn/website/1574409296492toutiaoio.png', '1KB', 'http://img.168dh.cn/website/1574409296492toutiaoio.png', '.png', '', '72x72');
INSERT INTO `attachment` VALUES ('99', '2019-11-22 15:55:00', 'qiniu', 'juejin.svg', '0', 'http://img.168dh.cn/website/1574409299898juejin.svg', '1KB', 'http://img.168dh.cn/website/1574409299898juejin.svg', '.svg', '', '38x38');
INSERT INTO `attachment` VALUES ('100', '2019-11-22 15:55:39', 'qiniu', 'zhilian.svg', '0', 'http://img.168dh.cn/website/1574409338607zhilian.svg', '2KB', 'http://img.168dh.cn/website/1574409338607zhilian.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('101', '2019-11-22 15:55:40', 'qiniu', 'lagou.svg', '0', 'http://img.168dh.cn/website/1574409339669lagou.svg', '539B', 'http://img.168dh.cn/website/1574409339669lagou.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('102', '2019-11-22 15:55:40', 'qiniu', 'zhipin.svg', '0', 'http://img.168dh.cn/website/1574409340065zhipin.svg', '1KB', 'http://img.168dh.cn/website/1574409340065zhipin.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('103', '2019-11-22 15:55:41', 'qiniu', '51job.svg', '0', 'http://img.168dh.cn/website/157440934046051job.svg', '3KB', 'http://img.168dh.cn/website/157440934046051job.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('104', '2019-11-22 15:55:41', 'qiniu', 'liepin.svg', '0', 'http://img.168dh.cn/website/1574409340958liepin.svg', '898B', 'http://img.168dh.cn/website/1574409340958liepin.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('105', '2019-11-22 15:55:42', 'qiniu', '100offer.png', '0', 'http://img.168dh.cn/website/1574409341454100offer.png', '19KB', 'http://img.168dh.cn/website/1574409341454100offer.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('106', '2019-11-22 15:55:43', 'qiniu', 'neitui.png', '0', 'http://img.168dh.cn/website/1574409342377neitui.png', '20KB', 'http://img.168dh.cn/website/1574409342377neitui.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('107', '2019-11-22 15:55:43', 'qiniu', 'chinahr.svg', '0', 'http://img.168dh.cn/website/1574409342847chinahr.svg', '1KB', 'http://img.168dh.cn/website/1574409342847chinahr.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('108', '2019-11-22 15:55:44', 'qiniu', '500d.png', '0', 'http://img.168dh.cn/website/1574409343238500d.png', '17KB', 'http://img.168dh.cn/website/1574409343238500d.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('109', '2019-11-22 15:59:51', 'qiniu', 'weibo.svg', '0', 'http://img.168dh.cn/website/1574409589994weibo.svg', '4KB', 'http://img.168dh.cn/website/1574409589994weibo.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('110', '2019-11-22 15:59:51', 'qiniu', 'zhihu.svg', '0', 'http://img.168dh.cn/website/1574409590807zhihu.svg', '3KB', 'http://img.168dh.cn/website/1574409590807zhihu.svg', '.svg', '', '256x256');
INSERT INTO `attachment` VALUES ('111', '2019-11-22 15:59:51', 'qiniu', 'douban.svg', '0', 'http://img.168dh.cn/website/1574409591168douban.svg', '1KB', 'http://img.168dh.cn/website/1574409591168douban.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('112', '2019-11-22 15:59:52', 'qiniu', 'tieba.svg', '0', 'http://img.168dh.cn/website/1574409591548tieba.svg', '2KB', 'http://img.168dh.cn/website/1574409591548tieba.svg', '.svg', '', '200x200');
INSERT INTO `attachment` VALUES ('113', '2019-11-22 15:59:53', 'qiniu', 'lofter.png', '0', 'http://img.168dh.cn/website/1574409592152lofter.png', '19KB', 'http://img.168dh.cn/website/1574409592152lofter.png', '.png', '', '64x64');
INSERT INTO `attachment` VALUES ('114', '2019-11-22 15:59:54', 'qiniu', 'shuimu.png', '0', 'http://img.168dh.cn/website/1574409592942shuimu.png', '1KB', 'http://img.168dh.cn/website/1574409592942shuimu.png', '.png', '', '68x68');
INSERT INTO `attachment` VALUES ('115', '2019-11-22 15:59:55', 'qiniu', 'xici.png', '0', 'http://img.168dh.cn/website/1574409593934xici.png', '31KB', 'http://img.168dh.cn/website/1574409593934xici.png', '.png', '', '160x159');
INSERT INTO `attachment` VALUES ('116', '2019-11-22 15:59:55', 'qiniu', 'tianya.svg', '0', 'http://img.168dh.cn/website/1574409594954tianya.svg', '2KB', 'http://img.168dh.cn/website/1574409594954tianya.svg', '.svg', '', '64x64');
INSERT INTO `attachment` VALUES ('117', '2019-11-22 15:59:56', 'qiniu', 'mop.png', '0', 'http://img.168dh.cn/website/1574409595445mop.png', '28KB', 'http://img.168dh.cn/website/1574409595445mop.png', '.png', '', '173x145');

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
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '', null, '生活·日常', '0', '0', 'sh');
INSERT INTO `category` VALUES ('2', '', null, '资讯·新闻', '0', '0', 'zx');
INSERT INTO `category` VALUES ('17', '', null, '开发', '0', '4', 'kaifa');
INSERT INTO `category` VALUES ('4', '', null, '开发·招聘', '0', '0', 'jishu');
INSERT INTO `category` VALUES ('5', '', null, '学习·阅读', '0', '0', 'yuedu');
INSERT INTO `category` VALUES ('6', '', null, '购物', '0', '1', 'gouwu');
INSERT INTO `category` VALUES ('7', '', null, '视频', '0', '1', 'shiping');
INSERT INTO `category` VALUES ('8', '', null, '小说', '0', '5', 'xiaoshuo');
INSERT INTO `category` VALUES ('9', '', null, '音乐', '0', '1', 'yinyue');
INSERT INTO `category` VALUES ('10', '', null, '资讯', '0', '2', 'zixun');
INSERT INTO `category` VALUES ('11', '', null, '新闻', '0', '2', 'xinwen');
INSERT INTO `category` VALUES ('12', '', null, '军事', '0', '2', 'junshi');
INSERT INTO `category` VALUES ('13', '', null, '财经', '0', '2', 'caijing');
INSERT INTO `category` VALUES ('14', '', null, '体育', '0', '2', 'tiyu');
INSERT INTO `category` VALUES ('15', '', null, '汽车', '0', '2', 'qiche');
INSERT INTO `category` VALUES ('16', '', null, '数码', '0', '2', 'shuma');
INSERT INTO `category` VALUES ('18', '', null, '社区', '0', '1', 'shequ');
INSERT INTO `category` VALUES ('19', '', null, '招聘', '0', '4', 'zhaopin');
INSERT INTO `category` VALUES ('20', '', null, '视频', '0', '4', 'xshiping');
INSERT INTO `category` VALUES ('21', '', null, '工具', '0', '4', 'kgongju');
INSERT INTO `category` VALUES ('22', '', null, '外快', '0', '4', 'jiedan');
INSERT INTO `category` VALUES ('23', '', null, '内容', '0', '5', 'neirong');
INSERT INTO `category` VALUES ('24', '', null, '问答', '0', '5', 'wenda');
INSERT INTO `category` VALUES ('25', '', null, '公开课', '0', '5', 'gongkaike');
INSERT INTO `category` VALUES ('26', '', null, '科普', '0', '5', 'kepu');
INSERT INTO `category` VALUES ('27', '', null, '设计·灵感', '0', '0', 'sheji');
INSERT INTO `category` VALUES ('28', '', null, '摄影', '0', '27', 'sheying');
INSERT INTO `category` VALUES ('29', '', null, '图片', '0', '27', 'tu');
INSERT INTO `category` VALUES ('30', '', null, '插画', '0', '27', 'chahua');
INSERT INTO `category` VALUES ('31', '', null, '灵感', '0', '27', 'linggan');
INSERT INTO `category` VALUES ('32', '', null, '素材', '0', '27', 'sucai');
INSERT INTO `category` VALUES ('33', '', null, '图标', '0', '27', 'icon');
INSERT INTO `category` VALUES ('34', '', null, '配色', '0', '27', 'peise');
INSERT INTO `category` VALUES ('35', '', null, '出行', '0', '1', 'chuxing');

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('118');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_name` varchar(127) NOT NULL,
  `option_value` longtext,
  PRIMARY KEY (`option_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `qq` bigint(20) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2019-10-12 14:40:25', '38707145@qqcom', '2019-11-22 16:01:04', 'iksen', 'f992ae49dd4622ca6874d4ad4914de76', null, '1', null, 'http://q1.qlogo.cn/g?b=qq&nk=38707145&s=100', 'iksen', '38707145', null, '1');
INSERT INTO `user` VALUES ('19', '2019-10-24 13:47:27', '929789911@qq.com', '2019-10-24 13:47:35', 'test', 'f992ae49dd4622ca6874d4ad4914de76', null, '1', null, 'http://q1.qlogo.cn/g?b=qq&nk=929789911&s=100', 'test', '929789911', '192.168.152.1', '0');

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
  `url` varchar(255) DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  PRIMARY KEY (`website_id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('1', '2019-11-22 11:26:39', 'http://q1clvr752.bkt.clouddn.com/website/1574394895548jd.svg', '0', '', '京东商城', 'public', 'https://www.jd.com/', '0');
INSERT INTO `website` VALUES ('2', '2019-11-22 12:43:00', 'http://img.168dh.cn/website/1574397741691suning.svg', '0', '苏宁电器网上购物商城', '苏宁电器', 'public', 'https://dianqi.suning.com/', '0');
INSERT INTO `website` VALUES ('3', '2019-11-22 12:44:39', 'http://img.168dh.cn/website/1574397866063guomei.png', '0', '正品低价、品质保障、快速送达、安心服务！', '国美', 'public', 'https://www.gome.com.cn/', '0');
INSERT INTO `website` VALUES ('4', '2019-11-22 12:48:41', 'http://img.168dh.cn/website/1574398107759dangdang.svg', '0', '网上购物中心', '当当', 'public', 'http://www.dangdang.com/', '0');
INSERT INTO `website` VALUES ('5', '2019-11-22 12:50:36', 'http://img.168dh.cn/website/1574398211213taobao.svg', '0', '淘!我喜欢', '淘宝网', 'public', 'https://www.taobao.com/', '0');
INSERT INTO `website` VALUES ('6', '2019-11-22 04:52:00', 'http://img.168dh.cn/website/1574398320508tmall.svg', '0', '理想生活上天猫', '天猫', 'public', 'https://www.tmall.com/', '0');
INSERT INTO `website` VALUES ('7', '2019-11-22 12:54:20', 'http://img.168dh.cn/website/1574398443756amazon.svg', '0', '要网购, 就来Z.cn!', '亚马逊', 'public', 'https://www.amazon.cn/', '0');
INSERT INTO `website` VALUES ('8', '2019-11-22 12:56:15', 'http://img.168dh.cn/website/1574398541667juhuasuan.svg', '0', '5亿品质用户精明之选', '聚划算', 'public', 'https://ju.taobao.com/', '0');
INSERT INTO `website` VALUES ('9', '2019-11-22 12:58:50', 'http://img.168dh.cn/website/1574398723004aitaobao.svg', '0', '淘宝网购物分享平台', '爱淘宝', 'public', 'https://ai.taobao.com/', '0');
INSERT INTO `website` VALUES ('10', '2019-11-22 05:00:00', 'http://img.168dh.cn/website/1574398792388kaola.svg', '0', '我的美好世界', '考拉海购', 'public', 'https://www.kaola.com/', '0');
INSERT INTO `website` VALUES ('11', '2019-11-22 13:01:20', 'http://img.168dh.cn/website/1574398872764yanxuan.svg', '0', '以严谨的态度，为中国消费者甄选天下优品', '网易严选 ', 'public', 'http://you.163.com/', '0');
INSERT INTO `website` VALUES ('12', '2019-11-22 13:02:21', 'http://img.168dh.cn/website/1574398927288aliyun.svg', '0', '上云就上阿里云', '阿里云', 'public', 'https://www.aliyun.com/', '0');
INSERT INTO `website` VALUES ('13', '2019-11-22 13:17:01', 'http://img.168dh.cn/website/1574399812291bilibili.svg', '0', '国内知名的视频弹幕网站。', '哔哩哔哩', 'public', 'https://www.bilibili.com/', '0');
INSERT INTO `website` VALUES ('14', '2019-11-22 13:17:51', 'http://img.168dh.cn/website/1574399865411iqiyi.svg', '0', '在线视频网站-海量正版高清视频在线观看', '爱奇艺', 'public', 'https://www.iqiyi.com/', '0');
INSERT INTO `website` VALUES ('15', '2019-11-22 13:18:56', 'http://img.168dh.cn/website/1574399928451tengxunshipin.svg', '0', '中国领先的在线视频媒体平台,海量高清视频在线观看', '腾讯视频', 'public', 'https://v.qq.com/', '0');
INSERT INTO `website` VALUES ('16', '2019-11-22 13:20:14', 'http://img.168dh.cn/website/1574400003893youku.svg', '0', '这世界很酷', '优酷', 'public', 'https://www.youku.com/', '0');
INSERT INTO `website` VALUES ('17', '2019-11-22 13:21:15', 'http://img.168dh.cn/website/1574400069739mgtv.svg', '0', '湖南广播电视台旗下唯一互联网视频平台', '芒果TV', 'public', 'https://www.mgtv.com/', '0');
INSERT INTO `website` VALUES ('18', '2019-11-22 13:35:22', 'http://img.168dh.cn/website/1574400904165tudou.svg', '0', '阿里巴巴文化娱乐集团旗下短视频平台', '土豆网', 'public', 'https://www.tudou.com/', '0');
INSERT INTO `website` VALUES ('19', '2019-11-22 13:36:25', 'http://img.168dh.cn/website/1574400969331cctv.png', '0', '中央电视台官方视频网站', 'CCTV', 'public', 'http://tv.cctv.com/', '0');
INSERT INTO `website` VALUES ('20', '2019-11-22 13:42:38', 'http://img.168dh.cn/website/1574401352898music163.svg', '0', '网易旗下的高品质音乐播放器', '网易云音乐', 'public', 'http://music.163.com/', '0');
INSERT INTO `website` VALUES ('21', '2019-11-22 05:44:00', 'http://img.168dh.cn/website/1574401446562kugou.svg', '0', '中国使用人数较多的音乐播放器之一', '酷狗音乐', 'public', 'http://www.kugou.com/', '0');
INSERT INTO `website` VALUES ('22', '2019-11-22 13:45:18', 'http://img.168dh.cn/website/1574401513418musicqq.svg', '0', '腾讯旗下的一款免费音乐服务', 'QQ音乐', 'public', 'https://y.qq.com/', '0');
INSERT INTO `website` VALUES ('23', '2019-11-22 13:46:42', 'http://img.168dh.cn/website/1574401585186xiami.svg', '0', '提供高品质音乐MP3的个性化推荐', '虾米音乐', 'public', 'https://www.xiami.com/', '0');
INSERT INTO `website` VALUES ('24', '2019-11-22 13:47:37', 'http://img.168dh.cn/website/1574401652651kuwo.svg', '0', '无损音质正版在线试听网站', '酷我音乐', 'public', 'http://www.kuwo.cn/', '0');
INSERT INTO `website` VALUES ('25', '2019-11-22 13:48:45', 'http://img.168dh.cn/website/1574401719347doubanfm.png', '0', '豆瓣开发的个性化的音乐收听工具', '豆瓣FM', 'public', 'https://douban.fm/', '0');
INSERT INTO `website` VALUES ('26', '2019-11-22 13:58:39', 'http://img.168dh.cn/website/1574402313228xiecheng.svg', '0', '中国领先的在线旅行服务公司', '携程网', 'public', 'https://www.ctrip.com/', '0');
INSERT INTO `website` VALUES ('27', '2019-11-22 06:00:00', 'http://img.168dh.cn/website/1574402445651feizhu.svg', '0', '阿里巴巴旗下的综合性旅游出行服务平台', '飞猪旅行', 'public', 'https://www.fliggy.com/', '0');
INSERT INTO `website` VALUES ('28', '2019-11-22 14:02:31', 'http://img.168dh.cn/website/1574402541908tongcheng.png', '0', '专业的一站式旅游预订平台', '同程旅游', 'public', 'https://www.ly.com/', '0');
INSERT INTO `website` VALUES ('29', '2019-11-22 14:03:47', 'http://img.168dh.cn/website/1574402620867tuniu.png', '0', '让旅游更简单 要旅游 找途牛！', '途牛', 'public', 'http://www.tuniu.com/', '0');
INSERT INTO `website` VALUES ('30', '2019-11-22 14:05:07', 'http://img.168dh.cn/website/1574402690939qunaer.svg', '0', '提供机票,飞机票,特价机票,打折机票的查询预订', '去哪儿', 'public', 'https://www.qunar.com/', '0');
INSERT INTO `website` VALUES ('31', '2019-11-22 14:06:57', 'http://img.168dh.cn/website/1574402811626lvmama.png', '0', '中国新型的B2C旅游电子商务网站', '驴妈妈', 'public', 'http://www.lvmama.com/', '0');
INSERT INTO `website` VALUES ('32', '2019-11-22 14:22:07', 'http://img.168dh.cn/website/157440365453136kr.png', '0', '提供创业资讯、科技新闻、投融资对接、股权投资、极速融资等创业服务，致力成为创业者可以依赖的创业服务平台，为创业者提供最好的产品和服务。', '36氪', 'public', 'https://36kr.com/', '0');
INSERT INTO `website` VALUES ('33', '2019-11-22 14:23:40', 'http://img.168dh.cn/website/1574403810205huxiu.png', '0', '聚合优质的创新信息与人群，捕获精选|深度|犀利的商业科技资讯。在虎嗅，不错过互联网的每个重要时刻。', '虎嗅网', 'public', 'https://www.huxiu.com/', '0');
INSERT INTO `website` VALUES ('34', '2019-11-22 14:25:32', 'http://img.168dh.cn/website/1574403923350wanqu.png', '0', '关注创业与技术，每天推送5篇优质英文文章', '湾区日报', 'public', 'https://wanqu.co/', '0');
INSERT INTO `website` VALUES ('35', '2019-11-22 14:28:36', 'http://img.168dh.cn/website/1574404107115solidot.png', '0', '至顶网下的科技资讯网站，主要面对开源自由软件和关心科技资讯读者群，包括众多中国开源软件的开发者，爱好者和布道者。口号是“奇客的资讯，重要的东西”。', 'Solidot', 'public', 'https://www.solidot.org/', '0');
INSERT INTO `website` VALUES ('36', '2019-11-22 14:31:17', 'http://img.168dh.cn/website/1574404270503geekpark.png', '0', '聚焦互联网领域，跟踪最新的科技新闻动态，关注极具创新精神的科技产品。', '极客公园-推动商业新变量', 'public', 'http://www.geekpark.net/', '0');
INSERT INTO `website` VALUES ('37', '2019-11-22 14:36:33', 'http://img.168dh.cn/website/1574404579218ifeng.svg', '0', '中国领先的综合门户网站', '凤凰网', 'public', 'http://www.ifeng.com/', '0');
INSERT INTO `website` VALUES ('38', '2019-11-22 14:37:35', 'http://img.168dh.cn/website/1574404641111huanqiu.png', '0', '中国领先的国际资讯门户', '环球网', 'public', 'https://www.huanqiu.com/', '0');
INSERT INTO `website` VALUES ('39', '2019-11-22 06:38:00', 'http://img.168dh.cn/website/1574404708388thepaper.png', '0', '专注时政与思想', '澎湃新闻', 'public', 'http://www.thepaper.cn/', '0');
INSERT INTO `website` VALUES ('40', '2019-11-22 14:39:41', 'http://img.168dh.cn/website/1574404772897tengxunxinwen.svg', '0', '腾讯提供的免费新闻服务', '腾讯新闻', 'public', 'https://news.qq.com/', '0');
INSERT INTO `website` VALUES ('41', '2019-11-22 06:40:00', 'http://img.168dh.cn/website/1574404840081xinlangxinwen.svg', '0', '新浪旗下的新闻频道', '新浪新闻', 'public', 'https://news.sina.com.cn/', '0');
INSERT INTO `website` VALUES ('42', '2019-11-22 14:42:12', 'http://img.168dh.cn/website/1574404927164sohuxinwen.svg', '0', '上搜狐新闻、知天下大事', '搜狐新闻', 'public', 'https://news.sohu.com/', '0');
INSERT INTO `website` VALUES ('43', '2019-11-22 14:43:07', 'http://img.168dh.cn/website/1574404980203wangyixinwen.png', '0', '网易提供的新闻资讯平台，各有态度', '网易新闻', 'public', 'http://news.163.com/', '0');
INSERT INTO `website` VALUES ('44', '2019-11-22 14:49:08', 'http://img.168dh.cn/website/1574405028321guanchazhe.png', '0', '中国关怀 全球视野', '观察者', 'public', 'https://www.guancha.cn/', '0');
INSERT INTO `website` VALUES ('45', '2019-11-22 06:49:00', 'http://img.168dh.cn/website/1574405386475jiemian.png', '0', '只服务于独立思考的人群', '界面新闻', 'public', 'https://www.jiemian.com/', '0');
INSERT INTO `website` VALUES ('55', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408576405junshitoutiao.png', '0', '东方网旗下的专业军事新闻网站', '军事头条', 'public', 'http://mil.eastday.com/', '0');
INSERT INTO `website` VALUES ('56', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408577537zhonghuajunshi.png', '0', '中国最具权威的军事门户', '中华网军事', 'public', 'http://military.china.com/', '0');
INSERT INTO `website` VALUES ('57', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408578025tiexuejunshi.png', '0', '提供中国军事、世界军事、军事新闻', '铁血军事', 'public', 'http://www.tiexue.net/', '0');
INSERT INTO `website` VALUES ('58', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408578551tengxunjunshi.svg', '0', '腾讯网旗下军事频道', '腾讯军事', 'public', 'https://new.qq.com/', '0');
INSERT INTO `website` VALUES ('59', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408579071renminjunshi.svg', '0', '人民网旗下军事频道', '人民网军事', 'public', 'http://military.people.com.cn/', '0');
INSERT INTO `website` VALUES ('60', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408579606mier.png', '0', '中国最具特色的军事社区', '米尔网', 'public', 'http://www.miercn.com/', '0');
INSERT INTO `website` VALUES ('61', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408580076xinlanjunshi.svg', '0', '新浪网旗下的专业军事知识网站', '新浪军事', 'public', 'http://mil.news.sina.com.cn/', '0');
INSERT INTO `website` VALUES ('62', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408580494huanqiujunshi.png', '0', '中国最权威的军事新闻网站之一', '环球军事', 'public', 'http://mil.huanqiu.com/', '0');
INSERT INTO `website` VALUES ('63', '2019-11-22 15:42:58', 'http://img.168dh.cn/website/1574408580903fenghuanjunshi.svg', '0', '凤凰网旗下的军事频道', '凤凰军事', 'public', 'http://news.ifeng.com/mil', '0');
INSERT INTO `website` VALUES ('64', '2019-11-22 15:48:40', 'http://img.168dh.cn/website/1574408919877eastmoney.svg', '0', '中国财经门户', '东方财富', 'public', 'http://www.eastmoney.com/', '0');
INSERT INTO `website` VALUES ('65', '2019-11-22 15:48:41', 'http://img.168dh.cn/website/1574408920765finance.png', '0', '新浪网旗下财经频道', '新浪财经', 'public', 'https://finance.sina.com.cn/', '0');
INSERT INTO `website` VALUES ('66', '2019-11-22 15:48:41', 'http://img.168dh.cn/website/1574408921224hexun.png', '0', '中国财经网络领袖和中产阶级网络家园', '和讯财经', 'public', 'http://www.hexun.com/', '0');
INSERT INTO `website` VALUES ('67', '2019-11-22 15:48:42', 'http://img.168dh.cn/website/1574408921764yicai.png', '0', '专业创造价值', '第一财经', 'public', 'https://www.yicai.com/', '0');
INSERT INTO `website` VALUES ('68', '2019-11-22 15:48:42', 'http://img.168dh.cn/website/1574408922276caixin.png', '0', '原创财经新媒体', '财新网', 'public', 'http://www.caixin.com/', '0');
INSERT INTO `website` VALUES ('69', '2019-11-22 15:48:43', 'http://img.168dh.cn/website/1574408922740ce.png', '0', '国家经济门户', '中国经济网', 'public', 'http://www.ce.cn/', '0');
INSERT INTO `website` VALUES ('70', '2019-11-22 15:48:43', 'http://img.168dh.cn/website/1574408923287money163.png', '0', '网易163旗下财经频道', '网易财经', 'public', 'http://money.163.com/', '0');
INSERT INTO `website` VALUES ('71', '2019-11-22 15:48:44', 'http://img.168dh.cn/website/1574408924015stockstar.png', '0', '中国交易者专业门户', '证券之星', 'public', 'http://www.stockstar.com/', '0');
INSERT INTO `website` VALUES ('72', '2019-11-22 15:48:45', 'http://img.168dh.cn/website/1574408924868xueqiu.svg', '0', '聪明的投资者都在这里', '雪球财经', 'public', 'https://xueqiu.com/', '0');
INSERT INTO `website` VALUES ('73', '2019-11-22 15:49:27', 'http://img.168dh.cn/website/1574408967151nba.png', '0', 'NBA中国官方网站', 'NBA', 'public', 'http://china.nba.com/', '0');
INSERT INTO `website` VALUES ('74', '2019-11-22 15:49:28', 'http://img.168dh.cn/website/1574408967930cctv.png', '0', '央视体育频道高清直播平台', 'CCTV5', 'public', 'http://sports.cctv.com/', '0');
INSERT INTO `website` VALUES ('75', '2019-11-22 15:49:28', 'http://img.168dh.cn/website/1574408968402163tiyu.png', '0', '网易163旗下体育频道', '网易体育', 'public', 'http://sports.163.com/', '0');
INSERT INTO `website` VALUES ('76', '2019-11-22 15:49:29', 'http://img.168dh.cn/website/1574408968876zhiboba.png', '0', '知名体育平台', '直播吧', 'public', 'https://www.zhibo8.cc/', '0');
INSERT INTO `website` VALUES ('77', '2019-11-22 15:49:29', 'http://img.168dh.cn/website/1574408969280dongqiudi.png', '0', '专业权威的足球网站', '懂球帝', 'public', 'http://www.dongqiudi.com/', '0');
INSERT INTO `website` VALUES ('78', '2019-11-22 15:49:30', 'http://img.168dh.cn/website/1574408969667huputiyu.svg', '0', '专注于体育等资讯的平台', '虎扑体育', 'public', 'https://www.hupu.com/', '0');
INSERT INTO `website` VALUES ('79', '2019-11-22 15:49:30', 'http://img.168dh.cn/website/1574408970074xinlangtiyu.png', '0', '新浪网旗下的体育频道', '新浪体育', 'public', 'http://sports.sina.com.cn/', '0');
INSERT INTO `website` VALUES ('80', '2019-11-22 15:49:30', 'http://img.168dh.cn/website/1574408970533tengxuntiyu.svg', '0', '腾讯旗下的体育频道', '腾讯体育', 'public', 'http://sports.qq.com/', '0');
INSERT INTO `website` VALUES ('81', '2019-11-22 15:49:31', 'http://img.168dh.cn/website/1574408971008souhutiyu.png', '0', '搜狐旗下的体育频道', '搜狐体育', 'public', 'http://sports.sohu.com/', '0');
INSERT INTO `website` VALUES ('82', '2019-11-22 15:50:16', 'http://img.168dh.cn/website/1574409016795autohome.png', '0', '看车·买车·用车', '汽车之家', 'public', 'https://www.autohome.com.cn/', '0');
INSERT INTO `website` VALUES ('83', '2019-11-22 15:50:18', 'http://img.168dh.cn/website/1574409017660taipingyangqiche.png', '0', '一个专业的汽车网络媒体', '太平洋汽车', 'public', 'http://www.pcauto.com.cn/', '0');
INSERT INTO `website` VALUES ('84', '2019-11-22 15:50:18', 'http://img.168dh.cn/website/1574409018166yiche.png', '0', '中国国内最领先的汽车专业媒体集团', '易车网', 'public', 'http://www.yiche.com/', '0');
INSERT INTO `website` VALUES ('85', '2019-11-22 15:50:19', 'http://img.168dh.cn/website/1574409018641renrenche.png', '0', '二手车交易市场', '人人车', 'public', 'https://www.renrenche.com/', '0');
INSERT INTO `website` VALUES ('86', '2019-11-22 15:50:19', 'http://img.168dh.cn/website/1574409019059youxin.svg', '0', '专注于二手车交易服务', '优信二手车', 'public', 'https://www.xin.com/', '0');
INSERT INTO `website` VALUES ('87', '2019-11-22 15:50:19', 'http://img.168dh.cn/website/1574409019472guazi.png', '0', '没有中间商赚差价！', '瓜子二手车', 'public', 'https://www.guazi.com/', '0');
INSERT INTO `website` VALUES ('88', '2019-11-22 15:50:20', 'http://img.168dh.cn/website/1574409019935aikaqiche.png', '0', '中国领先的汽车主题社区', '爱卡汽车', 'public', 'http://www.xcar.com.cn/', '0');
INSERT INTO `website` VALUES ('89', '2019-11-22 15:50:20', 'http://img.168dh.cn/website/1574409020421122nkg.svg', '0', '交通安全服务管理平台', '车辆违章查询', 'public', 'http://nkg.122.gov.cn/', '0');
INSERT INTO `website` VALUES ('90', '2019-11-22 15:50:21', 'http://img.168dh.cn/website/1574409020806jd.svg', '0', '京东汽车用品频道', '汽车用品', 'public', 'https://che.jd.com/', '0');
INSERT INTO `website` VALUES ('91', '2019-11-22 15:51:18', 'http://img.168dh.cn/website/1574409077929zol.svg', '0', '大中华区专业IT网站', '中关村在线', 'public', 'http://www.zol.com.cn/', '0');
INSERT INTO `website` VALUES ('92', '2019-11-22 15:51:19', 'http://img.168dh.cn/website/1574409078792pconline.png', '0', '专业IT门户网站', '太平洋电脑', 'public', 'http://www.pconline.com.cn/', '0');
INSERT INTO `website` VALUES ('93', '2019-11-22 15:51:19', 'http://img.168dh.cn/website/1574409079344engadget.png', '0', '消费性电子产品新闻和评测', 'Engadget中国', 'public', 'https://cn.engadget.com/', '0');
INSERT INTO `website` VALUES ('94', '2019-11-22 15:51:20', 'http://img.168dh.cn/website/1574409079768ithome.png', '0', '数码，科技，生活', 'IT之家', 'public', 'https://www.ithome.com/', '0');
INSERT INTO `website` VALUES ('95', '2019-11-22 15:51:21', 'http://img.168dh.cn/website/1574409080984zealer.png', '0', '科技生活方式第一站', 'ZEALER', 'public', 'http://www.zealer.com/', '0');
INSERT INTO `website` VALUES ('96', '2019-11-22 15:51:21', 'http://img.168dh.cn/website/1574409081532dgtle.png', '0', '分享美好数字生活', '数字尾巴', 'public', 'http://www.dgtle.com/', '0');
INSERT INTO `website` VALUES ('97', '2019-11-22 15:51:22', 'http://img.168dh.cn/website/1574409082070chiphell.png', '0', '分享与交流用户体验', 'Chiphell', 'public', 'https://www.chiphell.com/', '0');
INSERT INTO `website` VALUES ('98', '2019-11-22 15:51:23', 'http://img.168dh.cn/website/1574409083014suning.svg', '0', '苏宁易购旗下数码频道', '苏宁数码', 'public', 'https://www.suning.com/', '0');
INSERT INTO `website` VALUES ('99', '2019-11-22 15:51:23', 'http://img.168dh.cn/website/1574409083499jd.svg', '0', '京东旗下数码频道', '京东数码', 'public', 'https://shuma.jd.com', '0');
INSERT INTO `website` VALUES ('100', '2019-11-22 15:54:53', 'http://img.168dh.cn/website/1574409292845github.svg', '0', '世界上最出名的代码托管平台', 'Github', 'public', 'https://github.com/', '0');
INSERT INTO `website` VALUES ('101', '2019-11-22 15:54:54', 'http://img.168dh.cn/website/1574409293803oschina.svg', '0', '国内最大的开源技术社区', '开源中国', 'public', 'http://www.oschina.net/', '0');
INSERT INTO `website` VALUES ('102', '2019-11-22 15:54:54', 'http://img.168dh.cn/website/1574409294273segmentfault.png', '0', '中国领先的开发者技术社区', 'Segmentfault', 'public', 'https://segmentfault.com/', '0');
INSERT INTO `website` VALUES ('103', '2019-11-22 15:54:55', 'http://img.168dh.cn/website/1574409294618v2ex.png', '0', '开发者、创意工作者社区', 'v2ex', 'public', 'https://www.v2ex.com/', '0');
INSERT INTO `website` VALUES ('104', '2019-11-22 15:54:55', 'http://img.168dh.cn/website/1574409295061csdn.svg', '0', '专业IT技术社区', 'CSDN', 'public', 'https://www.csdn.net/', '0');
INSERT INTO `website` VALUES ('105', '2019-11-22 15:54:55', 'http://img.168dh.cn/website/1574409295395cnblogs.png', '0', '代码改变世界', '博客园', 'public', 'https://www.cnblogs.com/', '0');
INSERT INTO `website` VALUES ('106', '2019-11-22 15:54:56', 'http://img.168dh.cn/website/1574409295753aliyun.svg', '0', '上云就上阿里云', '阿里云', 'public', 'https://union-click.jd.com/jdc?e=&p=AyIGZRprFDJWWA1FBCVbV0IUWVALHFRBEwQAQB1AWQkrOE9SeUMcGD12aWQOXUBaQ1R2Dhd%2FHRkOIgdQGVsRChoFXRlrFQMTBlYSXRwDEjdlG1olSXwGZRteFwYWBFcdXhMyEgNSHF4cBRUEUh5bFjIVB1wrj6mAxZvBw%2Fe61KCpZStrFjIiN1UbaxUyTUMIRmsXAxMDXA%3D%3D', '0');
INSERT INTO `website` VALUES ('107', '2019-11-22 15:54:56', 'http://img.168dh.cn/website/1574409296492toutiaoio.png', '0', '技术极客的头条新闻', '开发者头条', 'public', 'https://toutiao.io/', '0');
INSERT INTO `website` VALUES ('108', '2019-11-22 15:55:00', 'http://img.168dh.cn/website/1574409299898juejin.svg', '0', '一个帮助开发者成长的社区', '掘金', 'public', 'https://juejin.im/', '0');
INSERT INTO `website` VALUES ('109', '2019-11-22 15:55:38', 'http://img.168dh.cn/website/1574409338607zhilian.svg', '0', '一站式人力资源服务平台', '智联招聘', 'public', 'http://www.zhaopin.com/', '0');
INSERT INTO `website` VALUES ('110', '2019-11-22 15:55:40', 'http://img.168dh.cn/website/1574409339669lagou.svg', '0', '权威的互联网行业招聘平台', '拉勾网', 'public', 'https://www.lagou.com/', '0');
INSERT INTO `website` VALUES ('111', '2019-11-22 15:55:40', 'http://img.168dh.cn/website/1574409340065zhipin.svg', '0', '互联网招聘神器！', 'BOSS直聘', 'public', 'https://www.zhipin.com/', '0');
INSERT INTO `website` VALUES ('112', '2019-11-22 15:55:40', 'http://img.168dh.cn/website/157440934046051job.svg', '0', '具有广泛影响力的人力资源服务供应商', '前程无忧', 'public', 'http://www.51job.com/', '0');
INSERT INTO `website` VALUES ('113', '2019-11-22 15:55:41', 'http://img.168dh.cn/website/1574409340958liepin.svg', '0', '精英职业发展平台', '猎聘网', 'public', 'https://www.liepin.com/', '0');
INSERT INTO `website` VALUES ('114', '2019-11-22 15:55:41', 'http://img.168dh.cn/website/1574409341454100offer.png', '0', '让最好的人才遇见更好的机会', '100offer', 'public', 'https://cn.100offer.com/', '0');
INSERT INTO `website` VALUES ('115', '2019-11-22 15:55:42', 'http://img.168dh.cn/website/1574409342377neitui.png', '0', '专注互联网垂直招聘平台', '内推网', 'public', 'http://www.neitui.me/', '0');
INSERT INTO `website` VALUES ('116', '2019-11-22 15:55:43', 'http://img.168dh.cn/website/1574409342847chinahr.svg', '0', '国内最早、最专业的人才招聘网站之一', '中华英才网', 'public', 'http://www.chinahr.com/', '0');
INSERT INTO `website` VALUES ('117', '2019-11-22 15:55:43', 'http://img.168dh.cn/website/1574409343238500d.png', '0', '好用的简历制作工具', '五百丁', 'public', 'http://www.500d.me/', '0');
INSERT INTO `website` VALUES ('118', '2019-11-22 15:59:50', 'http://img.168dh.cn/website/1574409589994weibo.svg', '0', '随时随地发现新鲜事~', '新浪微博', 'public', 'http://weibo.com/', '0');
INSERT INTO `website` VALUES ('119', '2019-11-22 15:59:51', 'http://img.168dh.cn/website/1574409590807zhihu.svg', '0', '与世界分享你的知识、经验和见解', '知乎', 'public', 'https://www.zhihu.com/', '0');
INSERT INTO `website` VALUES ('120', '2019-11-22 15:59:51', 'http://img.168dh.cn/website/1574409591168douban.svg', '0', '文艺小清新社区', '豆瓣', 'public', 'https://www.douban.com/', '0');
INSERT INTO `website` VALUES ('121', '2019-11-22 15:59:52', 'http://img.168dh.cn/website/1574409591548tieba.svg', '0', '全球最大的中文社区', '百度贴吧', 'public', 'https://tieba.baidu.com/', '0');
INSERT INTO `website` VALUES ('122', '2019-11-22 15:59:52', 'http://img.168dh.cn/website/1574409592152lofter.png', '0', '网易旗下国内最优质的图片社交软件', 'LOFTER', 'public', 'http://www.lofter.com/', '0');
INSERT INTO `website` VALUES ('123', '2019-11-22 15:59:53', 'http://img.168dh.cn/website/1574409592942shuimu.png', '0', '源于清华的高知社群', '水木社区', 'public', 'http://www.newsmth.net/nForum/#!mainpage', '0');
INSERT INTO `website` VALUES ('124', '2019-11-22 15:59:54', 'http://img.168dh.cn/website/1574409593934xici.png', '0', '开放式社区平台', '西祠胡同', 'public', 'http://www.xici.net/', '0');
INSERT INTO `website` VALUES ('125', '2019-11-22 15:59:55', 'http://img.168dh.cn/website/1574409594954tianya.svg', '0', '全球华人网上家园', '天涯社区', 'public', 'http://focus.tianya.cn/', '0');
INSERT INTO `website` VALUES ('126', '2019-11-22 15:59:55', 'http://img.168dh.cn/website/1574409595445mop.png', '0', '网络流行文化发源地', '猫扑网', 'public', 'http://www.mop.com/', '0');
INSERT INTO `website` VALUES ('150', '2019-11-22 16:39:39', 'https://www.vcg.com/favicon.ico', '0', '', ' 收费高清图片素材库', 'public', 'https://www.vcg.com/', '0');
INSERT INTO `website` VALUES ('128', '2019-11-22 16:33:40', 'https://gallery.1x.com/favicon.ico', '0', '', ' 纯粹的摄影社区', 'public', 'https://gallery.1x.com ', '0');
INSERT INTO `website` VALUES ('129', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://35photo.pro/', '0', '', ' 专业摄影师社交网络', 'public', 'https://35photo.pro/', '0');
INSERT INTO `website` VALUES ('130', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://www.lensculture.com/', '0', '', '当代摄影', 'public', 'https://www.lensculture.com/', '0');
INSERT INTO `website` VALUES ('131', '2019-11-22 16:33:40', 'https://www.pexels.com/favicon.ico', '0', '', ' 免费摄影图库 Free', 'public', 'https://www.pexels.com/', '0');
INSERT INTO `website` VALUES ('132', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://unsplash.com/', '0', '', ' 美丽的免费图像 Free', 'public', 'https://unsplash.com/', '0');
INSERT INTO `website` VALUES ('133', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://weheartit.com', '0', '', ' 在挚爱中迷失自己', 'public', 'https://weheartit.com', '0');
INSERT INTO `website` VALUES ('134', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=http://www.chictopia.com', '0', '', ' 穿搭造型的灵感来源', 'public', 'http://www.chictopia.com', '0');
INSERT INTO `website` VALUES ('135', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://fashioneditorials.com/', '0', '', ' 时尚摄影志', 'public', 'https://fashioneditorials.com/', '0');
INSERT INTO `website` VALUES ('136', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://i-d.vice.com', '0', '', 'd.vice.com ', 'public', 'https://i-d.vice.com', '0');
INSERT INTO `website` VALUES ('137', '2019-11-22 16:33:40', 'http://www.atelierdore.com/wp-content/themes/garancedore/images/logo-min--colored.svg', '0', '', ' 创造美丽', 'public', 'http://www.atelierdore.com', '0');
INSERT INTO `website` VALUES ('138', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://www.flickr.com/', '0', '', ' 你的靈感泉源', 'public', 'https://www.flickr.com/', '0');
INSERT INTO `website` VALUES ('139', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://500px.com/', '0', '', ' 最出色的摄影社区', 'public', 'https://500px.com/', '0');
INSERT INTO `website` VALUES ('140', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://tuchong.com', '0', '', ' 优质摄影师交流社区', 'public', 'https://tuchong.com/video/', '0');
INSERT INTO `website` VALUES ('141', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://smagazine.com/', '0', '', ' 法国时尚摄影师', 'public', 'https://smagazine.com/', '0');
INSERT INTO `website` VALUES ('142', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://www.antoineverglas.com/', '0', '', ' 爱情与文化摄影杂志', 'public', 'https://www.antoineverglas.com', '0');
INSERT INTO `website` VALUES ('143', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=http://nikosalpha.com', '0', '', 'Nikosalpha 摄影师', 'public', 'http://nikosalpha.com/featured', '0');
INSERT INTO `website` VALUES ('144', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=http://www.styleclicker.net/', '0', '', ' 德国街头时尚摄影', 'public', 'http://www.styleclicker.net/', '0');
INSERT INTO `website` VALUES ('145', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=www.kurtstallaert.com', '0', '', 'Holding Still | Kurt Stallaert', 'public', 'www.kurtstallaert.com/work', '0');
INSERT INTO `website` VALUES ('146', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=http://www.smetana.net/', '0', '', ' Campaigns', 'public', 'http://www.smetana.net/', '0');
INSERT INTO `website` VALUES ('147', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://www.estevezandbelloso.com', '0', '', 'estevez + belloso', 'public', 'https://www.estevezandbelloso.com', '0');
INSERT INTO `website` VALUES ('148', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=https://www.totallycoolpix.com', '0', '', ' 世界新闻摄影', 'public', 'https://www.totallycoolpix.com', '0');
INSERT INTO `website` VALUES ('149', '2019-11-22 16:33:40', 'https://www.google.cn/s2/favicons?domain=photoblog.hk', '0', '', ' 新奇好玩的攝影資訊', 'public', 'https://photoblog.hk', '0');
INSERT INTO `website` VALUES ('151', '2019-11-22 16:39:40', 'http://www.quanjing.com/image/2018image/public/logo-1.png', '0', '', ' 收费商业图片素材库', 'public', 'http://www.quanjing.com/', '0');
INSERT INTO `website` VALUES ('152', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://librestock.com/', '0', '', ' 搜寻20个免费图库 Free', 'public', 'https://librestock.com/', '0');
INSERT INTO `website` VALUES ('153', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://pixabay.com/', '0', '', ' 惊人的免费图片 Free', 'public', 'https://pixabay.com/', '0');
INSERT INTO `website` VALUES ('154', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://www.pakutaso.com/', '0', '', ' 免费人物素材 Free', 'public', 'https://www.pakutaso.com/', '0');
INSERT INTO `website` VALUES ('155', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://www.nicepik.com/', '0', '', ' 基于AI的数百万张图库 Free', 'public', 'https://www.nicepik.com/', '0');
INSERT INTO `website` VALUES ('156', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://kaboompics.com/', '0', '', ' 媒體也愛用的免費图库 Free', 'public', 'https://kaboompics.com/', '0');
INSERT INTO `website` VALUES ('157', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://stocksnap.io/', '0', '', '美丽的免费库存照片 Free', 'public', 'https://stocksnap.io/', '0');
INSERT INTO `website` VALUES ('158', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://gratisography.com/', '0', '', '免费的高分辨率照片 Free', 'public', 'https://gratisography.com/', '0');
INSERT INTO `website` VALUES ('159', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://visualhunt.com', '0', '', ' 免费高清图片搜索 Free', 'public', 'https://visualhunt.com/', '0');
INSERT INTO `website` VALUES ('160', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=http://finda.photo', '0', '', ' 根据颜色和标签来搜图 Free', 'public', 'http://finda.photo/', '0');
INSERT INTO `website` VALUES ('161', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://picjumbo.com/', '0', '', ' 高质量生活场景照片 Free', 'public', 'https://picjumbo.com/', '0');
INSERT INTO `website` VALUES ('162', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=http://compfight.com/', '0', '', ' 专门搜寻flickr照片搜尋引擎', 'public', 'http://compfight.com/', '0');
INSERT INTO `website` VALUES ('163', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://alpha.wallhaven.cc', '0', '', ' 高清壁纸', 'public', 'https://alpha.wallhaven.cc', '0');
INSERT INTO `website` VALUES ('164', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://www.goodfon.com/', '0', '', ' 免费下载桌面壁纸', 'public', 'https://www.goodfon.com/', '0');
INSERT INTO `website` VALUES ('165', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://magdeleine.co/browse/', '0', '', 'picked 色彩分类大图', 'public', 'https://magdeleine.co/browse/', '0');
INSERT INTO `website` VALUES ('166', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=https://www.stockvault.net', '0', '', 'stockvault.net摄影图库', 'public', 'https://www.stockvault.net', '0');
INSERT INTO `website` VALUES ('167', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=http://www.animal-photos.org', '0', '', 'photos ', 'public', 'http://www.animal-photos.org/', '0');
INSERT INTO `website` VALUES ('168', '2019-11-22 16:39:40', 'https://www.google.cn/s2/favicons?domain=http://pngimg.com/', '0', '', ' 免费透明PNG图像', 'public', 'http://pngimg.com/', '0');
INSERT INTO `website` VALUES ('169', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://folioart.co.uk', '0', '', ' 插画家和艺术家的作品集', 'public', 'https://folioart.co.uk', '0');
INSERT INTO `website` VALUES ('170', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://illustrationage.com/', '0', '', ' 插图画家的终极资源', 'public', 'https://illustrationage.com/', '0');
INSERT INTO `website` VALUES ('171', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.itsnicethat.com/', '0', '', ' 优秀插画作品及创作的故事', 'public', 'https://www.itsnicethat.com/', '0');
INSERT INTO `website` VALUES ('172', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.theispot.com/', '0', '', ' 优秀插画展示目录', 'public', 'https://www.theispot.com', '0');
INSERT INTO `website` VALUES ('173', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.pixiv.net', '0', '', ' 日本艺术家插画交流网站', 'public', 'https://www.pixiv.net', '0');
INSERT INTO `website` VALUES ('174', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.grafolio.com', '0', '', ' 创作者们的游乐园', 'public', 'https://www.grafolio.com', '0');
INSERT INTO `website` VALUES ('175', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.artstation.com/', '0', '', ' 原画游戏设计插画作品网', 'public', 'https://www.artstation.com/', '0');
INSERT INTO `website` VALUES ('176', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=http://www.n8w.com/', '0', '', ' 聚集优秀插画家作品的网站', 'public', 'http://www.n8w.com/', '0');
INSERT INTO `website` VALUES ('177', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=http://drawr.net/', '0', '', ' 可以浏览漫画绘画的过程', 'public', 'http://drawr.net/', '0');
INSERT INTO `website` VALUES ('178', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=http://www.agent002.com', '0', '', ' 法国插画作品博客', 'public', 'http://www.agent002.com', '0');
INSERT INTO `website` VALUES ('179', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.viz.com/', '0', '', ' 最好的漫画，动画和全球娱乐', 'public', 'https://www.viz.com/', '0');
INSERT INTO `website` VALUES ('180', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=http://poolga.com/', '0', '', ' 插画艺术壁纸设计', 'public', 'http://poolga.com/', '0');
INSERT INTO `website` VALUES ('181', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=http://sakiroo.com/', '0', '', ' 超人气插画师', 'public', 'http://sakiroo.com/', '0');
INSERT INTO `website` VALUES ('182', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://www.gracg.com/', '0', '', ' 原创绘画交流平台', 'public', 'https://www.gracg.com/', '0');
INSERT INTO `website` VALUES ('183', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://konachan.net/post', '0', '', ' 动漫ACG壁纸', 'public', 'https://konachan.net/post', '0');
INSERT INTO `website` VALUES ('184', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://leaveastory.com/', '0', '', ' 用漫画讲述故事交换', 'public', 'https://leaveastory.com/', '0');
INSERT INTO `website` VALUES ('185', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=https://donnadi.com/', '0', '', ' 艺术与时尚结合的作品', 'public', 'https://donnadi.com/', '0');
INSERT INTO `website` VALUES ('186', '2019-11-22 16:42:45', 'https://www.google.cn/s2/favicons?domain=http://www.sketchswap.com/', '0', '', ' 一画换一画', 'public', 'http://www.sketchswap.com/', '0');
INSERT INTO `website` VALUES ('187', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://scene360.com/', '0', '', ' 幻觉，大胆另类', 'public', 'https://scene360.com/', '0');
INSERT INTO `website` VALUES ('188', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=http://neocha.com/magazine/', '0', '', ' 亚洲文化的创意及创造力', 'public', 'http://neocha.com/magazine/', '0');
INSERT INTO `website` VALUES ('189', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://giphy.com', '0', '', 'Giphy 创意Gif图片搜索引擎', 'public', 'https://giphy.com/', '0');
INSERT INTO `website` VALUES ('190', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=http://huaban.com/', '0', '', ' 中国美图收藏采集站', 'public', 'http://huaban.com/', '0');
INSERT INTO `website` VALUES ('191', '2019-11-22 16:48:14', 'https://static.zcool.cn/git_z/z/site/favicon.ico?version=1542100790615', '0', '', ' 设计师互动平台', 'public', 'https://www.zcool.com.cn', '0');
INSERT INTO `website` VALUES ('192', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=http://www.gtn9.com', '0', '', '品牌创意平台', 'public', 'http://www.gtn9.com', '0');
INSERT INTO `website` VALUES ('193', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://dribbble.com/', '0', '', ' 全球UI设计师作品秀社区', 'public', 'https://dribbble.com/', '0');
INSERT INTO `website` VALUES ('194', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://www.pinterest.com/', '0', '', ' 全球美图收藏采集站', 'public', 'https://www.pinterest.com/', '0');
INSERT INTO `website` VALUES ('195', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://www.behance.net/', '0', '', ' 创意视觉艺术展示平台', 'public', 'https://www.behance.net/', '0');
INSERT INTO `website` VALUES ('196', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://www.deviantart.com/', '0', '', ' 分享各类艺术创作的设计社区', 'public', 'https://www.deviantart.com/', '0');
INSERT INTO `website` VALUES ('197', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://medium.muz.li/', '0', '', ' 关于设计和交互的最新UX', 'public', 'https://medium.muz.li/', '0');
INSERT INTO `website` VALUES ('198', '2019-11-22 16:48:14', 'img/favicons/trendlist.jpg', '0', '', ' 设计趋势', 'public', 'http://www.trendlist.org/', '0');
INSERT INTO `website` VALUES ('199', '2019-11-22 16:48:14', 'https://www.booooooom.com/favicon.ico', '0', '', ' 充满想像的艺术社区', 'public', 'https://www.booooooom.com/', '0');
INSERT INTO `website` VALUES ('200', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://niice.co/', '0', '', ' 与你的团队收集、分享和讨论想法', 'public', 'https://niice.co/', '0');
INSERT INTO `website` VALUES ('201', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://www.designspiration.net/', '0', '', ' 设计启示录', 'public', 'https://www.designspiration.net/', '0');
INSERT INTO `website` VALUES ('202', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=https://www.inspirationde.com/', '0', '', ' 设计灵感资源', 'public', 'https://www.inspirationde.com/', '0');
INSERT INTO `website` VALUES ('203', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=http://www.baubauhaus.com/', '0', '', ' 设计灵感、插画', 'public', 'http://www.baubauhaus.com/', '0');
INSERT INTO `website` VALUES ('204', '2019-11-22 16:48:14', 'https://www.google.cn/s2/favicons?domain=http://www.fubiz.net/', '0', '', ' 法国超人气创意灵感平台', 'public', 'http://www.fubiz.net/', '0');
INSERT INTO `website` VALUES ('205', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://coverjunkie.com', '0', '', ' 书籍封面设计', 'public', 'https://coverjunkie.com', '0');
INSERT INTO `website` VALUES ('206', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://www.mydesy.com/', '0', '', '台湾灵感创意视觉资讯', 'public', 'https://www.mydesy.com/', '0');
INSERT INTO `website` VALUES ('207', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://ello.co/', '0', '', ' 创意工作者网络社区和资讯', 'public', 'https://ello.co/', '0');
INSERT INTO `website` VALUES ('208', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://abduzeedo.com/', '0', '', ' 创意灵感和教程的设计博客', 'public', 'https://abduzeedo.com/', '0');
INSERT INTO `website` VALUES ('209', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=http://theinspirationgrid.com/', '0', '', ' 创意灵感收录集合', 'public', 'http://theinspirationgrid.com/', '0');
INSERT INTO `website` VALUES ('210', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://thefwa.com/', '0', '', ' 创意媒体艺术设计作品展', 'public', 'https://thefwa.com/', '0');
INSERT INTO `website` VALUES ('211', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://www.thisiscolossal.com/', '0', '', ' 艺术创意设计作品收集博客', 'public', 'https://www.thisiscolossal.com/', '0');
INSERT INTO `website` VALUES ('212', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=http://www.impawards.com/', '0', '', ' 电影海报收集平台', 'public', 'http://www.impawards.com/', '0');
INSERT INTO `website` VALUES ('213', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://www.koozarch.com/', '0', '', ' 最具艺术化的图纸', 'public', 'https://www.koozarch.com/', '0');
INSERT INTO `website` VALUES ('214', '2019-11-22 16:48:15', 'https://www.google.cn/s2/favicons?domain=https://www.archdaily.cn', '0', '', ' 世界最受欢迎的建筑网站', 'public', 'https://www.archdaily.cn', '0');

-- ----------------------------
-- Table structure for website_category
-- ----------------------------
DROP TABLE IF EXISTS `website_category`;
CREATE TABLE `website_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `website_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_category
-- ----------------------------
INSERT INTO `website_category` VALUES ('1', '6', '1');
INSERT INTO `website_category` VALUES ('2', '6', '2');
INSERT INTO `website_category` VALUES ('3', '6', '3');
INSERT INTO `website_category` VALUES ('4', '6', '4');
INSERT INTO `website_category` VALUES ('5', '6', '5');
INSERT INTO `website_category` VALUES ('7', '6', '6');
INSERT INTO `website_category` VALUES ('8', '6', '7');
INSERT INTO `website_category` VALUES ('9', '6', '8');
INSERT INTO `website_category` VALUES ('10', '6', '9');
INSERT INTO `website_category` VALUES ('12', '6', '10');
INSERT INTO `website_category` VALUES ('13', '6', '11');
INSERT INTO `website_category` VALUES ('14', '6', '12');
INSERT INTO `website_category` VALUES ('15', '7', '13');
INSERT INTO `website_category` VALUES ('16', '7', '14');
INSERT INTO `website_category` VALUES ('17', '7', '15');
INSERT INTO `website_category` VALUES ('18', '7', '16');
INSERT INTO `website_category` VALUES ('19', '7', '17');
INSERT INTO `website_category` VALUES ('20', '7', '18');
INSERT INTO `website_category` VALUES ('21', '7', '19');
INSERT INTO `website_category` VALUES ('22', '9', '20');
INSERT INTO `website_category` VALUES ('24', '9', '21');
INSERT INTO `website_category` VALUES ('25', '9', '22');
INSERT INTO `website_category` VALUES ('26', '9', '23');
INSERT INTO `website_category` VALUES ('27', '9', '24');
INSERT INTO `website_category` VALUES ('28', '9', '25');
INSERT INTO `website_category` VALUES ('29', '35', '26');
INSERT INTO `website_category` VALUES ('31', '35', '27');
INSERT INTO `website_category` VALUES ('32', '35', '28');
INSERT INTO `website_category` VALUES ('33', '35', '29');
INSERT INTO `website_category` VALUES ('34', '35', '30');
INSERT INTO `website_category` VALUES ('35', '35', '31');
INSERT INTO `website_category` VALUES ('36', '10', '32');
INSERT INTO `website_category` VALUES ('37', '10', '33');
INSERT INTO `website_category` VALUES ('38', '10', '34');
INSERT INTO `website_category` VALUES ('39', '10', '35');
INSERT INTO `website_category` VALUES ('40', '10', '36');
INSERT INTO `website_category` VALUES ('41', '11', '37');
INSERT INTO `website_category` VALUES ('42', '11', '38');
INSERT INTO `website_category` VALUES ('51', '11', '39');
INSERT INTO `website_category` VALUES ('44', '11', '40');
INSERT INTO `website_category` VALUES ('46', '11', '41');
INSERT INTO `website_category` VALUES ('47', '11', '42');
INSERT INTO `website_category` VALUES ('48', '11', '43');
INSERT INTO `website_category` VALUES ('49', '11', '44');
INSERT INTO `website_category` VALUES ('52', '11', '45');
INSERT INTO `website_category` VALUES ('53', '12', '46');
INSERT INTO `website_category` VALUES ('54', '12', '47');
INSERT INTO `website_category` VALUES ('55', '12', '48');
INSERT INTO `website_category` VALUES ('56', '12', '49');
INSERT INTO `website_category` VALUES ('57', '12', '50');
INSERT INTO `website_category` VALUES ('58', '12', '51');
INSERT INTO `website_category` VALUES ('59', '12', '52');
INSERT INTO `website_category` VALUES ('60', '12', '53');
INSERT INTO `website_category` VALUES ('61', '12', '54');
INSERT INTO `website_category` VALUES ('62', '12', '55');
INSERT INTO `website_category` VALUES ('63', '12', '56');
INSERT INTO `website_category` VALUES ('64', '12', '57');
INSERT INTO `website_category` VALUES ('65', '12', '58');
INSERT INTO `website_category` VALUES ('66', '12', '59');
INSERT INTO `website_category` VALUES ('67', '12', '60');
INSERT INTO `website_category` VALUES ('68', '12', '61');
INSERT INTO `website_category` VALUES ('69', '12', '62');
INSERT INTO `website_category` VALUES ('70', '12', '63');
INSERT INTO `website_category` VALUES ('71', '13', '64');
INSERT INTO `website_category` VALUES ('72', '13', '65');
INSERT INTO `website_category` VALUES ('73', '13', '66');
INSERT INTO `website_category` VALUES ('74', '13', '67');
INSERT INTO `website_category` VALUES ('75', '13', '68');
INSERT INTO `website_category` VALUES ('76', '13', '69');
INSERT INTO `website_category` VALUES ('77', '13', '70');
INSERT INTO `website_category` VALUES ('78', '13', '71');
INSERT INTO `website_category` VALUES ('79', '13', '72');
INSERT INTO `website_category` VALUES ('80', '14', '73');
INSERT INTO `website_category` VALUES ('81', '14', '74');
INSERT INTO `website_category` VALUES ('82', '14', '75');
INSERT INTO `website_category` VALUES ('83', '14', '76');
INSERT INTO `website_category` VALUES ('84', '14', '77');
INSERT INTO `website_category` VALUES ('85', '14', '78');
INSERT INTO `website_category` VALUES ('86', '14', '79');
INSERT INTO `website_category` VALUES ('87', '14', '80');
INSERT INTO `website_category` VALUES ('88', '14', '81');
INSERT INTO `website_category` VALUES ('89', '15', '82');
INSERT INTO `website_category` VALUES ('90', '15', '83');
INSERT INTO `website_category` VALUES ('91', '15', '84');
INSERT INTO `website_category` VALUES ('92', '15', '85');
INSERT INTO `website_category` VALUES ('93', '15', '86');
INSERT INTO `website_category` VALUES ('94', '15', '87');
INSERT INTO `website_category` VALUES ('95', '15', '88');
INSERT INTO `website_category` VALUES ('96', '15', '89');
INSERT INTO `website_category` VALUES ('97', '15', '90');
INSERT INTO `website_category` VALUES ('98', '16', '91');
INSERT INTO `website_category` VALUES ('99', '16', '92');
INSERT INTO `website_category` VALUES ('100', '16', '93');
INSERT INTO `website_category` VALUES ('101', '16', '94');
INSERT INTO `website_category` VALUES ('102', '16', '95');
INSERT INTO `website_category` VALUES ('103', '16', '96');
INSERT INTO `website_category` VALUES ('104', '16', '97');
INSERT INTO `website_category` VALUES ('105', '16', '98');
INSERT INTO `website_category` VALUES ('106', '16', '99');
INSERT INTO `website_category` VALUES ('107', '17', '100');
INSERT INTO `website_category` VALUES ('108', '17', '101');
INSERT INTO `website_category` VALUES ('109', '17', '102');
INSERT INTO `website_category` VALUES ('110', '17', '103');
INSERT INTO `website_category` VALUES ('111', '17', '104');
INSERT INTO `website_category` VALUES ('112', '17', '105');
INSERT INTO `website_category` VALUES ('113', '17', '106');
INSERT INTO `website_category` VALUES ('114', '17', '107');
INSERT INTO `website_category` VALUES ('115', '17', '108');
INSERT INTO `website_category` VALUES ('116', '19', '109');
INSERT INTO `website_category` VALUES ('117', '19', '110');
INSERT INTO `website_category` VALUES ('118', '19', '111');
INSERT INTO `website_category` VALUES ('119', '19', '112');
INSERT INTO `website_category` VALUES ('120', '19', '113');
INSERT INTO `website_category` VALUES ('121', '19', '114');
INSERT INTO `website_category` VALUES ('122', '19', '115');
INSERT INTO `website_category` VALUES ('123', '19', '116');
INSERT INTO `website_category` VALUES ('124', '19', '117');
INSERT INTO `website_category` VALUES ('125', '18', '118');
INSERT INTO `website_category` VALUES ('126', '18', '119');
INSERT INTO `website_category` VALUES ('127', '18', '120');
INSERT INTO `website_category` VALUES ('128', '18', '121');
INSERT INTO `website_category` VALUES ('129', '18', '122');
INSERT INTO `website_category` VALUES ('130', '18', '123');
INSERT INTO `website_category` VALUES ('131', '18', '124');
INSERT INTO `website_category` VALUES ('132', '18', '125');
INSERT INTO `website_category` VALUES ('133', '18', '126');
INSERT INTO `website_category` VALUES ('135', '28', '128');
INSERT INTO `website_category` VALUES ('136', '28', '129');
INSERT INTO `website_category` VALUES ('137', '28', '130');
INSERT INTO `website_category` VALUES ('138', '28', '131');
INSERT INTO `website_category` VALUES ('139', '28', '132');
INSERT INTO `website_category` VALUES ('140', '28', '133');
INSERT INTO `website_category` VALUES ('141', '28', '134');
INSERT INTO `website_category` VALUES ('142', '28', '135');
INSERT INTO `website_category` VALUES ('143', '28', '136');
INSERT INTO `website_category` VALUES ('144', '28', '137');
INSERT INTO `website_category` VALUES ('145', '28', '138');
INSERT INTO `website_category` VALUES ('146', '28', '139');
INSERT INTO `website_category` VALUES ('147', '28', '140');
INSERT INTO `website_category` VALUES ('148', '28', '141');
INSERT INTO `website_category` VALUES ('149', '28', '142');
INSERT INTO `website_category` VALUES ('150', '28', '143');
INSERT INTO `website_category` VALUES ('151', '28', '144');
INSERT INTO `website_category` VALUES ('152', '28', '145');
INSERT INTO `website_category` VALUES ('153', '28', '146');
INSERT INTO `website_category` VALUES ('154', '28', '147');
INSERT INTO `website_category` VALUES ('155', '28', '148');
INSERT INTO `website_category` VALUES ('156', '28', '149');
INSERT INTO `website_category` VALUES ('157', '29', '150');
INSERT INTO `website_category` VALUES ('158', '29', '151');
INSERT INTO `website_category` VALUES ('159', '29', '152');
INSERT INTO `website_category` VALUES ('160', '29', '153');
INSERT INTO `website_category` VALUES ('161', '29', '154');
INSERT INTO `website_category` VALUES ('162', '29', '155');
INSERT INTO `website_category` VALUES ('163', '29', '156');
INSERT INTO `website_category` VALUES ('164', '29', '157');
INSERT INTO `website_category` VALUES ('165', '29', '158');
INSERT INTO `website_category` VALUES ('166', '29', '159');
INSERT INTO `website_category` VALUES ('167', '29', '160');
INSERT INTO `website_category` VALUES ('168', '29', '161');
INSERT INTO `website_category` VALUES ('169', '29', '162');
INSERT INTO `website_category` VALUES ('170', '29', '163');
INSERT INTO `website_category` VALUES ('171', '29', '164');
INSERT INTO `website_category` VALUES ('172', '29', '165');
INSERT INTO `website_category` VALUES ('173', '29', '166');
INSERT INTO `website_category` VALUES ('174', '29', '167');
INSERT INTO `website_category` VALUES ('175', '29', '168');
INSERT INTO `website_category` VALUES ('176', '30', '169');
INSERT INTO `website_category` VALUES ('177', '30', '170');
INSERT INTO `website_category` VALUES ('178', '30', '171');
INSERT INTO `website_category` VALUES ('179', '30', '172');
INSERT INTO `website_category` VALUES ('180', '30', '173');
INSERT INTO `website_category` VALUES ('181', '30', '174');
INSERT INTO `website_category` VALUES ('182', '30', '175');
INSERT INTO `website_category` VALUES ('183', '30', '176');
INSERT INTO `website_category` VALUES ('184', '30', '177');
INSERT INTO `website_category` VALUES ('185', '30', '178');
INSERT INTO `website_category` VALUES ('186', '30', '179');
INSERT INTO `website_category` VALUES ('187', '30', '180');
INSERT INTO `website_category` VALUES ('188', '30', '181');
INSERT INTO `website_category` VALUES ('189', '30', '182');
INSERT INTO `website_category` VALUES ('190', '30', '183');
INSERT INTO `website_category` VALUES ('191', '30', '184');
INSERT INTO `website_category` VALUES ('192', '30', '185');
INSERT INTO `website_category` VALUES ('193', '30', '186');
INSERT INTO `website_category` VALUES ('194', '31', '187');
INSERT INTO `website_category` VALUES ('195', '31', '188');
INSERT INTO `website_category` VALUES ('196', '31', '189');
INSERT INTO `website_category` VALUES ('197', '31', '190');
INSERT INTO `website_category` VALUES ('198', '31', '191');
INSERT INTO `website_category` VALUES ('199', '31', '192');
INSERT INTO `website_category` VALUES ('200', '31', '193');
INSERT INTO `website_category` VALUES ('201', '31', '194');
INSERT INTO `website_category` VALUES ('202', '31', '195');
INSERT INTO `website_category` VALUES ('203', '31', '196');
INSERT INTO `website_category` VALUES ('204', '31', '197');
INSERT INTO `website_category` VALUES ('205', '31', '198');
INSERT INTO `website_category` VALUES ('206', '31', '199');
INSERT INTO `website_category` VALUES ('207', '31', '200');
INSERT INTO `website_category` VALUES ('208', '31', '201');
INSERT INTO `website_category` VALUES ('209', '31', '202');
INSERT INTO `website_category` VALUES ('210', '31', '203');
INSERT INTO `website_category` VALUES ('211', '31', '204');
INSERT INTO `website_category` VALUES ('212', '31', '205');
INSERT INTO `website_category` VALUES ('213', '31', '206');
INSERT INTO `website_category` VALUES ('214', '31', '207');
INSERT INTO `website_category` VALUES ('215', '31', '208');
INSERT INTO `website_category` VALUES ('216', '31', '209');
INSERT INTO `website_category` VALUES ('217', '31', '210');
INSERT INTO `website_category` VALUES ('218', '31', '211');
INSERT INTO `website_category` VALUES ('219', '31', '212');
INSERT INTO `website_category` VALUES ('220', '31', '213');
INSERT INTO `website_category` VALUES ('221', '31', '214');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_user
-- ----------------------------
