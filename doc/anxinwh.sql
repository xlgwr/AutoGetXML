/*
Navicat MySQL Data Transfer

Source Server         : anxinwh
Source Server Version : 50611
Source Host           : 192.168.1.7:3306
Source Database       : anxinwh

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2015-09-11 15:26:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_checkpoint
-- ----------------------------
DROP TABLE IF EXISTS `m_checkpoint`;
CREATE TABLE `m_checkpoint` (
  `CheckPointNo` varchar(32) CHARACTER SET utf8 NOT NULL,
  `CheckTime` datetime DEFAULT NULL,
  `Remark` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `AddDateTime` datetime DEFAULT NULL,
  `UpdUserNo` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `UpdDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CheckPointNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of m_checkpoint
-- ----------------------------
INSERT INTO `m_checkpoint` VALUES ('01', '2015-09-06 19:39:10', null, null, null, null);
INSERT INTO `m_checkpoint` VALUES ('02', '2015-09-06 19:37:19', null, null, null, null);

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
INSERT INTO `m_classinfo` VALUES ('11111', '1', '11111111111', '222222222', '3333333333', '1', '1', null, '', '2015-09-07 16:21:01', null);
INSERT INTO `m_classinfo` VALUES ('222', '1', '22222', '2', '2', '2', '0', null, '', '2015-09-07 17:03:59', null);

-- ----------------------------
-- Table structure for m_depot
-- ----------------------------
DROP TABLE IF EXISTS `m_depot`;
CREATE TABLE `m_depot` (
  `depot_no` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `depot_nm` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`depot_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_depot
-- ----------------------------
INSERT INTO `m_depot` VALUES ('11111111', 'eeeeeeeeeee', '11111111', '1', null, '', null, '2015-09-07 14:31:47');
INSERT INTO `m_depot` VALUES ('22222222', '2222', '2222222222', '1', null, '', null, '2015-09-07 14:51:51');
INSERT INTO `m_depot` VALUES ('26562999', '石岩仓库001', '测试仓库 误删', '0', null, null, null, null);

-- ----------------------------
-- Table structure for m_devicemodel
-- ----------------------------
DROP TABLE IF EXISTS `m_devicemodel`;
CREATE TABLE `m_devicemodel` (
  `ModelNo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `ModelName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ModelFlag` int(11) NOT NULL COMMENT '0：无源信号采集(默认)； 1：有源信号采集',
  `PararmNm1` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm2` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm3` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm4` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm5` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm6` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm7` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm8` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm9` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm10` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm11` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm12` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm13` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm14` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm15` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm16` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm17` varchar(16) CHARACTER SET utf8 NOT NULL,
  `PararmNm18` varchar(16) CHARACTER SET utf8 NOT NULL,
  `ModelRemark` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `AddDateTime` datetime DEFAULT NULL,
  `UpdDateTime` datetime DEFAULT NULL,
  `UpdUserNo` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ModelNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of m_devicemodel
-- ----------------------------
INSERT INTO `m_devicemodel` VALUES ('200', '有源设备(COM)', '1', '信号增益', '通信地址', '波特率/接收端口', '外部触发延时', '继电器闭合时间', '蜂鸣时间', '触发读方式', '同张标签间隔', '设备上传间隔', '备用参数10', '备用参数11', '备用参数12', '备用参数13', '备用参数14', '备用参数15', '备用参数16', '执行间隔 (s)', '更新标志 (0/1)', '', '2012-07-04 17:39:48', '2012-07-27 16:07:28', 'admin');
INSERT INTO `m_devicemodel` VALUES ('201', '有源设备(UDP)', '1', '通信地址', '设备端口', '服务器端口', '备用参数4', '备用参数5', '备用参数6', '备用参数7', '备用参数8', '备用参数9', '备用参数10', '备用参数11', '备用参数12', '备用参数13', '备用参数14', '备用参数15', '备用参数16', '执行间隔 (s)', '更新标志 (0/1)', '', '2012-08-09 09:35:54', '2012-08-09 09:36:08', 'admin');
INSERT INTO `m_devicemodel` VALUES ('300', '有源设备(COM/TCP)', '1', '备用参数1', '备用参数2', '波特率/接收端口', '接收增益修改', '发送功率修改', '衰减器功率修改', '接收增益值', '发送功率值', '衰减器功率值', '备用参数10', '备用参数11', '备用参数12', '备用参数13', '备用参数14', '备用参数15', '备用参数16', '执行间隔 (s)', '更新标志 (0/1)', null, '2012-08-17 18:53:47', '2012-08-17 18:53:52', 'admin');
INSERT INTO `m_devicemodel` VALUES ('400', '无源设备(COM/TCP)', '0', '端口号', '启用天线', '信号增益', '信号类型', '设备参数', '备用参数6', '备用参数7', '备用参数8', '备用参数9', '备用参数10', '备用参数11', '备用参数12', '备用参数13', '备用参数14', '备用参数15', '备用参数16', '执行间隔 (s)', '更新标志 (0/1)', null, '2015-09-06 16:54:30', '2015-09-06 16:54:34', 'admin');

-- ----------------------------
-- Table structure for m_devicerelation
-- ----------------------------
DROP TABLE IF EXISTS `m_devicerelation`;
CREATE TABLE `m_devicerelation` (
  `RelationNo` varchar(32) CHARACTER SET utf8 NOT NULL,
  `TerminalNo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `Relation1` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation2` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation3` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation4` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation5` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation6` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation7` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Relation8` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`RelationNo`,`TerminalNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of m_devicerelation
-- ----------------------------
INSERT INTO `m_devicerelation` VALUES ('24A3D84D53D6493AABFC478E1B9E963F', '5', '1', '512', '', '', null, null, null, null);
INSERT INTO `m_devicerelation` VALUES ('74636BE18884434198707C6B2E7E2D37', '2', '1', '521', '', '', null, null, null, null);
INSERT INTO `m_devicerelation` VALUES ('E0C273AAA0F04B4B9564A2FC2FBFD5C4', '3', '1', '513', '', '', null, null, null, null);
INSERT INTO `m_devicerelation` VALUES ('EAE5761635E2451EB3548307D227CC8F', '1', '1', '512', '', '', null, null, null, null);

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
  `depot_no` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`paramkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_parameter
-- ----------------------------
INSERT INTO `m_parameter` VALUES ('autoGetXMLMin', '5', '每N分钟获取接口xml', '0', 'xlg', 'xlg', '2015-09-01 11:13:59', '2015-09-01 11:14:03', 'ANXIN01');
INSERT INTO `m_parameter` VALUES ('CheckInterval', '10', '定时点检间隔(秒)', '1', null, null, null, null, 'ANXIN01');
INSERT INTO `m_parameter` VALUES ('HeartInterval', '2000', '设备心跳上传间隔(:毫秒)', '1', null, null, null, null, 'ANXIN01');
INSERT INTO `m_parameter` VALUES ('ReconInterval', '2000', '采集重连间隔(毫秒)', '1', null, null, null, null, 'ANXIN01');
INSERT INTO `m_parameter` VALUES ('RepeatInterval', '5000', '卡重复扫描检测间隔(豪秒)', '1', 'admin', null, '2015-08-07 20:32:44', null, 'ANXIN01');
INSERT INTO `m_parameter` VALUES ('TagUpdInterval', '20', '标签更新检查间隔(秒)', '1', 'admin', null, '2015-08-07 20:33:04', null, 'ANXIN01');
INSERT INTO `m_parameter` VALUES ('TagUpdTime', '20', '标签更新时间	', '1', null, null, null, null, 'ANXIN01');

-- ----------------------------
-- Table structure for m_products
-- ----------------------------
DROP TABLE IF EXISTS `m_products`;
CREATE TABLE `m_products` (
  `prdct_no` varchar(48) NOT NULL,
  `prdct_nm` varchar(32) NOT NULL,
  `prdct_abbr` varchar(255) NOT NULL,
  `depot_no` varchar(255) NOT NULL,
  `prdct_type` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `upduser` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  `adduser` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`prdct_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_products
-- ----------------------------
INSERT INTO `m_products` VALUES ('12', '2', '22', '2', '2', '2', '2', '', '2015-09-10 13:31:49', '2015-09-10 13:32:46', '', '1');
INSERT INTO `m_products` VALUES ('122', '22', '22', '2', '22', '2', '22', null, '2015-09-10 13:32:19', null, '', '1');
INSERT INTO `m_products` VALUES ('1222', '2', '2', '2', '2', '2', '2', null, '2015-09-10 13:32:03', null, '', '1');
INSERT INTO `m_products` VALUES ('2', '2', '2', '2', '2', '2', '2', null, '2015-09-10 13:31:36', null, '', '1');
INSERT INTO `m_products` VALUES ('ss', 's', 'ss', 'ss', 'ss', 'ss', 'sss', null, '2015-09-10 14:52:41', null, '', '1');

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
-- Table structure for m_shelf
-- ----------------------------
DROP TABLE IF EXISTS `m_shelf`;
CREATE TABLE `m_shelf` (
  `shelf_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shelf_nm` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depot_no` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shelf_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(258) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`shelf_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_shelf
-- ----------------------------
INSERT INTO `m_shelf` VALUES ('1', '1', '1', '2', '1', '1', '1', '1', '', '', '2015-09-11 09:51:06', '2015-09-11 09:51:20');
INSERT INTO `m_shelf` VALUES ('SY001', '石岩仓库001', '是', '1', null, null, null, '1', null, null, null, null);

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
-- Table structure for m_terminaldevice
-- ----------------------------
DROP TABLE IF EXISTS `m_terminaldevice`;
CREATE TABLE `m_terminaldevice` (
  `TerminalNo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `ModelNo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `TerminalType` int(32) NOT NULL,
  `TerminalName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `shelf_no` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `ConnectFlag` int(11) NOT NULL COMMENT '0：网口(默认)； 1：串口',
  `SerialNoIPAddr` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `ReadTime` int(11) NOT NULL,
  `ReadInterval` int(11) NOT NULL,
  `ParamVal1` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal2` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal3` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal4` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal5` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal6` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal7` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal8` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal9` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal10` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal11` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal12` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal13` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal14` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal15` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal16` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal17` varchar(32) COLLATE utf8_bin NOT NULL,
  `ParamVal18` varchar(32) COLLATE utf8_bin NOT NULL,
  `TrmnRemark` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `CipherText` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ParamUpdTime` datetime DEFAULT NULL,
  `TrmnUpdTime` datetime DEFAULT NULL,
  `TrmnStatus` bit(1) NOT NULL COMMENT 'True：启用(默认；False：禁用',
  `AddDateTime` datetime DEFAULT NULL,
  `UpdDateTime` datetime DEFAULT NULL,
  `UpdUserNo` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `depot_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TerminalNo`,`ModelNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of m_terminaldevice
-- ----------------------------
INSERT INTO `m_terminaldevice` VALUES ('6', '400', '1', '安信仓库1号', 'SY001', '1', '192.168.1.199', '1', '50', '27011', '1,0,0,0', '15', '0', '1,2,6', '1qw', '1w', '1w', '1w', '1w', '1w', '1w', '1w', '1w', '1w', '1w', '1ww', '1ww', '1w', '1ww', '2015-09-10 17:30:34', '2015-09-07 09:30:56', '', '2015-09-17 17:30:41', '2015-09-23 17:30:47', '1', 'ANXIN01');

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
INSERT INTO `m_users` VALUES ('1', 'test', 'it', '123', 'it', '1', '1', 'it', 'it', '2015-09-05 10:24:07', '2015-09-05 10:24:12', 'it');

-- ----------------------------
-- Table structure for t_cash
-- ----------------------------
DROP TABLE IF EXISTS `t_cash`;
CREATE TABLE `t_cash` (
  `cash_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cash_date` datetime DEFAULT NULL,
  `user_no` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_nm` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custorder` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contaccter` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickidentity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkcode` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carrrier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tanspotno` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gwgt` float DEFAULT NULL,
  `nwgt` float DEFAULT NULL,
  `coo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`cash_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_cash
-- ----------------------------
INSERT INTO `t_cash` VALUES ('p0001', '2015-09-11 13:50:33', '001', null, null, '李四', '23981396', '132659874569', '542659874585125569', null, null, null, null, '25', '20', null, null, null, null, null, null, null);
INSERT INTO `t_cash` VALUES ('p0002', '2015-09-09 13:52:17', '002', null, null, '张三', '23981396', '132659874569', '542659874585125569', null, null, null, null, '20', '18', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_cashdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_cashdetail`;
CREATE TABLE `t_cashdetail` (
  `cash_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `item_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `prdct_no` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pc` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `quanlity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ctnno` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`cash_no`,`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_cashdetail
-- ----------------------------
INSERT INTO `t_cashdetail` VALUES ('p0001', '1', '1001', null, null, '1000', null, '001', '1x12', null, null, null, null, null, null);
INSERT INTO `t_cashdetail` VALUES ('p0001', '2', '1002', null, null, '150', null, '002', '1x24', null, null, null, null, null, null);
INSERT INTO `t_cashdetail` VALUES ('p0002', '3', '1001', null, null, '2000', null, '003', '1x10', null, null, null, null, null, null);

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
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock` (
  `prdct_no` varchar(48) NOT NULL,
  `pqty` float NOT NULL DEFAULT '0',
  `qty` float NOT NULL DEFAULT '0',
  `nwet` float NOT NULL DEFAULT '0',
  `gwet` float NOT NULL DEFAULT '0',
  `remark` varchar(256) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `adduser` varchar(16) DEFAULT NULL,
  `upduser` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`prdct_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stock
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_stockdetail`;
CREATE TABLE `t_stockdetail` (
  `prdct_no` varchar(48) COLLATE utf8_unicode_ci NOT NULL,
  `rfid_no` varchar(96) COLLATE utf8_unicode_ci NOT NULL,
  `shelf_no` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `qty` float NOT NULL DEFAULT '0',
  `nwet` float NOT NULL DEFAULT '0',
  `gwet` float NOT NULL DEFAULT '0',
  `remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`prdct_no`,`rfid_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_stockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockin
-- ----------------------------
DROP TABLE IF EXISTS `t_stockin`;
CREATE TABLE `t_stockin` (
  `stockin_no` varchar(32) NOT NULL,
  `stockin_date` datetime DEFAULT NULL,
  `user_no` varchar(16) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `op_no` varchar(30) DEFAULT NULL,
  `remark` varchar(256) NOT NULL,
  `adduser` varchar(16) NOT NULL,
  `upduser` varchar(16) NOT NULL,
  `addtime` datetime NOT NULL,
  `updtime` datetime NOT NULL,
  PRIMARY KEY (`stockin_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockin
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockinctnno
-- ----------------------------
DROP TABLE IF EXISTS `t_stockinctnno`;
CREATE TABLE `t_stockinctnno` (
  `stockin_no` varchar(32) NOT NULL,
  `prdct_no` varchar(48) NOT NULL,
  `pqty` float NOT NULL DEFAULT '0',
  `qty` float NOT NULL DEFAULT '0',
  `nwet` float DEFAULT '0',
  `gwet` float DEFAULT '0',
  `rfid_no` varchar(96) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `adduser` varchar(16) DEFAULT NULL,
  `upduser` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`stockin_no`,`prdct_no`,`rfid_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockinctnno
-- ----------------------------
INSERT INTO `t_stockinctnno` VALUES ('201509111', '1', '5', '50', '12.5', '0', '20150911115002', '', '1', '1', '2015-09-11 15:10:10', '2015-09-11 15:10:10');
INSERT INTO `t_stockinctnno` VALUES ('201509111', '1', '6', '60', '15', '0', '20150911116001', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');
INSERT INTO `t_stockinctnno` VALUES ('test001', 'lcc', '0', '0', '0', '0', '005001', '', '', '', '2015-09-06 17:52:16', '2015-09-06 17:52:19');

-- ----------------------------
-- Table structure for t_stockinctnnodetail
-- ----------------------------
DROP TABLE IF EXISTS `t_stockinctnnodetail`;
CREATE TABLE `t_stockinctnnodetail` (
  `rfid_no` varchar(96) COLLATE utf8_unicode_ci NOT NULL,
  `ctnno_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `qty` float NOT NULL DEFAULT '0',
  `nwet` float DEFAULT '0',
  `gwet` float DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`rfid_no`,`ctnno_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_stockinctnnodetail
-- ----------------------------
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911115002', '10', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:10:10', '2015-09-11 15:10:10');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911115002', '11', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:10:10', '2015-09-11 15:10:10');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911115002', '7', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:10:10', '2015-09-11 15:10:10');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911115002', '8', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:10:10', '2015-09-11 15:10:10');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911115002', '9', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:10:10', '2015-09-11 15:10:10');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911116001', '1', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911116001', '2', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911116001', '3', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911116001', '4', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911116001', '5', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');
INSERT INTO `t_stockinctnnodetail` VALUES ('20150911116001', '6', '10', '2.5', '0', '', '1', '1', '2015-09-11 15:08:55', '2015-09-11 15:08:55');

-- ----------------------------
-- Table structure for t_stockindetail
-- ----------------------------
DROP TABLE IF EXISTS `t_stockindetail`;
CREATE TABLE `t_stockindetail` (
  `stockin_no` varchar(32) NOT NULL,
  `in_item_no` varchar(10) NOT NULL,
  `bespeak_no` varchar(30) NOT NULL,
  `item_no` varchar(10) NOT NULL,
  `prdct_no` varchar(48) DEFAULT NULL,
  `pc` varchar(30) NOT NULL,
  `pqty` float DEFAULT NULL,
  `qty` float NOT NULL,
  `nwet` float NOT NULL,
  `gwet` float NOT NULL,
  `quanlity` varchar(20) NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `adduser` varchar(16) NOT NULL,
  `upduser` varchar(16) NOT NULL,
  `addtime` datetime NOT NULL,
  `updtime` datetime NOT NULL,
  PRIMARY KEY (`stockin_no`,`in_item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockindetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockout
-- ----------------------------
DROP TABLE IF EXISTS `t_stockout`;
CREATE TABLE `t_stockout` (
  `stockout_no` varchar(32) NOT NULL,
  `stockout_date` datetime DEFAULT NULL,
  `user_no` varchar(16) DEFAULT NULL,
  `pickup_user` varchar(16) DEFAULT NULL,
  `pickup_card` varchar(32) DEFAULT NULL,
  `pickup_mobile` varchar(32) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `remark` varchar(256) NOT NULL,
  `adduser` varchar(16) NOT NULL,
  `upduser` varchar(16) NOT NULL,
  `addtime` datetime NOT NULL,
  `updtime` datetime NOT NULL,
  PRIMARY KEY (`stockout_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockout
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockoutctnno
-- ----------------------------
DROP TABLE IF EXISTS `t_stockoutctnno`;
CREATE TABLE `t_stockoutctnno` (
  `stockout_id` varchar(32) NOT NULL,
  `prdct_no` varchar(48) NOT NULL,
  `qty` float NOT NULL DEFAULT '0',
  `nwet` float DEFAULT '0',
  `gwet` float DEFAULT '0',
  `rfid_no` varchar(96) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `adduser` varchar(16) DEFAULT NULL,
  `upduser` varchar(16) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`stockout_id`,`prdct_no`,`rfid_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockoutctnno
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockoutctnnodetail
-- ----------------------------
DROP TABLE IF EXISTS `t_stockoutctnnodetail`;
CREATE TABLE `t_stockoutctnnodetail` (
  `rfid_no` varchar(96) COLLATE utf8_unicode_ci NOT NULL,
  `ctnno_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `qty` float NOT NULL DEFAULT '0',
  `nwet` float DEFAULT '0',
  `gwet` float DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `adduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upduser` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `updtime` datetime DEFAULT NULL,
  PRIMARY KEY (`rfid_no`,`ctnno_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_stockoutctnnodetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_stockoutdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_stockoutdetail`;
CREATE TABLE `t_stockoutdetail` (
  `stockout_no` varchar(32) NOT NULL,
  `out_item_no` varchar(10) NOT NULL,
  `cash_no` varchar(30) NOT NULL,
  `item_no` varchar(10) NOT NULL,
  `prdct_no` varchar(48) DEFAULT NULL,
  `pc` varchar(30) NOT NULL,
  `pqty` float DEFAULT NULL,
  `qty` float NOT NULL,
  `nwet` float NOT NULL,
  `gwet` float NOT NULL,
  `quanlity` varchar(20) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `adduser` varchar(16) NOT NULL,
  `upduser` varchar(16) NOT NULL,
  `addtime` datetime NOT NULL,
  `updtime` datetime NOT NULL,
  PRIMARY KEY (`stockout_no`,`out_item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockoutdetail
-- ----------------------------

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

-- ----------------------------
-- Table structure for t_terminaalarm
-- ----------------------------
DROP TABLE IF EXISTS `t_terminaalarm`;
CREATE TABLE `t_terminaalarm` (
  `AlarmNo` varchar(32) CHARACTER SET utf8 NOT NULL,
  `AlarmType` smallint(6) NOT NULL COMMENT '0：采集连接\r\n            1：采集启动\r\n            2：采集扫描',
  `TerminalNo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `AlarmDate` datetime NOT NULL,
  `AlarmFlag` int(11) NOT NULL COMMENT '0: 未处理；1: 已处理\r\n            ',
  `AlarmReason` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `Remark` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `UpdUserNo` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `UpdDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`AlarmNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_terminaalarm
-- ----------------------------
INSERT INTO `t_terminaalarm` VALUES ('26B491A44E59467AA8020379636633EE', '0', '1', '2015-09-06 18:26:41', '0', '采集设备启动异常，自动重连！', null, null, null);
INSERT INTO `t_terminaalarm` VALUES ('3291937C5C6E4C068C831082B060EAE8', '0', '6', '2015-09-06 18:44:56', '1', '采集设备启动异常，自动重连！', null, null, null);
INSERT INTO `t_terminaalarm` VALUES ('6A40CC070F494C128550E1696473C57F', '0', '3', '2015-09-06 18:26:20', '1', '采集设备启动异常，自动重连！', null, null, null);
INSERT INTO `t_terminaalarm` VALUES ('7FA483433AC34EC69BB2AAD5D377202E', '0', '3', '2015-09-06 18:26:41', '1', '采集设备启动异常，自动重连！', null, null, null);
INSERT INTO `t_terminaalarm` VALUES ('A37CF68F6808492DB9E8007E5D346D99', '0', '1', '2015-09-06 18:26:20', '1', '采集设备启动异常，自动重连！', null, null, null);
INSERT INTO `t_terminaalarm` VALUES ('BB3ADA5935A9485785B103DB906A85A4', '0', '3', '2015-09-06 18:34:07', '0', '采集设备启动异常，自动重连！', null, null, null);
INSERT INTO `t_terminaalarm` VALUES ('CA15C0102F824FFBA95CE721761F316F', '0', '3', '2015-09-06 18:34:07', '0', '采集设备启动异常，自动重连！', null, null, null);
