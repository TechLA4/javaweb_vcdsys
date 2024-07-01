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
                        `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
                        `creattime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                        `price` DECIMAL(8,2) NOT NULL DEFAULT 0 COMMENT '价格',
                        `stock` INTEGER NOT NULL DEFAULT 0,
                        PRIMARY KEY (`id`) USING BTREE,
                        CHECK (`stock` >= 0),
                        CHECK (`price` > 0),
                        CHECK (STR_TO_DATE(`creattime`, '%Y/%m/%d') IS NOT NULL)
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Records of vcd
-- ----------------------------
INSERT INTO `vcd` VALUES (1, '1001', '三国演义', '电视剧', '2022/01/07', '11', '999');
INSERT INTO `vcd` VALUES (2, '1002', '天空之城', '电影', '2022/01/08', '11', '999');
INSERT INTO `vcd` VALUES (3, '1003', '老人与海', '电视剧', '2022/01/15', '35', '997');
INSERT INTO `vcd` VALUES (4, '1004', '你的名字', '电影', '2022/01/15', '20', '999');
INSERT INTO `vcd` VALUES (5, '1005', '南京南京', '电视剧', '2022/01/15', '35', '999');

INSERT INTO `vcd` VALUES (6, '1006', '星际穿越', '电影', '2022/01/20', '50', '100');
INSERT INTO `vcd` VALUES (7, '1007', '盗梦空间', '电影', '2022/01/25', '45', '150');
INSERT INTO `vcd` VALUES (8, '1008', '阿凡达', '电影', '2022/02/01', '60', '200');
INSERT INTO `vcd` VALUES (9, '1009', '泰坦尼克号', '电影', '2022/02/05', '30', '300');
INSERT INTO `vcd` VALUES (10, '1010', '哈利波特', '电视剧', '2022/02/10', '40', '500');
INSERT INTO `vcd` VALUES (11, '1011', '指环王', '电视剧', '2022/02/15', '55', '250');
INSERT INTO `vcd` VALUES (12, '1012', '蝙蝠侠', '电影', '2022/02/20', '35', '350');
INSERT INTO `vcd` VALUES (13, '1013', '蜘蛛侠', '电影', '2022/02/25', '25', '450');
INSERT INTO `vcd` VALUES (14, '1014', '复仇者联盟', '电影', '2022/03/01', '65', '150');
INSERT INTO `vcd` VALUES (15, '1015', '黑客帝国', '电影', '2022/03/05', '55', '175');


INSERT INTO `vcd` VALUES (16, '1016', '雪豹', '电影', '2022/03/05', '55', '0');
INSERT INTO `vcd` VALUES (17, '1017', '丁真', '电影', '2022/03/05', '55', '1');
SET FOREIGN_KEY_CHECKS = 1;



-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `stuno` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE ,
                            `realname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `pwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
#   `major` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            `createDate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE,
                            CHECK (`sex` IN ('男', '女')),
                            CHECK (STR_TO_DATE(`createDate`, '%Y/%m/%d') IS NOT NULL)
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '10001', '李明', '123456', '133333', '男','2021/03/26');
INSERT INTO `customer` VALUES (2, '10002', '张三', '123456', '234431', '男', '2021/03/26');
INSERT INTO `customer` VALUES (3, '10003', '赵六', '654321', '134567', '女', '2021/03/27');
INSERT INTO `customer` VALUES (4, '10004', '钱七', '123', '135678', '男', '2021/03/28');
INSERT INTO `customer` VALUES (5, '10005', '孙八', '123', '136789', '女', '2021/03/29');

# 用户性别约束测试
INSERT INTO `customer` VALUES (6, '10006', '孙6', '123', '136789', '直升机', '2021/03/29');







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
  FOREIGN KEY (`stuno`) REFERENCES customer(`stuno`),
  FOREIGN KEY (`vcdNo`) REFERENCES vcd(`vcdNo`),
  CHECK (STR_TO_DATE(`creattime`, '%Y/%m/%d') IS NOT NULL)
 ) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES (1, '1001', '张三', '10002', '三国演义', '2022/01/06', '35');
