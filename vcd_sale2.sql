SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

drop database if exists vcd_sale;
create database vcd_sale;
use vcd_sale;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
`id` int(11) NOT NULL,
`username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`pwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`nickname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '张三');

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
`id` int(11) NOT NULL AUTO_INCREMENT,
`stuno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`realname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`pwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`major` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`bj` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`createDate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (3, '10003', '李明2', '123456', NULL, '男', NULL, '2021-03-26');
INSERT INTO `customer` VALUES (4, '10006', '张三1', '123456', NULL, '男', NULL, '2021-03-26');
INSERT INTO `customer` VALUES (5, '10001', '王红', '123456', '软件技术', '男', '161302', '2021-03-26');
INSERT INTO `customer` VALUES (6, '10002', '李四', '123456', '计算机科学与技术', '男', '161301', '2021-03-26');
INSERT INTO `customer` VALUES (7, '10004', '韩小虎', '123456', '软件技术1', '男', '161301', '2021-03-26');
INSERT INTO `customer` VALUES (8, '10005', '狄云辉', '123456', '软件技术', '男', '161301', '2021-03-26');
INSERT INTO `customer` VALUES (9, '10007', '李庆照', '123456', '软件技术', '男', '161301', '2021-03-26');
INSERT INTO `customer` VALUES (10, '10009', '李清照', '123456', '软件技术', NULL, '161301', '2021-03-26');
INSERT INTO `customer` VALUES (11, '10008', '李清照', '123456', '软件技术', NULL, '161301', '2021-03-26');
INSERT INTO `customer` VALUES (12, '100008', '杨雪莹', '123456', '软件技术', NULL, '161301', '2021-03-26');
INSERT INTO `customer` VALUES (13, '100010', '2021/10/1', '132456', 'sd', '男', 'sc', '2021-04-29');
INSERT INTO `customer` VALUES (14, '100111', '2021/10/1', '132456', 'sd', '男', 'sc', '2021-04-29');
INSERT INTO `customer` VALUES (15, '1000111', '2021/10/1', '132456', 'sd', '男', 'sc', '2021-04-29');
INSERT INTO `customer` VALUES (16, '101011', '李明2', '123456', NULL, '男', NULL, '2022-01-04');


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
`id` int(11) NOT NULL AUTO_INCREMENT,
`vcdName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`vcdNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`jyr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`jysj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`ghsj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`userNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`flag` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, '三国', '1001', '张三', '2022/01/03', '2022-01-19', '123123', '10006', 1);
INSERT INTO `user` VALUES (4, '三国', '1001', '张三', '2022/01/03', '2022-01-11', '123123', '10006', 1);
INSERT INTO `user` VALUES (8, '三国', '1001', '张三', '2022/01/03', '2022-01-22', '123123', '10006', 1);
INSERT INTO `user` VALUES (9, '三国', '1001', '张三', '2022/01/03', '2022-01-16', '123123', '10006', 1);
INSERT INTO `user` VALUES (10, '三国1', '1001', '张三1', '2022/01/04', '2022-01-22', '123123', '10006', 0);
INSERT INTO `user` VALUES (11, '天空之城', '1003', '张三1', '2022/01/04', '2022-01-23', '123123', '10006', 0);
INSERT INTO `user` VALUES (12, '三国1', '1001', '张三1', '2022/01/06', '2022-01-20', '', '10006', 0);
INSERT INTO `user` VALUES (13, '三国1', '1001', '张三1', '2022/01/06', '2022-01-22', '', '10006', 0);
INSERT INTO `user` VALUES (14, '三国1', '1001', '张三1', '2022/01/06', '2022-01-28', '', '10006', 0);
INSERT INTO `user` VALUES (15, '三国1', '1001', '李明', '2024/05/24', '2024-05-26', '123', '10003', 0);
INSERT INTO `user` VALUES (16, '三国1', '1001', '李明', '2024/05/24', '2024-05-30', '123', '10003', 0);
INSERT INTO `user` VALUES (17, '天空之城', '1003', '李明2', '2024/05/24', '2024-06-09', '123', '10003', 0);
INSERT INTO `user` VALUES (18, '天空之城', '1003', '李明2', '2024/05/24', '2024-05-25', '1', '10003', 0);


-- ----------------------------
-- Table structure for vcd
-- ----------------------------
DROP TABLE IF EXISTS `vcd`;
CREATE TABLE `vcd`  (
`id` int(11) NOT NULL AUTO_INCREMENT,
`vcdNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`vcdName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
`creattime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
`stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vcd
-- ----------------------------
INSERT INTO `vcd` VALUES (7, '1003', '天空之城', '天空之城', '2022-01-08', '11', '999');
INSERT INTO `vcd` VALUES (8, '1004', '老人与海', '老人与海', '2022-01-15', '35', '997');
INSERT INTO `vcd` VALUES (10, '1005', '南京南京', '南京南京', '2022-01-15', '35', '999');

SET FOREIGN_KEY_CHECKS = 1;

















-- ----------------------------
-- Table structure for buy
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy`  (
`id` int(11) NOT NULL AUTO_INCREMENT,
`vcdNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`gmr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`stuno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`vcdName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`creattime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES (5, '1001', '张三1', '10006', '三国1', '2022/01/06', '35');
INSERT INTO `buy` VALUES (6, '1004', '李明', '10003', '老人与海', '2024/05/24', '35');
INSERT INTO `buy` VALUES (7, '1005', '李明2', '10003', '南京南京', '2024/05/24', '35');
INSERT INTO `buy` VALUES (8, '1004', '李明2', '10003', '老人与海', '2024/05/24', '35');
INSERT INTO `buy` VALUES (9, '1005', '李明2', '10003', '南京南京', '2024/05/24', '35');