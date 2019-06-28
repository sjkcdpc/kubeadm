SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `config_center`;
CREATE TABLE `config_center` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(255) DEFAULT NULL COMMENT '名字显示',
  `node_data` mediumtext,
  `node_desc` varchar(255) DEFAULT NULL COMMENT 'zk节点的名称',
  `node_level` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `delete_flag` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL COMMENT '姓名',
  `update_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `node_name_index` (`node_name`),
  KEY `display_name_id_index` (`display_name`),
  KEY `delete_flag_index` (`delete_flag`),
  KEY `parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=954589 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

