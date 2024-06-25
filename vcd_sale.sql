/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : vcd_sale

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 24/05/2024 14:33:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

drop database vcd_sale;
create database vcd_sale;
use vcd_sale;


-- ----------------------------
-- Table structure for admin
-- ----------------------------
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




-- ----------------------------
-- Table structure for vcd
-- ----------------------------
DROP TABLE IF EXISTS `vcd`;
CREATE TABLE `vcd`  (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `vcdNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE ,
                        `vcdName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                        `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
                        `creattime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                        `price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '价格',
                        `stock` INTEGER NOT NULL DEFAULT 0,
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
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `stuno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE ,
                            `realname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `pwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
#   `major` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `createDate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (3, '10003', '李明2', '123456', '133333', '男','2021-03-26');
INSERT INTO `student` VALUES (4, '10006', '张三1', '123456', '234431', '男', '2021-03-26');





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
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  FOREIGN KEY (`stuno`) REFERENCES student(`stuno`),
  FOREIGN KEY (`vcdNo`) REFERENCES vcd(`vcdNo`)
 ) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES (5, '1001', '张三1', '10006', '三国1', '2022/01/06', '35');
INSERT INTO `buy` VALUES (7, '1005', '李明2', '10003', '南京南京', '2024/05/24', '35');
INSERT INTO `buy` VALUES (8, '1004', '李明2', '10003', '老人与海', '2024/05/24', '35');
INSERT INTO `buy` VALUES (9, '1005', '李明2', '10003', '南京南京', '2024/05/24', '35');




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
  PRIMARY KEY (`id`) USING BTREE,
  FOREIGN KEY (`vcdNo`) REFERENCES vcd(`vcdNo`),
  FOREIGN KEY (`userNo`) REFERENCES student(`stuno`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

INSERT INTO `user` VALUES (10, '三国1', '1001', '张三1', '2022/01/04', '2022-01-22', '123123', '10006', 0);
INSERT INTO `user` VALUES (11, '天空之城', '1003', '张三1', '2022/01/04', '2022-01-23', '123123', '10006', 0);
INSERT INTO `user` VALUES (12, '三国1', '1001', '张三1', '2022/01/06', '2022-01-20', '', '10006', 0);
INSERT INTO `user` VALUES (13, '三国1', '1001', '张三1', '2022/01/06', '2022-01-22', '', '10006', 0);
INSERT INTO `user` VALUES (14, '三国1', '1001', '张三1', '2022/01/06', '2022-01-28', '', '10006', 0);

INSERT INTO `user` VALUES (17, '天空之城', '1003', '李明2', '2024/05/24', '2024-06-09', '123', '10003', 0);
INSERT INTO `user` VALUES (18, '天空之城', '1003', '李明2', '2024/05/24', '2024-05-25', '1', '10003', 0);


drop trigger update_stock;

DELIMITER
//
CREATE TRIGGER update_stock
    AFTER UPDATE ON user
    FOR EACH ROW
BEGIN
    DECLARE new_stock INT;
    IF NEW.flag = 1 AND OLD.flag = 0 THEN
        SELECT stock INTO new_stock FROM vcd WHERE vcdNo = NEW.vcdNo;
        SET new_stock = new_stock + 1;
        UPDATE vcd SET stock = new_stock WHERE vcdNo = NEW.vcdNo;
    END IF;
END;
//
DELIMITER ;


create trigger vcd_after_buy
    after insert on buy
    for each row
begin
    declare new_stock INT;
    select stock into new_stock from vcd where vcdNo = NEW.vcdNo;
    set new_stock = new_stock - 1;
    update vcd set stock = new_stock  where vcdNo = NEW.vcdNo;
end;

create trigger vcd_after_user
    after insert on user
    for each row
begin
    declare new_stock INT;
    select stock into new_stock from vcd where vcdNo = NEW.vcdNo;
    set new_stock = new_stock - 1;
    update vcd set stock = new_stock where vcdNo = NEW.vcdNo;
end;


create procedure getVcdSalesCountSummary(IN start_date varchar(255),IN end_date varchar(255))
begin
    select vcdNo, vcdName, count(*) as sales_count, sum(price) as sales_amount
    from buy
    where DATE(STR_TO_DATE(creattime,'%Y-%m-%d')) between STR_TO_DATE(start_date,'%Y-%m-%d') AND STR_TO_DATE(end_date, '%Y-%m-%d')
    group by vcdNo, vcdName;
end;

