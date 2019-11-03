/*
 Navicat Premium Data Transfer

 Source Server         : django_test
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : alldb

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 06/06/2019 15:12:52
*/
DROP database IF EXISTS `alldb`;
create database `alldb` default character set utf8 collate utf8_general_ci;
-- 切换到test_data数据库
use alldb;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_account
-- ----------------------------
DROP TABLE IF EXISTS `account_account`;
CREATE TABLE `account_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `register_time` datetime(6) NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `avator_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_account
-- ----------------------------
INSERT INTO `account_account` VALUES (1, 'pbkdf2_sha256$150000$e4m1x1w8clTn$IS/RGiNQx9viF57knBcXvuYeP+RwRElo2frYHLxiC0w=', '2019-05-31 02:26:33.506257', 1, '', '', '', 1, 1, '2019-05-31 02:25:54.469331', 'haha', '18742528693', '2019-05-31 02:25:54.578269', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (2, '123456', NULL, 0, '', '', '', 0, 1, '2019-05-31 02:32:16.000000', '16110100122', '1222222', '2019-05-31 02:33:31.041701', '哈哈', NULL, '2019-05-01', NULL);
INSERT INTO `account_account` VALUES (3, '!kY6uREYalMIjuIbxb0B3HnbpojherDsexrIhcX6n', NULL, 0, '', '', '11112222', 0, 1, '2019-05-31 03:07:25.847087', 'hahaha', NULL, '2019-05-31 03:07:25.848087', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (4, '!09VdXJ4vkCHuDnQt7pHPTFRWym7AuEcPfSXXRaHb', NULL, 0, '', '', '111111', 0, 1, '2019-05-31 03:22:05.328860', 'afyapu@163.com', NULL, '2019-05-31 03:22:05.329859', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (5, '!MA1K4Tzbqjzh22mTpUTFhzkJoaSFLxYwWQ2gZZse', NULL, 0, '', '', 'ssssssss', 0, 1, '2019-05-31 03:22:56.269282', 'afyapu@163.coms', NULL, '2019-05-31 03:22:56.270299', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (6, '!cFCqVOgMiA591c1QEa5b601MbHBUWBBj66R15seN', NULL, 0, '', '', '22222222', 0, 1, '2019-05-31 12:14:13.883506', '123456', NULL, '2019-05-31 12:14:13.883506', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (7, '!ezl6rLYp8mcqMpPW4VT6vtpn17S2bgIuFSXflYdA', NULL, 0, '', '', '88888888', 0, 1, '2019-05-31 12:15:20.559418', '1234566', NULL, '2019-05-31 12:15:20.560417', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (8, '!bpTX80kgfNXLftuafbodvxvt605xzjtuXewb49yz', NULL, 0, '', '', '123456', 0, 1, '2019-05-31 12:30:41.817816', '161101001222', NULL, '2019-05-31 12:30:41.818823', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (9, '!kW3FUQcB8EOdRcF8vafs8FN4OhJqECdfG5jnZixu', NULL, 0, '', '', '111111', 0, 1, '2019-05-31 12:31:15.918661', '1611010012225', NULL, '2019-05-31 12:31:15.920666', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (10, '!StlvyZyIwvXOwXm4tOKHtSXSLG4nKcQHPjxMnkK2', NULL, 0, '', '', '159875', 0, 1, '2019-05-31 14:56:48.321112', '12hahk', NULL, '2019-05-31 14:56:48.322111', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (11, '!QB7JKxEb1SCYfvOhhI7fqJZZSwCZeWTi8eehroZm', NULL, 0, '', '', 'fsdfsd', 0, 1, '2019-05-31 15:03:43.313791', 'asdfsdf', NULL, '2019-05-31 15:03:43.315790', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (12, '!e2XGpwCqxYswmgbuZXCHmWKGwzTLMm3bAxGln2lY', NULL, 0, '', '', '12345678', 0, 1, '2019-05-31 15:05:56.706496', '123', NULL, '2019-05-31 15:05:56.707494', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (13, 'pbkdf2_sha256$150000$J7p0ClpmC4mv$hd6BELOBZKkX26zfX+k9ZL6ppEBtaFi1i8RQszf8qB8=', NULL, 0, '', '', 'afyapu@163.coms', 0, 1, '2019-06-01 02:02:37.114413', 'ssf', '55555sfs', '2019-06-01 02:02:37.289485', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (14, 'pbkdf2_sha256$150000$fKpvGAwMrfYR$oixT8wPMb4PiMZNxDvNxp/D1Z19oxsxZNhe2EZDt7LU=', NULL, 0, '', '', 'afyapu@163.comss', 0, 1, '2019-06-01 02:03:24.816252', 'ssfs', '555s55sfs', '2019-06-01 02:03:24.945181', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (15, 'pbkdf2_sha256$150000$3YuGQzhpDJXY$hThU9DMGuUjzp0TH2YCPGrgZ+jKzy3XJlGw6glK29vo=', NULL, 0, '', '', 'afyypp@163.com', 0, 1, '2019-06-01 02:03:49.396991', '12hhk', '18742528639', '2019-06-01 02:03:49.513924', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (16, 'pbkdf2_sha256$150000$lKIgl5w0ur8B$0vwQVXu824B2GfMLITkpdrG/EN7rKG4ewweI4Jjijbg=', NULL, 0, '', '', 'afyypp@163.com', 0, 1, '2019-06-01 02:04:04.456924', '12haahks', '18742528639', '2019-06-01 02:04:04.580850', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (17, 'pbkdf2_sha256$150000$tCfI8kMkms6a$eFK89WWkAmBAGdQZguu/D99rVm+u7qCna6RdnIUP6iY=', NULL, 0, '', '', 'afyypp@163.com', 0, 1, '2019-06-01 02:08:55.929402', '12hahskaf', '18742528639', '2019-06-01 02:08:56.068321', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (18, 'pbkdf2_sha256$150000$JuSXAl6suRbn$ahGZQssdb1uZQAk5bcHrOJGfBjxVlxqaqnNvMELIXyQ=', NULL, 0, '', '', 'afyypp@163.com', 0, 1, '2019-06-02 02:18:00.320571', '12h', '18742528639', '2019-06-02 02:18:00.415517', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (19, 'pbkdf2_sha256$150000$tKGdgThFiEmj$dUcyf2XC0C7BNlwkhRqZp3KXsQyDvUQcpqGYIt1gvFA=', NULL, 0, '', '', '15@163.com', 0, 1, '2019-06-03 03:23:16.056598', '159', '18698630336', '2019-06-03 03:23:16.185541', NULL, NULL, NULL, NULL);
INSERT INTO `account_account` VALUES (20, 'pbkdf2_sha256$150000$gnv9X0wk0kbe$Lh7xIIuEXLUIMT+1ps4g4JAkm6VG4O6rBl7mrEsG3fI=', NULL, 0, '', '', 'afyypp@163.cn', 0, 1, '2019-06-03 03:27:01.625606', '12hahdk', '18742528638', '2019-06-03 03:27:01.790509', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for account_account_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_account_groups`;
CREATE TABLE `account_account_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_account_groups_account_id_group_id_33a11f43_uniq`(`account_id`, `group_id`) USING BTREE,
  INDEX `account_account_groups_group_id_31ca8e7b_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `account_account_groups_account_id_7aa27e9f_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_account_groups_group_id_31ca8e7b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_account_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_account_user_permissions`;
CREATE TABLE `account_account_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_account_user_per_account_id_permission_id_fa4fbca7_uniq`(`account_id`, `permission_id`) USING BTREE,
  INDEX `account_account_user_permission_id_e6a453ba_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `account_account_user_account_id_8c2c4a68_fk_account_a` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_account_user_permission_id_e6a453ba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for answer_answer
-- ----------------------------
DROP TABLE IF EXISTS `answer_answer`;
CREATE TABLE `answer_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer_content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `browse_count` int(11) NOT NULL,
  `like_count` int(11) NOT NULL,
  `collect_count` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aid`(`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer_answer
-- ----------------------------
INSERT INTO `answer_answer` VALUES (1, '10000000', '10000000', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2019-06-01 16:00:48.070326', '12', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (2, '1000000', '10000000', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈jfkslajfl', '2019-06-01 16:01:02.843052', '1', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (3, '100000', '10000001', '哈哈哈哈哈哈哈哈哈哈哈哈哈fsdfs哈哈哈哈哈哈jfkslajfl', '2019-06-01 16:01:21.092172', '5', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (4, '1000001', '61201321', '周日到周四十点半就断了，周五周六十一点，顺便说一下，断网的话是十二点', '2019-06-02 11:04:29.167999', '4', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (5, '1000002', '61201321', '放假也是周日到周四十点半就断了，周五周六十一点', '2019-06-02 11:05:46.167115', '3', 0, 2, 0, 0);
INSERT INTO `answer_answer` VALUES (6, '1000003', '88792628', 'step 1:怒学 C语言，C primer plus。C和指针，C专家编程，Linux程序设计。一定要在Linux下学习。step 2:数据结构，刚开始很多同学基础不好，看不下午，逻辑思维跟不上，当初我也一样，没关系，看大话数据结构，先看思路，思路看懂后，又c语言写，不会写GitHub去搜，把代码弄明白，之后去刷题，杭电的 北大的都可以，或者直接去做 lintcode 上的，直击面试。step 3:    这时候 你就要看计算机网络了，可以看谢希仁的计算机网络，图解http tcp/ip 详解1。之后要动手实验 用winshark 。step 4:   mysql，  linux 程序设计。liunx 高性能服务器编程。好好理解操作系统。step 5: 进阶：  计算机的构造和解释。深入理解计算机系统。  ok 这些基础打牢 ，其他的再学什么 就看自己了，可与学什么py java c++，php 等等 。  到了大四，刷题吧，见牛客网大厂面试真题。', '2019-06-02 11:11:32.309281', '3', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (7, '1000004', '88792628', '1.首先，买一台计算机。比如，http://item.jd.com/1555039.html2.选择一种语言去学习比如，C语言3.下载该语言的开发环境比如 Dev-C++ download4.学习该语言的语法。一个简单的资料来源是维基百科，通常会含有语言的语法介绍。比如  C语言5.写出第一个程序。比如： 输出 hello world.这是非常重要的一部，这一步可以让你加深对编程语言的掌握，以及对编译环境的熟练。通常来说，当你可以用C语言输出hello world的时候。代表你已经入门了。不要着急。。慢慢来。6 写很多程序。推荐找一些练习网站练习，比如 OpenJudge - 百练慢慢来，做一千道题就差不多可以了。7 学一些别的语言个人推荐： C++ Java, Javascript, Common Lisp, Haskell8 学会设计模式9 学会写文档（可省略）10 学会使用一些库比如：大部分open开头的库。11 学会使用一些常用的平台和软件比如 Android, Xcode, Linux, Arduino , rhino, ros, Flash AS 等等12 学会利用编程赚钱13 学会利用编成的软件持续的为自己赚钱。', '2019-06-02 11:14:25.648335', '5', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (9, '1428459', '10000000', 'fdsfsdfdsffsdfsdfsd', '2019-06-02 14:05:25.368518', '18', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (10, '117333', '123456', '这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答', '2019-06-02 14:06:05.794410', '18', 0, 3, 0, 0);
INSERT INTO `answer_answer` VALUES (11, '9980428', '123456', '这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答', '2019-06-02 14:06:33.908123', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (12, '4673179', '10000001', '这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答', '2019-06-02 14:06:55.418931', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (14, '555322', '10000002', '这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答', '2019-06-02 14:07:23.070471', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (15, '1566257', '10000003', '这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答这是测试回答', '2019-06-02 14:07:31.561931', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (17, '5631866', '123456', 'fdsfsdfsdf', '2019-06-02 14:38:54.625496', '17', 0, 2, 0, 0);
INSERT INTO `answer_answer` VALUES (18, '8912863', '123456', 'hjkhkj', '2019-06-03 03:14:59.169189', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (19, '9926573', '10000000', 'rwafdsafsad', '2019-06-03 03:16:55.062999', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (20, '2551102', '10000000', 'fdsafdsa', '2019-06-03 03:17:04.415707', '17', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (21, '8964196', '10000000', 'fdsafd', '2019-06-03 03:24:42.247739', '19', 0, 0, 0, 0);
INSERT INTO `answer_answer` VALUES (22, '113663', '10000000', 'fdsfsa', '2019-06-03 03:25:02.841939', '19', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for answer_comment
-- ----------------------------
DROP TABLE IF EXISTS `answer_comment`;
CREATE TABLE `answer_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `content` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like_count` int(11) NOT NULL,
  `unlike_count` int(11) NOT NULL,
  `from_uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aid`(`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for answer_like
-- ----------------------------
DROP TABLE IF EXISTS `answer_like`;
CREATE TABLE `answer_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aid`(`aid`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add book', 6, 'add_book');
INSERT INTO `auth_permission` VALUES (22, 'Can change book', 6, 'change_book');
INSERT INTO `auth_permission` VALUES (23, 'Can delete book', 6, 'delete_book');
INSERT INTO `auth_permission` VALUES (24, 'Can view book', 6, 'view_book');
INSERT INTO `auth_permission` VALUES (25, 'Can add follow', 7, 'add_follow');
INSERT INTO `auth_permission` VALUES (26, 'Can change follow', 7, 'change_follow');
INSERT INTO `auth_permission` VALUES (27, 'Can delete follow', 7, 'delete_follow');
INSERT INTO `auth_permission` VALUES (28, 'Can view follow', 7, 'view_follow');
INSERT INTO `auth_permission` VALUES (29, 'Can add question', 8, 'add_question');
INSERT INTO `auth_permission` VALUES (30, 'Can change question', 8, 'change_question');
INSERT INTO `auth_permission` VALUES (31, 'Can delete question', 8, 'delete_question');
INSERT INTO `auth_permission` VALUES (32, 'Can view question', 8, 'view_question');
INSERT INTO `auth_permission` VALUES (33, 'Can add answer', 9, 'add_answer');
INSERT INTO `auth_permission` VALUES (34, 'Can change answer', 9, 'change_answer');
INSERT INTO `auth_permission` VALUES (35, 'Can delete answer', 9, 'delete_answer');
INSERT INTO `auth_permission` VALUES (36, 'Can view answer', 9, 'view_answer');
INSERT INTO `auth_permission` VALUES (37, 'Can add comment', 10, 'add_comment');
INSERT INTO `auth_permission` VALUES (38, 'Can change comment', 10, 'change_comment');
INSERT INTO `auth_permission` VALUES (39, 'Can delete comment', 10, 'delete_comment');
INSERT INTO `auth_permission` VALUES (40, 'Can view comment', 10, 'view_comment');
INSERT INTO `auth_permission` VALUES (41, 'Can add like', 11, 'add_like');
INSERT INTO `auth_permission` VALUES (42, 'Can change like', 11, 'change_like');
INSERT INTO `auth_permission` VALUES (43, 'Can delete like', 11, 'delete_like');
INSERT INTO `auth_permission` VALUES (44, 'Can view like', 11, 'view_like');
INSERT INTO `auth_permission` VALUES (45, 'Can add user', 12, 'add_account');
INSERT INTO `auth_permission` VALUES (46, 'Can change user', 12, 'change_account');
INSERT INTO `auth_permission` VALUES (47, 'Can delete user', 12, 'delete_account');
INSERT INTO `auth_permission` VALUES (48, 'Can view user', 12, 'view_account');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$jwzh9mANltdC$XVb4MMAITl/rJMamLmmWZPTm88kdYM81QJf+xvX14Pg=', '2019-05-27 13:04:54.258297', 1, 'haha', '', '', 'afyapu@163.com', 1, 1, '2019-05-27 13:04:17.923187');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_account_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-05-31 02:29:30.033571', '1', 'haha', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-05-31 02:29:33.425016', '2', 'aaa', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-05-31 02:29:36.408424', '3', 'dfsdf', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-05-31 02:33:31.051677', '2', '<Account # 2,16110100122>', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-06-01 09:28:07.529818', '1', 'Question object (1)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-06-02 10:39:58.071677', '3', 'Question object (3)', 2, '[{\"changed\": {\"fields\": [\"uid\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-06-02 10:40:02.457336', '1', 'Question object (1)', 2, '[{\"changed\": {\"fields\": [\"uid\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-06-02 10:40:08.215478', '2', 'Question object (2)', 2, '[{\"changed\": {\"fields\": [\"uid\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-06-02 10:45:33.574492', '1', 'Answer object (1)', 2, '[{\"changed\": {\"fields\": [\"uid\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-06-02 10:46:12.948392', '2', 'Answer object (2)', 2, '[{\"changed\": {\"fields\": [\"uid\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-06-02 11:00:57.054911', '8', 'Question object (8)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"uid\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-06-02 11:10:03.806884', '7', 'Question object (7)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"uid\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-06-02 11:15:12.357824', '7', 'Answer object (7)', 2, '[{\"changed\": {\"fields\": [\"answer_content\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-06-02 14:08:37.870186', '16', 'Answer object (16)', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-06-02 14:09:04.459475', '13', 'Answer object (13)', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-06-02 14:11:06.810184', '8', 'Answer object (8)', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-06-02 14:12:47.917877', '6', 'Question object (6)', 2, '[{\"changed\": {\"fields\": [\"question_content\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-06-02 14:13:28.129861', '2', 'Question object (2)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"question_describe\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2019-06-02 14:13:46.623696', '3', 'Question object (3)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"question_describe\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2019-06-02 14:14:04.477594', '4', 'Question object (4)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"question_describe\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2019-06-02 14:14:23.259581', '5', 'Question object (5)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"question_describe\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2019-06-02 14:14:36.169529', '6', 'Question object (6)', 2, '[{\"changed\": {\"fields\": [\"question_content\", \"question_describe\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2019-06-03 00:24:26.209795', '17', 'Answer object (17)', 2, '[{\"changed\": {\"fields\": [\"like_count\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (24, '2019-06-03 00:24:34.102090', '10', 'Answer object (10)', 2, '[{\"changed\": {\"fields\": [\"like_count\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (25, '2019-06-03 00:24:40.458168', '5', 'Answer object (5)', 2, '[{\"changed\": {\"fields\": [\"like_count\"]}}]', 9, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (12, 'account', 'account');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (9, 'answer', 'answer');
INSERT INTO `django_content_type` VALUES (10, 'answer', 'comment');
INSERT INTO `django_content_type` VALUES (11, 'answer', 'like');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'index', 'book');
INSERT INTO `django_content_type` VALUES (7, 'question', 'follow');
INSERT INTO `django_content_type` VALUES (8, 'question', 'question');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-05-31 02:20:29.438618');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-05-31 02:20:29.564546');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-05-31 02:20:29.673484');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-05-31 02:20:30.027281');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-05-31 02:20:30.041277');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-05-31 02:20:30.059265');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-05-31 02:20:30.086249');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-05-31 02:20:30.096243');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-05-31 02:20:30.119229');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-05-31 02:20:30.139219');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2019-05-31 02:20:30.157209');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2019-05-31 02:20:30.249155');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2019-05-31 02:20:30.261148');
INSERT INTO `django_migrations` VALUES (14, 'account', '0001_initial', '2019-05-31 02:20:30.390074');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2019-05-31 02:20:30.759863');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0002_logentry_remove_auto_add', '2019-05-31 02:20:30.919811');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0003_logentry_add_action_flag_choices', '2019-05-31 02:20:30.941759');
INSERT INTO `django_migrations` VALUES (19, 'index', '0001_initial', '2019-05-31 02:20:31.124656');
INSERT INTO `django_migrations` VALUES (20, 'question', '0001_initial', '2019-05-31 02:20:31.215603');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2019-05-31 02:20:31.248584');
INSERT INTO `django_migrations` VALUES (22, 'answer', '0001_initial', '2019-06-01 15:59:41.454726');
INSERT INTO `django_migrations` VALUES (23, 'question', '0002_auto_20190602_1237', '2019-06-02 04:37:44.586670');
INSERT INTO `django_migrations` VALUES (24, 'answer', '0002_answer_comment_count', '2019-06-02 10:05:51.727800');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ky51dhsvt38msdffk313rvesgxtlourx', 'NmRmZTU2OWE2ZmJkMDkwZGZlOWZhZmViMmU3YjFlMGRlMTgxNjkyYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNDQyMTdmNjhlZWVkMTE1MTViOWIwNWM1YjI3NTYzN2U2NmI1ODQ0In0=', '2019-06-14 02:26:33.512254');

-- ----------------------------
-- Table structure for index_book
-- ----------------------------
DROP TABLE IF EXISTS `index_book`;
CREATE TABLE `index_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_book
-- ----------------------------
INSERT INTO `index_book` VALUES (1, 'haha', '2019-05-31 02:29:30.032566');
INSERT INTO `index_book` VALUES (2, 'aaa', '2019-05-31 02:29:33.424023');
INSERT INTO `index_book` VALUES (3, 'dfsdf', '2019-05-31 02:29:36.407435');

-- ----------------------------
-- Table structure for question_follow
-- ----------------------------
DROP TABLE IF EXISTS `question_follow`;
CREATE TABLE `question_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `qid`(`qid`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_question
-- ----------------------------
DROP TABLE IF EXISTS `question_question`;
CREATE TABLE `question_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_content` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `question_describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attend_count` int(11) NOT NULL,
  `browse_count` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `qid`(`qid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_question
-- ----------------------------
INSERT INTO `question_question` VALUES (1, '123456', '毕业论文答辩的前一天晚上能睡着吗？', '2019-06-01 09:28:07.523800', '睡不着睡不着 一想到还有七个小时就要答辩了更睡不着了啊 心里明明不紧张 大脑为何这么清醒 该睡觉了啊宝贝', '12333', '1', 0, 0);
INSERT INTO `question_question` VALUES (2, '10000000', '这是测试问题2？', '2019-06-01 14:16:07.700455', '这是测试描述2', '12333', '1', 0, 0);
INSERT INTO `question_question` VALUES (3, '10000001', '这是测试问题3？', '2019-06-01 14:16:29.162250', '这是测试描述3', '12333', '1', 0, 0);
INSERT INTO `question_question` VALUES (4, '10000002', '这是测试问题4？', '2019-06-02 02:52:06.624522', '这是测试描述4', '1,2,3', '5', 0, 0);
INSERT INTO `question_question` VALUES (5, '10000003', '这是测试问题5？', '2019-06-02 04:23:29.764493', '这是测试描述5', '12333', '18', 0, 0);
INSERT INTO `question_question` VALUES (6, '68182430', '这是测试问题6?', '2019-06-02 04:36:12.468872', 'fjskdljfa;fafafafafaf;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;af;afa', '13', '18', 0, 0);
INSERT INTO `question_question` VALUES (7, '88792628', '计算机这个专业怎么学习?', '2019-06-02 04:38:44.934376', NULL, '13', '1', 0, 0);
INSERT INTO `question_question` VALUES (8, '61201321', '晚上几点断电?', '2019-06-02 04:39:03.333280', NULL, '13', '3', 0, 0);
INSERT INTO `question_question` VALUES (9, '45227211', 'sdfdsfds?', '2019-06-03 03:16:29.608928', '', '13', '17', 0, 0);
INSERT INTO `question_question` VALUES (10, '33773074', 'hhhhhhhhhhhhh?', '2019-06-03 03:24:25.397575', '', '13', '19', 0, 0);
INSERT INTO `question_question` VALUES (11, '87817626', '777?', '2019-06-03 03:25:16.440309', '', '13', '19', 0, 0);
INSERT INTO `question_question` VALUES (12, '3231633', '777?', '2019-06-03 03:25:24.515923', '', '13', '19', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
