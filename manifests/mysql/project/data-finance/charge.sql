/*
 Navicat Premium Data Transfer

 Source Server         : RDS
 Source Server Type    : MySQL
 Source Server Version : 50670
 Source Host           : rm-bp14631uzn52u586cqs.mysql.rds.aliyuncs.com:3306
 Source Schema         : charge

 Target Server Type    : MySQL
 Target Server Version : 50670
 File Encoding         : 65001

 Date: 28/05/2019 16:01:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for charge_cost
-- ----------------------------
DROP TABLE IF EXISTS `charge_cost`;
CREATE TABLE `charge_cost`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息来源approve assembly external',
  `partner_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `prod_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编码',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格[单位:元]',
  `type` int(2) NULL DEFAULT NULL COMMENT '0：服务费 1：用户成本 2：公司成本',
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会话主键',
  `start_date` bigint(20) NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `inquire_type` int(2) NULL DEFAULT NULL COMMENT '0:查询计费 1:查得计费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `time_index`(`time_inst`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102424788 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '旧计费明细表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for charge_details
-- ----------------------------
DROP TABLE IF EXISTS `charge_details`;
CREATE TABLE `charge_details`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源：approve assembly external',
  `partner_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作方编码',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会话主键',
  `prod_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `prod_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编码',
  `batch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格[单位:元]',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204497224 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新计费明细表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for charge_fee
-- ----------------------------
DROP TABLE IF EXISTS `charge_fee`;
CREATE TABLE `charge_fee`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源；approve external assembly',
  `partner_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合作方编码',
  `prod_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编号',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格[单位:元]',
  `charge` int(2) NULL DEFAULT NULL COMMENT '是否计费 0:不计费 1：计费',
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会话标识',
  `no_bus` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `start_date` bigint(20) NULL DEFAULT NULL COMMENT '插入时间',
  `end_date` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26024 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '旧计费主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_main
-- ----------------------------
DROP TABLE IF EXISTS `charge_main`;
CREATE TABLE `charge_main`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息来源：approve;assembly',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户调用的sessionId',
  `partner_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户合作方编码',
  `prod_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原子产品或者打包产品的ID',
  `prod_type` int(255) NULL DEFAULT NULL COMMENT '产品类型0：原子产品alter table charge_main MODIFY column 1：打包产品 2：信审服务费 3:其他产品',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '扣款金额',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '信审费用明细',
  `no_bus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `batch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注释',
  `charge_type` int(11) NULL DEFAULT NULL COMMENT '0：及时扣费;1:延迟扣费',
  `is_succeed` int(255) NULL DEFAULT NULL COMMENT '0：表示失败 1:表示成功',
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `balance` float(10, 2) NULL DEFAULT NULL,
  `id_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id_index`(`session_id`) USING BTREE,
  INDEX `partner_index`(`partner_id`) USING BTREE,
  INDEX `time_index`(`time_inst`) USING BTREE,
  INDEX `id_file_index`(`id_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213760211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新计费主表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for charge_statistical
-- ----------------------------
DROP TABLE IF EXISTS `charge_statistical`;
CREATE TABLE `charge_statistical`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `partner_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户合作方编码',
  `prod_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原子产品或者打包产品的ID',
  `num` int(255) NULL DEFAULT NULL COMMENT '总单量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '扣款金额',
  `time_inst` timestamp(0) NULL DEFAULT NULL COMMENT '插入时间',
  `time_count` timestamp(0) NULL DEFAULT NULL COMMENT '统计的数据时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `time_count`(`time_count`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4542 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计每天商户的所有订单和扣款' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for msg_consumered
-- ----------------------------
DROP TABLE IF EXISTS `msg_consumered`;
CREATE TABLE `msg_consumered`  (
  `msg_bus_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息业务主键',
  `msg_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息主键',
  `time_inst` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`msg_bus_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息消费主表' ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for recharge_history
-- ----------------------------
DROP TABLE IF EXISTS `recharge_history`;
CREATE TABLE `recharge_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作商编码',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 0：正常充值， 1：赠送金额  2：补差账',
  `amount` decimal(15, 2) NULL DEFAULT NULL,
  `balance` decimal(15, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0：失败 1：成功',
  `time_inst` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  `time_upd` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 806 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