INSERT INTO `buy` VALUES (2, '1005', '李明', '10003', '南京南京', '2022/05/24', '35');
INSERT INTO `buy` VALUES (3, '1004', '李明', '10003', '你的名字', '2022/05/25', '35');
INSERT INTO `buy` VALUES (4, '1005', '李明', '10003', '南京南京', '2023/05/26', '35');


INSERT INTO `buy` VALUES (5, '1007', '赵六', '10003', '盗梦空间', '2024/06/02', '45');
INSERT INTO `buy` VALUES (6, '1008', '钱七', '10004', '阿凡达', '2024/06/03', '60');
INSERT INTO `buy` VALUES (7, '1009', '钱七', '10004', '泰坦尼克号', '2024/06/04', '30');
INSERT INTO `buy` VALUES (8, '1010', '孙八', '10005', '哈利波特', '2024/06/05', '40');
INSERT INTO `buy` VALUES (9, '1011', '孙八', '10005', '指环王', '2024/06/06', '55');
INSERT INTO `buy` VALUES (10, '1012', '张三', '10002', '蝙蝠侠', '2024/06/07', '35');
INSERT INTO `buy` VALUES (11, '1005', '李明', '10001', '南京南京', '2024/06/08', '25');
INSERT INTO `buy` VALUES (12, '1005', '张三', '10002', '南京南京', '2024/06/09', '65');
INSERT INTO `buy` VALUES (13, '1001', '赵六', '10003', '三国演义', '2024/06/10', '55');

# 购买库存为0的vcd约束测试
INSERT INTO `buy` VALUES (14, '1016', '赵六', '10003', '雪豹', '2024/06/10', '55');


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
  FOREIGN KEY (`userNo`) REFERENCES customer(`stuno`),
  CHECK (STR_TO_DATE(`jysj`, '%Y/%m/%d') IS NOT NULL),
  CHECK (STR_TO_DATE(`ghsj`, '%Y/%m/%d') IS NOT NULL),
  CHECK (STR_TO_DATE(`ghsj`, '%Y/%m/%d') >= STR_TO_DATE(`jysj`, '%Y/%m/%d'))
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

INSERT INTO `user` VALUES (1, '三国演义', '1001', '张三', '2022/01/04', '2022/01/22', '123123', '10002', 1);
INSERT INTO `user` VALUES (2, '天空之城', '1002', '张三', '2022/01/04', '2022/01/23', '123123', '10002', 1);
INSERT INTO `user` VALUES (3, '三国演义', '1001', '张三', '2022/01/06', '2022/01/20', '', '10002', 0);
INSERT INTO `user` VALUES (4, '三国演义', '1001', '张三', '2022/01/06', '2022/01/22', '', '10002', 0);
INSERT INTO `user` VALUES (5, '三国演义', '1001', '张三', '2022/01/06', '2022/01/28', '', '10002', 0);
INSERT INTO `user` VALUES (6, '天空之城', '1002', '李明', '2024/05/24', '2024/06/09', '123', '10001', 0);
INSERT INTO `user` VALUES (7, '天空之城', '1002', '李明', '2024/05/24', '2024/05/25', '1', '10001', 0);

INSERT INTO user VALUES (8, '老人与海', '1003', '张三', '2024/06/01', '2024/06/10', '35', '10002', 0);
INSERT INTO user VALUES (9, '三国演义', '1001', '赵六', '2024/06/02', '2024/06/11', '45', '10003', 1);
INSERT INTO user VALUES (10, '南京南京', '1005', '钱七', '2024/06/03', '2024/06/12', '50', '10004', 0);
INSERT INTO user VALUES (11, '星际穿越', '1006', '孙八', '2024/06/04', '2024/06/13', '55', '10005', 0);
INSERT INTO user VALUES (12, '盗梦空间', '1007', '李明', '2024/06/05', '2024/06/14', '60', '10001', 0);
INSERT INTO user VALUES (13, '阿凡达', '1008', '张三', '2024/06/06', '2024/06/15', '65', '10002', 0);
INSERT INTO user VALUES (14, '泰坦尼克号', '1009', '赵六', '2024/06/07', '2024/06/16', '70', '10003', 0);
INSERT INTO user VALUES (15, '哈利波特', '1010', '钱七', '2024/06/08', '2024/06/17', '75', '10004', 0);
INSERT INTO user VALUES (16, '指环王', '1011', '孙八', '2024/06/09', '2024/06/18', '80', '10005', 1);
INSERT INTO user VALUES (17, '蝙蝠侠', '1012', '李明', '2024/06/10', '2024/06/19', '85', '10001', 0);
INSERT INTO user VALUES (18, '蜘蛛侠', '1013', '张三', '2024/06/11', '2024/06/20', '90', '10002', 0);

