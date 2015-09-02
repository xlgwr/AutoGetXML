/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50626
Source Host           : 127.0.0.1:3306
Source Database       : whs

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-09-02 13:12:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_classinfo
-- ----------------------------
DROP TABLE IF EXISTS `m_classinfo`;
CREATE TABLE `m_classinfo` (
  `cls_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `cls_typno` int(4) NOT NULL,
  `infoval` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `infoval2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infoval3` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(16) NOT NULL,
  `status` smallint(6) NOT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`cls_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_classinfo
-- ----------------------------

-- ----------------------------
-- Table structure for m_depot
-- ----------------------------
DROP TABLE IF EXISTS `m_depot`;
CREATE TABLE `m_depot` (
  `depot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `depot_nm` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`depot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_depot
-- ----------------------------

-- ----------------------------
-- Table structure for m_parameter
-- ----------------------------
DROP TABLE IF EXISTS `m_parameter`;
CREATE TABLE `m_parameter` (
  `paramkey` varchar(16) NOT NULL,
  `paramvalue` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `paramtype` smallint(6) DEFAULT NULL,
  `adduser` varchar(16) DEFAULT NULL,
  `upduser` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  `org_no` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`paramkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_parameter
-- ----------------------------
INSERT INTO `m_parameter` VALUES ('autoGetXMLMin', '5', '每N分钟获取接口xml', '0', 'xlg', 'xlg', '2015-09-01 11:13:59', '2015-09-01 11:14:03', 'admin');

-- ----------------------------
-- Table structure for m_roledetail
-- ----------------------------
DROP TABLE IF EXISTS `m_roledetail`;
CREATE TABLE `m_roledetail` (
  `role_id` varchar(32) NOT NULL COMMENT '自动生成',
  `mod_id` varchar(16) NOT NULL,
  `opr_code` smallint(6) NOT NULL COMMENT '0:新增 1:修改 2:删除 3:查询 4：审核 5：反审核 6：导入 7：导出',
  PRIMARY KEY (`role_id`,`mod_id`,`opr_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_roledetail
-- ----------------------------

-- ----------------------------
-- Table structure for m_roles
-- ----------------------------
DROP TABLE IF EXISTS `m_roles`;
CREATE TABLE `m_roles` (
  `role_id` varchar(32) NOT NULL COMMENT '自动生成',
  `role_nm` varchar(32) NOT NULL,
  `depot_no` varchar(16) NOT NULL,
  `remark` varchar(256) DEFAULT NULL COMMENT '画面输入最大200位',
  `status` smallint(6) NOT NULL COMMENT '默认1:可用 0:不可用',
  `adduser` varchar(16) DEFAULT NULL,
  `upduser` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL COMMENT 'YYYY/MM/dd HH:mm:ss',
  `updtime` datetime DEFAULT NULL COMMENT 'YYYY/MM/dd HH:mm:ss',
  `org_no` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_roles
-- ----------------------------

-- ----------------------------
-- Table structure for m_sysmodule
-- ----------------------------
DROP TABLE IF EXISTS `m_sysmodule`;
CREATE TABLE `m_sysmodule` (
  `mod_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `mod_nm` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parentid` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `iconic` int(16) NOT NULL,
  `islast` int(16) NOT NULL,
  `version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_sysmodule
-- ----------------------------

-- ----------------------------
-- Table structure for m_sysmoduledetail
-- ----------------------------
DROP TABLE IF EXISTS `m_sysmoduledetail`;
CREATE TABLE `m_sysmoduledetail` (
  `mod_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `opr_code` smallint(6) NOT NULL,
  `sort` int(16) NOT NULL,
  `status` smallint(6) NOT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`mod_id`,`opr_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_sysmoduledetail
-- ----------------------------

-- ----------------------------
-- Table structure for m_users
-- ----------------------------
DROP TABLE IF EXISTS `m_users`;
CREATE TABLE `m_users` (
  `user_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `user_nm` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `depot_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `user_pwd` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  `org_no` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_users
-- ----------------------------

-- ----------------------------
-- Table structure for t_interface
-- ----------------------------
DROP TABLE IF EXISTS `t_interface`;
CREATE TABLE `t_interface` (
  `recd_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(128) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `downtime` varchar(16) DEFAULT NULL,
  `downtype` int(11) DEFAULT NULL,
  `adjunct_address` varchar(128) DEFAULT NULL,
  `adjunct_value` varchar(128) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`recd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_interface
-- ----------------------------
INSERT INTO `t_interface` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for t_syslogrecd
-- ----------------------------
DROP TABLE IF EXISTS `t_syslogrecd`;
CREATE TABLE `t_syslogrecd` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(32) DEFAULT NULL,
  `message` varchar(32) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `result` smallint(6) DEFAULT NULL,
  `mod_id` varchar(8) NOT NULL,
  `adduser` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `org_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`,`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_syslogrecd
-- ----------------------------
