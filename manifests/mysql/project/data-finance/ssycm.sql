/*
 Navicat Premium Data Transfer

 Source Server         : RDS
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-bp14631uzn52u586cqs.mysql.rds.aliyuncs.com:3306
 Source Schema         : ssycm

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 28/05/2019 16:41:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anti_fraud_determiner_id
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_determiner_id`;
CREATE TABLE `anti_fraud_determiner_id`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id 主键',
  `determiner_id` int(20) NULL DEFAULT NULL COMMENT '限定词id，从1开始',
  `determiner_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '限定词表达式[事件类型，事件状态，追踪属性名称，聚合属性名称，限定词]',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `event_type` int(11) NULL DEFAULT NULL COMMENT '事件类型',
  `event_state` int(11) NULL DEFAULT NULL COMMENT '事件状态，默认-1',
  `trackedField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追踪属性名称',
  `aggregationField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚合字段名称',
  `determiners` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '限定词，[[主属性参数描述],[从属性关系描述]]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-限定词' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_frequency_index
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_frequency_index`;
CREATE TABLE `anti_fraud_frequency_index`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指标编码',
  `index_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标描述',
  `action_scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作用域',
  `event_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类型',
  `time` int(11) NULL DEFAULT NULL COMMENT '时间',
  `frequency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '频率,hour-小时，day-日，month-月',
  `prime_attribute` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主属性',
  `sub_attribute` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从属性，四则运算时没有',
  `index_status` int(1) NOT NULL COMMENT '指标状态  0无效，1有效',
  `index_type` int(1) NULL DEFAULT NULL COMMENT '指标类型  0私有，1公有',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `index_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '指标名称',
  `index_name_md5` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标名称md5',
  `determiners` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '限定词，cat0=100,cat1=101,rlt=0;cat0=500,cat1=501,rlt=6',
  `agg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚合类型，频数指标-countd,个数-count',
  `determiner_id` int(20) NULL DEFAULT NULL COMMENT '限定词id',
  `event_state` int(11) NULL DEFAULT NULL COMMENT '事件状态，默认-1',
  `ori_prime_attribute` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原主属性',
  `ori_sub_attribute` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原从属性',
  `lbs_agg_by` int(1) NULL DEFAULT -1 COMMENT '子聚合类型：-1不设置，1省，2市,当追踪属性是ip or loc ',
  `aggregation_field_store_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚合类型：String，Long,Double',
  `metric_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标类型：aggregation统计指标，numberVar黑名单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 791 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-频数指标' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_id_coop_key
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_id_coop_key`;
CREATE TABLE `anti_fraud_id_coop_key`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_coop` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作方编码',
  `num_key` int(11) NULL DEFAULT NULL COMMENT '唯一数字，hashCode',
  `time_inst` timestamp(0) NULL DEFAULT NULL COMMENT '新增时间',
  `name_inst` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `sync_status` int(1) NULL DEFAULT 0 COMMENT '同步状态：0未同步，1已同步',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_id_coop`(`id_coop`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合作方编码idcoop映射数字' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_param_dic
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_param_dic`;
CREATE TABLE `anti_fraud_param_dic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数分类',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值域',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `time_inst` timestamp(0) NULL DEFAULT NULL COMMENT '新增时间',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数字段值映射字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_query_param
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_query_param`;
CREATE TABLE `anti_fraud_query_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `param_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `cat0` int(11) NULL DEFAULT NULL COMMENT '分类0',
  `cat1` int(11) NULL DEFAULT NULL COMMENT '分类1',
  `cat2` int(11) NULL DEFAULT NULL COMMENT '分类2',
  `rlt` int(11) NULL DEFAULT NULL COMMENT '与人之间的关系',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `param_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `field_store_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聚合类型：String，Long,Double',
  `fileld_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型：String主属性，Number从属性(max，min，sum），Number&String从属性(count,countd）',
  `application` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属应用',
  `para_status` int(1) NULL DEFAULT NULL COMMENT '参数状态：0无效，1有效',
  `initials` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '参数类别:0统计，1黑名单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_initials`(`initials`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-查询参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy`;
CREATE TABLE `anti_fraud_strategy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `strategy_name` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略名称',
  `strategy_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略编码',
  `risk_weight` int(10) NULL DEFAULT NULL COMMENT '风险权重',
  `risk_descision` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风险决策',
  `strategy_cond_type` int(1) NULL DEFAULT NULL COMMENT '策略条件类型:1满足所有策略条件，0满足任意策略条件',
  `strategy_status` int(1) NULL DEFAULT NULL COMMENT '策略状态,0无效，1有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `strategy_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '策略描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 587 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-策略' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy_cond
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy_cond`;
CREATE TABLE `anti_fraud_strategy_cond`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint(20) NOT NULL COMMENT '指标id',
  `operation_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运算编码',
  `threshold_value` int(10) NOT NULL COMMENT '阈值',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `strategy_cond_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '策略条件代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 984 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-策略条件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy_set
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy_set`;
CREATE TABLE `anti_fraud_strategy_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `strategy_set_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略集名称',
  `strategy_set_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略集编码',
  `event_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件类型',
  `application_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名，取字典表',
  `event_identify` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件标识',
  `event_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件描述',
  `strategy_mode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略模式',
  `risk_threshold_value_heigh` int(11) NULL DEFAULT NULL COMMENT '风险阈值-高',
  `risk_threshold_value_low` int(11) NULL DEFAULT NULL COMMENT '风险阈值-低',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `org_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `strategy_set_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '策略集描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-策略集' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy_set_index
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy_set_index`;
CREATE TABLE `anti_fraud_strategy_set_index`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `strategy_set_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略集编码',
  `index_id` bigint(20) NOT NULL COMMENT '指标id',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `use_status` int(1) NULL DEFAULT NULL COMMENT '启用状态：0未启用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2083 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '策略集与指标' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy_set_pub_index
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy_set_pub_index`;
CREATE TABLE `anti_fraud_strategy_set_pub_index`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `strategy_set_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `pub_index_id` bigint(20) NULL DEFAULT NULL COMMENT '公共指标id',
  `time_inst` timestamp(0) NULL DEFAULT NULL COMMENT '新增时间',
  `name_inst` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `time_upd` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `name_upd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `use_status` int(1) NULL DEFAULT NULL COMMENT '使用状态：0无效，1有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '策略集映射公共指标' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy_set_strategy
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy_set_strategy`;
CREATE TABLE `anti_fraud_strategy_set_strategy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `strategy_set_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略集编码',
  `strategy_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略编码',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 587 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-策略集与策略' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for anti_fraud_strategy_strategy_cond
-- ----------------------------
DROP TABLE IF EXISTS `anti_fraud_strategy_strategy_cond`;
CREATE TABLE `anti_fraud_strategy_strategy_cond`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `strategy_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略编码',
  `strategy_cond_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '策略条件编码',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 984 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反欺诈-策略与策略条件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_param
-- ----------------------------
DROP TABLE IF EXISTS `app_param`;
CREATE TABLE `app_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id ',
  `param_api` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数对外名称',
  `param_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数的类型，说白了就是描述，string(32)这样的',
  `param_default_necessary` int(1) NOT NULL COMMENT '参数默认的必填属性，该参数默认情况下是否必填 0非必填， 1必填',
  `param_dictionary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典描述',
  `param_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名称',
  `param_des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数描述',
  `param_group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数所属的组，main, device, photo_info,account_info, contact_info, order_info , order_item_info,',
  `group_des` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组的描述',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `name_inst` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '插入人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'admin' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信审api参数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_personal_param
-- ----------------------------
DROP TABLE IF EXISTS `app_personal_param`;
CREATE TABLE `app_personal_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id ',
  `id_coop` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作商编码',
  `prod_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品类型',
  `param_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指向的基础参数表 app_param中的param_name',
  `stage` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否发布，ready,published',
  `necessary` int(1) NOT NULL COMMENT '是否必填 0非必填， 1必填',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `name_inst` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '插入人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3288 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户个性化参数设置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_personal_param_publish_record
-- ----------------------------
DROP TABLE IF EXISTS `app_personal_param_publish_record`;
CREATE TABLE `app_personal_param_publish_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id ',
  `id_coop` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作商编码',
  `prod_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品类型',
  `publish_mark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布标记',
  `publish_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布标记',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `name_inst` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '插入人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'admin' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户个性化参数发布记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_prod_saice_acct_det_day
-- ----------------------------
DROP TABLE IF EXISTS `app_prod_saice_acct_det_day`;
CREATE TABLE `app_prod_saice_acct_det_day`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `charge_dt` date NOT NULL COMMENT '交易日期',
  `acct` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户编号',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户编号',
  `charge_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易类型',
  `charge_num` int(10) NULL DEFAULT NULL COMMENT '调用笔数',
  `charge_amt` decimal(15, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `mon` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月分区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_charge_dt_acct_id_coop_type`(`charge_dt`, `acct`, `id_coop`, `charge_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6629 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '明细页面' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_prod_saice_acct_det_day_temp
-- ----------------------------
DROP TABLE IF EXISTS `app_prod_saice_acct_det_day_temp`;
CREATE TABLE `app_prod_saice_acct_det_day_temp`  (
  `charge_dt` date NOT NULL COMMENT '交易日期',
  `acct` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户编号',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户编号',
  `charge_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易类型',
  `charge_num` int(10) NULL DEFAULT NULL COMMENT '调用笔数',
  `charge_amt` decimal(15, 2) NULL DEFAULT NULL COMMENT '交易金额',
  PRIMARY KEY (`charge_dt`, `acct`, `id_coop`, `charge_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '明细页面临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_prod_saice_acct_main_mon
-- ----------------------------
DROP TABLE IF EXISTS `app_prod_saice_acct_main_mon`;
CREATE TABLE `app_prod_saice_acct_main_mon`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `acct` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户编号',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `name_coop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `prod_num` int(10) NULL DEFAULT NULL COMMENT '产品数',
  `income` decimal(15, 2) NULL DEFAULT NULL COMMENT '收入',
  `amt` decimal(15, 2) NULL DEFAULT NULL COMMENT '支出',
  `tot_bal` decimal(15, 2) NULL DEFAULT NULL COMMENT '总余额',
  `charge` decimal(15, 2) NULL DEFAULT NULL COMMENT '充值总金额',
  `prest` decimal(15, 2) NULL DEFAULT NULL COMMENT '赠送总金额',
  `rfn` decimal(15, 2) NULL DEFAULT NULL COMMENT '信用还款',
  `app` decimal(15, 2) NULL DEFAULT NULL COMMENT '信审服务',
  `afd` decimal(15, 2) NULL DEFAULT NULL COMMENT '反欺诈服务',
  `data` decimal(15, 2) NULL DEFAULT NULL COMMENT '数据产品',
  `start_dt` date NOT NULL COMMENT '开始日期',
  `end_dt` date NOT NULL COMMENT '结束日期',
  `mon` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月分区',
  `buy_services` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已购买服务',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_acct_start_dt`(`acct`, `start_dt`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_prod_saice_acct_main_mon_temp
-- ----------------------------
DROP TABLE IF EXISTS `app_prod_saice_acct_main_mon_temp`;
CREATE TABLE `app_prod_saice_acct_main_mon_temp`  (
  `acct` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户编号',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `name_coop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `prod_num` int(10) NULL DEFAULT NULL COMMENT '产品数',
  `income` decimal(15, 2) NULL DEFAULT NULL COMMENT '收入',
  `amt` decimal(15, 2) NULL DEFAULT NULL COMMENT '支出',
  `tot_bal` decimal(15, 2) NULL DEFAULT NULL COMMENT '总余额',
  `charge` decimal(15, 2) NULL DEFAULT NULL COMMENT '充值总金额',
  `prest` decimal(15, 2) NULL DEFAULT NULL COMMENT '赠送总金额',
  `rfn` decimal(15, 2) NULL DEFAULT NULL COMMENT '信用还款',
  `app` decimal(15, 2) NULL DEFAULT NULL COMMENT '信审服务',
  `afd` decimal(15, 2) NULL DEFAULT NULL COMMENT '反欺诈服务',
  `data` decimal(15, 2) NULL DEFAULT NULL COMMENT '数据产品',
  `start_dt` date NOT NULL COMMENT '开始日期',
  `end_dt` date NOT NULL COMMENT '结束日期',
  `buy_services` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已购买服务',
  PRIMARY KEY (`acct`, `start_dt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账单管理临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_assembly_group
-- ----------------------------
DROP TABLE IF EXISTS `approve_assembly_group`;
CREATE TABLE `approve_assembly_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id ',
  `assembly_group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件分组名称',
  `assembly_group_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件分组编码，GC+当前日期+（6位）记录数（GC20171012001000001）',
  `assembly_group_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件组类型，来自字典表',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `name_inst` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插入人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '信审组件分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_assembly_group_assembly
-- ----------------------------
DROP TABLE IF EXISTS `approve_assembly_group_assembly`;
CREATE TABLE `approve_assembly_group_assembly`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `assembly_group_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件组编码',
  `assembly_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件id',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `name_inst` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插入人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '信审组件组与组件关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_data_prod_dispatcher
-- ----------------------------
DROP TABLE IF EXISTS `approve_data_prod_dispatcher`;
CREATE TABLE `approve_data_prod_dispatcher`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `prod_dispatcher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该组件的id，是我们进行系统设计的时候的服务的业务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据所属于的组，公有等组',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `prod_dispatcher_id`(`prod_dispatcher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据产品分流器配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_data_prod_group
-- ----------------------------
DROP TABLE IF EXISTS `approve_data_prod_group`;
CREATE TABLE `approve_data_prod_group`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `prod_group_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该组件的id，是我们进行系统设计的时候的服务的业务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据所属于的组，公有等组',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `prod_group_id`(`prod_group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据产品组配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_flow
-- ----------------------------
DROP TABLE IF EXISTS `approve_flow`;
CREATE TABLE `approve_flow`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `flow_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该组件的id，是我们进行系统设计的时候的服务的业务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据所属于的组，公有等组',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flow_id`(`flow_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_flow_dispatcher
-- ----------------------------
DROP TABLE IF EXISTS `approve_flow_dispatcher`;
CREATE TABLE `approve_flow_dispatcher`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `flow_dispatcher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该组件的id，是我们进行系统设计的时候的服务的业务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据所属于的组，公有等组',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flow_dispatcher_id`(`flow_dispatcher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分流器配置配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_prepare_group
-- ----------------------------
DROP TABLE IF EXISTS `approve_prepare_group`;
CREATE TABLE `approve_prepare_group`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `group_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该组件的id，是我们进行系统设计的时候的服务的业务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据所属于的组，公有等组',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据准备配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_service_caller
-- ----------------------------
DROP TABLE IF EXISTS `approve_service_caller`;
CREATE TABLE `approve_service_caller`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该服务的id，是我们进行系统设计的时候的服务的义务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'scm的类型【data_prepare:数据准备服务,data_process：数据处理服务,data_prod：数据产品服务】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据所属于的组，公有等组',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `service_id`(`service_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '事件评定主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for approve_unit
-- ----------------------------
DROP TABLE IF EXISTS `approve_unit`;
CREATE TABLE `approve_unit`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID 主键',
  `unit_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该组件的id，是我们进行系统设计的时候的服务的业务编码，原则上应该保持unique',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该组件是否可用，和content中的status字段保持一致，【able:可用， disable:不可用】',
  `stage` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该数据的生命周期状态\r\n【ready:存储但是未发布状态，published:发布状态,\r\ndelete:删除状态（只有status为disable且当前状态为published才可以进行这个状态变更，用户不可见）】',
  `scope` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据的范围，是用户私有还是公有【private:用户私有，public用户公有】',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '一个完整配置的具体内容',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统插入记录时间 用于记录我们插入该条数据的时间',
  `name_upd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '修改人 记录修改记录的操作人员',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统更新时间 信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unit_id`(`unit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据处理单元配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_merchant_product_bound
-- ----------------------------
DROP TABLE IF EXISTS `charge_merchant_product_bound`;
CREATE TABLE `charge_merchant_product_bound`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作方编码',
  `sin_code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原子产品编码',
  `pg_code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包产品编码',
  `channel` int(1) NOT NULL COMMENT '渠道：0外部调用，1信审调用，2反欺诈调用',
  `type` int(1) NOT NULL COMMENT '类型：0原子产品，1包产品',
  `charge_type` int(1) NOT NULL COMMENT '计费类型：0即时扣费，1结算扣费',
  `start_date` timestamp(0) NULL DEFAULT NULL COMMENT '产品有效-起始时间',
  `end_date` timestamp(0) NULL DEFAULT NULL COMMENT '产品有效-结束时间',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `mpb_status` int(1) NOT NULL COMMENT '状态：0未启用，1已启用，2已停用',
  `dp_charge_type` int(1) NULL DEFAULT NULL COMMENT '产品计价方式：0按条，1包月，2包年',
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `name_inst` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-合作商产品绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_merchant_sub_service
-- ----------------------------
DROP TABLE IF EXISTS `charge_merchant_sub_service`;
CREATE TABLE `charge_merchant_sub_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `merchant_pro_bound_id` bigint(20) NOT NULL COMMENT '合作商产品绑定id',
  `sub_service_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子服务编码',
  `price` decimal(18, 2) NOT NULL COMMENT '价格',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `name_inst` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `name_upd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-合作商与子服务绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_package_product
-- ----------------------------
DROP TABLE IF EXISTS `charge_package_product`;
CREATE TABLE `charge_package_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pg_code_dp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打包产品编码',
  `pg_name_dp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打包产品名称',
  `is_public` int(1) NOT NULL COMMENT '是否公开：0否，1是',
  `biz_type` int(1) NOT NULL COMMENT '业务类型：0信审服务，1反欺诈服务，2数据服务， 3基础服务',
  `pg_desc_dp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `pg_charge_type` int(1) NOT NULL COMMENT '收费标准：0全成功计费，1存在成功计费',
  `pg_status` int(1) NOT NULL COMMENT '状态：0未启用，1已启用，2已停用',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `name_inst` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-打包产品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_package_single_bound
-- ----------------------------
DROP TABLE IF EXISTS `charge_package_single_bound`;
CREATE TABLE `charge_package_single_bound`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sin_code_dp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原子产品编码',
  `pg_code_dp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打包产品编码',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `name_inst` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-产品包与原子产品绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_renewals_history
-- ----------------------------
DROP TABLE IF EXISTS `charge_renewals_history`;
CREATE TABLE `charge_renewals_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `renewals_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '续费流水号',
  `service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
  `price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '单价',
  `time_start` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '产品起始时间',
  `time_end_before` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '产品终止时间-充值前',
  `time_end_after` timestamp(0) NULL DEFAULT NULL COMMENT '充值后截止时间',
  `comment` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `that_status` int(1) NOT NULL COMMENT '当时状态：0未启用，1已启用，2已停用',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作人',
  `name_inst` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `dp_charge_type` int(1) NOT NULL COMMENT '产品计价方式：0按条，1包月，2包年',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作方编码',
  `renewals_num` int(11) NOT NULL COMMENT '续费时长',
  `present_num` int(11) NOT NULL COMMENT '赠送时长',
  `service_id` bigint(20) NOT NULL COMMENT '服务id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-续费历史记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_service
-- ----------------------------
DROP TABLE IF EXISTS `charge_service`;
CREATE TABLE `charge_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `service_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务编码',
  `service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
  `service_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务描述',
  `service_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `name_inst` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-服务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_single_product
-- ----------------------------
DROP TABLE IF EXISTS `charge_single_product`;
CREATE TABLE `charge_single_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sin_code_dp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原子产品编码',
  `sin_name_dp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原子产品名称',
  `is_public` int(1) NOT NULL COMMENT '是否公开：0否，1是',
  `sin_desc_dp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务编码',
  `charge_type` int(1) NOT NULL COMMENT '收费标准：0查询计费，1查得计费',
  `sin_status` int(1) NOT NULL COMMENT '状态：0未启用，1已启用，2已停用',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `name_inst` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `biz_type` int(1) NOT NULL COMMENT '业务类型：0信审服务，1反欺诈服务，2数据服务，3基础服务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-原子产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_sub_service
-- ----------------------------
DROP TABLE IF EXISTS `charge_sub_service`;
CREATE TABLE `charge_sub_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sub_service_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务编码',
  `sub_service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子服务名称',
  `sub_service_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子服务地址',
  `is_charge` int(1) NOT NULL COMMENT '是否计费：0否，1是',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `name_inst` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `name_upd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `service_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 430 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计费-子服务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_account
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_account`;
CREATE TABLE `ssycm_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户名称  ',
  `account_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户编码，机构编码,A+当前日期+（6位）记录数（20161012000001）',
  `org_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属机构编码',
  `account_accrued_money` decimal(15, 2) NOT NULL COMMENT '账户累计金额',
  `account_money` decimal(15, 2) NOT NULL COMMENT '账户总额',
  `account_status` int(11) NOT NULL COMMENT '账户状态，0-无效,1-有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `overdraw` decimal(10, 2) NULL DEFAULT 200.00 COMMENT '信用额度',
  `alarmlimit` decimal(10, 2) NULL DEFAULT 200.00 COMMENT '预警额度',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_code_unique`(`account_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_account_recharge_histroy
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_account_recharge_histroy`;
CREATE TABLE `ssycm_account_recharge_histroy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户编码',
  `recharge_money` decimal(15, 2) NOT NULL COMMENT '充值金额',
  `recharge_history_status` int(11) NOT NULL COMMENT '充值状态，0-无效,1-有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `account_money` decimal(15, 2) NULL DEFAULT NULL COMMENT '余额',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0否，1是',
  `account__type` int(1) NULL DEFAULT NULL COMMENT '充值类型：0充值，1赠送，2信用还款,3包月扣费，4包年扣费,5产品续费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户充值历史信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_apikey
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_apikey`;
CREATE TABLE `ssycm_apikey`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key_public` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方公钥',
  `org_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属机构编码',
  `apikey_status` int(11) NOT NULL COMMENT 'apikey状态，0无效，1有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'apiKey' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_application
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_application`;
CREATE TABLE `ssycm_application`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `application_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名称',
  `application_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用编码，名称首字母或英文',
  `application_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用描述',
  `application_status` int(11) NOT NULL COMMENT '状态，0-无效，1-正常',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_assembly_factory
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_assembly_factory`;
CREATE TABLE `ssycm_assembly_factory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `level` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品等级',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务类型',
  `depict` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务描述',
  `status` int(1) NOT NULL COMMENT '状态；0未发布1已发布2已弃用',
  `validity_time` int(16) NOT NULL COMMENT '有效期',
  `is_persistence` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化：Y是N否',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组装工厂表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_assembly_map
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_assembly_map`;
CREATE TABLE `ssycm_assembly_map`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编码',
  `map_type` int(1) NOT NULL COMMENT '映射类型：0组装数据映射1组装逻辑映射',
  `map_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '映射id',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组装数据映射表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_column
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_column`;
CREATE TABLE `ssycm_column`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列编码',
  `source_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属资源编码,菜单信息表',
  `column_status` int(11) NOT NULL COMMENT '状态，0-无效，1-有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据列权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_data_centre
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_data_centre`;
CREATE TABLE `ssycm_data_centre`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据编码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据名称',
  `level` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据等级',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务类型',
  `depict` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据描述',
  `status` int(1) NOT NULL COMMENT '状态；0未发布1已发布2已弃用',
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务编码',
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
  `data_source` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源',
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据表',
  `validity_time` int(8) NOT NULL COMMENT '有效期',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据中心表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_demo_apk_task
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_demo_apk_task`;
CREATE TABLE `ssycm_demo_apk_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作商编码',
  `key_private` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '私钥',
  `apk_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'demo apk名称',
  `file_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'demo apk影像系统id',
  `zip_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩文件名',
  `exception_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `task_status` int(1) NULL DEFAULT NULL COMMENT '任务状态：0初始化，1正在执行，2执行完成，3执行失败',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'demo apk任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_dictionary_data`;
CREATE TABLE `ssycm_dictionary_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID',
  `dic_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `type_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型编码,关联字典类型表',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_dictionary_type`;
CREATE TABLE `ssycm_dictionary_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `type_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型编码',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_external_data_source
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_external_data_source`;
CREATE TABLE `ssycm_external_data_source`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源编码',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `source_status` int(1) NULL DEFAULT NULL COMMENT '数据源状态：0无效，1有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `source_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_field_config
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_field_config`;
CREATE TABLE `ssycm_field_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `field_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段编码',
  `field_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `field_type` int(1) NOT NULL COMMENT '字段类型；参考字典',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否必输；Y是N否',
  `config_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置code',
  `config_type` int(1) NOT NULL COMMENT '配置类型：0数据配置，1逻辑配置，2组装配置',
  `io_type` int(1) NOT NULL COMMENT '传输类型：0输入，1输出',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field_code`(`field_code`, `config_code`, `io_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_file_upload`;
CREATE TABLE `ssycm_file_upload`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原始文件名',
  `file_size` bigint(20) NOT NULL COMMENT '上传文件大小',
  `serizal_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件序列号',
  `time_upload` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  `exception_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `upload_status` int(1) NULL DEFAULT NULL COMMENT '上传状态：0失败，1成功',
  `file_upload_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传文件名',
  `file_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传文件id',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_logic_centre
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_logic_centre`;
CREATE TABLE `ssycm_logic_centre`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '逻辑编码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '逻辑名称',
  `level` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '逻辑等级',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务类型',
  `depict` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '逻辑描述',
  `status` int(1) NOT NULL COMMENT '状态；0未发布1已发布2已弃用',
  `execute_engine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行引擎',
  `master_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主表名称',
  `execute_code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行代码',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '逻辑中心表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_menu
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_menu`;
CREATE TABLE `ssycm_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码,M+当前日期+（6位）记录数（20161012000001）',
  `application_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属应用编码,应用信息表',
  `menu_parent_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单编码',
  `menu_order` int(11) NOT NULL COMMENT '排列序号,1,2,3…',
  `menu_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单链接，http://或者https://',
  `is_visible` int(11) NULL DEFAULT NULL COMMENT '是否可见，0-可见，1-不可见',
  `is_leaf` int(11) NULL DEFAULT NULL COMMENT '是否末级，0-是，1-不是',
  `menu_status` int(11) NOT NULL COMMENT '状态，0-无效，1-正常',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_merchant
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_merchant`;
CREATE TABLE `ssycm_merchant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_acct` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户名',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `code_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `name_coop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司全称',
  `organization_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台机构代码',
  `code_org` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织机构代码',
  `name_legal` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法人代表名称',
  `file_store_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构证明复印件文件id，文件在文件服务器上',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码,MD5加密',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝原因',
  `time_reg` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `time_pass` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请通过时间',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `stts_rcd` int(11) NOT NULL COMMENT '当前状态，1-有效，0-无效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人,为商户审核人员',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，0-待审核review，1-已拒绝reject，2-已通过accep',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0否，1是',
  `logo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo地址',
  `contact_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_network_task
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_network_task`;
CREATE TABLE `ssycm_network_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件id',
  `dispose_file_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理后文件id',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作商编码',
  `exception_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `task_status` int(1) NULL DEFAULT NULL COMMENT '任务状态：0初始化1正在执行，2执行完成，3执行失败',
  `task_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型：default默认upload上传',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '复杂网络任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_oper_button
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_oper_button`;
CREATE TABLE `ssycm_oper_button`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `btn_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮名称',
  `btn_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码,BT+当前日期+（6位）记录数（20161012000001）',
  `source_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属资源编码,菜单信息表',
  `btn_status` int(11) NOT NULL COMMENT '状态，0-无效，1-有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作按钮信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_oper_history
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_oper_history`;
CREATE TABLE `ssycm_oper_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `oper_history_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作历史编码',
  `oper_type` int(1) NOT NULL COMMENT '操作类型   0新增，1更新，2删除',
  `oper_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `oper_data_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `application` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SSYCM' COMMENT '所属应用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作历史' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_organization
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_organization`;
CREATE TABLE `ssycm_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构名称',
  `org_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码,O+当前日期+（6位）记录数（20161012000001）',
  `org_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构描述',
  `org_status` int(11) NOT NULL COMMENT '状态，0-无效，1-有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0否，1是',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_code_unique`(`org_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_original_merchant
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_original_merchant`;
CREATE TABLE `ssycm_original_merchant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_acct` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户名',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `name_coop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司全称',
  `code_org` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织机构代码',
  `name_legal` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法人代表名称',
  `file_store_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构证明复印件文件id，文件在文件服务器上',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码,MD5加密',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态，0-待审核review，1-已拒绝reject，2-已通过accep',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝原因',
  `time_reg` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `time_pass` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核通过时间',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人,自己创建时为system',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户注册信息原始表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_parameter_map
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_parameter_map`;
CREATE TABLE `ssycm_parameter_map`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编码',
  `config_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置编码',
  `field_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `map_type` int(1) NOT NULL COMMENT '映射类型：0入参数据映射1出参逻辑映射',
  `map_field_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '映射字段',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组装参数映射表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_privilege
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_privilege`;
CREATE TABLE `ssycm_privilege`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `privilege_master` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限主体,用户或者角色，值：user,role',
  `privilege_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主体值，用户编码，角色编码',
  `privilege_access` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领域，菜单或者操作按钮，值：menu,button',
  `privilege_access_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领域值,菜单编码，操作按钮编码',
  `privilege_operation` int(11) NOT NULL COMMENT '权限,是否具有操作权限：1-有，0-没有',
  `privilege_status` int(11) NOT NULL COMMENT '状态,0-无效，1-正常',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `application` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SSYCM' COMMENT '所属应用：SSYCM赛斯云，ANTIFRONT反欺诈前端配置系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2875 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_product
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_product`;
CREATE TABLE `ssycm_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务产品编码',
  `desc_dp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务描述',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务地址',
  `url_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情地址',
  `file_store_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档下载地址,文件存储信息表',
  `type_settle` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算方式,数据字典（（按条计费，包年，包月,阶梯定价）',
  `price` decimal(15, 2) NULL DEFAULT NULL COMMENT '产品定价',
  `product_status` int(11) NULL DEFAULT NULL COMMENT '产品状态,0无效，1有效',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_public` int(1) NULL DEFAULT 0 COMMENT '是否公开，1是，0否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_unique`(`code_dp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_product_oper
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_product_oper`;
CREATE TABLE `ssycm_product_oper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_coop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `code_dp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编码',
  `is_test` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no' COMMENT '是否测试：yes是，no否',
  `test_count` int(255) NULL DEFAULT NULL COMMENT '测试次数',
  `time_start` timestamp(0) NULL DEFAULT NULL COMMENT '测试开始时间',
  `time_end` timestamp(0) NULL DEFAULT NULL COMMENT '测试结束时间',
  `remain_test_count` int(11) NULL DEFAULT 0 COMMENT '剩余测试次数',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `oper_status` int(1) NULL DEFAULT 1 COMMENT '状态，0无效，1有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_product_price_settle
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_product_price_settle`;
CREATE TABLE `ssycm_product_price_settle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作方编码',
  `code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务产品编码',
  `price` decimal(15, 2) NOT NULL COMMENT '产品定价',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定价类型，数据字典，public_settle-公开定价,private_settle-私有定价',
  `settle_status` int(11) NOT NULL COMMENT '状态，0无效，1有效',
  `type_settle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算方式，数据字典（按条计费，包年，包月,阶梯定价）',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品定价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_report_batch
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_report_batch`;
CREATE TABLE `ssycm_report_batch`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_busb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `name_custc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用电话',
  `bank_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡',
  `batch_status` int(1) NULL DEFAULT NULL COMMENT '任务状态：0初始化，1正在执行，2执行完成，3执行失败',
  `exception_msg` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `report_data` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表数据',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `task_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `no_bus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部申请单号',
  `form_data` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `report_batch_index_id`(`id`) USING BTREE,
  INDEX `index_report_batch_no_busb`(`no_busb`) USING BTREE,
  INDEX `index_report_batch_batch_status`(`batch_status`) USING BTREE,
  INDEX `index_name_custc`(`name_custc`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE,
  INDEX `index_id_card`(`id_card`) USING BTREE,
  INDEX `index_bank_card_no`(`bank_card_no`) USING BTREE,
  INDEX `index_time_inst`(`time_inst`) USING BTREE,
  INDEX `index_task_no`(`task_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_report_source_data
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_report_source_data`;
CREATE TABLE `ssycm_report_source_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `source_data_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原数据类型',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报告原始数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_report_task
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_report_task`;
CREATE TABLE `ssycm_report_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `key_private` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '私钥',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批量测试文件名称',
  `file_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批量测试文件影像系统id',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作商编码',
  `code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编码',
  `zip_decrypt_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'zip解压缩密码',
  `exception_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `report_download_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告下载地址',
  `task_status` int(1) NULL DEFAULT NULL COMMENT '任务状态：0初始化，1正在执行，2执行完成，3执行失败',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `next_id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常停止位置的身份证号',
  `next_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出现异常时候的用户名',
  `zip_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩文件名',
  `temp_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存每次上传的文件名字1',
  `is_need_source_data` int(1) NULL DEFAULT NULL COMMENT '是否需要原始数据，0不需要，1需要',
  `report_id` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告下载地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_task_no`(`task_no`) USING BTREE,
  INDEX `index_id_coop`(`id_coop`) USING BTREE,
  INDEX `index_task_status`(`task_status`) USING BTREE,
  INDEX `index_time_inst`(`time_inst`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报告任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_role
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_role`;
CREATE TABLE `ssycm_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码，R+当前日期+（6位）记录数（20161012000001）',
  `role_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态,0无效，1有效',
  `role_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_code_unique`(`role_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_shunt_config
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_shunt_config`;
CREATE TABLE `ssycm_shunt_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `scale` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比例',
  `out_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '超出时间',
  `repetition_number` int(8) NOT NULL COMMENT '重传次数',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据id',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分流配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_shunt_history
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_shunt_history`;
CREATE TABLE `ssycm_shunt_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `scale` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '历史比例',
  `out_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '历史超出时间',
  `repetition_number` int(8) NOT NULL COMMENT '历史重传次数',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据id',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分流配置历史表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_single_task
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_single_task`;
CREATE TABLE `ssycm_single_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `no_busb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `no_bus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内部申请单号',
  `name_custc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用电话',
  `bank_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡',
  `task_status` int(1) NULL DEFAULT NULL COMMENT '任务状态：0初始化，1正在执行，2执行完成，3执行失败',
  `id_coop` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作商编码',
  `code_dp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编码',
  `exception_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `form_data` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单数据',
  `report_data` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信审返回信息',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `monitor_flag` int(1) NULL DEFAULT NULL COMMENT '监控标识：0未监控，1已监控',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_user
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_user`;
CREATE TABLE `ssycm_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实名称',
  `login_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码,MD5加密',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编码，U+当前日期+（6位）记录数（20161012000001）',
  `sex` int(11) NOT NULL COMMENT '性别，0-男，1-女',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `org_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属机构编码 ,机构信息表',
  `user_status` int(11) NOT NULL COMMENT '状态 :0-待激活，1-正常，2-已冻结，3-已删除，4-已注销',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除：0否，1是',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_code_unique`(`user_code`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_user_role`;
CREATE TABLE `ssycm_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编码',
  `role_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码，R+当前日期+记录数（201610120001）',
  `user_role_status` int(11) NOT NULL COMMENT '状态，0-无效，1-正常',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 360 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_zhima_credit
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_zhima_credit`;
CREATE TABLE `ssycm_zhima_credit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_id` bigint(20) NOT NULL COMMENT '注册信息主键',
  `out_order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外部订单号',
  `linked_merchant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级商户标识',
  `supplier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `merchant_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证状态',
  `audit_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `audit_fail_reason` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核失败原因',
  `zhima_freeze_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '冻结状态',
  `zhima_freeze_reason` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '冻结原因',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人,自己创建时为system',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '芝麻信用表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ssycm_zhima_info
-- ----------------------------
DROP TABLE IF EXISTS `ssycm_zhima_info`;
CREATE TABLE `ssycm_zhima_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_id` bigint(20) NOT NULL COMMENT '注册信息主键',
  `company_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `company_address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业地址',
  `license_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照类型',
  `license_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照号',
  `start_business_date` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '营业执照起始时间',
  `end_business_date` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '营业执照截至时间',
  `license_image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照图片url',
  `license_image_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照图片ID',
  `organization_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `organization_image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证照片url',
  `organization_image_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证照片ID',
  `legal_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法人姓名',
  `legal_cert_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法人身份证号',
  `legal_cert_no_front_image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法人身份证正面图片url',
  `legal_cert_no_front_image_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证正面图片ID',
  `legal_cert_no_back_image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法人身份证反面图片',
  `legal_cert_no_back_image_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证反面图片ID',
  `legal_cert_valid_start_date` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '法人身份证有效期起始时间',
  `legal_cert_valid_end_date` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '法人身份证有效期截至时间',
  `alias_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户别名',
  `logo_image` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户图标二进制流',
  `logo_image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户图标url',
  `logo_image_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户图标ID',
  `logo_image_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '芝麻二级商户图标后缀',
  `one_level_mcc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '芝麻一级行业归属',
  `two_level_mcc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '芝麻二级行业归属',
  `qualification_image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务许可证图片url',
  `qualification_image_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务许可证图片ID',
  `biz_scene` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '芝麻信用产品用途',
  `alipay_window_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '为用户提供服务的贵司支付宝服务窗名称',
  `webchat_amount` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '为用户提供服务的贵司微信公众号',
  `websit_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '为用户提供服务的贵司网站',
  `app_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '为用户提供服务的贵司手机APP名称',
  `major_contract_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人姓名',
  `major_contract_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人邮箱',
  `major_contract_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人手机号',
  `service_contract_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务联动联系人姓名',
  `service_contract_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务联动联系人邮箱',
  `service_contract_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务联动联系人手机号',
  `objection_contract_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '异常处理联系人姓名',
  `objection_contract_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '异常处理联系人邮箱',
  `objection_contract_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '异常处理联系人手机号',
  `data_feedback_contract_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据反馈联系人姓名',
  `data_feedback_contract_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据反馈联系人邮箱',
  `data_feedback_contract_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据反馈联系人手机号',
  `name_inst` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人,自己创建时为system',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name_upd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `time_upd` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '芝麻信息表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