# 借入库存为0的vcd约束测试
INSERT INTO user VALUES (19, '雪豹', '1016', '张三', '2024/06/11', '2024/06/20', '90', '10002', 0);



# 视图查询各类VCD的库存情况
CREATE VIEW vcd_stock_summary AS
SELECT
    profile AS vcd_type,
    SUM(stock) AS total_stock
FROM
    vcd
GROUP BY
    profile;

-- 查询视图
SELECT * FROM vcd_stock_summary;





# 购买过程的触发器：1.库存小于0检测 2.购买库存-1
drop trigger vcd_before_buy;

CREATE TRIGGER vcd_before_buy
    BEFORE INSERT ON buy
    FOR EACH ROW
BEGIN
    DECLARE stock INT;
    SELECT vcd.stock INTO stock
    FROM vcd
    WHERE vcd.vcdNo = NEW.vcdNo;

    IF stock = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock is 0, cannot purchase this item.';
    END IF;
END ;



drop trigger vcd_after_buy;

create trigger vcd_after_buy
    after insert on buy
    for each row
begin
    declare new_stock INT;
    select stock into new_stock from vcd where vcdNo = NEW.vcdNo;
    set new_stock = new_stock - 1;
    update vcd set stock = new_stock  where vcdNo = NEW.vcdNo;
end;


# 借入过程的触发器：1.借入时库存检测 2.借入后库存-1
drop trigger check_stock_before_borrow;

CREATE TRIGGER check_stock_before_borrow
    BEFORE INSERT ON `user`
    FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    SELECT stock INTO current_stock FROM vcd WHERE vcdNo = NEW.vcdNo;
    IF current_stock <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock. Borrowing cannot be completed.';
    END IF;
END;

drop trigger vcd_after_user;

create trigger vcd_after_user
    after insert on user
    for each row
begin
    declare new_stock INT;
    select stock into new_stock from vcd where vcdNo = NEW.vcdNo;
    set new_stock = new_stock - 1;
    update vcd set stock = new_stock where vcdNo = NEW.vcdNo;
end;


# 归还过程的触发器：归还库存+1
drop trigger update_stock;

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



# 存储过程

create procedure getVcdSalesCountSummary(IN start_date varchar(255),IN end_date varchar(255))
begin
    select vcdNo, vcdName, count(*) as sales_count, sum(price) as sales_amount
    from buy
    where DATE(STR_TO_DATE(creattime,'%Y/%m/%d')) between STR_TO_DATE(start_date,'%Y/%m/%d') AND STR_TO_DATE(end_date, '%Y/%m/%d')
    group by vcdNo, vcdName;
end;

CREATE PROCEDURE getVcdBorrowingCountSummary(IN start_date VARCHAR(255), IN end_date VARCHAR(255))
BEGIN
    SELECT
        vcdNo,
        vcdName,
        COUNT(*) AS borrowing_count,
        SUM(CASE WHEN flag = 1 AND STR_TO_DATE(ghsj, '%Y/%m/%d') < STR_TO_DATE(end_date, '%Y/%m/%d') THEN 1 ELSE 0 END) AS return_count
    FROM
        `user`
    WHERE
        DATE(STR_TO_DATE(jysj, '%Y/%m/%d')) BETWEEN STR_TO_DATE(start_date, '%Y/%m/%d') AND STR_TO_DATE(end_date, '%Y/%m/%d')
    GROUP BY
        vcdNo,
        vcdName;
END;

drop procedure getVcdBorrowingCountSummary;
drop procedure getVcdSalesCountSummary;

call getVcdBorrowingCountSummary('2022/01/04','2024/06/30');


