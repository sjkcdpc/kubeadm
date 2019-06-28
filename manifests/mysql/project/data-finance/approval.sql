/*
 Navicat Premium Data Transfer

 Source Server         : RDS
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-bp14631uzn52u586cqs.mysql.rds.aliyuncs.com:3306
 Source Schema         : approval

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 28/05/2019 16:01:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cac_eval_datastts
-- ----------------------------
DROP TABLE IF EXISTS `cac_eval_datastts`;
CREATE TABLE `cac_eval_datastts`  (
  `id_cadatastts` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `code_bus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_workflow` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件评估流程ID/编码 特定配置评估流程的唯一ID/编码，非事件级别，属于评估策略流程级别',
  `no_bus` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务号 业务号--标识',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B端客户ID 标识使用方的客户ID',
  `id_custc` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C端用户身份ID|身份ID 用于定义系统内的单个独立C端用户',
  `rnd_proc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评定环节 记录所处审批环节PS,AFF,AFC,CP',
  `code_dp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据产品编码 (例如：GAA01,EAB01，针对单源数据产品)',
  `id_dprcd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据产品记录id 数据产品对应报告/记录id,请求成功则记录，否则为空',
  `num_dpreq` int(11) NULL DEFAULT NULL COMMENT '数据接入请求次数 用于记录对于某一数据产品请求成功总次数',
  `stts_dp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据产品请求状态 数据产品请求最终状态:成功、超时、异常(SUCCESS,TIMEOUT,FAIL)，或请求返回码',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '数据准备结束时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '数据准备结束时间',
  `res_msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据准备返回的resMsg信息',
  PRIMARY KEY (`id_cadatastts`) USING BTREE,
  INDEX `no_bus`(`no_bus`) USING BTREE,
  INDEX `id_dprcd`(`id_dprcd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件评定数据状态表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for cac_eval_main
-- ----------------------------
DROP TABLE IF EXISTS `cac_eval_main`;
CREATE TABLE `cac_eval_main`  (
  `id_caadvres` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `code_bus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务代码/事件类型 业务代码--用于标识业务类型',
  `no_busb` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Ｂ端请求业务号 记录Ｂ端用户请求的业务／流水号',
  `id_workflow` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件评估流程ID/编码 特定配置评估流程的唯一ID/编码，非事件级别，属于评估策略流程级别',
  `no_bus` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务号 业务号--标识流程唯一业务ID号',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B端客户ID 标识使用方的客户ID',
  `id_custc` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C端用户身份ID 用于定义系统内的单个独立C端用户',
  `advice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终建议结果 accept, reject, cancel,ajust,manual,review,supply,inhand,hangon',
  `dpu_adv` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终建议结果所出环节 记录得到最终建议结果发生环节IV,AF,CP…',
  `code_strg` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终建议结果所审批策略编码 记录得到最终建议结果，所出环节的策略编码',
  `score` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件评分 针对事件的最终评定模型输出结果',
  `rsn_adv` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建议结果原因 记录得到最终结果的原因',
  `code_outrsn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rsn_outadv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输出结果原因 输出给外部系统的拒绝原因',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理流程状态 处理流程状态  INIT SUCCESS FAIL',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程版本号 记录此次申请单所走流程的版本号',
  PRIMARY KEY (`id_caadvres`) USING BTREE,
  UNIQUE INDEX `no_bus`(`no_bus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件评定主表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for cac_eval_round
-- ----------------------------
DROP TABLE IF EXISTS `cac_eval_round`;
CREATE TABLE `cac_eval_round`  (
  `id_carndadv` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `code_bus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务代码/事件类型 业务代码--用于标识业务类型',
  `id_workflow` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件评估流程ID/编码 特定配置评估流程的唯一ID/编码，非事件级别，属于评估策略流程级别',
  `no_bus` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务号 业务号--标识',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B端客户ID 标识使用方的客户ID',
  `id_custc` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C端用户身份ID|身份ID 用于定义系统内的单个独立C端用户',
  `rnd_proc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评定环节 记录所处审批环节PS,AFF,AFC,CP',
  `code_strg` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '策略编码 环节评定策略编码',
  `advice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评定结果 accept, reject, cancel,ajust,manual,review,supply,inhand,hangon',
  `rsn_adv` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评定结果原因 记录得到最终结果的原因',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  `code_substrg` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子策略编码,由process返回',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '数据准备结束时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '数据准备结束时间',
  PRIMARY KEY (`id_carndadv`) USING BTREE,
  INDEX `no_bus`(`no_bus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '事件评定环节表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for cac_finprod_out
-- ----------------------------
DROP TABLE IF EXISTS `cac_finprod_out`;
CREATE TABLE `cac_finprod_out`  (
  `id_caadvres` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `code_bus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务代码/事件类型 业务代码--用于标识业务类型',
  `no_busb` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Ｂ端请求业务号 记录Ｂ端用户请求的业务／流水号',
  `id_workflow` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件评估流程ID/编码 特定配置评估流程的唯一ID/编码，非事件级别，属于评估策略流程级别',
  `no_bus` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务号 业务号--标识',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'B端客户ID 标识使用方的客户ID',
  `id_custc` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'C端用户身份ID 用于定义系统内的单个独立C端用户',
  `amt_lmt` decimal(15, 2) NULL DEFAULT NULL COMMENT '额度 授信额度/分期金额',
  `amt_downpay` decimal(15, 2) NULL DEFAULT NULL,
  `amt_monthrepay` decimal(15, 2) NULL DEFAULT NULL COMMENT '每期还款额 分期每期还款额',
  `term` int(11) NULL DEFAULT NULL COMMENT '期限 贷款期限/额度有效期',
  `code_int` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '利率码 利率码',
  `code_fee` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费率码 费率码',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id_caadvres`) USING BTREE,
  INDEX `no_bus`(`no_bus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '金融产品输出信息表' ROW_FORMAT = Compressed;

SET FOREIGN_KEY_CHECKS = 1;
