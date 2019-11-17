/*
 Navicat Premium Data Transfer

 Source Server         : 置业担保公众号测试数据库
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 120.77.56.240
 Source Database       : jht

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 12/31/2018 15:25:25 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_cron_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai'), ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_job_details`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.jht.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597400b67b226a6f624964223a312c226265616e4e616d65223a22746573745461736b222c226d6574686f644e616d65223a2274657374222c22706172616d73223a2272656e72656e222c2263726f6e45787072657373696f6e223a223020302f3330202a202a202a203f222c22737461747573223a302c2272656d61726b223a22e69c89e58f82e695b0e6b58be8af95222c2263726561746554696d65223a2244656320312c20323031362031313a31363a343620504d227d7800), ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.jht.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597400a47b226a6f624964223a322c226265616e4e616d65223a22746573745461736b222c226d6574686f644e616d65223a227465737432222c2263726f6e45787072657373696f6e223a223020302f3330202a202a202a203f222c22737461747573223a312c2272656d61726b223a22e697a0e58f82e695b0e6b58be8af95222c2263726561746554696d65223a2244656320332c203230313620323a35353a353620504d227d7800);
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_locks`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS'), ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_scheduler_state`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'Sherlock.local1542525237626', '1542590226498', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1542591000000', '-1', '5', 'WAITING', 'CRON', '1540106480000', '0', null, '2', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597400b67b226a6f624964223a312c226265616e4e616d65223a22746573745461736b222c226d6574686f644e616d65223a2274657374222c22706172616d73223a2272656e72656e222c2263726f6e45787072657373696f6e223a223020302f3330202a202a202a203f222c22737461747573223a302c2272656d61726b223a22e69c89e58f82e695b0e6b58be8af95222c2263726561746554696d65223a2244656320312c20323031362031313a31363a343620504d227d7800), ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1540107000000', '-1', '5', 'PAUSED', 'CRON', '1540106480000', '0', null, '2', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597400a47b226a6f624964223a322c226265616e4e616d65223a22746573745461736b222c226d6574686f644e616d65223a227465737432222c2263726f6e45787072657373696f6e223a223020302f3330202a202a202a203f222c22737461747573223a312c2272656d61726b223a22e697a0e58f82e695b0e6b58be8af95222c2263726561746554696d65223a2244656320332c203230313620323a35353a353620504d227d7800);
COMMIT;

-- ----------------------------
--  Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
--  Records of `schedule_job`
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46'), ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');
COMMIT;

-- ----------------------------
--  Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
--  Records of `schedule_job_log`
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1054', '2018-10-21 15:30:00'), ('2', '1', 'testTask', 'test', 'renren', '0', null, '1061', '2018-10-28 16:30:00'), ('3', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2018-10-28 17:00:00'), ('4', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2018-10-28 22:00:00'), ('5', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-10-28 22:30:00'), ('6', '1', 'testTask', 'test', 'renren', '0', null, '1056', '2018-11-03 11:30:00'), ('7', '1', 'testTask', 'test', 'renren', '0', null, '1045', '2018-11-03 12:00:00'), ('8', '1', 'testTask', 'test', 'renren', '0', null, '1061', '2018-11-03 15:00:00'), ('9', '1', 'testTask', 'test', 'renren', '0', null, '1059', '2018-11-03 15:30:00'), ('10', '1', 'testTask', 'test', 'renren', '0', null, '1066', '2018-11-03 16:00:00'), ('11', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2018-11-03 16:30:00'), ('12', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2018-11-03 17:00:00'), ('13', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2018-11-03 17:30:00'), ('14', '1', 'testTask', 'test', 'renren', '0', null, '1076', '2018-11-03 18:00:00'), ('15', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-11-03 19:30:00'), ('16', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-11-03 20:00:00'), ('17', '1', 'testTask', 'test', 'renren', '0', null, '1038', '2018-11-03 20:30:00'), ('18', '1', 'testTask', 'test', 'renren', '0', null, '1038', '2018-11-03 21:00:00'), ('19', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-11-03 21:30:00'), ('20', '1', 'testTask', 'test', 'renren', '0', null, '1044', '2018-11-03 22:00:00'), ('21', '1', 'testTask', 'test', 'renren', '0', null, '1069', '2018-11-03 22:30:00'), ('22', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2018-11-03 23:00:00'), ('23', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2018-11-04 09:30:00'), ('24', '1', 'testTask', 'test', 'renren', '0', null, '1044', '2018-11-04 10:00:00'), ('25', '1', 'testTask', 'test', 'renren', '0', null, '1098', '2018-11-04 10:30:00'), ('26', '1', 'testTask', 'test', 'renren', '0', null, '1047', '2018-11-04 11:00:00'), ('27', '1', 'testTask', 'test', 'renren', '0', null, '2124', '2018-11-04 11:30:00'), ('28', '1', 'testTask', 'test', 'renren', '0', null, '1188', '2018-11-04 13:30:00'), ('29', '1', 'testTask', 'test', 'renren', '0', null, '1067', '2018-11-06 13:00:00'), ('30', '1', 'testTask', 'test', 'renren', '0', null, '1075', '2018-11-18 15:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '0', '人人开源集团', '0', '0'), ('2', '1', '长沙分公司', '1', '0'), ('3', '1', '上海分公司', '2', '0'), ('4', '3', '技术部', '0', '0'), ('5', '3', '销售部', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数id',
  `name` varchar(40) DEFAULT NULL COMMENT '参数名',
  `key` varchar(40) DEFAULT NULL COMMENT '键值',
  `value` varchar(60) DEFAULT NULL COMMENT '值',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', 'menu_type', '0', '目录', '菜单类型'), ('2', 'menu_type', '1', '菜单', '菜单类型'), ('3', 'menu_type', '2', '按钮', '菜单类型');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('1', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '99', '0:0:0:0:0:0:0:1', '2018-11-03 17:10:58'), ('2', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '127.0.0.1', '2018-11-03 17:23:30'), ('3', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 17:23:40'), ('4', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 17:24:25'), ('5', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-03 17:24:40'), ('6', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '25', '127.0.0.1', '2018-11-03 17:24:45'), ('7', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 17:24:55'), ('8', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-03 17:25:10'), ('9', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '1021', '127.0.0.1', '2018-11-03 17:25:25'), ('10', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '108', '127.0.0.1', '2018-11-03 17:27:44'), ('11', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-03 17:27:49'), ('12', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 17:27:55'), ('13', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '127.0.0.1', '2018-11-03 17:28:06'), ('14', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 17:28:23'), ('15', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 17:28:36'), ('16', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 17:32:57'), ('17', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 17:33:11'), ('18', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 17:33:43'), ('19', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '78', '127.0.0.1', '2018-11-03 17:34:44'), ('20', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 17:34:51'), ('21', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-03 17:37:13'), ('22', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 17:38:22'), ('23', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '32', '127.0.0.1', '2018-11-03 17:38:26'), ('24', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 17:39:18'), ('25', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '1020', '127.0.0.1', '2018-11-03 17:41:01'), ('26', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 17:41:25'), ('27', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 17:48:54'), ('28', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 17:49:17'), ('29', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-03 20:40:39'), ('30', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-03 20:41:34'), ('31', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '22', '127.0.0.1', '2018-11-03 20:43:55'), ('32', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '45', '127.0.0.1', '2018-11-03 20:45:39'), ('33', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-03 20:46:06'), ('34', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 20:47:37'), ('35', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '24', '127.0.0.1', '2018-11-03 20:47:57'), ('36', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '1046', '0:0:0:0:0:0:0:1', '2018-11-03 20:53:06'), ('37', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 20:53:15'), ('38', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-03 20:54:13'), ('39', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 20:55:19'), ('40', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 20:55:51'), ('41', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 20:57:23'), ('42', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 20:58:01'), ('43', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:00:30'), ('44', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-03 21:00:55'), ('45', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:03:30'), ('46', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:05:37'), ('47', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '33', '127.0.0.1', '2018-11-03 21:05:54'), ('48', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '45', '127.0.0.1', '2018-11-03 21:08:08'), ('49', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-03 21:10:24'), ('50', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:11:01'), ('51', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 21:11:15'), ('52', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-03 21:11:31'), ('53', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '0:0:0:0:0:0:0:1', '2018-11-03 21:13:24'), ('54', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '50', '127.0.0.1', '2018-11-03 21:14:11'), ('55', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-03 21:14:18'), ('56', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:14:30'), ('57', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '27', '127.0.0.1', '2018-11-03 21:14:45'), ('58', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:14:55'), ('59', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '127.0.0.1', '2018-11-03 21:15:11'), ('60', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '33', '0:0:0:0:0:0:0:1', '2018-11-03 21:16:05'), ('61', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:16:08'), ('62', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '26', '127.0.0.1', '2018-11-03 21:16:57'), ('63', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:17:07'), ('64', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:17:29'), ('65', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-03 21:18:37'), ('66', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 21:18:44'), ('67', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '19', '127.0.0.1', '2018-11-03 21:19:05'), ('68', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '33', '127.0.0.1', '2018-11-03 21:19:12'), ('69', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 21:19:19'), ('70', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '127.0.0.1', '2018-11-03 21:19:30'), ('71', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:19:41'), ('72', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-03 21:23:18'), ('73', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-03 21:23:18'), ('74', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 21:23:52'), ('75', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '0:0:0:0:0:0:0:1', '2018-11-03 21:24:44'), ('76', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-03 21:25:18'), ('77', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:25:33'), ('78', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 21:25:58'), ('79', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '127.0.0.1', '2018-11-03 21:30:57'), ('80', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-03 21:32:26'), ('81', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:34:56'), ('82', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-03 21:36:17'), ('83', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '24', '127.0.0.1', '2018-11-03 21:37:18'), ('84', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-03 21:37:45'), ('85', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '33', '127.0.0.1', '2018-11-03 21:38:26'), ('86', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:43:26'), ('87', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 21:43:30'), ('88', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:45:24'), ('89', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 21:45:25'), ('90', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-03 21:45:29'), ('91', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '38', '127.0.0.1', '2018-11-03 21:48:45'), ('92', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:48:58'), ('93', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 21:49:15'), ('94', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 21:49:45'), ('95', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 21:51:29'), ('96', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '0:0:0:0:0:0:0:1', '2018-11-03 22:00:46'), ('97', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '127.0.0.1', '2018-11-03 22:01:17'), ('98', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-03 22:01:40'), ('99', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '30', '127.0.0.1', '2018-11-03 22:03:11'), ('100', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '138', '0:0:0:0:0:0:0:1', '2018-11-03 22:09:26'), ('101', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '53', '127.0.0.1', '2018-11-03 22:16:29'), ('102', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '30', '0:0:0:0:0:0:0:1', '2018-11-03 22:16:45'), ('103', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '127.0.0.1', '2018-11-03 22:17:22'), ('104', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-03 22:22:02'), ('105', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 22:23:27'), ('106', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '0:0:0:0:0:0:0:1', '2018-11-03 22:32:56'), ('107', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '22', '0:0:0:0:0:0:0:1', '2018-11-03 22:34:44'), ('108', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '0:0:0:0:0:0:0:1', '2018-11-03 22:35:13'), ('109', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '27', '127.0.0.1', '2018-11-03 22:36:04'), ('110', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '0:0:0:0:0:0:0:1', '2018-11-03 22:38:44'), ('111', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-03 22:39:17'), ('112', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '0:0:0:0:0:0:0:1', '2018-11-03 22:39:21'), ('113', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '25', '127.0.0.1', '2018-11-03 22:42:33'), ('114', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-03 22:45:23'), ('115', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '0:0:0:0:0:0:0:1', '2018-11-03 22:45:24'), ('116', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '0:0:0:0:0:0:0:1', '2018-11-03 22:46:03'), ('117', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-03 22:46:09'), ('118', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '28', '0:0:0:0:0:0:0:1', '2018-11-03 22:48:26'), ('119', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '29', '0:0:0:0:0:0:0:1', '2018-11-03 22:50:29'), ('120', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '0:0:0:0:0:0:0:1', '2018-11-03 22:51:03'), ('121', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-03 22:52:12'), ('122', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '29', '0:0:0:0:0:0:0:1', '2018-11-03 22:54:13'), ('123', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-03 22:54:55'), ('124', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '140', '127.0.0.1', '2018-11-03 22:55:16'), ('125', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '0:0:0:0:0:0:0:1', '2018-11-03 22:57:27'), ('126', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '0:0:0:0:0:0:0:1', '2018-11-04 09:34:46'), ('127', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '0:0:0:0:0:0:0:1', '2018-11-04 09:34:50'), ('128', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 09:35:29'), ('129', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '0:0:0:0:0:0:0:1', '2018-11-04 09:35:33'), ('130', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '127.0.0.1', '2018-11-04 09:36:34'), ('131', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-04 09:36:36'), ('132', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 09:36:56'), ('133', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 09:38:39'), ('134', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '8', '0:0:0:0:0:0:0:1', '2018-11-04 09:38:42'), ('135', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-04 09:39:42'), ('136', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '45', '127.0.0.1', '2018-11-04 09:41:36'), ('137', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-04 09:42:41'), ('138', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '0:0:0:0:0:0:0:1', '2018-11-04 09:44:07'), ('139', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 09:47:20'), ('140', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '19', '0:0:0:0:0:0:0:1', '2018-11-04 09:48:42'), ('141', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '0:0:0:0:0:0:0:1', '2018-11-04 09:55:09'), ('142', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '0:0:0:0:0:0:0:1', '2018-11-04 09:55:13'), ('143', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '0:0:0:0:0:0:0:1', '2018-11-04 09:55:50'), ('144', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-04 09:56:50'), ('145', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '34', '0:0:0:0:0:0:0:1', '2018-11-04 09:57:40'), ('146', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '0:0:0:0:0:0:0:1', '2018-11-04 09:58:29'), ('147', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-04 09:58:39'), ('148', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '31', '127.0.0.1', '2018-11-04 09:59:20'), ('149', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '38', '0:0:0:0:0:0:0:1', '2018-11-04 10:01:27'), ('150', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '22', '0:0:0:0:0:0:0:1', '2018-11-04 10:01:45'), ('151', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '0:0:0:0:0:0:0:1', '2018-11-04 10:04:17'), ('152', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '19', '127.0.0.1', '2018-11-04 10:11:56'), ('153', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '31', '127.0.0.1', '2018-11-04 10:13:04'), ('154', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '127.0.0.1', '2018-11-04 10:13:48'), ('155', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '9', '127.0.0.1', '2018-11-04 10:13:50'), ('156', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-04 10:14:35'), ('157', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-04 10:20:02'), ('158', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '23', '127.0.0.1', '2018-11-04 10:20:06'), ('159', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-04 10:20:21'), ('160', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-04 10:20:30'), ('161', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '52', '127.0.0.1', '2018-11-04 10:21:04'), ('162', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-04 10:21:23'), ('163', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '127.0.0.1', '2018-11-04 10:21:32'), ('164', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-04 10:23:23'), ('165', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '127.0.0.1', '2018-11-04 10:25:25'), ('166', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-04 10:25:39'), ('167', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '0:0:0:0:0:0:0:1', '2018-11-04 10:30:11'), ('168', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '25', '127.0.0.1', '2018-11-04 10:37:56'), ('169', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '43', '127.0.0.1', '2018-11-04 10:39:09'), ('170', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '28', '127.0.0.1', '2018-11-04 10:41:47'), ('171', 'admin', '保存菜单', 'io.jht.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"测试\",\"path\":\"test\",\"type\":0}', '59', '127.0.0.1', '2018-11-04 10:42:31'), ('172', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-04 10:42:42'), ('173', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-04 10:42:46'), ('174', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-04 10:48:11'), ('175', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '24', '0:0:0:0:0:0:0:1', '2018-11-04 10:53:17'), ('176', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '67', '0:0:0:0:0:0:0:1', '2018-11-04 10:54:01'), ('177', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-04 10:54:09'), ('178', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '24', '0:0:0:0:0:0:0:1', '2018-11-04 10:55:10'), ('179', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '0:0:0:0:0:0:0:1', '2018-11-04 10:55:20'), ('180', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '25', '0:0:0:0:0:0:0:1', '2018-11-04 10:56:38'), ('181', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 10:57:31'), ('182', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '102', '0:0:0:0:0:0:0:1', '2018-11-04 10:59:16'), ('183', 'admin', '保存菜单', 'io.jht.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"测试目录\",\"path\":\"test\",\"type\":0}', '46', '127.0.0.1', '2018-11-04 10:59:44'), ('184', 'admin', '保存菜单', 'io.jht.modules.sys.controller.SysMenuController.save()', '{\"parentId\":37,\"parentName\":\"测试目录\",\"name\":\"测试菜单\",\"path\":\"testmenu\",\"type\":1}', '53', '127.0.0.1', '2018-11-04 11:00:20'), ('185', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-04 11:00:23'), ('186', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '18', '127.0.0.1', '2018-11-04 11:02:01'), ('187', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '54', '127.0.0.1', '2018-11-04 11:05:12'), ('188', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '19', '127.0.0.1', '2018-11-04 11:05:13'), ('189', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '35', '0:0:0:0:0:0:0:1', '2018-11-04 11:08:08'), ('190', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-04 11:08:11'), ('191', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-04 11:15:08'), ('192', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '0:0:0:0:0:0:0:1', '2018-11-04 11:19:54'), ('193', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-04 11:25:01'), ('194', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '31', '0:0:0:0:0:0:0:1', '2018-11-04 11:26:58'), ('195', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '47', '127.0.0.1', '2018-11-04 13:30:38'), ('196', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-04 13:30:39'), ('197', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '11', '127.0.0.1', '2018-11-04 13:30:42'), ('198', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '28', '0:0:0:0:0:0:0:1', '2018-11-04 13:31:30'), ('199', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-04 13:31:55'), ('200', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '74', '0:0:0:0:0:0:0:1', '2018-11-04 13:33:32'), ('201', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '31', '127.0.0.1', '2018-11-04 13:34:34'), ('202', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '12', '0:0:0:0:0:0:0:1', '2018-11-04 13:35:28'), ('203', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '25', '127.0.0.1', '2018-11-04 13:35:56'), ('204', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '10', '0:0:0:0:0:0:0:1', '2018-11-04 13:36:17'), ('205', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '26', '127.0.0.1', '2018-11-04 13:36:38'), ('206', 'admin', '修改菜单', 'io.jht.modules.sys.controller.SysMenuController.update()', '{\"menuId\":37,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"测试目录\",\"path\":\"test\",\"type\":0,\"orderNum\":1}', '187', '0:0:0:0:0:0:0:1', '2018-11-04 13:36:49'), ('207', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 13:36:54'), ('208', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '0:0:0:0:0:0:0:1', '2018-11-04 13:37:16'), ('209', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '51', '127.0.0.1', '2018-11-04 13:39:57'), ('210', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '82', '0:0:0:0:0:0:0:1', '2018-11-04 13:41:28'), ('211', 'admin', '修改菜单', 'io.jht.modules.sys.controller.SysMenuController.update()', '{\"menuId\":38,\"parentId\":37,\"parentName\":\"测试目录\",\"name\":\"测试菜单\",\"path\":\"testmenu\",\"type\":1,\"orderNum\":0}', '87', '0:0:0:0:0:0:0:1', '2018-11-04 13:41:57'), ('212', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '19', '127.0.0.1', '2018-11-04 13:44:51'), ('213', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '32', '127.0.0.1', '2018-11-04 13:49:59'), ('214', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '13', '127.0.0.1', '2018-11-04 13:50:07'), ('215', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '19', '127.0.0.1', '2018-11-04 13:50:21'), ('216', 'admin', '删除菜单', 'io.jht.modules.sys.controller.SysMenuController.delete()', '37', '17', '0:0:0:0:0:0:0:1', '2018-11-04 13:50:24'), ('217', 'admin', '删除菜单', 'io.jht.modules.sys.controller.SysMenuController.delete()', '38', '139', '127.0.0.1', '2018-11-04 13:50:29'), ('218', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '29', '127.0.0.1', '2018-11-18 15:01:46'), ('219', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '14', '127.0.0.1', '2018-11-18 15:02:03'), ('220', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '81', '127.0.0.1', '2018-11-18 15:04:07'), ('221', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-18 15:04:12'), ('222', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-18 15:06:44'), ('223', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '30', '127.0.0.1', '2018-11-18 15:06:44'), ('224', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-18 15:06:55'), ('225', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '94', '127.0.0.1', '2018-11-18 15:14:13'), ('226', 'admin', '修改菜单', 'io.jht.modules.sys.controller.SysMenuController.update()', '{\"menuId\":2,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"用户管理\",\"url\":\"modules/sys/user.html\",\"path\":\"user\",\"type\":1,\"icon\":\"\",\"orderNum\":1}', '97', '0:0:0:0:0:0:0:1', '2018-11-18 15:15:24'), ('227', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-18 15:16:14'), ('228', 'admin', '修改菜单', 'io.jht.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"url\":\"\",\"path\":\"sys\",\"type\":0,\"icon\":\"table\",\"orderNum\":9}', '23', '127.0.0.1', '2018-11-18 15:16:28'), ('229', 'admin', '删除菜单', 'io.jht.modules.sys.controller.SysMenuController.delete()', '37', '194', '127.0.0.1', '2018-11-18 15:16:33'), ('230', 'admin', '保存菜单', 'io.jht.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"入住管理\",\"path\":\"front\",\"type\":0}', '33', '0:0:0:0:0:0:0:1', '2018-11-18 15:17:27'), ('231', 'admin', '修改菜单', 'io.jht.modules.sys.controller.SysMenuController.update()', '{\"menuId\":39,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"入住管理\",\"path\":\"front\",\"type\":0,\"orderNum\":1}', '23', '127.0.0.1', '2018-11-18 15:17:35'), ('232', 'admin', '保存菜单', 'io.jht.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"财务管理\",\"path\":\"finance\",\"type\":0,\"orderNum\":2}', '18', '0:0:0:0:0:0:0:1', '2018-11-18 15:18:30'), ('233', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-18 15:19:08'), ('234', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-18 15:19:20'), ('235', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-18 15:20:05'), ('236', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '20', '127.0.0.1', '2018-11-18 15:20:08'), ('237', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '17', '127.0.0.1', '2018-11-18 15:20:23'), ('238', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '127.0.0.1', '2018-11-18 15:21:47'), ('239', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '16', '127.0.0.1', '2018-11-18 15:26:38'), ('240', 'admin', '保存菜单', 'io.jht.modules.sys.controller.SysMenuController.save()', '{\"parentId\":39,\"parentName\":\"入住管理\",\"name\":\"实时房态\",\"path\":\"state\",\"type\":1}', '55', '127.0.0.1', '2018-11-18 15:27:31'), ('241', 'admin', '预查询-查询数据字典', 'io.jht.modules.sys.controller.SysDictController.listByNames()', '{\"names\":[\"menu_type\"]}', '15', '0:0:0:0:0:0:0:1', '2018-11-18 15:27:38');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `path` varchar(200) DEFAULT NULL,
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', 'sys', null, '0', 'table', '9'), ('2', '1', '用户管理', 'modules/sys/user.html', 'user', null, '1', '', '1'), ('3', '1', '角色管理', 'modules/sys/role.html', 'role', null, '1', '', '2'), ('4', '1', '菜单管理', 'modules/sys/menu.html', 'menu', null, '1', 'tree', '3'), ('5', '1', 'SQL监控', 'druid/sql.html', 'sql', null, '1', '', '4'), ('6', '1', '定时任务', 'modules/job/schedule.html', 'schedule', null, '1', '', '5'), ('7', '6', '查看', null, null, 'sys:schedule:list,sys:schedule:info', '2', null, '0'), ('8', '6', '新增', null, null, 'sys:schedule:save', '2', null, '0'), ('9', '6', '修改', null, null, 'sys:schedule:update', '2', null, '0'), ('10', '6', '删除', null, null, 'sys:schedule:delete', '2', null, '0'), ('11', '6', '暂停', null, null, 'sys:schedule:pause', '2', null, '0'), ('12', '6', '恢复', null, null, 'sys:schedule:resume', '2', null, '0'), ('13', '6', '立即执行', null, null, 'sys:schedule:run', '2', null, '0'), ('14', '6', '日志列表', null, null, 'sys:schedule:log', '2', null, '0'), ('15', '2', '查看', null, null, 'sys:user:list,sys:user:info', '2', null, '0'), ('16', '2', '新增', null, null, 'sys:user:save,sys:role:select', '2', null, '0'), ('17', '2', '修改', null, null, 'sys:user:update,sys:role:select', '2', null, '0'), ('18', '2', '删除', null, null, 'sys:user:delete', '2', null, '0'), ('19', '3', '查看', null, null, 'sys:role:list,sys:role:info', '2', null, '0'), ('20', '3', '新增', null, null, 'sys:role:save,sys:menu:perms', '2', null, '0'), ('21', '3', '修改', null, null, 'sys:role:update,sys:menu:perms', '2', null, '0'), ('22', '3', '删除', null, null, 'sys:role:delete', '2', null, '0'), ('23', '4', '查看', null, null, 'sys:menu:list,sys:menu:info', '2', null, '0'), ('24', '4', '新增', null, null, 'sys:menu:save,sys:menu:select', '2', null, '0'), ('25', '4', '修改', null, null, 'sys:menu:update,sys:menu:select', '2', null, '0'), ('26', '4', '删除', null, null, 'sys:menu:delete', '2', null, '0'), ('27', '1', '参数管理', 'modules/sys/config.html', 'config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', '', '6'), ('29', '1', '系统日志', 'modules/sys/log.html', 'log', 'sys:log:list', '1', '', '7'), ('31', '1', '部门管理', 'modules/sys/dept.html', 'dept', null, '1', '', '1'), ('32', '31', '查看', null, null, 'sys:dept:list,sys:dept:info', '2', null, '0'), ('33', '31', '新增', null, null, 'sys:dept:save,sys:dept:select', '2', null, '0'), ('34', '31', '修改', null, null, 'sys:dept:update,sys:dept:select', '2', null, '0'), ('35', '31', '删除', null, null, 'sys:dept:delete', '2', null, '0'), ('39', '0', '入住管理', null, 'front', null, '0', null, '1'), ('40', '0', '财务管理', null, 'finance', null, '0', null, '2'), ('41', '39', '实时房态', null, 'state', null, '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
--  Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', null, '2016-11-11 11:11:11');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
--  Table structure for `sys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
--  Records of `sys_user_token`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` VALUES ('1', 'cfde64037e26a80f3c7a7f43424be9f4', '2018-11-19 03:01:22', '2018-11-18 15:01:22');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
