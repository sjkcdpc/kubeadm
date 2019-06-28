/*
 Navicat Premium Data Transfer

 Source Server         : RDS
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-bp14631uzn52u586cqs.mysql.rds.aliyuncs.com:3306
 Source Schema         : sctx_data_product

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 27/05/2019 09:30:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cac_pubdict_idcity
-- ----------------------------
DROP TABLE IF EXISTS `cac_pubdict_idcity`;
CREATE TABLE `cac_pubdict_idcity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7031 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cac_pubdict_school
-- ----------------------------
DROP TABLE IF EXISTS `cac_pubdict_school`;
CREATE TABLE `cac_pubdict_school`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_school` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_school` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_schoolhst` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_schoolprovince` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_school` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3961 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cac_risk_param_table
-- ----------------------------
DROP TABLE IF EXISTS `cac_risk_param_table`;
CREATE TABLE `cac_risk_param_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_bus` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_prod` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_subprod` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_prod` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_var` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_logic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_valid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `name_upd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rsn_upd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cac_st_rule_code
-- ----------------------------
DROP TABLE IF EXISTS `cac_st_rule_code`;
CREATE TABLE `cac_st_rule_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stset` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stset_new` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_new` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rsn_upd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` datetime(0) NOT NULL,
  `time_upd` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `name_upd` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for clear_data_sql_result
-- ----------------------------
DROP TABLE IF EXISTS `clear_data_sql_result`;
CREATE TABLE `clear_data_sql_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表明',
  `actual_delete_rows` bigint(255) NULL DEFAULT NULL COMMENT '实际删除的行数',
  `task_start_time` datetime(0) NOT NULL COMMENT '任务开始时间',
  `task_end_time` datetime(0) NOT NULL COMMENT '任务结束时间',
  `spend_time` bigint(20) NOT NULL COMMENT '任务花费时间,单位是秒',
  `time_inst` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据插入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6368 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '删除历史数据sql结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for counter_log
-- ----------------------------
DROP TABLE IF EXISTS `counter_log`;
CREATE TABLE `counter_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求流水号',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `source_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
  `source_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `num_data` int(10) NULL DEFAULT NULL COMMENT '数据条数',
  `num_charge` int(10) NULL DEFAULT NULL COMMENT '计费条数',
  `status` int(10) NULL DEFAULT NULL COMMENT 'Http状态码',
  `err_reason` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `time_start` datetime(0) NULL DEFAULT NULL COMMENT '请求开始时间',
  `time_end` datetime(0) NULL DEFAULT NULL COMMENT '请求结束时间',
  `time_used` int(10) NULL DEFAULT NULL COMMENT '请求耗时',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1603087 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源调用统计信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for credit_model_result
-- ----------------------------
DROP TABLE IF EXISTS `credit_model_result`;
CREATE TABLE `credit_model_result`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用于定义系统内的独立报告',
  `code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型编码',
  `search_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'search_id',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT 'flag_valid',
  `res_num` double NULL DEFAULT NULL COMMENT '模型分',
  `res_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型结果类别',
  `key_var1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重要变量1',
  `value1` double NULL DEFAULT NULL COMMENT '取值1',
  `key_var2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重要变量2',
  `value2` double NULL DEFAULT NULL COMMENT '取值2',
  `key_var3` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重要变量3',
  `value3` double NULL DEFAULT NULL COMMENT '取值3',
  `key_var4` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重要变量4',
  `value4` double NULL DEFAULT NULL COMMENT '取值4',
  `key_var5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重要变量5',
  `value5` double NULL DEFAULT NULL COMMENT '取值5',
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用于记录我们更改该条数据的时间',
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型分结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cvd050103_apply_basic
-- ----------------------------
DROP TABLE IF EXISTS `cvd050103_apply_basic`;
CREATE TABLE `cvd050103_apply_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `code_res` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码中文',
  `service_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_basic_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手机实名基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cvd050103_apply_result
-- ----------------------------
DROP TABLE IF EXISTS `cvd050103_apply_result`;
CREATE TABLE `cvd050103_apply_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `code_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证返回码',
  `msg_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证返回码描述',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `index_result_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1651 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手机实名结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cvd050201_name_id_verify_basic
-- ----------------------------
DROP TABLE IF EXISTS `cvd050201_name_id_verify_basic`;
CREATE TABLE `cvd050201_name_id_verify_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `code_res` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应状态码',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应信息',
  `service_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优分姓名身份认证基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cvd050201_name_id_verify_result
-- ----------------------------
DROP TABLE IF EXISTS `cvd050201_name_id_verify_result`;
CREATE TABLE `cvd050201_name_id_verify_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户唯一标识',
  `code_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证返回码',
  `msg_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证返回码描述',
  `conform_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '整合状态码状态',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '插入时间',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优分姓名身份认证结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_source_query_status
-- ----------------------------
DROP TABLE IF EXISTS `data_source_query_status`;
CREATE TABLE `data_source_query_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `partner_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户合作方编码',
  `session_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户调用的sessionId',
  `product_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对外输出的产品code',
  `dpu_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求的数据准备的code',
  `is_succeed` int(1) NULL DEFAULT NULL COMMENT '0：表示失败 1:表示成功',
  `type` int(1) NULL DEFAULT NULL COMMENT '0：表示查询mysql缓存 1:表示请求外部数据源',
  `res_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源得到的code',
  `res_msg` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源得到的msg',
  `id_file` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id_index`(`session_id`) USING BTREE,
  INDEX `partner_index`(`partner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 243796 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记录请求组装系统配置化接口时数据源查询情况' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for datashow_field
-- ----------------------------
DROP TABLE IF EXISTS `datashow_field`;
CREATE TABLE `datashow_field`  (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `display` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段翻译规则，cn:中文名称,en:英文名称',
  `value_function` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段值加工处理',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据展示模块编码',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新建时间',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datashow_product
-- ----------------------------
DROP TABLE IF EXISTS `datashow_product`;
CREATE TABLE `datashow_product`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据展示产品编码',
  `reportid_map` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编码映射成整合表编码，json格式',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据展示产品描述',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新建时间',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datashow_product_module
-- ----------------------------
DROP TABLE IF EXISTS `datashow_product_module`;
CREATE TABLE `datashow_product_module`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `product_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据展示产品编码',
  `module_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据展示模块编码',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新建时间',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dict_operation_external
-- ----------------------------
DROP TABLE IF EXISTS `dict_operation_external`;
CREATE TABLE `dict_operation_external`  (
  `phone_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone_serve` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_serve` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`phone_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for iaf010301_basic
-- ----------------------------
DROP TABLE IF EXISTS `iaf010301_basic`;
CREATE TABLE `iaf010301_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `idCardNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码',
  `msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源返回信息',
  `internalErrorCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部错误码',
  `service_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'iaf010301' COMMENT '接口编码',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源成功时是否有内容',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源是否成功',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '灵芝分基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for iaf010301_result
-- ----------------------------
DROP TABLE IF EXISTS `iaf010301_result`;
CREATE TABLE `iaf010301_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int(11) NULL DEFAULT NULL COMMENT '灵芝分分数',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '灵芝分结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032001_basic
-- ----------------------------
DROP TABLE IF EXISTS `ibl032001_basic`;
CREATE TABLE `ibl032001_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源返回code',
  `msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源返回信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源是否成功',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源成功时是否有内容',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '口袋征信黑名单基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032001_result
-- ----------------------------
DROP TABLE IF EXISTS `ibl032001_result`;
CREATE TABLE `ibl032001_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命中状态',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '口袋征信黑名单结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032101_basic
-- ----------------------------
DROP TABLE IF EXISTS `ibl032101_basic`;
CREATE TABLE `ibl032101_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源返回code',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源是否成功',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源成功时是否有内容',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE,
  INDEX `id_card_index`(`id_card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象黑名单基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032101_result
-- ----------------------------
DROP TABLE IF EXISTS `ibl032101_result`;
CREATE TABLE `ibl032101_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命中状态',
  `msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果描述',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msgCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9990697 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象黑名单结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032102_basic
-- ----------------------------
DROP TABLE IF EXISTS `ibl032102_basic`;
CREATE TABLE `ibl032102_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源返回code',
  `msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果描述',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源成功时是否有内容',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源是否成功',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象逾期名单基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032102_result
-- ----------------------------
DROP TABLE IF EXISTS `ibl032102_result`;
CREATE TABLE `ibl032102_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flag` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命中状态',
  `overdue_days` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '历史逾期天数',
  `saas_order` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SAAS标记为进件中的工单',
  `current_order` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前逾期及未结清工单',
  `sm_order` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '速秒标记为进件中的工单',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10282142 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象逾期名单结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032103_apply_basic
-- ----------------------------
DROP TABLE IF EXISTS `ibl032103_apply_basic`;
CREATE TABLE `ibl032103_apply_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `code_res` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码中文',
  `service_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '逾期数据查询基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032103_apply_overdue_basic
-- ----------------------------
DROP TABLE IF EXISTS `ibl032103_apply_overdue_basic`;
CREATE TABLE `ibl032103_apply_overdue_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '因为有可能参数为mobile，所以可为Null',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `code_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应码(因为此数据源只是查库操作，此值设置为空)',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应信息(因为此数据源只是查库操作，此值设置为空)',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请逾期数据查询基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032103_apply_overdue_result
-- ----------------------------
DROP TABLE IF EXISTS `ibl032103_apply_overdue_result`;
CREATE TABLE `ibl032103_apply_overdue_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '因为有可能参数为mobile，所以可为Null',
  `last_7d_apply_cnt` int(11) NULL DEFAULT NULL COMMENT '过去7天申请次数',
  `last_30d_apply_cnt` int(11) NULL DEFAULT NULL COMMENT '过去30天申请次数',
  `last_60d_apply_cnt` int(11) NULL DEFAULT NULL COMMENT '过去60天申请次数',
  `last_90d_apply_cnt` int(11) NULL DEFAULT NULL COMMENT '过去90天申请次数',
  `last_180d_apply_cnt` int(11) NULL DEFAULT NULL COMMENT '过去180天申请次数',
  `history_apply_cnt` int(11) NULL DEFAULT NULL COMMENT '历史总申请次数',
  `last_90d_reject_cnt_sumiao` int(11) NULL DEFAULT NULL COMMENT '最近90天速秒拒绝次数',
  `last_90d_reject_cnt_77fenqi` int(11) NULL DEFAULT NULL COMMENT '最近90天77分期拒绝次数',
  `last_90d_reject_cnt_lefenqi` int(11) NULL DEFAULT NULL COMMENT '最近90天乐分期拒绝次数',
  `last_90d_reject_cnt_77qianbao` int(11) NULL DEFAULT NULL COMMENT '最近90天77钱包拒绝次数',
  `last_90d_reject_cnt_saas_shanghu` int(11) NULL DEFAULT NULL COMMENT '最近90天SAAS系统其它商户拒绝次数',
  `last_90d_total_reject_cnt` int(11) NULL DEFAULT NULL COMMENT '最近90天总拒绝次数',
  `history_max_overdue_day` int(11) NULL DEFAULT NULL COMMENT '历史最大逾期天数',
  `last_overdue_day` int(11) NULL DEFAULT NULL COMMENT '最近一次逾期天数',
  `current_overdue_day` int(11) NULL DEFAULT NULL COMMENT '当前逾期天数',
  `overdue_day_gt3_order_cnt` int(11) NULL DEFAULT NULL COMMENT '逾期大于三天的订单数',
  `overdue_day_gt7_order_cnt` int(11) NULL DEFAULT NULL COMMENT '逾期大于七天的订单数',
  `already_repay_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '已还金额',
  `overdue_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款罚息',
  `repay_corpus_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款本金',
  `repay_accrual_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款利息',
  `amount_used` decimal(10, 2) NULL DEFAULT NULL COMMENT '已用额度',
  `is_loan` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在贷款中',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请逾期数据查询结果信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032103_apply_result
-- ----------------------------
DROP TABLE IF EXISTS `ibl032103_apply_result`;
CREATE TABLE `ibl032103_apply_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `currentOverdueDay` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前逾期天数',
  `historyMaxOverdueDay` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '历史最大逾期天数',
  `idcard` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `lastOverdueDay` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近一次逾期天数',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `overdueDayGt3OrderCnt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逾期3+订单数',
  `overdueDayGt7OrderCnt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逾期7+订单数',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `already_repay_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '已还金额',
  `overdue_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款罚息',
  `repay_corpus_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款本金',
  `repay_accrual_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款利息',
  `amount_used` decimal(10, 2) NULL DEFAULT NULL COMMENT '已用额度',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4933533 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '逾期数据查询结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032105_device_overdue_basic
-- ----------------------------
DROP TABLE IF EXISTS `ibl032105_device_overdue_basic`;
CREATE TABLE `ibl032105_device_overdue_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_valid` int(1) NULL DEFAULT NULL,
  `flag_qry` int(1) NULL DEFAULT NULL,
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象设备预期基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ibl032105_device_overdue_result
-- ----------------------------
DROP TABLE IF EXISTS `ibl032105_device_overdue_result`;
CREATE TABLE `ibl032105_device_overdue_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `max_overdueday` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象设备预期结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for icd010701_zr_basic
-- ----------------------------
DROP TABLE IF EXISTS `icd010701_zr_basic`;
CREATE TABLE `icd010701_zr_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `bank_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号码',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求外部数据源返回code',
  `msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果描述',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源成功时是否有内容',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源是否成功',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `phone_index`(`phone`) USING BTREE,
  INDEX `bank_card_index`(`bank_card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'zrobot分数基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for icd010701_zr_result
-- ----------------------------
DROP TABLE IF EXISTS `icd010701_zr_result`;
CREATE TABLE `icd010701_zr_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` decimal(11, 3) NULL DEFAULT NULL COMMENT 'ZRobot信用分',
  `stability` int(11) NULL DEFAULT NULL COMMENT '稳定性',
  `buyingIndex` decimal(11, 3) NULL DEFAULT NULL COMMENT '购买力指数',
  `riskIndex` decimal(11, 3) NULL DEFAULT NULL COMMENT '交易风险指数',
  `performanceIndex` decimal(11, 3) NULL DEFAULT NULL COMMENT '履约指数',
  `resonableConsuming` decimal(11, 3) NULL DEFAULT NULL COMMENT '理性消费指数',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常驻城市',
  `cityStability` int(11) NULL DEFAULT NULL COMMENT '地址一致性校验',
  `onlineBuying` decimal(11, 3) NULL DEFAULT NULL COMMENT '网购指数',
  `comsumingSocial` decimal(11, 3) NULL DEFAULT NULL COMMENT '消费社交影响力',
  `incomming` decimal(11, 3) NULL DEFAULT NULL COMMENT '收入水平',
  `riskPeriodConsuming` decimal(11, 3) NULL DEFAULT NULL COMMENT '高危时段消费指数',
  `riskCategoryConsuming` decimal(11, 3) NULL DEFAULT NULL COMMENT '高危品类消费指数',
  `worktimeShopping` decimal(11, 3) NULL DEFAULT NULL COMMENT '工作时间网购偏好',
  `cellphonePreference` int(11) NULL DEFAULT NULL COMMENT '手机依赖度',
  `ecommerceActiveness` decimal(11, 3) NULL DEFAULT NULL COMMENT '电商活跃度',
  `ecommerceAddressStability` int(11) NULL DEFAULT NULL COMMENT '电商收货地址稳定性',
  `ecommercecellphoneStability` int(11) NULL DEFAULT NULL COMMENT '电商联系方式稳定性',
  `ecommerceAccountHistory` int(11) NULL DEFAULT NULL COMMENT '电商账龄等级',
  `cashPreference` decimal(11, 3) NULL DEFAULT NULL COMMENT '现金偏好程度',
  `riskPeriodPayment` decimal(11, 3) NULL DEFAULT NULL COMMENT '高危时段支付指数',
  `riskCategoryPayment` decimal(11, 3) NULL DEFAULT NULL COMMENT '高危品类支付指数',
  `bankcardStability` decimal(11, 3) NULL DEFAULT NULL COMMENT '银行卡稳定性',
  `bankcardActiveness` decimal(11, 3) NULL DEFAULT NULL COMMENT '银行卡活跃度',
  `bankcardHistory` int(11) NULL DEFAULT NULL COMMENT '银行账龄等级',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'zrobot分数结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for icd180712_basic
-- ----------------------------
DROP TABLE IF EXISTS `icd180712_basic`;
CREATE TABLE `icd180712_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用于定义系统内的独立报告',
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `idCard` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `tiNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '32位英文数字混合组成',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '当字段查询成功且有查询内容时为1，否则为0',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '当code=000时，此字段记为1，其他情况记为0',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户token',
  `time_inqt` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们到系统查询报告的时间',
  `time_rect` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们接收到报告的时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们更改该条数据的时间',
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `token_index`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大圣数据芝麻分基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for icd180712_result
-- ----------------------------
DROP TABLE IF EXISTS `icd180712_result`;
CREATE TABLE `icd180712_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的独立报告',
  `code` int(11) NULL DEFAULT NULL COMMENT '返回编码',
  `msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回信息',
  `result` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只有在授权情况下才会响应此结果',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们更改该条数据的时间',
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '水象逾期名单结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd010701_zrobot_payloan_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd010701_zrobot_payloan_basic`;
CREATE TABLE `imd010701_zrobot_payloan_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `result` int(1) NULL DEFAULT NULL COMMENT '是否查得有数据',
  `code_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应码',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应信息',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'zrobot短贷评分及变量基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd010701_zrobot_payloan_result
-- ----------------------------
DROP TABLE IF EXISTS `imd010701_zrobot_payloan_result`;
CREATE TABLE `imd010701_zrobot_payloan_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `paydayloan_score` int(10) NULL DEFAULT NULL COMMENT '短贷评分',
  `verif_count_m24` int(10) NULL DEFAULT NULL COMMENT '最近24个月验证码通知平台数',
  `verif_count_m12` int(10) NULL DEFAULT NULL COMMENT '最近12个月验证码通知平台数 ',
  `verif_count_m6` int(10) NULL DEFAULT NULL COMMENT '最近6个月验证码通知平台数 ',
  `verif_count_m3` int(10) NULL DEFAULT NULL COMMENT '最近3个月验证码通知平台数 ',
  `verif_count_m1` int(10) NULL DEFAULT NULL COMMENT '最近1个月验证码通知平台数 ',
  `verif_sum_m24` int(10) NULL DEFAULT NULL COMMENT '最近24个月验证码通知次数',
  `verif_sum_m12` int(10) NULL DEFAULT NULL COMMENT '最近12个月验证码通知次数',
  `verif_sum_m6` int(10) NULL DEFAULT NULL COMMENT '最近6个月验证码通知次数',
  `verif_sum_m3` int(10) NULL DEFAULT NULL COMMENT '最近3个月验证码通知次数',
  `verif_sum_m1` int(10) NULL DEFAULT NULL COMMENT '最近1个月验证码通知次数',
  `register_sum_m24` int(10) NULL DEFAULT NULL COMMENT '最近24个月注册次数',
  `register_sum_m12` int(10) NULL DEFAULT NULL COMMENT '最近12个月注册次数 ',
  `register_sum_m6` int(10) NULL DEFAULT NULL COMMENT '最近6个月注册次数',
  `register_sum_m3` int(10) NULL DEFAULT NULL COMMENT '最近3个月注册次数',
  `register_sum_m1` int(10) NULL DEFAULT NULL COMMENT '最近1个月注册次数',
  `register_count_m24` int(10) NULL DEFAULT NULL COMMENT '最近24个月注册平台数',
  `register_count_m12` int(10) NULL DEFAULT NULL COMMENT '最近12个月注册平台数',
  `register_count_m6` int(10) NULL DEFAULT NULL COMMENT '最近6个月注册平台数',
  `register_count_m3` int(10) NULL DEFAULT NULL COMMENT '最近3个月注册平台数',
  `register_count_m1` int(10) NULL DEFAULT NULL COMMENT '最近1个月注册平台数',
  `loan_offer_sum_m24` int(10) NULL DEFAULT NULL COMMENT '最近24个月借款发放次数',
  `loan_offer_sum_m12` int(10) NULL DEFAULT NULL COMMENT '最近12个月借款发放次数',
  `loan_offer_sum_m6` int(10) NULL DEFAULT NULL COMMENT '最近6个月借款发放次数',
  `loan_offer_sum_m3` int(10) NULL DEFAULT NULL COMMENT '最近3个月借款发放次数',
  `loan_offer_sum_m1` int(10) NULL DEFAULT NULL COMMENT '最近1个月借款发放次数',
  `loan_offer_count_m24` int(10) NULL DEFAULT NULL COMMENT '最近24个月发放借款平台数',
  `loan_offer_count_m12` int(10) NULL DEFAULT NULL COMMENT '最近12个月发放借款平台数',
  `loan_offer_count_m6` int(10) NULL DEFAULT NULL COMMENT '最近6个月发放借款平台数',
  `loan_offer_count_m3` int(10) NULL DEFAULT NULL COMMENT '最近3个月发放借款平台数',
  `loan_offer_count_m1` int(10) NULL DEFAULT NULL COMMENT '最近1个月发放借款平台数',
  `ave_apply_request_amount_level_m24` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近24个月平均借款申请金额等级',
  `ave_apply_request_amount_level_m12` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近12个月平均借款申请金额等级',
  `ave_apply_request_amount_level_m6` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 6 个月平均借款申请金额等级',
  `ave_apply_request_amount_level_m3` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 3 个月平均借款申请金额等级',
  `ave_apply_request_amount_level_m1` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 1 个月平均借款申请金额等级',
  `max_apply_request_amount_level_m24` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 24 个月最大借款申请金额等级',
  `max_apply_request_amount_level_m12` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近 12 个月最大借款申请金额等级',
  `max_apply_request_amount_level_m6` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 6 个月最大借款申请金额等级',
  `max_apply_request_amount_level_m3` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 3 个月最大借款申请金额等级',
  `max_apply_request_amount_level_m1` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 1 个月最大借款申请金额等级',
  `repay_remind_count_m24` int(10) NULL DEFAULT NULL COMMENT '最近 24 个月还款提醒平台数 ',
  `repay_remind_count_m12` int(10) NULL DEFAULT NULL COMMENT '最近 12 个月还款提醒平台数 ',
  `repay_remind_count_m6` int(10) NULL DEFAULT NULL COMMENT '最近 6 个月还款提醒平台数 ',
  `repay_remind_count_m3` int(10) NULL DEFAULT NULL COMMENT '最近 3 个月还款提醒平台数 ',
  `repay_remind_count_m1` int(10) NULL DEFAULT NULL COMMENT '最近 1 个月还款提醒平台数 ',
  `repay_remind_sum_m24` int(10) NULL DEFAULT NULL COMMENT '最近 24 个月还款提醒次数',
  `repay_remind_sum_m12` int(10) NULL DEFAULT NULL COMMENT '最近 12 个月还款提醒次数',
  `repay_remind_sum_m6` int(10) NULL DEFAULT NULL COMMENT '最近 6 个月还款提醒次数',
  `repay_remind_sum_m3` int(10) NULL DEFAULT NULL COMMENT '最近 3 个月还款提醒次数',
  `repay_remind_sum_m1` int(10) NULL DEFAULT NULL COMMENT '最近 1 个月还款提醒次数',
  `max_repay_amount_level_m24` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 24 个月最大还款提醒金额等级',
  `max_repay_amount_level_m12` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 12 个月最大还款提醒金额等级',
  `max_repay_amount_level_m6` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 6 个月最大还款提醒金额等级',
  `max_repay_amount_level_m3` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 3 个月最大还款提醒金额等级',
  `max_repay_amount_level_m1` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 1 个月最大还款提醒金额等级',
  `ave_repay_amount_level_m24` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 24 个月平均还款提醒金额等级',
  `ave_repay_amount_level_m12` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 12 个月平均还款提醒金额等级',
  `ave_repay_amount_level_m6` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 6 个月平均还款提醒金额等级',
  `ave_repay_amount_level_m3` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 3 个月平均还款提醒金额等级',
  `ave_repay_amount_level_m1` enum('-1','1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 1 个月平均还款提醒金额等级',
  `ave_overdue_delay_level_m24` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 24 个月平均逾期时长等级',
  `ave_overdue_delay_level_m12` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 12 个月平均逾期时长等级',
  `ave_overdue_delay_level_m6` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 6 个月平均逾期时长等级',
  `ave_overdue_delay_level_m3` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 3 个月平均逾期时长等级',
  `ave_overdue_delay_level_m1` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 1 个月平均逾期时长等级',
  `max_overdue_delay_level_m24` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 24 个月最大逾期时长等级',
  `max_overdue_delay_level_m12` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 12 个月最大逾期时长等级',
  `max_overdue_delay_level_m6` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 6 个月最大逾期时长等级',
  `max_overdue_delay_level_m3` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 3 个月最大逾期时长等级',
  `max_overdue_delay_level_m1` enum('-1','1','2','3','4','5','6') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近 1 个月最大逾期时长等级',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'zrobot短贷评分及变量结果信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040101_td_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd040101_td_basic`;
CREATE TABLE `imd040101_td_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `success` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应状态',
  `result_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `seq_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流水号',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同盾接口基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040101_td_result
-- ----------------------------
DROP TABLE IF EXISTS `imd040101_td_result`;
CREATE TABLE `imd040101_td_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `m_ratio_freq_record_Register_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内全行业下注册事件中的记录条数占相应时间下所有记录条数的比例',
  `i_length_first_last_all_Unconsumerfinance_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的90天内一般消费分期行业下所有事件中第一条记录距最后一条记录的天数',
  `i_length_first_all_P2pweb_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的90天内P2P网贷行业下所有事件中第一条记录距测试间时间的天数',
  `i_freq_accountemail_all_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内邮箱号字段出现的次数',
  `i_length_first_Loan_Unconsumerfinance_60day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的60天内一般消费分期行业下贷款事件中第一条记录距测试间时间的天数',
  `m_ratio_freq_record_Register_all_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的90天内全行业下注册事件中的记录条数占相应时间下所有记录条数的比例',
  `m_mean_length_event_all_Offloan_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的90天内线下小额贷款行业下所有事件中所有记录的平均时长(相应时间内所有记录最大间隔时间除以记录条数减1)',
  `m_freq_IOS_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内ios字段出现的次数',
  `i_ratio_freq_record_Loan_Consumerfinance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内大型消费金融行业下贷款事件中的记录条数占相应时间下所有记录条数的比例',
  `m_mean_length_event_all_con_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内消费金融行业下所有事件中所有记录的平均时长(相应时间内所有记录最大间隔时间除以记录条数减1)',
  `m_ratio_cnt_partner_Loan_Inconsumerfinance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内银行消费金融行业下贷款事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_mean_length_event_Loan_P2pweb_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内P2P网贷行业下贷款事件中所有记录的平均时长(相应时间内所有记录最大间隔时间除以记录条数减1)',
  `m_ratio_cnt_partner_Login_P2pweb_60day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的60天内P2P网贷行业下登录事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_freq_accountemail_all_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内邮箱号字段出现的次数',
  `m_ratio_freq_record_Loan_con_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的90天内消费金融行业下贷款事件中的记录条数占相应时间下所有记录条数的比例',
  `m_max_freq_record_daily_Register_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内全行业下注册事件中的最大单日记录条数',
  `m_freq_day_all_O2O_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内O2O行业下所有事件中发生在白天的次数',
  `m_mean_cnt_partner_daily_Loan_Imbank_60day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的60天内非银行类金融行业下贷款事件中的平均单日不同平台个数',
  `m_length_last_Register_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内大金融(银行、保险、非银行)行业下注册事件中最后一条记录距测试时间的天数',
  `m_mean_freq_record_daily_all_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内P2P网贷行业下所有事件中的平均单日记录条数',
  `m_freq_weekday_Register_Imbank_60day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的60天内非银行类金融行业下注册事件中发生在工作日的次数',
  `m_ratio_cnt_partner_Loan_P2pweb_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内P2P网贷行业下贷款事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_cnt_indone_Loan_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内贷款事件中的不同一级行业的个数',
  `i_freq_trueipaddresscity_all_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的30天内真实ip地址解析城市字段出现的次数',
  `m_mean_cnt_partner_daily_Loan_Imbank_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内非银行类金融行业下贷款事件中的平均单日不同平台个数',
  `m_freq_weekend_Register_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内全行业下注册事件中发生在周末的次数',
  `i_mean_freq_record_daily_all_Imbank_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内非银行类金融行业下所有事件中的平均单日记录条数',
  `i_freq_policy_Review_all_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内所有策略集中包含Review的次数',
  `m_freq_record_Loan_Unconsumerfinance_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内一般消费分期行业下贷款事件中的记录条数',
  `i_freq_policy_Review_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内所有策略集中包含Review的次数',
  `i_freq_weekday_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内全行业下所有事件中发生在工作日的次数',
  `i_freq_record_all_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内大金融(银行、保险、非银行)行业下所有事件中的记录条数',
  `i_freq_weekday_Loan_Unconsumerfinance_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内一般消费分期行业下贷款事件中发生在工作日的次数',
  `m_freq_weekday_Loan_Unconsumerfinance_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内一般消费分期行业下贷款事件中发生在工作日的次数',
  `i_cnt_ipaddress_all_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内IP地址的不同个数',
  `i_freq_day_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内全行业下所有事件中发生在白天的次数',
  `i_freq_policy_Accept_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内所有策略集中包含Accept的次数',
  `m_freq_policy_Review_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内所有策略集中包含Review的次数',
  `m_freq_record_Loan_Imbank_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内非银行类金融行业下贷款事件中的记录条数',
  `m_freq_record_all_Imbank_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内非银行类金融行业下所有事件中的记录条数',
  `i_freq_record_Loan_con_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内消费金融行业下贷款事件中的记录条数',
  `m_freq_record_Loan_con_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内消费金融行业下贷款事件中的记录条数',
  `i_freq_record_Loan_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内P2P网贷行业下贷款事件中的记录条数',
  `i_ratio_freq_risk_Reject_all_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内所有风险集中包含Reject的次数所占比例',
  `m_ratio_freq_policy_Reject_all_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内所有策略集中包含Reject的次数所占比例',
  `m_ratio_freq_policy_Reject_all_all_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的90天内所有策略集中包含Reject的次数所占比例',
  `m_ratio_freq_policy_Reject_all_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的30天内所有策略集中包含Reject的次数所占比例',
  `i_freq_policy_Accept_all_all_30day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的30天内所有策略集中包含Accept的次数',
  `m_cnt_creditcardAPPinstl_Gen_Gen_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内通用行业下通用事件中信用卡类app安装数量',
  `m_cnt_node_reject_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联借款事件的拒绝数',
  `m_cnt_node_dist2_card_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号二度关联节点银行卡数',
  `m_mean_freq_node_seq_partner_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联平均每个合作方的借款事件数',
  `m_ratio_cnt_partner_Loan_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内大金融(银行、保险、非银行)行业下贷款事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_ratio_freq_record_all_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内P2P网贷行业下所有事件中的记录条数占相应时间下所有记录条数的比例',
  `i_cnt_partner_Loan_P2pweb_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内P2P网贷行业下贷款事件中的不同平台个数',
  `i_cnt_partner_Loan_Imbank_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内非银行类金融行业下贷款事件中的不同平台个数',
  `m_mean_distance_grp_black_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联社群节点到黑名单的平均距离',
  `i_freq_record_Loan_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内全行业下贷款事件中的记录条数',
  `m_cnt_partner_Loan_Imbank_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内非银行类金融行业下贷款事件中的不同平台个数',
  `i_length_first_all_con_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的90天内消费金融行业下所有事件中第一条记录距测试间时间的天数',
  `m_cnt_ipaddresscity_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内ip地址解析城市的不同个数',
  `i_freq_mobileaddresscity_all_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内手机号解析城市字段出现的次数',
  `m_cnt_partner_all_finance_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内大金融(银行、保险、非银行)行业下所有事件中的不同平台个数',
  `m_ratio_freq_record_Loan_P2pweb_60day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的60天内P2P网贷行业下贷款事件中的记录条数占相应时间下所有记录条数的比例',
  `i_freq_record_Loan_finance_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内大金融(银行、保险、非银行)行业下贷款事件中的记录条数',
  `m_mean_freq_grp_seq_partner_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联社群节点平均每个合作方的借款事件数',
  `m_freq_record_Register_Imbank_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内非银行类金融行业下注册事件中的记录条数',
  `m_freq_record_Register_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内大金融(银行、保险、非银行)行业下注册事件中的记录条数',
  `i_ratio_freq_record_all_P2pweb_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的90天内P2P网贷行业下所有事件中的记录条数占相应时间下所有记录条数的比例',
  `i_cnt_partner_Loan_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内P2P网贷行业下贷款事件中的不同平台个数',
  `i_freq_record_Loan_Imbank_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内非银行类金融行业下贷款事件中的记录条数',
  `i_cnt_partner_Loan_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内大金融(银行、保险、非银行)行业下贷款事件中的不同平台个数',
  `m_length_first_all_con_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的90天内消费金融行业下所有事件中第一条记录距测试间时间的天数',
  `m_cnt_partner_Loan_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内P2P网贷行业下贷款事件中的不同平台个数',
  `m_length_first_all_P2pweb_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内P2P网贷行业下所有事件中第一条记录距测试间时间的天数',
  `m_freq_day_all_Imbank_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内非银行类金融行业下所有事件中发生在白天的次数',
  `m_ratio_cnt_partner_Register_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内全行业下注册事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_cnt_grp_total_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联社群节点总数',
  `i_ratio_freq_weekday_Loan_con_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内消费金融行业下贷款事件中发生在工作日的次数的比例',
  `i_freq_record_Loan_Unconsumerfinance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内一般消费分期行业下贷款事件中的记录条数',
  `i_cnt_partner_Loan_finance_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内大金融(银行、保险、非银行)行业下贷款事件中的不同平台个数',
  `m_mean_length_event_all_con_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的180天内消费金融行业下所有事件中所有记录的平均时长(相应时间内所有记录最大间隔时间除以记录条数减1)',
  `m_freq_weekday_Register_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内全行业下注册事件中发生在工作日的次数',
  `i_freq_record_Loan_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内大金融(银行、保险、非银行)行业下贷款事件中的记录条数',
  `m_ratio_cnt_partner_all_Unconsumerfinance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内一般消费分期行业下所有事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_cnt_partner_all_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内大金融(银行、保险、非银行)行业下所有事件中的不同平台个数',
  `i_cnt_partner_Loan_Imbank_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内非银行类金融行业下贷款事件中的不同平台个数',
  `i_freq_canvas_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内帆布指纹字段出现的次数',
  `m_ratio_freq_record_all_Offloan_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内线下小额贷款行业下所有事件中的记录条数占相应时间下所有记录条数的比例',
  `i_ratio_freq_policy_Accept_all_all_90day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的90天内所有策略集中包含Accept的次数所占比例',
  `i_cnt_partner_all_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内P2P网贷行业下所有事件中的不同平台个数',
  `m_length_first_all_finance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内大金融(银行、保险、非银行)行业下所有事件中第一条记录距测试间时间的天数',
  `m_freq_record_Register_P2pweb_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内P2P网贷行业下注册事件中的记录条数',
  `i_freq_record_Loan_Offloan_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内线下小额贷款行业下贷款事件中的记录条数',
  `i_cnt_partner_Loan_Unconsumerfinance_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内一般消费分期行业下贷款事件中的不同平台个数',
  `m_cnt_partner_Loan_Imbank_60day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的60天内非银行类金融行业下贷款事件中的不同平台个数',
  `m_length_first_all_Imbank_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内非银行类金融行业下所有事件中第一条记录距测试间时间的天数',
  `m_ratio_cnt_partner_Loan_Imbank_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内非银行类金融行业下贷款事件中的不同平台个数占相应时间下所有不同平台个数的比例',
  `m_cnt_node_seq_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联借款事件数',
  `i_cnt_partner_Loan_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的365天内全行业下贷款事件中的不同平台个数',
  `i_cnt_partner_Loan_all_180day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证关联到的180天内全行业下贷款事件中的不同平台个数',
  `m_cnt_grp_partner_Loan_all_all` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联社群节点借款事件的合作方数',
  `m_freq_browser_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号关联到的365天内浏览器字段出现的次数',
  `m_ratio_freq_policy_Accept_all_all_365day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 407979 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同盾接口结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040201_xy_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd040201_xy_basic`;
CREATE TABLE `imd040201_xy_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `success` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应状态',
  `error_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜行为雷达基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040201_xy_result
-- ----------------------------
DROP TABLE IF EXISTS `imd040201_xy_result`;
CREATE TABLE `imd040201_xy_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份ID',
  `code` int(1) NULL DEFAULT NULL COMMENT '查询结果代码',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询结果描述',
  `trans_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户请求订单号',
  `trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否收费',
  `id_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `versions` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `loans_score` int(8) NULL DEFAULT NULL COMMENT '贷款行为分',
  `loans_credibility` int(8) NULL DEFAULT NULL COMMENT '贷款行为置信度',
  `loans_count` int(8) NULL DEFAULT NULL COMMENT '贷款放款总订单数',
  `loans_settle_count` int(8) NULL DEFAULT NULL COMMENT '贷款已结清订单数',
  `loans_overdue_count` int(8) NULL DEFAULT NULL COMMENT '贷款逾期订单数（M0+）',
  `loans_org_count` int(8) NULL DEFAULT NULL COMMENT '贷款机构数',
  `consfin_org_count` int(8) NULL DEFAULT NULL COMMENT '消费金融类机构数',
  `loans_cash_count` int(8) NULL DEFAULT NULL COMMENT '网络贷款类机构数',
  `latest_one_month` int(8) NULL DEFAULT NULL COMMENT '近1个月贷款笔数',
  `latest_three_month` int(8) NULL DEFAULT NULL COMMENT '近3个月贷款笔数',
  `latest_six_month` int(8) NULL DEFAULT NULL COMMENT '近6个月贷款笔数',
  `history_suc_fee` int(8) NULL DEFAULT NULL COMMENT '历史贷款机构成功扣款笔数',
  `history_fail_fee` int(8) NULL DEFAULT NULL COMMENT '历史贷款机构失败扣款笔数',
  `latest_one_month_suc` int(8) NULL DEFAULT NULL COMMENT '近1个月贷款机构成功扣款笔数',
  `latest_one_month_fail` int(8) NULL DEFAULT NULL COMMENT '近1个月贷款机构失败扣款笔数',
  `loans_long_time` int(8) NULL DEFAULT NULL COMMENT '信用贷款时长',
  `loans_latest_time` date NULL DEFAULT NULL COMMENT '最近一次贷款时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜行为雷达结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040202_xy_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd040202_xy_basic`;
CREATE TABLE `imd040202_xy_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `success` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应状态',
  `error_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜小额网贷基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040202_xy_result
-- ----------------------------
DROP TABLE IF EXISTS `imd040202_xy_result`;
CREATE TABLE `imd040202_xy_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份ID',
  `code` int(1) NULL DEFAULT NULL COMMENT '查询结果代码',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询结果描述',
  `trans_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户请求订单号',
  `trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否收费',
  `id_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `versions` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `xy_100001` int(8) NULL DEFAULT NULL COMMENT '分数',
  `xy_100002` int(8) NULL DEFAULT NULL COMMENT '本业务最大授信额度',
  `xy_100003` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本业务平均授信额度',
  `xy_100004` int(8) NULL DEFAULT NULL COMMENT '本业务近1个月贷款笔数',
  `xy_100005` int(8) NULL DEFAULT NULL COMMENT '本业务近3个月贷款笔数',
  `xy_100006` int(8) NULL DEFAULT NULL COMMENT '本业务近6个月贷款笔数',
  `xy_100007` int(8) NULL DEFAULT NULL COMMENT '本业务贷款总笔数',
  `xy_100008` int(8) NULL DEFAULT NULL COMMENT '本业务贷款机构数',
  `xy_100009` int(8) NULL DEFAULT NULL COMMENT '本业务最近一次贷款距今天数',
  `xy_100010` int(8) NULL DEFAULT NULL COMMENT '本业务贷款已结清笔数',
  `xy_100011` int(8) NULL DEFAULT NULL COMMENT '本业务贷款逾期订单数（M0+）',
  `xy_100012` int(8) NULL DEFAULT NULL COMMENT '本业务贷款逾期订单数（M1+）',
  `xy_100013` int(8) NULL DEFAULT NULL COMMENT '查询多头机构数',
  `xy_100014` int(8) NULL DEFAULT NULL COMMENT '总查询次数',
  `xy_100015` int(8) NULL DEFAULT NULL COMMENT '最近查询时间距今天数',
  `xy_100016` int(8) NULL DEFAULT NULL COMMENT '近1个月查询多头',
  `xy_100017` int(8) NULL DEFAULT NULL COMMENT '近3个月查询多头',
  `xy_100018` int(8) NULL DEFAULT NULL COMMENT '近6个月查询多头',
  `xy_100019` int(8) NULL DEFAULT NULL COMMENT '贷款已结清笔数',
  `xy_100020` int(8) NULL DEFAULT NULL COMMENT '贷款逾期订单数（M0+）',
  `xy_100021` int(8) NULL DEFAULT NULL COMMENT '贷款逾期订单数（M1+）',
  `xy_100022` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近1个月工作日全部产品非逾期借贷在总借贷中金额占比',
  `xy_100023` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近6个月全部时间全部产品非逾期借贷在总借贷中订单数占比',
  `xy_100024` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近3个月全部时间消费金融类在全部产品中借贷确定逾期订单数占比',
  `xy_100025` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近一年新增平台全部时间全部产品最大借贷费率',
  `xy_100026` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近12个月全部时间超短期现金贷平均借贷费率',
  `xy_100027` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近半年新增平台全部时间全部产品平均借贷确定逾期平台数',
  `xy_100028` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近20次全部时间全部产品最大借贷疑似逾期天数',
  `xy_100029` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近3次工作日全部产品平均借贷疑似逾期天数',
  `xy_100030` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近一年新增平台全部时间全部产品平均还款疑似逾期天数',
  `xy_100031` int(8) NULL DEFAULT NULL COMMENT '最近3个月全部时间全部产品最大还款疑似逾期天数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜小额网贷结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040203_xy_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd040203_xy_basic`;
CREATE TABLE `imd040203_xy_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `success` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应状态',
  `error_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜消费分期基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040203_xy_result
-- ----------------------------
DROP TABLE IF EXISTS `imd040203_xy_result`;
CREATE TABLE `imd040203_xy_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份ID',
  `code` int(1) NULL DEFAULT NULL COMMENT '查询结果代码',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询结果描述',
  `trans_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户请求订单号',
  `trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否收费',
  `id_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `versions` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `xy_140001` int(8) NULL DEFAULT NULL COMMENT '分数',
  `xy_140002` int(8) NULL DEFAULT NULL COMMENT '本业务最大授信额度',
  `xy_140003` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本业务平均授信额度',
  `xy_140004` int(8) NULL DEFAULT NULL COMMENT '本业务近1个月贷款笔数',
  `xy_140005` int(8) NULL DEFAULT NULL COMMENT '本业务近3个月贷款笔数',
  `xy_140006` int(8) NULL DEFAULT NULL COMMENT '本业务近6个月贷款笔数',
  `xy_140007` int(8) NULL DEFAULT NULL COMMENT '本业务贷款总笔数',
  `xy_140008` int(8) NULL DEFAULT NULL COMMENT '本业务贷款机构数',
  `xy_140009` int(8) NULL DEFAULT NULL COMMENT '本业务最近一次贷款距今天数',
  `xy_140010` int(8) NULL DEFAULT NULL COMMENT '本业务贷款已结清笔数',
  `xy_140011` int(8) NULL DEFAULT NULL COMMENT '本业务贷款逾期订单数（M0+）',
  `xy_140012` int(8) NULL DEFAULT NULL COMMENT '本业务贷款逾期订单数（M1+）',
  `xy_140013` int(8) NULL DEFAULT NULL COMMENT '查询多头机构数',
  `xy_140014` int(8) NULL DEFAULT NULL COMMENT '总查询次数',
  `xy_140015` int(8) NULL DEFAULT NULL COMMENT '最近查询时间距今天数',
  `xy_140016` int(8) NULL DEFAULT NULL COMMENT '近1个月查询多头',
  `xy_140017` int(8) NULL DEFAULT NULL COMMENT '近3个月查询多头',
  `xy_140018` int(8) NULL DEFAULT NULL COMMENT '近6个月查询多头',
  `xy_140019` int(8) NULL DEFAULT NULL COMMENT '贷款已结清笔数',
  `xy_140020` int(8) NULL DEFAULT NULL COMMENT '贷款逾期订单数（M0+）',
  `xy_140021` int(8) NULL DEFAULT NULL COMMENT '贷款逾期订单数（M1+）',
  `xy_140022` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近3个月全部时间超短期现金贷累计非逾期借贷费率',
  `xy_140023` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近3次全部时间超短期现金贷最大非逾期借贷费率',
  `xy_140024` int(8) NULL DEFAULT NULL COMMENT '最近12个月工作日全部产品累计借贷疑似逾期天数',
  `xy_140025` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近3次全部时间超短期现金贷平均借贷费率',
  `xy_140026` int(8) NULL DEFAULT NULL COMMENT '最近3个月全部时间超短期现金贷距离非逾期还款最小金额距今天数',
  `xy_140027` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近3个月新增平台全部时间全部产品平均还款金额',
  `xy_140028` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近3次全部时间全部产品最小还款金额`',
  `xy_140029` int(8) NULL DEFAULT NULL COMMENT '最近1个月工作日全部产品累计非逾期还款平台数',
  `xy_140030` int(8) NULL DEFAULT NULL COMMENT '最近10次全部时间全部产品最大还款疑似逾期天数',
  `xy_140031` int(8) NULL DEFAULT NULL COMMENT '最近3个月全部时间全部产品距离非逾期还款最小金额距今天数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99033 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜消费分期结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040204_xy_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd040204_xy_basic`;
CREATE TABLE `imd040204_xy_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `success` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应状态',
  `error_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜小额分期基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd040204_xy_result
-- ----------------------------
DROP TABLE IF EXISTS `imd040204_xy_result`;
CREATE TABLE `imd040204_xy_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份ID',
  `code` int(1) NULL DEFAULT NULL COMMENT '查询结果代码',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询结果描述',
  `trans_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户请求订单号',
  `trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否收费',
  `id_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `versions` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `xy_110001` int(8) NULL DEFAULT NULL COMMENT '分数',
  `xy_110002` int(8) NULL DEFAULT NULL COMMENT '本业务最大授信额度',
  `xy_110003` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本业务平均授信额度',
  `xy_110004` int(8) NULL DEFAULT NULL COMMENT '本业务近1个月贷款笔数',
  `xy_110005` int(8) NULL DEFAULT NULL COMMENT '本业务近3个月贷款笔数',
  `xy_110006` int(8) NULL DEFAULT NULL COMMENT '本业务近6个月贷款笔数',
  `xy_110007` int(8) NULL DEFAULT NULL COMMENT '本业务贷款总笔数',
  `xy_110008` int(8) NULL DEFAULT NULL COMMENT '本业务贷款机构数',
  `xy_110009` int(8) NULL DEFAULT NULL COMMENT '本业务最近一次贷款距今天数',
  `xy_110010` int(8) NULL DEFAULT NULL COMMENT '本业务贷款已结清笔数',
  `xy_110011` int(8) NULL DEFAULT NULL COMMENT '本业务贷款逾期订单数（M0+）',
  `xy_110012` int(8) NULL DEFAULT NULL COMMENT '本业务贷款逾期订单数（M1+）',
  `xy_110013` int(8) NULL DEFAULT NULL COMMENT '查询多头机构数',
  `xy_110014` int(8) NULL DEFAULT NULL COMMENT '总查询次数',
  `xy_110015` int(8) NULL DEFAULT NULL COMMENT '最近查询时间距今天数',
  `xy_110016` int(8) NULL DEFAULT NULL COMMENT '近1个月查询多头',
  `xy_110017` int(8) NULL DEFAULT NULL COMMENT '近3个月查询多头',
  `xy_110018` int(8) NULL DEFAULT NULL COMMENT '近6个月查询多头',
  `xy_110019` int(8) NULL DEFAULT NULL COMMENT '贷款已结清笔数',
  `xy_110020` int(8) NULL DEFAULT NULL COMMENT '贷款逾期订单数（M0+）',
  `xy_110021` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款逾期订单数（M1+）',
  `xy_110022` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近6个月全部时间短期现金贷在全部产品中借贷疑似逾期天数占比',
  `xy_110023` decimal(16, 6) NULL DEFAULT NULL COMMENT '最近12个月全部时间全部产品非逾期还款在总还款中订单数占比',
  `xy_110024` int(8) NULL DEFAULT NULL COMMENT '最近3次工作日全部产品最大借贷疑似逾期天数',
  `xy_110025` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近3次全部时间全部产品最大还款金额',
  `xy_110026` int(8) NULL DEFAULT NULL COMMENT '最近一年新增平台全部时间全部产品最大还款疑似逾期天数',
  `xy_110027` int(8) NULL DEFAULT NULL COMMENT '最近10次全部时间全部产品累计还款疑似逾期天数',
  `xy_110028` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近20次全部时间全部产品平均还款金额',
  `xy_110029` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近一年新增平台全部时间短期现金贷累计非逾期还款金额',
  `xy_110030` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近一年新增平台工作日短期现金贷累计还款金额',
  `xy_110031` int(8) NULL DEFAULT NULL COMMENT '最近5次全部时间全部产品最大还款疑似逾期天数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新颜小额分期结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd042601_apply_basic
-- ----------------------------
DROP TABLE IF EXISTS `imd042601_apply_basic`;
CREATE TABLE `imd042601_apply_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(16) NULL DEFAULT NULL COMMENT '状态码',
  `msg` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码描述',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE,
  INDEX `index_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集奥基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for imd042601_apply_result
-- ----------------------------
DROP TABLE IF EXISTS `imd042601_apply_result`;
CREATE TABLE `imd042601_apply_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商',
  `Rscode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码',
  `ECLcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误状态码',
  `GEO_SCORE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分',
  `CDXX001` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上线下行为指数',
  `CDDT000` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共债指数',
  `CDDT001` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_总次数',
  `CDDT002` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_平台数',
  `CDDT003` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_总次数',
  `CDDT004` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_平台数',
  `CDDT005` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_总次数_非银行_近360天',
  `CDDT006` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_平台数_非银行_近360天',
  `CDDT007` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_总次数_非银行_近360天',
  `CDDT008` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_平台数_非银行_近360天',
  `CDDT009` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_最早时间',
  `CDDT010` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款_平台数与注册_平台数比值',
  `CDDT011` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款_最近时间',
  `CDDT012` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款_最近时间_非银行',
  `CDDT013` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款_最早时间',
  `CDDT014` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款_最早时间_非银行',
  `CDDT015` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款时间间隔的波动指数_近180天',
  `CDDT016` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款时间平均周期',
  `CDDT017` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款时间平均周期_非银行',
  `CDDT018` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款时间最短间隔',
  `CDDT019` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_平台数与注册_平台数比值',
  `CDDT020` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_平台数与注册_平台数比值_非银行',
  `CDDT021` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_总次数与注册_总次数比值_非银行',
  `CDDT022` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_最大金额区间',
  `CDDT023` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_最近时间',
  `CDDT024` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_最近时间_非银行',
  `CDDT025` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请_最早时间_非银行',
  `CDDT026` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间间隔的标准差',
  `CDDT027` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间间隔的波动指数',
  `CDDT028` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间间隔的波动指数_非银行_近180天',
  `CDDT029` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间间隔的平均周期',
  `CDDT030` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间间隔的平均周期_非银行',
  `CDDT031` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间最短间隔',
  `CDDT032` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间最长间隔',
  `CDDT033` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请时间最长间隔_非银行',
  `CDDT034` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同一平台放款时间平均周期_近180天',
  `CDDT035` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同一平台申请时间间隔的平均周期',
  `CDDT036` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同一平台申请时间间隔的平均周期_非银行',
  `CDDT037` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同一平台申请时间最短间隔',
  `CDDT038` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最近时间',
  `CDDT039` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最近时间_非银行',
  `CDDT040` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最近时间_非银行_近360天',
  `CDDT041` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最近时间_银行',
  `CDDT042` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最早时间',
  `CDDT043` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最早时间_非银行',
  `CDDT044` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最早时间_非银行_近180天',
  `CDDT045` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最早时间_非银行_近360天',
  `CDDT046` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最早时间_近180天',
  `CDDT047` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册_最早时间_银行',
  `CDDT048` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的标准差',
  `CDDT049` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的标准差_非银行_近30天',
  `CDDT050` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的标准差_近30天',
  `CDDT051` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_非银行',
  `CDDT052` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_非银行_近30天',
  `CDDT053` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_非银行_近60天',
  `CDDT054` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_非银行_近90天',
  `CDDT055` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_非银行_近180天',
  `CDDT056` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_非银行_近360天',
  `CDDT057` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的波动指数_近30天',
  `CDDT058` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的平均周期',
  `CDDT059` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的平均周期_非银行',
  `CDDT060` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的平均周期_非银行_近180天',
  `CDDT061` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的平均周期_非银行_近360天',
  `CDDT062` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的平均周期_近180天',
  `CDDT063` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间间隔的平均周期_近360天',
  `CDDT064` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最短间隔',
  `CDDT065` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最短间隔_非银行',
  `CDDT066` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最长间隔',
  `CDDT067` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最长间隔_非银行',
  `CDDT068` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最长间隔_非银行_近360天',
  `CDDT069` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最长间隔_近360天',
  `CDDT070` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间最长间隔_银行',
  `CDZC017` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总资产等级',
  `CDZC002` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近1年大额资产累计时长等级',
  `CDZC003` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近1个月日均资产等级',
  `CDZC004` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产为1500-3000的天数范围',
  `CDZC005` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近半年资产波动率',
  `CDZC006` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近9个月透支支出意愿',
  `CDZC007` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近1个月日均资产波动率',
  `CDZC008` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节假日日均出账金额等级',
  `CDZC009` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近1个月节假日日均入账频度等级',
  `CDZC010` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日均资产等级',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 405792 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集奥结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ivd052301_apply_basic
-- ----------------------------
DROP TABLE IF EXISTS `ivd052301_apply_basic`;
CREATE TABLE `ivd052301_apply_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `bank_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `id_prod` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品代号',
  `code_res` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码中文',
  `service_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `flag_test` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要素验证标识',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询是否成功,成功为1，失败为0',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '成功查询时是否有记录，有记录为1，无记录为0',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行卡核查基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ivd052301_apply_result
-- ----------------------------
DROP TABLE IF EXISTS `ivd052301_apply_result`;
CREATE TABLE `ivd052301_apply_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `code_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证返回码',
  `msg_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证返回码描述',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行卡核查结果明细表 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for report_image_mapping
-- ----------------------------
DROP TABLE IF EXISTS `report_image_mapping`;
CREATE TABLE `report_image_mapping`  (
  `image_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `report_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ins_time` datetime(0) NULL DEFAULT NULL,
  `code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`image_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf010701_zrfinscore_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf010701_zrfinscore_basic`;
CREATE TABLE `waf010701_zrfinscore_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `cell_phone_num` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `keytype` int(11) NULL DEFAULT NULL COMMENT '证件类型',
  `result_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求相应编码',
  `result_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求响应说明',
  `transaction_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ZRobot对于每一次请求返回的业务流水号，后续用于对账',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '金融行为标签数字解读查询接口基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf010701_zrfinscore_result
-- ----------------------------
DROP TABLE IF EXISTS `waf010701_zrfinscore_result`;
CREATE TABLE `waf010701_zrfinscore_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `fb_score` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被查询人借贷行为评分',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504382 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '金融行为标签数字解读查询接口结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf02zz03_loan_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf02zz03_loan_basic`;
CREATE TABLE `waf02zz03_loan_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用于定义系统内的独立报告',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `status` int(11) NULL DEFAULT NULL COMMENT '0表示okay1表示',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码的详情',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询标识，1成功0失败',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '数据有效标识，1有效0无效',
  `time_inqt` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们到系统查询报告的时间',
  `time_rect` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们接收到报告的时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用于记录我们更改该条数据的时间',
  `merId` int(8) NULL DEFAULT 0 COMMENT '商户ID',
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `phone_index`(`phone`) USING BTREE,
  INDEX `cust_id_index`(`cust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内部网贷爬虫基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf02zz03_loan_result
-- ----------------------------
DROP TABLE IF EXISTS `waf02zz03_loan_result`;
CREATE TABLE `waf02zz03_loan_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique person ID ',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique file ID ',
  `plat_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'define the code of website ',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apply_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'family address ',
  `loan_amt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'loan amount ',
  `overdue_days` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'number of overdue days ',
  `overdue_frequency` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'number of overdue ',
  `overdue_amt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'amount of overdue ',
  `loan_type` int(11) NULL DEFAULT NULL COMMENT 'status of loan ',
  `plat_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'the name of plat ',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT 'publish time ',
  `crawl_time` datetime(0) NULL DEFAULT NULL COMMENT 'crawl time ',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time ',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT 'Update Time ',
  `status` int(1) NULL DEFAULT NULL COMMENT '0 ok 1 not ok ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99905 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内部网贷爬虫结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf02zz04_loan_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf02zz04_loan_basic`;
CREATE TABLE `waf02zz04_loan_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'o2o爬虫基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf02zz04_loan_result
-- ----------------------------
DROP TABLE IF EXISTS `waf02zz04_loan_result`;
CREATE TABLE `waf02zz04_loan_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `primary_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '哈希序列，唯一标识该条记录',
  `province` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `category` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别：1.担保2:贷款3:其他',
  `loan_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款类别，1：房产贷款；2：汽车贷款；3：应急贷款；4：企业贷款；5：个人贷款；6：其他',
  `district` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '存储某一网站查得的失信条数',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地址',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fixed_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务介绍',
  `plat_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站编码:数据来源',
  `web_name` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `vali_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间:yyyy-mm-ddhh:mm:ss，更新时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间,yyyy-mm-ddhh:mm:ss',
  `key_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `note1` datetime(0) NULL DEFAULT NULL COMMENT '备注1',
  `note2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注2',
  `note3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注3',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'o2o爬虫结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz01_loan_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz01_loan_basic`;
CREATE TABLE `waf03zz01_loan_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用于定义系统内的独立报告',
  `merId` int(8) NULL DEFAULT 0,
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号 ',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名 ',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 ',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息 ',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识 ',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识 ',
  `time_inqt` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们到系统查询报告的时间',
  `time_rect` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们接收到报告的时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们更改该条数据的时间',
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老赖爬虫基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz01_loan_result
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz01_loan_result`;
CREATE TABLE `waf03zz01_loan_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `total_attention` int(11) NULL DEFAULT NULL COMMENT '关注人数',
  `num_breakfaith` int(11) NULL DEFAULT NULL COMMENT '失信条数',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `sex` tinyint(2) NULL DEFAULT NULL COMMENT '性别',
  `total_case` int(11) NULL DEFAULT NULL COMMENT '总案件数',
  `total_report` int(11) NULL DEFAULT NULL COMMENT '总报告书',
  `website_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `case_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案件号',
  `case_time` datetime(0) NULL DEFAULT NULL COMMENT '案件时间',
  `case_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案件标题',
  `case_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案件类型',
  `data_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据情况',
  `is_update` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否更新过',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `crawl_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14825 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老赖爬虫结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz02_gamble_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz02_gamble_basic`;
CREATE TABLE `waf03zz02_gamble_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '赌博类爬虫基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz02_gamble_result
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz02_gamble_result`;
CREATE TABLE `waf03zz02_gamble_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `total_shot_num` int(22) NULL DEFAULT NULL,
  `dubo_shot_num` int(22) NULL DEFAULT NULL,
  `cp_shot_num` int(22) NULL DEFAULT NULL,
  `qp_shot_num` int(22) NULL DEFAULT NULL,
  `db_shot_num` int(22) NULL DEFAULT NULL,
  `high_shot_num` int(22) NULL DEFAULT 0 COMMENT '高风险平台个数',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `plat_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  `plat_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `crawl_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9439325 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '赌博类爬虫结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz03_rcvdcode_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz03_rcvdcode_basic`;
CREATE TABLE `waf03zz03_rcvdcode_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态0表示okay，1表示 not okay',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码的详情',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'scp接码平台类爬虫基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz03_rcvdcode_result
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz03_rcvdcode_result`;
CREATE TABLE `waf03zz03_rcvdcode_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `primary_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '哈希序列，唯一标识该条记录',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `plat_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站编码:数据来源',
  `crawl_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间,yyyy-mm-ddhh:mm:ss',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT 'yyyy-mm-ddhh:mm:ss',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'scp接码平台类爬虫结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz04_altnumber_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz04_altnumber_basic`;
CREATE TABLE `waf03zz04_altnumber_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态0表示okay，1表示 not okay',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码的详情',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小号类爬虫基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz04_altnumber_result
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz04_altnumber_result`;
CREATE TABLE `waf03zz04_altnumber_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `primary_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '哈希序列，唯一标识该条记录',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `plat_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站编码:数据来源：X00001:ali_info',
  `crawl_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间,yyyy-mm-ddhh:mm:ss',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT 'yyyy-mm-ddhh:mm:ss',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小号类爬虫结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz05_tel_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz05_tel_basic`;
CREATE TABLE `waf03zz05_tel_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态0表示okay，1表示 not okay',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码的详情',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_time_inst`(`time_inst`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电话类爬虫基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz05_tel_result
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz05_tel_result`;
CREATE TABLE `waf03zz05_tel_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `telno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一主键',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fixed_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `phone_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark_num` int(11) NULL DEFAULT NULL COMMENT '标记数量',
  `instruction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明文本',
  `bad_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不良原因编码',
  `plat_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台编码',
  `web_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `vali_time` datetime(0) NULL DEFAULT NULL COMMENT '验证时间',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250334 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电话类爬虫结果明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz07_sol_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz07_sol_basic`;
CREATE TABLE `waf03zz07_sol_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态0表示okay，1表示 not okay',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码的详情',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网贷名单基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf03zz07_sol_result
-- ----------------------------
DROP TABLE IF EXISTS `waf03zz07_sol_result`;
CREATE TABLE `waf03zz07_sol_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `primary_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '哈希序列，唯一标识该条记录',
  `fixed_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `qq_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `bank_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `pay_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝号',
  `address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `school` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `nick_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `plat_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bad_flag` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不良原因编码',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间,yyyy-mm-ddhh:mm:ss',
  `crawl_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间,yyyy-mm-ddhh:mm:ss',
  `jrjt_del_dt` datetime(0) NULL DEFAULT NULL COMMENT '删除时间,yyyy-mm-ddhh:mm:ss',
  `apply_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `loan_amt` double(32, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `overdue_days` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '违约天数',
  `overdue_frequency` int(16) NULL DEFAULT NULL COMMENT '违约次数',
  `overdue_amt` double(32, 2) NULL DEFAULT NULL COMMENT '违约金额',
  `loan_status` int(1) NULL DEFAULT NULL COMMENT '违约状态：1-预期违约，2-已还清',
  `plat_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网贷名单结果信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf04zz01_register_platfom_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf04zz01_register_platfom_basic`;
CREATE TABLE `waf04zz01_register_platfom_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `err_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应码',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '响应信息',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大平台注册基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf04zz01_register_platfom_result
-- ----------------------------
DROP TABLE IF EXISTS `waf04zz01_register_platfom_result`;
CREATE TABLE `waf04zz01_register_platfom_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `total` int(10) NULL DEFAULT NULL COMMENT '总平台数',
  `tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台tag',
  `is_apply` int(1) NULL DEFAULT NULL COMMENT '命中详情，1：命中；0：未命中；2：请求异常',
  `platform_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21832607 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大平台注册结果信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf05zz01_wechat_query_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf05zz01_wechat_query_basic`;
CREATE TABLE `waf05zz01_wechat_query_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `status` int(1) NULL DEFAULT NULL COMMENT '0-成功，1-失败',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `result` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回结果',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信搜索添加手机号basic表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf05zz01_wechat_result
-- ----------------------------
DROP TABLE IF EXISTS `waf05zz01_wechat_result`;
CREATE TABLE `waf05zz01_wechat_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `wechat_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `district` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `signature` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名',
  `platform` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别，0-男，1-女，2-不确定',
  `is_apply` int(1) NULL DEFAULT NULL COMMENT '是否注册，0-否，1-是',
  `account_state` int(1) NULL DEFAULT NULL COMMENT '账号是否异常，0-否，1-是',
  `crawal_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 833943 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信搜索结果信息表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf05zz02_alipay_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf05zz02_alipay_basic`;
CREATE TABLE `waf05zz02_alipay_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `status` int(1) NULL DEFAULT NULL COMMENT '0-成功，1-失败',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `result` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回结果',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝搜索基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf05zz02_alipay_result
-- ----------------------------
DROP TABLE IF EXISTS `waf05zz02_alipay_result`;
CREATE TABLE `waf05zz02_alipay_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name_num` int(10) NULL DEFAULT NULL COMMENT '姓名数量',
  `is_apply` int(1) NULL DEFAULT NULL COMMENT '是否注册',
  `notice` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户提示信息',
  `acc_state` int(1) NULL DEFAULT NULL COMMENT '是否账号异常',
  `crawal_time` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3429642 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝搜索结果信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_bill_detail`;
CREATE TABLE `waf09zz01_bill_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `month` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单月份',
  `call_pay` decimal(20, 2) NULL DEFAULT NULL COMMENT '当月话费',
  `pay_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际缴纳费用',
  `package_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '套餐及固定费用',
  `msg_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '额外套餐费-短信',
  `tel_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '额外套餐费-通话',
  `net_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '额外套餐费-流量',
  `additional_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '增值业务费',
  `preferential_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠费',
  `generation_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '代收费',
  `other_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他费用',
  `otherspaid_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '代付费',
  `score` int(10) NULL DEFAULT NULL COMMENT '当月积分',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pk_info`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ' 运营商爬虫账单信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_bill_record
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_bill_record`;
CREATE TABLE `waf09zz01_bill_record`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键 ',
  `fee_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用名称 ',
  `fee_category` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用类别 ',
  `fee_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额 ',
  `user_number` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户号码',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8572992 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫账单信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_call_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_call_detail`;
CREATE TABLE `waf09zz01_call_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `month_call` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话月份',
  `way` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通换方式',
  `location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话地点',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话类型',
  `time` int(10) NULL DEFAULT NULL COMMENT '通话时长',
  `start` datetime(0) NULL DEFAULT NULL COMMENT '通话开始时间',
  `number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话号码',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '通话费用',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `special_offer` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐优惠',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_info`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫通话信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_call_detail2
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_call_detail2`;
CREATE TABLE `waf09zz01_call_detail2`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `month_call` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话月份',
  `way` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通换方式',
  `location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话地点',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话类型',
  `time` int(10) NULL DEFAULT NULL COMMENT '通话时长',
  `start` datetime(0) NULL DEFAULT NULL COMMENT '通话开始时间',
  `number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话号码',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '通话费用',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `special_offer` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐优惠',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫通话信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_call_detail2_compressed
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_call_detail2_compressed`;
CREATE TABLE `waf09zz01_call_detail2_compressed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month_call` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话月份',
  `way` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通换方式',
  `location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话地点',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话类型',
  `time` int(10) NULL DEFAULT NULL COMMENT '通话时长',
  `start` datetime(0) NULL DEFAULT NULL COMMENT '通话开始时间',
  `number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话号码',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '通话费用',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `special_offer` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐优惠',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2609851952 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫通话信息详情表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf09zz01_camot_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_camot_detail`;
CREATE TABLE `waf09zz01_camot_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的独立报告',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `month_count` int(12) NULL DEFAULT NULL COMMENT '有通话记录月份数',
  `miss_month_count` int(12) NULL DEFAULT NULL COMMENT '通话记录获取失败月份数',
  `no_call_month` int(12) NULL DEFAULT NULL COMMENT '无通话记录月份数',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用接口传入user_id',
  `month_list` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话记录月份采集结果集合',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们更改该条数据的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫语音月份信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_combo_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_combo_detail`;
CREATE TABLE `waf09zz01_combo_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于定义系统内的独立报告',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_start_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单起始日',
  `bill_end_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单结束日',
  `item` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐项目名称',
  `total` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐项目总量',
  `used` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐项目已使用量',
  `unit` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐项目单位',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们插入该条数据的时间',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '用于记录我们更改该条数据的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1103686 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫套餐信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_family_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_family_detail`;
CREATE TABLE `waf09zz01_family_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亲情网编号',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亲情网手机号码',
  `short_num` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短号',
  `mobile_city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属地',
  `member_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成员类型',
  `join_time` date NULL DEFAULT NULL COMMENT '加入日期',
  `expire_time` date NULL DEFAULT NULL COMMENT '失效日期',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pk_info`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫亲情网详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_model_result
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_model_result`;
CREATE TABLE `waf09zz01_model_result`  (
  `id_pk` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_matchkey` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_dp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `res_num` double NULL DEFAULT NULL,
  `res_chr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `segment` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `res_impvar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_valid` int(11) NULL DEFAULT NULL,
  `time_dtupd` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_upd` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_pk`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `search_id_index`(`id_matchkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_net_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_net_detail`;
CREATE TABLE `waf09zz01_net_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `month` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `flow_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量类型',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `flow_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量名称',
  `total_time` int(11) NULL DEFAULT NULL COMMENT '时长',
  `rat_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通信类型',
  `net_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量类型',
  `up_traffic` decimal(10, 2) NULL DEFAULT NULL COMMENT '上传流量',
  `down_traffic` decimal(10, 2) NULL DEFAULT NULL COMMENT '下载流量',
  `total_traffic` decimal(15, 2) NULL DEFAULT NULL COMMENT '总流量',
  `client_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地ip',
  `access_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问ip',
  `user_agent` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器标示',
  `web_site` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问网址',
  `domain_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pk_info`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫上网记录详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_netflow_detail_compressed
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_netflow_detail_compressed`;
CREATE TABLE `waf09zz01_netflow_detail_compressed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `total_size` int(10) NULL DEFAULT NULL COMMENT '总条数',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '通信费',
  `net_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络类型',
  `net_way` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上网方式',
  `preferential_fee` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠项/套餐',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '起始时间',
  `total_time` int(10) NULL DEFAULT NULL COMMENT '总时长',
  `total_traffic` decimal(15, 2) NULL DEFAULT NULL COMMENT '总流量',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `trade_addr` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通信地点',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4739113380 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫流量使用详情表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf09zz01_operator_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_operator_basic`;
CREATE TABLE `waf09zz01_operator_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `idNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的ID（与传给抓取服务的一致）',
  `outUniqueId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户唯一标识id',
  `authChannel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传入的授权渠道',
  `notifyUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器异步通知页面路径',
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `emergencyName1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergencyRelation1` enum('father，mother，spouse，brother，sister，children，friend，colleague，other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人关系',
  `emergencyPhone1` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人手机号',
  `emergencyName2` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergencyRelation2` enum('father，mother，spouse，brother，sister，children，friend，colleague，other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人关系',
  `emergencyPhone2` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人手机号',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '返回代码',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述信息',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询的账户名',
  `search_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询ID',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `accountType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抓取类型',
  `errorReasonDetail` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只有运营商在抓取失败的情况下会返回此字段',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `flag_serve` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `search_id_index`(`search_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_operator_summary
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_operator_summary`;
CREATE TABLE `waf09zz01_operator_summary`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `contact_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他联系人号码',
  `type_operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商类型',
  `time_crawl` datetime(0) NULL DEFAULT NULL COMMENT '爬取时间',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone_remain` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前账户余额',
  `date_innet` date NULL DEFAULT NULL COMMENT '入网时间',
  `acc_point` int(10) NULL DEFAULT NULL COMMENT '积分',
  `acc_level` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户星级',
  `flag_cert` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否实名认证',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户状态',
  `pkg_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前套餐名称',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `age_net` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫基本信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_operator_variables
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_operator_variables`;
CREATE TABLE `waf09zz01_operator_variables`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `search_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flag_valid` int(11) NULL DEFAULT NULL,
  `flag_qry` int(11) NULL DEFAULT NULL,
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  `num_1cct2mw4ww` int(10) NULL DEFAULT NULL,
  `num_1cct1mw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mw2ww` int(10) NULL DEFAULT NULL,
  `num_1cct00w2wc` int(10) NULL DEFAULT NULL,
  `num_1cct1mdwwc` int(10) NULL DEFAULT NULL,
  `num_1cct3dw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct3mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1cct3mw6wc` int(10) NULL DEFAULT NULL,
  `num_1cct7dwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct3mw6ww` int(10) NULL DEFAULT NULL,
  `num_1cct00w1wc` int(10) NULL DEFAULT NULL,
  `num_1cct4mwwww` int(10) NULL DEFAULT NULL,
  `num_1cct2mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1cct6mw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct3mw2ww` int(10) NULL DEFAULT NULL,
  `num_1cctwwwwwc10` int(10) NULL DEFAULT NULL,
  `num_1cct1dw2wc` int(10) NULL DEFAULT NULL,
  `num_1cct00wwwc` int(10) NULL DEFAULT NULL,
  `num_1cct00w6wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mdwww` int(10) NULL DEFAULT NULL,
  `num_1cct7ddwww` int(10) NULL DEFAULT NULL,
  `num_1cct3mw2wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mwwwc` int(10) NULL DEFAULT NULL,
  `num_1cctwwhwwc` int(10) NULL DEFAULT NULL,
  `num_1cct1dw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct1dw6ww` int(10) NULL DEFAULT NULL,
  `num_1cct2mw6ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mw5ww` int(10) NULL DEFAULT NULL,
  `num_1cct7dw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct1mw6wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mw4ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct2mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1cct1mdwww` int(10) NULL DEFAULT NULL,
  `num_1cct7dw6ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct1dwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct7dw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct1dw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dw2wc` int(10) NULL DEFAULT NULL,
  `num_1cctwwhwww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct4mdwwc` int(10) NULL DEFAULT NULL,
  `num_1cct1mw6ww` int(10) NULL DEFAULT NULL,
  `num_1cct3mwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct1mw4ww` int(10) NULL DEFAULT NULL,
  `num_1cct1mwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct3mwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct00wwww` int(10) NULL DEFAULT NULL,
  `num_1cct1mw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct7dw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct1mwwww` int(10) NULL DEFAULT NULL,
  `num_1cct7dw6wc` int(10) NULL DEFAULT NULL,
  `num_1cct7dw5ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dw6ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mdwwc` int(10) NULL DEFAULT NULL,
  `num_1cct6mwwww` int(10) NULL DEFAULT NULL,
  `num_1cct1mwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct6mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1cct7dw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct3mw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct2mw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct2mwwww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw2ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct3mw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct3mwwww` int(10) NULL DEFAULT NULL,
  `num_1cct1mw2wc` int(10) NULL DEFAULT NULL,
  `num_1cct3dw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct1dw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct2mw2wc` int(10) NULL DEFAULT NULL,
  `num_1cct4mwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct7dw2wc` int(10) NULL DEFAULT NULL,
  `num_1cct1mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1cct6mw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct7dw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct3dwwww` int(10) NULL DEFAULT NULL,
  `num_1cct4mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1cct2mw1ww` int(10) NULL DEFAULT NULL,
  `num_1cct1dwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct7dw4ww` int(10) NULL DEFAULT NULL,
  `num_1cct1mw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct3dw2ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dw1ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct2mw4wc` int(10) NULL DEFAULT NULL,
  `num_1cct3mdwwc` int(10) NULL DEFAULT NULL,
  `num_1cct3mw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct2mw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct1dwwww` int(10) NULL DEFAULT NULL,
  `num_1cct2mw5ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct4mwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct7dwwwc` int(10) NULL DEFAULT NULL,
  `num_1cctwwwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct00w5ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mw2wc` int(10) NULL DEFAULT NULL,
  `num_1cct1dwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct7dwwww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw1ww` int(10) NULL DEFAULT NULL,
  `num_1cct4mwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct00w3wc` int(10) NULL DEFAULT NULL,
  `num_1cct1mw1wc` int(10) NULL DEFAULT NULL,
  `num_1cct7dw1ww` int(10) NULL DEFAULT NULL,
  `num_1cctwwdwwc` int(10) NULL DEFAULT NULL,
  `num_1cct3mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1cct3dwwgw` int(10) NULL DEFAULT NULL,
  `num_1cctwwwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct1mw1ww` int(10) NULL DEFAULT NULL,
  `num_1cct2mw6wc` int(10) NULL DEFAULT NULL,
  `num_1cct00w6ww` int(10) NULL DEFAULT NULL,
  `num_1cct00w2ww` int(10) NULL DEFAULT NULL,
  `num_1cct00wwcw` int(10) NULL DEFAULT NULL,
  `num_1cct3mwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct7ddwwc` int(10) NULL DEFAULT NULL,
  `num_1cct3dw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw6wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1cct3dw6wc` int(10) NULL DEFAULT NULL,
  `num_1cctwwwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct00w4wc` int(10) NULL DEFAULT NULL,
  `num_1cct00w5wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct3mw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct00w3ww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw5ww` int(10) NULL DEFAULT NULL,
  `num_1cct2mw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct2mwwwc` int(10) NULL DEFAULT NULL,
  `num_1cct3dw4ww` int(10) NULL DEFAULT NULL,
  `num_1cct7dw2ww` int(10) NULL DEFAULT NULL,
  `num_1cct2mw2ww` int(10) NULL DEFAULT NULL,
  `num_1cct2mw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct1mw5ww` int(10) NULL DEFAULT NULL,
  `num_1cctwwwwwc30` int(10) NULL DEFAULT NULL,
  `num_1cct3mw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct1mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1cct00w4ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mhwwc` int(10) NULL DEFAULT NULL,
  `num_1cct6mw1ww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw4ww` int(10) NULL DEFAULT NULL,
  `num_1cct1dw3wc` int(10) NULL DEFAULT NULL,
  `num_1cct1mw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct6mw6wc` int(10) NULL DEFAULT NULL,
  `num_1cct6mhwww` int(10) NULL DEFAULT NULL,
  `num_1cct3dw5ww` int(10) NULL DEFAULT NULL,
  `num_1cct7dwwgw` int(10) NULL DEFAULT NULL,
  `num_1cct6mw5wc` int(10) NULL DEFAULT NULL,
  `num_1cct3mw4ww` int(10) NULL DEFAULT NULL,
  `num_1cctwwdwww` int(10) NULL DEFAULT NULL,
  `num_1cct3mdwww` int(10) NULL DEFAULT NULL,
  `num_1cct00w1ww` int(10) NULL DEFAULT NULL,
  `num_1cct4mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1cct1mwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct1mw2ww` int(10) NULL DEFAULT NULL,
  `num_1cctwwwwww` int(10) NULL DEFAULT NULL,
  `num_1cct3mw1ww` int(10) NULL DEFAULT NULL,
  `num_1cct3dwwcw` int(10) NULL DEFAULT NULL,
  `num_1cct6mw3ww` int(10) NULL DEFAULT NULL,
  `num_1cct3mw5ww` int(10) NULL DEFAULT NULL,
  `num_1cct4mdwww` int(10) NULL DEFAULT NULL,
  `num_1cct6mw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu00w6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu00w5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu00w4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu2mwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu00wwww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu00wwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu2mwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu3mwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu4mwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1dwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu00w2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu2mw2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu7dw2wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu4mwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1mwwwc` int(10) NULL DEFAULT NULL,
  `num_1sduwwwwwc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw2wc` int(10) NULL DEFAULT NULL,
  `num_1sduwwwwww` int(10) NULL DEFAULT NULL,
  `num_1sdu1mw1ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw3wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw5ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw5wc` int(10) NULL DEFAULT NULL,
  `num_1sdu6mw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw3ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw6ww` int(10) NULL DEFAULT NULL,
  `num_1sdu00w1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3mw2ww` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw4wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw4ww` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw1wc` int(10) NULL DEFAULT NULL,
  `num_1sdu3dw6wc` int(10) NULL DEFAULT NULL,
  `num_1sdu1dw6ww` int(10) NULL DEFAULT NULL,
  `num_1adu1dw3ww` double NULL DEFAULT NULL,
  `num_1adu1mw5ww` double NULL DEFAULT NULL,
  `num_1adu7dw6ww` double NULL DEFAULT NULL,
  `num_1adu1dw1wc` double NULL DEFAULT NULL,
  `num_1adu7dwwww` double NULL DEFAULT NULL,
  `num_1adu2mwwww` double NULL DEFAULT NULL,
  `num_1adu1mw4ww` double NULL DEFAULT NULL,
  `num_1adu3dw6wc` double NULL DEFAULT NULL,
  `num_1adu1mw6ww` double NULL DEFAULT NULL,
  `num_1adu3dw2ww` double NULL DEFAULT NULL,
  `num_1adu6mw6ww` double NULL DEFAULT NULL,
  `num_1adu1dw5ww` double NULL DEFAULT NULL,
  `num_1adu00w1wc` double NULL DEFAULT NULL,
  `num_1adu2mw2wc` double NULL DEFAULT NULL,
  `num_1aduwwwwwc` double NULL DEFAULT NULL,
  `num_1adu3mw4wc` double NULL DEFAULT NULL,
  `num_1adu3mw5wc` double NULL DEFAULT NULL,
  `num_1adu00w6wc` double NULL DEFAULT NULL,
  `num_1adu7dwwwc` double NULL DEFAULT NULL,
  `num_1adu1dw6wc` double NULL DEFAULT NULL,
  `num_1adu3mw1ww` double NULL DEFAULT NULL,
  `num_1adu3dw3ww` double NULL DEFAULT NULL,
  `num_1adu1mw1ww` double NULL DEFAULT NULL,
  `num_1adu00w4wc` double NULL DEFAULT NULL,
  `num_1adu3mw4ww` double NULL DEFAULT NULL,
  `num_1adu3dw5ww` double NULL DEFAULT NULL,
  `num_1adu3mw3ww` double NULL DEFAULT NULL,
  `num_1adu7dw1ww` double NULL DEFAULT NULL,
  `num_1adu7dw1wc` double NULL DEFAULT NULL,
  `num_1adu00w4ww` double NULL DEFAULT NULL,
  `num_1adu3mw6ww` double NULL DEFAULT NULL,
  `num_1adu3mwwww` double NULL DEFAULT NULL,
  `num_1adu2mw4wc` double NULL DEFAULT NULL,
  `num_1adu6mwwww` double NULL DEFAULT NULL,
  `num_1adu3mw2wc` double NULL DEFAULT NULL,
  `num_1adu00w2ww` double NULL DEFAULT NULL,
  `num_1adu1dw6ww` double NULL DEFAULT NULL,
  `num_1adu2mwwwc` double NULL DEFAULT NULL,
  `num_1adu2mw5ww` double NULL DEFAULT NULL,
  `num_1adu1dw5wc` double NULL DEFAULT NULL,
  `num_1adu7dw3ww` double NULL DEFAULT NULL,
  `num_1adu1dw4ww` double NULL DEFAULT NULL,
  `num_1adu7dw2wc` double NULL DEFAULT NULL,
  `num_1adu3dw5wc` double NULL DEFAULT NULL,
  `num_1adu00w1ww` double NULL DEFAULT NULL,
  `num_1adu2mw3wc` double NULL DEFAULT NULL,
  `num_1adu1mw2ww` double NULL DEFAULT NULL,
  `num_1adu6mwwwc` double NULL DEFAULT NULL,
  `num_1adu7dw6wc` double NULL DEFAULT NULL,
  `num_1adu3mw2ww` double NULL DEFAULT NULL,
  `num_1adu3mw5ww` double NULL DEFAULT NULL,
  `num_1adu3dw4wc` double NULL DEFAULT NULL,
  `num_1adu7dw4wc` double NULL DEFAULT NULL,
  `num_1adu6mw4ww` double NULL DEFAULT NULL,
  `num_1adu1dw3wc` double NULL DEFAULT NULL,
  `num_1adu3mwwwc` double NULL DEFAULT NULL,
  `num_1adu00w5wc` double NULL DEFAULT NULL,
  `num_1adu00wwwc` double NULL DEFAULT NULL,
  `num_1adu1mw2wc` double NULL DEFAULT NULL,
  `num_1adu2mw1wc` double NULL DEFAULT NULL,
  `num_1adu6mw2ww` double NULL DEFAULT NULL,
  `num_1adu3dw2wc` double NULL DEFAULT NULL,
  `num_1adu1mw4wc` double NULL DEFAULT NULL,
  `num_1adu3dw3wc` double NULL DEFAULT NULL,
  `num_1adu2mw2ww` double NULL DEFAULT NULL,
  `num_1adu4mwwwc` double NULL DEFAULT NULL,
  `num_1adu7dw2ww` double NULL DEFAULT NULL,
  `num_1adu3mw1wc` double NULL DEFAULT NULL,
  `num_1adu1mw3wc` double NULL DEFAULT NULL,
  `num_1adu3mw6wc` double NULL DEFAULT NULL,
  `num_1adu2mw6ww` double NULL DEFAULT NULL,
  `num_1adu3dw4ww` double NULL DEFAULT NULL,
  `num_1adu1mw6wc` double NULL DEFAULT NULL,
  `num_1adu1mw5wc` double NULL DEFAULT NULL,
  `num_1adu7dw4ww` double NULL DEFAULT NULL,
  `num_1adu3dw1ww` double NULL DEFAULT NULL,
  `num_1adu3dw1wc` double NULL DEFAULT NULL,
  `num_1adu2mw3ww` double NULL DEFAULT NULL,
  `num_1adu3mw3wc` double NULL DEFAULT NULL,
  `num_1adu00w3wc` double NULL DEFAULT NULL,
  `num_1adu6mw4wc` double NULL DEFAULT NULL,
  `num_1adu1mw1wc` double NULL DEFAULT NULL,
  `num_1adu6mw1ww` double NULL DEFAULT NULL,
  `num_1adu7dw5wc` double NULL DEFAULT NULL,
  `num_1adu1dw2wc` double NULL DEFAULT NULL,
  `num_1adu1mwwww` double NULL DEFAULT NULL,
  `num_1adu00w2wc` double NULL DEFAULT NULL,
  `num_1adu7dw5ww` double NULL DEFAULT NULL,
  `num_1adu00w5ww` double NULL DEFAULT NULL,
  `num_1adu2mw4ww` double NULL DEFAULT NULL,
  `num_1adu1dw4wc` double NULL DEFAULT NULL,
  `num_1adu00w6ww` double NULL DEFAULT NULL,
  `num_1adu3dwwwc` double NULL DEFAULT NULL,
  `num_1adu1mw3ww` double NULL DEFAULT NULL,
  `num_1adu1dw1ww` double NULL DEFAULT NULL,
  `num_1aduwwwwww` double NULL DEFAULT NULL,
  `num_1adu00wwww` double NULL DEFAULT NULL,
  `num_1adu2mw5wc` double NULL DEFAULT NULL,
  `num_1adu1dwwww` double NULL DEFAULT NULL,
  `num_1adu6mw2wc` double NULL DEFAULT NULL,
  `num_1adu1dwwwc` double NULL DEFAULT NULL,
  `num_1adu6mw3ww` double NULL DEFAULT NULL,
  `num_1adu00w3ww` double NULL DEFAULT NULL,
  `num_1adu6mw5ww` double NULL DEFAULT NULL,
  `num_1adu6mw1wc` double NULL DEFAULT NULL,
  `num_1adu2mw1ww` double NULL DEFAULT NULL,
  `num_1adu3dwwww` double NULL DEFAULT NULL,
  `num_1adu6mw6wc` double NULL DEFAULT NULL,
  `num_1adu1mwwwc` double NULL DEFAULT NULL,
  `num_1adu7dw3wc` double NULL DEFAULT NULL,
  `num_1adu3dw6ww` double NULL DEFAULT NULL,
  `num_1adu4mwwww` double NULL DEFAULT NULL,
  `num_1adu6mw3wc` double NULL DEFAULT NULL,
  `num_1adu6mw5wc` double NULL DEFAULT NULL,
  `num_1adu1dw2ww` double NULL DEFAULT NULL,
  `num_1adu2mw6wc` double NULL DEFAULT NULL,
  `num_1dda3dwwww` int(10) NULL DEFAULT NULL,
  `num_1dda7dwwww` int(10) NULL DEFAULT NULL,
  `num_1dda1mwwww` int(10) NULL DEFAULT NULL,
  `num_1dda3mwwww` int(10) NULL DEFAULT NULL,
  `num_1dda4mwwww` int(10) NULL DEFAULT NULL,
  `num_1dda6mwwww` int(10) NULL DEFAULT NULL,
  `num_1ddawwwwww` int(10) NULL DEFAULT NULL,
  `num_1dda3dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dda7dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dda1mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dda3mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dda4mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dda6mwwwc` int(10) NULL DEFAULT NULL,
  `num_1ddawwwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp1dwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp3dwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp7dwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp1mwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp3mwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp4mwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp6mwwww` int(10) NULL DEFAULT NULL,
  `num_1dcpwwwwww` int(10) NULL DEFAULT NULL,
  `num_1dcp1dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp3dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp7dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp1mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp2mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp3mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp4mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp6mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp1dwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp3dwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp7dwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp1mwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp2mwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp3mwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp4mwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcp6mwwwt` int(10) NULL DEFAULT NULL,
  `num_1dcpwwwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcp1dwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp3dwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp7dwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp1mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp2mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp3mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp4mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp6mwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcpwwwwwc10` int(10) NULL DEFAULT NULL,
  `num_1dcp1dwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp3dwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp7dwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp1mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp2mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp3mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp4mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcp6mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcpwwwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca1dwwww` int(10) NULL DEFAULT NULL,
  `num_1dca3dwwww` int(10) NULL DEFAULT NULL,
  `num_1dca7dwwww` int(10) NULL DEFAULT NULL,
  `num_1dca1mwwww` int(10) NULL DEFAULT NULL,
  `num_1dca3mwwww` int(10) NULL DEFAULT NULL,
  `num_1dca4mwwww` int(10) NULL DEFAULT NULL,
  `num_1dca6mwwww` int(10) NULL DEFAULT NULL,
  `num_1dcawwwwww` int(10) NULL DEFAULT NULL,
  `num_1dca1dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca3dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca7dwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca1mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca3mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca4mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca6mwwwc` int(10) NULL DEFAULT NULL,
  `num_1dcawwwwwc` int(10) NULL DEFAULT NULL,
  `num_1dca1dwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca3dwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca7dwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca1mwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca3mwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca4mwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca6mwwww10` int(10) NULL DEFAULT NULL,
  `num_1dcawwwwww10` int(10) NULL DEFAULT NULL,
  `num_1dca1dwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca3dwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca7dwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca1mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca3mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca4mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dca6mwwwc30` int(10) NULL DEFAULT NULL,
  `num_1dcawwwwwc30` int(10) NULL DEFAULT NULL,
  `num_1vcpemwwwc` double NULL DEFAULT NULL,
  `num_1vcpemwwww` double NULL DEFAULT NULL,
  `num_1vcpemwwwt` double NULL DEFAULT NULL,
  `num_1vctemwwww` double NULL DEFAULT NULL,
  `num_1vctemwwwt` double NULL DEFAULT NULL,
  `num_1vctemwwwc` double NULL DEFAULT NULL,
  `num_3ltdur` int(10) NULL DEFAULT NULL,
  `rto2_num_1adu1dw4wc_num_1adu1dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu1dw4ww_num_1adu1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu1dw6wc_num_1adu1dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu1dw6ww_num_1adu1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu1mw4wc_num_1adu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu1mw4ww_num_1adu1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu1mw6wc_num_1adu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu1mw6ww_num_1adu1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu2mw4wc_num_1adu2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu2mw4ww_num_1adu2mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu2mw6wc_num_1adu2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu2mw6ww_num_1adu2mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu3dw4wc_num_1adu3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu3dw4ww_num_1adu3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu3dw6wc_num_1adu3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu3dw6ww_num_1adu3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu3mw4wc_num_1adu3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu3mw4ww_num_1adu3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu3mw6wc_num_1adu3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu3mw6ww_num_1adu3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu6mw4wc_num_1adu6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu6mw4ww_num_1adu6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu6mw6wc_num_1adu6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu6mw6ww_num_1adu6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu7dw4wc_num_1adu7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu7dw4ww_num_1adu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1adu7dw6wc_num_1adu7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1adu7dw6ww_num_1adu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct00w1ww_num_1cct00wwww` double NULL DEFAULT NULL,
  `rto2_num_1cct00w2ww_num_1cct00wwww` double NULL DEFAULT NULL,
  `rto2_num_1cct00w3ww_num_1cct00wwww` double NULL DEFAULT NULL,
  `rto2_num_1cct00w4ww_num_1cct00wwww` double NULL DEFAULT NULL,
  `rto2_num_1cct00w5ww_num_1cct00wwww` double NULL DEFAULT NULL,
  `rto2_num_1cct00wwwc_num_1cct00wwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw1ww_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw1ww_num_1cct1mw1ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw1ww_num_1cct3dw1ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw1ww_num_1cct7dw1ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw2ww_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw2ww_num_1cct1mw2ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw2ww_num_1cct3dw2ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw2ww_num_1cct7dw2ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw3ww_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw3ww_num_1cct1mw3ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw3ww_num_1cct3dw3ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw3ww_num_1cct7dw3ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw4wc_num_1cct1dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw4ww_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw4ww_num_1cct1mw4ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw4ww_num_1cct3dw4ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw4ww_num_1cct7dw4ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw5ww_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw5ww_num_1cct1mw5ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw5ww_num_1cct3dw5ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw5ww_num_1cct7dw5ww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw6wc_num_1cct1dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1dw6ww_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwgw_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwgw_num_1cct1mwwgw` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwgw_num_1cct3dwwgw` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwgw_num_1cct7dwwgw` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwwc_num_1cct1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwwc_num_1cct3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwwc_num_1cct7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1dwwww_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mdwww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mdwww_num_1cct3mdwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mw4wc_num_1cct1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1mw4ww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mw5ww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mw6wc_num_1cct1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1mw6ww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mwwwc10_num_1cct1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1mwwwc30_num_1cct1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mwwww_num_1cct3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mwwww_num_1cct6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct1mwwww_num_1dda1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct2mw4wc_num_1cct2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct2mw4ww_num_1cct2mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct2mw6wc_num_1cct2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct2mw6ww_num_1cct2mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct2mwwwc10_num_1cct2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct2mwwwc30_num_1cct2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw1ww_num_1cct1mw1ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw1ww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw1ww_num_1cct7dw1ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw2ww_num_1cct1mw2ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw2ww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw2ww_num_1cct7dw2ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw3ww_num_1cct1mw3ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw3ww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw3ww_num_1cct7dw3ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw4wc_num_1cct3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw4ww_num_1cct1mw4ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw4ww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw4ww_num_1cct7dw4ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw5ww_num_1cct1mw5ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw5ww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw5ww_num_1cct7dw5ww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw6wc_num_1cct3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3dw6ww_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwwc_num_1cct1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwwc_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwwc_num_1cct7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwww_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3dwwww_num_1dda3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3mw4wc_num_1cct3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3mw4ww_num_1cct3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct3mw6wc_num_1cct3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct3mw6ww_num_1cct3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct6mhwww_num_1cct6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct6mw4wc_num_1cct6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct6mw4ww_num_1cct6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct6mw6wc_num_1cct6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct6mw6ww_num_1cct6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct6mwwwc10_num_1cct6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct6mwwwc30_num_1cct6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct7ddwww_num_1cct1mdwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7ddwww_num_1cct3mdwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7ddwww_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7dw4wc_num_1cct7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct7dw4ww_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7dw6wc_num_1cct7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct7dw6ww_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7dwwwc_num_1cct1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1cct7dwwwc_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7dwwww_num_1cct1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1cct7dwwww_num_1dda7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp1mwwwc10_num_1dcp1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp1mwwwc30_num_1dcp1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp1mwwwt_num_1dcp1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp1mwwww_num_1dcp3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp1mwwww_num_1dcp4mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp1mwwww_num_1dcp6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp2mwwwc10_num_1dcp2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp2mwwwc30_num_1dcp2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp2mwwwt_num_1dcp2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp3dwwww_num_1dcp1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp3dwwww_num_1dcp3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp3dwwww_num_1dcp4mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp3dwwww_num_1dcp6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp3dwwww_num_1dcp7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp3mwwwt_num_1dcp3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp4mwwwt_num_1dcp4mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp6mwwwc10_num_1dcp6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp6mwwwc30_num_1dcp6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp6mwwwt_num_1dcp6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp7dwwwt_num_1dcp7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1dcp7dwwww_num_1dcp1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp7dwwww_num_1dcp3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp7dwwww_num_1dcp4mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dcp7dwwww_num_1dcp6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dda1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dda3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1dda3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1dda7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu00wwwc_num_1sdu00wwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dw4wc_num_1sdu1dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dw4ww_num_1sdu1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dw6wc_num_1sdu1dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dw6ww_num_1sdu1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwwc_num_1sdu1dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwwc_num_1sdu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwwc_num_1sdu3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwwc_num_1sdu7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwww_num_1sdu1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwww_num_1sdu3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1dwwww_num_1sdu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1mw4wc_num_1sdu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1mw4ww_num_1sdu1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1mw6wc_num_1sdu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu1mw6ww_num_1sdu1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu1mwwwc_num_1dcp1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu2mw4wc_num_1sdu2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu2mw4ww_num_1sdu2mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu2mw6wc_num_1sdu2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu2mw6ww_num_1sdu2mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu2mwwwc_num_1dcp2mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dw4wc_num_1sdu3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dw4ww_num_1sdu3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dw6wc_num_1sdu3dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dw6ww_num_1sdu3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dwwwc_num_1sdu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dwwwc_num_1sdu3dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dwwwc_num_1sdu7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dwwww_num_1sdu1mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3dwwww_num_1sdu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3mw4wc_num_1sdu3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3mw4ww_num_1sdu3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3mw6wc_num_1sdu3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu3mw6ww_num_1sdu3mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu3mwwwc_num_1dcp3mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu4mwwwc_num_1dcp4mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu6mw4wc_num_1sdu6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu6mw4ww_num_1sdu6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu6mw6wc_num_1sdu6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu6mw6ww_num_1sdu6mwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu6mwwwc_num_1dcp6mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dw4wc_num_1sdu7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dw4ww_num_1sdu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dw6wc_num_1sdu7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dw6ww_num_1sdu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dwwwc_num_1dcp7dwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dwwwc_num_1sdu1mwwwc` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dwwwc_num_1sdu7dwwww` double NULL DEFAULT NULL,
  `rto2_num_1sdu7dwwww_num_1sdu1mwwww` double NULL DEFAULT NULL,
  `top_3mc1mt5cp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt5cpct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt5cpdu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc1mt10cp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt10cpct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt10cpdu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc1mt20cp` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt20cpct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt20cpdu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc3mt5cp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt5cpct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt5cpdu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc3mt10cp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt10cpct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt10cpdu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc3mt20cp` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt20cpct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt20cpdu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc1mt5ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt5cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt5cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc1mt10ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt10cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt10cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc1mt20ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt20cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc1mt20cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc3mt5ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt5cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt5cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc3mt10ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt10cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt10cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mc3mt20ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt20cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3sc3mt20cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mt1mt5ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3st1mt5cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3st1mt5cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mt1mt10ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3st1mt10cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3st1mt10cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3mt1mt20ca` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3st1mt20cact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_3st1mt20cadu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_3et3dcpct` double NULL DEFAULT NULL,
  `num_3et7dcpct` double NULL DEFAULT NULL,
  `num_3etm1cpct` double NULL DEFAULT NULL,
  `num_3etm3cpct` double NULL DEFAULT NULL,
  `num_3etm6cpct` double NULL DEFAULT NULL,
  `num_3va3mt1cpct` double NULL DEFAULT NULL,
  `num_3va3mt1cpdu` double NULL DEFAULT NULL,
  `num_3va6mt1cpct` double NULL DEFAULT NULL,
  `num_3va6mt1cpdu` double NULL DEFAULT NULL,
  `num_3va3mt1duct` double NULL DEFAULT NULL,
  `num_3va3mt1dudu` double NULL DEFAULT NULL,
  `num_3va6mt1duct` double NULL DEFAULT NULL,
  `num_3va6mt1dudu` double NULL DEFAULT NULL,
  `rto_3m1t1ctct` double NULL DEFAULT NULL,
  `rto_3m1t1dudu` double NULL DEFAULT NULL,
  `rto_3m1t1cact` double NULL DEFAULT NULL,
  `num_3va1mcpct` double NULL DEFAULT NULL,
  `num_3va1mcpdu` double NULL DEFAULT NULL,
  `num_3va1mcact` double NULL DEFAULT NULL,
  `num_3va1mcadu` double NULL DEFAULT NULL,
  `num_3va2mcpct` double NULL DEFAULT NULL,
  `num_3va2mcpdu` double NULL DEFAULT NULL,
  `num_3va2mcact` double NULL DEFAULT NULL,
  `num_3va2mcadu` double NULL DEFAULT NULL,
  `num_3va3mcpct` double NULL DEFAULT NULL,
  `num_3va3mcpdu` double NULL DEFAULT NULL,
  `num_3va3mcact` double NULL DEFAULT NULL,
  `num_3va3mcadu` double NULL DEFAULT NULL,
  `num_3va6mcpct` double NULL DEFAULT NULL,
  `num_3va6mcpdu` double NULL DEFAULT NULL,
  `num_3va6mcact` double NULL DEFAULT NULL,
  `num_3va6mcadu` double NULL DEFAULT NULL,
  `num_3vc1mcpct` double NULL DEFAULT NULL,
  `num_3vc1mcpdu` double NULL DEFAULT NULL,
  `num_3vc1mcact` double NULL DEFAULT NULL,
  `num_3vc1mcadu` double NULL DEFAULT NULL,
  `num_3vc2mcpct` double NULL DEFAULT NULL,
  `num_3vc2mcpdu` double NULL DEFAULT NULL,
  `num_3vc2mcact` double NULL DEFAULT NULL,
  `num_3vc2mcadu` double NULL DEFAULT NULL,
  `num_3vc3mcpct` double NULL DEFAULT NULL,
  `num_3vc3mcpdu` double NULL DEFAULT NULL,
  `num_3vc3mcact` double NULL DEFAULT NULL,
  `num_3vc3mcadu` double NULL DEFAULT NULL,
  `num_3vc6mcpct` double NULL DEFAULT NULL,
  `num_3vc6mcpdu` double NULL DEFAULT NULL,
  `num_3vc6mcact` double NULL DEFAULT NULL,
  `num_3vc6mcadu` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `search_id_index`(`search_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_payment_detail`;
CREATE TABLE `waf09zz01_payment_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `recharge_time` datetime(0) NULL DEFAULT NULL COMMENT '充值时间',
  `recharge_way` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值方式',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pk_info`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫缴费信息详情表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf09zz01_sms_detail
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_sms_detail`;
CREATE TABLE `waf09zz01_sms_detail`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `trade_way` int(1) NULL DEFAULT NULL COMMENT '短信状态',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方号码',
  `month` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信月份',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '通话费用',
  `location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话地点',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话类型',
  `special_offer` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐优惠',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `id_file_index`(`id_file`) USING BTREE,
  INDEX `time_inst_index`(`time_inst`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫短信记录详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf09zz01_sms_detail_compressed
-- ----------------------------
DROP TABLE IF EXISTS `waf09zz01_sms_detail_compressed`;
CREATE TABLE `waf09zz01_sms_detail_compressed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录ID',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `trade_way` int(1) NULL DEFAULT NULL COMMENT '短信状态',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方号码',
  `month` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信月份',
  `business_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '通话费用',
  `location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话地点',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话类型',
  `special_offer` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐优惠',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 695930025 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运营商爬虫短信记录详情表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for waf161002_apply_basic
-- ----------------------------
DROP TABLE IF EXISTS `waf161002_apply_basic`;
CREATE TABLE `waf161002_apply_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `code_res` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码',
  `msg_res` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态码中文',
  `flag_success` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求是否成功',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源是否成功',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询外部数据源成功时是否有内容',
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内部多头基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for waf161002_apply_result
-- ----------------------------
DROP TABLE IF EXISTS `waf161002_apply_result`;
CREATE TABLE `waf161002_apply_result`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pk_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录id',
  `reg_number` int(4) NULL DEFAULT NULL COMMENT '注册数',
  `last_3_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近3个月上线平台命中数',
  `high_risk_total` int(11) NULL DEFAULT 0 COMMENT '高风险平台命中数',
  `time_query` datetime(0) NULL DEFAULT NULL COMMENT '查询时间',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  `last_1_week_total` int(11) NULL DEFAULT 0 COMMENT '最近 1 周多头评分',
  `last_2_week_total` int(11) NULL DEFAULT 0 COMMENT '最近 2 周多头评分',
  `last_3_week_total` int(11) NULL DEFAULT 0 COMMENT '最近 3 周多头评分',
  `last_1_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 1 个月多头评分',
  `last_2_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 2 个月多头评分',
  `last_4_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 4 个月多头评分',
  `last_5_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 5 个月多头评分',
  `last_6_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 6 个月多头评分',
  `last_7_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 7 个月多头评分',
  `last_8_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 8 个月多头评分',
  `last_9_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 9 个月多头评分',
  `last_10_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 10 个月多头评分',
  `last_11_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 11 个月多头评分',
  `last_12_mon_total` int(11) NULL DEFAULT 0 COMMENT '最近 12 个月多头评分',
  PRIMARY KEY (`pk_info`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内部多头结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd08zz01_taobao_basic
-- ----------------------------
DROP TABLE IF EXISTS `wcd08zz01_taobao_basic`;
CREATE TABLE `wcd08zz01_taobao_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义系统内的单个独立用户',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merId` int(8) NULL DEFAULT 0,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的ID（与传给抓取服务的一致）',
  `out_uniqueId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户唯一标识id',
  `auth_channel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传入的授权渠道',
  `notify_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器异步通知页面路径',
  `return_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '返回代码',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述信息',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询的账户名',
  `search_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询ID',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `account_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抓取类型',
  `error_reason_detail` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只有运营商在抓取失败的情况下会返回此字段',
  `flag_valid` int(11) NULL DEFAULT NULL,
  `flag_qry` int(11) NULL DEFAULT NULL,
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '淘宝爬虫基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd08zz01_taobao_deliver_address
-- ----------------------------
DROP TABLE IF EXISTS `wcd08zz01_taobao_deliver_address`;
CREATE TABLE `wcd08zz01_taobao_deliver_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份ID',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话/手机',
  `is_default_address` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认地址',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '淘宝爬虫收货地址信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd08zz01_taobao_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wcd08zz01_taobao_order_detail`;
CREATE TABLE `wcd08zz01_taobao_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份ID',
  `order_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `seller_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家id',
  `seller_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `seller_shopname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `actual_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `phone_order` tinyint(11) NULL DEFAULT NULL COMMENT '是否手机订单',
  `transaction_time` datetime(0) NULL DEFAULT NULL COMMENT '成交时间',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `confirmation_time` datetime(0) NULL DEFAULT NULL COMMENT '确认时间',
  `receiver_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `receiver_telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人手机号',
  `receiver_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '淘宝爬虫订单信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd08zz01_taobao_order_product_detail
-- ----------------------------
DROP TABLE IF EXISTS `wcd08zz01_taobao_order_product_detail`;
CREATE TABLE `wcd08zz01_taobao_order_product_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份ID',
  `order_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品金额',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品原价',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '淘宝爬虫订单关联商品信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd08zz01_taobao_related_alipay
-- ----------------------------
DROP TABLE IF EXISTS `wcd08zz01_taobao_related_alipay`;
CREATE TABLE `wcd08zz01_taobao_related_alipay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份ID',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付宝余额',
  `total_profit` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额宝历史累计收益',
  `total_quotient` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额宝账户余额',
  `huabei_credit_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '花呗可用额度',
  `huabei_total_credit_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '花呗总额度',
  `zhifubao_account` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账户',
  `binding_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的手机号',
  `account_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账户类型',
  `verified_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝实名认证的姓名',
  `verified_id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝实名认证的身份证号',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '淘宝爬虫关联支付宝信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd08zz01_taobao_user_account
-- ----------------------------
DROP TABLE IF EXISTS `wcd08zz01_taobao_user_account`;
CREATE TABLE `wcd08zz01_taobao_user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份ID',
  `login_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝帐户名',
  `vip_level` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员等级',
  `buyer_credit` int(11) NULL DEFAULT NULL COMMENT '淘宝买家级别',
  `rate_summary` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '好评率',
  `score` int(11) NULL DEFAULT NULL COMMENT '淘气值',
  `recent_good_eval` int(11) NULL DEFAULT NULL COMMENT '最近6个月好评',
  `recent_neutral_eval` int(11) NULL DEFAULT NULL COMMENT '最近6个月中评',
  `recent_bad_eval` int(11) NULL DEFAULT NULL COMMENT '最近6个月差评',
  `total_good_eval` int(11) NULL DEFAULT NULL COMMENT '总共好评',
  `total_neutral_eval` int(11) NULL DEFAULT NULL COMMENT '总共中评',
  `total_bad_eval` int(11) NULL DEFAULT NULL COMMENT '总共差评',
  `vip_count` int(11) NULL DEFAULT NULL COMMENT '成长值',
  `star_level` int(11) NULL DEFAULT NULL COMMENT '购物评级',
  `sum_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '购物总金额',
  `count_orders` int(11) NULL DEFAULT NULL COMMENT '购物笔数',
  `count_days_bought` int(11) NULL DEFAULT NULL COMMENT '购买天数',
  `count_days_from_regi` int(11) NULL DEFAULT NULL COMMENT '注册天数',
  `account_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝会员名',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录邮箱',
  `binding_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定手机',
  `authentication` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已完成身份认证',
  `binding_weibo_account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的微博帐号',
  `binding_weibo_nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的微博昵称',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `division_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政区域编码',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `tianmao_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天猫账户',
  `tianmao_grade` int(11) NULL DEFAULT NULL COMMENT '天猫积分',
  `tianmao_vip_level` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天猫会员等级',
  `tianmao_credit_level` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天猫信誉评级',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '淘宝爬虫账户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_asset_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_asset_info`;
CREATE TABLE `wcd09zz01_jingdong_asset_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `treasure_available` decimal(10, 2) NULL DEFAULT NULL COMMENT '小金库可用金额',
  `finance` decimal(10, 2) NULL DEFAULT NULL COMMENT '理财金额',
  `property` decimal(10, 2) NULL DEFAULT NULL COMMENT '总资产',
  `wallet_available` decimal(10, 2) NULL DEFAULT NULL COMMENT '钱包可用余额',
  `income_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '理财总收益',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫资产信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_auth_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_auth_info`;
CREATE TABLE `wcd09zz01_jingdong_auth_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `auth_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证时间',
  `binding_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定手机',
  `auth_channel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证渠道',
  `financial_service` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '金融服务',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫实名信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_baitiao_bills
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_baitiao_bills`;
CREATE TABLE `wcd09zz01_jingdong_baitiao_bills`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `bill_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单编号',
  `bill_amount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单金额',
  `payed_amount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已支付金额',
  `refund_amount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款金额',
  `planed_amount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分期金额',
  `rest_plan_amount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '剩余可分期金额',
  `min_pay_amount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最低还款额',
  `bill_status` int(1) NULL DEFAULT NULL COMMENT '账单状态',
  `bill_date` datetime(0) NULL DEFAULT NULL COMMENT '账单日',
  `bill_limit_date` datetime(0) NULL DEFAULT NULL COMMENT '最后还款日期',
  `is_cur_bill` int(4) NULL DEFAULT NULL COMMENT '是否本月账单',
  `is_pay_day` int(4) NULL DEFAULT NULL COMMENT '是否在还款时间内',
  `is_overdue` int(4) NULL DEFAULT NULL COMMENT '是否逾期',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫白条账单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_baitiao_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_baitiao_info`;
CREATE TABLE `wcd09zz01_jingdong_baitiao_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `bt_credit_point` decimal(6, 2) NULL DEFAULT NULL COMMENT '白条信用分',
  `bt_overdraft` decimal(10, 2) NULL DEFAULT NULL COMMENT '白条欠款',
  `bt_quota` decimal(10, 2) NULL DEFAULT NULL COMMENT '白条额度',
  `bt_plus_quota` decimal(10, 2) NULL DEFAULT NULL COMMENT '白条可用额度',
  `is_overdue` int(1) NULL DEFAULT NULL COMMENT '白条是否逾期',
  `bt_overdue_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '白条逾期金额',
  `bt_withdraw_available` decimal(10, 2) NULL DEFAULT NULL COMMENT '白条可取现',
  `bt_growing_count` int(10) NULL DEFAULT NULL COMMENT '成长分',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫白条信息总览表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_baitiao_repay_history
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_baitiao_repay_history`;
CREATE TABLE `wcd09zz01_jingdong_baitiao_repay_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `bill_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单编号',
  `repayment_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款编号',
  `repayment_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款时间',
  `repayment_type` int(4) NULL DEFAULT NULL COMMENT '还款方式',
  `repayment_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款金额',
  `bill_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单名称',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `card_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫白条还款流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_bank_cards
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_bank_cards`;
CREATE TABLE `wcd09zz01_jingdong_bank_cards`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `card_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '京东银行卡id',
  `bank_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `tail_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尾号',
  `card_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡类型',
  `owner_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持卡人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫绑卡信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_basic
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_basic`;
CREATE TABLE `wcd09zz01_jingdong_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `out_uniqueId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用方生成的业务流水号',
  `auth_channel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权渠道',
  `notify_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器异步通知页面路径',
  `return_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面跳转同步通知页面路径',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回代码',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求状态',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询的账户名',
  `search_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询ID',
  `accoun_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抓取类型',
  `error_reason_detail` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败详细原因',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `index_basic_id_custc`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_jintiao_bills
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_jintiao_bills`;
CREATE TABLE `wcd09zz01_jingdong_jintiao_bills`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `total_quote` decimal(10, 2) NULL DEFAULT NULL COMMENT '金条总额度',
  `available_quote` decimal(10, 2) NULL DEFAULT NULL COMMENT '金条可用额度',
  `apply_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `apply_date` date NULL DEFAULT NULL COMMENT '借款日期',
  `current_repayment_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前已还金额',
  `over_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前逾期金额',
  `over_due_days` int(10) NULL DEFAULT NULL COMMENT '逾期天数',
  `plan_over_tm` int(10) NULL DEFAULT NULL COMMENT '逾期还款计划数',
  `refund_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `remain_capital` decimal(10, 2) NULL DEFAULT NULL COMMENT '剩余未还本金',
  `remain_terms` int(10) NULL DEFAULT NULL COMMENT '还款计划剩余期数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫金条账单信息总览表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_jintiao_repayment_history
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_jintiao_repayment_history`;
CREATE TABLE `wcd09zz01_jingdong_jintiao_repayment_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款编号',
  `repayment_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款金额',
  `repaymented_date` datetime(0) NULL DEFAULT NULL COMMENT '还款日期',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫金条还款历史表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_jintiao_repayment_plan
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_jintiao_repayment_plan`;
CREATE TABLE `wcd09zz01_jingdong_jintiao_repayment_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `bad_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否坏账 0：否，1：是',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '还款计划创建日期',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '总利息',
  `limit_repayment_date` datetime(0) NULL DEFAULT NULL COMMENT '最后还款日期',
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `over_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `over_due_days` int(10) NULL DEFAULT NULL COMMENT '逾期天数',
  `over_due_status` int(4) NULL DEFAULT NULL COMMENT '逾期状态 0：已结清，1：逾期，2：逾期已结清',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `refund_status` int(4) NULL DEFAULT NULL COMMENT '退款状态 0：未退款',
  `repayment_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还款金额',
  `repayment_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应还款状态 0：未还，2：已还',
  `repayment_period` int(4) NULL DEFAULT NULL COMMENT '还款期数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫金条还款计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_orders
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_orders`;
CREATE TABLE `wcd09zz01_jingdong_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `order_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `receiver` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额(商品总额)',
  `buy_way` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `order_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单来源',
  `receiver_addr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `receiver_post` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `receiver_fix_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `receiver_telephone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `receiver_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `invoice_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票类型',
  `invoice_header` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_content` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_orders_product
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_orders_product`;
CREATE TABLE `wcd09zz01_jingdong_orders_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `order_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `product_num` int(10) NULL DEFAULT NULL COMMENT '商品数量',
  `product_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_level1_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品一级目录',
  `product_level2_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品二级目录',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫订单商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_shopping_address
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_shopping_address`;
CREATE TABLE `wcd09zz01_jingdong_shopping_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `addr_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址id',
  `receiver` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `fixed_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `email_addr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `is_default_address` int(4) NULL DEFAULT NULL COMMENT '是否默认收货地址',
  `address_label` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址标签',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫收货地址信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd09zz01_jingdong_user_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd09zz01_jingdong_user_info`;
CREATE TABLE `wcd09zz01_jingdong_user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `login_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `set_login_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网页中用户设置的登录名',
  `nickname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `hobbies` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兴趣爱好',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `marriage` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `income` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月收入',
  `id_card` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `education` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教育程度',
  `industry` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业',
  `is_qq_bound` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否绑定QQ账号',
  `is_wechat_bound` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否绑定微信账号',
  `account_grade` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员级别',
  `account_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员类型',
  `jx_count` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '京享值',
  `is_plus_member` int(4) NULL DEFAULT NULL COMMENT 'PLUS会员',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT '系统插入记录时间',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '京东爬虫用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd10zz01_meituan_address_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd10zz01_meituan_address_info`;
CREATE TABLE `wcd10zz01_meituan_address_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  `gender` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人性别',
  `house_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋号',
  `latitude` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '美团订单收货信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd10zz01_meituan_basic
-- ----------------------------
DROP TABLE IF EXISTS `wcd10zz01_meituan_basic`;
CREATE TABLE `wcd10zz01_meituan_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部系统用户授权唯一性标志，由接入方token授权时指定',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爬虫系统一次授权唯一标识',
  `auth_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权状态1/0',
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权成功之后的跳转地址',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `auth_item` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权项',
  `auth_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权版本',
  `auth_time` datetime(0) NULL DEFAULT NULL COMMENT '授权时间',
  `search_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单号',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果状态',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果备注',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '美团基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd10zz01_meituan_group_order_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd10zz01_meituan_group_order_info`;
CREATE TABLE `wcd10zz01_meituan_group_order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单名',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单信息',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '美团团购订单记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd10zz01_meituan_order_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd10zz01_meituan_order_info`;
CREATE TABLE `wcd10zz01_meituan_order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `shop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '订单时间',
  `real_pay` decimal(10, 6) NULL DEFAULT NULL COMMENT '支付金额',
  `order_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `shop_mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家电话',
  `shop_image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家图标',
  `contact_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `contact_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人地址',
  `contact_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '美团外卖订单记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd10zz01_meituan_order_product
-- ----------------------------
DROP TABLE IF EXISTS `wcd10zz01_meituan_order_product`;
CREATE TABLE `wcd10zz01_meituan_order_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10, 6) NULL DEFAULT NULL COMMENT '商品单价',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '美团外卖商品记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd10zz01_meituan_user_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd10zz01_meituan_user_info`;
CREATE TABLE `wcd10zz01_meituan_user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '美团用户名',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '美团用户id',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `craw_time` datetime(0) NULL DEFAULT NULL COMMENT '记录采集日期',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '美团个人信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd11zz01_didi_baseinfo_result
-- ----------------------------
DROP TABLE IF EXISTS `wcd11zz01_didi_baseinfo_result`;
CREATE TABLE `wcd11zz01_didi_baseinfo_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名(未实名的用户返回为未实名)',
  `status` int(1) NULL DEFAULT NULL COMMENT '是否是本人账号 1是 0否',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话（脱敏）',
  `idCard` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户身份证(未实名的用户无此字段)',
  `company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户所在企业名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `gender` int(4) NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `level` int(4) NULL DEFAULT NULL COMMENT '用户级别',
  `level_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户级别描述',
  `balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '账户余额',
  `special_card_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '充值卡余额',
  `finance_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '理财余额',
  `debit` decimal(18, 2) NULL DEFAULT NULL COMMENT '借钱额度',
  `coin` int(10) NULL DEFAULT NULL COMMENT '滴滴的滴币余额',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '滴滴用户基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd11zz01_didi_basic
-- ----------------------------
DROP TABLE IF EXISTS `wcd11zz01_didi_basic`;
CREATE TABLE `wcd11zz01_didi_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部系统用户授权唯一性标志，由接入方token授权时指定',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爬虫系统一次授权唯一标识',
  `auth_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权状态1/0',
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权成功之后的跳转地址',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `auth_item` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权项',
  `auth_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权版本',
  `auth_time` datetime(0) NULL DEFAULT NULL COMMENT '授权时间',
  `search_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单号',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果状态',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果备注',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '滴滴基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd11zz01_didi_common_address_list_result
-- ----------------------------
DROP TABLE IF EXISTS `wcd11zz01_didi_common_address_list_result`;
CREATE TABLE `wcd11zz01_didi_common_address_list_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `addr_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用地址名称',
  `to_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用地址',
  `to_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用地址名',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚合toAddress和toName',
  `city_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `lat` float(10, 4) NULL DEFAULT NULL COMMENT '纬度',
  `lng` float(10, 4) NULL DEFAULT NULL COMMENT '经度',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '滴滴用户常用地址信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd11zz01_didi_invoice_list_result
-- ----------------------------
DROP TABLE IF EXISTS `wcd11zz01_didi_invoice_list_result`;
CREATE TABLE `wcd11zz01_didi_invoice_list_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '开票时间',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT '滴滴处理发票的时间',
  `invoice_value` decimal(18, 2) NULL DEFAULT NULL COMMENT '发票金额',
  `status` int(4) NULL DEFAULT NULL COMMENT '发票状态',
  `expressfee_type` int(4) NULL DEFAULT NULL COMMENT '邮费类型',
  `invoiceprint_type` int(4) NULL DEFAULT NULL COMMENT '发票出票类型',
  `recipient_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人姓名',
  `recipient_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人手机号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人省份',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人城市',
  `district_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人区县',
  `detailed_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人详细地址',
  `recipient_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收人邮箱',
  `invoice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `invoice_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票备注',
  `registeredaddress_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票上面打出来的的地址电话 购买方地址电话',
  `depositbank_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票上面打出来的 购买方开户行及账号',
  `earliestcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '发票包含的行程中，最早的行程时间',
  `latestcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '发票包含的行程中，最晚的行程时间',
  `express_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '快递费用',
  `invoice_count` int(10) NULL DEFAULT NULL COMMENT '发票数量',
  `order_count` int(10) NULL DEFAULT NULL COMMENT '发票包含的行程数量',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '滴滴用户发票记录结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd11zz01_didi_order_list_result
-- ----------------------------
DROP TABLE IF EXISTS `wcd11zz01_didi_order_list_result`;
CREATE TABLE `wcd11zz01_didi_order_list_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `pay_status` int(4) NULL DEFAULT NULL COMMENT '0未知/取消订单 1已付 2未付',
  `total_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '总费用（元）',
  `actualpay_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '实际付费（元）',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT ' 货币简写如 CNY',
  `status` int(4) NULL DEFAULT NULL COMMENT '订单状态',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `district` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区号',
  `from_area` int(10) NULL DEFAULT NULL COMMENT '地区编号',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单产品类型名',
  `product_type` int(4) NULL DEFAULT NULL COMMENT '订单产品类型',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '上车时间',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '订单结束时间',
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起始位置地址',
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起始位置名称',
  `to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终点位置地址',
  `to_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终点位置名称',
  `from_lng` float(10, 4) NULL DEFAULT NULL COMMENT '起始位置经度',
  `from_lat` float(10, 4) NULL DEFAULT NULL COMMENT '起始位置纬度',
  `to_lng` float(10, 4) NULL DEFAULT NULL COMMENT '终点位置经度',
  `to_lat` float(10, 4) NULL DEFAULT NULL COMMENT '终点位置纬度',
  `driver_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机名',
  `driver_company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机公司名',
  `driver_level` float(10, 4) NULL DEFAULT NULL COMMENT '司机评价等级',
  `license_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `car_title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆描述',
  `driverorder_cnt` int(10) NULL DEFAULT NULL COMMENT '司机接单数',
  `comment_level` int(4) NULL DEFAULT NULL COMMENT '对当前订单的评价',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '滴滴用户近3月出行记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_basic
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_basic`;
CREATE TABLE `wcd12zz01_alipay_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部系统用户授权唯一性标志，由接入方token授权时指定',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爬虫系统一次授权唯一标识',
  `auth_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权状态1/0',
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权成功之后的跳转地址',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `auth_item` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权项',
  `auth_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权版本',
  `auth_time` datetime(0) NULL DEFAULT NULL COMMENT '授权时间',
  `search_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单号',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果状态',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果备注',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_bill_details
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_bill_details`;
CREATE TABLE `wcd12zz01_alipay_bill_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `bill_month` datetime(0) NULL DEFAULT NULL COMMENT '账单月',
  `expend_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '支出金额',
  `expend_count` int(11) NULL DEFAULT NULL COMMENT '支出笔数',
  `income_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '收入金额',
  `income_count` int(11) NULL DEFAULT NULL COMMENT '收入笔数',
  `payable_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '待支出金额',
  `payable_count` int(11) NULL DEFAULT NULL COMMENT '待支出笔数',
  `receivable_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '待收入金额',
  `receivable_count` int(11) NULL DEFAULT NULL COMMENT '待收入笔数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝近六个月消费账单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_ecommerce_base_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_ecommerce_base_info`;
CREATE TABLE `wcd12zz01_alipay_ecommerce_base_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `alipay_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账户用户编号',
  `alipay_account_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账户类型',
  `alipay_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `taobao_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的淘宝账号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝处登记姓名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝处登记邮箱',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝处登记手机 ',
  `alipay_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '支付宝余额',
  `yuebao_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '余额宝余额',
  `alipay_registration_datetime` datetime(0) NULL DEFAULT NULL COMMENT '支付宝注册时间',
  `is_verified` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否实名认证',
  `huabei_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗额度(包含临时信用额度)',
  `huabei_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗余额',
  `huabei_penalty_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗的罚息',
  `huabei_status` int(2) NULL DEFAULT NULL COMMENT '花呗状态',
  `credit_levelas_buyer` int(11) NULL DEFAULT NULL COMMENT '作为买家信用额度',
  `credit_levelas_seller` int(11) NULL DEFAULT NULL COMMENT '作为卖家信用额度',
  `identity_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝处登记身份证号',
  `huabei_original_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗原始信用额度',
  `status` int(2) NULL DEFAULT NULL COMMENT '授权的人和实际抓取信息是否一致',
  `tao_score` int(10) NULL DEFAULT NULL COMMENT '淘气值',
  `balance_payment_enable` int(11) NULL DEFAULT NULL COMMENT '支付宝余额支付开关 ',
  `yuebao_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '余额宝累计收益',
  `tmall_score` int(11) NULL DEFAULT NULL COMMENT '天猫积分',
  `ant_member_score` int(11) NULL DEFAULT NULL COMMENT '蚂蚁会员积分',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝个人信息中邮编',
  `detail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝个人信息中详细地址',
  `weibo_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝绑定的微博账号',
  `weibo_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝绑定的微博妮称',
  `rate_summary_as_buyer` decimal(18, 2) NULL DEFAULT NULL COMMENT '买家好评率',
  `six_month_goodrate_as_buyer` int(8) NULL DEFAULT NULL COMMENT '近6个月买家好评数',
  `total_goodrate_as_buyer` int(8) NULL DEFAULT NULL COMMENT '总计买家好评数',
  `sixmonth_neutralrate_as_buyer` int(8) NULL DEFAULT NULL COMMENT '近6个月买家中评数',
  `total_neutralrate_as_buyer` int(8) NULL DEFAULT NULL COMMENT '总计买家中评数',
  `sixmonth_badrateas_buyer` int(8) NULL DEFAULT NULL COMMENT '近6个月买家差评数',
  `total_badrate_as_buyer` int(8) NULL DEFAULT NULL COMMENT '总计买家差评数',
  `rate_summary_as_seller` decimal(18, 2) NULL DEFAULT NULL COMMENT '卖家好评率',
  `six_month_good_rateas_seller` int(8) NULL DEFAULT NULL COMMENT '近6个月卖家好评数',
  `totalgoodrateas_seller` int(8) NULL DEFAULT NULL COMMENT '总计卖家好评数',
  `sixmonth_neutralrateas_seller` int(8) NULL DEFAULT NULL COMMENT '近6个月卖家中评数',
  `total_neutral_rateas_seller` int(8) NULL DEFAULT NULL COMMENT '总计卖家中评数',
  `six_month_badrateas_seller` int(8) NULL DEFAULT NULL COMMENT '近6个月卖家差评数',
  `total_badrate_as_seller` int(8) NULL DEFAULT NULL COMMENT '总计卖家差评数',
  `taobao_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝用户id',
  `taobao_img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝头像链接',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝用户基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_ecommerce_binded_bank_cards
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_ecommerce_binded_bank_cards`;
CREATE TABLE `wcd12zz01_alipay_ecommerce_binded_bank_cards`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `card_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡号后4位',
  `card_type` int(2) NULL DEFAULT NULL COMMENT '类型',
  `card_owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡持卡人姓名',
  `is_express` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开通快捷支付',
  `bank_sign` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行标示',
  `apply_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开通时间',
  `card_full_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `signid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡支付宝唯一标示',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑卡手机号',
  `bank_short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行缩写',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝绑卡信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_ecommerce_consignee_address
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_ecommerce_consignee_address`;
CREATE TABLE `wcd12zz01_alipay_ecommerce_consignee_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `receive_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址邮政编码',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `region` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址所在区域',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址唯一标示',
  `tel_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `trade_time` datetime(0) NULL DEFAULT NULL COMMENT '真实收货地址对应的最近交易时间',
  `trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实收货地址对应的最近交易号',
  `default_status` int(3) NULL DEFAULT NULL COMMENT '是否默认地址 ',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝收货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_ecommerce_payment_accounts
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_ecommerce_payment_accounts`;
CREATE TABLE `wcd12zz01_alipay_ecommerce_payment_accounts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费项目',
  `city` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `organization` varchar(34) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款单位',
  `account_name` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户名',
  `account_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费号码',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝水电缴费表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_ecommerce_trades_compressed
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_ecommerce_trades_compressed`;
CREATE TABLE `wcd12zz01_alipay_ecommerce_trades_compressed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物标题',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '金额',
  `trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `trade_time` datetime(0) NULL DEFAULT NULL COMMENT '交易时间',
  `trade_status_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易状态',
  `tx_type_id` int(6) NULL DEFAULT NULL COMMENT '交易类型id',
  `tx_type_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易类型',
  `behavior_lable_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行为标签',
  `trade_detail_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易详情URL',
  `other_side` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易对方',
  `other_side_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易对方账号',
  `other_side_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易对方姓名',
  `pay_type` int(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式是银行卡支付时展示银行以及卡号',
  `is_delete` int(3) NULL DEFAULT NULL COMMENT '是否被删除',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 973 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝交易记录表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_huabei_bills
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_huabei_bills`;
CREATE TABLE `wcd12zz01_alipay_huabei_bills`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `bill_month` datetime(0) NULL DEFAULT NULL COMMENT '账单月',
  `is_billed` int(4) NULL DEFAULT NULL COMMENT '是否已出账',
  `total_amount` decimal(18, 6) NULL DEFAULT NULL COMMENT '总欠款额度',
  `un_repay_amount` decimal(18, 6) NULL DEFAULT NULL COMMENT '未还款额度',
  `repay_date` datetime(0) NULL DEFAULT NULL COMMENT '还款日',
  `is_clear` int(4) NULL DEFAULT NULL COMMENT '是否还清',
  `is_over_due` int(4) NULL DEFAULT NULL COMMENT '是否逾期',
  `total_penalty` decimal(18, 6) NULL DEFAULT NULL COMMENT '总罚息',
  `mini_amount` decimal(18, 6) NULL DEFAULT NULL COMMENT '最小还款额',
  `has_history_ovd_bill` int(4) NULL DEFAULT NULL COMMENT '历史账单是否结清',
  `refund_amount` decimal(18, 6) NULL DEFAULT NULL COMMENT '退款金额',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝花呗月账单信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_huabei_consume
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_huabei_consume`;
CREATE TABLE `wcd12zz01_alipay_huabei_consume`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像标识',
  `amount` decimal(18, 6) NULL DEFAULT NULL COMMENT '额度变化金额',
  `type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '交易时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易名称',
  `trade_no` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `status` int(4) NULL DEFAULT NULL COMMENT '是否删除',
  `bill_month` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '花呗所在账单月',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝花呗支付记录信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_huabei_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_huabei_info`;
CREATE TABLE `wcd12zz01_alipay_huabei_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `huabei_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗额度',
  `huabei_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗余额',
  `huabei_original_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '花呗原始信用额度',
  `huabei_status` int(4) NULL DEFAULT NULL COMMENT '花呗状态',
  `huabei_penalty_amount` decimal(12, 6) NULL DEFAULT NULL COMMENT '花呗的罚息',
  `huabei_overdue_days` int(8) NULL DEFAULT NULL COMMENT '花呗的逾期天数',
  `huabei_pay_day` int(4) NULL DEFAULT NULL COMMENT '花呗还款日',
  `huabei_overdue_bill_cnt` int(10) NULL DEFAULT NULL COMMENT '当前用户花呗逾期账单数',
  `huabei_current_month_payment` decimal(18, 6) NULL DEFAULT NULL COMMENT '花呗当月还款额',
  `huabei_next_month_payment` decimal(18, 6) NULL DEFAULT NULL COMMENT '花呗下月还款额',
  `huabei_on_trial` int(4) NULL DEFAULT NULL COMMENT '新开放花呗试验标示',
  `huabei_has_any_overdue` int(4) NULL DEFAULT NULL COMMENT '花呗逾期标示',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝花呗信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_jiebei_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_jiebei_info`;
CREATE TABLE `wcd12zz01_alipay_jiebei_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `jiebei_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '借呗额度',
  `jiebei_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '借呗余额',
  `jiebei_risk_rate` decimal(12, 6) NULL DEFAULT NULL COMMENT '借呗日利率',
  `jiebei_ovd_able` int(4) NULL DEFAULT NULL COMMENT '借呗是否逾期',
  `jiebei_new_able` int(4) NULL DEFAULT NULL COMMENT '借呗是否新开(不确定)',
  `jiebei_is_closed` int(4) NULL DEFAULT NULL COMMENT '借呗是否关闭，1是0否',
  `jiebei_un_clear_loan_count` int(4) NULL DEFAULT NULL COMMENT '未还期数',
  `jiebei_status` int(4) NULL DEFAULT NULL COMMENT '用户是否有借呗',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝借呗信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_my_bank_asset_details
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_my_bank_asset_details`;
CREATE TABLE `wcd12zz01_alipay_my_bank_asset_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `trade_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '金额',
  `trade_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易类型',
  `trans_date` datetime(0) NULL DEFAULT NULL COMMENT '交易日期',
  `asset_detail_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情链接',
  `biz_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流水号',
  `asset_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金账号',
  `asset_account_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金账号类型(参考MyBankCardType)',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝网商贷近三个月资金明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_my_bank_bind_info
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_my_bank_bind_info`;
CREATE TABLE `wcd12zz01_alipay_my_bank_bind_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `we_bank_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网商贷用户Id',
  `we_bank_repay_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款账号',
  `we_bank_repay_account_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款账号类型(参考MyBankCardType)',
  `we_bank_total_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '网商贷总欠款额度',
  `we_bank_overdue_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '网商贷总逾期额度',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝网商贷绑定信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_my_bank_loan_details
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_my_bank_loan_details`;
CREATE TABLE `wcd12zz01_alipay_my_bank_loan_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `apply_date` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请渠道',
  `lend_detail_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借款详情链接',
  `loan_amt` decimal(18, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `loan_ar_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借款流水号',
  `loan_date` datetime(0) NULL DEFAULT NULL COMMENT '借款日期',
  `loan_pd_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借款产品',
  `loan_term` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借款总期数',
  `owner_phone_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借款人手机号',
  `repay_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款账号',
  `repay_account_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款账号类型(参考MyBankCardType)',
  `repay_mode_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款方式',
  `status_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝网商贷近一年借款明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_my_bank_repay_plan
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_my_bank_repay_plan`;
CREATE TABLE `wcd12zz01_alipay_my_bank_repay_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `fee_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '利息',
  `prin_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '本金',
  `total_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '总金额',
  `repay_account_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款账号',
  `repay_account_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款账号类型(参考MyBankCardType)',
  `repay_date` datetime(0) NULL DEFAULT NULL COMMENT '还款日期',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝网商贷近一年还款计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_taobao_orders_compressed
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_taobao_orders_compressed`;
CREATE TABLE `wcd12zz01_alipay_taobao_orders_compressed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `trade_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付交易号',
  `order_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `trade_status_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态',
  `trade_type_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '订单完成',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `total_quantity` int(11) NULL DEFAULT NULL COMMENT '商品总数量',
  `post_fees` decimal(10, 2) NULL DEFAULT NULL COMMENT '邮费',
  `actual_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `virtual_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否虚拟商品',
  `mobile_trade_status` int(3) NULL DEFAULT NULL COMMENT '是否手机订单 ',
  `address_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易地址ID',
  `company_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司编码',
  `company_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司名',
  `mail_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流号',
  `logistic_create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_time` date NULL DEFAULT NULL COMMENT '最新物流时间',
  `last_msg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新物流信息',
  `post_man_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派件员',
  `post_man_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派件员手机号',
  `post_man_site_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派件人所在网点',
  `shop_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝卖家id',
  `shop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `nick` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺昵称',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺链接',
  `pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺头像',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝淘宝订单表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_taobao_sold_orders
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_taobao_sold_orders`;
CREATE TABLE `wcd12zz01_alipay_taobao_sold_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `trade_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付交易号',
  `order_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `trade_status_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态',
  `trade_type_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '订单完成',
  `total_quantity` int(11) NULL DEFAULT NULL COMMENT '商品总数量',
  `post_fees` decimal(10, 2) NULL DEFAULT NULL COMMENT '邮费',
  `actual_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `address_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易地址id',
  `post` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `receive_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `buyer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝买家id',
  `nick` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝昵称',
  `phone_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `city` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `company_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司编码',
  `company_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司名',
  `mail_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流号',
  `logistic_create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT '最新物流时间',
  `last_msg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新物流信息',
  `post_man_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派件员',
  `post_man_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派件员手机号',
  `post_man_site_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派件人所在网点',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝卖家三个月淘宝订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_taobao_sold_sub_orders
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_taobao_sold_sub_orders`;
CREATE TABLE `wcd12zz01_alipay_taobao_sold_sub_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `trade_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付交易号',
  `order_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `item_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `item_remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易备注',
  `item_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `original` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `actual` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际金额',
  `item_pic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品图片',
  `item_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品链接',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝卖家三个月淘宝子订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_taobao_sub_orders
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_taobao_sub_orders`;
CREATE TABLE `wcd12zz01_alipay_taobao_sub_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `trade_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付交易号',
  `order_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `item_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `item_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `original` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `actual` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际金额',
  `item_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品图片',
  `item_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品链接',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝淘宝子订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wcd12zz01_alipay_transfer_bank_cards
-- ----------------------------
DROP TABLE IF EXISTS `wcd12zz01_alipay_transfer_bank_cards`;
CREATE TABLE `wcd12zz01_alipay_transfer_bank_cards`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名',
  `card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号后四位',
  `card_owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡持卡人姓名',
  `card_full_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整银行卡号',
  `bank_short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行缩写',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝银行转账储蓄卡信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wct03zz01_court_basic
-- ----------------------------
DROP TABLE IF EXISTS `wct03zz01_court_basic`;
CREATE TABLE `wct03zz01_court_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `status` int(1) NULL DEFAULT NULL COMMENT '0 okay，1 not okay',
  `err_msg` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态码的详情',
  `flag_valid` int(11) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(11) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本地法院类爬虫基本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wct03zz01_court_result
-- ----------------------------
DROP TABLE IF EXISTS `wct03zz01_court_result`;
CREATE TABLE `wct03zz01_court_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告ID',
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `primary_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `plat_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站编码',
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9191 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本地法院类爬虫结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_account_analysis
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_account_analysis`;
CREATE TABLE `wps13zz01_accumulate_found_account_analysis`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID',
  `newest_account` int(1) NULL DEFAULT NULL COMMENT '当前正常缴存公积金账号为1，其他为0',
  `cont_last_times` int(11) NULL DEFAULT NULL COMMENT '最近连续缴存月份数',
  `back_cont_last_times` int(11) NULL DEFAULT NULL COMMENT '最近连续缴存',
  `cont_max_times` int(11) NULL DEFAULT NULL COMMENT '连续缴存最多次数',
  `back_cont_max_times` int(11) NULL DEFAULT NULL COMMENT '连续缴存最多次数',
  `sum_times` int(11) NULL DEFAULT NULL COMMENT '总共缴存次数',
  `back_sum_times` int(11) NULL DEFAULT NULL COMMENT '总共缴存次数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金账号记录分析信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_base_info
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_base_info`;
CREATE TABLE `wps13zz01_accumulate_found_base_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `home_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `card_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号',
  `card_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `area_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市编号',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `personnal_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户号',
  `housefund_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金资金账号',
  `account_type` int(1) NULL DEFAULT NULL COMMENT '账户类型',
  `balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '包含公积金余额跟补贴余额',
  `fund_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '公积金余额',
  `subsidy_balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '补贴公积金余额',
  `corporation_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业账户号码',
  `corporation_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前缴存企业名称',
  `monthlycopration_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '企业月度缴存',
  `monthlypersonal_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人月度缴存',
  `subsidy_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '补贴月缴存',
  `monthlytotal_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '月度总缴存',
  `corporation_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '企业缴存比例',
  `personnal_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人缴存比例',
  `subsidycorporation_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '补贴公积金公司缴存比例',
  `subsidypersonal_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '补贴公积金个人缴存比例',
  `base_number` decimal(18, 2) NULL DEFAULT NULL COMMENT '缴存基数',
  `begin_date` datetime(0) NULL DEFAULT NULL COMMENT '开户日期',
  `deposit_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号状态',
  `is_useful` int(1) NULL DEFAULT NULL COMMENT '是否有效',
  `status` int(2) NULL DEFAULT NULL COMMENT '是否是本人',
  `has_supply` int(3) NULL DEFAULT NULL COMMENT '是否有补充公积金账号',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting  time  ',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金用户基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_basic
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_basic`;
CREATE TABLE `wps13zz01_accumulate_found_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部系统用户授权唯一性标志，由接入方token授权时指定',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爬虫系统一次授权唯一标识',
  `auth_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权状态1/0',
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权成功之后的跳转地址',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `auth_item` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权项',
  `auth_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权版本',
  `auth_time` datetime(0) NULL DEFAULT NULL COMMENT '授权时间',
  `search_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单号',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果状态',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果备注',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_bill
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_bill`;
CREATE TABLE `wps13zz01_accumulate_found_bill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `outcome` decimal(18, 2) NULL DEFAULT NULL COMMENT '出账数',
  `income` decimal(18, 2) NULL DEFAULT NULL COMMENT '入账数',
  `amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '发生额',
  `subsidy_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '补贴入账',
  `subsidy_outcome` decimal(18, 2) NULL DEFAULT NULL COMMENT '补贴出账',
  `additional_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '补缴',
  `balance` decimal(18, 2) NULL DEFAULT NULL COMMENT '余额',
  `bill_date` datetime(0) NULL DEFAULT NULL COMMENT '缴存时间',
  `remit_month` datetime(0) NULL DEFAULT NULL COMMENT '汇缴月份',
  `backremit_month` datetime(0) NULL DEFAULT NULL COMMENT '补缴月份',
  `corporation_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前缴存企业名称',
  `monthlycopraation_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '企业月度缴存',
  `monthlypersonal_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人月度缴存',
  `monthlytotal_income` decimal(18, 2) NULL DEFAULT NULL COMMENT '总缴存',
  `corporation_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '企业缴存比例',
  `personnal_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人缴存比例',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴存描述信息',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金缴存信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_company_analysis
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_company_analysis`;
CREATE TABLE `wps13zz01_accumulate_found_company_analysis`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `cont_last_times` int(11) NULL DEFAULT NULL COMMENT '最近连续缴存月份数',
  `back_cont_last_times` int(11) NULL DEFAULT NULL COMMENT '最近连续缴存',
  `cont_max_times` int(11) NULL DEFAULT NULL COMMENT '连续缴存最多次数',
  `back_cont_max_times` int(11) NULL DEFAULT NULL COMMENT '连续缴存最多次数',
  `sum_times` int(11) NULL DEFAULT NULL COMMENT '总共缴存次数',
  `back_sum_times` int(11) NULL DEFAULT NULL COMMENT '总共缴存次数',
  `start_month` datetime(0) NULL DEFAULT NULL COMMENT '此公司开始缴纳时间',
  `end_month` datetime(0) NULL DEFAULT NULL COMMENT '此公司结束缴纳时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金缴存公司分析报告信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_house_loan
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_house_loan`;
CREATE TABLE `wps13zz01_accumulate_found_house_loan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID  ',
  `contract_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款合同号',
  `personnal_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户号',
  `housefund_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金账号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款人姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款人手机号',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款状态',
  `bank` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '承办银行',
  `loan_type` int(1) NULL DEFAULT NULL COMMENT '贷款类型',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款人身份证号',
  `house_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款买房地址',
  `mailing_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `periods` tinyint(4) NULL DEFAULT NULL COMMENT '贷款期数',
  `load_period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '贷款周期',
  `loan_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '贷款金额',
  `monthlyrepay_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '月度还款金额',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '贷款开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '贷款结束时间',
  `repay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款类型',
  `deduct_day` tinyint(4) NULL DEFAULT NULL COMMENT '每月还款日期',
  `bank_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣款账号',
  `bankaccount_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣款账号姓名',
  `loaninterest_percent` decimal(18, 2) NULL DEFAULT NULL COMMENT '贷款利率',
  `penaltyinterest_percent` decimal(18, 2) NULL DEFAULT NULL COMMENT '罚息利率',
  `commercialcontract_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商业贷款合同号',
  `commercial_bank` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商业贷款银行',
  `commercial_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '商业贷款金额',
  `secondbank_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二还款人银行账号',
  `secondbankaccount_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二还款人银行账号姓名',
  `secondid_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二还款人身份证号',
  `second_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二还款人手机号',
  `secondcorporation_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二还款人工作单位',
  `remain_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '贷款余额',
  `remain_periods` tinyint(4) NULL DEFAULT NULL COMMENT '剩余期数',
  `lastrepay_date` datetime(0) NULL DEFAULT NULL COMMENT '最后还款日期',
  `overdue_capital` decimal(18, 2) NULL DEFAULT NULL COMMENT '逾期本金',
  `overdue_interest` decimal(18, 2) NULL DEFAULT NULL COMMENT '逾期利息',
  `overdue_penalty` decimal(18, 2) NULL DEFAULT NULL COMMENT '逾期罚息',
  `overdue_days` int(10) NULL DEFAULT NULL COMMENT '逾期天数',
  `overdue_times` tinyint(4) NULL DEFAULT NULL COMMENT '以往逾期次数',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金用户贷款记录信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_repayment
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_repayment`;
CREATE TABLE `wps13zz01_accumulate_found_repayment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID',
  `repayment_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '每月应还金额',
  `repay_date` datetime(0) NULL DEFAULT NULL COMMENT '还款日期',
  `accounting_date` datetime(0) NULL DEFAULT NULL COMMENT '记账日期',
  `repay_capital` decimal(18, 2) NULL DEFAULT NULL COMMENT '还款本金',
  `repay_interest` decimal(18, 2) NULL DEFAULT NULL COMMENT '还款利息',
  `repay_penalty` decimal(18, 2) NULL DEFAULT NULL COMMENT '还款罚息',
  `loanleft_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '本金余额',
  `msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金还款记录信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps13zz01_accumulate_found_total_analysis
-- ----------------------------
DROP TABLE IF EXISTS `wps13zz01_accumulate_found_total_analysis`;
CREATE TABLE `wps13zz01_accumulate_found_total_analysis`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique  file  ID',
  `last_6months_pay_off` int(11) NULL DEFAULT NULL COMMENT '近6个月断缴月份数',
  `last_6months_back_pay_off` int(11) NULL DEFAULT NULL COMMENT '近6个月断缴月份数',
  `last_24months_sum_times` int(11) NULL DEFAULT NULL COMMENT '近24个月总共缴存次数',
  `last_24months_back_sum_times` int(11) NULL DEFAULT NULL COMMENT '近24个月总共缴存次数',
  `last_24months_company_quantity` int(11) NULL DEFAULT NULL COMMENT '近24个月缴存公司个数',
  `last_12months_has_extract` int(11) NULL DEFAULT NULL COMMENT '近12个月是否有提取',
  `last_12months_average` decimal(18, 2) NULL DEFAULT NULL COMMENT '近12个月平均月缴',
  `last_24months_average` decimal(18, 2) NULL DEFAULT NULL COMMENT '近24个月平均月缴',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '明细开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '明细结束时间',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公积金整体分析报告信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps14zz01_social_security_base_info
-- ----------------------------
DROP TABLE IF EXISTS `wps14zz01_social_security_base_info`;
CREATE TABLE `wps14zz01_social_security_base_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `login_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `id_card` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `personal_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人编号',
  `area_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别 ',
  `nation` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `education_level` int(4) NULL DEFAULT NULL COMMENT '文化水平',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `household_type` int(1) NULL DEFAULT NULL COMMENT '户口性质',
  `household_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户口所在地地址',
  `work_date` datetime(0) NULL DEFAULT NULL COMMENT '工作日期',
  `work_status` int(4) NULL DEFAULT NULL COMMENT '工作状态',
  `retire_date` datetime(0) NULL DEFAULT NULL COMMENT '退休日期',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前参保单位',
  `company_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参保单位编号',
  `company_type` int(4) NULL DEFAULT NULL COMMENT '单位类型',
  `base_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '社保基数',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社保缴纳地',
  `firstpay_date` datetime(0) NULL DEFAULT NULL COMMENT '首次缴费时间',
  `lastpay_date` datetime(0) NULL DEFAULT NULL COMMENT '最近一次缴费时间',
  `status` int(4) NULL DEFAULT NULL COMMENT '社保状态',
  `is_self` int(1) NULL DEFAULT NULL COMMENT '是否是本人',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保用户基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps14zz01_social_security_basic
-- ----------------------------
DROP TABLE IF EXISTS `wps14zz01_social_security_basic`;
CREATE TABLE `wps14zz01_social_security_basic`  (
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部系统用户授权唯一性标志，由接入方token授权时指定',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爬虫系统一次授权唯一标识',
  `auth_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权状态1/0',
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权成功之后的跳转地址',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `auth_item` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权项',
  `auth_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权版本',
  `auth_time` datetime(0) NULL DEFAULT NULL COMMENT '授权时间',
  `search_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单号',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果状态',
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调结果备注',
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `flag_valid` int(1) NULL DEFAULT NULL COMMENT '数据有效标识',
  `flag_qry` int(1) NULL DEFAULT NULL COMMENT '查询标识',
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps14zz01_social_security_bill_record
-- ----------------------------
DROP TABLE IF EXISTS `wps14zz01_social_security_bill_record`;
CREATE TABLE `wps14zz01_social_security_bill_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `insurance_type` int(4) NULL DEFAULT NULL COMMENT '缴存类型',
  `payment_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用名称',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参保公司名称',
  `base_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '当前参保基数',
  `company_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '当前公司缴费',
  `personal_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '当前个人缴费',
  `company_percent` float(3, 1) NULL DEFAULT NULL COMMENT '当前公司缴费比例',
  `personal_percent` float(3, 1) NULL DEFAULT NULL COMMENT '当前个人缴费比例',
  `period` datetime(0) NULL DEFAULT NULL COMMENT '缴费周期',
  `pay_date` datetime(0) NULL DEFAULT NULL COMMENT '缴费日期',
  `pay_status` int(4) NULL DEFAULT NULL COMMENT '缴费状态',
  `pay_type` int(4) NULL DEFAULT NULL COMMENT '缴费类型',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费说明',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保医保消费记录信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps14zz01_social_security_insurance
-- ----------------------------
DROP TABLE IF EXISTS `wps14zz01_social_security_insurance`;
CREATE TABLE `wps14zz01_social_security_insurance`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `insurance_type` int(1) NULL DEFAULT NULL COMMENT '缴存类型',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前参保公司名称',
  `lastyearbalance_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '上年缴存金额',
  `thisyearpay_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '本年缴存金额',
  `totaldeposit_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '累计缴存金额',
  `totalpay_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '累计支付金额',
  `thisyeardeposit_month` int(11) NULL DEFAULT NULL COMMENT '当年缴存月份数',
  `continuousdeposit_month` int(11) NULL DEFAULT NULL COMMENT '连续缴存月份数',
  `payment_month` int(11) NULL DEFAULT NULL COMMENT '累计缴存月份数',
  `firstinsure_date` datetime(0) NULL DEFAULT NULL COMMENT '首次参保日期',
  `lastinsure_date` datetime(0) NULL DEFAULT NULL COMMENT '本次参保日期',
  `base_amount` decimal(18, 1) NULL DEFAULT NULL COMMENT '当前参保基数',
  `company_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '当前公司缴费',
  `personal_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '当前个人缴费',
  `company_percent` float(3, 1) NULL DEFAULT NULL COMMENT '当前公司缴费比例',
  `personal_percent` float(3, 1) NULL DEFAULT NULL COMMENT '当前个人缴费比例',
  `status` int(4) NULL DEFAULT NULL COMMENT '当前参保状态',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保基础信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wps14zz01_social_security_medical_consume_records
-- ----------------------------
DROP TABLE IF EXISTS `wps14zz01_social_security_medical_consume_records`;
CREATE TABLE `wps14zz01_social_security_medical_consume_records`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unique file ID',
  `payment_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用名称',
  `type` int(4) NULL DEFAULT NULL COMMENT '医疗类别',
  `org_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医疗机构名称',
  `total_cost` decimal(18, 2) NULL DEFAULT NULL COMMENT '总费用',
  `medical_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '医保支付',
  `personal_pay` decimal(18, 2) NULL DEFAULT NULL COMMENT '个人支付',
  `pay_date` datetime(0) NULL DEFAULT NULL COMMENT '结算时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费说明',
  `time_inst` datetime(0) NULL DEFAULT NULL COMMENT 'insert  reporting time',
  `time_upd` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保医保消费记录信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wvd161001_operator_basic
-- ----------------------------
DROP TABLE IF EXISTS `wvd161001_operator_basic`;
CREATE TABLE `wvd161001_operator_basic`  (
  `id_custc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_file` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outUniqueId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authChannel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notifyUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `returnUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emergencyName1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emergencyRelation1` enum('father，mother，spouse，brother，sister，children，friend，colleague，other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emergencyPhone1` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emergencyName2` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emergencyRelation2` enum('father，mother，spouse，brother，sister，children，friend，colleague，other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emergencyPhone2` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `search_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accountType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `errorReasonDetail` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_valid` int(1) NULL DEFAULT NULL,
  `flag_qry` int(1) NULL DEFAULT NULL,
  `flag_serve` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inqt` datetime(0) NULL DEFAULT NULL,
  `time_rect` datetime(0) NULL DEFAULT NULL,
  `time_inst` datetime(0) NULL DEFAULT NULL,
  `time_upd` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`) USING BTREE,
  INDEX `id_custc_index`(`id_custc`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for delete_table_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_table_data`;
delimiter ;;
CREATE PROCEDURE `delete_table_data`(IN  database_name  varchar(128),  IN  table_name  varchar(128))
begin
set  @actual=0,  @spendTime=0;
select  now()  into  @startTime;
set  @delete_sql  =  concat('delete  from  ',  database_name,  '.',  table_name,  '  where    time_inst  <=  DATE_SUB(''',  @startTime,  ''',  INTERVAL  30  DAY)');
prepare  delete_stmt  from  @delete_sql;
execute  delete_stmt;
set  @actual  =  ROW_COUNT();
select  now()  into  @endTime;
SELECT  TIMESTAMPDIFF(SECOND,  @startTime,  @endTime)  into  @spendTime;
set  @tableName  =  concat(database_name,  '.',  table_name);
insert  into  sctx_data_product.clear_data_sql_result(table_name,  actual_delete_rows,  task_start_time,  task_end_time,  spend_time)  values  (@tableName,  @actual,  @startTime,  @endTime,  @spendTime);
deallocate  prepare  delete_stmt;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_table_data_byhour
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_table_data_byhour`;
delimiter ;;
CREATE PROCEDURE `delete_table_data_byhour`(IN    database_name    varchar(128),    IN    table_name    varchar(128))
BEGIN
set    @actual=0,    @spendTime=0;
select    now()    into    @startTime;
set  @hourInternal=741;
ins:LOOP
IF  @hourInternal  <  720  then
leave  ins;
END  IF;
set    @delete_sql    =    concat('delete    from    ',    database_name,    '.',    table_name,    '    where        time_inst    <=    DATE_SUB(''',    @startTime,    ''',    INTERVAL    @hourInternal    HOUR)');
prepare    delete_stmt    from    @delete_sql;
execute    delete_stmt;
set    @actual    =    ROW_COUNT();
select    now()    into    @endTime;
SELECT    TIMESTAMPDIFF(SECOND,    @startTime,    @endTime)    into    @spendTime;
set    @tableName    =    concat(database_name,    '.',    table_name);
insert    into    sctx_data_product.clear_data_sql_result(table_name,    actual_delete_rows,    task_start_time,    task_end_time,    spend_time)    values    (@tableName,    @actual,    @startTime,    @endTime,    @spendTime);
deallocate    prepare    delete_stmt;
set  @hourInternal  =  @hourInternal  -  3;
END  LOOP  ins;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_table_data_by_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_table_data_by_id`;
delimiter ;;
CREATE PROCEDURE `delete_table_data_by_id`(IN dataBaseName varchar(128), IN tableName varchar(128))
BEGIN
	SET @spendTime = 0;
	SELECT now() into @startTime;
	IF
	(tableName = 'waf09zz01_call_detail2_compressed') THEN
	SELECT max(id) from sctx_data_product.waf09zz01_call_detail2_compressed WHERE time_inst <= ( DATE_SUB( now( ), INTERVAL 30 DAY ) ) INTO @maxId;
	SELECT min(id) from sctx_data_product.waf09zz01_call_detail2_compressed into @minId;
	ELSE
	SELECT max(id) from sctx_data_product.waf09zz01_netflow_detail_compressed WHERE time_inst <= ( DATE_SUB( now( ), INTERVAL 30 DAY ) ) INTO @maxId;
	SELECT min(id) from sctx_data_product.waf09zz01_netflow_detail_compressed into @minId;
	END IF;
	SET @everyTimeCount = (@maxId - @minId) DIV 32;
	SET @deleteDataId = @minId + @everyTimeCount;
	ins:
	LOOP
		IF 
		(@everyTimeCount is null) || (@deleteDataId >= @maxId) || (@everyTimeCount <= 0) THEN
		LEAVE ins;
		END IF;
		SET @deleteSQL = concat('delete from ', dataBaseName, '.', tableName, ' where id <= ', @deleteDataId);
		PREPARE delete_stmt
		FROM 
			@deleteSQL;
		EXECUTE delete_stmt;
		SET @rowCount = ROW_COUNT();
		SELECT now() into @endtime;
		SELECT TIMESTAMPDIFF(SECOND, @startTime, @endtime) into @spendTime;
		SET @deleteTableName = concat(dataBaseName, '.', tableName);
		INSERT INTO sctx_data_product.clear_data_sql_result( table_name, actual_delete_rows, task_start_time, task_end_time, spend_time ) VALUES(@deleteTableName, @rowCount, @startTime, @endtime, @spendTime); 
		DEALLOCATE PREPARE delete_stmt;
		SET @deleteDataId = @deleteDataId + @everyTimeCount;
   END LOOP ins;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for data_clear
-- ----------------------------
DROP EVENT IF EXISTS `data_clear`;
delimiter ;;
CREATE EVENT `data_clear`
ON SCHEDULE
EVERY '1' DAY STARTS '2019-04-04 00:30:00'
ON COMPLETION PRESERVE
DO begin  
call  delete_table_data_by_id('sctx_data_product',  'waf09zz01_call_detail2_compressed');
call  delete_table_data_by_id('sctx_data_product',  'waf09zz01_netflow_detail_compressed');
call  delete_table_data('sctx_data_product',  'ibl032102_basic');
call  delete_table_data('sctx_data_product',  'ibl032102_result');
call  delete_table_data('sctx_data_product',  'ibl032101_basic');
call  delete_table_data('sctx_data_product',  'ibl032101_result');
call  delete_table_data('sctx_data_product',  'ibl032001_basic');
call  delete_table_data('sctx_data_product',  'ibl032001_result');
call  delete_table_data('sctx_data_product',  'icd010701_zr_basic');
call  delete_table_data('sctx_data_product',  'icd010701_zr_result');
call  delete_table_data('sctx_data_product',  'iaf010301_basic');
call  delete_table_data('sctx_data_product',  'iaf010301_result');
call  delete_table_data('sctx_data_product',  'waf09zz01_sms_detail');
call  delete_table_data('sctx_data_product',  'waf09zz01_operator_basic');
call  delete_table_data('sctx_data_product',  'waf09zz01_operator_summary');
call  delete_table_data('sctx_data_product',  'waf09zz01_payment_detail');
call  delete_table_data('sctx_data_product',  'waf09zz01_family_detail');
call  delete_table_data('sctx_data_product',  'waf09zz01_net_detail');
call  delete_table_data('sctx_data_product',  'waf09zz01_bill_detail');
call  delete_table_data('sctx_data_product',  'waf161002_apply_basic');
call  delete_table_data('sctx_data_product',  'waf161002_apply_result');
call  delete_table_data('sctx_data_product',  'waf09zz01_operator_variables');
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
