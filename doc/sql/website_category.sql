/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : hom1db

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 10/09/2019 22:14:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for website_category
-- ----------------------------
DROP TABLE IF EXISTS `website_category`;
CREATE TABLE `website_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NULL DEFAULT 0,
  `website_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 681 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of website_category
-- ----------------------------
INSERT INTO `website_category` VALUES (1, 35, 1144);
INSERT INTO `website_category` VALUES (2, 0, 1143);
INSERT INTO `website_category` VALUES (3, 0, 1142);
INSERT INTO `website_category` VALUES (4, 0, 1141);
INSERT INTO `website_category` VALUES (5, 0, 1140);
INSERT INTO `website_category` VALUES (6, 0, 1139);
INSERT INTO `website_category` VALUES (7, 0, 1138);
INSERT INTO `website_category` VALUES (8, 0, 1137);
INSERT INTO `website_category` VALUES (9, 0, 1136);
INSERT INTO `website_category` VALUES (10, 0, 1135);
INSERT INTO `website_category` VALUES (11, 0, 1134);
INSERT INTO `website_category` VALUES (12, 0, 1133);
INSERT INTO `website_category` VALUES (13, 0, 1132);
INSERT INTO `website_category` VALUES (14, 0, 1131);
INSERT INTO `website_category` VALUES (15, 0, 1130);
INSERT INTO `website_category` VALUES (16, 0, 1129);
INSERT INTO `website_category` VALUES (17, 0, 1128);
INSERT INTO `website_category` VALUES (18, 0, 1127);
INSERT INTO `website_category` VALUES (19, 0, 1126);
INSERT INTO `website_category` VALUES (20, 0, 1125);
INSERT INTO `website_category` VALUES (21, 0, 1124);
INSERT INTO `website_category` VALUES (22, 0, 1123);
INSERT INTO `website_category` VALUES (23, 0, 1122);
INSERT INTO `website_category` VALUES (24, 0, 1121);
INSERT INTO `website_category` VALUES (25, 0, 1120);
INSERT INTO `website_category` VALUES (26, 0, 1119);
INSERT INTO `website_category` VALUES (27, 0, 1118);
INSERT INTO `website_category` VALUES (28, 0, 1117);
INSERT INTO `website_category` VALUES (29, 0, 1116);
INSERT INTO `website_category` VALUES (30, 0, 1115);
INSERT INTO `website_category` VALUES (31, 0, 1114);
INSERT INTO `website_category` VALUES (32, 0, 1113);
INSERT INTO `website_category` VALUES (33, 0, 1112);
INSERT INTO `website_category` VALUES (34, 0, 1111);
INSERT INTO `website_category` VALUES (35, 0, 1110);
INSERT INTO `website_category` VALUES (36, 0, 1109);
INSERT INTO `website_category` VALUES (37, 0, 1108);
INSERT INTO `website_category` VALUES (38, 0, 1107);
INSERT INTO `website_category` VALUES (39, 0, 1106);
INSERT INTO `website_category` VALUES (40, 0, 1105);
INSERT INTO `website_category` VALUES (41, 0, 1104);
INSERT INTO `website_category` VALUES (42, 0, 1103);
INSERT INTO `website_category` VALUES (43, 0, 1102);
INSERT INTO `website_category` VALUES (44, 0, 1101);
INSERT INTO `website_category` VALUES (45, 0, 1100);
INSERT INTO `website_category` VALUES (46, 0, 1099);
INSERT INTO `website_category` VALUES (47, 0, 1098);
INSERT INTO `website_category` VALUES (48, 0, 1097);
INSERT INTO `website_category` VALUES (49, 0, 1096);
INSERT INTO `website_category` VALUES (50, 0, 1095);
INSERT INTO `website_category` VALUES (51, 0, 1094);
INSERT INTO `website_category` VALUES (52, 0, 1093);
INSERT INTO `website_category` VALUES (53, 0, 1092);
INSERT INTO `website_category` VALUES (54, 0, 1091);
INSERT INTO `website_category` VALUES (55, 0, 1090);
INSERT INTO `website_category` VALUES (56, 0, 1089);
INSERT INTO `website_category` VALUES (57, 0, 1088);
INSERT INTO `website_category` VALUES (58, 0, 1087);
INSERT INTO `website_category` VALUES (59, 0, 1086);
INSERT INTO `website_category` VALUES (60, 0, 1085);
INSERT INTO `website_category` VALUES (61, 0, 1084);
INSERT INTO `website_category` VALUES (62, 0, 1083);
INSERT INTO `website_category` VALUES (63, 0, 1082);
INSERT INTO `website_category` VALUES (64, 0, 1081);
INSERT INTO `website_category` VALUES (65, 0, 1080);
INSERT INTO `website_category` VALUES (66, 0, 1079);
INSERT INTO `website_category` VALUES (67, 0, 1078);
INSERT INTO `website_category` VALUES (68, 0, 1077);
INSERT INTO `website_category` VALUES (69, 0, 1076);
INSERT INTO `website_category` VALUES (70, 0, 1075);
INSERT INTO `website_category` VALUES (71, 0, 1074);
INSERT INTO `website_category` VALUES (72, 0, 1073);
INSERT INTO `website_category` VALUES (73, 0, 1072);
INSERT INTO `website_category` VALUES (74, 0, 1071);
INSERT INTO `website_category` VALUES (75, 0, 1070);
INSERT INTO `website_category` VALUES (76, 0, 1069);
INSERT INTO `website_category` VALUES (77, 0, 1068);
INSERT INTO `website_category` VALUES (78, 0, 1067);
INSERT INTO `website_category` VALUES (79, 0, 1066);
INSERT INTO `website_category` VALUES (80, 0, 1065);
INSERT INTO `website_category` VALUES (81, 0, 1064);
INSERT INTO `website_category` VALUES (82, 0, 1063);
INSERT INTO `website_category` VALUES (83, 0, 1062);
INSERT INTO `website_category` VALUES (84, 0, 1061);
INSERT INTO `website_category` VALUES (85, 0, 1060);
INSERT INTO `website_category` VALUES (86, 0, 1059);
INSERT INTO `website_category` VALUES (87, 0, 1058);
INSERT INTO `website_category` VALUES (88, 0, 1057);
INSERT INTO `website_category` VALUES (89, 0, 1056);
INSERT INTO `website_category` VALUES (90, 0, 1055);
INSERT INTO `website_category` VALUES (91, 0, 1054);
INSERT INTO `website_category` VALUES (92, 0, 1053);
INSERT INTO `website_category` VALUES (93, 0, 1052);
INSERT INTO `website_category` VALUES (94, 0, 1051);
INSERT INTO `website_category` VALUES (95, 0, 1050);
INSERT INTO `website_category` VALUES (96, 0, 1049);
INSERT INTO `website_category` VALUES (97, 0, 1048);
INSERT INTO `website_category` VALUES (98, 0, 1047);
INSERT INTO `website_category` VALUES (99, 0, 1046);
INSERT INTO `website_category` VALUES (100, 0, 1045);
INSERT INTO `website_category` VALUES (101, 0, 1044);
INSERT INTO `website_category` VALUES (102, 0, 1043);
INSERT INTO `website_category` VALUES (103, 0, 1042);
INSERT INTO `website_category` VALUES (104, 0, 1041);
INSERT INTO `website_category` VALUES (105, 0, 1040);
INSERT INTO `website_category` VALUES (106, 0, 1039);
INSERT INTO `website_category` VALUES (107, 0, 1038);
INSERT INTO `website_category` VALUES (108, 0, 1037);
INSERT INTO `website_category` VALUES (109, 0, 1036);
INSERT INTO `website_category` VALUES (110, 0, 1035);
INSERT INTO `website_category` VALUES (111, 0, 1034);
INSERT INTO `website_category` VALUES (112, 0, 1033);
INSERT INTO `website_category` VALUES (113, 0, 1032);
INSERT INTO `website_category` VALUES (114, 0, 1031);
INSERT INTO `website_category` VALUES (115, 0, 1030);
INSERT INTO `website_category` VALUES (116, 0, 1029);
INSERT INTO `website_category` VALUES (117, 0, 1028);
INSERT INTO `website_category` VALUES (118, 0, 1027);
INSERT INTO `website_category` VALUES (119, 0, 1026);
INSERT INTO `website_category` VALUES (120, 0, 1025);
INSERT INTO `website_category` VALUES (121, 0, 1024);
INSERT INTO `website_category` VALUES (122, 0, 1023);
INSERT INTO `website_category` VALUES (123, 0, 1022);
INSERT INTO `website_category` VALUES (124, 0, 1021);
INSERT INTO `website_category` VALUES (125, 0, 1020);
INSERT INTO `website_category` VALUES (126, 0, 1019);
INSERT INTO `website_category` VALUES (127, 0, 1018);
INSERT INTO `website_category` VALUES (128, 0, 1017);
INSERT INTO `website_category` VALUES (129, 0, 1016);
INSERT INTO `website_category` VALUES (130, 0, 1015);
INSERT INTO `website_category` VALUES (131, 0, 1014);
INSERT INTO `website_category` VALUES (132, 0, 1013);
INSERT INTO `website_category` VALUES (133, 0, 1012);
INSERT INTO `website_category` VALUES (134, 0, 1011);
INSERT INTO `website_category` VALUES (135, 0, 1010);
INSERT INTO `website_category` VALUES (136, 0, 1009);
INSERT INTO `website_category` VALUES (137, 0, 1008);
INSERT INTO `website_category` VALUES (138, 0, 1007);
INSERT INTO `website_category` VALUES (139, 0, 1006);
INSERT INTO `website_category` VALUES (140, 0, 1005);
INSERT INTO `website_category` VALUES (141, 0, 1004);
INSERT INTO `website_category` VALUES (142, 0, 1003);
INSERT INTO `website_category` VALUES (143, 0, 1002);
INSERT INTO `website_category` VALUES (144, 0, 1001);
INSERT INTO `website_category` VALUES (145, 0, 1000);
INSERT INTO `website_category` VALUES (146, 0, 999);
INSERT INTO `website_category` VALUES (147, 0, 998);
INSERT INTO `website_category` VALUES (148, 0, 997);
INSERT INTO `website_category` VALUES (149, 0, 996);
INSERT INTO `website_category` VALUES (150, 0, 995);
INSERT INTO `website_category` VALUES (151, 0, 994);
INSERT INTO `website_category` VALUES (152, 0, 993);
INSERT INTO `website_category` VALUES (153, 0, 992);
INSERT INTO `website_category` VALUES (154, 0, 991);
INSERT INTO `website_category` VALUES (155, 0, 990);
INSERT INTO `website_category` VALUES (156, 0, 989);
INSERT INTO `website_category` VALUES (157, 0, 988);
INSERT INTO `website_category` VALUES (158, 0, 987);
INSERT INTO `website_category` VALUES (159, 0, 986);
INSERT INTO `website_category` VALUES (160, 0, 985);
INSERT INTO `website_category` VALUES (161, 0, 984);
INSERT INTO `website_category` VALUES (162, 0, 983);
INSERT INTO `website_category` VALUES (163, 0, 982);
INSERT INTO `website_category` VALUES (164, 0, 981);
INSERT INTO `website_category` VALUES (165, 0, 980);
INSERT INTO `website_category` VALUES (166, 0, 979);
INSERT INTO `website_category` VALUES (167, 0, 978);
INSERT INTO `website_category` VALUES (168, 0, 977);
INSERT INTO `website_category` VALUES (169, 0, 976);
INSERT INTO `website_category` VALUES (170, 0, 975);
INSERT INTO `website_category` VALUES (171, 0, 974);
INSERT INTO `website_category` VALUES (172, 0, 973);
INSERT INTO `website_category` VALUES (173, 0, 972);
INSERT INTO `website_category` VALUES (174, 0, 971);
INSERT INTO `website_category` VALUES (175, 0, 970);
INSERT INTO `website_category` VALUES (176, 0, 969);
INSERT INTO `website_category` VALUES (177, 0, 968);
INSERT INTO `website_category` VALUES (178, 0, 967);
INSERT INTO `website_category` VALUES (179, 0, 966);
INSERT INTO `website_category` VALUES (180, 0, 965);
INSERT INTO `website_category` VALUES (181, 0, 964);
INSERT INTO `website_category` VALUES (182, 0, 963);
INSERT INTO `website_category` VALUES (183, 0, 962);
INSERT INTO `website_category` VALUES (184, 0, 961);
INSERT INTO `website_category` VALUES (185, 0, 960);
INSERT INTO `website_category` VALUES (186, 0, 959);
INSERT INTO `website_category` VALUES (187, 0, 958);
INSERT INTO `website_category` VALUES (188, 0, 957);
INSERT INTO `website_category` VALUES (189, 0, 956);
INSERT INTO `website_category` VALUES (190, 0, 955);
INSERT INTO `website_category` VALUES (191, 0, 954);
INSERT INTO `website_category` VALUES (192, 0, 953);
INSERT INTO `website_category` VALUES (193, 0, 952);
INSERT INTO `website_category` VALUES (194, 0, 951);
INSERT INTO `website_category` VALUES (195, 0, 950);
INSERT INTO `website_category` VALUES (196, 0, 949);
INSERT INTO `website_category` VALUES (197, 0, 948);
INSERT INTO `website_category` VALUES (198, 0, 947);
INSERT INTO `website_category` VALUES (199, 0, 946);
INSERT INTO `website_category` VALUES (200, 0, 945);
INSERT INTO `website_category` VALUES (201, 0, 944);
INSERT INTO `website_category` VALUES (202, 0, 943);
INSERT INTO `website_category` VALUES (203, 0, 942);
INSERT INTO `website_category` VALUES (204, 0, 941);
INSERT INTO `website_category` VALUES (205, 0, 940);
INSERT INTO `website_category` VALUES (206, 0, 939);
INSERT INTO `website_category` VALUES (207, 0, 938);
INSERT INTO `website_category` VALUES (208, 0, 937);
INSERT INTO `website_category` VALUES (209, 0, 936);
INSERT INTO `website_category` VALUES (210, 0, 935);
INSERT INTO `website_category` VALUES (211, 0, 934);
INSERT INTO `website_category` VALUES (212, 0, 933);
INSERT INTO `website_category` VALUES (213, 0, 932);
INSERT INTO `website_category` VALUES (214, 0, 931);
INSERT INTO `website_category` VALUES (215, 0, 930);
INSERT INTO `website_category` VALUES (216, 0, 929);
INSERT INTO `website_category` VALUES (217, 0, 928);
INSERT INTO `website_category` VALUES (218, 0, 927);
INSERT INTO `website_category` VALUES (219, 0, 926);
INSERT INTO `website_category` VALUES (220, 0, 925);
INSERT INTO `website_category` VALUES (221, 0, 924);
INSERT INTO `website_category` VALUES (222, 0, 923);
INSERT INTO `website_category` VALUES (223, 0, 922);
INSERT INTO `website_category` VALUES (224, 0, 921);
INSERT INTO `website_category` VALUES (225, 0, 920);
INSERT INTO `website_category` VALUES (226, 0, 919);
INSERT INTO `website_category` VALUES (227, 0, 918);
INSERT INTO `website_category` VALUES (228, 0, 917);
INSERT INTO `website_category` VALUES (229, 0, 916);
INSERT INTO `website_category` VALUES (230, 0, 915);
INSERT INTO `website_category` VALUES (231, 0, 914);
INSERT INTO `website_category` VALUES (232, 0, 913);
INSERT INTO `website_category` VALUES (233, 0, 912);
INSERT INTO `website_category` VALUES (234, 0, 911);
INSERT INTO `website_category` VALUES (235, 0, 910);
INSERT INTO `website_category` VALUES (236, 0, 909);
INSERT INTO `website_category` VALUES (237, 0, 908);
INSERT INTO `website_category` VALUES (238, 0, 907);
INSERT INTO `website_category` VALUES (239, 0, 906);
INSERT INTO `website_category` VALUES (240, 0, 905);
INSERT INTO `website_category` VALUES (241, 0, 904);
INSERT INTO `website_category` VALUES (242, 0, 903);
INSERT INTO `website_category` VALUES (243, 0, 902);
INSERT INTO `website_category` VALUES (244, 0, 901);
INSERT INTO `website_category` VALUES (245, 0, 900);
INSERT INTO `website_category` VALUES (246, 0, 899);
INSERT INTO `website_category` VALUES (247, 0, 898);
INSERT INTO `website_category` VALUES (248, 0, 897);
INSERT INTO `website_category` VALUES (249, 0, 896);
INSERT INTO `website_category` VALUES (250, 0, 895);
INSERT INTO `website_category` VALUES (251, 0, 894);
INSERT INTO `website_category` VALUES (252, 0, 893);
INSERT INTO `website_category` VALUES (253, 0, 892);
INSERT INTO `website_category` VALUES (254, 0, 891);
INSERT INTO `website_category` VALUES (255, 0, 890);
INSERT INTO `website_category` VALUES (256, 0, 889);
INSERT INTO `website_category` VALUES (257, 0, 888);
INSERT INTO `website_category` VALUES (258, 0, 887);
INSERT INTO `website_category` VALUES (259, 0, 886);
INSERT INTO `website_category` VALUES (260, 0, 885);
INSERT INTO `website_category` VALUES (261, 0, 884);
INSERT INTO `website_category` VALUES (262, 0, 883);
INSERT INTO `website_category` VALUES (263, 0, 882);
INSERT INTO `website_category` VALUES (264, 0, 881);
INSERT INTO `website_category` VALUES (265, 0, 880);
INSERT INTO `website_category` VALUES (266, 0, 879);
INSERT INTO `website_category` VALUES (267, 0, 878);
INSERT INTO `website_category` VALUES (268, 0, 877);
INSERT INTO `website_category` VALUES (269, 0, 876);
INSERT INTO `website_category` VALUES (270, 0, 875);
INSERT INTO `website_category` VALUES (271, 0, 874);
INSERT INTO `website_category` VALUES (272, 0, 873);
INSERT INTO `website_category` VALUES (273, 0, 872);
INSERT INTO `website_category` VALUES (274, 0, 871);
INSERT INTO `website_category` VALUES (275, 0, 870);
INSERT INTO `website_category` VALUES (276, 0, 869);
INSERT INTO `website_category` VALUES (277, 0, 868);
INSERT INTO `website_category` VALUES (278, 0, 867);
INSERT INTO `website_category` VALUES (279, 0, 866);
INSERT INTO `website_category` VALUES (280, 0, 865);
INSERT INTO `website_category` VALUES (281, 0, 864);
INSERT INTO `website_category` VALUES (282, 0, 863);
INSERT INTO `website_category` VALUES (283, 0, 862);
INSERT INTO `website_category` VALUES (284, 0, 861);
INSERT INTO `website_category` VALUES (285, 0, 860);
INSERT INTO `website_category` VALUES (286, 0, 859);
INSERT INTO `website_category` VALUES (287, 0, 858);
INSERT INTO `website_category` VALUES (288, 0, 857);
INSERT INTO `website_category` VALUES (289, 0, 856);
INSERT INTO `website_category` VALUES (290, 0, 855);
INSERT INTO `website_category` VALUES (291, 0, 854);
INSERT INTO `website_category` VALUES (292, 0, 853);
INSERT INTO `website_category` VALUES (293, 0, 852);
INSERT INTO `website_category` VALUES (294, 0, 851);
INSERT INTO `website_category` VALUES (295, 0, 850);
INSERT INTO `website_category` VALUES (296, 0, 849);
INSERT INTO `website_category` VALUES (297, 0, 848);
INSERT INTO `website_category` VALUES (298, 0, 847);
INSERT INTO `website_category` VALUES (299, 0, 846);
INSERT INTO `website_category` VALUES (300, 0, 845);
INSERT INTO `website_category` VALUES (301, 0, 844);
INSERT INTO `website_category` VALUES (302, 0, 843);
INSERT INTO `website_category` VALUES (303, 0, 842);
INSERT INTO `website_category` VALUES (304, 0, 841);
INSERT INTO `website_category` VALUES (305, 0, 840);
INSERT INTO `website_category` VALUES (306, 0, 839);
INSERT INTO `website_category` VALUES (307, 0, 838);
INSERT INTO `website_category` VALUES (308, 0, 837);
INSERT INTO `website_category` VALUES (309, 0, 836);
INSERT INTO `website_category` VALUES (310, 0, 835);
INSERT INTO `website_category` VALUES (311, 0, 834);
INSERT INTO `website_category` VALUES (312, 0, 833);
INSERT INTO `website_category` VALUES (313, 0, 832);
INSERT INTO `website_category` VALUES (314, 0, 831);
INSERT INTO `website_category` VALUES (315, 0, 830);
INSERT INTO `website_category` VALUES (316, 0, 829);
INSERT INTO `website_category` VALUES (317, 0, 828);
INSERT INTO `website_category` VALUES (318, 0, 827);
INSERT INTO `website_category` VALUES (319, 0, 826);
INSERT INTO `website_category` VALUES (320, 0, 825);
INSERT INTO `website_category` VALUES (321, 0, 824);
INSERT INTO `website_category` VALUES (322, 0, 823);
INSERT INTO `website_category` VALUES (323, 0, 822);
INSERT INTO `website_category` VALUES (324, 0, 821);
INSERT INTO `website_category` VALUES (325, 0, 820);
INSERT INTO `website_category` VALUES (326, 0, 819);
INSERT INTO `website_category` VALUES (327, 0, 818);
INSERT INTO `website_category` VALUES (328, 0, 817);
INSERT INTO `website_category` VALUES (329, 0, 816);
INSERT INTO `website_category` VALUES (330, 0, 815);
INSERT INTO `website_category` VALUES (331, 0, 814);
INSERT INTO `website_category` VALUES (332, 0, 813);
INSERT INTO `website_category` VALUES (333, 0, 812);
INSERT INTO `website_category` VALUES (334, 0, 811);
INSERT INTO `website_category` VALUES (335, 0, 810);
INSERT INTO `website_category` VALUES (336, 0, 809);
INSERT INTO `website_category` VALUES (337, 0, 808);
INSERT INTO `website_category` VALUES (338, 0, 807);
INSERT INTO `website_category` VALUES (339, 0, 806);
INSERT INTO `website_category` VALUES (340, 0, 805);
INSERT INTO `website_category` VALUES (341, 0, 804);
INSERT INTO `website_category` VALUES (342, 0, 803);
INSERT INTO `website_category` VALUES (343, 0, 802);
INSERT INTO `website_category` VALUES (344, 0, 801);
INSERT INTO `website_category` VALUES (345, 0, 800);
INSERT INTO `website_category` VALUES (346, 0, 799);
INSERT INTO `website_category` VALUES (347, 0, 798);
INSERT INTO `website_category` VALUES (348, 0, 797);
INSERT INTO `website_category` VALUES (349, 0, 796);
INSERT INTO `website_category` VALUES (350, 0, 795);
INSERT INTO `website_category` VALUES (351, 0, 794);
INSERT INTO `website_category` VALUES (352, 0, 793);
INSERT INTO `website_category` VALUES (353, 0, 792);
INSERT INTO `website_category` VALUES (354, 0, 791);
INSERT INTO `website_category` VALUES (355, 0, 790);
INSERT INTO `website_category` VALUES (356, 0, 789);
INSERT INTO `website_category` VALUES (357, 0, 788);
INSERT INTO `website_category` VALUES (358, 0, 787);
INSERT INTO `website_category` VALUES (359, 0, 786);
INSERT INTO `website_category` VALUES (360, 0, 785);
INSERT INTO `website_category` VALUES (361, 0, 784);
INSERT INTO `website_category` VALUES (362, 0, 783);
INSERT INTO `website_category` VALUES (363, 0, 782);
INSERT INTO `website_category` VALUES (364, 0, 781);
INSERT INTO `website_category` VALUES (365, 0, 780);
INSERT INTO `website_category` VALUES (366, 0, 779);
INSERT INTO `website_category` VALUES (367, 0, 778);
INSERT INTO `website_category` VALUES (368, 0, 777);
INSERT INTO `website_category` VALUES (369, 0, 776);
INSERT INTO `website_category` VALUES (370, 0, 775);
INSERT INTO `website_category` VALUES (371, 0, 774);
INSERT INTO `website_category` VALUES (372, 0, 773);
INSERT INTO `website_category` VALUES (373, 0, 772);
INSERT INTO `website_category` VALUES (374, 0, 771);
INSERT INTO `website_category` VALUES (375, 0, 770);
INSERT INTO `website_category` VALUES (376, 0, 769);
INSERT INTO `website_category` VALUES (377, 0, 768);
INSERT INTO `website_category` VALUES (378, 0, 767);
INSERT INTO `website_category` VALUES (379, 0, 766);
INSERT INTO `website_category` VALUES (380, 0, 765);
INSERT INTO `website_category` VALUES (381, 0, 764);
INSERT INTO `website_category` VALUES (382, 0, 763);
INSERT INTO `website_category` VALUES (383, 0, 762);
INSERT INTO `website_category` VALUES (384, 0, 761);
INSERT INTO `website_category` VALUES (385, 0, 760);
INSERT INTO `website_category` VALUES (386, 0, 759);
INSERT INTO `website_category` VALUES (387, 0, 758);
INSERT INTO `website_category` VALUES (388, 0, 757);
INSERT INTO `website_category` VALUES (389, 0, 756);
INSERT INTO `website_category` VALUES (390, 0, 755);
INSERT INTO `website_category` VALUES (391, 0, 754);
INSERT INTO `website_category` VALUES (392, 0, 753);
INSERT INTO `website_category` VALUES (393, 0, 752);
INSERT INTO `website_category` VALUES (394, 0, 751);
INSERT INTO `website_category` VALUES (395, 0, 750);
INSERT INTO `website_category` VALUES (396, 0, 749);
INSERT INTO `website_category` VALUES (397, 0, 748);
INSERT INTO `website_category` VALUES (398, 0, 747);
INSERT INTO `website_category` VALUES (399, 0, 746);
INSERT INTO `website_category` VALUES (400, 0, 745);
INSERT INTO `website_category` VALUES (401, 0, 744);
INSERT INTO `website_category` VALUES (402, 0, 743);
INSERT INTO `website_category` VALUES (403, 0, 742);
INSERT INTO `website_category` VALUES (404, 0, 741);
INSERT INTO `website_category` VALUES (405, 0, 740);
INSERT INTO `website_category` VALUES (406, 0, 739);
INSERT INTO `website_category` VALUES (407, 0, 738);
INSERT INTO `website_category` VALUES (408, 0, 737);
INSERT INTO `website_category` VALUES (409, 0, 736);
INSERT INTO `website_category` VALUES (410, 0, 735);
INSERT INTO `website_category` VALUES (411, 0, 734);
INSERT INTO `website_category` VALUES (412, 0, 733);
INSERT INTO `website_category` VALUES (413, 0, 732);
INSERT INTO `website_category` VALUES (414, 0, 731);
INSERT INTO `website_category` VALUES (415, 0, 730);
INSERT INTO `website_category` VALUES (416, 0, 729);
INSERT INTO `website_category` VALUES (417, 0, 728);
INSERT INTO `website_category` VALUES (418, 0, 727);
INSERT INTO `website_category` VALUES (419, 0, 726);
INSERT INTO `website_category` VALUES (420, 0, 725);
INSERT INTO `website_category` VALUES (421, 0, 724);
INSERT INTO `website_category` VALUES (422, 0, 723);
INSERT INTO `website_category` VALUES (423, 0, 722);
INSERT INTO `website_category` VALUES (424, 0, 721);
INSERT INTO `website_category` VALUES (425, 0, 720);
INSERT INTO `website_category` VALUES (426, 0, 719);
INSERT INTO `website_category` VALUES (427, 0, 718);
INSERT INTO `website_category` VALUES (428, 0, 717);
INSERT INTO `website_category` VALUES (429, 0, 716);
INSERT INTO `website_category` VALUES (430, 0, 715);
INSERT INTO `website_category` VALUES (431, 0, 714);
INSERT INTO `website_category` VALUES (432, 0, 713);
INSERT INTO `website_category` VALUES (433, 0, 712);
INSERT INTO `website_category` VALUES (434, 0, 711);
INSERT INTO `website_category` VALUES (435, 0, 710);
INSERT INTO `website_category` VALUES (436, 0, 709);
INSERT INTO `website_category` VALUES (437, 0, 708);
INSERT INTO `website_category` VALUES (438, 0, 707);
INSERT INTO `website_category` VALUES (439, 0, 706);
INSERT INTO `website_category` VALUES (440, 0, 705);
INSERT INTO `website_category` VALUES (441, 0, 704);
INSERT INTO `website_category` VALUES (442, 0, 703);
INSERT INTO `website_category` VALUES (443, 0, 702);
INSERT INTO `website_category` VALUES (444, 0, 701);
INSERT INTO `website_category` VALUES (445, 0, 700);
INSERT INTO `website_category` VALUES (446, 0, 699);
INSERT INTO `website_category` VALUES (447, 0, 698);
INSERT INTO `website_category` VALUES (448, 0, 697);
INSERT INTO `website_category` VALUES (449, 0, 696);
INSERT INTO `website_category` VALUES (450, 0, 695);
INSERT INTO `website_category` VALUES (451, 0, 694);
INSERT INTO `website_category` VALUES (452, 0, 693);
INSERT INTO `website_category` VALUES (453, 0, 692);
INSERT INTO `website_category` VALUES (454, 0, 691);
INSERT INTO `website_category` VALUES (455, 0, 1145);
INSERT INTO `website_category` VALUES (456, 0, 1146);
INSERT INTO `website_category` VALUES (457, 0, 1147);
INSERT INTO `website_category` VALUES (458, 0, 1148);
INSERT INTO `website_category` VALUES (459, 0, 1149);
INSERT INTO `website_category` VALUES (460, 0, 1150);
INSERT INTO `website_category` VALUES (461, 0, 1151);
INSERT INTO `website_category` VALUES (462, 0, 1152);
INSERT INTO `website_category` VALUES (463, 0, 1153);
INSERT INTO `website_category` VALUES (464, 0, 1154);
INSERT INTO `website_category` VALUES (465, 0, 1155);
INSERT INTO `website_category` VALUES (466, 0, 1156);
INSERT INTO `website_category` VALUES (467, 0, 1157);
INSERT INTO `website_category` VALUES (468, 0, 1158);
INSERT INTO `website_category` VALUES (469, 0, 1159);
INSERT INTO `website_category` VALUES (470, 0, 1160);
INSERT INTO `website_category` VALUES (471, 0, 1161);
INSERT INTO `website_category` VALUES (472, 0, 1162);
INSERT INTO `website_category` VALUES (473, 0, 1163);
INSERT INTO `website_category` VALUES (474, 0, 1164);
INSERT INTO `website_category` VALUES (475, 0, 1165);
INSERT INTO `website_category` VALUES (476, 0, 1166);
INSERT INTO `website_category` VALUES (477, 0, 1167);
INSERT INTO `website_category` VALUES (478, 0, 1168);
INSERT INTO `website_category` VALUES (479, 0, 1169);
INSERT INTO `website_category` VALUES (480, 0, 1170);
INSERT INTO `website_category` VALUES (481, 0, 1171);
INSERT INTO `website_category` VALUES (482, 0, 1172);
INSERT INTO `website_category` VALUES (483, 0, 1173);
INSERT INTO `website_category` VALUES (484, 0, 1174);
INSERT INTO `website_category` VALUES (485, 0, 1175);
INSERT INTO `website_category` VALUES (486, 0, 1176);
INSERT INTO `website_category` VALUES (487, 0, 1177);
INSERT INTO `website_category` VALUES (488, 0, 1178);
INSERT INTO `website_category` VALUES (489, 0, 1179);
INSERT INTO `website_category` VALUES (490, 0, 1180);
INSERT INTO `website_category` VALUES (491, 0, 1181);
INSERT INTO `website_category` VALUES (492, 0, 1182);
INSERT INTO `website_category` VALUES (493, 0, 1183);
INSERT INTO `website_category` VALUES (494, 0, 1184);
INSERT INTO `website_category` VALUES (495, 0, 1185);
INSERT INTO `website_category` VALUES (496, 0, 1186);
INSERT INTO `website_category` VALUES (497, 0, 1187);
INSERT INTO `website_category` VALUES (498, 0, 1188);
INSERT INTO `website_category` VALUES (499, 0, 1189);
INSERT INTO `website_category` VALUES (500, 0, 1190);
INSERT INTO `website_category` VALUES (501, 0, 1191);
INSERT INTO `website_category` VALUES (502, 0, 1192);
INSERT INTO `website_category` VALUES (503, 0, 1193);
INSERT INTO `website_category` VALUES (504, 0, 1194);
INSERT INTO `website_category` VALUES (505, 0, 1195);
INSERT INTO `website_category` VALUES (506, 0, 1196);
INSERT INTO `website_category` VALUES (507, 0, 1197);
INSERT INTO `website_category` VALUES (508, 0, 1198);
INSERT INTO `website_category` VALUES (509, 0, 1199);
INSERT INTO `website_category` VALUES (510, 0, 1200);
INSERT INTO `website_category` VALUES (511, 0, 1201);
INSERT INTO `website_category` VALUES (512, 0, 1202);
INSERT INTO `website_category` VALUES (513, 0, 1203);
INSERT INTO `website_category` VALUES (514, 0, 1204);
INSERT INTO `website_category` VALUES (515, 0, 1205);
INSERT INTO `website_category` VALUES (516, 0, 1206);
INSERT INTO `website_category` VALUES (517, 0, 1207);
INSERT INTO `website_category` VALUES (518, 0, 1208);
INSERT INTO `website_category` VALUES (519, 0, 1209);
INSERT INTO `website_category` VALUES (520, 0, 1210);
INSERT INTO `website_category` VALUES (521, 0, 1211);
INSERT INTO `website_category` VALUES (522, 0, 1212);
INSERT INTO `website_category` VALUES (523, 0, 1213);
INSERT INTO `website_category` VALUES (524, 0, 1214);
INSERT INTO `website_category` VALUES (525, 0, 1215);
INSERT INTO `website_category` VALUES (526, 0, 1216);
INSERT INTO `website_category` VALUES (527, 0, 1217);
INSERT INTO `website_category` VALUES (528, 0, 1218);
INSERT INTO `website_category` VALUES (529, 0, 1219);
INSERT INTO `website_category` VALUES (530, 0, 1220);
INSERT INTO `website_category` VALUES (531, 0, 1221);
INSERT INTO `website_category` VALUES (532, 0, 1222);
INSERT INTO `website_category` VALUES (533, 0, 1223);
INSERT INTO `website_category` VALUES (534, 0, 1224);
INSERT INTO `website_category` VALUES (535, 0, 1225);
INSERT INTO `website_category` VALUES (536, 0, 1226);
INSERT INTO `website_category` VALUES (537, 0, 1227);
INSERT INTO `website_category` VALUES (538, 0, 1228);
INSERT INTO `website_category` VALUES (539, 0, 1229);
INSERT INTO `website_category` VALUES (540, 0, 1230);
INSERT INTO `website_category` VALUES (541, 0, 1231);
INSERT INTO `website_category` VALUES (542, 0, 1232);
INSERT INTO `website_category` VALUES (543, 0, 1233);
INSERT INTO `website_category` VALUES (544, 0, 1234);
INSERT INTO `website_category` VALUES (545, 0, 1235);
INSERT INTO `website_category` VALUES (546, 0, 1236);
INSERT INTO `website_category` VALUES (547, 0, 1237);
INSERT INTO `website_category` VALUES (548, 0, 1238);
INSERT INTO `website_category` VALUES (549, 0, 1239);
INSERT INTO `website_category` VALUES (550, 0, 1240);
INSERT INTO `website_category` VALUES (551, 0, 1241);
INSERT INTO `website_category` VALUES (552, 0, 1242);
INSERT INTO `website_category` VALUES (553, 0, 1243);
INSERT INTO `website_category` VALUES (554, 0, 1244);
INSERT INTO `website_category` VALUES (555, 0, 1245);
INSERT INTO `website_category` VALUES (556, 0, 1246);
INSERT INTO `website_category` VALUES (557, 0, 1247);
INSERT INTO `website_category` VALUES (558, 0, 1248);
INSERT INTO `website_category` VALUES (559, 0, 1249);
INSERT INTO `website_category` VALUES (560, 0, 1250);
INSERT INTO `website_category` VALUES (561, 0, 1251);
INSERT INTO `website_category` VALUES (562, 0, 1252);
INSERT INTO `website_category` VALUES (563, 0, 1253);
INSERT INTO `website_category` VALUES (564, 0, 1254);
INSERT INTO `website_category` VALUES (565, 0, 1255);
INSERT INTO `website_category` VALUES (566, 0, 1256);
INSERT INTO `website_category` VALUES (567, 0, 1257);
INSERT INTO `website_category` VALUES (568, 0, 1258);
INSERT INTO `website_category` VALUES (569, 0, 1259);
INSERT INTO `website_category` VALUES (570, 0, 1260);
INSERT INTO `website_category` VALUES (571, 0, 1261);
INSERT INTO `website_category` VALUES (572, 0, 1262);
INSERT INTO `website_category` VALUES (573, 0, 1263);
INSERT INTO `website_category` VALUES (574, 0, 1264);
INSERT INTO `website_category` VALUES (575, 0, 1265);
INSERT INTO `website_category` VALUES (576, 0, 1266);
INSERT INTO `website_category` VALUES (577, 0, 1267);
INSERT INTO `website_category` VALUES (578, 0, 1268);
INSERT INTO `website_category` VALUES (579, 0, 1269);
INSERT INTO `website_category` VALUES (580, 0, 1270);
INSERT INTO `website_category` VALUES (581, 0, 1271);
INSERT INTO `website_category` VALUES (582, 0, 1272);
INSERT INTO `website_category` VALUES (583, 0, 1273);
INSERT INTO `website_category` VALUES (584, 0, 1274);
INSERT INTO `website_category` VALUES (585, 0, 1275);
INSERT INTO `website_category` VALUES (586, 0, 1276);
INSERT INTO `website_category` VALUES (587, 0, 1277);
INSERT INTO `website_category` VALUES (588, 0, 1278);
INSERT INTO `website_category` VALUES (589, 0, 1279);
INSERT INTO `website_category` VALUES (590, 0, 1280);
INSERT INTO `website_category` VALUES (591, 0, 1281);
INSERT INTO `website_category` VALUES (592, 0, 1282);
INSERT INTO `website_category` VALUES (593, 0, 1283);
INSERT INTO `website_category` VALUES (594, 0, 1284);
INSERT INTO `website_category` VALUES (595, 0, 1285);
INSERT INTO `website_category` VALUES (596, 0, 1286);
INSERT INTO `website_category` VALUES (597, 0, 1287);
INSERT INTO `website_category` VALUES (598, 0, 1288);
INSERT INTO `website_category` VALUES (599, 0, 1289);
INSERT INTO `website_category` VALUES (600, 0, 1290);
INSERT INTO `website_category` VALUES (601, 0, 1291);
INSERT INTO `website_category` VALUES (602, 0, 1292);
INSERT INTO `website_category` VALUES (603, 0, 1293);
INSERT INTO `website_category` VALUES (604, 0, 1294);
INSERT INTO `website_category` VALUES (605, 0, 1295);
INSERT INTO `website_category` VALUES (606, 0, 1296);
INSERT INTO `website_category` VALUES (607, 0, 1297);
INSERT INTO `website_category` VALUES (608, 0, 1298);
INSERT INTO `website_category` VALUES (609, 0, 1299);
INSERT INTO `website_category` VALUES (610, 0, 1300);
INSERT INTO `website_category` VALUES (611, 0, 1301);
INSERT INTO `website_category` VALUES (612, 0, 1302);
INSERT INTO `website_category` VALUES (613, 0, 1303);
INSERT INTO `website_category` VALUES (614, 0, 1304);
INSERT INTO `website_category` VALUES (615, 0, 1305);
INSERT INTO `website_category` VALUES (616, 0, 1306);
INSERT INTO `website_category` VALUES (617, 0, 1307);
INSERT INTO `website_category` VALUES (618, 0, 1308);
INSERT INTO `website_category` VALUES (619, 0, 1309);
INSERT INTO `website_category` VALUES (620, 0, 1310);
INSERT INTO `website_category` VALUES (621, 0, 1311);
INSERT INTO `website_category` VALUES (622, 0, 1312);
INSERT INTO `website_category` VALUES (623, 0, 1313);
INSERT INTO `website_category` VALUES (624, 0, 1314);
INSERT INTO `website_category` VALUES (625, 0, 1315);
INSERT INTO `website_category` VALUES (626, 0, 1316);
INSERT INTO `website_category` VALUES (627, 0, 1317);
INSERT INTO `website_category` VALUES (628, 0, 1318);
INSERT INTO `website_category` VALUES (629, 0, 1319);
INSERT INTO `website_category` VALUES (630, 0, 1320);
INSERT INTO `website_category` VALUES (631, 0, 1321);
INSERT INTO `website_category` VALUES (632, 0, 1322);
INSERT INTO `website_category` VALUES (633, 0, 1323);
INSERT INTO `website_category` VALUES (634, 0, 1324);
INSERT INTO `website_category` VALUES (635, 0, 1325);
INSERT INTO `website_category` VALUES (636, 0, 1326);
INSERT INTO `website_category` VALUES (637, 0, 1327);
INSERT INTO `website_category` VALUES (638, 0, 1328);
INSERT INTO `website_category` VALUES (639, 0, 1329);
INSERT INTO `website_category` VALUES (640, 0, 1330);
INSERT INTO `website_category` VALUES (641, 0, 1331);
INSERT INTO `website_category` VALUES (642, 0, 1332);
INSERT INTO `website_category` VALUES (643, 0, 1333);
INSERT INTO `website_category` VALUES (644, 0, 1334);
INSERT INTO `website_category` VALUES (645, 0, 1335);
INSERT INTO `website_category` VALUES (646, 0, 1336);
INSERT INTO `website_category` VALUES (647, 0, 1337);
INSERT INTO `website_category` VALUES (648, 0, 1338);
INSERT INTO `website_category` VALUES (649, 0, 1339);
INSERT INTO `website_category` VALUES (650, 0, 1340);
INSERT INTO `website_category` VALUES (651, 0, 1341);
INSERT INTO `website_category` VALUES (652, 0, 1342);
INSERT INTO `website_category` VALUES (653, 0, 1343);
INSERT INTO `website_category` VALUES (654, 0, 1344);
INSERT INTO `website_category` VALUES (655, 0, 1345);
INSERT INTO `website_category` VALUES (656, 0, 1346);
INSERT INTO `website_category` VALUES (657, 0, 1347);
INSERT INTO `website_category` VALUES (658, 0, 1348);
INSERT INTO `website_category` VALUES (659, 0, 1349);
INSERT INTO `website_category` VALUES (660, 0, 1350);
INSERT INTO `website_category` VALUES (661, 0, 1351);
INSERT INTO `website_category` VALUES (662, 0, 1352);
INSERT INTO `website_category` VALUES (663, 0, 1353);
INSERT INTO `website_category` VALUES (664, 0, 1354);
INSERT INTO `website_category` VALUES (665, 0, 1355);
INSERT INTO `website_category` VALUES (666, 0, 1356);
INSERT INTO `website_category` VALUES (667, 0, 1357);
INSERT INTO `website_category` VALUES (668, 0, 1358);
INSERT INTO `website_category` VALUES (669, 0, 1359);
INSERT INTO `website_category` VALUES (670, 0, 1360);
INSERT INTO `website_category` VALUES (671, 0, 1361);
INSERT INTO `website_category` VALUES (672, 0, 1362);
INSERT INTO `website_category` VALUES (673, 0, 1363);
INSERT INTO `website_category` VALUES (674, 0, 1364);
INSERT INTO `website_category` VALUES (675, 0, 1365);
INSERT INTO `website_category` VALUES (676, 0, 1366);
INSERT INTO `website_category` VALUES (677, 0, 1367);
INSERT INTO `website_category` VALUES (678, 0, 1368);
INSERT INTO `website_category` VALUES (679, 0, 1369);
INSERT INTO `website_category` VALUES (680, 35, 1370);

SET FOREIGN_KEY_CHECKS = 1;
