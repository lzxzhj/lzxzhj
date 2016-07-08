/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-08 21:23:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` varchar(30) NOT NULL COMMENT '文章ID',
  `title` varchar(60) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `viewnum` int(9) DEFAULT '0' COMMENT '阅读数',
  `commentnum` int(4) DEFAULT '0' COMMENT '评论数',
  `userid` varchar(30) NOT NULL COMMENT '所属用户ID',
  `a_cate_id` varchar(20) DEFAULT NULL COMMENT '所属文章分类ID',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `a_cate_id` varchar(20) NOT NULL COMMENT '用户分类ID',
  `a_cate_name` varchar(60) NOT NULL COMMENT '用户分类名称',
  `userid` varchar(30) NOT NULL COMMENT '所属用户ID',
  PRIMARY KEY (`a_cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_remarks
-- ----------------------------
DROP TABLE IF EXISTS `article_remarks`;
CREATE TABLE `article_remarks` (
  `remarkid` varchar(30) NOT NULL COMMENT '评论ID',
  `remarkcotent` varchar(500) NOT NULL COMMENT '评论内容',
  `aid` varchar(30) NOT NULL COMMENT '评论人的文章ID',
  `userid` varchar(30) NOT NULL COMMENT '评论者ID',
  PRIMARY KEY (`remarkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `att_id` varchar(30) NOT NULL COMMENT '附件ID',
  `att_addr` varchar(500) NOT NULL COMMENT '附件地址',
  `aid` varchar(30) NOT NULL COMMENT '附件所属文章ID',
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `code_id` varchar(30) NOT NULL COMMENT '代码ID',
  `code_content` text NOT NULL COMMENT '代码内容',
  `aid` varchar(30) NOT NULL COMMENT '代码所属文章ID',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gloal_category
-- ----------------------------
DROP TABLE IF EXISTS `gloal_category`;
CREATE TABLE `gloal_category` (
  `g_cate_id` varchar(5) NOT NULL COMMENT '全局分类ID',
  `g_cate_name` varchar(30) DEFAULT NULL COMMENT '全局分类名称',
  `g_cate_remaks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`g_cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for image_addr
-- ----------------------------
DROP TABLE IF EXISTS `image_addr`;
CREATE TABLE `image_addr` (
  `image_id` varchar(30) NOT NULL COMMENT '图片ID',
  `image_addr` varchar(500) NOT NULL COMMENT '图片地址',
  `aid` varchar(30) NOT NULL COMMENT '图片所属文章ID',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(30) NOT NULL COMMENT '用户ID',
  `username` varchar(40) NOT NULL COMMENT '用户登录名',
  `password` varchar(30) NOT NULL COMMENT '密码',
  `nickname` varchar(60) NOT NULL COMMENT '昵称',
  `description` varchar(200) DEFAULT NULL COMMENT '博客描述',
  `gender` varchar(1) DEFAULT '1' COMMENT '性别',
  `email` varchar(100) NOT NULL COMMENT '邮件地址',
  `headpic` varchar(100) DEFAULT NULL COMMENT '头像图片地址',
  `regtime` datetime DEFAULT NULL COMMENT '注册时间',
  `status` varchar(2) DEFAULT NULL COMMENT '用户状态 1：正常，0：未激活，-1：已注销',
  `activittime` datetime DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `UK_USERNAME` (`username`) COMMENT '用户名必须唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
