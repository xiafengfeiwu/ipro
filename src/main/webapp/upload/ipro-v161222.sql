/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50549
Source Host           : 127.0.0.1:3306
Source Database       : ipro

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2016-12-22 17:58:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for w_device
-- ----------------------------
DROP TABLE IF EXISTS `w_device`;
CREATE TABLE `w_device` (
  `device_id` bigint(20) NOT NULL COMMENT '设备ID',
  `device_name` varchar(50) NOT NULL COMMENT '设备名称',
  `device_sn` varchar(32) NOT NULL COMMENT '设备序列号',
  `device_model` varchar(32) DEFAULT NULL COMMENT '设备规格型号',
  `device_vender_code` varchar(32) NOT NULL COMMENT '设备厂家',
  `device_type` varchar(10) NOT NULL COMMENT '设备类型',
  `creator_id` bigint(20) NOT NULL COMMENT '设备创建人',
  `create_time` datetime NOT NULL COMMENT '设备创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '设备修改时间',
  PRIMARY KEY (`device_id`),
  KEY `device_vender_code` (`device_vender_code`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `w_device_ibfk_1` FOREIGN KEY (`device_vender_code`) REFERENCES `w_device_vender` (`vender_code`),
  CONSTRAINT `w_device_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `w_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备记录表';

-- ----------------------------
-- Records of w_device
-- ----------------------------
INSERT INTO `w_device` VALUES ('811218265807257600', '逆变器', '4107003054351', 'MOD002', 'DF-TX', 'AL-CJ', '811050844479815681', '2016-12-20 22:34:40', '2016-12-22 17:44:35');
INSERT INTO `w_device` VALUES ('811565922375434240', '单点采集器', 'SN0000112', 'MOD001', 'DF-TX', 'AL-D-CJ', '811050844479815681', '2016-12-21 21:36:08', '2016-12-22 17:44:43');

-- ----------------------------
-- Table structure for w_device_replace
-- ----------------------------
DROP TABLE IF EXISTS `w_device_replace`;
CREATE TABLE `w_device_replace` (
  `record_id` bigint(20) NOT NULL COMMENT '记录ID',
  `node_id` bigint(20) NOT NULL COMMENT '采集点ID',
  `replace_time` datetime NOT NULL COMMENT '替换时间',
  `replace_descript` varchar(200) DEFAULT NULL COMMENT '替换描述',
  `operator_id` bigint(20) NOT NULL COMMENT '操作人员ID',
  PRIMARY KEY (`record_id`),
  KEY `operator_id` (`operator_id`),
  KEY `node_id` (`node_id`),
  CONSTRAINT `w_device_replace_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `w_user` (`user_id`),
  CONSTRAINT `w_device_replace_ibfk_2` FOREIGN KEY (`node_id`) REFERENCES `w_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备替换记录表';

-- ----------------------------
-- Records of w_device_replace
-- ----------------------------

-- ----------------------------
-- Table structure for w_device_vender
-- ----------------------------
DROP TABLE IF EXISTS `w_device_vender`;
CREATE TABLE `w_device_vender` (
  `vender_id` bigint(20) NOT NULL COMMENT '厂家ID',
  `vender_name` varchar(64) NOT NULL COMMENT '厂家名称',
  `vender_code` varchar(32) NOT NULL COMMENT '厂商代码',
  `vender_contacts` varchar(24) DEFAULT NULL COMMENT '厂家联系人',
  `vender_contacts_tel` varchar(20) DEFAULT NULL COMMENT '厂家联系方式',
  `vender_address` varchar(200) DEFAULT NULL COMMENT '厂家地址',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`vender_id`),
  UNIQUE KEY `vender_code` (`vender_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备厂商记录表';

-- ----------------------------
-- Records of w_device_vender
-- ----------------------------
INSERT INTO `w_device_vender` VALUES ('811214964739014656', '默认供应商', 'DF-TX', '联系人', '18518436862', '地址', '811050844479815681', '2016-12-20 22:21:33');
INSERT INTO `w_device_vender` VALUES ('811747655938998272', '默认供应商', 'DF-TX2', '联系人', '18518436862', '地址', '811050844479815681', '2016-12-22 09:38:17');

-- ----------------------------
-- Table structure for w_jurisdiction
-- ----------------------------
DROP TABLE IF EXISTS `w_jurisdiction`;
CREATE TABLE `w_jurisdiction` (
  `jurisdiction_id` bigint(20) NOT NULL COMMENT '权限字ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '权限组ID',
  `jurisdiction_name` varchar(32) NOT NULL COMMENT '权限字显示名称',
  `jurisdiction_code` varchar(64) NOT NULL COMMENT '权限字编码',
  `jurisdiction_descript` varchar(200) DEFAULT NULL COMMENT '权限字描述',
  PRIMARY KEY (`jurisdiction_id`),
  UNIQUE KEY `jurisdiction_code` (`jurisdiction_code`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `w_jurisdiction_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `w_jurisdiction_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限字记录表';

-- ----------------------------
-- Records of w_jurisdiction
-- ----------------------------
INSERT INTO `w_jurisdiction` VALUES ('810728605012197377', '810728253059760129', '新增项目', 'CreateProject', '新增项目');
INSERT INTO `w_jurisdiction` VALUES ('810728759064788993', '810728253059760129', '删除项目', 'DeleteProject', '删除项目');
INSERT INTO `w_jurisdiction` VALUES ('810728869089771520', '810728253059760129', '修改项目', 'UpdateProject', '修改项目');
INSERT INTO `w_jurisdiction` VALUES ('810728969803399168', '810728316800598017', '新增设备', 'CreateDevice', '新增设备');
INSERT INTO `w_jurisdiction` VALUES ('810761144980471808', '810728316800598017', '删除设备', 'DeleteDevice', '删除设备');
INSERT INTO `w_jurisdiction` VALUES ('810761333032091648', '810728316800598017', '修改设备', 'UpdateDevice', '修改设备');
INSERT INTO `w_jurisdiction` VALUES ('810761746997313537', '810728379702575105', '查看报表', 'ViewReport', '查看报表');
INSERT INTO `w_jurisdiction` VALUES ('810761923829170177', '810728379702575105', '导出报表', 'ExportReport', '导出报表');
INSERT INTO `w_jurisdiction` VALUES ('810762124451119105', '810728435205799937', '修改系统信息', 'UpdateCompany', '修改系统信息');
INSERT INTO `w_jurisdiction` VALUES ('810762257116954625', '810728446463311872', '新增用户', 'CreateUser', '新增用户');
INSERT INTO `w_jurisdiction` VALUES ('810762343020494848', '810728446463311872', '修改用户', 'UpdateUser', '修改用户');
INSERT INTO `w_jurisdiction` VALUES ('810762500738908161', '810728446463311872', '重设用户密码', 'ReSetUserPwd', '重设用户密码');
INSERT INTO `w_jurisdiction` VALUES ('810762615004332033', '810728446463311872', '删除用户', 'DeleteUser', '删除用户');
INSERT INTO `w_jurisdiction` VALUES ('810762711498489857', '810728446463311872', '用户角色授权', 'UserRoleAuth', '用户角色授权');
INSERT INTO `w_jurisdiction` VALUES ('810762834240602113', '810728530785599489', '新增角色', 'CreateRole', '新增角色');
INSERT INTO `w_jurisdiction` VALUES ('810762937126879233', '810728530785599489', '删除角色', 'DeleteRole', '删除角色');
INSERT INTO `w_jurisdiction` VALUES ('810763041502134273', '810728530785599489', '修改角色', 'UpdateRole', '修改角色');
INSERT INTO `w_jurisdiction` VALUES ('810763150818279425', '810728530785599489', '角色授权', 'RoleAuth', '角色授权');
INSERT INTO `w_jurisdiction` VALUES ('811041085932437505', '810728530785599489', '分配所有角色', 'AllotAllRole', '新增、修改用户信息时可分配用户所有角色');
INSERT INTO `w_jurisdiction` VALUES ('811210486103146497', '810728316800598017', '新增供应商', 'CreateDeviceVender', '新增设备供应商');
INSERT INTO `w_jurisdiction` VALUES ('811210707906330624', '810728316800598017', '删除供应商', 'DeleteDeviceVender', '删除设备供应商');
INSERT INTO `w_jurisdiction` VALUES ('811210904262672385', '810728316800598017', '修改供应商', 'UpdateDeviceVender', '修改设备供应商');
INSERT INTO `w_jurisdiction` VALUES ('811843819342397441', '811843760706027521', '发布预警', 'ReleaseWarning', '发布天气预警');

-- ----------------------------
-- Table structure for w_jurisdiction_group
-- ----------------------------
DROP TABLE IF EXISTS `w_jurisdiction_group`;
CREATE TABLE `w_jurisdiction_group` (
  `group_id` bigint(20) NOT NULL COMMENT '权限组ID',
  `group_name` varchar(32) DEFAULT NULL COMMENT '权限组名称',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组记录表';

-- ----------------------------
-- Records of w_jurisdiction_group
-- ----------------------------
INSERT INTO `w_jurisdiction_group` VALUES ('810728253059760129', '项目');
INSERT INTO `w_jurisdiction_group` VALUES ('810728316800598017', '设备');
INSERT INTO `w_jurisdiction_group` VALUES ('810728379702575105', '报表');
INSERT INTO `w_jurisdiction_group` VALUES ('810728435205799937', '系统');
INSERT INTO `w_jurisdiction_group` VALUES ('810728446463311872', '用户');
INSERT INTO `w_jurisdiction_group` VALUES ('810728530785599489', '权限');
INSERT INTO `w_jurisdiction_group` VALUES ('811843760706027521', '天气');

-- ----------------------------
-- Table structure for w_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_menu`;
CREATE TABLE `w_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单主键',
  `menu_pid` bigint(20) DEFAULT NULL COMMENT '父级菜单ID',
  `menu_name` varchar(20) NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(40) NOT NULL DEFAULT 'fa fa-angle-right' COMMENT '菜单图标',
  `menu_url` varchar(40) DEFAULT NULL COMMENT '菜单链接',
  `menu_order` int(11) NOT NULL DEFAULT '10' COMMENT '字段排序',
  `has_child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有子级菜单',
  `is_root` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是根节点',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单记录表';

-- ----------------------------
-- Records of w_menu
-- ----------------------------
INSERT INTO `w_menu` VALUES ('808488612369793024', null, '项目', 'fa fa-cloud', null, '1', '1', '1');
INSERT INTO `w_menu` VALUES ('808489456163094528', '808488612369793024', '项目管理', 'fa fa-angle-right', 'develop/subject.jspx', '10', '0', '0');
INSERT INTO `w_menu` VALUES ('808489568666910720', '808488612369793024', '新增项目', 'fa fa-angle-right', 'develop/subject/create.jspx', '11', '0', '0');
INSERT INTO `w_menu` VALUES ('808489962428170240', null, '设备', 'fa fa-sitemap', '', '2', '1', '1');
INSERT INTO `w_menu` VALUES ('808490074931986432', '808489962428170240', '设备管理', 'fa fa-angle-right', 'device/list.jspx', '10', '0', '0');
INSERT INTO `w_menu` VALUES ('808490468689051648', null, '报表', 'fa fa-file-word-o', null, '3', '1', '1');
INSERT INTO `w_menu` VALUES ('808490637446873088', '808490468689051648', '报表管理', 'fa fa-angle-right', 'develop/report.jspx', '10', '0', '0');
INSERT INTO `w_menu` VALUES ('808490806200500224', null, '系统', 'fa fa-black-tie', null, '7', '1', '1');
INSERT INTO `w_menu` VALUES ('808490918708510720', '808490806200500224', '系统信息', 'fa fa-angle-right', 'company/info.jspx', '5', '0', '0');
INSERT INTO `w_menu` VALUES ('808491031212326912', null, '用户', 'fa fa-user', null, '5', '1', '1');
INSERT INTO `w_menu` VALUES ('808491199965954048', '808491031212326912', '用户管理', 'fa fa-angle-right', 'user/list.jspx', '10', '0', '0');
INSERT INTO `w_menu` VALUES ('808491537481596928', null, '权限', 'fa fa-yelp', null, '6', '1', '1');
INSERT INTO `w_menu` VALUES ('808491649981218816', '808491537481596928', '角色管理', 'fa fa-angle-right', 'role/list.jspx', '10', '0', '0');
INSERT INTO `w_menu` VALUES ('811224404787724289', '808489962428170240', '设备供应商', 'fa fa-angle-right', 'device/vender/list.jspx', '12', '0', '0');
INSERT INTO `w_menu` VALUES ('811778992968302593', '808490806200500224', '天气服务', 'fa fa-angle-right', 'weather/info.jspx', '10', '0', '0');

-- ----------------------------
-- Table structure for w_node
-- ----------------------------
DROP TABLE IF EXISTS `w_node`;
CREATE TABLE `w_node` (
  `node_id` bigint(20) NOT NULL COMMENT '采集点ID',
  `pump_id` bigint(20) NOT NULL COMMENT '所属终端',
  `device_id` bigint(20) NOT NULL COMMENT '采集点对应的设备ID',
  `node_name` varchar(32) NOT NULL COMMENT '采集点名称',
  `node_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '节点在线状态',
  `last_time_contact_time` datetime DEFAULT NULL COMMENT '上次联系时间',
  `regist_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`node_id`),
  KEY `device_id` (`device_id`),
  KEY `w_node_ibfk_2` (`pump_id`),
  CONSTRAINT `w_node_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `w_device` (`device_id`),
  CONSTRAINT `w_node_ibfk_2` FOREIGN KEY (`pump_id`) REFERENCES `w_pump` (`pump_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集节点记录表';

-- ----------------------------
-- Records of w_node
-- ----------------------------

-- ----------------------------
-- Table structure for w_node_data
-- ----------------------------
DROP TABLE IF EXISTS `w_node_data`;
CREATE TABLE `w_node_data` (
  `data_id` bigint(20) NOT NULL COMMENT '数据ID',
  `node_id` bigint(20) NOT NULL COMMENT '采集点ID',
  `back_water_temp` decimal(10,2) DEFAULT NULL COMMENT '回水温度',
  `out_water_temp` decimal(10,2) DEFAULT NULL COMMENT '出水温度',
  `environment_temp` decimal(10,2) DEFAULT NULL COMMENT '环境温度',
  `compressor_current` decimal(10,2) DEFAULT NULL COMMENT '压缩机电流',
  `water_tank_temp` decimal(10,2) DEFAULT NULL COMMENT '水箱温度',
  `work_mode` varchar(20) DEFAULT NULL COMMENT '工作模式',
  `warn_code` varchar(20) DEFAULT NULL COMMENT '故障代码',
  `back_air_temp` decimal(10,2) DEFAULT NULL COMMENT '回气温度',
  `out_air_temp` decimal(10,2) DEFAULT NULL COMMENT '排气温度',
  `set_up_temp` decimal(10,2) DEFAULT NULL COMMENT '设置温度',
  `indoor_temp` decimal(10,2) DEFAULT NULL COMMENT '室内温度',
  `collect_time` datetime DEFAULT NULL COMMENT '采集时间',
  PRIMARY KEY (`data_id`),
  UNIQUE KEY `node_id` (`node_id`,`collect_time`) USING BTREE,
  CONSTRAINT `w_node_data_ibfk_1` FOREIGN KEY (`node_id`) REFERENCES `w_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点实时数据记录表';

-- ----------------------------
-- Records of w_node_data
-- ----------------------------

-- ----------------------------
-- Table structure for w_node_status
-- ----------------------------
DROP TABLE IF EXISTS `w_node_status`;
CREATE TABLE `w_node_status` (
  `node_id` bigint(20) NOT NULL COMMENT '采集点ID',
  `back_water_temp` decimal(10,2) DEFAULT NULL COMMENT '回水温度',
  `out_water_temp` decimal(10,2) DEFAULT NULL COMMENT '出水温度',
  `environment_temp` decimal(10,2) DEFAULT NULL COMMENT '环境温度',
  `compressor_current` decimal(10,2) DEFAULT NULL COMMENT '压缩机电流',
  `water_tank_temp` decimal(10,2) DEFAULT NULL COMMENT '水箱温度',
  `work_mode` varchar(20) DEFAULT NULL COMMENT '工作模式',
  `warn_code` varchar(20) DEFAULT NULL COMMENT '故障代码',
  `back_air_temp` decimal(10,2) DEFAULT NULL COMMENT '回气温度',
  `out_air_temp` decimal(10,2) DEFAULT NULL COMMENT '排气温度',
  `set_up_temp` decimal(10,2) DEFAULT NULL COMMENT '设置温度',
  `indoor_temp` decimal(10,2) DEFAULT NULL COMMENT '室内温度',
  `collect_time` datetime DEFAULT NULL COMMENT '采集时间',
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `node_id` (`node_id`) USING BTREE,
  CONSTRAINT `w_node_status_ibfk_1` FOREIGN KEY (`node_id`) REFERENCES `w_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点实时状态记录表';

-- ----------------------------
-- Records of w_node_status
-- ----------------------------

-- ----------------------------
-- Table structure for w_packet
-- ----------------------------
DROP TABLE IF EXISTS `w_packet`;
CREATE TABLE `w_packet` (
  `packet_id` bigint(20) NOT NULL COMMENT '报文数据ID',
  `packet_type` varchar(20) NOT NULL COMMENT '报文类型',
  `packet_data` varchar(2000) NOT NULL COMMENT '报文数据',
  `collect_time` datetime DEFAULT NULL COMMENT '采集时间',
  PRIMARY KEY (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报文历史记录';

-- ----------------------------
-- Records of w_packet
-- ----------------------------

-- ----------------------------
-- Table structure for w_packet_query
-- ----------------------------
DROP TABLE IF EXISTS `w_packet_query`;
CREATE TABLE `w_packet_query` (
  `packet_id` bigint(20) NOT NULL COMMENT '报文数据ID',
  `packet_type` varchar(20) NOT NULL COMMENT '报文类型',
  `packet_data` varchar(2000) NOT NULL COMMENT '报文数据',
  `packet_status` enum('A','R','E') DEFAULT 'A' COMMENT '数据包解析状态：A:未解析，R:入库错误，E:解析错误',
  `collect_time` datetime DEFAULT NULL COMMENT '采集时间',
  PRIMARY KEY (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报文队列记录';

-- ----------------------------
-- Records of w_packet_query
-- ----------------------------

-- ----------------------------
-- Table structure for w_pump
-- ----------------------------
DROP TABLE IF EXISTS `w_pump`;
CREATE TABLE `w_pump` (
  `pump_id` bigint(20) NOT NULL COMMENT '热泵ID',
  `pump_name` varchar(32) NOT NULL COMMENT '热泵名称',
  `pump_owner_id` bigint(20) NOT NULL COMMENT '热泵所有人ID',
  `pump_operator_id` bigint(20) DEFAULT NULL COMMENT '热泵负责人',
  `pump_city_code` varchar(16) NOT NULL COMMENT '热泵所在区域天气城市编码',
  `pump_longitude` varchar(20) DEFAULT NULL COMMENT '热泵经度',
  `pump_latitude` varchar(20) DEFAULT NULL COMMENT '热泵纬度',
  `pump_address` varchar(200) DEFAULT NULL COMMENT '热泵详细地址',
  `pump_create_time` datetime NOT NULL COMMENT '热泵创建时间',
  `pump_modify_time` datetime NOT NULL COMMENT '热泵修改时间',
  PRIMARY KEY (`pump_id`),
  KEY `w_pump_ibfk_1` (`pump_city_code`),
  KEY `pump_owner_id` (`pump_owner_id`),
  KEY `pump_operator_id` (`pump_operator_id`),
  CONSTRAINT `w_pump_ibfk_1` FOREIGN KEY (`pump_city_code`) REFERENCES `w_weather_city` (`code`),
  CONSTRAINT `w_pump_ibfk_2` FOREIGN KEY (`pump_owner_id`) REFERENCES `w_user` (`user_id`),
  CONSTRAINT `w_pump_ibfk_3` FOREIGN KEY (`pump_operator_id`) REFERENCES `w_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热泵记录表';

-- ----------------------------
-- Records of w_pump
-- ----------------------------
INSERT INTO `w_pump` VALUES ('1', '1', '811050844479815681', '811051028219691009', 'CN101010100', null, null, null, '2016-12-20 14:52:47', '2016-12-20 14:52:51');

-- ----------------------------
-- Table structure for w_pump_warn_group
-- ----------------------------
DROP TABLE IF EXISTS `w_pump_warn_group`;
CREATE TABLE `w_pump_warn_group` (
  `pump_id` bigint(20) NOT NULL COMMENT '热泵ID',
  `warn_group_id` bigint(20) NOT NULL COMMENT '告警组ID',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`pump_id`,`warn_group_id`),
  UNIQUE KEY `pump_id` (`pump_id`,`warn_group_id`),
  KEY `warn_group_id` (`warn_group_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `w_pump_warn_group_ibfk_1` FOREIGN KEY (`pump_id`) REFERENCES `w_pump` (`pump_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_pump_warn_group_ibfk_2` FOREIGN KEY (`warn_group_id`) REFERENCES `w_warn_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_pump_warn_group_ibfk_3` FOREIGN KEY (`creator_id`) REFERENCES `w_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热泵告警组关联';

-- ----------------------------
-- Records of w_pump_warn_group
-- ----------------------------

-- ----------------------------
-- Table structure for w_res
-- ----------------------------
DROP TABLE IF EXISTS `w_res`;
CREATE TABLE `w_res` (
  `res_id` bigint(20) NOT NULL COMMENT '资源ID',
  `group_id` bigint(20) NOT NULL COMMENT '资源组ID',
  `owner_id` bigint(20) NOT NULL COMMENT '所有人ID',
  `res_name` varchar(128) NOT NULL COMMENT '资源名称',
  `res_type` varchar(64) NOT NULL COMMENT '资源类型',
  `res_path` varchar(128) NOT NULL COMMENT '资源路径',
  `res_size` bigint(20) NOT NULL COMMENT '资源大小',
  `res_create_time` datetime DEFAULT NULL COMMENT '资源创建时间',
  PRIMARY KEY (`res_id`),
  KEY `owner_id` (`owner_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `w_res_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `w_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源附件信息记录表';

-- ----------------------------
-- Records of w_res
-- ----------------------------

-- ----------------------------
-- Table structure for w_role
-- ----------------------------
DROP TABLE IF EXISTS `w_role`;
CREATE TABLE `w_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `system_role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统角色',
  `role_create_time` datetime NOT NULL COMMENT '角色创建时间',
  `role_modify_time` datetime NOT NULL COMMENT '角色修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色记录表';

-- ----------------------------
-- Records of w_role
-- ----------------------------
INSERT INTO `w_role` VALUES ('809009869884489728', '运维', '1', '2016-12-14 20:19:51', '2016-12-14 20:19:54');
INSERT INTO `w_role` VALUES ('809010263649943552', '农户', '1', '2016-12-14 20:21:09', '2016-12-14 20:21:11');
INSERT INTO `w_role` VALUES ('809010376153759744', '政府机构', '1', '2016-12-14 20:18:50', '2016-12-14 20:18:52');
INSERT INTO `w_role` VALUES ('809010432411959296', '设备厂家', '1', '2016-12-14 20:19:28', '2016-12-14 20:19:30');
INSERT INTO `w_role` VALUES ('809010544915775488', '供电局', '1', '2016-12-14 20:20:47', '2016-12-14 20:20:49');
INSERT INTO `w_role` VALUES ('809010994926845952', '业务专家', '1', '2016-12-14 20:20:14', '2016-12-14 20:20:17');
INSERT INTO `w_role` VALUES ('809601566439899136', 'Administrator', '1', '2016-12-16 11:30:43', '2016-12-16 11:30:45');

-- ----------------------------
-- Table structure for w_role_jurisdiction
-- ----------------------------
DROP TABLE IF EXISTS `w_role_jurisdiction`;
CREATE TABLE `w_role_jurisdiction` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `jurisdiction_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`jurisdiction_id`),
  UNIQUE KEY `jurisdiction_id` (`jurisdiction_id`,`role_id`) USING BTREE,
  CONSTRAINT `w_role_jurisdiction_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `w_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_role_jurisdiction_ibfk_2` FOREIGN KEY (`jurisdiction_id`) REFERENCES `w_jurisdiction` (`jurisdiction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联记录表';

-- ----------------------------
-- Records of w_role_jurisdiction
-- ----------------------------
INSERT INTO `w_role_jurisdiction` VALUES ('809009869884489728', '810762343020494848');
INSERT INTO `w_role_jurisdiction` VALUES ('809009869884489728', '810762500738908161');
INSERT INTO `w_role_jurisdiction` VALUES ('809010544915775488', '810728759064788993');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810728605012197377');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810728759064788993');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810728869089771520');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810728969803399168');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810761144980471808');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810761333032091648');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810761746997313537');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810761923829170177');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762124451119105');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762257116954625');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762343020494848');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762500738908161');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762615004332033');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762711498489857');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762834240602113');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810762937126879233');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810763041502134273');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '810763150818279425');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '811041085932437505');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '811210486103146497');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '811210707906330624');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '811210904262672385');
INSERT INTO `w_role_jurisdiction` VALUES ('809601566439899136', '811843819342397441');

-- ----------------------------
-- Table structure for w_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_role_menu`;
CREATE TABLE `w_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_pid` bigint(20) NOT NULL COMMENT '父级菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`),
  UNIQUE KEY `role_id` (`role_id`,`menu_id`) USING BTREE,
  KEY `menu_id` (`menu_id`),
  KEY `menu_pid` (`menu_pid`),
  CONSTRAINT `w_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `w_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `w_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_role_menu_ibfk_3` FOREIGN KEY (`menu_pid`) REFERENCES `w_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联记录表';

-- ----------------------------
-- Records of w_role_menu
-- ----------------------------
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808489456163094528', '808488612369793024');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808489568666910720', '808488612369793024');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808490074931986432', '808489962428170240');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '811224404787724289', '808489962428170240');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808490637446873088', '808490468689051648');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808490918708510720', '808490806200500224');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '811778992968302593', '808490806200500224');
INSERT INTO `w_role_menu` VALUES ('809009869884489728', '808491199965954048', '808491031212326912');
INSERT INTO `w_role_menu` VALUES ('809010263649943552', '808491199965954048', '808491031212326912');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808491199965954048', '808491031212326912');
INSERT INTO `w_role_menu` VALUES ('809009869884489728', '808491649981218816', '808491537481596928');
INSERT INTO `w_role_menu` VALUES ('809601566439899136', '808491649981218816', '808491537481596928');

-- ----------------------------
-- Table structure for w_sms
-- ----------------------------
DROP TABLE IF EXISTS `w_sms`;
CREATE TABLE `w_sms` (
  `sms_id` bigint(20) NOT NULL COMMENT '短信ID',
  `sms_phone_no` varchar(20) DEFAULT NULL COMMENT '发送手机号',
  `sms_message` varchar(200) DEFAULT NULL COMMENT '短信消息',
  `sms_send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统短信发送记录表';

-- ----------------------------
-- Records of w_sms
-- ----------------------------

-- ----------------------------
-- Table structure for w_stoppage
-- ----------------------------
DROP TABLE IF EXISTS `w_stoppage`;
CREATE TABLE `w_stoppage` (
  `stoppage_id` bigint(20) NOT NULL COMMENT '故障ID',
  `warn_id` bigint(20) DEFAULT NULL COMMENT '告警ID（如果存在，怎是由于告警产生的故障信息，不存在则是人为新增的故障信息）',
  `stoppage_no` varchar(32) DEFAULT NULL COMMENT '故障单号',
  `node_id` bigint(20) NOT NULL COMMENT '节点ID',
  `descript` varchar(1000) DEFAULT NULL COMMENT '故障描述',
  `attach_id` bigint(20) NOT NULL COMMENT '附件ID（对应资源表中的group_id）',
  `originator_id` bigint(20) NOT NULL COMMENT '发起人ID',
  `occur_time` datetime DEFAULT NULL COMMENT '发生时间',
  `handle_status` enum('Y','D','N') NOT NULL DEFAULT 'N' COMMENT '当前处理状态(Y:已处理，D:处理中，N:未处理)',
  `handle_modify_time` datetime DEFAULT NULL COMMENT '最后处理时间',
  PRIMARY KEY (`stoppage_id`),
  KEY `node_id` (`node_id`),
  KEY `originator_id` (`originator_id`),
  KEY `warn_id` (`warn_id`),
  CONSTRAINT `w_stoppage_ibfk_1` FOREIGN KEY (`node_id`) REFERENCES `w_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_stoppage_ibfk_2` FOREIGN KEY (`originator_id`) REFERENCES `w_user` (`user_id`),
  CONSTRAINT `w_stoppage_ibfk_3` FOREIGN KEY (`warn_id`) REFERENCES `w_warn` (`warn_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障信息记录表';

-- ----------------------------
-- Records of w_stoppage
-- ----------------------------

-- ----------------------------
-- Table structure for w_stoppage_handle
-- ----------------------------
DROP TABLE IF EXISTS `w_stoppage_handle`;
CREATE TABLE `w_stoppage_handle` (
  `stoppage_handle_id` bigint(20) NOT NULL COMMENT '故障处理记录ID',
  `stoppage_id` bigint(20) NOT NULL COMMENT '故障ID',
  `handle_user_id` bigint(20) NOT NULL COMMENT '处理人ID',
  `handle_time` datetime NOT NULL COMMENT '处理时间',
  `handle_duration` bigint(20) DEFAULT NULL COMMENT '处理时长',
  `handle_status` varchar(5) NOT NULL COMMENT '处理故障状态',
  `handle_descript` varchar(200) NOT NULL COMMENT '处理描述',
  PRIMARY KEY (`stoppage_handle_id`),
  KEY `warn_id` (`stoppage_id`),
  KEY `handle_user_id` (`handle_user_id`),
  CONSTRAINT `w_stoppage_handle_ibfk_1` FOREIGN KEY (`stoppage_id`) REFERENCES `w_stoppage` (`stoppage_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_stoppage_handle_ibfk_2` FOREIGN KEY (`handle_user_id`) REFERENCES `w_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障处理记录表';

-- ----------------------------
-- Records of w_stoppage_handle
-- ----------------------------

-- ----------------------------
-- Table structure for w_stoppage_handle_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `w_stoppage_handle_evaluate`;
CREATE TABLE `w_stoppage_handle_evaluate` (
  `evaluate_id` bigint(20) NOT NULL COMMENT '处理评价记录ID',
  `stoppage_handle_id` bigint(20) NOT NULL COMMENT '故障处理记录ID',
  `evaluate_user_id` bigint(20) NOT NULL COMMENT '处理人ID',
  `evaluate_time` datetime NOT NULL COMMENT '处理时间',
  `evaluate_level` enum('A','B','C','D','E') NOT NULL DEFAULT 'C' COMMENT '处理评价级别(A:很好5星，B:好4星，C:一般3星，D:不好2星，E:很不好1星)',
  `evaluate_descript` varchar(200) DEFAULT NULL COMMENT '处理评价描述',
  PRIMARY KEY (`evaluate_id`),
  KEY `stoppage_handle_id` (`stoppage_handle_id`),
  KEY `evaluate_user_id` (`evaluate_user_id`),
  CONSTRAINT `w_stoppage_handle_evaluate_ibfk_1` FOREIGN KEY (`stoppage_handle_id`) REFERENCES `w_stoppage_handle` (`stoppage_handle_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_stoppage_handle_evaluate_ibfk_2` FOREIGN KEY (`evaluate_user_id`) REFERENCES `w_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障处理记录表';

-- ----------------------------
-- Records of w_stoppage_handle_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for w_system
-- ----------------------------
DROP TABLE IF EXISTS `w_system`;
CREATE TABLE `w_system` (
  `system_id` bigint(20) NOT NULL COMMENT '系统主键',
  `system_logo_url` varchar(100) NOT NULL COMMENT '系统LOGO路径',
  `system_title` varchar(40) NOT NULL,
  `system_jian_pin` varchar(5) NOT NULL,
  `system_technical_support` varchar(100) NOT NULL COMMENT '技术支持',
  `system_modify_time` datetime NOT NULL COMMENT '系统信息最后修改时间',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统基本信息记录表';

-- ----------------------------
-- Records of w_system
-- ----------------------------
INSERT INTO `w_system` VALUES ('0', 'upload/20161222/811797956138106880.png', 'Demo演示系统', 'DM', 'Demo演示系统 © copyright 2016 仲夏技术支持', '2016-12-22 12:58:09');

-- ----------------------------
-- Table structure for w_user
-- ----------------------------
DROP TABLE IF EXISTS `w_user`;
CREATE TABLE `w_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户主键',
  `user_login_name` varchar(20) NOT NULL COMMENT '用户登录名称',
  `user_name` varchar(255) NOT NULL COMMENT '用户显示名称',
  `user_name_py` varchar(1000) NOT NULL COMMENT '用户名称拼音',
  `user_phone` varchar(20) NOT NULL COMMENT '用户手机号码',
  `user_password` varchar(128) NOT NULL COMMENT '用户登录密码',
  `role_id` bigint(20) NOT NULL COMMENT '用户角色',
  `user_portrait_path` varchar(200) NOT NULL DEFAULT 'resources/img/default_head_124x124.png' COMMENT '用户头像地址',
  `user_wx_open_id` varchar(128) DEFAULT NULL COMMENT '用户绑定的微信OPENID',
  `user_disable_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户禁用状态',
  `user_regist_time` datetime NOT NULL COMMENT '用户注册时间',
  `user_modify_time` datetime DEFAULT NULL COMMENT '用户最后修改时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_login_name` (`user_login_name`),
  UNIQUE KEY `user_phone` (`user_phone`),
  UNIQUE KEY `user_wx_open_id` (`user_wx_open_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `w_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `w_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息记录表';

-- ----------------------------
-- Records of w_user
-- ----------------------------
INSERT INTO `w_user` VALUES ('811050844479815681', 'admin', '系统管理员', 'xtgly;xitongguanliyuan', '15503832989', '7c4a8d09ca3762af61e59520943dc26494f8941b', '809601566439899136', 'resources/img/default_head_124x124.png', '', '0', '2016-12-14 20:24:13', '2016-12-22 11:36:36');
INSERT INTO `w_user` VALUES ('811051028219691009', 'sizhongxia', '司仲夏', 'sizhongxia', '18518436862', '7c4a8d09ca3762af61e59520943dc26494f8941b', '809009869884489728', 'resources/img/default_head_124x124.png', null, '0', '2016-12-14 20:24:13', '2016-12-22 11:36:55');
INSERT INTO `w_user` VALUES ('811119052691865600', 'wangting', '王停', 'wt;wangting', '18612983067', '7c4a8d09ca3762af61e59520943dc26494f8941b', '809010994926845952', 'resources/img/default_head_124x124.png', null, '0', '2016-12-20 16:00:26', '2016-12-22 11:36:29');

-- ----------------------------
-- Table structure for w_warn
-- ----------------------------
DROP TABLE IF EXISTS `w_warn`;
CREATE TABLE `w_warn` (
  `warn_id` bigint(20) NOT NULL COMMENT '告警ID',
  `warn_no` varchar(20) NOT NULL COMMENT '告警编码',
  `node_id` bigint(20) NOT NULL COMMENT '产生节点',
  `warn_code` varchar(32) DEFAULT NULL COMMENT '告警代码',
  `warn_level` enum('通知','四级','三级','二级','一级') NOT NULL DEFAULT '通知' COMMENT '告警级别',
  `warn_descript` varchar(200) DEFAULT NULL COMMENT '告警描述',
  `warn_status` enum('Y','D','N') NOT NULL DEFAULT 'N' COMMENT '告警状态(Y:已处理，D:处理中，N:未处理)',
  `warn_happen_time` datetime NOT NULL COMMENT '告警发生时间',
  `warn_modify_time` datetime DEFAULT NULL COMMENT '最后处理时间',
  PRIMARY KEY (`warn_id`),
  KEY `node_id` (`node_id`),
  CONSTRAINT `w_warn_ibfk_1` FOREIGN KEY (`node_id`) REFERENCES `w_node` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警记录表';

-- ----------------------------
-- Records of w_warn
-- ----------------------------

-- ----------------------------
-- Table structure for w_warn_group
-- ----------------------------
DROP TABLE IF EXISTS `w_warn_group`;
CREATE TABLE `w_warn_group` (
  `group_id` bigint(20) NOT NULL COMMENT '告警组ID',
  `group_name` varchar(32) NOT NULL COMMENT '告警组名称',
  `group_descript` varchar(200) DEFAULT NULL COMMENT '告警组描述',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`group_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `w_warn_group_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `w_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警组数据表';

-- ----------------------------
-- Records of w_warn_group
-- ----------------------------

-- ----------------------------
-- Table structure for w_warn_group_item
-- ----------------------------
DROP TABLE IF EXISTS `w_warn_group_item`;
CREATE TABLE `w_warn_group_item` (
  `item_id` bigint(20) NOT NULL COMMENT '告警监测项ID',
  `warn_group_id` bigint(20) NOT NULL COMMENT '告警组ID',
  `item_name` varchar(64) NOT NULL COMMENT '告警名称',
  `item_threshold` varchar(64) NOT NULL COMMENT '告警阀值',
  `item_operators` enum('GT','EQ','LT') NOT NULL COMMENT '操作符：GT:大于，LT:小于，EQ:等于',
  `warn_code` varchar(32) DEFAULT NULL COMMENT '告警编码',
  `warn_level` enum('通知','四级','三级','二级','一级') DEFAULT '通知' COMMENT '告警级别',
  `sms_notice` tinyint(1) DEFAULT '0' COMMENT '是否发送短信通知',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`item_id`),
  KEY `warn_group_id` (`warn_group_id`),
  KEY `creator_id` (`creator_id`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `w_warn_group_item_ibfk_1` FOREIGN KEY (`warn_group_id`) REFERENCES `w_warn_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w_warn_group_item_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `w_user` (`user_id`),
  CONSTRAINT `w_warn_group_item_ibfk_3` FOREIGN KEY (`item_name`) REFERENCES `w_warn_monitor_item` (`item_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警项记录信息表';

-- ----------------------------
-- Records of w_warn_group_item
-- ----------------------------

-- ----------------------------
-- Table structure for w_warn_monitor_item
-- ----------------------------
DROP TABLE IF EXISTS `w_warn_monitor_item`;
CREATE TABLE `w_warn_monitor_item` (
  `item_name` varchar(64) NOT NULL COMMENT '监测名称',
  `item_descript` varchar(200) DEFAULT NULL COMMENT '检测名称说明',
  PRIMARY KEY (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监测项描述信息记录表';

-- ----------------------------
-- Records of w_warn_monitor_item
-- ----------------------------

-- ----------------------------
-- Table structure for w_weather_alarm
-- ----------------------------
DROP TABLE IF EXISTS `w_weather_alarm`;
CREATE TABLE `w_weather_alarm` (
  `weather_city_code` varchar(16) NOT NULL COMMENT '预警天气城市编码',
  `early_warn_time` date NOT NULL COMMENT '发布时间',
  `early_warn_level` varchar(6) NOT NULL COMMENT '预警级别',
  `early_warn_stat` varchar(10) NOT NULL COMMENT '预警状态',
  `early_warn_type` varchar(6) NOT NULL COMMENT '预警类别',
  `early_warn_title` varchar(80) NOT NULL COMMENT '预警标题',
  `early_warn_txt` varchar(500) NOT NULL COMMENT '预警说明',
  PRIMARY KEY (`weather_city_code`),
  UNIQUE KEY `weather_city_code` (`weather_city_code`),
  CONSTRAINT `w_weather_alarm_ibfk_1` FOREIGN KEY (`weather_city_code`) REFERENCES `w_weather_city` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='天气实时预警信息表';

-- ----------------------------
-- Records of w_weather_alarm
-- ----------------------------
INSERT INTO `w_weather_alarm` VALUES ('CN101160804', '2016-12-22', '黄色', '预警中', '暴雨', '预警标题', '预警描述');
INSERT INTO `w_weather_alarm` VALUES ('CN101271901', '2016-12-22', '红色', '预警中', '暴雨', '预警标题', '预警描述');

-- ----------------------------
-- Table structure for w_weather_city
-- ----------------------------
DROP TABLE IF EXISTS `w_weather_city`;
CREATE TABLE `w_weather_city` (
  `code` varchar(16) NOT NULL COMMENT '天气城市编码',
  `province` varchar(24) DEFAULT NULL COMMENT '省份',
  `city` varchar(24) DEFAULT NULL COMMENT '城市',
  `county` varchar(24) DEFAULT NULL COMMENT '县',
  `spell` varchar(64) DEFAULT NULL COMMENT '县拼音',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='天气城市';

-- ----------------------------
-- Records of w_weather_city
-- ----------------------------
INSERT INTO `w_weather_city` VALUES ('CN101010100', '北京', '北京', '北京', 'beijing');
INSERT INTO `w_weather_city` VALUES ('CN101010200', '北京', '北京', '海淀', 'haidian');
INSERT INTO `w_weather_city` VALUES ('CN101010300', '北京', '北京', '朝阳', 'chaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101010400', '北京', '北京', '顺义', 'shunyi');
INSERT INTO `w_weather_city` VALUES ('CN101010500', '北京', '北京', '怀柔', 'huairou');
INSERT INTO `w_weather_city` VALUES ('CN101010600', '北京', '北京', '通州', 'tongzhou');
INSERT INTO `w_weather_city` VALUES ('CN101010700', '北京', '北京', '昌平', 'changping');
INSERT INTO `w_weather_city` VALUES ('CN101010800', '北京', '北京', '延庆', 'yanqing');
INSERT INTO `w_weather_city` VALUES ('CN101010900', '北京', '北京', '丰台', 'fengtai');
INSERT INTO `w_weather_city` VALUES ('CN101011000', '北京', '北京', '石景山', 'shijingshan');
INSERT INTO `w_weather_city` VALUES ('CN101011100', '北京', '北京', '大兴', 'daxing');
INSERT INTO `w_weather_city` VALUES ('CN101011200', '北京', '北京', '房山', 'fangshan');
INSERT INTO `w_weather_city` VALUES ('CN101011300', '北京', '北京', '密云', 'miyun');
INSERT INTO `w_weather_city` VALUES ('CN101011400', '北京', '北京', '门头沟', 'mentougou');
INSERT INTO `w_weather_city` VALUES ('CN101011500', '北京', '北京', '平谷', 'pinggu');
INSERT INTO `w_weather_city` VALUES ('CN101020100', '上海', '上海', '上海', 'shanghai');
INSERT INTO `w_weather_city` VALUES ('CN101020200', '上海', '上海', '闵行', 'minhang');
INSERT INTO `w_weather_city` VALUES ('CN101020300', '上海', '上海', '宝山', 'baoshan');
INSERT INTO `w_weather_city` VALUES ('CN101020500', '上海', '上海', '嘉定', 'jiading');
INSERT INTO `w_weather_city` VALUES ('CN101020600', '上海', '上海', '浦东南汇', 'nanhui');
INSERT INTO `w_weather_city` VALUES ('CN101020700', '上海', '上海', '金山', 'jinshan');
INSERT INTO `w_weather_city` VALUES ('CN101020800', '上海', '上海', '青浦', 'qingpu');
INSERT INTO `w_weather_city` VALUES ('CN101020900', '上海', '上海', '松江', 'songjiang');
INSERT INTO `w_weather_city` VALUES ('CN101021000', '上海', '上海', '奉贤', 'fengxian');
INSERT INTO `w_weather_city` VALUES ('CN101021100', '上海', '上海', '崇明', 'chongming');
INSERT INTO `w_weather_city` VALUES ('CN101021200', '上海', '上海', '徐家汇', 'xujiahui');
INSERT INTO `w_weather_city` VALUES ('CN101021300', '上海', '上海', '浦东', 'pudong');
INSERT INTO `w_weather_city` VALUES ('CN101030100', '天津', '天津', '天津', 'tianjin');
INSERT INTO `w_weather_city` VALUES ('CN101030200', '天津', '天津', '武清', 'wuqing');
INSERT INTO `w_weather_city` VALUES ('CN101030300', '天津', '天津', '宝坻', 'baodi');
INSERT INTO `w_weather_city` VALUES ('CN101030400', '天津', '天津', '东丽', 'dongli');
INSERT INTO `w_weather_city` VALUES ('CN101030500', '天津', '天津', '西青', 'xiqing');
INSERT INTO `w_weather_city` VALUES ('CN101030600', '天津', '天津', '北辰', 'beichen');
INSERT INTO `w_weather_city` VALUES ('CN101030700', '天津', '天津', '宁河', 'ninghe');
INSERT INTO `w_weather_city` VALUES ('CN101030800', '天津', '天津', '汉沽', 'hangu');
INSERT INTO `w_weather_city` VALUES ('CN101030900', '天津', '天津', '静海', 'jinghai');
INSERT INTO `w_weather_city` VALUES ('CN101031000', '天津', '天津', '津南', 'jinnan');
INSERT INTO `w_weather_city` VALUES ('CN101031100', '天津', '天津', '塘沽', 'tanggu');
INSERT INTO `w_weather_city` VALUES ('CN101031200', '天津', '天津', '大港', 'dagang');
INSERT INTO `w_weather_city` VALUES ('CN101031400', '天津', '天津', '蓟县', 'jixian');
INSERT INTO `w_weather_city` VALUES ('CN101040100', '重庆', '重庆', '重庆', 'chongqing');
INSERT INTO `w_weather_city` VALUES ('CN101040200', '重庆', '重庆', '永川', 'yongchuan');
INSERT INTO `w_weather_city` VALUES ('CN101040300', '重庆', '重庆', '合川', 'hechuan');
INSERT INTO `w_weather_city` VALUES ('CN101040400', '重庆', '重庆', '南川', 'nanchuan');
INSERT INTO `w_weather_city` VALUES ('CN101040500', '重庆', '重庆', '江津', 'jiangjin');
INSERT INTO `w_weather_city` VALUES ('CN101040600', '重庆', '重庆', '万盛', 'wansheng');
INSERT INTO `w_weather_city` VALUES ('CN101040700', '重庆', '重庆', '渝北', 'yubei');
INSERT INTO `w_weather_city` VALUES ('CN101040800', '重庆', '重庆', '北碚', 'beibei');
INSERT INTO `w_weather_city` VALUES ('CN101040900', '重庆', '重庆', '巴南', 'banan');
INSERT INTO `w_weather_city` VALUES ('CN101041000', '重庆', '重庆', '长寿', 'changshou');
INSERT INTO `w_weather_city` VALUES ('CN101041100', '重庆', '重庆', '黔江', 'qianjiang');
INSERT INTO `w_weather_city` VALUES ('CN101041300', '重庆', '重庆', '万州', 'wanzhou');
INSERT INTO `w_weather_city` VALUES ('CN101041400', '重庆', '重庆', '涪陵', 'fuling');
INSERT INTO `w_weather_city` VALUES ('CN101041500', '重庆', '重庆', '开县', 'kaixian');
INSERT INTO `w_weather_city` VALUES ('CN101041600', '重庆', '重庆', '城口', 'chengkou');
INSERT INTO `w_weather_city` VALUES ('CN101041700', '重庆', '重庆', '云阳', 'yunyang');
INSERT INTO `w_weather_city` VALUES ('CN101041800', '重庆', '重庆', '巫溪', 'wuxi');
INSERT INTO `w_weather_city` VALUES ('CN101041900', '重庆', '重庆', '奉节', 'fengjie');
INSERT INTO `w_weather_city` VALUES ('CN101042000', '重庆', '重庆', '巫山', 'wushan');
INSERT INTO `w_weather_city` VALUES ('CN101042100', '重庆', '重庆', '潼南', 'tongnan');
INSERT INTO `w_weather_city` VALUES ('CN101042200', '重庆', '重庆', '垫江', 'dianjiang');
INSERT INTO `w_weather_city` VALUES ('CN101042300', '重庆', '重庆', '梁平', 'liangping');
INSERT INTO `w_weather_city` VALUES ('CN101042400', '重庆', '重庆', '忠县', 'zhongxian');
INSERT INTO `w_weather_city` VALUES ('CN101042500', '重庆', '重庆', '石柱', 'shizhu');
INSERT INTO `w_weather_city` VALUES ('CN101042600', '重庆', '重庆', '大足', 'dazu');
INSERT INTO `w_weather_city` VALUES ('CN101042700', '重庆', '重庆', '荣昌', 'rongchang');
INSERT INTO `w_weather_city` VALUES ('CN101042800', '重庆', '重庆', '铜梁', 'tongliang');
INSERT INTO `w_weather_city` VALUES ('CN101042900', '重庆', '重庆', '璧山', 'bishan');
INSERT INTO `w_weather_city` VALUES ('CN101043000', '重庆', '重庆', '丰都', 'fengdu');
INSERT INTO `w_weather_city` VALUES ('CN101043100', '重庆', '重庆', '武隆', 'wulong');
INSERT INTO `w_weather_city` VALUES ('CN101043200', '重庆', '重庆', '彭水', 'pengshui');
INSERT INTO `w_weather_city` VALUES ('CN101043300', '重庆', '重庆', '綦江', 'qijiang');
INSERT INTO `w_weather_city` VALUES ('CN101043400', '重庆', '重庆', '酉阳', 'youyang');
INSERT INTO `w_weather_city` VALUES ('CN101043600', '重庆', '重庆', '秀山', 'xiushan');
INSERT INTO `w_weather_city` VALUES ('CN101050101', '黑龙江', '哈尔滨', '哈尔滨', 'haerbin');
INSERT INTO `w_weather_city` VALUES ('CN101050102', '黑龙江', '哈尔滨', '双城', 'shuangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101050103', '黑龙江', '哈尔滨', '呼兰', 'hulan');
INSERT INTO `w_weather_city` VALUES ('CN101050104', '黑龙江', '哈尔滨', '阿城', 'acheng');
INSERT INTO `w_weather_city` VALUES ('CN101050105', '黑龙江', '哈尔滨', '宾县', 'binxian');
INSERT INTO `w_weather_city` VALUES ('CN101050106', '黑龙江', '哈尔滨', '依兰', 'yilan');
INSERT INTO `w_weather_city` VALUES ('CN101050107', '黑龙江', '哈尔滨', '巴彦', 'bayan');
INSERT INTO `w_weather_city` VALUES ('CN101050108', '黑龙江', '哈尔滨', '通河', 'tonghe');
INSERT INTO `w_weather_city` VALUES ('CN101050109', '黑龙江', '哈尔滨', '方正', 'fangzheng');
INSERT INTO `w_weather_city` VALUES ('CN101050110', '黑龙江', '哈尔滨', '延寿', 'yanshou');
INSERT INTO `w_weather_city` VALUES ('CN101050111', '黑龙江', '哈尔滨', '尚志', 'shangzhi');
INSERT INTO `w_weather_city` VALUES ('CN101050112', '黑龙江', '哈尔滨', '五常', 'wuchang');
INSERT INTO `w_weather_city` VALUES ('CN101050113', '黑龙江', '哈尔滨', '木兰', 'mulan');
INSERT INTO `w_weather_city` VALUES ('CN101050201', '黑龙江', '齐齐哈尔', '齐齐哈尔', 'qiqihaer');
INSERT INTO `w_weather_city` VALUES ('CN101050202', '黑龙江', '齐齐哈尔', '讷河', 'nehe');
INSERT INTO `w_weather_city` VALUES ('CN101050203', '黑龙江', '齐齐哈尔', '龙江', 'longjiang');
INSERT INTO `w_weather_city` VALUES ('CN101050204', '黑龙江', '齐齐哈尔', '甘南', 'gannan');
INSERT INTO `w_weather_city` VALUES ('CN101050205', '黑龙江', '齐齐哈尔', '富裕', 'fuyu');
INSERT INTO `w_weather_city` VALUES ('CN101050206', '黑龙江', '齐齐哈尔', '依安', 'yian');
INSERT INTO `w_weather_city` VALUES ('CN101050207', '黑龙江', '齐齐哈尔', '拜泉', 'baiquan');
INSERT INTO `w_weather_city` VALUES ('CN101050208', '黑龙江', '齐齐哈尔', '克山', 'keshan');
INSERT INTO `w_weather_city` VALUES ('CN101050209', '黑龙江', '齐齐哈尔', '克东', 'kedong');
INSERT INTO `w_weather_city` VALUES ('CN101050210', '黑龙江', '齐齐哈尔', '泰来', 'tailai');
INSERT INTO `w_weather_city` VALUES ('CN101050301', '黑龙江', '牡丹江', '牡丹江', 'mudanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101050302', '黑龙江', '牡丹江', '海林', 'hailin');
INSERT INTO `w_weather_city` VALUES ('CN101050303', '黑龙江', '牡丹江', '穆棱', 'muling');
INSERT INTO `w_weather_city` VALUES ('CN101050304', '黑龙江', '牡丹江', '林口', 'linkou');
INSERT INTO `w_weather_city` VALUES ('CN101050305', '黑龙江', '牡丹江', '绥芬河', 'suifenhe');
INSERT INTO `w_weather_city` VALUES ('CN101050306', '黑龙江', '牡丹江', '宁安', 'ningan');
INSERT INTO `w_weather_city` VALUES ('CN101050307', '黑龙江', '牡丹江', '东宁', 'dongning');
INSERT INTO `w_weather_city` VALUES ('CN101050401', '黑龙江', '佳木斯', '佳木斯', 'jiamusi');
INSERT INTO `w_weather_city` VALUES ('CN101050402', '黑龙江', '佳木斯', '汤原', 'tangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101050403', '黑龙江', '佳木斯', '抚远', 'fuyuan');
INSERT INTO `w_weather_city` VALUES ('CN101050404', '黑龙江', '佳木斯', '桦川', 'huachuan');
INSERT INTO `w_weather_city` VALUES ('CN101050405', '黑龙江', '佳木斯', '桦南', 'huanan');
INSERT INTO `w_weather_city` VALUES ('CN101050406', '黑龙江', '佳木斯', '同江', 'tongjiang');
INSERT INTO `w_weather_city` VALUES ('CN101050407', '黑龙江', '佳木斯', '富锦', 'fujin');
INSERT INTO `w_weather_city` VALUES ('CN101050501', '黑龙江', '绥化', '绥化', 'suihua');
INSERT INTO `w_weather_city` VALUES ('CN101050502', '黑龙江', '绥化', '肇东', 'zhaodong');
INSERT INTO `w_weather_city` VALUES ('CN101050503', '黑龙江', '绥化', '安达', 'anda');
INSERT INTO `w_weather_city` VALUES ('CN101050504', '黑龙江', '绥化', '海伦', 'hailun');
INSERT INTO `w_weather_city` VALUES ('CN101050505', '黑龙江', '绥化', '明水', 'mingshui');
INSERT INTO `w_weather_city` VALUES ('CN101050506', '黑龙江', '绥化', '望奎', 'wangkui');
INSERT INTO `w_weather_city` VALUES ('CN101050507', '黑龙江', '绥化', '兰西', 'lanxi');
INSERT INTO `w_weather_city` VALUES ('CN101050508', '黑龙江', '绥化', '青冈', 'qinggang');
INSERT INTO `w_weather_city` VALUES ('CN101050509', '黑龙江', '绥化', '庆安', 'qingan');
INSERT INTO `w_weather_city` VALUES ('CN101050510', '黑龙江', '绥化', '绥棱', 'suiling');
INSERT INTO `w_weather_city` VALUES ('CN101050601', '黑龙江', '黑河', '黑河', 'heihe');
INSERT INTO `w_weather_city` VALUES ('CN101050602', '黑龙江', '黑河', '嫩江', 'nenjiang');
INSERT INTO `w_weather_city` VALUES ('CN101050603', '黑龙江', '黑河', '孙吴', 'sunwu');
INSERT INTO `w_weather_city` VALUES ('CN101050604', '黑龙江', '黑河', '逊克', 'xunke');
INSERT INTO `w_weather_city` VALUES ('CN101050605', '黑龙江', '黑河', '五大连池', 'wudalianchi');
INSERT INTO `w_weather_city` VALUES ('CN101050606', '黑龙江', '黑河', '北安', 'beian');
INSERT INTO `w_weather_city` VALUES ('CN101050701', '黑龙江', '大兴安岭', '大兴安岭', 'daxinganling');
INSERT INTO `w_weather_city` VALUES ('CN101050702', '黑龙江', '大兴安岭', '塔河', 'tahe');
INSERT INTO `w_weather_city` VALUES ('CN101050703', '黑龙江', '大兴安岭', '漠河', 'mohe');
INSERT INTO `w_weather_city` VALUES ('CN101050704', '黑龙江', '大兴安岭', '呼玛', 'huma');
INSERT INTO `w_weather_city` VALUES ('CN101050705', '黑龙江', '大兴安岭', '呼中', 'huzhong');
INSERT INTO `w_weather_city` VALUES ('CN101050706', '黑龙江', '大兴安岭', '新林', 'xinlin');
INSERT INTO `w_weather_city` VALUES ('CN101050708', '黑龙江', '大兴安岭', '加格达奇', 'jiagedaqi');
INSERT INTO `w_weather_city` VALUES ('CN101050801', '黑龙江', '伊春', '伊春', 'yichun');
INSERT INTO `w_weather_city` VALUES ('CN101050802', '黑龙江', '伊春', '乌伊岭', 'wuyiling');
INSERT INTO `w_weather_city` VALUES ('CN101050803', '黑龙江', '伊春', '五营', 'wuying');
INSERT INTO `w_weather_city` VALUES ('CN101050804', '黑龙江', '伊春', '铁力', 'tieli');
INSERT INTO `w_weather_city` VALUES ('CN101050805', '黑龙江', '伊春', '嘉荫', 'jiayin');
INSERT INTO `w_weather_city` VALUES ('CN101050901', '黑龙江', '大庆', '大庆', 'daqing');
INSERT INTO `w_weather_city` VALUES ('CN101050902', '黑龙江', '大庆', '林甸', 'lindian');
INSERT INTO `w_weather_city` VALUES ('CN101050903', '黑龙江', '大庆', '肇州', 'zhaozhou');
INSERT INTO `w_weather_city` VALUES ('CN101050904', '黑龙江', '大庆', '肇源', 'zhaoyuan');
INSERT INTO `w_weather_city` VALUES ('CN101050905', '黑龙江', '大庆', '杜尔伯特', 'duerbote');
INSERT INTO `w_weather_city` VALUES ('CN101051002', '黑龙江', '七台河', '七台河', 'qitaihe');
INSERT INTO `w_weather_city` VALUES ('CN101051003', '黑龙江', '七台河', '勃利', 'boli');
INSERT INTO `w_weather_city` VALUES ('CN101051101', '黑龙江', '鸡西', '鸡西', 'jixi');
INSERT INTO `w_weather_city` VALUES ('CN101051102', '黑龙江', '鸡西', '虎林', 'hulin');
INSERT INTO `w_weather_city` VALUES ('CN101051103', '黑龙江', '鸡西', '密山', 'mishan');
INSERT INTO `w_weather_city` VALUES ('CN101051104', '黑龙江', '鸡西', '鸡东', 'jidong');
INSERT INTO `w_weather_city` VALUES ('CN101051201', '黑龙江', '鹤岗', '鹤岗', 'hegang');
INSERT INTO `w_weather_city` VALUES ('CN101051202', '黑龙江', '鹤岗', '绥滨', 'suibin');
INSERT INTO `w_weather_city` VALUES ('CN101051203', '黑龙江', '鹤岗', '萝北', 'luobei');
INSERT INTO `w_weather_city` VALUES ('CN101051301', '黑龙江', '双鸭山', '双鸭山', 'shuangyashan');
INSERT INTO `w_weather_city` VALUES ('CN101051302', '黑龙江', '双鸭山', '集贤', 'jixian');
INSERT INTO `w_weather_city` VALUES ('CN101051303', '黑龙江', '双鸭山', '宝清', 'baoqing');
INSERT INTO `w_weather_city` VALUES ('CN101051304', '黑龙江', '双鸭山', '饶河', 'raohe');
INSERT INTO `w_weather_city` VALUES ('CN101051305', '黑龙江', '双鸭山', '友谊', 'youyi');
INSERT INTO `w_weather_city` VALUES ('CN101060101', '吉林', '长春', '长春', 'changchun');
INSERT INTO `w_weather_city` VALUES ('CN101060102', '吉林', '长春', '农安', 'nongan');
INSERT INTO `w_weather_city` VALUES ('CN101060103', '吉林', '长春', '德惠', 'dehui');
INSERT INTO `w_weather_city` VALUES ('CN101060104', '吉林', '长春', '九台', 'jiutai');
INSERT INTO `w_weather_city` VALUES ('CN101060105', '吉林', '长春', '榆树', 'yushu');
INSERT INTO `w_weather_city` VALUES ('CN101060106', '吉林', '长春', '双阳', 'shuangyang');
INSERT INTO `w_weather_city` VALUES ('CN101060201', '吉林', '吉林', '吉林', 'jilin');
INSERT INTO `w_weather_city` VALUES ('CN101060202', '吉林', '吉林', '舒兰', 'shulan');
INSERT INTO `w_weather_city` VALUES ('CN101060203', '吉林', '吉林', '永吉', 'yongji');
INSERT INTO `w_weather_city` VALUES ('CN101060204', '吉林', '吉林', '蛟河', 'jiaohe');
INSERT INTO `w_weather_city` VALUES ('CN101060205', '吉林', '吉林', '磐石', 'panshi');
INSERT INTO `w_weather_city` VALUES ('CN101060206', '吉林', '吉林', '桦甸', 'huadian');
INSERT INTO `w_weather_city` VALUES ('CN101060301', '吉林', '延边', '延吉', 'yanji');
INSERT INTO `w_weather_city` VALUES ('CN101060302', '吉林', '延边', '敦化', 'dunhua');
INSERT INTO `w_weather_city` VALUES ('CN101060303', '吉林', '延边', '安图', 'antu');
INSERT INTO `w_weather_city` VALUES ('CN101060304', '吉林', '延边', '汪清', 'wangqing');
INSERT INTO `w_weather_city` VALUES ('CN101060305', '吉林', '延边', '和龙', 'helong');
INSERT INTO `w_weather_city` VALUES ('CN101060307', '吉林', '延边', '龙井', 'longjing');
INSERT INTO `w_weather_city` VALUES ('CN101060308', '吉林', '延边', '珲春', 'hunchun');
INSERT INTO `w_weather_city` VALUES ('CN101060309', '吉林', '延边', '图们', 'tumen');
INSERT INTO `w_weather_city` VALUES ('CN101060401', '吉林', '四平', '四平', 'siping');
INSERT INTO `w_weather_city` VALUES ('CN101060402', '吉林', '四平', '双辽', 'shuangliao');
INSERT INTO `w_weather_city` VALUES ('CN101060403', '吉林', '四平', '梨树', 'lishu');
INSERT INTO `w_weather_city` VALUES ('CN101060404', '吉林', '四平', '公主岭', 'gongzhuling');
INSERT INTO `w_weather_city` VALUES ('CN101060405', '吉林', '四平', '伊通', 'yitong');
INSERT INTO `w_weather_city` VALUES ('CN101060501', '吉林', '通化', '通化', 'tonghua');
INSERT INTO `w_weather_city` VALUES ('CN101060502', '吉林', '通化', '梅河口', 'meihekou');
INSERT INTO `w_weather_city` VALUES ('CN101060503', '吉林', '通化', '柳河', 'liuhe');
INSERT INTO `w_weather_city` VALUES ('CN101060504', '吉林', '通化', '辉南', 'huinan');
INSERT INTO `w_weather_city` VALUES ('CN101060505', '吉林', '通化', '集安', 'jian');
INSERT INTO `w_weather_city` VALUES ('CN101060506', '吉林', '通化', '通化县', 'tonghuaxian');
INSERT INTO `w_weather_city` VALUES ('CN101060601', '吉林', '白城', '白城', 'baicheng');
INSERT INTO `w_weather_city` VALUES ('CN101060602', '吉林', '白城', '洮南', 'taonan');
INSERT INTO `w_weather_city` VALUES ('CN101060603', '吉林', '白城', '大安', 'daan');
INSERT INTO `w_weather_city` VALUES ('CN101060604', '吉林', '白城', '镇赉', 'zhenlai');
INSERT INTO `w_weather_city` VALUES ('CN101060605', '吉林', '白城', '通榆', 'tongyu');
INSERT INTO `w_weather_city` VALUES ('CN101060701', '吉林', '辽源', '辽源', 'liaoyuan');
INSERT INTO `w_weather_city` VALUES ('CN101060702', '吉林', '辽源', '东丰', 'dongfeng');
INSERT INTO `w_weather_city` VALUES ('CN101060703', '吉林', '辽源', '东辽', 'dongliao');
INSERT INTO `w_weather_city` VALUES ('CN101060801', '吉林', '松原', '松原', 'songyuan');
INSERT INTO `w_weather_city` VALUES ('CN101060802', '吉林', '松原', '乾安', 'qianan');
INSERT INTO `w_weather_city` VALUES ('CN101060803', '吉林', '松原', '前郭', 'qianguo');
INSERT INTO `w_weather_city` VALUES ('CN101060804', '吉林', '松原', '长岭', 'changling');
INSERT INTO `w_weather_city` VALUES ('CN101060805', '吉林', '松原', '扶余', 'fuyu');
INSERT INTO `w_weather_city` VALUES ('CN101060901', '吉林', '白山', '白山', 'baishan');
INSERT INTO `w_weather_city` VALUES ('CN101060902', '吉林', '白山', '靖宇', 'jingyu');
INSERT INTO `w_weather_city` VALUES ('CN101060903', '吉林', '白山', '临江', 'linjiang');
INSERT INTO `w_weather_city` VALUES ('CN101060904', '吉林', '白山', '东岗', 'donggang');
INSERT INTO `w_weather_city` VALUES ('CN101060905', '吉林', '白山', '长白', 'changbai');
INSERT INTO `w_weather_city` VALUES ('CN101060906', '吉林', '白山', '抚松', 'fusong');
INSERT INTO `w_weather_city` VALUES ('CN101060907', '吉林', '白山', '江源', 'jiangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101070101', '辽宁', '沈阳', '沈阳', 'shenyang');
INSERT INTO `w_weather_city` VALUES ('CN101070103', '辽宁', '沈阳', '辽中', 'liaozhong');
INSERT INTO `w_weather_city` VALUES ('CN101070104', '辽宁', '沈阳', '康平', 'kangping');
INSERT INTO `w_weather_city` VALUES ('CN101070105', '辽宁', '沈阳', '法库', 'faku');
INSERT INTO `w_weather_city` VALUES ('CN101070106', '辽宁', '沈阳', '新民', 'xinmin');
INSERT INTO `w_weather_city` VALUES ('CN101070201', '辽宁', '大连', '大连', 'dalian');
INSERT INTO `w_weather_city` VALUES ('CN101070202', '辽宁', '大连', '瓦房店', 'wafangdian');
INSERT INTO `w_weather_city` VALUES ('CN101070203', '辽宁', '大连', '金州', 'jinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101070204', '辽宁', '大连', '普兰店', 'pulandian');
INSERT INTO `w_weather_city` VALUES ('CN101070205', '辽宁', '大连', '旅顺', 'lvshun');
INSERT INTO `w_weather_city` VALUES ('CN101070206', '辽宁', '大连', '长海', 'changhai');
INSERT INTO `w_weather_city` VALUES ('CN101070207', '辽宁', '大连', '庄河', 'zhuanghe');
INSERT INTO `w_weather_city` VALUES ('CN101070301', '辽宁', '鞍山', '鞍山', 'anshan');
INSERT INTO `w_weather_city` VALUES ('CN101070302', '辽宁', '鞍山', '台安', 'taian');
INSERT INTO `w_weather_city` VALUES ('CN101070303', '辽宁', '鞍山', '岫岩', 'xiuyan');
INSERT INTO `w_weather_city` VALUES ('CN101070304', '辽宁', '鞍山', '海城', 'haicheng');
INSERT INTO `w_weather_city` VALUES ('CN101070401', '辽宁', '抚顺', '抚顺', 'fushun');
INSERT INTO `w_weather_city` VALUES ('CN101070402', '辽宁', '抚顺', '新宾', 'xinbin');
INSERT INTO `w_weather_city` VALUES ('CN101070403', '辽宁', '抚顺', '清原', 'qingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101070404', '辽宁', '抚顺', '章党', 'zhangdang');
INSERT INTO `w_weather_city` VALUES ('CN101070501', '辽宁', '本溪', '本溪', 'benxi');
INSERT INTO `w_weather_city` VALUES ('CN101070502', '辽宁', '本溪', '本溪县', 'benxixian');
INSERT INTO `w_weather_city` VALUES ('CN101070504', '辽宁', '本溪', '桓仁', 'huanren');
INSERT INTO `w_weather_city` VALUES ('CN101070601', '辽宁', '丹东', '丹东', 'dandong');
INSERT INTO `w_weather_city` VALUES ('CN101070602', '辽宁', '丹东', '凤城', 'fengcheng');
INSERT INTO `w_weather_city` VALUES ('CN101070603', '辽宁', '丹东', '宽甸', 'kuandian');
INSERT INTO `w_weather_city` VALUES ('CN101070604', '辽宁', '丹东', '东港', 'donggang');
INSERT INTO `w_weather_city` VALUES ('CN101070701', '辽宁', '锦州', '锦州', 'jinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101070702', '辽宁', '锦州', '凌海', 'linghai');
INSERT INTO `w_weather_city` VALUES ('CN101070704', '辽宁', '锦州', '义县', 'yixian');
INSERT INTO `w_weather_city` VALUES ('CN101070705', '辽宁', '锦州', '黑山', 'heishan');
INSERT INTO `w_weather_city` VALUES ('CN101070706', '辽宁', '锦州', '北镇', 'beizhen');
INSERT INTO `w_weather_city` VALUES ('CN101070801', '辽宁', '营口', '营口', 'yingkou');
INSERT INTO `w_weather_city` VALUES ('CN101070802', '辽宁', '营口', '大石桥', 'dashiqiao');
INSERT INTO `w_weather_city` VALUES ('CN101070803', '辽宁', '营口', '盖州', 'gaizhou');
INSERT INTO `w_weather_city` VALUES ('CN101070901', '辽宁', '阜新', '阜新', 'fuxin');
INSERT INTO `w_weather_city` VALUES ('CN101070902', '辽宁', '阜新', '彰武', 'zhangwu');
INSERT INTO `w_weather_city` VALUES ('CN101071001', '辽宁', '辽阳', '辽阳', 'liaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101071002', '辽宁', '辽阳', '辽阳县', 'liaoyangxian');
INSERT INTO `w_weather_city` VALUES ('CN101071003', '辽宁', '辽阳', '灯塔', 'dengta');
INSERT INTO `w_weather_city` VALUES ('CN101071004', '辽宁', '辽阳', '弓长岭', 'gongchangling');
INSERT INTO `w_weather_city` VALUES ('CN101071101', '辽宁', '铁岭', '铁岭', 'tieling');
INSERT INTO `w_weather_city` VALUES ('CN101071102', '辽宁', '铁岭', '开原', 'kaiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101071103', '辽宁', '铁岭', '昌图', 'changtu');
INSERT INTO `w_weather_city` VALUES ('CN101071104', '辽宁', '铁岭', '西丰', 'xifeng');
INSERT INTO `w_weather_city` VALUES ('CN101071105', '辽宁', '铁岭', '调兵山', 'tiefa');
INSERT INTO `w_weather_city` VALUES ('CN101071201', '辽宁', '朝阳', '朝阳', 'chaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101071203', '辽宁', '朝阳', '凌源', 'lingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101071204', '辽宁', '朝阳', '喀左', 'kazuo');
INSERT INTO `w_weather_city` VALUES ('CN101071205', '辽宁', '朝阳', '北票', 'beipiao');
INSERT INTO `w_weather_city` VALUES ('CN101071207', '辽宁', '朝阳', '建平县', 'jianpingxian');
INSERT INTO `w_weather_city` VALUES ('CN101071301', '辽宁', '盘锦', '盘锦', 'panjin');
INSERT INTO `w_weather_city` VALUES ('CN101071302', '辽宁', '盘锦', '大洼', 'dawa');
INSERT INTO `w_weather_city` VALUES ('CN101071303', '辽宁', '盘锦', '盘山', 'panshan');
INSERT INTO `w_weather_city` VALUES ('CN101071401', '辽宁', '葫芦岛', '葫芦岛', 'huludao');
INSERT INTO `w_weather_city` VALUES ('CN101071402', '辽宁', '葫芦岛', '建昌', 'jianchang');
INSERT INTO `w_weather_city` VALUES ('CN101071403', '辽宁', '葫芦岛', '绥中', 'suizhong');
INSERT INTO `w_weather_city` VALUES ('CN101071404', '辽宁', '葫芦岛', '兴城', 'xingcheng');
INSERT INTO `w_weather_city` VALUES ('CN101080101', '内蒙古', '呼和浩特', '呼和浩特', 'huhehaote');
INSERT INTO `w_weather_city` VALUES ('CN101080102', '内蒙古', '呼和浩特', '土左旗', 'tuzuoqi');
INSERT INTO `w_weather_city` VALUES ('CN101080103', '内蒙古', '呼和浩特', '托县', 'tuoxian');
INSERT INTO `w_weather_city` VALUES ('CN101080104', '内蒙古', '呼和浩特', '和林', 'helin');
INSERT INTO `w_weather_city` VALUES ('CN101080105', '内蒙古', '呼和浩特', '清水河', 'qingshuihe');
INSERT INTO `w_weather_city` VALUES ('CN101080106', '内蒙古', '呼和浩特', '呼市郊区', 'hushijiaoqu');
INSERT INTO `w_weather_city` VALUES ('CN101080107', '内蒙古', '呼和浩特', '武川', 'wuchuan');
INSERT INTO `w_weather_city` VALUES ('CN101080201', '内蒙古', '包头', '包头', 'baotou');
INSERT INTO `w_weather_city` VALUES ('CN101080202', '内蒙古', '包头', '白云鄂博', 'baiyunebo');
INSERT INTO `w_weather_city` VALUES ('CN101080203', '内蒙古', '包头', '满都拉', 'mandula');
INSERT INTO `w_weather_city` VALUES ('CN101080204', '内蒙古', '包头', '土右旗', 'tuyouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080205', '内蒙古', '包头', '固阳', 'guyang');
INSERT INTO `w_weather_city` VALUES ('CN101080206', '内蒙古', '包头', '达茂旗', 'damaoqi');
INSERT INTO `w_weather_city` VALUES ('CN101080207', '内蒙古', '包头', '希拉穆仁', 'xilamuren');
INSERT INTO `w_weather_city` VALUES ('CN101080301', '内蒙古', '乌海', '乌海', 'wuhai');
INSERT INTO `w_weather_city` VALUES ('CN101080401', '内蒙古', '乌兰察布', '集宁', 'jining');
INSERT INTO `w_weather_city` VALUES ('CN101080402', '内蒙古', '乌兰察布', '卓资', 'zhuozi');
INSERT INTO `w_weather_city` VALUES ('CN101080403', '内蒙古', '乌兰察布', '化德', 'huade');
INSERT INTO `w_weather_city` VALUES ('CN101080404', '内蒙古', '乌兰察布', '商都', 'shangdu');
INSERT INTO `w_weather_city` VALUES ('CN101080406', '内蒙古', '乌兰察布', '兴和', 'xinghe');
INSERT INTO `w_weather_city` VALUES ('CN101080407', '内蒙古', '乌兰察布', '凉城', 'liangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101080408', '内蒙古', '乌兰察布', '察右前旗', 'chayouqianqi');
INSERT INTO `w_weather_city` VALUES ('CN101080409', '内蒙古', '乌兰察布', '察右中旗', 'chayouzhongqi');
INSERT INTO `w_weather_city` VALUES ('CN101080410', '内蒙古', '乌兰察布', '察右后旗', 'chayouhouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080411', '内蒙古', '乌兰察布', '四子王旗', 'siziwangqi');
INSERT INTO `w_weather_city` VALUES ('CN101080412', '内蒙古', '乌兰察布', '丰镇', 'fengzhen');
INSERT INTO `w_weather_city` VALUES ('CN101080501', '内蒙古', '通辽', '通辽', 'tongliao');
INSERT INTO `w_weather_city` VALUES ('CN101080502', '内蒙古', '通辽', '舍伯吐', 'shebotu');
INSERT INTO `w_weather_city` VALUES ('CN101080503', '内蒙古', '通辽', '科左中旗', 'kezuozhongqi');
INSERT INTO `w_weather_city` VALUES ('CN101080504', '内蒙古', '通辽', '科左后旗', 'kezuohouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080505', '内蒙古', '通辽', '青龙山', 'qinglongshan');
INSERT INTO `w_weather_city` VALUES ('CN101080506', '内蒙古', '通辽', '开鲁', 'kailu');
INSERT INTO `w_weather_city` VALUES ('CN101080507', '内蒙古', '通辽', '库伦', 'kulun');
INSERT INTO `w_weather_city` VALUES ('CN101080508', '内蒙古', '通辽', '奈曼', 'naiman');
INSERT INTO `w_weather_city` VALUES ('CN101080509', '内蒙古', '通辽', '扎鲁特', 'zhalute');
INSERT INTO `w_weather_city` VALUES ('CN101080510', '内蒙古', '兴安盟', '高力板', 'gaoliban');
INSERT INTO `w_weather_city` VALUES ('CN101080511', '内蒙古', '通辽', '巴雅尔吐胡硕', 'bayaertuhushuo');
INSERT INTO `w_weather_city` VALUES ('CN101080601', '内蒙古', '赤峰', '赤峰', 'chifeng');
INSERT INTO `w_weather_city` VALUES ('CN101080603', '内蒙古', '赤峰', '阿鲁旗', 'aluqi');
INSERT INTO `w_weather_city` VALUES ('CN101080604', '内蒙古', '赤峰', '浩尔吐', 'haoertu');
INSERT INTO `w_weather_city` VALUES ('CN101080605', '内蒙古', '赤峰', '巴林左旗', 'balinzuoqi');
INSERT INTO `w_weather_city` VALUES ('CN101080606', '内蒙古', '赤峰', '巴林右旗', 'balinyouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080607', '内蒙古', '赤峰', '林西', 'linxi');
INSERT INTO `w_weather_city` VALUES ('CN101080608', '内蒙古', '赤峰', '克什克腾', 'keshiketeng');
INSERT INTO `w_weather_city` VALUES ('CN101080609', '内蒙古', '赤峰', '翁牛特', 'wengniute');
INSERT INTO `w_weather_city` VALUES ('CN101080610', '内蒙古', '赤峰', '岗子', 'gangzi');
INSERT INTO `w_weather_city` VALUES ('CN101080611', '内蒙古', '赤峰', '喀喇沁', 'kalaqin');
INSERT INTO `w_weather_city` VALUES ('CN101080612', '内蒙古', '赤峰', '八里罕', 'balihan');
INSERT INTO `w_weather_city` VALUES ('CN101080613', '内蒙古', '赤峰', '宁城', 'ningcheng');
INSERT INTO `w_weather_city` VALUES ('CN101080614', '内蒙古', '赤峰', '敖汉', 'aohan');
INSERT INTO `w_weather_city` VALUES ('CN101080615', '内蒙古', '赤峰', '宝国吐', 'baoguotu');
INSERT INTO `w_weather_city` VALUES ('CN101080701', '内蒙古', '鄂尔多斯', '鄂尔多斯', 'eerduosi');
INSERT INTO `w_weather_city` VALUES ('CN101080703', '内蒙古', '鄂尔多斯', '达拉特', 'dalate');
INSERT INTO `w_weather_city` VALUES ('CN101080704', '内蒙古', '鄂尔多斯', '准格尔', 'zhungeer');
INSERT INTO `w_weather_city` VALUES ('CN101080705', '内蒙古', '鄂尔多斯', '鄂前旗', 'eqianqi');
INSERT INTO `w_weather_city` VALUES ('CN101080706', '内蒙古', '鄂尔多斯', '河南', 'henan');
INSERT INTO `w_weather_city` VALUES ('CN101080707', '内蒙古', '鄂尔多斯', '伊克乌素', 'yikewusu');
INSERT INTO `w_weather_city` VALUES ('CN101080708', '内蒙古', '鄂尔多斯', '鄂托克', 'etuoke');
INSERT INTO `w_weather_city` VALUES ('CN101080709', '内蒙古', '鄂尔多斯', '杭锦旗', 'hangjinqi');
INSERT INTO `w_weather_city` VALUES ('CN101080710', '内蒙古', '鄂尔多斯', '乌审旗', 'wushenqi');
INSERT INTO `w_weather_city` VALUES ('CN101080711', '内蒙古', '鄂尔多斯', '伊金霍洛', 'yijinhuoluo');
INSERT INTO `w_weather_city` VALUES ('CN101080712', '内蒙古', '鄂尔多斯', '乌审召', 'wushenzhao');
INSERT INTO `w_weather_city` VALUES ('CN101080713', '内蒙古', '鄂尔多斯', '东胜', 'dongsheng');
INSERT INTO `w_weather_city` VALUES ('CN101080801', '内蒙古', '巴彦淖尔', '临河', 'linhe');
INSERT INTO `w_weather_city` VALUES ('CN101080802', '内蒙古', '巴彦淖尔', '五原', 'wuyuan');
INSERT INTO `w_weather_city` VALUES ('CN101080803', '内蒙古', '巴彦淖尔', '磴口', 'dengkou');
INSERT INTO `w_weather_city` VALUES ('CN101080804', '内蒙古', '巴彦淖尔', '乌前旗', 'wuqianqi');
INSERT INTO `w_weather_city` VALUES ('CN101080805', '内蒙古', '巴彦淖尔', '大佘太', 'dashetai');
INSERT INTO `w_weather_city` VALUES ('CN101080806', '内蒙古', '巴彦淖尔', '乌中旗', 'wuzhongqi');
INSERT INTO `w_weather_city` VALUES ('CN101080807', '内蒙古', '巴彦淖尔', '乌后旗', 'wuhouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080808', '内蒙古', '巴彦淖尔', '海力素', 'hailisu');
INSERT INTO `w_weather_city` VALUES ('CN101080809', '内蒙古', '巴彦淖尔', '那仁宝力格', 'narenbaolige');
INSERT INTO `w_weather_city` VALUES ('CN101080810', '内蒙古', '巴彦淖尔', '杭锦后旗', 'hangjinhouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080901', '内蒙古', '锡林郭勒', '锡林浩特', 'xilinhaote');
INSERT INTO `w_weather_city` VALUES ('CN101080903', '内蒙古', '锡林郭勒', '二连浩特', 'erlianhaote');
INSERT INTO `w_weather_city` VALUES ('CN101080904', '内蒙古', '锡林郭勒', '阿巴嘎', 'abaga');
INSERT INTO `w_weather_city` VALUES ('CN101080906', '内蒙古', '锡林郭勒', '苏左旗', 'suzuoqi');
INSERT INTO `w_weather_city` VALUES ('CN101080907', '内蒙古', '锡林郭勒', '苏右旗', 'suyouqi');
INSERT INTO `w_weather_city` VALUES ('CN101080908', '内蒙古', '锡林郭勒', '朱日和', 'zhurihe');
INSERT INTO `w_weather_city` VALUES ('CN101080909', '内蒙古', '锡林郭勒', '东乌旗', 'dongwuqi');
INSERT INTO `w_weather_city` VALUES ('CN101080910', '内蒙古', '锡林郭勒', '西乌旗', 'xiwuqi');
INSERT INTO `w_weather_city` VALUES ('CN101080911', '内蒙古', '锡林郭勒', '太仆寺', 'taipusiqi');
INSERT INTO `w_weather_city` VALUES ('CN101080912', '内蒙古', '锡林郭勒', '镶黄旗', 'xianghuang');
INSERT INTO `w_weather_city` VALUES ('CN101080913', '内蒙古', '锡林郭勒', '正镶白旗', 'zhengxiangbaiqi');
INSERT INTO `w_weather_city` VALUES ('CN101080914', '内蒙古', '锡林郭勒', '正蓝旗', 'zhenglanqi');
INSERT INTO `w_weather_city` VALUES ('CN101080915', '内蒙古', '锡林郭勒', '多伦', 'duolun');
INSERT INTO `w_weather_city` VALUES ('CN101080916', '内蒙古', '锡林郭勒', '博克图', 'boketu');
INSERT INTO `w_weather_city` VALUES ('CN101080917', '内蒙古', '锡林郭勒', '乌拉盖', 'wulagai');
INSERT INTO `w_weather_city` VALUES ('CN101081001', '内蒙古', '呼伦贝尔', '海拉尔', 'hailaer');
INSERT INTO `w_weather_city` VALUES ('CN101081002', '内蒙古', '呼伦贝尔', '小二沟', 'xiaoergou');
INSERT INTO `w_weather_city` VALUES ('CN101081003', '内蒙古', '呼伦贝尔', '阿荣旗', 'arongqi');
INSERT INTO `w_weather_city` VALUES ('CN101081004', '内蒙古', '呼伦贝尔', '莫力达瓦', 'molidawa');
INSERT INTO `w_weather_city` VALUES ('CN101081005', '内蒙古', '呼伦贝尔', '鄂伦春旗', 'elunchunqi');
INSERT INTO `w_weather_city` VALUES ('CN101081006', '内蒙古', '呼伦贝尔', '鄂温克旗', 'ewenkeqi');
INSERT INTO `w_weather_city` VALUES ('CN101081007', '内蒙古', '呼伦贝尔', '陈旗', 'chenqi');
INSERT INTO `w_weather_city` VALUES ('CN101081008', '内蒙古', '呼伦贝尔', '新左旗', 'xinzuoqi');
INSERT INTO `w_weather_city` VALUES ('CN101081009', '内蒙古', '呼伦贝尔', '新右旗', 'xinyouqi');
INSERT INTO `w_weather_city` VALUES ('CN101081010', '内蒙古', '呼伦贝尔', '满洲里', 'manzhouli');
INSERT INTO `w_weather_city` VALUES ('CN101081011', '内蒙古', '呼伦贝尔', '牙克石', 'yakeshi');
INSERT INTO `w_weather_city` VALUES ('CN101081012', '内蒙古', '呼伦贝尔', '扎兰屯', 'zhalantun');
INSERT INTO `w_weather_city` VALUES ('CN101081014', '内蒙古', '呼伦贝尔', '额尔古纳', 'eerguna');
INSERT INTO `w_weather_city` VALUES ('CN101081015', '内蒙古', '呼伦贝尔', '根河', 'genhe');
INSERT INTO `w_weather_city` VALUES ('CN101081016', '内蒙古', '呼伦贝尔', '图里河', 'tulihe');
INSERT INTO `w_weather_city` VALUES ('CN101081101', '内蒙古', '兴安盟', '乌兰浩特', 'wulanhaote');
INSERT INTO `w_weather_city` VALUES ('CN101081102', '内蒙古', '兴安盟', '阿尔山', 'aershan');
INSERT INTO `w_weather_city` VALUES ('CN101081103', '内蒙古', '兴安盟', '科右中旗', 'keyouzhongqi');
INSERT INTO `w_weather_city` VALUES ('CN101081104', '内蒙古', '兴安盟', '胡尔勒', 'huerle');
INSERT INTO `w_weather_city` VALUES ('CN101081105', '内蒙古', '兴安盟', '扎赉特', 'zhanlaite');
INSERT INTO `w_weather_city` VALUES ('CN101081106', '内蒙古', '兴安盟', '索伦', 'suolun');
INSERT INTO `w_weather_city` VALUES ('CN101081107', '内蒙古', '兴安盟', '突泉', 'tuquan');
INSERT INTO `w_weather_city` VALUES ('CN101081108', '内蒙古', '通辽', '霍林郭勒', 'huolinguole');
INSERT INTO `w_weather_city` VALUES ('CN101081109', '内蒙古', '兴安盟', '科右前旗', 'keyouqianqi');
INSERT INTO `w_weather_city` VALUES ('CN101081201', '内蒙古', '阿拉善盟', '阿左旗', 'azuoqi');
INSERT INTO `w_weather_city` VALUES ('CN101081202', '内蒙古', '阿拉善盟', '阿右旗', 'ayouqi');
INSERT INTO `w_weather_city` VALUES ('CN101081203', '内蒙古', '阿拉善盟', '额济纳', 'ejina');
INSERT INTO `w_weather_city` VALUES ('CN101081204', '内蒙古', '阿拉善盟', '拐子湖', 'guanzihu');
INSERT INTO `w_weather_city` VALUES ('CN101081205', '内蒙古', '阿拉善盟', '吉兰太', 'jilantai');
INSERT INTO `w_weather_city` VALUES ('CN101081206', '内蒙古', '阿拉善盟', '锡林高勒', 'xilingaole');
INSERT INTO `w_weather_city` VALUES ('CN101081207', '内蒙古', '阿拉善盟', '头道湖', 'toudaohu');
INSERT INTO `w_weather_city` VALUES ('CN101081208', '内蒙古', '阿拉善盟', '中泉子', 'zhongquanzi');
INSERT INTO `w_weather_city` VALUES ('CN101081209', '内蒙古', '阿拉善盟', '诺尔公', 'nuoergong');
INSERT INTO `w_weather_city` VALUES ('CN101081210', '内蒙古', '阿拉善盟', '雅布赖', 'yabulai');
INSERT INTO `w_weather_city` VALUES ('CN101081211', '内蒙古', '阿拉善盟', '乌斯泰', 'wusitai');
INSERT INTO `w_weather_city` VALUES ('CN101081212', '内蒙古', '阿拉善盟', '孪井滩', 'luanjingtan');
INSERT INTO `w_weather_city` VALUES ('CN101090101', '河北', '石家庄', '石家庄', 'shijiazhuang');
INSERT INTO `w_weather_city` VALUES ('CN101090102', '河北', '石家庄', '井陉', 'jingxing');
INSERT INTO `w_weather_city` VALUES ('CN101090103', '河北', '石家庄', '正定', 'zhengding');
INSERT INTO `w_weather_city` VALUES ('CN101090104', '河北', '石家庄', '栾城', 'luancheng');
INSERT INTO `w_weather_city` VALUES ('CN101090105', '河北', '石家庄', '行唐', 'xingtang');
INSERT INTO `w_weather_city` VALUES ('CN101090106', '河北', '石家庄', '灵寿', 'lingshou');
INSERT INTO `w_weather_city` VALUES ('CN101090107', '河北', '石家庄', '高邑', 'gaoyi');
INSERT INTO `w_weather_city` VALUES ('CN101090108', '河北', '石家庄', '深泽', 'shenze');
INSERT INTO `w_weather_city` VALUES ('CN101090109', '河北', '石家庄', '赞皇', 'zanhuang');
INSERT INTO `w_weather_city` VALUES ('CN101090110', '河北', '石家庄', '无极', 'wuji');
INSERT INTO `w_weather_city` VALUES ('CN101090111', '河北', '石家庄', '平山', 'pingshan');
INSERT INTO `w_weather_city` VALUES ('CN101090112', '河北', '石家庄', '元氏', 'yuanshi');
INSERT INTO `w_weather_city` VALUES ('CN101090113', '河北', '石家庄', '赵县', 'zhaoxian');
INSERT INTO `w_weather_city` VALUES ('CN101090114', '河北', '石家庄', '辛集', 'xinji');
INSERT INTO `w_weather_city` VALUES ('CN101090115', '河北', '石家庄', '藁城', 'gaocheng');
INSERT INTO `w_weather_city` VALUES ('CN101090116', '河北', '石家庄', '晋州', 'jinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101090117', '河北', '石家庄', '新乐', 'xinle');
INSERT INTO `w_weather_city` VALUES ('CN101090118', '河北', '石家庄', '鹿泉', 'luquan');
INSERT INTO `w_weather_city` VALUES ('CN101090201', '河北', '保定', '保定', 'baoding');
INSERT INTO `w_weather_city` VALUES ('CN101090202', '河北', '保定', '满城', 'mancheng');
INSERT INTO `w_weather_city` VALUES ('CN101090203', '河北', '保定', '阜平', 'fuping');
INSERT INTO `w_weather_city` VALUES ('CN101090204', '河北', '保定', '徐水', 'xushui');
INSERT INTO `w_weather_city` VALUES ('CN101090205', '河北', '保定', '唐县', 'tangxian');
INSERT INTO `w_weather_city` VALUES ('CN101090206', '河北', '保定', '高阳', 'gaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101090207', '河北', '保定', '容城', 'rongcheng');
INSERT INTO `w_weather_city` VALUES ('CN101090209', '河北', '保定', '涞源', 'laiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101090210', '河北', '保定', '望都', 'wangdu');
INSERT INTO `w_weather_city` VALUES ('CN101090211', '河北', '保定', '安新', 'anxin');
INSERT INTO `w_weather_city` VALUES ('CN101090212', '河北', '保定', '易县', 'yixian');
INSERT INTO `w_weather_city` VALUES ('CN101090214', '河北', '保定', '曲阳', 'quyang');
INSERT INTO `w_weather_city` VALUES ('CN101090215', '河北', '保定', '蠡县', 'lixian');
INSERT INTO `w_weather_city` VALUES ('CN101090216', '河北', '保定', '顺平', 'shunping');
INSERT INTO `w_weather_city` VALUES ('CN101090217', '河北', '保定', '雄县', 'xiongxian');
INSERT INTO `w_weather_city` VALUES ('CN101090218', '河北', '保定', '涿州', 'zhuozhou');
INSERT INTO `w_weather_city` VALUES ('CN101090219', '河北', '保定', '定州', 'dingzhou');
INSERT INTO `w_weather_city` VALUES ('CN101090220', '河北', '保定', '安国', 'anguo');
INSERT INTO `w_weather_city` VALUES ('CN101090221', '河北', '保定', '高碑店', 'gaobeidian');
INSERT INTO `w_weather_city` VALUES ('CN101090222', '河北', '保定', '涞水', 'laishui');
INSERT INTO `w_weather_city` VALUES ('CN101090223', '河北', '保定', '定兴', 'dingxing');
INSERT INTO `w_weather_city` VALUES ('CN101090224', '河北', '保定', '清苑', 'qingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101090225', '河北', '保定', '博野', 'boye');
INSERT INTO `w_weather_city` VALUES ('CN101090301', '河北', '张家口', '张家口', 'zhangjiakou');
INSERT INTO `w_weather_city` VALUES ('CN101090302', '河北', '张家口', '宣化', 'xuanhua');
INSERT INTO `w_weather_city` VALUES ('CN101090303', '河北', '张家口', '张北', 'zhangbei');
INSERT INTO `w_weather_city` VALUES ('CN101090304', '河北', '张家口', '康保', 'kangbao');
INSERT INTO `w_weather_city` VALUES ('CN101090305', '河北', '张家口', '沽源', 'guyuan');
INSERT INTO `w_weather_city` VALUES ('CN101090306', '河北', '张家口', '尚义', 'shangyi');
INSERT INTO `w_weather_city` VALUES ('CN101090307', '河北', '张家口', '蔚县', 'yuxian');
INSERT INTO `w_weather_city` VALUES ('CN101090308', '河北', '张家口', '阳原', 'yangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101090309', '河北', '张家口', '怀安', 'huaian');
INSERT INTO `w_weather_city` VALUES ('CN101090310', '河北', '张家口', '万全', 'wanquan');
INSERT INTO `w_weather_city` VALUES ('CN101090311', '河北', '张家口', '怀来', 'huailai');
INSERT INTO `w_weather_city` VALUES ('CN101090312', '河北', '张家口', '涿鹿', 'zhuolu');
INSERT INTO `w_weather_city` VALUES ('CN101090313', '河北', '张家口', '赤城', 'chicheng');
INSERT INTO `w_weather_city` VALUES ('CN101090314', '河北', '张家口', '崇礼', 'chongli');
INSERT INTO `w_weather_city` VALUES ('CN101090402', '河北', '承德', '承德', 'chengde');
INSERT INTO `w_weather_city` VALUES ('CN101090403', '河北', '承德', '承德县', 'chengdexian');
INSERT INTO `w_weather_city` VALUES ('CN101090404', '河北', '承德', '兴隆', 'xinglong');
INSERT INTO `w_weather_city` VALUES ('CN101090405', '河北', '承德', '平泉', 'pingquan');
INSERT INTO `w_weather_city` VALUES ('CN101090406', '河北', '承德', '滦平', 'luanping');
INSERT INTO `w_weather_city` VALUES ('CN101090407', '河北', '承德', '隆化', 'longhua');
INSERT INTO `w_weather_city` VALUES ('CN101090408', '河北', '承德', '丰宁', 'fengning');
INSERT INTO `w_weather_city` VALUES ('CN101090409', '河北', '承德', '宽城', 'kuancheng');
INSERT INTO `w_weather_city` VALUES ('CN101090410', '河北', '承德', '围场', 'weichang');
INSERT INTO `w_weather_city` VALUES ('CN101090501', '河北', '唐山', '唐山', 'tangshan');
INSERT INTO `w_weather_city` VALUES ('CN101090502', '河北', '唐山', '丰南', 'fengnan');
INSERT INTO `w_weather_city` VALUES ('CN101090503', '河北', '唐山', '丰润', 'fengrun');
INSERT INTO `w_weather_city` VALUES ('CN101090504', '河北', '唐山', '滦县', 'luanxian');
INSERT INTO `w_weather_city` VALUES ('CN101090505', '河北', '唐山', '滦南', 'luannan');
INSERT INTO `w_weather_city` VALUES ('CN101090506', '河北', '唐山', '乐亭', 'leting');
INSERT INTO `w_weather_city` VALUES ('CN101090507', '河北', '唐山', '迁西', 'qianxi');
INSERT INTO `w_weather_city` VALUES ('CN101090508', '河北', '唐山', '玉田', 'yutian');
INSERT INTO `w_weather_city` VALUES ('CN101090509', '河北', '唐山', '唐海', 'tanghai');
INSERT INTO `w_weather_city` VALUES ('CN101090510', '河北', '唐山', '遵化', 'zunhua');
INSERT INTO `w_weather_city` VALUES ('CN101090511', '河北', '唐山', '迁安', 'qianan');
INSERT INTO `w_weather_city` VALUES ('CN101090512', '河北', '唐山', '曹妃甸', 'caofeidian');
INSERT INTO `w_weather_city` VALUES ('CN101090601', '河北', '廊坊', '廊坊', 'langfang');
INSERT INTO `w_weather_city` VALUES ('CN101090602', '河北', '廊坊', '固安', 'guan');
INSERT INTO `w_weather_city` VALUES ('CN101090603', '河北', '廊坊', '永清', 'yongqing');
INSERT INTO `w_weather_city` VALUES ('CN101090604', '河北', '廊坊', '香河', 'xianghe');
INSERT INTO `w_weather_city` VALUES ('CN101090605', '河北', '廊坊', '大城', 'dacheng');
INSERT INTO `w_weather_city` VALUES ('CN101090606', '河北', '廊坊', '文安', 'wenan');
INSERT INTO `w_weather_city` VALUES ('CN101090607', '河北', '廊坊', '大厂', 'dachang');
INSERT INTO `w_weather_city` VALUES ('CN101090608', '河北', '廊坊', '霸州', 'bazhou');
INSERT INTO `w_weather_city` VALUES ('CN101090609', '河北', '廊坊', '三河', 'sanhe');
INSERT INTO `w_weather_city` VALUES ('CN101090701', '河北', '沧州', '沧州', 'cangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101090702', '河北', '沧州', '青县', 'qingxian');
INSERT INTO `w_weather_city` VALUES ('CN101090703', '河北', '沧州', '东光', 'dongguang');
INSERT INTO `w_weather_city` VALUES ('CN101090704', '河北', '沧州', '海兴', 'haixing');
INSERT INTO `w_weather_city` VALUES ('CN101090705', '河北', '沧州', '盐山', 'yanshan');
INSERT INTO `w_weather_city` VALUES ('CN101090706', '河北', '沧州', '肃宁', 'suning');
INSERT INTO `w_weather_city` VALUES ('CN101090707', '河北', '沧州', '南皮', 'nanpi');
INSERT INTO `w_weather_city` VALUES ('CN101090708', '河北', '沧州', '吴桥', 'wuqiao');
INSERT INTO `w_weather_city` VALUES ('CN101090709', '河北', '沧州', '献县', 'xianxian');
INSERT INTO `w_weather_city` VALUES ('CN101090710', '河北', '沧州', '孟村', 'mengcun');
INSERT INTO `w_weather_city` VALUES ('CN101090711', '河北', '沧州', '泊头', 'botou');
INSERT INTO `w_weather_city` VALUES ('CN101090712', '河北', '沧州', '任丘', 'renqiu');
INSERT INTO `w_weather_city` VALUES ('CN101090713', '河北', '沧州', '黄骅', 'huanghua');
INSERT INTO `w_weather_city` VALUES ('CN101090714', '河北', '沧州', '河间', 'hejian');
INSERT INTO `w_weather_city` VALUES ('CN101090716', '河北', '沧州', '沧县', 'cangxian');
INSERT INTO `w_weather_city` VALUES ('CN101090801', '河北', '衡水', '衡水', 'hengshui');
INSERT INTO `w_weather_city` VALUES ('CN101090802', '河北', '衡水', '枣强', 'zaoqiang');
INSERT INTO `w_weather_city` VALUES ('CN101090803', '河北', '衡水', '武邑', 'wuyi');
INSERT INTO `w_weather_city` VALUES ('CN101090804', '河北', '衡水', '武强', 'wuqiang');
INSERT INTO `w_weather_city` VALUES ('CN101090805', '河北', '衡水', '饶阳', 'raoyang');
INSERT INTO `w_weather_city` VALUES ('CN101090806', '河北', '衡水', '安平', 'anping');
INSERT INTO `w_weather_city` VALUES ('CN101090807', '河北', '衡水', '故城', 'gucheng');
INSERT INTO `w_weather_city` VALUES ('CN101090808', '河北', '衡水', '景县', 'jingxian');
INSERT INTO `w_weather_city` VALUES ('CN101090809', '河北', '衡水', '阜城', 'fucheng');
INSERT INTO `w_weather_city` VALUES ('CN101090810', '河北', '衡水', '冀州', 'jizhou');
INSERT INTO `w_weather_city` VALUES ('CN101090811', '河北', '衡水', '深州', 'shenzhou');
INSERT INTO `w_weather_city` VALUES ('CN101090901', '河北', '邢台', '邢台', 'xingtai');
INSERT INTO `w_weather_city` VALUES ('CN101090902', '河北', '邢台', '临城', 'lincheng');
INSERT INTO `w_weather_city` VALUES ('CN101090904', '河北', '邢台', '内丘', 'neiqiu');
INSERT INTO `w_weather_city` VALUES ('CN101090905', '河北', '邢台', '柏乡', 'baixiang');
INSERT INTO `w_weather_city` VALUES ('CN101090906', '河北', '邢台', '隆尧', 'longyao');
INSERT INTO `w_weather_city` VALUES ('CN101090907', '河北', '邢台', '南和', 'nanhe');
INSERT INTO `w_weather_city` VALUES ('CN101090908', '河北', '邢台', '宁晋', 'ningjin');
INSERT INTO `w_weather_city` VALUES ('CN101090909', '河北', '邢台', '巨鹿', 'julu');
INSERT INTO `w_weather_city` VALUES ('CN101090910', '河北', '邢台', '新河', 'xinhe');
INSERT INTO `w_weather_city` VALUES ('CN101090911', '河北', '邢台', '广宗', 'guangzong');
INSERT INTO `w_weather_city` VALUES ('CN101090912', '河北', '邢台', '平乡', 'pingxiang');
INSERT INTO `w_weather_city` VALUES ('CN101090913', '河北', '邢台', '威县', 'weixian');
INSERT INTO `w_weather_city` VALUES ('CN101090914', '河北', '邢台', '清河', 'qinghe');
INSERT INTO `w_weather_city` VALUES ('CN101090915', '河北', '邢台', '临西', 'linxi');
INSERT INTO `w_weather_city` VALUES ('CN101090916', '河北', '邢台', '南宫', 'nangong');
INSERT INTO `w_weather_city` VALUES ('CN101090917', '河北', '邢台', '沙河', 'shahe');
INSERT INTO `w_weather_city` VALUES ('CN101090918', '河北', '邢台', '任县', 'renxian');
INSERT INTO `w_weather_city` VALUES ('CN101091001', '河北', '邯郸', '邯郸', 'handan');
INSERT INTO `w_weather_city` VALUES ('CN101091002', '河北', '邯郸', '峰峰', 'fengfeng');
INSERT INTO `w_weather_city` VALUES ('CN101091003', '河北', '邯郸', '临漳', 'linzhang');
INSERT INTO `w_weather_city` VALUES ('CN101091004', '河北', '邯郸', '成安', 'chengan');
INSERT INTO `w_weather_city` VALUES ('CN101091005', '河北', '邯郸', '大名', 'daming');
INSERT INTO `w_weather_city` VALUES ('CN101091006', '河北', '邯郸', '涉县', 'shexian');
INSERT INTO `w_weather_city` VALUES ('CN101091007', '河北', '邯郸', '磁县', 'cixian');
INSERT INTO `w_weather_city` VALUES ('CN101091008', '河北', '邯郸', '肥乡', 'feixiang');
INSERT INTO `w_weather_city` VALUES ('CN101091009', '河北', '邯郸', '永年', 'yongnian');
INSERT INTO `w_weather_city` VALUES ('CN101091010', '河北', '邯郸', '邱县', 'qiuxian');
INSERT INTO `w_weather_city` VALUES ('CN101091011', '河北', '邯郸', '鸡泽', 'jize');
INSERT INTO `w_weather_city` VALUES ('CN101091012', '河北', '邯郸', '广平', 'guangping');
INSERT INTO `w_weather_city` VALUES ('CN101091013', '河北', '邯郸', '馆陶', 'guantao');
INSERT INTO `w_weather_city` VALUES ('CN101091014', '河北', '邯郸', '魏县', 'weixian');
INSERT INTO `w_weather_city` VALUES ('CN101091015', '河北', '邯郸', '曲周', 'quzhou');
INSERT INTO `w_weather_city` VALUES ('CN101091016', '河北', '邯郸', '武安', 'wuan');
INSERT INTO `w_weather_city` VALUES ('CN101091101', '河北', '秦皇岛', '秦皇岛', 'qinhuangdao');
INSERT INTO `w_weather_city` VALUES ('CN101091102', '河北', '秦皇岛', '青龙', 'qinglong');
INSERT INTO `w_weather_city` VALUES ('CN101091103', '河北', '秦皇岛', '昌黎', 'changli');
INSERT INTO `w_weather_city` VALUES ('CN101091104', '河北', '秦皇岛', '抚宁', 'funing');
INSERT INTO `w_weather_city` VALUES ('CN101091105', '河北', '秦皇岛', '卢龙', 'lulong');
INSERT INTO `w_weather_city` VALUES ('CN101091106', '河北', '秦皇岛', '北戴河', 'beidaihe');
INSERT INTO `w_weather_city` VALUES ('CN101100101', '山西', '太原', '太原', 'taiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101100102', '山西', '太原', '清徐', 'qingxu');
INSERT INTO `w_weather_city` VALUES ('CN101100103', '山西', '太原', '阳曲', 'yangqu');
INSERT INTO `w_weather_city` VALUES ('CN101100104', '山西', '太原', '娄烦', 'loufan');
INSERT INTO `w_weather_city` VALUES ('CN101100105', '山西', '太原', '古交', 'gujiao');
INSERT INTO `w_weather_city` VALUES ('CN101100106', '山西', '太原', '尖草坪区', 'jiancaopingqu');
INSERT INTO `w_weather_city` VALUES ('CN101100107', '山西', '太原', '小店区', 'xiaodianqu');
INSERT INTO `w_weather_city` VALUES ('CN101100201', '山西', '大同', '大同', 'datong');
INSERT INTO `w_weather_city` VALUES ('CN101100202', '山西', '大同', '阳高', 'yanggao');
INSERT INTO `w_weather_city` VALUES ('CN101100203', '山西', '大同', '大同县', 'datongxian');
INSERT INTO `w_weather_city` VALUES ('CN101100204', '山西', '大同', '天镇', 'tianzhen');
INSERT INTO `w_weather_city` VALUES ('CN101100205', '山西', '大同', '广灵', 'guangling');
INSERT INTO `w_weather_city` VALUES ('CN101100206', '山西', '大同', '灵丘', 'lingqiu');
INSERT INTO `w_weather_city` VALUES ('CN101100207', '山西', '大同', '浑源', 'hunyuan');
INSERT INTO `w_weather_city` VALUES ('CN101100208', '山西', '大同', '左云', 'zuoyun');
INSERT INTO `w_weather_city` VALUES ('CN101100301', '山西', '阳泉', '阳泉', 'yangquan');
INSERT INTO `w_weather_city` VALUES ('CN101100302', '山西', '阳泉', '盂县', 'yuxian');
INSERT INTO `w_weather_city` VALUES ('CN101100303', '山西', '阳泉', '平定', 'pingding');
INSERT INTO `w_weather_city` VALUES ('CN101100401', '山西', '晋中', '晋中', 'jinzhong');
INSERT INTO `w_weather_city` VALUES ('CN101100402', '山西', '晋中', '榆次', 'yuci');
INSERT INTO `w_weather_city` VALUES ('CN101100403', '山西', '晋中', '榆社', 'yushe');
INSERT INTO `w_weather_city` VALUES ('CN101100404', '山西', '晋中', '左权', 'zuoquan');
INSERT INTO `w_weather_city` VALUES ('CN101100405', '山西', '晋中', '和顺', 'heshun');
INSERT INTO `w_weather_city` VALUES ('CN101100406', '山西', '晋中', '昔阳', 'xiyang');
INSERT INTO `w_weather_city` VALUES ('CN101100407', '山西', '晋中', '寿阳', 'shouyang');
INSERT INTO `w_weather_city` VALUES ('CN101100408', '山西', '晋中', '太谷', 'taigu');
INSERT INTO `w_weather_city` VALUES ('CN101100409', '山西', '晋中', '祁县', 'qixian');
INSERT INTO `w_weather_city` VALUES ('CN101100410', '山西', '晋中', '平遥', 'pingyao');
INSERT INTO `w_weather_city` VALUES ('CN101100411', '山西', '晋中', '灵石', 'lingshi');
INSERT INTO `w_weather_city` VALUES ('CN101100412', '山西', '晋中', '介休', 'jiexiu');
INSERT INTO `w_weather_city` VALUES ('CN101100501', '山西', '长治', '长治', 'changzhi');
INSERT INTO `w_weather_city` VALUES ('CN101100502', '山西', '长治', '黎城', 'licheng');
INSERT INTO `w_weather_city` VALUES ('CN101100503', '山西', '长治', '屯留', 'tunliu');
INSERT INTO `w_weather_city` VALUES ('CN101100504', '山西', '长治', '潞城', 'lucheng');
INSERT INTO `w_weather_city` VALUES ('CN101100505', '山西', '长治', '襄垣', 'xiangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101100506', '山西', '长治', '平顺', 'pingshun');
INSERT INTO `w_weather_city` VALUES ('CN101100507', '山西', '长治', '武乡', 'wuxiang');
INSERT INTO `w_weather_city` VALUES ('CN101100508', '山西', '长治', '沁县', 'qinxian');
INSERT INTO `w_weather_city` VALUES ('CN101100509', '山西', '长治', '长子', 'zhangzi');
INSERT INTO `w_weather_city` VALUES ('CN101100510', '山西', '长治', '沁源', 'qinyuan');
INSERT INTO `w_weather_city` VALUES ('CN101100511', '山西', '长治', '壶关', 'huguan');
INSERT INTO `w_weather_city` VALUES ('CN101100601', '山西', '晋城', '晋城', 'jincheng');
INSERT INTO `w_weather_city` VALUES ('CN101100602', '山西', '晋城', '沁水', 'qinshui');
INSERT INTO `w_weather_city` VALUES ('CN101100603', '山西', '晋城', '阳城', 'yangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101100604', '山西', '晋城', '陵川', 'lingchuan');
INSERT INTO `w_weather_city` VALUES ('CN101100605', '山西', '晋城', '高平', 'gaoping');
INSERT INTO `w_weather_city` VALUES ('CN101100606', '山西', '晋城', '泽州', 'zezhou');
INSERT INTO `w_weather_city` VALUES ('CN101100701', '山西', '临汾', '临汾', 'linfen');
INSERT INTO `w_weather_city` VALUES ('CN101100702', '山西', '临汾', '曲沃', 'quwo');
INSERT INTO `w_weather_city` VALUES ('CN101100703', '山西', '临汾', '永和', 'yonghe');
INSERT INTO `w_weather_city` VALUES ('CN101100704', '山西', '临汾', '隰县', 'xixian');
INSERT INTO `w_weather_city` VALUES ('CN101100705', '山西', '临汾', '大宁', 'daning');
INSERT INTO `w_weather_city` VALUES ('CN101100706', '山西', '临汾', '吉县', 'jixian');
INSERT INTO `w_weather_city` VALUES ('CN101100707', '山西', '临汾', '襄汾', 'xiangfen');
INSERT INTO `w_weather_city` VALUES ('CN101100708', '山西', '临汾', '蒲县', 'puxian');
INSERT INTO `w_weather_city` VALUES ('CN101100709', '山西', '临汾', '汾西', 'fenxi');
INSERT INTO `w_weather_city` VALUES ('CN101100710', '山西', '临汾', '洪洞', 'hongtong');
INSERT INTO `w_weather_city` VALUES ('CN101100711', '山西', '临汾', '霍州', 'huozhou');
INSERT INTO `w_weather_city` VALUES ('CN101100712', '山西', '临汾', '乡宁', 'xiangning');
INSERT INTO `w_weather_city` VALUES ('CN101100713', '山西', '临汾', '翼城', 'yicheng');
INSERT INTO `w_weather_city` VALUES ('CN101100714', '山西', '临汾', '侯马', 'houma');
INSERT INTO `w_weather_city` VALUES ('CN101100715', '山西', '临汾', '浮山', 'fushan');
INSERT INTO `w_weather_city` VALUES ('CN101100716', '山西', '临汾', '安泽', 'anze');
INSERT INTO `w_weather_city` VALUES ('CN101100717', '山西', '临汾', '古县', 'guxian');
INSERT INTO `w_weather_city` VALUES ('CN101100801', '山西', '运城', '运城', 'yuncheng');
INSERT INTO `w_weather_city` VALUES ('CN101100802', '山西', '运城', '临猗', 'linyi');
INSERT INTO `w_weather_city` VALUES ('CN101100803', '山西', '运城', '稷山', 'jishan');
INSERT INTO `w_weather_city` VALUES ('CN101100804', '山西', '运城', '万荣', 'wanrong');
INSERT INTO `w_weather_city` VALUES ('CN101100805', '山西', '运城', '河津', 'hejin');
INSERT INTO `w_weather_city` VALUES ('CN101100806', '山西', '运城', '新绛', 'xinjiang');
INSERT INTO `w_weather_city` VALUES ('CN101100807', '山西', '运城', '绛县', 'jiangxian');
INSERT INTO `w_weather_city` VALUES ('CN101100808', '山西', '运城', '闻喜', 'wenxi');
INSERT INTO `w_weather_city` VALUES ('CN101100809', '山西', '运城', '垣曲', 'yuanqu');
INSERT INTO `w_weather_city` VALUES ('CN101100810', '山西', '运城', '永济', 'yongji');
INSERT INTO `w_weather_city` VALUES ('CN101100811', '山西', '运城', '芮城', 'ruicheng');
INSERT INTO `w_weather_city` VALUES ('CN101100812', '山西', '运城', '夏县', 'xiaxian');
INSERT INTO `w_weather_city` VALUES ('CN101100813', '山西', '运城', '平陆', 'pinglu');
INSERT INTO `w_weather_city` VALUES ('CN101100901', '山西', '朔州', '朔州', 'shuozhou');
INSERT INTO `w_weather_city` VALUES ('CN101100902', '山西', '朔州', '平鲁', 'pinglu');
INSERT INTO `w_weather_city` VALUES ('CN101100903', '山西', '朔州', '山阴', 'shanyin');
INSERT INTO `w_weather_city` VALUES ('CN101100904', '山西', '朔州', '右玉', 'youyu');
INSERT INTO `w_weather_city` VALUES ('CN101100905', '山西', '朔州', '应县', 'yingxian');
INSERT INTO `w_weather_city` VALUES ('CN101100906', '山西', '朔州', '怀仁', 'huairen');
INSERT INTO `w_weather_city` VALUES ('CN101101001', '山西', '忻州', '忻州', 'xinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101101002', '山西', '忻州', '定襄', 'dingxiang');
INSERT INTO `w_weather_city` VALUES ('CN101101003', '山西', '忻州', '五台县', 'wutaixian');
INSERT INTO `w_weather_city` VALUES ('CN101101004', '山西', '忻州', '河曲', 'hequ');
INSERT INTO `w_weather_city` VALUES ('CN101101005', '山西', '忻州', '偏关', 'pianguan');
INSERT INTO `w_weather_city` VALUES ('CN101101006', '山西', '忻州', '神池', 'shenchi');
INSERT INTO `w_weather_city` VALUES ('CN101101007', '山西', '忻州', '宁武', 'ningwu');
INSERT INTO `w_weather_city` VALUES ('CN101101008', '山西', '忻州', '代县', 'daixian');
INSERT INTO `w_weather_city` VALUES ('CN101101009', '山西', '忻州', '繁峙', 'fanshi');
INSERT INTO `w_weather_city` VALUES ('CN101101010', '山西', '忻州', '五台山', 'wutaishan');
INSERT INTO `w_weather_city` VALUES ('CN101101011', '山西', '忻州', '保德', 'bode');
INSERT INTO `w_weather_city` VALUES ('CN101101012', '山西', '忻州', '静乐', 'jingle');
INSERT INTO `w_weather_city` VALUES ('CN101101013', '山西', '忻州', '岢岚', 'kelan');
INSERT INTO `w_weather_city` VALUES ('CN101101014', '山西', '忻州', '五寨', 'wuzhai');
INSERT INTO `w_weather_city` VALUES ('CN101101015', '山西', '忻州', '原平', 'yuanping');
INSERT INTO `w_weather_city` VALUES ('CN101101100', '山西', '吕梁', '吕梁', 'lvliang');
INSERT INTO `w_weather_city` VALUES ('CN101101101', '山西', '吕梁', '离石', 'lishi');
INSERT INTO `w_weather_city` VALUES ('CN101101102', '山西', '吕梁', '临县', 'linxian');
INSERT INTO `w_weather_city` VALUES ('CN101101103', '山西', '吕梁', '兴县', 'xingxian');
INSERT INTO `w_weather_city` VALUES ('CN101101104', '山西', '吕梁', '岚县', 'lanxian');
INSERT INTO `w_weather_city` VALUES ('CN101101105', '山西', '吕梁', '柳林', 'liulin');
INSERT INTO `w_weather_city` VALUES ('CN101101106', '山西', '吕梁', '石楼', 'shilou');
INSERT INTO `w_weather_city` VALUES ('CN101101107', '山西', '吕梁', '方山', 'fangshan');
INSERT INTO `w_weather_city` VALUES ('CN101101108', '山西', '吕梁', '交口', 'jiaokou');
INSERT INTO `w_weather_city` VALUES ('CN101101109', '山西', '吕梁', '中阳', 'zhongyang');
INSERT INTO `w_weather_city` VALUES ('CN101101110', '山西', '吕梁', '孝义', 'xiaoyi');
INSERT INTO `w_weather_city` VALUES ('CN101101111', '山西', '吕梁', '汾阳', 'fenyang');
INSERT INTO `w_weather_city` VALUES ('CN101101112', '山西', '吕梁', '文水', 'wenshui');
INSERT INTO `w_weather_city` VALUES ('CN101101113', '山西', '吕梁', '交城', 'jiaocheng');
INSERT INTO `w_weather_city` VALUES ('CN101110101', '陕西', '西安', '西安', 'xian');
INSERT INTO `w_weather_city` VALUES ('CN101110102', '陕西', '西安', '长安', 'changan');
INSERT INTO `w_weather_city` VALUES ('CN101110103', '陕西', '西安', '临潼', 'lintong');
INSERT INTO `w_weather_city` VALUES ('CN101110104', '陕西', '西安', '蓝田', 'lantian');
INSERT INTO `w_weather_city` VALUES ('CN101110105', '陕西', '西安', '周至', 'zhouzhi');
INSERT INTO `w_weather_city` VALUES ('CN101110106', '陕西', '西安', '户县', 'huxian');
INSERT INTO `w_weather_city` VALUES ('CN101110107', '陕西', '西安', '高陵', 'gaoling');
INSERT INTO `w_weather_city` VALUES ('CN101110200', '陕西', '咸阳', '咸阳', 'xianyang');
INSERT INTO `w_weather_city` VALUES ('CN101110201', '陕西', '咸阳', '三原', 'sanyuan');
INSERT INTO `w_weather_city` VALUES ('CN101110202', '陕西', '咸阳', '礼泉', 'liquan');
INSERT INTO `w_weather_city` VALUES ('CN101110203', '陕西', '咸阳', '永寿', 'yongshou');
INSERT INTO `w_weather_city` VALUES ('CN101110204', '陕西', '咸阳', '淳化', 'chunhua');
INSERT INTO `w_weather_city` VALUES ('CN101110205', '陕西', '咸阳', '泾阳', 'jingyang');
INSERT INTO `w_weather_city` VALUES ('CN101110206', '陕西', '咸阳', '武功', 'wugong');
INSERT INTO `w_weather_city` VALUES ('CN101110207', '陕西', '咸阳', '乾县', 'qianxian');
INSERT INTO `w_weather_city` VALUES ('CN101110208', '陕西', '咸阳', '彬县', 'binxian');
INSERT INTO `w_weather_city` VALUES ('CN101110209', '陕西', '咸阳', '长武', 'changwu');
INSERT INTO `w_weather_city` VALUES ('CN101110210', '陕西', '咸阳', '旬邑', 'xunyi');
INSERT INTO `w_weather_city` VALUES ('CN101110211', '陕西', '咸阳', '兴平', 'xingping');
INSERT INTO `w_weather_city` VALUES ('CN101110300', '陕西', '延安', '延安', 'yanan');
INSERT INTO `w_weather_city` VALUES ('CN101110301', '陕西', '延安', '延长', 'yanchang');
INSERT INTO `w_weather_city` VALUES ('CN101110302', '陕西', '延安', '延川', 'yanchuan');
INSERT INTO `w_weather_city` VALUES ('CN101110303', '陕西', '延安', '子长', 'zichang');
INSERT INTO `w_weather_city` VALUES ('CN101110304', '陕西', '延安', '宜川', 'yichuan');
INSERT INTO `w_weather_city` VALUES ('CN101110305', '陕西', '延安', '富县', 'fuxian');
INSERT INTO `w_weather_city` VALUES ('CN101110306', '陕西', '延安', '志丹', 'zhidan');
INSERT INTO `w_weather_city` VALUES ('CN101110307', '陕西', '延安', '安塞', 'ansai');
INSERT INTO `w_weather_city` VALUES ('CN101110308', '陕西', '延安', '甘泉', 'ganquan');
INSERT INTO `w_weather_city` VALUES ('CN101110309', '陕西', '延安', '洛川', 'luochuan');
INSERT INTO `w_weather_city` VALUES ('CN101110310', '陕西', '延安', '黄陵', 'huangling');
INSERT INTO `w_weather_city` VALUES ('CN101110311', '陕西', '延安', '黄龙', 'huanglong');
INSERT INTO `w_weather_city` VALUES ('CN101110312', '陕西', '延安', '吴起', 'wuqi');
INSERT INTO `w_weather_city` VALUES ('CN101110401', '陕西', '榆林', '榆林', 'yulin');
INSERT INTO `w_weather_city` VALUES ('CN101110402', '陕西', '榆林', '府谷', 'fugu');
INSERT INTO `w_weather_city` VALUES ('CN101110403', '陕西', '榆林', '神木', 'shenmu');
INSERT INTO `w_weather_city` VALUES ('CN101110404', '陕西', '榆林', '佳县', 'jiaxian');
INSERT INTO `w_weather_city` VALUES ('CN101110405', '陕西', '榆林', '定边', 'dingbian');
INSERT INTO `w_weather_city` VALUES ('CN101110406', '陕西', '榆林', '靖边', 'jingbian');
INSERT INTO `w_weather_city` VALUES ('CN101110407', '陕西', '榆林', '横山', 'hengshan');
INSERT INTO `w_weather_city` VALUES ('CN101110408', '陕西', '榆林', '米脂', 'mizhi');
INSERT INTO `w_weather_city` VALUES ('CN101110409', '陕西', '榆林', '子洲', 'zizhou');
INSERT INTO `w_weather_city` VALUES ('CN101110410', '陕西', '榆林', '绥德', 'suide');
INSERT INTO `w_weather_city` VALUES ('CN101110411', '陕西', '榆林', '吴堡', 'wubu');
INSERT INTO `w_weather_city` VALUES ('CN101110412', '陕西', '榆林', '清涧', 'qingjian');
INSERT INTO `w_weather_city` VALUES ('CN101110413', '陕西', '榆林', '榆阳', 'yuyang');
INSERT INTO `w_weather_city` VALUES ('CN101110501', '陕西', '渭南', '渭南', 'weinan');
INSERT INTO `w_weather_city` VALUES ('CN101110502', '陕西', '渭南', '华县', 'huaxian');
INSERT INTO `w_weather_city` VALUES ('CN101110503', '陕西', '渭南', '潼关', 'tongguan');
INSERT INTO `w_weather_city` VALUES ('CN101110504', '陕西', '渭南', '大荔', 'dali');
INSERT INTO `w_weather_city` VALUES ('CN101110505', '陕西', '渭南', '白水', 'baishui');
INSERT INTO `w_weather_city` VALUES ('CN101110506', '陕西', '渭南', '富平', 'fuping');
INSERT INTO `w_weather_city` VALUES ('CN101110507', '陕西', '渭南', '蒲城', 'pucheng');
INSERT INTO `w_weather_city` VALUES ('CN101110508', '陕西', '渭南', '澄城', 'chengcheng');
INSERT INTO `w_weather_city` VALUES ('CN101110509', '陕西', '渭南', '合阳', 'heyang');
INSERT INTO `w_weather_city` VALUES ('CN101110510', '陕西', '渭南', '韩城', 'hancheng');
INSERT INTO `w_weather_city` VALUES ('CN101110511', '陕西', '渭南', '华阴', 'huayin');
INSERT INTO `w_weather_city` VALUES ('CN101110601', '陕西', '商洛', '商洛', 'shangluo');
INSERT INTO `w_weather_city` VALUES ('CN101110602', '陕西', '商洛', '洛南', 'luonan');
INSERT INTO `w_weather_city` VALUES ('CN101110603', '陕西', '商洛', '柞水', 'zhashui');
INSERT INTO `w_weather_city` VALUES ('CN101110604', '陕西', '商洛', '商州', 'shangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101110605', '陕西', '商洛', '镇安', 'zhenan');
INSERT INTO `w_weather_city` VALUES ('CN101110606', '陕西', '商洛', '丹凤', 'danfeng');
INSERT INTO `w_weather_city` VALUES ('CN101110607', '陕西', '商洛', '商南', 'shangnan');
INSERT INTO `w_weather_city` VALUES ('CN101110608', '陕西', '商洛', '山阳', 'shanyang');
INSERT INTO `w_weather_city` VALUES ('CN101110701', '陕西', '安康', '安康', 'ankang');
INSERT INTO `w_weather_city` VALUES ('CN101110702', '陕西', '安康', '紫阳', 'ziyang');
INSERT INTO `w_weather_city` VALUES ('CN101110703', '陕西', '安康', '石泉', 'shiquan');
INSERT INTO `w_weather_city` VALUES ('CN101110704', '陕西', '安康', '汉阴', 'hanyin');
INSERT INTO `w_weather_city` VALUES ('CN101110705', '陕西', '安康', '旬阳', 'xunyang');
INSERT INTO `w_weather_city` VALUES ('CN101110706', '陕西', '安康', '岚皋', 'langao');
INSERT INTO `w_weather_city` VALUES ('CN101110707', '陕西', '安康', '平利', 'pingli');
INSERT INTO `w_weather_city` VALUES ('CN101110708', '陕西', '安康', '白河', 'baihe');
INSERT INTO `w_weather_city` VALUES ('CN101110709', '陕西', '安康', '镇坪', 'zhenping');
INSERT INTO `w_weather_city` VALUES ('CN101110710', '陕西', '安康', '宁陕', 'ningshan');
INSERT INTO `w_weather_city` VALUES ('CN101110801', '陕西', '汉中', '汉中', 'hanzhong');
INSERT INTO `w_weather_city` VALUES ('CN101110802', '陕西', '汉中', '略阳', 'lueyang');
INSERT INTO `w_weather_city` VALUES ('CN101110803', '陕西', '汉中', '勉县', 'mianxian');
INSERT INTO `w_weather_city` VALUES ('CN101110804', '陕西', '汉中', '留坝', 'liuba');
INSERT INTO `w_weather_city` VALUES ('CN101110805', '陕西', '汉中', '洋县', 'yangxian');
INSERT INTO `w_weather_city` VALUES ('CN101110806', '陕西', '汉中', '城固', 'chenggu');
INSERT INTO `w_weather_city` VALUES ('CN101110807', '陕西', '汉中', '西乡', 'xixiang');
INSERT INTO `w_weather_city` VALUES ('CN101110808', '陕西', '汉中', '佛坪', 'fuoping');
INSERT INTO `w_weather_city` VALUES ('CN101110809', '陕西', '汉中', '宁强', 'ningqiang');
INSERT INTO `w_weather_city` VALUES ('CN101110810', '陕西', '汉中', '南郑', 'nanzheng');
INSERT INTO `w_weather_city` VALUES ('CN101110811', '陕西', '汉中', '镇巴', 'zhenba');
INSERT INTO `w_weather_city` VALUES ('CN101110901', '陕西', '宝鸡', '宝鸡', 'baoji');
INSERT INTO `w_weather_city` VALUES ('CN101110903', '陕西', '宝鸡', '千阳', 'qianyang');
INSERT INTO `w_weather_city` VALUES ('CN101110904', '陕西', '宝鸡', '麟游', 'linyou');
INSERT INTO `w_weather_city` VALUES ('CN101110905', '陕西', '宝鸡', '岐山', 'qishan');
INSERT INTO `w_weather_city` VALUES ('CN101110906', '陕西', '宝鸡', '凤翔', 'fengxiang');
INSERT INTO `w_weather_city` VALUES ('CN101110907', '陕西', '宝鸡', '扶风', 'fufeng');
INSERT INTO `w_weather_city` VALUES ('CN101110908', '陕西', '宝鸡', '眉县', 'meixian');
INSERT INTO `w_weather_city` VALUES ('CN101110909', '陕西', '宝鸡', '太白', 'taibai');
INSERT INTO `w_weather_city` VALUES ('CN101110910', '陕西', '宝鸡', '凤县', 'fengxian');
INSERT INTO `w_weather_city` VALUES ('CN101110911', '陕西', '宝鸡', '陇县', 'longxian');
INSERT INTO `w_weather_city` VALUES ('CN101110912', '陕西', '宝鸡', '陈仓', 'chencang');
INSERT INTO `w_weather_city` VALUES ('CN101111001', '陕西', '铜川', '铜川', 'tongchuan');
INSERT INTO `w_weather_city` VALUES ('CN101111002', '陕西', '铜川', '耀县', 'yaoxian');
INSERT INTO `w_weather_city` VALUES ('CN101111003', '陕西', '铜川', '宜君', 'yijun');
INSERT INTO `w_weather_city` VALUES ('CN101111004', '陕西', '铜川', '耀州', 'yaozhou');
INSERT INTO `w_weather_city` VALUES ('CN101111101', '陕西', '杨凌', '杨凌', 'yangling');
INSERT INTO `w_weather_city` VALUES ('CN101120101', '山东', '济南', '济南', 'jinan');
INSERT INTO `w_weather_city` VALUES ('CN101120102', '山东', '济南', '长清', 'changqing');
INSERT INTO `w_weather_city` VALUES ('CN101120103', '山东', '济南', '商河', 'shanghe');
INSERT INTO `w_weather_city` VALUES ('CN101120104', '山东', '济南', '章丘', 'zhangqiu');
INSERT INTO `w_weather_city` VALUES ('CN101120105', '山东', '济南', '平阴', 'pingyin');
INSERT INTO `w_weather_city` VALUES ('CN101120106', '山东', '济南', '济阳', 'jiyang');
INSERT INTO `w_weather_city` VALUES ('CN101120201', '山东', '青岛', '青岛', 'qingdao');
INSERT INTO `w_weather_city` VALUES ('CN101120202', '山东', '青岛', '崂山', 'laoshan');
INSERT INTO `w_weather_city` VALUES ('CN101120204', '山东', '青岛', '即墨', 'jimo');
INSERT INTO `w_weather_city` VALUES ('CN101120205', '山东', '青岛', '胶州', 'jiaozhou');
INSERT INTO `w_weather_city` VALUES ('CN101120206', '山东', '青岛', '黄岛', 'huangdao');
INSERT INTO `w_weather_city` VALUES ('CN101120207', '山东', '青岛', '莱西', 'laixi');
INSERT INTO `w_weather_city` VALUES ('CN101120208', '山东', '青岛', '平度', 'pingdu');
INSERT INTO `w_weather_city` VALUES ('CN101120301', '山东', '淄博', '淄博', 'zibo');
INSERT INTO `w_weather_city` VALUES ('CN101120302', '山东', '淄博', '淄川', 'zichuan');
INSERT INTO `w_weather_city` VALUES ('CN101120303', '山东', '淄博', '博山', 'boshan');
INSERT INTO `w_weather_city` VALUES ('CN101120304', '山东', '淄博', '高青', 'gaoqing');
INSERT INTO `w_weather_city` VALUES ('CN101120305', '山东', '淄博', '周村', 'zhoucun');
INSERT INTO `w_weather_city` VALUES ('CN101120306', '山东', '淄博', '沂源', 'yiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101120307', '山东', '淄博', '桓台', 'huantai');
INSERT INTO `w_weather_city` VALUES ('CN101120308', '山东', '淄博', '临淄', 'linzi');
INSERT INTO `w_weather_city` VALUES ('CN101120401', '山东', '德州', '德州', 'dezhou');
INSERT INTO `w_weather_city` VALUES ('CN101120402', '山东', '德州', '武城', 'wucheng');
INSERT INTO `w_weather_city` VALUES ('CN101120403', '山东', '德州', '临邑', 'linyi');
INSERT INTO `w_weather_city` VALUES ('CN101120404', '山东', '德州', '陵县', 'lingxian');
INSERT INTO `w_weather_city` VALUES ('CN101120405', '山东', '德州', '齐河', 'qihe');
INSERT INTO `w_weather_city` VALUES ('CN101120406', '山东', '德州', '乐陵', 'leling');
INSERT INTO `w_weather_city` VALUES ('CN101120407', '山东', '德州', '庆云', 'qingyun');
INSERT INTO `w_weather_city` VALUES ('CN101120408', '山东', '德州', '平原', 'pingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101120409', '山东', '德州', '宁津', 'ningjin');
INSERT INTO `w_weather_city` VALUES ('CN101120410', '山东', '德州', '夏津', 'xiajin');
INSERT INTO `w_weather_city` VALUES ('CN101120411', '山东', '德州', '禹城', 'yucheng');
INSERT INTO `w_weather_city` VALUES ('CN101120501', '山东', '烟台', '烟台', 'yantai');
INSERT INTO `w_weather_city` VALUES ('CN101120502', '山东', '烟台', '莱州', 'laizhou');
INSERT INTO `w_weather_city` VALUES ('CN101120503', '山东', '烟台', '长岛', 'changdao');
INSERT INTO `w_weather_city` VALUES ('CN101120504', '山东', '烟台', '蓬莱', 'penglai');
INSERT INTO `w_weather_city` VALUES ('CN101120505', '山东', '烟台', '龙口', 'longkou');
INSERT INTO `w_weather_city` VALUES ('CN101120506', '山东', '烟台', '招远', 'zhaoyuan');
INSERT INTO `w_weather_city` VALUES ('CN101120507', '山东', '烟台', '栖霞', 'qixia');
INSERT INTO `w_weather_city` VALUES ('CN101120508', '山东', '烟台', '福山', 'fushan');
INSERT INTO `w_weather_city` VALUES ('CN101120509', '山东', '烟台', '牟平', 'moup');
INSERT INTO `w_weather_city` VALUES ('CN101120510', '山东', '烟台', '莱阳', 'laiyang');
INSERT INTO `w_weather_city` VALUES ('CN101120511', '山东', '烟台', '海阳', 'haiyang');
INSERT INTO `w_weather_city` VALUES ('CN101120601', '山东', '潍坊', '潍坊', 'weifang');
INSERT INTO `w_weather_city` VALUES ('CN101120602', '山东', '潍坊', '青州', 'qingzhou');
INSERT INTO `w_weather_city` VALUES ('CN101120603', '山东', '潍坊', '寿光', 'shouguang');
INSERT INTO `w_weather_city` VALUES ('CN101120604', '山东', '潍坊', '临朐', 'linqu');
INSERT INTO `w_weather_city` VALUES ('CN101120605', '山东', '潍坊', '昌乐', 'changle');
INSERT INTO `w_weather_city` VALUES ('CN101120606', '山东', '潍坊', '昌邑', 'changyi');
INSERT INTO `w_weather_city` VALUES ('CN101120607', '山东', '潍坊', '安丘', 'anqiu');
INSERT INTO `w_weather_city` VALUES ('CN101120608', '山东', '潍坊', '高密', 'gaomi');
INSERT INTO `w_weather_city` VALUES ('CN101120609', '山东', '潍坊', '诸城', 'zhucheng');
INSERT INTO `w_weather_city` VALUES ('CN101120701', '山东', '济宁', '济宁', 'jining');
INSERT INTO `w_weather_city` VALUES ('CN101120702', '山东', '济宁', '嘉祥', 'jiaxiang');
INSERT INTO `w_weather_city` VALUES ('CN101120703', '山东', '济宁', '微山', 'weishan');
INSERT INTO `w_weather_city` VALUES ('CN101120704', '山东', '济宁', '鱼台', 'yutai');
INSERT INTO `w_weather_city` VALUES ('CN101120705', '山东', '济宁', '兖州', 'yanzhou');
INSERT INTO `w_weather_city` VALUES ('CN101120706', '山东', '济宁', '金乡', 'jinxiang');
INSERT INTO `w_weather_city` VALUES ('CN101120707', '山东', '济宁', '汶上', 'wenshang');
INSERT INTO `w_weather_city` VALUES ('CN101120708', '山东', '济宁', '泗水', 'sishui');
INSERT INTO `w_weather_city` VALUES ('CN101120709', '山东', '济宁', '梁山', 'liangshan');
INSERT INTO `w_weather_city` VALUES ('CN101120710', '山东', '济宁', '曲阜', 'qufu');
INSERT INTO `w_weather_city` VALUES ('CN101120711', '山东', '济宁', '邹城', 'zoucheng');
INSERT INTO `w_weather_city` VALUES ('CN101120801', '山东', '泰安', '泰安', 'taian');
INSERT INTO `w_weather_city` VALUES ('CN101120802', '山东', '泰安', '新泰', 'xintai');
INSERT INTO `w_weather_city` VALUES ('CN101120804', '山东', '泰安', '肥城', 'feicheng');
INSERT INTO `w_weather_city` VALUES ('CN101120805', '山东', '泰安', '东平', 'dongping');
INSERT INTO `w_weather_city` VALUES ('CN101120806', '山东', '泰安', '宁阳', 'ningyang');
INSERT INTO `w_weather_city` VALUES ('CN101120901', '山东', '临沂', '临沂', 'linyi');
INSERT INTO `w_weather_city` VALUES ('CN101120902', '山东', '临沂', '莒南', 'junan');
INSERT INTO `w_weather_city` VALUES ('CN101120903', '山东', '临沂', '沂南', 'yinan');
INSERT INTO `w_weather_city` VALUES ('CN101120904', '山东', '临沂', '兰陵', 'lanling');
INSERT INTO `w_weather_city` VALUES ('CN101120905', '山东', '临沂', '临沭', 'linshu');
INSERT INTO `w_weather_city` VALUES ('CN101120906', '山东', '临沂', '郯城', 'tancheng');
INSERT INTO `w_weather_city` VALUES ('CN101120907', '山东', '临沂', '蒙阴', 'mengyin');
INSERT INTO `w_weather_city` VALUES ('CN101120908', '山东', '临沂', '平邑', 'pingyi');
INSERT INTO `w_weather_city` VALUES ('CN101120909', '山东', '临沂', '费县', 'feixian');
INSERT INTO `w_weather_city` VALUES ('CN101120910', '山东', '临沂', '沂水', 'yishui');
INSERT INTO `w_weather_city` VALUES ('CN101121001', '山东', '菏泽', '菏泽', 'heze');
INSERT INTO `w_weather_city` VALUES ('CN101121002', '山东', '菏泽', '鄄城', 'juancheng');
INSERT INTO `w_weather_city` VALUES ('CN101121003', '山东', '菏泽', '郓城', 'yuncheng');
INSERT INTO `w_weather_city` VALUES ('CN101121004', '山东', '菏泽', '东明', 'dongming');
INSERT INTO `w_weather_city` VALUES ('CN101121005', '山东', '菏泽', '定陶', 'dingtao');
INSERT INTO `w_weather_city` VALUES ('CN101121006', '山东', '菏泽', '巨野', 'juye');
INSERT INTO `w_weather_city` VALUES ('CN101121007', '山东', '菏泽', '曹县', 'caoxian');
INSERT INTO `w_weather_city` VALUES ('CN101121008', '山东', '菏泽', '成武', 'chengwu');
INSERT INTO `w_weather_city` VALUES ('CN101121009', '山东', '菏泽', '单县', 'shanxian');
INSERT INTO `w_weather_city` VALUES ('CN101121101', '山东', '滨州', '滨州', 'binzhou');
INSERT INTO `w_weather_city` VALUES ('CN101121102', '山东', '滨州', '博兴', 'boxing');
INSERT INTO `w_weather_city` VALUES ('CN101121103', '山东', '滨州', '无棣', 'wudi');
INSERT INTO `w_weather_city` VALUES ('CN101121104', '山东', '滨州', '阳信', 'yangxin');
INSERT INTO `w_weather_city` VALUES ('CN101121105', '山东', '滨州', '惠民', 'huimin');
INSERT INTO `w_weather_city` VALUES ('CN101121106', '山东', '滨州', '沾化', 'zhanhua');
INSERT INTO `w_weather_city` VALUES ('CN101121107', '山东', '滨州', '邹平', 'zouping');
INSERT INTO `w_weather_city` VALUES ('CN101121201', '山东', '东营', '东营', 'dongying');
INSERT INTO `w_weather_city` VALUES ('CN101121202', '山东', '东营', '河口', 'hekou');
INSERT INTO `w_weather_city` VALUES ('CN101121203', '山东', '东营', '垦利', 'kenli');
INSERT INTO `w_weather_city` VALUES ('CN101121204', '山东', '东营', '利津', 'lijin');
INSERT INTO `w_weather_city` VALUES ('CN101121205', '山东', '东营', '广饶', 'guangrao');
INSERT INTO `w_weather_city` VALUES ('CN101121301', '山东', '威海', '威海', 'weihai');
INSERT INTO `w_weather_city` VALUES ('CN101121302', '山东', '威海', '文登', 'wendeng');
INSERT INTO `w_weather_city` VALUES ('CN101121303', '山东', '威海', '荣成', 'rongcheng');
INSERT INTO `w_weather_city` VALUES ('CN101121304', '山东', '威海', '乳山', 'rushan');
INSERT INTO `w_weather_city` VALUES ('CN101121305', '山东', '威海', '成山头', 'chengshantou');
INSERT INTO `w_weather_city` VALUES ('CN101121306', '山东', '威海', '石岛', 'shidao');
INSERT INTO `w_weather_city` VALUES ('CN101121401', '山东', '枣庄', '枣庄', 'zaozhuang');
INSERT INTO `w_weather_city` VALUES ('CN101121402', '山东', '枣庄', '薛城', 'xuecheng');
INSERT INTO `w_weather_city` VALUES ('CN101121403', '山东', '枣庄', '峄城', 'yicheng');
INSERT INTO `w_weather_city` VALUES ('CN101121404', '山东', '枣庄', '台儿庄', 'taierzhuang');
INSERT INTO `w_weather_city` VALUES ('CN101121405', '山东', '枣庄', '滕州', 'tengzhou');
INSERT INTO `w_weather_city` VALUES ('CN101121501', '山东', '日照', '日照', 'rizhao');
INSERT INTO `w_weather_city` VALUES ('CN101121502', '山东', '日照', '五莲', 'wulian');
INSERT INTO `w_weather_city` VALUES ('CN101121503', '山东', '日照', '莒县', 'juxian');
INSERT INTO `w_weather_city` VALUES ('CN101121601', '山东', '莱芜', '莱芜', 'laiwu');
INSERT INTO `w_weather_city` VALUES ('CN101121701', '山东', '聊城', '聊城', 'liaocheng');
INSERT INTO `w_weather_city` VALUES ('CN101121702', '山东', '聊城', '冠县', 'guanxian');
INSERT INTO `w_weather_city` VALUES ('CN101121703', '山东', '聊城', '阳谷', 'yanggu');
INSERT INTO `w_weather_city` VALUES ('CN101121704', '山东', '聊城', '高唐', 'gaotang');
INSERT INTO `w_weather_city` VALUES ('CN101121705', '山东', '聊城', '茌平', 'chiping');
INSERT INTO `w_weather_city` VALUES ('CN101121706', '山东', '聊城', '东阿', 'donge');
INSERT INTO `w_weather_city` VALUES ('CN101121707', '山东', '聊城', '临清', 'linqing');
INSERT INTO `w_weather_city` VALUES ('CN101121709', '山东', '聊城', '莘县', 'shenxian');
INSERT INTO `w_weather_city` VALUES ('CN101130101', '新疆', '乌鲁木齐', '乌鲁木齐', 'wulumuqi');
INSERT INTO `w_weather_city` VALUES ('CN101130103', '新疆', '乌鲁木齐', '小渠子', 'xiaoquzi');
INSERT INTO `w_weather_city` VALUES ('CN101130105', '新疆', '乌鲁木齐', '达坂城', 'dabancheng');
INSERT INTO `w_weather_city` VALUES ('CN101130108', '新疆', '乌鲁木齐', '乌鲁木齐牧试站', 'wulumuqimushizhan');
INSERT INTO `w_weather_city` VALUES ('CN101130109', '新疆', '乌鲁木齐', '天池', 'tianchi');
INSERT INTO `w_weather_city` VALUES ('CN101130110', '新疆', '乌鲁木齐', '白杨沟', 'baiyanggou');
INSERT INTO `w_weather_city` VALUES ('CN101130201', '新疆', '克拉玛依', '克拉玛依', 'kelamayi');
INSERT INTO `w_weather_city` VALUES ('CN101130202', '新疆', '克拉玛依', '乌尔禾', 'wuerhe');
INSERT INTO `w_weather_city` VALUES ('CN101130203', '新疆', '克拉玛依', '白碱滩', 'baijiantan');
INSERT INTO `w_weather_city` VALUES ('CN101130301', '新疆', '石河子', '石河子', 'shihezi');
INSERT INTO `w_weather_city` VALUES ('CN101130302', '新疆', '石河子', '炮台', 'paotai');
INSERT INTO `w_weather_city` VALUES ('CN101130303', '新疆', '石河子', '莫索湾', 'mosuowan');
INSERT INTO `w_weather_city` VALUES ('CN101130401', '新疆', '昌吉', '昌吉', 'changji');
INSERT INTO `w_weather_city` VALUES ('CN101130402', '新疆', '昌吉', '呼图壁', 'hutubi');
INSERT INTO `w_weather_city` VALUES ('CN101130403', '新疆', '昌吉', '米泉', 'miquan');
INSERT INTO `w_weather_city` VALUES ('CN101130404', '新疆', '昌吉', '阜康', 'fukang');
INSERT INTO `w_weather_city` VALUES ('CN101130405', '新疆', '昌吉', '吉木萨尔', 'jimusaer');
INSERT INTO `w_weather_city` VALUES ('CN101130406', '新疆', '昌吉', '奇台', 'qitai');
INSERT INTO `w_weather_city` VALUES ('CN101130407', '新疆', '昌吉', '玛纳斯', 'manasi');
INSERT INTO `w_weather_city` VALUES ('CN101130408', '新疆', '昌吉', '木垒', 'mulei');
INSERT INTO `w_weather_city` VALUES ('CN101130409', '新疆', '昌吉', '蔡家湖', 'caijiahu');
INSERT INTO `w_weather_city` VALUES ('CN101130501', '新疆', '吐鲁番', '吐鲁番', 'tulufan');
INSERT INTO `w_weather_city` VALUES ('CN101130502', '新疆', '吐鲁番', '托克逊', 'tuokexun');
INSERT INTO `w_weather_city` VALUES ('CN101130504', '新疆', '吐鲁番', '鄯善', 'shanshan');
INSERT INTO `w_weather_city` VALUES ('CN101130601', '新疆', '巴音郭楞', '库尔勒', 'kuerle');
INSERT INTO `w_weather_city` VALUES ('CN101130602', '新疆', '巴音郭楞', '轮台', 'luntai');
INSERT INTO `w_weather_city` VALUES ('CN101130603', '新疆', '巴音郭楞', '尉犁', 'yuli');
INSERT INTO `w_weather_city` VALUES ('CN101130604', '新疆', '巴音郭楞', '若羌', 'ruoqiang');
INSERT INTO `w_weather_city` VALUES ('CN101130605', '新疆', '巴音郭楞', '且末', 'qiemo');
INSERT INTO `w_weather_city` VALUES ('CN101130606', '新疆', '巴音郭楞', '和静', 'hejing');
INSERT INTO `w_weather_city` VALUES ('CN101130607', '新疆', '巴音郭楞', '焉耆', 'yanqi');
INSERT INTO `w_weather_city` VALUES ('CN101130608', '新疆', '巴音郭楞', '和硕', 'shuo');
INSERT INTO `w_weather_city` VALUES ('CN101130610', '新疆', '巴音郭楞', '巴音布鲁克', 'bayinbuluke');
INSERT INTO `w_weather_city` VALUES ('CN101130611', '新疆', '巴音郭楞', '铁干里克', 'tieganlike');
INSERT INTO `w_weather_city` VALUES ('CN101130612', '新疆', '巴音郭楞', '博湖', 'bohu');
INSERT INTO `w_weather_city` VALUES ('CN101130613', '新疆', '巴音郭楞', '塔中', 'tazhong');
INSERT INTO `w_weather_city` VALUES ('CN101130614', '新疆', '巴音郭楞', '巴仑台', 'baluntai');
INSERT INTO `w_weather_city` VALUES ('CN101130701', '新疆', '阿拉尔', '阿拉尔', 'alaer');
INSERT INTO `w_weather_city` VALUES ('CN101130801', '新疆', '阿克苏', '阿克苏', 'akesu');
INSERT INTO `w_weather_city` VALUES ('CN101130802', '新疆', '阿克苏', '乌什', 'wushi');
INSERT INTO `w_weather_city` VALUES ('CN101130803', '新疆', '阿克苏', '温宿', 'wensu');
INSERT INTO `w_weather_city` VALUES ('CN101130804', '新疆', '阿克苏', '拜城', 'baicheng');
INSERT INTO `w_weather_city` VALUES ('CN101130805', '新疆', '阿克苏', '新和', 'xinhe');
INSERT INTO `w_weather_city` VALUES ('CN101130806', '新疆', '阿克苏', '沙雅', 'shaya');
INSERT INTO `w_weather_city` VALUES ('CN101130807', '新疆', '阿克苏', '库车', 'kuche');
INSERT INTO `w_weather_city` VALUES ('CN101130808', '新疆', '阿克苏', '柯坪', 'keping');
INSERT INTO `w_weather_city` VALUES ('CN101130809', '新疆', '阿克苏', '阿瓦提', 'awati');
INSERT INTO `w_weather_city` VALUES ('CN101130901', '新疆', '喀什', '喀什', 'kashi');
INSERT INTO `w_weather_city` VALUES ('CN101130902', '新疆', '喀什', '英吉沙', 'yingjisha');
INSERT INTO `w_weather_city` VALUES ('CN101130903', '新疆', '喀什', '塔什库尔干', 'tashikuergan');
INSERT INTO `w_weather_city` VALUES ('CN101130904', '新疆', '喀什', '麦盖提', 'maigaiti');
INSERT INTO `w_weather_city` VALUES ('CN101130905', '新疆', '喀什', '莎车', 'shache');
INSERT INTO `w_weather_city` VALUES ('CN101130906', '新疆', '喀什', '叶城', 'yecheng');
INSERT INTO `w_weather_city` VALUES ('CN101130907', '新疆', '喀什', '泽普', 'zepu');
INSERT INTO `w_weather_city` VALUES ('CN101130908', '新疆', '喀什', '巴楚', 'bachu');
INSERT INTO `w_weather_city` VALUES ('CN101130909', '新疆', '喀什', '岳普湖', 'yuepuhu');
INSERT INTO `w_weather_city` VALUES ('CN101130910', '新疆', '喀什', '伽师', 'jiashi');
INSERT INTO `w_weather_city` VALUES ('CN101130911', '新疆', '喀什', '疏附', 'shufu');
INSERT INTO `w_weather_city` VALUES ('CN101130912', '新疆', '喀什', '疏勒', 'shule');
INSERT INTO `w_weather_city` VALUES ('CN101131001', '新疆', '伊犁', '伊宁', 'yining');
INSERT INTO `w_weather_city` VALUES ('CN101131002', '新疆', '伊犁', '察布查尔', 'chabuchaer');
INSERT INTO `w_weather_city` VALUES ('CN101131003', '新疆', '伊犁', '尼勒克', 'nileke');
INSERT INTO `w_weather_city` VALUES ('CN101131004', '新疆', '伊犁', '伊宁县', 'yiningxian');
INSERT INTO `w_weather_city` VALUES ('CN101131005', '新疆', '伊犁', '巩留', 'gongliu');
INSERT INTO `w_weather_city` VALUES ('CN101131006', '新疆', '伊犁', '新源', 'xinyuan');
INSERT INTO `w_weather_city` VALUES ('CN101131007', '新疆', '伊犁', '昭苏', 'zhaosu');
INSERT INTO `w_weather_city` VALUES ('CN101131008', '新疆', '伊犁', '特克斯', 'tekesi');
INSERT INTO `w_weather_city` VALUES ('CN101131009', '新疆', '伊犁', '霍城', 'huocheng');
INSERT INTO `w_weather_city` VALUES ('CN101131010', '新疆', '伊犁', '霍尔果斯', 'huoerguosi');
INSERT INTO `w_weather_city` VALUES ('CN101131011', '新疆', '伊犁', '奎屯', 'kuitunshi');
INSERT INTO `w_weather_city` VALUES ('CN101131101', '新疆', '塔城', '塔城', 'tacheng');
INSERT INTO `w_weather_city` VALUES ('CN101131102', '新疆', '塔城', '裕民', 'yumin');
INSERT INTO `w_weather_city` VALUES ('CN101131103', '新疆', '塔城', '额敏', 'emin');
INSERT INTO `w_weather_city` VALUES ('CN101131104', '新疆', '塔城', '和布克赛尔', 'hebukesaier');
INSERT INTO `w_weather_city` VALUES ('CN101131105', '新疆', '塔城', '托里', 'tuoli');
INSERT INTO `w_weather_city` VALUES ('CN101131106', '新疆', '塔城', '乌苏', 'wusu');
INSERT INTO `w_weather_city` VALUES ('CN101131107', '新疆', '塔城', '沙湾', 'shawan');
INSERT INTO `w_weather_city` VALUES ('CN101131201', '新疆', '哈密', '哈密', 'hami');
INSERT INTO `w_weather_city` VALUES ('CN101131203', '新疆', '哈密', '巴里坤', 'balikun');
INSERT INTO `w_weather_city` VALUES ('CN101131204', '新疆', '哈密', '伊吾', 'yiwu');
INSERT INTO `w_weather_city` VALUES ('CN101131301', '新疆', '和田', '和田', 'hetian');
INSERT INTO `w_weather_city` VALUES ('CN101131302', '新疆', '和田', '皮山', 'pishan');
INSERT INTO `w_weather_city` VALUES ('CN101131303', '新疆', '和田', '策勒', 'cele');
INSERT INTO `w_weather_city` VALUES ('CN101131304', '新疆', '和田', '墨玉', 'moyu');
INSERT INTO `w_weather_city` VALUES ('CN101131305', '新疆', '和田', '洛浦', 'luopu');
INSERT INTO `w_weather_city` VALUES ('CN101131306', '新疆', '和田', '民丰', 'minfeng');
INSERT INTO `w_weather_city` VALUES ('CN101131307', '新疆', '和田', '于田', 'yutian');
INSERT INTO `w_weather_city` VALUES ('CN101131401', '新疆', '阿勒泰', '阿勒泰', 'aletai');
INSERT INTO `w_weather_city` VALUES ('CN101131402', '新疆', '阿勒泰', '哈巴河', 'habahe');
INSERT INTO `w_weather_city` VALUES ('CN101131405', '新疆', '阿勒泰', '吉木乃', 'jimunai');
INSERT INTO `w_weather_city` VALUES ('CN101131406', '新疆', '阿勒泰', '布尔津', 'buerjin');
INSERT INTO `w_weather_city` VALUES ('CN101131407', '新疆', '阿勒泰', '福海', 'fuhai');
INSERT INTO `w_weather_city` VALUES ('CN101131408', '新疆', '阿勒泰', '富蕴', 'fuyun');
INSERT INTO `w_weather_city` VALUES ('CN101131409', '新疆', '阿勒泰', '青河', 'qinghe');
INSERT INTO `w_weather_city` VALUES ('CN101131501', '新疆', '克州', '阿图什', 'atushi');
INSERT INTO `w_weather_city` VALUES ('CN101131502', '新疆', '克州', '乌恰', 'wuqia');
INSERT INTO `w_weather_city` VALUES ('CN101131503', '新疆', '克州', '阿克陶', 'aketao');
INSERT INTO `w_weather_city` VALUES ('CN101131504', '新疆', '克州', '阿合奇', 'aheqi');
INSERT INTO `w_weather_city` VALUES ('CN101131601', '新疆', '博尔塔拉', '博乐', 'bole');
INSERT INTO `w_weather_city` VALUES ('CN101131602', '新疆', '博尔塔拉', '温泉', 'wenquan');
INSERT INTO `w_weather_city` VALUES ('CN101131603', '新疆', '博尔塔拉', '精河', 'jinghe');
INSERT INTO `w_weather_city` VALUES ('CN101131606', '新疆', '博尔塔拉', '阿拉山口', 'alashankou');
INSERT INTO `w_weather_city` VALUES ('CN101140101', '西藏', '拉萨', '拉萨', 'lasa');
INSERT INTO `w_weather_city` VALUES ('CN101140102', '西藏', '拉萨', '当雄', 'dangxiong');
INSERT INTO `w_weather_city` VALUES ('CN101140103', '西藏', '拉萨', '尼木', 'nimu');
INSERT INTO `w_weather_city` VALUES ('CN101140104', '西藏', '拉萨', '林周', 'linzhou');
INSERT INTO `w_weather_city` VALUES ('CN101140105', '西藏', '拉萨', '堆龙德庆', 'duilongdeqing');
INSERT INTO `w_weather_city` VALUES ('CN101140106', '西藏', '拉萨', '曲水', 'qushui');
INSERT INTO `w_weather_city` VALUES ('CN101140107', '西藏', '拉萨', '达孜', 'dazi');
INSERT INTO `w_weather_city` VALUES ('CN101140108', '西藏', '拉萨', '墨竹工卡', 'mozhugongka');
INSERT INTO `w_weather_city` VALUES ('CN101140201', '西藏', '日喀则', '日喀则', 'rikaze');
INSERT INTO `w_weather_city` VALUES ('CN101140202', '西藏', '日喀则', '拉孜', 'lazi');
INSERT INTO `w_weather_city` VALUES ('CN101140203', '西藏', '日喀则', '南木林', 'nanmulin');
INSERT INTO `w_weather_city` VALUES ('CN101140204', '西藏', '日喀则', '聂拉木', 'nielamu');
INSERT INTO `w_weather_city` VALUES ('CN101140205', '西藏', '日喀则', '定日', 'anri');
INSERT INTO `w_weather_city` VALUES ('CN101140206', '西藏', '日喀则', '江孜', 'jiangzi');
INSERT INTO `w_weather_city` VALUES ('CN101140207', '西藏', '日喀则', '帕里', 'pali');
INSERT INTO `w_weather_city` VALUES ('CN101140208', '西藏', '日喀则', '仲巴', 'zhongba');
INSERT INTO `w_weather_city` VALUES ('CN101140209', '西藏', '日喀则', '萨嘎', 'saga');
INSERT INTO `w_weather_city` VALUES ('CN101140210', '西藏', '日喀则', '吉隆', 'jilong');
INSERT INTO `w_weather_city` VALUES ('CN101140211', '西藏', '日喀则', '昂仁', 'angren');
INSERT INTO `w_weather_city` VALUES ('CN101140212', '西藏', '日喀则', '定结', 'dingjie');
INSERT INTO `w_weather_city` VALUES ('CN101140213', '西藏', '日喀则', '萨迦', 'sajia');
INSERT INTO `w_weather_city` VALUES ('CN101140214', '西藏', '日喀则', '谢通门', 'xietongmen');
INSERT INTO `w_weather_city` VALUES ('CN101140216', '西藏', '日喀则', '岗巴', 'gangba');
INSERT INTO `w_weather_city` VALUES ('CN101140217', '西藏', '日喀则', '白朗', 'bailang');
INSERT INTO `w_weather_city` VALUES ('CN101140218', '西藏', '日喀则', '亚东', 'yadong');
INSERT INTO `w_weather_city` VALUES ('CN101140219', '西藏', '日喀则', '康马', 'kangma');
INSERT INTO `w_weather_city` VALUES ('CN101140220', '西藏', '日喀则', '仁布', 'renbu');
INSERT INTO `w_weather_city` VALUES ('CN101140301', '西藏', '山南', '山南', 'shannan');
INSERT INTO `w_weather_city` VALUES ('CN101140302', '西藏', '山南', '贡嘎', 'gongga');
INSERT INTO `w_weather_city` VALUES ('CN101140303', '西藏', '山南', '札囊', 'zhanan');
INSERT INTO `w_weather_city` VALUES ('CN101140304', '西藏', '山南', '加查', 'jiacha');
INSERT INTO `w_weather_city` VALUES ('CN101140305', '西藏', '山南', '浪卡子', 'langkazi');
INSERT INTO `w_weather_city` VALUES ('CN101140306', '西藏', '山南', '错那', 'cuona');
INSERT INTO `w_weather_city` VALUES ('CN101140307', '西藏', '山南', '隆子', 'longzi');
INSERT INTO `w_weather_city` VALUES ('CN101140308', '西藏', '山南', '泽当', 'zedang');
INSERT INTO `w_weather_city` VALUES ('CN101140309', '西藏', '山南', '乃东', 'naidong');
INSERT INTO `w_weather_city` VALUES ('CN101140310', '西藏', '山南', '桑日', 'sangri');
INSERT INTO `w_weather_city` VALUES ('CN101140311', '西藏', '山南', '洛扎', 'luozha');
INSERT INTO `w_weather_city` VALUES ('CN101140312', '西藏', '山南', '措美', 'cuomei');
INSERT INTO `w_weather_city` VALUES ('CN101140313', '西藏', '山南', '琼结', 'qiongjie');
INSERT INTO `w_weather_city` VALUES ('CN101140314', '西藏', '山南', '曲松', 'qusong');
INSERT INTO `w_weather_city` VALUES ('CN101140401', '西藏', '林芝', '林芝', 'linzhi');
INSERT INTO `w_weather_city` VALUES ('CN101140402', '西藏', '林芝', '波密', 'bomi');
INSERT INTO `w_weather_city` VALUES ('CN101140403', '西藏', '林芝', '米林', 'milin');
INSERT INTO `w_weather_city` VALUES ('CN101140404', '西藏', '林芝', '察隅', 'chayu');
INSERT INTO `w_weather_city` VALUES ('CN101140405', '西藏', '林芝', '工布江达', 'gongbujiangda');
INSERT INTO `w_weather_city` VALUES ('CN101140406', '西藏', '林芝', '朗县', 'langxian');
INSERT INTO `w_weather_city` VALUES ('CN101140407', '西藏', '林芝', '墨脱', 'motuo');
INSERT INTO `w_weather_city` VALUES ('CN101140501', '西藏', '昌都', '昌都', 'changdu');
INSERT INTO `w_weather_city` VALUES ('CN101140502', '西藏', '昌都', '丁青', 'dingqing');
INSERT INTO `w_weather_city` VALUES ('CN101140503', '西藏', '昌都', '边坝', 'bianba');
INSERT INTO `w_weather_city` VALUES ('CN101140504', '西藏', '昌都', '洛隆', 'luolong');
INSERT INTO `w_weather_city` VALUES ('CN101140505', '西藏', '昌都', '左贡', 'zuogong');
INSERT INTO `w_weather_city` VALUES ('CN101140506', '西藏', '昌都', '芒康', 'mangkang');
INSERT INTO `w_weather_city` VALUES ('CN101140507', '西藏', '昌都', '类乌齐', 'leiwuqi');
INSERT INTO `w_weather_city` VALUES ('CN101140508', '西藏', '昌都', '八宿', 'basu');
INSERT INTO `w_weather_city` VALUES ('CN101140509', '西藏', '昌都', '江达', 'jiangda');
INSERT INTO `w_weather_city` VALUES ('CN101140510', '西藏', '昌都', '察雅', 'chaya');
INSERT INTO `w_weather_city` VALUES ('CN101140511', '西藏', '昌都', '贡觉', 'gongjue');
INSERT INTO `w_weather_city` VALUES ('CN101140601', '西藏', '那曲', '那曲', 'naqu');
INSERT INTO `w_weather_city` VALUES ('CN101140602', '西藏', '那曲', '尼玛', 'nima');
INSERT INTO `w_weather_city` VALUES ('CN101140603', '西藏', '那曲', '嘉黎', 'jiali');
INSERT INTO `w_weather_city` VALUES ('CN101140604', '西藏', '那曲', '班戈', 'bange');
INSERT INTO `w_weather_city` VALUES ('CN101140605', '西藏', '那曲', '安多', 'anduo');
INSERT INTO `w_weather_city` VALUES ('CN101140606', '西藏', '那曲', '索县', 'suoxian');
INSERT INTO `w_weather_city` VALUES ('CN101140607', '西藏', '那曲', '聂荣', 'nierong');
INSERT INTO `w_weather_city` VALUES ('CN101140608', '西藏', '那曲', '巴青', 'baqing');
INSERT INTO `w_weather_city` VALUES ('CN101140609', '西藏', '那曲', '比如', 'biru');
INSERT INTO `w_weather_city` VALUES ('CN101140610', '西藏', '那曲', '双湖', 'shuanghu');
INSERT INTO `w_weather_city` VALUES ('CN101140701', '西藏', '阿里', '阿里', 'ali');
INSERT INTO `w_weather_city` VALUES ('CN101140702', '西藏', '阿里', '改则', 'gaize');
INSERT INTO `w_weather_city` VALUES ('CN101140703', '西藏', '阿里', '申扎', 'shenzha');
INSERT INTO `w_weather_city` VALUES ('CN101140704', '西藏', '阿里', '狮泉河', 'shiquanhe');
INSERT INTO `w_weather_city` VALUES ('CN101140705', '西藏', '阿里', '普兰', 'pulan');
INSERT INTO `w_weather_city` VALUES ('CN101140706', '西藏', '阿里', '札达', 'zhada');
INSERT INTO `w_weather_city` VALUES ('CN101140707', '西藏', '阿里', '噶尔', 'gaer');
INSERT INTO `w_weather_city` VALUES ('CN101140708', '西藏', '阿里', '日土', 'ritu');
INSERT INTO `w_weather_city` VALUES ('CN101140709', '西藏', '阿里', '革吉', 'geji');
INSERT INTO `w_weather_city` VALUES ('CN101140710', '西藏', '阿里', '措勤', 'cuoqin');
INSERT INTO `w_weather_city` VALUES ('CN101150101', '青海', '西宁', '西宁', 'xining');
INSERT INTO `w_weather_city` VALUES ('CN101150102', '青海', '西宁', '大通', 'datong');
INSERT INTO `w_weather_city` VALUES ('CN101150103', '青海', '西宁', '湟源', 'huangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101150104', '青海', '西宁', '湟中', 'huangzhong');
INSERT INTO `w_weather_city` VALUES ('CN101150201', '青海', '海东', '海东', 'haidong');
INSERT INTO `w_weather_city` VALUES ('CN101150202', '青海', '海东', '乐都', 'ledu');
INSERT INTO `w_weather_city` VALUES ('CN101150203', '青海', '海东', '民和', 'minhe');
INSERT INTO `w_weather_city` VALUES ('CN101150204', '青海', '海东', '互助', 'huzhu');
INSERT INTO `w_weather_city` VALUES ('CN101150205', '青海', '海东', '化隆', 'hualong');
INSERT INTO `w_weather_city` VALUES ('CN101150206', '青海', '海东', '循化', 'xunhua');
INSERT INTO `w_weather_city` VALUES ('CN101150207', '青海', '海东', '冷湖', 'lenghu');
INSERT INTO `w_weather_city` VALUES ('CN101150208', '青海', '海东', '平安', 'pingan');
INSERT INTO `w_weather_city` VALUES ('CN101150301', '青海', '黄南', '黄南', 'huangnan');
INSERT INTO `w_weather_city` VALUES ('CN101150302', '青海', '黄南', '尖扎', 'jianzha');
INSERT INTO `w_weather_city` VALUES ('CN101150303', '青海', '黄南', '泽库', 'zeku');
INSERT INTO `w_weather_city` VALUES ('CN101150304', '青海', '黄南', '河南', 'henan');
INSERT INTO `w_weather_city` VALUES ('CN101150305', '青海', '黄南', '同仁', 'tongren');
INSERT INTO `w_weather_city` VALUES ('CN101150401', '青海', '海南', '海南', 'hainan');
INSERT INTO `w_weather_city` VALUES ('CN101150404', '青海', '海南', '贵德', 'guide');
INSERT INTO `w_weather_city` VALUES ('CN101150406', '青海', '海南', '兴海', 'xinghai');
INSERT INTO `w_weather_city` VALUES ('CN101150407', '青海', '海南', '贵南', 'guinan');
INSERT INTO `w_weather_city` VALUES ('CN101150408', '青海', '海南', '同德', 'tongde');
INSERT INTO `w_weather_city` VALUES ('CN101150409', '青海', '海南', '共和', 'gonghe');
INSERT INTO `w_weather_city` VALUES ('CN101150501', '青海', '果洛', '果洛', 'guoluo');
INSERT INTO `w_weather_city` VALUES ('CN101150502', '青海', '果洛', '班玛', 'banma');
INSERT INTO `w_weather_city` VALUES ('CN101150503', '青海', '果洛', '甘德', 'gande');
INSERT INTO `w_weather_city` VALUES ('CN101150504', '青海', '果洛', '达日', 'dari');
INSERT INTO `w_weather_city` VALUES ('CN101150505', '青海', '果洛', '久治', 'jiuzhi');
INSERT INTO `w_weather_city` VALUES ('CN101150506', '青海', '果洛', '玛多', 'madu');
INSERT INTO `w_weather_city` VALUES ('CN101150508', '青海', '果洛', '玛沁', 'maqin');
INSERT INTO `w_weather_city` VALUES ('CN101150601', '青海', '玉树', '玉树', 'yushu');
INSERT INTO `w_weather_city` VALUES ('CN101150602', '青海', '玉树', '称多', 'chenduo');
INSERT INTO `w_weather_city` VALUES ('CN101150603', '青海', '玉树', '治多', 'zhiduo');
INSERT INTO `w_weather_city` VALUES ('CN101150604', '青海', '玉树', '杂多', 'zaduo');
INSERT INTO `w_weather_city` VALUES ('CN101150605', '青海', '玉树', '囊谦', 'nangqian');
INSERT INTO `w_weather_city` VALUES ('CN101150606', '青海', '玉树', '曲麻莱', 'qumacai');
INSERT INTO `w_weather_city` VALUES ('CN101150701', '青海', '海西', '海西', 'haixi');
INSERT INTO `w_weather_city` VALUES ('CN101150708', '青海', '海西', '天峻', 'tianjun');
INSERT INTO `w_weather_city` VALUES ('CN101150709', '青海', '海西', '乌兰', 'wulan');
INSERT INTO `w_weather_city` VALUES ('CN101150712', '青海', '海西', '茫崖', 'mangai');
INSERT INTO `w_weather_city` VALUES ('CN101150713', '青海', '海西', '大柴旦', 'dachaidan');
INSERT INTO `w_weather_city` VALUES ('CN101150716', '青海', '海西', '德令哈', 'delingha');
INSERT INTO `w_weather_city` VALUES ('CN101150801', '青海', '海北', '海北', 'haibei');
INSERT INTO `w_weather_city` VALUES ('CN101150802', '青海', '海北', '门源', 'menyuan');
INSERT INTO `w_weather_city` VALUES ('CN101150803', '青海', '海北', '祁连', 'qilian');
INSERT INTO `w_weather_city` VALUES ('CN101150804', '青海', '海北', '海晏', 'haiman');
INSERT INTO `w_weather_city` VALUES ('CN101150806', '青海', '海北', '刚察', 'gangcha');
INSERT INTO `w_weather_city` VALUES ('CN101150901', '青海', '格尔木', '格尔木', 'geermu');
INSERT INTO `w_weather_city` VALUES ('CN101150902', '青海', '格尔木', '都兰', 'dulan');
INSERT INTO `w_weather_city` VALUES ('CN101160101', '甘肃', '兰州', '兰州', 'lanzhou');
INSERT INTO `w_weather_city` VALUES ('CN101160102', '甘肃', '兰州', '皋兰', 'gaolan');
INSERT INTO `w_weather_city` VALUES ('CN101160103', '甘肃', '兰州', '永登', 'yongdeng');
INSERT INTO `w_weather_city` VALUES ('CN101160104', '甘肃', '兰州', '榆中', 'yuzhong');
INSERT INTO `w_weather_city` VALUES ('CN101160201', '甘肃', '定西', '定西', 'dingxi');
INSERT INTO `w_weather_city` VALUES ('CN101160202', '甘肃', '定西', '通渭', 'tongwei');
INSERT INTO `w_weather_city` VALUES ('CN101160203', '甘肃', '定西', '陇西', 'longxi');
INSERT INTO `w_weather_city` VALUES ('CN101160204', '甘肃', '定西', '渭源', 'weiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101160205', '甘肃', '定西', '临洮', 'lintao');
INSERT INTO `w_weather_city` VALUES ('CN101160206', '甘肃', '定西', '漳县', 'zhangxian');
INSERT INTO `w_weather_city` VALUES ('CN101160207', '甘肃', '定西', '岷县', 'minxian');
INSERT INTO `w_weather_city` VALUES ('CN101160208', '甘肃', '定西', '安定', 'anding');
INSERT INTO `w_weather_city` VALUES ('CN101160301', '甘肃', '平凉', '平凉', 'pingliang');
INSERT INTO `w_weather_city` VALUES ('CN101160302', '甘肃', '平凉', '泾川', 'jingchuan');
INSERT INTO `w_weather_city` VALUES ('CN101160303', '甘肃', '平凉', '灵台', 'lingtai');
INSERT INTO `w_weather_city` VALUES ('CN101160304', '甘肃', '平凉', '崇信', 'chongxin');
INSERT INTO `w_weather_city` VALUES ('CN101160305', '甘肃', '平凉', '华亭', 'huating');
INSERT INTO `w_weather_city` VALUES ('CN101160306', '甘肃', '平凉', '庄浪', 'zhuanglang');
INSERT INTO `w_weather_city` VALUES ('CN101160307', '甘肃', '平凉', '静宁', 'jingning');
INSERT INTO `w_weather_city` VALUES ('CN101160308', '甘肃', '平凉', '崆峒', 'kongtong');
INSERT INTO `w_weather_city` VALUES ('CN101160401', '甘肃', '庆阳', '庆阳', 'qingyang');
INSERT INTO `w_weather_city` VALUES ('CN101160403', '甘肃', '庆阳', '环县', 'huanxian');
INSERT INTO `w_weather_city` VALUES ('CN101160404', '甘肃', '庆阳', '华池', 'huachi');
INSERT INTO `w_weather_city` VALUES ('CN101160405', '甘肃', '庆阳', '合水', 'heshui');
INSERT INTO `w_weather_city` VALUES ('CN101160406', '甘肃', '庆阳', '正宁', 'zhengning');
INSERT INTO `w_weather_city` VALUES ('CN101160407', '甘肃', '庆阳', '宁县', 'ningxian');
INSERT INTO `w_weather_city` VALUES ('CN101160408', '甘肃', '庆阳', '镇原', 'zhenyuan');
INSERT INTO `w_weather_city` VALUES ('CN101160409', '甘肃', '庆阳', '庆城', 'qingcheng');
INSERT INTO `w_weather_city` VALUES ('CN101160501', '甘肃', '武威', '武威', 'wuwei');
INSERT INTO `w_weather_city` VALUES ('CN101160502', '甘肃', '武威', '民勤', 'minqin');
INSERT INTO `w_weather_city` VALUES ('CN101160503', '甘肃', '武威', '古浪', 'gulang');
INSERT INTO `w_weather_city` VALUES ('CN101160505', '甘肃', '武威', '天祝', 'tianzhu');
INSERT INTO `w_weather_city` VALUES ('CN101160601', '甘肃', '金昌', '金昌', 'jinchang');
INSERT INTO `w_weather_city` VALUES ('CN101160602', '甘肃', '金昌', '永昌', 'yongchang');
INSERT INTO `w_weather_city` VALUES ('CN101160701', '甘肃', '张掖', '张掖', 'zhangye');
INSERT INTO `w_weather_city` VALUES ('CN101160702', '甘肃', '张掖', '肃南', 'sunan');
INSERT INTO `w_weather_city` VALUES ('CN101160703', '甘肃', '张掖', '民乐', 'minle');
INSERT INTO `w_weather_city` VALUES ('CN101160704', '甘肃', '张掖', '临泽', 'linze');
INSERT INTO `w_weather_city` VALUES ('CN101160705', '甘肃', '张掖', '高台', 'gaotai');
INSERT INTO `w_weather_city` VALUES ('CN101160706', '甘肃', '张掖', '山丹', 'shandan');
INSERT INTO `w_weather_city` VALUES ('CN101160801', '甘肃', '酒泉', '酒泉', 'jiuquan');
INSERT INTO `w_weather_city` VALUES ('CN101160803', '甘肃', '酒泉', '金塔', 'jinta');
INSERT INTO `w_weather_city` VALUES ('CN101160804', '甘肃', '酒泉', '阿克塞', 'akesai');
INSERT INTO `w_weather_city` VALUES ('CN101160805', '甘肃', '酒泉', '瓜州', 'guazhou');
INSERT INTO `w_weather_city` VALUES ('CN101160806', '甘肃', '酒泉', '肃北', 'subei');
INSERT INTO `w_weather_city` VALUES ('CN101160807', '甘肃', '酒泉', '玉门', 'yumen');
INSERT INTO `w_weather_city` VALUES ('CN101160808', '甘肃', '酒泉', '敦煌', 'dunhuang');
INSERT INTO `w_weather_city` VALUES ('CN101160901', '甘肃', '天水', '天水', 'tianshui');
INSERT INTO `w_weather_city` VALUES ('CN101160903', '甘肃', '天水', '清水', 'qingshui');
INSERT INTO `w_weather_city` VALUES ('CN101160904', '甘肃', '天水', '秦安', 'qinan');
INSERT INTO `w_weather_city` VALUES ('CN101160905', '甘肃', '天水', '甘谷', 'gangu');
INSERT INTO `w_weather_city` VALUES ('CN101160906', '甘肃', '天水', '武山', 'wushan');
INSERT INTO `w_weather_city` VALUES ('CN101160907', '甘肃', '天水', '张家川', 'zhangjiachuan');
INSERT INTO `w_weather_city` VALUES ('CN101160908', '甘肃', '天水', '麦积', 'maiji');
INSERT INTO `w_weather_city` VALUES ('CN101161001', '甘肃', '陇南', '武都', 'wudu');
INSERT INTO `w_weather_city` VALUES ('CN101161002', '甘肃', '陇南', '成县', 'chengxian');
INSERT INTO `w_weather_city` VALUES ('CN101161003', '甘肃', '陇南', '文县', 'wenxian');
INSERT INTO `w_weather_city` VALUES ('CN101161004', '甘肃', '陇南', '宕昌', 'dangchang');
INSERT INTO `w_weather_city` VALUES ('CN101161005', '甘肃', '陇南', '康县', 'kangxian');
INSERT INTO `w_weather_city` VALUES ('CN101161006', '甘肃', '陇南', '西和', 'xihe');
INSERT INTO `w_weather_city` VALUES ('CN101161007', '甘肃', '陇南', '礼县', 'lixian');
INSERT INTO `w_weather_city` VALUES ('CN101161008', '甘肃', '陇南', '徽县', 'huixian');
INSERT INTO `w_weather_city` VALUES ('CN101161009', '甘肃', '陇南', '两当', 'liangdang');
INSERT INTO `w_weather_city` VALUES ('CN101161101', '甘肃', '临夏', '临夏', 'linxia');
INSERT INTO `w_weather_city` VALUES ('CN101161102', '甘肃', '临夏', '康乐', 'kangle');
INSERT INTO `w_weather_city` VALUES ('CN101161103', '甘肃', '临夏', '永靖', 'yongjing');
INSERT INTO `w_weather_city` VALUES ('CN101161104', '甘肃', '临夏', '广河', 'guanghe');
INSERT INTO `w_weather_city` VALUES ('CN101161105', '甘肃', '临夏', '和政', 'hezheng');
INSERT INTO `w_weather_city` VALUES ('CN101161106', '甘肃', '临夏', '东乡', 'dongxiang');
INSERT INTO `w_weather_city` VALUES ('CN101161107', '甘肃', '临夏', '积石山', 'jishishan');
INSERT INTO `w_weather_city` VALUES ('CN101161201', '甘肃', '甘南', '合作', 'hezuo');
INSERT INTO `w_weather_city` VALUES ('CN101161202', '甘肃', '甘南', '临潭', 'lintan');
INSERT INTO `w_weather_city` VALUES ('CN101161203', '甘肃', '甘南', '卓尼', 'zhuoni');
INSERT INTO `w_weather_city` VALUES ('CN101161204', '甘肃', '甘南', '舟曲', 'zhouqu');
INSERT INTO `w_weather_city` VALUES ('CN101161205', '甘肃', '甘南', '迭部', 'diebu');
INSERT INTO `w_weather_city` VALUES ('CN101161206', '甘肃', '甘南', '玛曲', 'maqu');
INSERT INTO `w_weather_city` VALUES ('CN101161207', '甘肃', '甘南', '碌曲', 'luqu');
INSERT INTO `w_weather_city` VALUES ('CN101161208', '甘肃', '甘南', '夏河', 'xiahe');
INSERT INTO `w_weather_city` VALUES ('CN101161301', '甘肃', '白银', '白银', 'baiyin');
INSERT INTO `w_weather_city` VALUES ('CN101161302', '甘肃', '白银', '靖远', 'jingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101161303', '甘肃', '白银', '会宁', 'huining');
INSERT INTO `w_weather_city` VALUES ('CN101161304', '甘肃', '白银', '平川', 'pingchuan');
INSERT INTO `w_weather_city` VALUES ('CN101161305', '甘肃', '白银', '景泰', 'jingtai');
INSERT INTO `w_weather_city` VALUES ('CN101161401', '甘肃', '嘉峪关', '嘉峪关', 'jiayuguan');
INSERT INTO `w_weather_city` VALUES ('CN101170101', '宁夏', '银川', '银川', 'yinchuan');
INSERT INTO `w_weather_city` VALUES ('CN101170102', '宁夏', '银川', '永宁', 'yongning');
INSERT INTO `w_weather_city` VALUES ('CN101170103', '宁夏', '银川', '灵武', 'lingwu');
INSERT INTO `w_weather_city` VALUES ('CN101170104', '宁夏', '银川', '贺兰', 'helan');
INSERT INTO `w_weather_city` VALUES ('CN101170201', '宁夏', '石嘴山', '石嘴山', 'shizuishan');
INSERT INTO `w_weather_city` VALUES ('CN101170202', '宁夏', '石嘴山', '惠农', 'huinong');
INSERT INTO `w_weather_city` VALUES ('CN101170203', '宁夏', '石嘴山', '平罗', 'pingluo');
INSERT INTO `w_weather_city` VALUES ('CN101170204', '宁夏', '石嘴山', '陶乐', 'taole');
INSERT INTO `w_weather_city` VALUES ('CN101170301', '宁夏', '吴忠', '吴忠', 'wuzhong');
INSERT INTO `w_weather_city` VALUES ('CN101170302', '宁夏', '吴忠', '同心', 'tongxin');
INSERT INTO `w_weather_city` VALUES ('CN101170303', '宁夏', '吴忠', '盐池', 'yanchi');
INSERT INTO `w_weather_city` VALUES ('CN101170306', '宁夏', '吴忠', '青铜峡', 'qingtongxia');
INSERT INTO `w_weather_city` VALUES ('CN101170401', '宁夏', '固原', '固原', 'guyuan');
INSERT INTO `w_weather_city` VALUES ('CN101170402', '宁夏', '固原', '西吉', 'xiji');
INSERT INTO `w_weather_city` VALUES ('CN101170403', '宁夏', '固原', '隆德', 'longde');
INSERT INTO `w_weather_city` VALUES ('CN101170404', '宁夏', '固原', '泾源', 'jinyuan');
INSERT INTO `w_weather_city` VALUES ('CN101170406', '宁夏', '固原', '彭阳', 'pengyang');
INSERT INTO `w_weather_city` VALUES ('CN101170501', '宁夏', '中卫', '中卫', 'zhongwei');
INSERT INTO `w_weather_city` VALUES ('CN101170502', '宁夏', '中卫', '中宁', 'zhongning');
INSERT INTO `w_weather_city` VALUES ('CN101170504', '宁夏', '中卫', '海原', 'haiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101180101', '河南', '郑州', '郑州', 'zhengzhou');
INSERT INTO `w_weather_city` VALUES ('CN101180102', '河南', '郑州', '巩义', 'gongyi');
INSERT INTO `w_weather_city` VALUES ('CN101180103', '河南', '郑州', '荥阳', 'xingyang');
INSERT INTO `w_weather_city` VALUES ('CN101180104', '河南', '郑州', '登封', 'dengfeng');
INSERT INTO `w_weather_city` VALUES ('CN101180105', '河南', '郑州', '新密', 'xinmi');
INSERT INTO `w_weather_city` VALUES ('CN101180106', '河南', '郑州', '新郑', 'xinzheng');
INSERT INTO `w_weather_city` VALUES ('CN101180107', '河南', '郑州', '中牟', 'zhongmou');
INSERT INTO `w_weather_city` VALUES ('CN101180108', '河南', '郑州', '上街', 'shangjie');
INSERT INTO `w_weather_city` VALUES ('CN101180201', '河南', '安阳', '安阳', 'anyang');
INSERT INTO `w_weather_city` VALUES ('CN101180202', '河南', '安阳', '汤阴', 'tangyin');
INSERT INTO `w_weather_city` VALUES ('CN101180203', '河南', '安阳', '滑县', 'huaxian');
INSERT INTO `w_weather_city` VALUES ('CN101180204', '河南', '安阳', '内黄', 'neihuang');
INSERT INTO `w_weather_city` VALUES ('CN101180205', '河南', '安阳', '林州', 'linzhou');
INSERT INTO `w_weather_city` VALUES ('CN101180301', '河南', '新乡', '新乡', 'xinxiang');
INSERT INTO `w_weather_city` VALUES ('CN101180302', '河南', '新乡', '获嘉', 'huojia');
INSERT INTO `w_weather_city` VALUES ('CN101180303', '河南', '新乡', '原阳', 'yuanyang');
INSERT INTO `w_weather_city` VALUES ('CN101180304', '河南', '新乡', '辉县', 'huixian');
INSERT INTO `w_weather_city` VALUES ('CN101180305', '河南', '新乡', '卫辉', 'weihui');
INSERT INTO `w_weather_city` VALUES ('CN101180306', '河南', '新乡', '延津', 'yanjin');
INSERT INTO `w_weather_city` VALUES ('CN101180307', '河南', '新乡', '封丘', 'fengqiu');
INSERT INTO `w_weather_city` VALUES ('CN101180308', '河南', '新乡', '长垣', 'changyuan');
INSERT INTO `w_weather_city` VALUES ('CN101180401', '河南', '许昌', '许昌', 'xuchang');
INSERT INTO `w_weather_city` VALUES ('CN101180402', '河南', '许昌', '鄢陵', 'yanling');
INSERT INTO `w_weather_city` VALUES ('CN101180403', '河南', '许昌', '襄城', 'xiangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101180404', '河南', '许昌', '长葛', 'changge');
INSERT INTO `w_weather_city` VALUES ('CN101180405', '河南', '许昌', '禹州', 'yuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101180501', '河南', '平顶山', '平顶山', 'pingdingshan');
INSERT INTO `w_weather_city` VALUES ('CN101180502', '河南', '平顶山', '郏县', 'jiaxian');
INSERT INTO `w_weather_city` VALUES ('CN101180503', '河南', '平顶山', '宝丰', 'baofeng');
INSERT INTO `w_weather_city` VALUES ('CN101180504', '河南', '平顶山', '汝州', 'ruzhou');
INSERT INTO `w_weather_city` VALUES ('CN101180505', '河南', '平顶山', '叶县', 'yexian');
INSERT INTO `w_weather_city` VALUES ('CN101180506', '河南', '平顶山', '舞钢', 'wugang');
INSERT INTO `w_weather_city` VALUES ('CN101180507', '河南', '平顶山', '鲁山', 'lushan');
INSERT INTO `w_weather_city` VALUES ('CN101180508', '河南', '平顶山', '石龙', 'shilong');
INSERT INTO `w_weather_city` VALUES ('CN101180601', '河南', '信阳', '信阳', 'xinyang');
INSERT INTO `w_weather_city` VALUES ('CN101180602', '河南', '信阳', '息县', 'xixian');
INSERT INTO `w_weather_city` VALUES ('CN101180603', '河南', '信阳', '罗山', 'luoshan');
INSERT INTO `w_weather_city` VALUES ('CN101180604', '河南', '信阳', '光山', 'guangshan');
INSERT INTO `w_weather_city` VALUES ('CN101180605', '河南', '信阳', '新县', 'xinxian');
INSERT INTO `w_weather_city` VALUES ('CN101180606', '河南', '信阳', '淮滨', 'huaibin');
INSERT INTO `w_weather_city` VALUES ('CN101180607', '河南', '信阳', '潢川', 'huangchuan');
INSERT INTO `w_weather_city` VALUES ('CN101180608', '河南', '信阳', '固始', 'gushi');
INSERT INTO `w_weather_city` VALUES ('CN101180609', '河南', '信阳', '商城', 'shangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101180701', '河南', '南阳', '南阳', 'nanyang');
INSERT INTO `w_weather_city` VALUES ('CN101180702', '河南', '南阳', '南召', 'nanzhao');
INSERT INTO `w_weather_city` VALUES ('CN101180703', '河南', '南阳', '方城', 'fangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101180704', '河南', '南阳', '社旗', 'sheqi');
INSERT INTO `w_weather_city` VALUES ('CN101180705', '河南', '南阳', '西峡', 'xixia');
INSERT INTO `w_weather_city` VALUES ('CN101180706', '河南', '南阳', '内乡', 'neixiang');
INSERT INTO `w_weather_city` VALUES ('CN101180707', '河南', '南阳', '镇平', 'zhenping');
INSERT INTO `w_weather_city` VALUES ('CN101180708', '河南', '南阳', '淅川', 'xichuan');
INSERT INTO `w_weather_city` VALUES ('CN101180709', '河南', '南阳', '新野', 'xinye');
INSERT INTO `w_weather_city` VALUES ('CN101180710', '河南', '南阳', '唐河', 'tanghe');
INSERT INTO `w_weather_city` VALUES ('CN101180711', '河南', '南阳', '邓州', 'dengzhou');
INSERT INTO `w_weather_city` VALUES ('CN101180712', '河南', '南阳', '桐柏', 'tongbai');
INSERT INTO `w_weather_city` VALUES ('CN101180801', '河南', '开封', '开封', 'kaifeng');
INSERT INTO `w_weather_city` VALUES ('CN101180802', '河南', '开封', '杞县', 'qixian');
INSERT INTO `w_weather_city` VALUES ('CN101180803', '河南', '开封', '尉氏', 'weishi');
INSERT INTO `w_weather_city` VALUES ('CN101180804', '河南', '开封', '通许', 'tongxu');
INSERT INTO `w_weather_city` VALUES ('CN101180805', '河南', '开封', '兰考', 'lankao');
INSERT INTO `w_weather_city` VALUES ('CN101180901', '河南', '洛阳', '洛阳', 'luoyang');
INSERT INTO `w_weather_city` VALUES ('CN101180902', '河南', '洛阳', '新安', 'xinan');
INSERT INTO `w_weather_city` VALUES ('CN101180903', '河南', '洛阳', '孟津', 'mengjin');
INSERT INTO `w_weather_city` VALUES ('CN101180904', '河南', '洛阳', '宜阳', 'yiyang');
INSERT INTO `w_weather_city` VALUES ('CN101180905', '河南', '洛阳', '洛宁', 'luoning');
INSERT INTO `w_weather_city` VALUES ('CN101180906', '河南', '洛阳', '伊川', 'yichuan');
INSERT INTO `w_weather_city` VALUES ('CN101180907', '河南', '洛阳', '嵩县', 'songxian');
INSERT INTO `w_weather_city` VALUES ('CN101180908', '河南', '洛阳', '偃师', 'yanshi');
INSERT INTO `w_weather_city` VALUES ('CN101180909', '河南', '洛阳', '栾川', 'luanchuan');
INSERT INTO `w_weather_city` VALUES ('CN101180910', '河南', '洛阳', '汝阳', 'ruyang');
INSERT INTO `w_weather_city` VALUES ('CN101180911', '河南', '洛阳', '吉利', 'jili');
INSERT INTO `w_weather_city` VALUES ('CN101181001', '河南', '商丘', '商丘', 'shangqiu');
INSERT INTO `w_weather_city` VALUES ('CN101181003', '河南', '商丘', '睢县', 'suixian');
INSERT INTO `w_weather_city` VALUES ('CN101181004', '河南', '商丘', '民权', 'minquan');
INSERT INTO `w_weather_city` VALUES ('CN101181005', '河南', '商丘', '虞城', 'yucheng');
INSERT INTO `w_weather_city` VALUES ('CN101181006', '河南', '商丘', '柘城', 'zhecheng');
INSERT INTO `w_weather_city` VALUES ('CN101181007', '河南', '商丘', '宁陵', 'ningling');
INSERT INTO `w_weather_city` VALUES ('CN101181008', '河南', '商丘', '夏邑', 'xiayi');
INSERT INTO `w_weather_city` VALUES ('CN101181009', '河南', '商丘', '永城', 'yongcheng');
INSERT INTO `w_weather_city` VALUES ('CN101181101', '河南', '焦作', '焦作', 'jiaozuo');
INSERT INTO `w_weather_city` VALUES ('CN101181102', '河南', '焦作', '修武', 'xiuwu');
INSERT INTO `w_weather_city` VALUES ('CN101181103', '河南', '焦作', '武陟', 'wuzhi');
INSERT INTO `w_weather_city` VALUES ('CN101181104', '河南', '焦作', '沁阳', 'qinyang');
INSERT INTO `w_weather_city` VALUES ('CN101181106', '河南', '焦作', '博爱', 'boai');
INSERT INTO `w_weather_city` VALUES ('CN101181107', '河南', '焦作', '温县', 'wenxian');
INSERT INTO `w_weather_city` VALUES ('CN101181108', '河南', '焦作', '孟州', 'mengzhou');
INSERT INTO `w_weather_city` VALUES ('CN101181201', '河南', '鹤壁', '鹤壁', 'hebi');
INSERT INTO `w_weather_city` VALUES ('CN101181202', '河南', '鹤壁', '浚县', 'xunxian');
INSERT INTO `w_weather_city` VALUES ('CN101181203', '河南', '鹤壁', '淇县', 'qixian');
INSERT INTO `w_weather_city` VALUES ('CN101181301', '河南', '濮阳', '濮阳', 'puyang');
INSERT INTO `w_weather_city` VALUES ('CN101181302', '河南', '濮阳', '台前', 'taiqian');
INSERT INTO `w_weather_city` VALUES ('CN101181303', '河南', '濮阳', '南乐', 'nanle');
INSERT INTO `w_weather_city` VALUES ('CN101181304', '河南', '濮阳', '清丰', 'qingfeng');
INSERT INTO `w_weather_city` VALUES ('CN101181305', '河南', '濮阳', '范县', 'fanxian');
INSERT INTO `w_weather_city` VALUES ('CN101181401', '河南', '周口', '周口', 'zhoukou');
INSERT INTO `w_weather_city` VALUES ('CN101181402', '河南', '周口', '扶沟', 'fugou');
INSERT INTO `w_weather_city` VALUES ('CN101181403', '河南', '周口', '太康', 'taikang');
INSERT INTO `w_weather_city` VALUES ('CN101181404', '河南', '周口', '淮阳', 'huaiyang');
INSERT INTO `w_weather_city` VALUES ('CN101181405', '河南', '周口', '西华', 'xihua');
INSERT INTO `w_weather_city` VALUES ('CN101181406', '河南', '周口', '商水', 'shangshui');
INSERT INTO `w_weather_city` VALUES ('CN101181407', '河南', '周口', '项城', 'xiangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101181408', '河南', '周口', '郸城', 'dancheng');
INSERT INTO `w_weather_city` VALUES ('CN101181409', '河南', '周口', '鹿邑', 'luyi');
INSERT INTO `w_weather_city` VALUES ('CN101181410', '河南', '周口', '沈丘', 'shenqiu');
INSERT INTO `w_weather_city` VALUES ('CN101181501', '河南', '漯河', '漯河', 'luohe');
INSERT INTO `w_weather_city` VALUES ('CN101181502', '河南', '漯河', '临颍', 'linying');
INSERT INTO `w_weather_city` VALUES ('CN101181503', '河南', '漯河', '舞阳', 'wuyang');
INSERT INTO `w_weather_city` VALUES ('CN101181601', '河南', '驻马店', '驻马店', 'zhumadian');
INSERT INTO `w_weather_city` VALUES ('CN101181602', '河南', '驻马店', '西平', 'xiping');
INSERT INTO `w_weather_city` VALUES ('CN101181603', '河南', '驻马店', '遂平', 'suiping');
INSERT INTO `w_weather_city` VALUES ('CN101181604', '河南', '驻马店', '上蔡', 'shangcai');
INSERT INTO `w_weather_city` VALUES ('CN101181605', '河南', '驻马店', '汝南', 'runan');
INSERT INTO `w_weather_city` VALUES ('CN101181606', '河南', '驻马店', '泌阳', 'biyang');
INSERT INTO `w_weather_city` VALUES ('CN101181607', '河南', '驻马店', '平舆', 'pingyu');
INSERT INTO `w_weather_city` VALUES ('CN101181608', '河南', '驻马店', '新蔡', 'xincai');
INSERT INTO `w_weather_city` VALUES ('CN101181609', '河南', '驻马店', '确山', 'queshan');
INSERT INTO `w_weather_city` VALUES ('CN101181610', '河南', '驻马店', '正阳', 'zhengyang');
INSERT INTO `w_weather_city` VALUES ('CN101181701', '河南', '三门峡', '三门峡', 'sanmenxia');
INSERT INTO `w_weather_city` VALUES ('CN101181702', '河南', '三门峡', '灵宝', 'lingbao');
INSERT INTO `w_weather_city` VALUES ('CN101181703', '河南', '三门峡', '渑池', 'mianchi');
INSERT INTO `w_weather_city` VALUES ('CN101181704', '河南', '三门峡', '卢氏', 'lushi');
INSERT INTO `w_weather_city` VALUES ('CN101181705', '河南', '三门峡', '义马', 'yima');
INSERT INTO `w_weather_city` VALUES ('CN101181706', '河南', '三门峡', '陕县', 'shanxian');
INSERT INTO `w_weather_city` VALUES ('CN101181801', '河南', '济源', '济源', 'jiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101190101', '江苏', '南京', '南京', 'nanjing');
INSERT INTO `w_weather_city` VALUES ('CN101190102', '江苏', '南京', '溧水', 'lishui');
INSERT INTO `w_weather_city` VALUES ('CN101190103', '江苏', '南京', '高淳', 'gaochun');
INSERT INTO `w_weather_city` VALUES ('CN101190104', '江苏', '南京', '江宁', 'jiangning');
INSERT INTO `w_weather_city` VALUES ('CN101190105', '江苏', '南京', '六合', 'luhe');
INSERT INTO `w_weather_city` VALUES ('CN101190106', '江苏', '南京', '江浦', 'jiangpu');
INSERT INTO `w_weather_city` VALUES ('CN101190107', '江苏', '南京', '浦口', 'pukou');
INSERT INTO `w_weather_city` VALUES ('CN101190201', '江苏', '无锡', '无锡', 'wuxi');
INSERT INTO `w_weather_city` VALUES ('CN101190202', '江苏', '无锡', '江阴', 'jiangyin');
INSERT INTO `w_weather_city` VALUES ('CN101190203', '江苏', '无锡', '宜兴', 'yixing');
INSERT INTO `w_weather_city` VALUES ('CN101190204', '江苏', '无锡', '锡山', 'xishan');
INSERT INTO `w_weather_city` VALUES ('CN101190301', '江苏', '镇江', '镇江', 'zhenjiang');
INSERT INTO `w_weather_city` VALUES ('CN101190302', '江苏', '镇江', '丹阳', 'danyang');
INSERT INTO `w_weather_city` VALUES ('CN101190303', '江苏', '镇江', '扬中', 'yangzhong');
INSERT INTO `w_weather_city` VALUES ('CN101190304', '江苏', '镇江', '句容', 'jurong');
INSERT INTO `w_weather_city` VALUES ('CN101190305', '江苏', '镇江', '丹徒', 'dantu');
INSERT INTO `w_weather_city` VALUES ('CN101190401', '江苏', '苏州', '苏州', 'suzhou');
INSERT INTO `w_weather_city` VALUES ('CN101190402', '江苏', '苏州', '常熟', 'changshu');
INSERT INTO `w_weather_city` VALUES ('CN101190403', '江苏', '苏州', '张家港', 'zhangjiagang');
INSERT INTO `w_weather_city` VALUES ('CN101190404', '江苏', '苏州', '昆山', 'kunshan');
INSERT INTO `w_weather_city` VALUES ('CN101190405', '江苏', '苏州', '吴中', 'wuzhong');
INSERT INTO `w_weather_city` VALUES ('CN101190407', '江苏', '苏州', '吴江', 'wujiang');
INSERT INTO `w_weather_city` VALUES ('CN101190408', '江苏', '苏州', '太仓', 'taicang');
INSERT INTO `w_weather_city` VALUES ('CN101190501', '江苏', '南通', '南通', 'nantong');
INSERT INTO `w_weather_city` VALUES ('CN101190502', '江苏', '南通', '海安', 'haian');
INSERT INTO `w_weather_city` VALUES ('CN101190503', '江苏', '南通', '如皋', 'rugao');
INSERT INTO `w_weather_city` VALUES ('CN101190504', '江苏', '南通', '如东', 'rudong');
INSERT INTO `w_weather_city` VALUES ('CN101190507', '江苏', '南通', '启东', 'qidong');
INSERT INTO `w_weather_city` VALUES ('CN101190508', '江苏', '南通', '海门', 'haimen');
INSERT INTO `w_weather_city` VALUES ('CN101190509', '江苏', '南通', '通州', 'tongzhou');
INSERT INTO `w_weather_city` VALUES ('CN101190601', '江苏', '扬州', '扬州', 'yangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101190602', '江苏', '扬州', '宝应', 'baoying');
INSERT INTO `w_weather_city` VALUES ('CN101190603', '江苏', '扬州', '仪征', 'yizheng');
INSERT INTO `w_weather_city` VALUES ('CN101190604', '江苏', '扬州', '高邮', 'gaoyou');
INSERT INTO `w_weather_city` VALUES ('CN101190605', '江苏', '扬州', '江都', 'jiangdu');
INSERT INTO `w_weather_city` VALUES ('CN101190606', '江苏', '扬州', '邗江', 'hanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101190701', '江苏', '盐城', '盐城', 'yancheng');
INSERT INTO `w_weather_city` VALUES ('CN101190702', '江苏', '盐城', '响水', 'xiangshui');
INSERT INTO `w_weather_city` VALUES ('CN101190703', '江苏', '盐城', '滨海', 'binhai');
INSERT INTO `w_weather_city` VALUES ('CN101190704', '江苏', '盐城', '阜宁', 'funing');
INSERT INTO `w_weather_city` VALUES ('CN101190705', '江苏', '盐城', '射阳', 'sheyang');
INSERT INTO `w_weather_city` VALUES ('CN101190706', '江苏', '盐城', '建湖', 'jianhu');
INSERT INTO `w_weather_city` VALUES ('CN101190707', '江苏', '盐城', '东台', 'dongtai');
INSERT INTO `w_weather_city` VALUES ('CN101190708', '江苏', '盐城', '大丰', 'dafeng');
INSERT INTO `w_weather_city` VALUES ('CN101190709', '江苏', '盐城', '盐都', 'yandu');
INSERT INTO `w_weather_city` VALUES ('CN101190801', '江苏', '徐州', '徐州', 'xuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101190802', '江苏', '徐州', '铜山', 'tongshan');
INSERT INTO `w_weather_city` VALUES ('CN101190803', '江苏', '徐州', '丰县', 'fengxian');
INSERT INTO `w_weather_city` VALUES ('CN101190804', '江苏', '徐州', '沛县', 'peixian');
INSERT INTO `w_weather_city` VALUES ('CN101190805', '江苏', '徐州', '邳州', 'pizhou');
INSERT INTO `w_weather_city` VALUES ('CN101190806', '江苏', '徐州', '睢宁', 'suining');
INSERT INTO `w_weather_city` VALUES ('CN101190807', '江苏', '徐州', '新沂', 'xinyi');
INSERT INTO `w_weather_city` VALUES ('CN101190901', '江苏', '淮安', '淮安', 'huaian');
INSERT INTO `w_weather_city` VALUES ('CN101190902', '江苏', '淮安', '金湖', 'jinhu');
INSERT INTO `w_weather_city` VALUES ('CN101190903', '江苏', '淮安', '盱眙', 'xuyi');
INSERT INTO `w_weather_city` VALUES ('CN101190904', '江苏', '淮安', '洪泽', 'hongze');
INSERT INTO `w_weather_city` VALUES ('CN101190905', '江苏', '淮安', '涟水', 'lianshui');
INSERT INTO `w_weather_city` VALUES ('CN101190906', '江苏', '淮安', '淮阴区', 'huaiyinqu');
INSERT INTO `w_weather_city` VALUES ('CN101190908', '江苏', '淮安', '淮安区', 'huaianqu');
INSERT INTO `w_weather_city` VALUES ('CN101191001', '江苏', '连云港', '连云港', 'lianyungang');
INSERT INTO `w_weather_city` VALUES ('CN101191002', '江苏', '连云港', '东海', 'donghai');
INSERT INTO `w_weather_city` VALUES ('CN101191003', '江苏', '连云港', '赣榆', 'ganyu');
INSERT INTO `w_weather_city` VALUES ('CN101191004', '江苏', '连云港', '灌云', 'guanyun');
INSERT INTO `w_weather_city` VALUES ('CN101191005', '江苏', '连云港', '灌南', 'guannan');
INSERT INTO `w_weather_city` VALUES ('CN101191101', '江苏', '常州', '常州', 'changzhou');
INSERT INTO `w_weather_city` VALUES ('CN101191102', '江苏', '常州', '溧阳', 'liyang');
INSERT INTO `w_weather_city` VALUES ('CN101191103', '江苏', '常州', '金坛', 'jintan');
INSERT INTO `w_weather_city` VALUES ('CN101191104', '江苏', '常州', '武进', 'wujin');
INSERT INTO `w_weather_city` VALUES ('CN101191201', '江苏', '泰州', '泰州', 'taizhou');
INSERT INTO `w_weather_city` VALUES ('CN101191202', '江苏', '泰州', '兴化', 'xinghua');
INSERT INTO `w_weather_city` VALUES ('CN101191203', '江苏', '泰州', '泰兴', 'taixing');
INSERT INTO `w_weather_city` VALUES ('CN101191204', '江苏', '泰州', '姜堰', 'jiangyan');
INSERT INTO `w_weather_city` VALUES ('CN101191205', '江苏', '泰州', '靖江', 'jingjiang');
INSERT INTO `w_weather_city` VALUES ('CN101191301', '江苏', '宿迁', '宿迁', 'suqian');
INSERT INTO `w_weather_city` VALUES ('CN101191302', '江苏', '宿迁', '沭阳', 'shuyang');
INSERT INTO `w_weather_city` VALUES ('CN101191303', '江苏', '宿迁', '泗阳', 'siyang');
INSERT INTO `w_weather_city` VALUES ('CN101191304', '江苏', '宿迁', '泗洪', 'sihong');
INSERT INTO `w_weather_city` VALUES ('CN101191305', '江苏', '宿迁', '宿豫', 'suyu');
INSERT INTO `w_weather_city` VALUES ('CN101200101', '湖北', '武汉', '武汉', 'wuhan');
INSERT INTO `w_weather_city` VALUES ('CN101200102', '湖北', '武汉', '蔡甸', 'caidian');
INSERT INTO `w_weather_city` VALUES ('CN101200103', '湖北', '武汉', '黄陂', 'huangpi');
INSERT INTO `w_weather_city` VALUES ('CN101200104', '湖北', '武汉', '新洲', 'xinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101200105', '湖北', '武汉', '江夏', 'jiangxia');
INSERT INTO `w_weather_city` VALUES ('CN101200106', '湖北', '武汉', '东西湖', 'dongxihu');
INSERT INTO `w_weather_city` VALUES ('CN101200201', '湖北', '襄阳', '襄阳', 'xiangyang');
INSERT INTO `w_weather_city` VALUES ('CN101200202', '湖北', '襄阳', '襄州', 'xiangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101200203', '湖北', '襄阳', '保康', 'baokang');
INSERT INTO `w_weather_city` VALUES ('CN101200204', '湖北', '襄阳', '南漳', 'nanzhang');
INSERT INTO `w_weather_city` VALUES ('CN101200205', '湖北', '襄阳', '宜城', 'yicheng');
INSERT INTO `w_weather_city` VALUES ('CN101200206', '湖北', '襄阳', '老河口', 'laohekou');
INSERT INTO `w_weather_city` VALUES ('CN101200207', '湖北', '襄阳', '谷城', 'gucheng');
INSERT INTO `w_weather_city` VALUES ('CN101200208', '湖北', '襄阳', '枣阳', 'zaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101200301', '湖北', '鄂州', '鄂州', 'ezhou');
INSERT INTO `w_weather_city` VALUES ('CN101200302', '湖北', '鄂州', '梁子湖', 'liangzihu');
INSERT INTO `w_weather_city` VALUES ('CN101200401', '湖北', '孝感', '孝感', 'xiaogan');
INSERT INTO `w_weather_city` VALUES ('CN101200402', '湖北', '孝感', '安陆', 'anlu');
INSERT INTO `w_weather_city` VALUES ('CN101200403', '湖北', '孝感', '云梦', 'yunmeng');
INSERT INTO `w_weather_city` VALUES ('CN101200404', '湖北', '孝感', '大悟', 'dawu');
INSERT INTO `w_weather_city` VALUES ('CN101200405', '湖北', '孝感', '应城', 'yingcheng');
INSERT INTO `w_weather_city` VALUES ('CN101200406', '湖北', '孝感', '汉川', 'hanchuan');
INSERT INTO `w_weather_city` VALUES ('CN101200407', '湖北', '孝感', '孝昌', 'xiaochang');
INSERT INTO `w_weather_city` VALUES ('CN101200501', '湖北', '黄冈', '黄冈', 'huanggang');
INSERT INTO `w_weather_city` VALUES ('CN101200502', '湖北', '黄冈', '红安', 'hongan');
INSERT INTO `w_weather_city` VALUES ('CN101200503', '湖北', '黄冈', '麻城', 'macheng');
INSERT INTO `w_weather_city` VALUES ('CN101200504', '湖北', '黄冈', '罗田', 'luotian');
INSERT INTO `w_weather_city` VALUES ('CN101200505', '湖北', '黄冈', '英山', 'yingshan');
INSERT INTO `w_weather_city` VALUES ('CN101200506', '湖北', '黄冈', '浠水', 'xishui');
INSERT INTO `w_weather_city` VALUES ('CN101200507', '湖北', '黄冈', '蕲春', 'qichun');
INSERT INTO `w_weather_city` VALUES ('CN101200508', '湖北', '黄冈', '黄梅', 'huangmei');
INSERT INTO `w_weather_city` VALUES ('CN101200509', '湖北', '黄冈', '武穴', 'wuxue');
INSERT INTO `w_weather_city` VALUES ('CN101200510', '湖北', '黄冈', '团风', 'tuanfeng');
INSERT INTO `w_weather_city` VALUES ('CN101200601', '湖北', '黄石', '黄石', 'huangshi');
INSERT INTO `w_weather_city` VALUES ('CN101200602', '湖北', '黄石', '大冶', 'daye');
INSERT INTO `w_weather_city` VALUES ('CN101200603', '湖北', '黄石', '阳新', 'yangxin');
INSERT INTO `w_weather_city` VALUES ('CN101200604', '湖北', '黄石', '铁山', 'tieshan');
INSERT INTO `w_weather_city` VALUES ('CN101200605', '湖北', '黄石', '下陆', 'xialu');
INSERT INTO `w_weather_city` VALUES ('CN101200606', '湖北', '黄石', '西塞山', 'xisaishan');
INSERT INTO `w_weather_city` VALUES ('CN101200701', '湖北', '咸宁', '咸宁', 'xianning');
INSERT INTO `w_weather_city` VALUES ('CN101200702', '湖北', '咸宁', '赤壁', 'chibi');
INSERT INTO `w_weather_city` VALUES ('CN101200703', '湖北', '咸宁', '嘉鱼', 'jiayu');
INSERT INTO `w_weather_city` VALUES ('CN101200704', '湖北', '咸宁', '崇阳', 'chongyang');
INSERT INTO `w_weather_city` VALUES ('CN101200705', '湖北', '咸宁', '通城', 'tongcheng');
INSERT INTO `w_weather_city` VALUES ('CN101200706', '湖北', '咸宁', '通山', 'tongshan');
INSERT INTO `w_weather_city` VALUES ('CN101200801', '湖北', '荆州', '荆州', 'jingzhou');
INSERT INTO `w_weather_city` VALUES ('CN101200802', '湖北', '荆州', '江陵', 'jiangling');
INSERT INTO `w_weather_city` VALUES ('CN101200803', '湖北', '荆州', '公安', 'gongan');
INSERT INTO `w_weather_city` VALUES ('CN101200804', '湖北', '荆州', '石首', 'shishou');
INSERT INTO `w_weather_city` VALUES ('CN101200805', '湖北', '荆州', '监利', 'jianli');
INSERT INTO `w_weather_city` VALUES ('CN101200806', '湖北', '荆州', '洪湖', 'honghu');
INSERT INTO `w_weather_city` VALUES ('CN101200807', '湖北', '荆州', '松滋', 'songzi');
INSERT INTO `w_weather_city` VALUES ('CN101200901', '湖北', '宜昌', '宜昌', 'yichang');
INSERT INTO `w_weather_city` VALUES ('CN101200902', '湖北', '宜昌', '远安', 'yuanan');
INSERT INTO `w_weather_city` VALUES ('CN101200903', '湖北', '宜昌', '秭归', 'zigui');
INSERT INTO `w_weather_city` VALUES ('CN101200904', '湖北', '宜昌', '兴山', 'xingshan');
INSERT INTO `w_weather_city` VALUES ('CN101200906', '湖北', '宜昌', '五峰', 'wufeng');
INSERT INTO `w_weather_city` VALUES ('CN101200907', '湖北', '宜昌', '当阳', 'dangyang');
INSERT INTO `w_weather_city` VALUES ('CN101200908', '湖北', '宜昌', '长阳', 'changyang');
INSERT INTO `w_weather_city` VALUES ('CN101200909', '湖北', '宜昌', '宜都', 'yidu');
INSERT INTO `w_weather_city` VALUES ('CN101200910', '湖北', '宜昌', '枝江', 'zhijiang');
INSERT INTO `w_weather_city` VALUES ('CN101200911', '湖北', '宜昌', '三峡', 'sanxia');
INSERT INTO `w_weather_city` VALUES ('CN101200912', '湖北', '宜昌', '夷陵', 'yiling');
INSERT INTO `w_weather_city` VALUES ('CN101201001', '湖北', '恩施', '恩施', 'enshi');
INSERT INTO `w_weather_city` VALUES ('CN101201002', '湖北', '恩施', '利川', 'lichuan');
INSERT INTO `w_weather_city` VALUES ('CN101201003', '湖北', '恩施', '建始', 'jianshi');
INSERT INTO `w_weather_city` VALUES ('CN101201004', '湖北', '恩施', '咸丰', 'xianfeng');
INSERT INTO `w_weather_city` VALUES ('CN101201005', '湖北', '恩施', '宣恩', 'xuanen');
INSERT INTO `w_weather_city` VALUES ('CN101201006', '湖北', '恩施', '鹤峰', 'hefeng');
INSERT INTO `w_weather_city` VALUES ('CN101201007', '湖北', '恩施', '来凤', 'laifeng');
INSERT INTO `w_weather_city` VALUES ('CN101201008', '湖北', '恩施', '巴东', 'badong');
INSERT INTO `w_weather_city` VALUES ('CN101201101', '湖北', '十堰', '十堰', 'shiyan');
INSERT INTO `w_weather_city` VALUES ('CN101201102', '湖北', '十堰', '竹溪', 'zhuxi');
INSERT INTO `w_weather_city` VALUES ('CN101201103', '湖北', '十堰', '郧西', 'yunxi');
INSERT INTO `w_weather_city` VALUES ('CN101201104', '湖北', '十堰', '郧县', 'yunxian');
INSERT INTO `w_weather_city` VALUES ('CN101201105', '湖北', '十堰', '竹山', 'zhushan');
INSERT INTO `w_weather_city` VALUES ('CN101201106', '湖北', '十堰', '房县', 'fangxian');
INSERT INTO `w_weather_city` VALUES ('CN101201107', '湖北', '十堰', '丹江口', 'danjiangkou');
INSERT INTO `w_weather_city` VALUES ('CN101201108', '湖北', '十堰', '茅箭', 'maojian');
INSERT INTO `w_weather_city` VALUES ('CN101201109', '湖北', '十堰', '张湾', 'zhangwan');
INSERT INTO `w_weather_city` VALUES ('CN101201201', '湖北', '神农架', '神农架', 'shennongjia');
INSERT INTO `w_weather_city` VALUES ('CN101201301', '湖北', '随州', '随州', 'suizhou');
INSERT INTO `w_weather_city` VALUES ('CN101201302', '湖北', '随州', '广水', 'guangshui');
INSERT INTO `w_weather_city` VALUES ('CN101201401', '湖北', '荆门', '荆门', 'jingmen');
INSERT INTO `w_weather_city` VALUES ('CN101201402', '湖北', '荆门', '钟祥', 'zhongxiang');
INSERT INTO `w_weather_city` VALUES ('CN101201403', '湖北', '荆门', '京山', 'jingshan');
INSERT INTO `w_weather_city` VALUES ('CN101201404', '湖北', '荆门', '掇刀', 'duodao');
INSERT INTO `w_weather_city` VALUES ('CN101201405', '湖北', '荆门', '沙洋', 'shayang');
INSERT INTO `w_weather_city` VALUES ('CN101201406', '湖北', '荆州', '沙市', 'shashi');
INSERT INTO `w_weather_city` VALUES ('CN101201501', '湖北', '天门', '天门', 'tianmen');
INSERT INTO `w_weather_city` VALUES ('CN101201601', '湖北', '仙桃', '仙桃', 'xiantao');
INSERT INTO `w_weather_city` VALUES ('CN101201701', '湖北', '潜江', '潜江', 'qianjiang');
INSERT INTO `w_weather_city` VALUES ('CN101210101', '浙江', '杭州', '杭州', 'hangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101210102', '浙江', '杭州', '萧山', 'xiaoshan');
INSERT INTO `w_weather_city` VALUES ('CN101210103', '浙江', '杭州', '桐庐', 'tonglu');
INSERT INTO `w_weather_city` VALUES ('CN101210104', '浙江', '杭州', '淳安', 'chunan');
INSERT INTO `w_weather_city` VALUES ('CN101210105', '浙江', '杭州', '建德', 'jiande');
INSERT INTO `w_weather_city` VALUES ('CN101210106', '浙江', '杭州', '余杭', 'yuhang');
INSERT INTO `w_weather_city` VALUES ('CN101210107', '浙江', '杭州', '临安', 'linan');
INSERT INTO `w_weather_city` VALUES ('CN101210108', '浙江', '杭州', '富阳', 'fuyang');
INSERT INTO `w_weather_city` VALUES ('CN101210201', '浙江', '湖州', '湖州', 'huzhou');
INSERT INTO `w_weather_city` VALUES ('CN101210202', '浙江', '湖州', '长兴', 'changxing');
INSERT INTO `w_weather_city` VALUES ('CN101210203', '浙江', '湖州', '安吉', 'anji');
INSERT INTO `w_weather_city` VALUES ('CN101210204', '浙江', '湖州', '德清', 'deqing');
INSERT INTO `w_weather_city` VALUES ('CN101210301', '浙江', '嘉兴', '嘉兴', 'jiaxing');
INSERT INTO `w_weather_city` VALUES ('CN101210302', '浙江', '嘉兴', '嘉善', 'jiashan');
INSERT INTO `w_weather_city` VALUES ('CN101210303', '浙江', '嘉兴', '海宁', 'haining');
INSERT INTO `w_weather_city` VALUES ('CN101210304', '浙江', '嘉兴', '桐乡', 'tongxiang');
INSERT INTO `w_weather_city` VALUES ('CN101210305', '浙江', '嘉兴', '平湖', 'pinghu');
INSERT INTO `w_weather_city` VALUES ('CN101210306', '浙江', '嘉兴', '海盐', 'haiyan');
INSERT INTO `w_weather_city` VALUES ('CN101210401', '浙江', '宁波', '宁波', 'ningbo');
INSERT INTO `w_weather_city` VALUES ('CN101210403', '浙江', '宁波', '慈溪', 'cixi');
INSERT INTO `w_weather_city` VALUES ('CN101210404', '浙江', '宁波', '余姚', 'yuyao');
INSERT INTO `w_weather_city` VALUES ('CN101210405', '浙江', '宁波', '奉化', 'fenghua');
INSERT INTO `w_weather_city` VALUES ('CN101210406', '浙江', '宁波', '象山', 'xiangshan');
INSERT INTO `w_weather_city` VALUES ('CN101210408', '浙江', '宁波', '宁海', 'ninghai');
INSERT INTO `w_weather_city` VALUES ('CN101210410', '浙江', '宁波', '北仑', 'beilun');
INSERT INTO `w_weather_city` VALUES ('CN101210411', '浙江', '宁波', '鄞州', 'yinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101210412', '浙江', '宁波', '镇海', 'zhenhai');
INSERT INTO `w_weather_city` VALUES ('CN101210501', '浙江', '绍兴', '绍兴', 'shaoxing');
INSERT INTO `w_weather_city` VALUES ('CN101210502', '浙江', '绍兴', '诸暨', 'zhuji');
INSERT INTO `w_weather_city` VALUES ('CN101210503', '浙江', '绍兴', '上虞', 'shangyu');
INSERT INTO `w_weather_city` VALUES ('CN101210504', '浙江', '绍兴', '新昌', 'xinchang');
INSERT INTO `w_weather_city` VALUES ('CN101210505', '浙江', '绍兴', '嵊州', 'shengzhou');
INSERT INTO `w_weather_city` VALUES ('CN101210601', '浙江', '台州', '台州', 'taizhou');
INSERT INTO `w_weather_city` VALUES ('CN101210603', '浙江', '台州', '玉环', 'yuhuan');
INSERT INTO `w_weather_city` VALUES ('CN101210604', '浙江', '台州', '三门', 'sanmen');
INSERT INTO `w_weather_city` VALUES ('CN101210605', '浙江', '台州', '天台', 'tiantai');
INSERT INTO `w_weather_city` VALUES ('CN101210606', '浙江', '台州', '仙居', 'xianju');
INSERT INTO `w_weather_city` VALUES ('CN101210607', '浙江', '台州', '温岭', 'wenling');
INSERT INTO `w_weather_city` VALUES ('CN101210609', '浙江', '台州', '洪家', 'hongjia');
INSERT INTO `w_weather_city` VALUES ('CN101210610', '浙江', '台州', '临海', 'linhai');
INSERT INTO `w_weather_city` VALUES ('CN101210611', '浙江', '台州', '椒江', 'jiaojiang');
INSERT INTO `w_weather_city` VALUES ('CN101210612', '浙江', '台州', '黄岩', 'huangyan');
INSERT INTO `w_weather_city` VALUES ('CN101210613', '浙江', '台州', '路桥', 'luqiao');
INSERT INTO `w_weather_city` VALUES ('CN101210701', '浙江', '温州', '温州', 'wenzhou');
INSERT INTO `w_weather_city` VALUES ('CN101210702', '浙江', '温州', '泰顺', 'taishun');
INSERT INTO `w_weather_city` VALUES ('CN101210703', '浙江', '温州', '文成', 'wencheng');
INSERT INTO `w_weather_city` VALUES ('CN101210704', '浙江', '温州', '平阳', 'pingyang');
INSERT INTO `w_weather_city` VALUES ('CN101210705', '浙江', '温州', '瑞安', 'ruian');
INSERT INTO `w_weather_city` VALUES ('CN101210706', '浙江', '温州', '洞头', 'dongtou');
INSERT INTO `w_weather_city` VALUES ('CN101210707', '浙江', '温州', '乐清', 'yueqing');
INSERT INTO `w_weather_city` VALUES ('CN101210708', '浙江', '温州', '永嘉', 'yongjia');
INSERT INTO `w_weather_city` VALUES ('CN101210709', '浙江', '温州', '苍南', 'cangnan');
INSERT INTO `w_weather_city` VALUES ('CN101210801', '浙江', '丽水', '丽水', 'lishui');
INSERT INTO `w_weather_city` VALUES ('CN101210802', '浙江', '丽水', '遂昌', 'suichang');
INSERT INTO `w_weather_city` VALUES ('CN101210803', '浙江', '丽水', '龙泉', 'longquan');
INSERT INTO `w_weather_city` VALUES ('CN101210804', '浙江', '丽水', '缙云', 'jinyun');
INSERT INTO `w_weather_city` VALUES ('CN101210805', '浙江', '丽水', '青田', 'qingtian');
INSERT INTO `w_weather_city` VALUES ('CN101210806', '浙江', '丽水', '云和', 'yunhe');
INSERT INTO `w_weather_city` VALUES ('CN101210807', '浙江', '丽水', '庆元', 'qingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101210808', '浙江', '丽水', '松阳', 'songyang');
INSERT INTO `w_weather_city` VALUES ('CN101210809', '浙江', '丽水', '景宁', 'jingning');
INSERT INTO `w_weather_city` VALUES ('CN101210901', '浙江', '金华', '金华', 'jinhua');
INSERT INTO `w_weather_city` VALUES ('CN101210902', '浙江', '金华', '浦江', 'pujiang');
INSERT INTO `w_weather_city` VALUES ('CN101210903', '浙江', '金华', '兰溪', 'lanxi');
INSERT INTO `w_weather_city` VALUES ('CN101210904', '浙江', '金华', '义乌', 'yiwu');
INSERT INTO `w_weather_city` VALUES ('CN101210905', '浙江', '金华', '东阳', 'dongyang');
INSERT INTO `w_weather_city` VALUES ('CN101210906', '浙江', '金华', '武义', 'wuyi');
INSERT INTO `w_weather_city` VALUES ('CN101210907', '浙江', '金华', '永康', 'yongkang');
INSERT INTO `w_weather_city` VALUES ('CN101210908', '浙江', '金华', '磐安', 'panan');
INSERT INTO `w_weather_city` VALUES ('CN101211001', '浙江', '衢州', '衢州', 'quzhou');
INSERT INTO `w_weather_city` VALUES ('CN101211002', '浙江', '衢州', '常山', 'changshan');
INSERT INTO `w_weather_city` VALUES ('CN101211003', '浙江', '衢州', '开化', 'kaihua');
INSERT INTO `w_weather_city` VALUES ('CN101211004', '浙江', '衢州', '龙游', 'longyou');
INSERT INTO `w_weather_city` VALUES ('CN101211005', '浙江', '衢州', '江山', 'jiangshan');
INSERT INTO `w_weather_city` VALUES ('CN101211006', '浙江', '衢州', '衢江', 'qujiang');
INSERT INTO `w_weather_city` VALUES ('CN101211101', '浙江', '舟山', '舟山', 'zhoushan');
INSERT INTO `w_weather_city` VALUES ('CN101211102', '浙江', '舟山', '嵊泗', 'shengsi');
INSERT INTO `w_weather_city` VALUES ('CN101211104', '浙江', '舟山', '岱山', 'daishan');
INSERT INTO `w_weather_city` VALUES ('CN101211105', '浙江', '舟山', '普陀', 'putuo');
INSERT INTO `w_weather_city` VALUES ('CN101211106', '浙江', '舟山', '定海', 'dinghai');
INSERT INTO `w_weather_city` VALUES ('CN101220101', '安徽', '合肥', '合肥', 'hefei');
INSERT INTO `w_weather_city` VALUES ('CN101220102', '安徽', '合肥', '长丰', 'changfeng');
INSERT INTO `w_weather_city` VALUES ('CN101220103', '安徽', '合肥', '肥东', 'feidong');
INSERT INTO `w_weather_city` VALUES ('CN101220104', '安徽', '合肥', '肥西', 'feixi');
INSERT INTO `w_weather_city` VALUES ('CN101220105', '安徽', '合肥', '巢湖', 'chaohu');
INSERT INTO `w_weather_city` VALUES ('CN101220106', '安徽', '合肥', '庐江', 'lujiang');
INSERT INTO `w_weather_city` VALUES ('CN101220201', '安徽', '蚌埠', '蚌埠', 'bengbu');
INSERT INTO `w_weather_city` VALUES ('CN101220202', '安徽', '蚌埠', '怀远', 'huaiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101220203', '安徽', '蚌埠', '固镇', 'guzhen');
INSERT INTO `w_weather_city` VALUES ('CN101220204', '安徽', '蚌埠', '五河', 'wuhe');
INSERT INTO `w_weather_city` VALUES ('CN101220301', '安徽', '芜湖', '芜湖', 'wuhu');
INSERT INTO `w_weather_city` VALUES ('CN101220302', '安徽', '芜湖', '繁昌', 'fanyang');
INSERT INTO `w_weather_city` VALUES ('CN101220303', '安徽', '芜湖', '芜湖县', 'wuhuxian');
INSERT INTO `w_weather_city` VALUES ('CN101220304', '安徽', '芜湖', '南陵', 'nanling');
INSERT INTO `w_weather_city` VALUES ('CN101220305', '安徽', '芜湖', '无为', 'wuwei');
INSERT INTO `w_weather_city` VALUES ('CN101220401', '安徽', '淮南', '淮南', 'huainan');
INSERT INTO `w_weather_city` VALUES ('CN101220402', '安徽', '淮南', '凤台', 'fengtai');
INSERT INTO `w_weather_city` VALUES ('CN101220403', '安徽', '淮南', '潘集', 'panji');
INSERT INTO `w_weather_city` VALUES ('CN101220501', '安徽', '马鞍山', '马鞍山', 'maanshan');
INSERT INTO `w_weather_city` VALUES ('CN101220502', '安徽', '马鞍山', '当涂', 'dangtu');
INSERT INTO `w_weather_city` VALUES ('CN101220503', '安徽', '马鞍山', '含山', 'hanshan');
INSERT INTO `w_weather_city` VALUES ('CN101220504', '安徽', '马鞍山', '和县', 'hexian');
INSERT INTO `w_weather_city` VALUES ('CN101220601', '安徽', '安庆', '安庆', 'anqing');
INSERT INTO `w_weather_city` VALUES ('CN101220602', '安徽', '安庆', '枞阳', 'zongyang');
INSERT INTO `w_weather_city` VALUES ('CN101220603', '安徽', '安庆', '太湖', 'taihu');
INSERT INTO `w_weather_city` VALUES ('CN101220604', '安徽', '安庆', '潜山', 'qianshan');
INSERT INTO `w_weather_city` VALUES ('CN101220605', '安徽', '安庆', '怀宁', 'huaining');
INSERT INTO `w_weather_city` VALUES ('CN101220606', '安徽', '安庆', '宿松', 'susong');
INSERT INTO `w_weather_city` VALUES ('CN101220607', '安徽', '安庆', '望江', 'wangjiang');
INSERT INTO `w_weather_city` VALUES ('CN101220608', '安徽', '安庆', '岳西', 'yuexi');
INSERT INTO `w_weather_city` VALUES ('CN101220609', '安徽', '安庆', '桐城', 'tongcheng');
INSERT INTO `w_weather_city` VALUES ('CN101220701', '安徽', '宿州', '宿州', 'suzhou');
INSERT INTO `w_weather_city` VALUES ('CN101220702', '安徽', '宿州', '砀山', 'dangshan');
INSERT INTO `w_weather_city` VALUES ('CN101220703', '安徽', '宿州', '灵璧', 'lingbi');
INSERT INTO `w_weather_city` VALUES ('CN101220704', '安徽', '宿州', '泗县', 'sixian');
INSERT INTO `w_weather_city` VALUES ('CN101220705', '安徽', '宿州', '萧县', 'xiaoxian');
INSERT INTO `w_weather_city` VALUES ('CN101220801', '安徽', '阜阳', '阜阳', 'fuyang');
INSERT INTO `w_weather_city` VALUES ('CN101220802', '安徽', '阜阳', '阜南', 'funan');
INSERT INTO `w_weather_city` VALUES ('CN101220803', '安徽', '阜阳', '颍上', 'yingshang');
INSERT INTO `w_weather_city` VALUES ('CN101220804', '安徽', '阜阳', '临泉', 'linquan');
INSERT INTO `w_weather_city` VALUES ('CN101220805', '安徽', '阜阳', '界首', 'jieshou');
INSERT INTO `w_weather_city` VALUES ('CN101220806', '安徽', '阜阳', '太和', 'taihe');
INSERT INTO `w_weather_city` VALUES ('CN101220901', '安徽', '亳州', '亳州', 'bozhou');
INSERT INTO `w_weather_city` VALUES ('CN101220902', '安徽', '亳州', '涡阳', 'guoyang');
INSERT INTO `w_weather_city` VALUES ('CN101220903', '安徽', '亳州', '利辛', 'lixin');
INSERT INTO `w_weather_city` VALUES ('CN101220904', '安徽', '亳州', '蒙城', 'mengcheng');
INSERT INTO `w_weather_city` VALUES ('CN101221001', '安徽', '黄山', '黄山', 'huangshan');
INSERT INTO `w_weather_city` VALUES ('CN101221002', '安徽', '黄山', '黄山区', 'huangshanqu');
INSERT INTO `w_weather_city` VALUES ('CN101221003', '安徽', '黄山', '屯溪', 'tunxi');
INSERT INTO `w_weather_city` VALUES ('CN101221004', '安徽', '黄山', '祁门', 'qimen');
INSERT INTO `w_weather_city` VALUES ('CN101221005', '安徽', '黄山', '黟县', 'yixian');
INSERT INTO `w_weather_city` VALUES ('CN101221006', '安徽', '黄山', '歙县', 'shexian');
INSERT INTO `w_weather_city` VALUES ('CN101221007', '安徽', '黄山', '休宁', 'xiuning');
INSERT INTO `w_weather_city` VALUES ('CN101221008', '安徽', '黄山', '黄山风景区', 'huangshanfengjingqu');
INSERT INTO `w_weather_city` VALUES ('CN101221101', '安徽', '滁州', '滁州', 'chuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101221102', '安徽', '滁州', '凤阳', 'fengyang');
INSERT INTO `w_weather_city` VALUES ('CN101221103', '安徽', '滁州', '明光', 'mingguang');
INSERT INTO `w_weather_city` VALUES ('CN101221104', '安徽', '滁州', '定远', 'dingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101221105', '安徽', '滁州', '全椒', 'quanjiao');
INSERT INTO `w_weather_city` VALUES ('CN101221106', '安徽', '滁州', '来安', 'laian');
INSERT INTO `w_weather_city` VALUES ('CN101221107', '安徽', '滁州', '天长', 'tianchang');
INSERT INTO `w_weather_city` VALUES ('CN101221201', '安徽', '淮北', '淮北', 'huaibei');
INSERT INTO `w_weather_city` VALUES ('CN101221202', '安徽', '淮北', '濉溪', 'suixi');
INSERT INTO `w_weather_city` VALUES ('CN101221301', '安徽', '铜陵', '铜陵', 'tongling');
INSERT INTO `w_weather_city` VALUES ('CN101221401', '安徽', '宣城', '宣城', 'xuancheng');
INSERT INTO `w_weather_city` VALUES ('CN101221402', '安徽', '宣城', '泾县', 'jingxian');
INSERT INTO `w_weather_city` VALUES ('CN101221403', '安徽', '宣城', '旌德', 'jingde');
INSERT INTO `w_weather_city` VALUES ('CN101221404', '安徽', '宣城', '宁国', 'ningguo');
INSERT INTO `w_weather_city` VALUES ('CN101221405', '安徽', '宣城', '绩溪', 'jixi');
INSERT INTO `w_weather_city` VALUES ('CN101221406', '安徽', '宣城', '广德', 'guangde');
INSERT INTO `w_weather_city` VALUES ('CN101221407', '安徽', '宣城', '郎溪', 'langxi');
INSERT INTO `w_weather_city` VALUES ('CN101221501', '安徽', '六安', '六安', 'luan');
INSERT INTO `w_weather_city` VALUES ('CN101221502', '安徽', '六安', '霍邱', 'huoqiu');
INSERT INTO `w_weather_city` VALUES ('CN101221503', '安徽', '六安', '寿县', 'shouxian');
INSERT INTO `w_weather_city` VALUES ('CN101221505', '安徽', '六安', '金寨', 'jinzhai');
INSERT INTO `w_weather_city` VALUES ('CN101221506', '安徽', '六安', '霍山', 'huoshan');
INSERT INTO `w_weather_city` VALUES ('CN101221507', '安徽', '六安', '舒城', 'shucheng');
INSERT INTO `w_weather_city` VALUES ('CN101221701', '安徽', '池州', '池州', 'chizhou');
INSERT INTO `w_weather_city` VALUES ('CN101221702', '安徽', '池州', '东至', 'dongzhi');
INSERT INTO `w_weather_city` VALUES ('CN101221703', '安徽', '池州', '青阳', 'qingyang');
INSERT INTO `w_weather_city` VALUES ('CN101221704', '安徽', '池州', '九华山', 'jiuhuashan');
INSERT INTO `w_weather_city` VALUES ('CN101221705', '安徽', '池州', '石台', 'shitai');
INSERT INTO `w_weather_city` VALUES ('CN101230101', '福建', '福州', '福州', 'fuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101230102', '福建', '福州', '闽清', 'minqing');
INSERT INTO `w_weather_city` VALUES ('CN101230103', '福建', '福州', '闽侯', 'minhou');
INSERT INTO `w_weather_city` VALUES ('CN101230104', '福建', '福州', '罗源', 'luoyuan');
INSERT INTO `w_weather_city` VALUES ('CN101230105', '福建', '福州', '连江', 'lianjiang');
INSERT INTO `w_weather_city` VALUES ('CN101230107', '福建', '福州', '永泰', 'yongtai');
INSERT INTO `w_weather_city` VALUES ('CN101230108', '福建', '福州', '平潭', 'pingtan');
INSERT INTO `w_weather_city` VALUES ('CN101230110', '福建', '福州', '长乐', 'changle');
INSERT INTO `w_weather_city` VALUES ('CN101230111', '福建', '福州', '福清', 'fuqing');
INSERT INTO `w_weather_city` VALUES ('CN101230201', '福建', '厦门', '厦门', 'xiamen');
INSERT INTO `w_weather_city` VALUES ('CN101230202', '福建', '厦门', '同安', 'tongan');
INSERT INTO `w_weather_city` VALUES ('CN101230301', '福建', '宁德', '宁德', 'ningde');
INSERT INTO `w_weather_city` VALUES ('CN101230302', '福建', '宁德', '古田', 'gutian');
INSERT INTO `w_weather_city` VALUES ('CN101230303', '福建', '宁德', '霞浦', 'xiapu');
INSERT INTO `w_weather_city` VALUES ('CN101230304', '福建', '宁德', '寿宁', 'shouning');
INSERT INTO `w_weather_city` VALUES ('CN101230305', '福建', '宁德', '周宁', 'zhouning');
INSERT INTO `w_weather_city` VALUES ('CN101230306', '福建', '宁德', '福安', 'fuan');
INSERT INTO `w_weather_city` VALUES ('CN101230307', '福建', '宁德', '柘荣', 'zherong');
INSERT INTO `w_weather_city` VALUES ('CN101230308', '福建', '宁德', '福鼎', 'fuding');
INSERT INTO `w_weather_city` VALUES ('CN101230309', '福建', '宁德', '屏南', 'pingnan');
INSERT INTO `w_weather_city` VALUES ('CN101230401', '福建', '莆田', '莆田', 'putian');
INSERT INTO `w_weather_city` VALUES ('CN101230402', '福建', '莆田', '仙游', 'xianyou');
INSERT INTO `w_weather_city` VALUES ('CN101230403', '福建', '莆田', '秀屿港', 'xiuyugang');
INSERT INTO `w_weather_city` VALUES ('CN101230404', '福建', '莆田', '涵江', 'hanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101230405', '福建', '莆田', '秀屿', 'xiuyu');
INSERT INTO `w_weather_city` VALUES ('CN101230406', '福建', '莆田', '荔城', 'licheng');
INSERT INTO `w_weather_city` VALUES ('CN101230407', '福建', '莆田', '城厢', 'chengxiang');
INSERT INTO `w_weather_city` VALUES ('CN101230501', '福建', '泉州', '泉州', 'quanzhou');
INSERT INTO `w_weather_city` VALUES ('CN101230502', '福建', '泉州', '安溪', 'anxi');
INSERT INTO `w_weather_city` VALUES ('CN101230504', '福建', '泉州', '永春', 'yongchun');
INSERT INTO `w_weather_city` VALUES ('CN101230505', '福建', '泉州', '德化', 'dehua');
INSERT INTO `w_weather_city` VALUES ('CN101230506', '福建', '泉州', '南安', 'nanan');
INSERT INTO `w_weather_city` VALUES ('CN101230507', '福建', '泉州', '崇武', 'chongwu');
INSERT INTO `w_weather_city` VALUES ('CN101230508', '福建', '泉州', '惠安', 'huian');
INSERT INTO `w_weather_city` VALUES ('CN101230509', '福建', '泉州', '晋江', 'jinjiang');
INSERT INTO `w_weather_city` VALUES ('CN101230510', '福建', '泉州', '石狮', 'shishi');
INSERT INTO `w_weather_city` VALUES ('CN101230601', '福建', '漳州', '漳州', 'zhangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101230602', '福建', '漳州', '长泰', 'changtai');
INSERT INTO `w_weather_city` VALUES ('CN101230603', '福建', '漳州', '南靖', 'nanjing');
INSERT INTO `w_weather_city` VALUES ('CN101230604', '福建', '漳州', '平和', 'pinghe');
INSERT INTO `w_weather_city` VALUES ('CN101230605', '福建', '漳州', '龙海', 'longhai');
INSERT INTO `w_weather_city` VALUES ('CN101230606', '福建', '漳州', '漳浦', 'zhangpu');
INSERT INTO `w_weather_city` VALUES ('CN101230607', '福建', '漳州', '诏安', 'zhaoan');
INSERT INTO `w_weather_city` VALUES ('CN101230608', '福建', '漳州', '东山', 'dongshan');
INSERT INTO `w_weather_city` VALUES ('CN101230609', '福建', '漳州', '云霄', 'yunxiao');
INSERT INTO `w_weather_city` VALUES ('CN101230610', '福建', '漳州', '华安', 'huaan');
INSERT INTO `w_weather_city` VALUES ('CN101230701', '福建', '龙岩', '龙岩', 'longyan');
INSERT INTO `w_weather_city` VALUES ('CN101230702', '福建', '龙岩', '长汀', 'changting');
INSERT INTO `w_weather_city` VALUES ('CN101230703', '福建', '龙岩', '连城', 'liancheng');
INSERT INTO `w_weather_city` VALUES ('CN101230704', '福建', '龙岩', '武平', 'wuping');
INSERT INTO `w_weather_city` VALUES ('CN101230705', '福建', '龙岩', '上杭', 'shanghang');
INSERT INTO `w_weather_city` VALUES ('CN101230706', '福建', '龙岩', '永定', 'yongding');
INSERT INTO `w_weather_city` VALUES ('CN101230707', '福建', '龙岩', '漳平', 'zhangping');
INSERT INTO `w_weather_city` VALUES ('CN101230801', '福建', '三明', '三明', 'sanming');
INSERT INTO `w_weather_city` VALUES ('CN101230802', '福建', '三明', '宁化', 'ninghua');
INSERT INTO `w_weather_city` VALUES ('CN101230803', '福建', '三明', '清流', 'qingliu');
INSERT INTO `w_weather_city` VALUES ('CN101230804', '福建', '三明', '泰宁', 'taining');
INSERT INTO `w_weather_city` VALUES ('CN101230805', '福建', '三明', '将乐', 'jiangle');
INSERT INTO `w_weather_city` VALUES ('CN101230806', '福建', '三明', '建宁', 'jianning');
INSERT INTO `w_weather_city` VALUES ('CN101230807', '福建', '三明', '明溪', 'mingxi');
INSERT INTO `w_weather_city` VALUES ('CN101230808', '福建', '三明', '沙县', 'shaxian');
INSERT INTO `w_weather_city` VALUES ('CN101230809', '福建', '三明', '尤溪', 'youxi');
INSERT INTO `w_weather_city` VALUES ('CN101230810', '福建', '三明', '永安', 'yongan');
INSERT INTO `w_weather_city` VALUES ('CN101230811', '福建', '三明', '大田', 'datian');
INSERT INTO `w_weather_city` VALUES ('CN101230901', '福建', '南平', '南平', 'nanping');
INSERT INTO `w_weather_city` VALUES ('CN101230902', '福建', '南平', '顺昌', 'shunchang');
INSERT INTO `w_weather_city` VALUES ('CN101230903', '福建', '南平', '光泽', 'guangze');
INSERT INTO `w_weather_city` VALUES ('CN101230904', '福建', '南平', '邵武', 'shaowu');
INSERT INTO `w_weather_city` VALUES ('CN101230905', '福建', '南平', '武夷山', 'wuyishan');
INSERT INTO `w_weather_city` VALUES ('CN101230906', '福建', '南平', '浦城', 'pucheng');
INSERT INTO `w_weather_city` VALUES ('CN101230907', '福建', '南平', '建阳', 'jianyang');
INSERT INTO `w_weather_city` VALUES ('CN101230908', '福建', '南平', '松溪', 'songxi');
INSERT INTO `w_weather_city` VALUES ('CN101230909', '福建', '南平', '政和', 'zhenghe');
INSERT INTO `w_weather_city` VALUES ('CN101230910', '福建', '南平', '建瓯', 'jianou');
INSERT INTO `w_weather_city` VALUES ('CN101231001', '福建', '钓鱼岛', '钓鱼岛', 'diaoyudao');
INSERT INTO `w_weather_city` VALUES ('CN101240101', '江西', '南昌', '南昌', 'nanchang');
INSERT INTO `w_weather_city` VALUES ('CN101240102', '江西', '南昌', '新建', 'xinjian');
INSERT INTO `w_weather_city` VALUES ('CN101240103', '江西', '南昌', '南昌县', 'nanchangxian');
INSERT INTO `w_weather_city` VALUES ('CN101240104', '江西', '南昌', '安义', 'anyi');
INSERT INTO `w_weather_city` VALUES ('CN101240105', '江西', '南昌', '进贤', 'jinxian');
INSERT INTO `w_weather_city` VALUES ('CN101240201', '江西', '九江', '九江', 'jiujiang');
INSERT INTO `w_weather_city` VALUES ('CN101240202', '江西', '九江', '瑞昌', 'ruichang');
INSERT INTO `w_weather_city` VALUES ('CN101240203', '江西', '九江', '庐山', 'lushan');
INSERT INTO `w_weather_city` VALUES ('CN101240204', '江西', '九江', '武宁', 'wuning');
INSERT INTO `w_weather_city` VALUES ('CN101240205', '江西', '九江', '德安', 'dean');
INSERT INTO `w_weather_city` VALUES ('CN101240206', '江西', '九江', '永修', 'yongxiu');
INSERT INTO `w_weather_city` VALUES ('CN101240207', '江西', '九江', '湖口', 'hukou');
INSERT INTO `w_weather_city` VALUES ('CN101240208', '江西', '九江', '彭泽', 'pengze');
INSERT INTO `w_weather_city` VALUES ('CN101240209', '江西', '九江', '星子', 'xingzi');
INSERT INTO `w_weather_city` VALUES ('CN101240210', '江西', '九江', '都昌', 'duchang');
INSERT INTO `w_weather_city` VALUES ('CN101240212', '江西', '九江', '修水', 'xiushui');
INSERT INTO `w_weather_city` VALUES ('CN101240301', '江西', '上饶', '上饶', 'shangrao');
INSERT INTO `w_weather_city` VALUES ('CN101240302', '江西', '上饶', '鄱阳', 'poyang');
INSERT INTO `w_weather_city` VALUES ('CN101240303', '江西', '上饶', '婺源', 'wuyuan');
INSERT INTO `w_weather_city` VALUES ('CN101240305', '江西', '上饶', '余干', 'yugan');
INSERT INTO `w_weather_city` VALUES ('CN101240306', '江西', '上饶', '万年', 'wannian');
INSERT INTO `w_weather_city` VALUES ('CN101240307', '江西', '上饶', '德兴', 'dexing');
INSERT INTO `w_weather_city` VALUES ('CN101240308', '江西', '上饶', '上饶县', 'shangraoxian');
INSERT INTO `w_weather_city` VALUES ('CN101240309', '江西', '上饶', '弋阳', 'yiyang');
INSERT INTO `w_weather_city` VALUES ('CN101240310', '江西', '上饶', '横峰', 'hengfeng');
INSERT INTO `w_weather_city` VALUES ('CN101240311', '江西', '上饶', '铅山', 'yanshan');
INSERT INTO `w_weather_city` VALUES ('CN101240312', '江西', '上饶', '玉山', 'yushan');
INSERT INTO `w_weather_city` VALUES ('CN101240313', '江西', '上饶', '广丰', 'guangfeng');
INSERT INTO `w_weather_city` VALUES ('CN101240401', '江西', '抚州', '抚州', 'fuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101240402', '江西', '抚州', '广昌', 'guangchang');
INSERT INTO `w_weather_city` VALUES ('CN101240403', '江西', '抚州', '乐安', 'anle');
INSERT INTO `w_weather_city` VALUES ('CN101240404', '江西', '抚州', '崇仁', 'chongren');
INSERT INTO `w_weather_city` VALUES ('CN101240405', '江西', '抚州', '金溪', 'jinxi');
INSERT INTO `w_weather_city` VALUES ('CN101240406', '江西', '抚州', '资溪', 'zixi');
INSERT INTO `w_weather_city` VALUES ('CN101240407', '江西', '抚州', '宜黄', 'yihuang');
INSERT INTO `w_weather_city` VALUES ('CN101240408', '江西', '抚州', '南城', 'nancheng');
INSERT INTO `w_weather_city` VALUES ('CN101240409', '江西', '抚州', '南丰', 'nanfeng');
INSERT INTO `w_weather_city` VALUES ('CN101240410', '江西', '抚州', '黎川', 'lichuan');
INSERT INTO `w_weather_city` VALUES ('CN101240411', '江西', '抚州', '东乡', 'dongxiang');
INSERT INTO `w_weather_city` VALUES ('CN101240501', '江西', '宜春', '宜春', 'yichun');
INSERT INTO `w_weather_city` VALUES ('CN101240502', '江西', '宜春', '铜鼓', 'tonggu');
INSERT INTO `w_weather_city` VALUES ('CN101240503', '江西', '宜春', '宜丰', 'yifeng');
INSERT INTO `w_weather_city` VALUES ('CN101240504', '江西', '宜春', '万载', 'wanzai');
INSERT INTO `w_weather_city` VALUES ('CN101240505', '江西', '宜春', '上高', 'shanggao');
INSERT INTO `w_weather_city` VALUES ('CN101240506', '江西', '宜春', '靖安', 'jingan');
INSERT INTO `w_weather_city` VALUES ('CN101240507', '江西', '宜春', '奉新', 'fengxin');
INSERT INTO `w_weather_city` VALUES ('CN101240508', '江西', '宜春', '高安', 'gaoan');
INSERT INTO `w_weather_city` VALUES ('CN101240509', '江西', '宜春', '樟树', 'zhangshu');
INSERT INTO `w_weather_city` VALUES ('CN101240510', '江西', '宜春', '丰城', 'fengcheng');
INSERT INTO `w_weather_city` VALUES ('CN101240601', '江西', '吉安', '吉安', 'jian');
INSERT INTO `w_weather_city` VALUES ('CN101240602', '江西', '吉安', '吉安县', 'jianxian');
INSERT INTO `w_weather_city` VALUES ('CN101240603', '江西', '吉安', '吉水', 'jishui');
INSERT INTO `w_weather_city` VALUES ('CN101240604', '江西', '吉安', '新干', 'xingan');
INSERT INTO `w_weather_city` VALUES ('CN101240605', '江西', '吉安', '峡江', 'xiajiang');
INSERT INTO `w_weather_city` VALUES ('CN101240606', '江西', '吉安', '永丰', 'yongfeng');
INSERT INTO `w_weather_city` VALUES ('CN101240607', '江西', '吉安', '永新', 'yongxin');
INSERT INTO `w_weather_city` VALUES ('CN101240608', '江西', '吉安', '井冈山', 'jinggangshan');
INSERT INTO `w_weather_city` VALUES ('CN101240609', '江西', '吉安', '万安', 'wanan');
INSERT INTO `w_weather_city` VALUES ('CN101240610', '江西', '吉安', '遂川', 'suichuan');
INSERT INTO `w_weather_city` VALUES ('CN101240611', '江西', '吉安', '泰和', 'taihe');
INSERT INTO `w_weather_city` VALUES ('CN101240612', '江西', '吉安', '安福', 'anfu');
INSERT INTO `w_weather_city` VALUES ('CN101240613', '江西', '吉安', '宁冈', 'ninggang');
INSERT INTO `w_weather_city` VALUES ('CN101240701', '江西', '赣州', '赣州', 'ganzhou');
INSERT INTO `w_weather_city` VALUES ('CN101240702', '江西', '赣州', '崇义', 'chongyi');
INSERT INTO `w_weather_city` VALUES ('CN101240703', '江西', '赣州', '上犹', 'shangyou');
INSERT INTO `w_weather_city` VALUES ('CN101240704', '江西', '赣州', '南康', 'nankang');
INSERT INTO `w_weather_city` VALUES ('CN101240705', '江西', '赣州', '大余', 'dayu');
INSERT INTO `w_weather_city` VALUES ('CN101240706', '江西', '赣州', '信丰', 'xinfeng');
INSERT INTO `w_weather_city` VALUES ('CN101240707', '江西', '赣州', '宁都', 'ningdu');
INSERT INTO `w_weather_city` VALUES ('CN101240708', '江西', '赣州', '石城', 'shicheng');
INSERT INTO `w_weather_city` VALUES ('CN101240709', '江西', '赣州', '瑞金', 'ruijin');
INSERT INTO `w_weather_city` VALUES ('CN101240710', '江西', '赣州', '于都', 'yudu');
INSERT INTO `w_weather_city` VALUES ('CN101240711', '江西', '赣州', '会昌', 'huichang');
INSERT INTO `w_weather_city` VALUES ('CN101240712', '江西', '赣州', '安远', 'anyuan');
INSERT INTO `w_weather_city` VALUES ('CN101240713', '江西', '赣州', '全南', 'quannan');
INSERT INTO `w_weather_city` VALUES ('CN101240714', '江西', '赣州', '龙南', 'longnan');
INSERT INTO `w_weather_city` VALUES ('CN101240715', '江西', '赣州', '定南', 'dingnan');
INSERT INTO `w_weather_city` VALUES ('CN101240716', '江西', '赣州', '寻乌', 'xunwu');
INSERT INTO `w_weather_city` VALUES ('CN101240717', '江西', '赣州', '兴国', 'xingguo');
INSERT INTO `w_weather_city` VALUES ('CN101240718', '江西', '赣州', '赣县', 'ganxian');
INSERT INTO `w_weather_city` VALUES ('CN101240801', '江西', '景德镇', '景德镇', 'jingdezhen');
INSERT INTO `w_weather_city` VALUES ('CN101240802', '江西', '景德镇', '乐平', 'leping');
INSERT INTO `w_weather_city` VALUES ('CN101240803', '江西', '景德镇', '浮梁', 'fuliang');
INSERT INTO `w_weather_city` VALUES ('CN101240901', '江西', '萍乡', '萍乡', 'pingxiang');
INSERT INTO `w_weather_city` VALUES ('CN101240902', '江西', '萍乡', '莲花', 'lianhua');
INSERT INTO `w_weather_city` VALUES ('CN101240903', '江西', '萍乡', '上栗', 'shangli');
INSERT INTO `w_weather_city` VALUES ('CN101240904', '江西', '萍乡', '安源', 'anyuan');
INSERT INTO `w_weather_city` VALUES ('CN101240905', '江西', '萍乡', '芦溪', 'luxi');
INSERT INTO `w_weather_city` VALUES ('CN101240906', '江西', '萍乡', '湘东', 'xiangdong');
INSERT INTO `w_weather_city` VALUES ('CN101241001', '江西', '新余', '新余', 'xinyu');
INSERT INTO `w_weather_city` VALUES ('CN101241002', '江西', '新余', '分宜', 'fenyi');
INSERT INTO `w_weather_city` VALUES ('CN101241101', '江西', '鹰潭', '鹰潭', 'yingtan');
INSERT INTO `w_weather_city` VALUES ('CN101241102', '江西', '鹰潭', '余江', 'yujiang');
INSERT INTO `w_weather_city` VALUES ('CN101241103', '江西', '鹰潭', '贵溪', 'guixi');
INSERT INTO `w_weather_city` VALUES ('CN101250101', '湖南', '长沙', '长沙', 'changsha');
INSERT INTO `w_weather_city` VALUES ('CN101250102', '湖南', '长沙', '宁乡', 'ningxiang');
INSERT INTO `w_weather_city` VALUES ('CN101250103', '湖南', '长沙', '浏阳', 'liuyang');
INSERT INTO `w_weather_city` VALUES ('CN101250104', '湖南', '长沙', '马坡岭', 'mapoling');
INSERT INTO `w_weather_city` VALUES ('CN101250105', '湖南', '长沙', '望城', 'wangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101250201', '湖南', '湘潭', '湘潭', 'xiangtan');
INSERT INTO `w_weather_city` VALUES ('CN101250202', '湖南', '湘潭', '韶山', 'shaoshan');
INSERT INTO `w_weather_city` VALUES ('CN101250203', '湖南', '湘潭', '湘乡', 'xiangxiang');
INSERT INTO `w_weather_city` VALUES ('CN101250301', '湖南', '株洲', '株洲', 'zhuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101250302', '湖南', '株洲', '攸县', 'youxian');
INSERT INTO `w_weather_city` VALUES ('CN101250303', '湖南', '株洲', '醴陵', 'liling');
INSERT INTO `w_weather_city` VALUES ('CN101250305', '湖南', '株洲', '茶陵', 'chaling');
INSERT INTO `w_weather_city` VALUES ('CN101250306', '湖南', '株洲', '炎陵', 'yanling');
INSERT INTO `w_weather_city` VALUES ('CN101250401', '湖南', '衡阳', '衡阳', 'hengyang');
INSERT INTO `w_weather_city` VALUES ('CN101250402', '湖南', '衡阳', '衡山', 'hengshan');
INSERT INTO `w_weather_city` VALUES ('CN101250403', '湖南', '衡阳', '衡东', 'hengdong');
INSERT INTO `w_weather_city` VALUES ('CN101250404', '湖南', '衡阳', '祁东', 'qidong');
INSERT INTO `w_weather_city` VALUES ('CN101250405', '湖南', '衡阳', '衡阳县', 'hengyangxian');
INSERT INTO `w_weather_city` VALUES ('CN101250406', '湖南', '衡阳', '常宁', 'changning');
INSERT INTO `w_weather_city` VALUES ('CN101250407', '湖南', '衡阳', '衡南', 'hengnan');
INSERT INTO `w_weather_city` VALUES ('CN101250408', '湖南', '衡阳', '耒阳', 'leiyang');
INSERT INTO `w_weather_city` VALUES ('CN101250409', '湖南', '衡阳', '南岳', 'nanyue');
INSERT INTO `w_weather_city` VALUES ('CN101250501', '湖南', '郴州', '郴州', 'chenzhou');
INSERT INTO `w_weather_city` VALUES ('CN101250502', '湖南', '郴州', '桂阳', 'guiyang');
INSERT INTO `w_weather_city` VALUES ('CN101250503', '湖南', '郴州', '嘉禾', 'jiahe');
INSERT INTO `w_weather_city` VALUES ('CN101250504', '湖南', '郴州', '宜章', 'yizhang');
INSERT INTO `w_weather_city` VALUES ('CN101250505', '湖南', '郴州', '临武', 'linwu');
INSERT INTO `w_weather_city` VALUES ('CN101250507', '湖南', '郴州', '资兴', 'zixing');
INSERT INTO `w_weather_city` VALUES ('CN101250508', '湖南', '郴州', '汝城', 'rucheng');
INSERT INTO `w_weather_city` VALUES ('CN101250509', '湖南', '郴州', '安仁', 'anren');
INSERT INTO `w_weather_city` VALUES ('CN101250510', '湖南', '郴州', '永兴', 'yongxing');
INSERT INTO `w_weather_city` VALUES ('CN101250511', '湖南', '郴州', '桂东', 'guidong');
INSERT INTO `w_weather_city` VALUES ('CN101250512', '湖南', '郴州', '苏仙', 'suxian');
INSERT INTO `w_weather_city` VALUES ('CN101250601', '湖南', '常德', '常德', 'changde');
INSERT INTO `w_weather_city` VALUES ('CN101250602', '湖南', '常德', '安乡', 'anxiang');
INSERT INTO `w_weather_city` VALUES ('CN101250603', '湖南', '常德', '桃源', 'taoyuan');
INSERT INTO `w_weather_city` VALUES ('CN101250604', '湖南', '常德', '汉寿', 'hanshou');
INSERT INTO `w_weather_city` VALUES ('CN101250605', '湖南', '常德', '澧县', 'lixian');
INSERT INTO `w_weather_city` VALUES ('CN101250606', '湖南', '常德', '临澧', 'linli');
INSERT INTO `w_weather_city` VALUES ('CN101250607', '湖南', '常德', '石门', 'shimen');
INSERT INTO `w_weather_city` VALUES ('CN101250608', '湖南', '常德', '津市', 'jinshi');
INSERT INTO `w_weather_city` VALUES ('CN101250700', '湖南', '益阳', '益阳', 'yiyang');
INSERT INTO `w_weather_city` VALUES ('CN101250701', '湖南', '益阳', '赫山区', 'heshanqu');
INSERT INTO `w_weather_city` VALUES ('CN101250702', '湖南', '益阳', '南县', 'nanxian');
INSERT INTO `w_weather_city` VALUES ('CN101250703', '湖南', '益阳', '桃江', 'taojiang');
INSERT INTO `w_weather_city` VALUES ('CN101250704', '湖南', '益阳', '安化', 'anhua');
INSERT INTO `w_weather_city` VALUES ('CN101250705', '湖南', '益阳', '沅江', 'yuanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101250801', '湖南', '娄底', '娄底', 'loudi');
INSERT INTO `w_weather_city` VALUES ('CN101250802', '湖南', '娄底', '双峰', 'shuangfeng');
INSERT INTO `w_weather_city` VALUES ('CN101250803', '湖南', '娄底', '冷水江', 'lengshuijiang');
INSERT INTO `w_weather_city` VALUES ('CN101250805', '湖南', '娄底', '新化', 'xinhua');
INSERT INTO `w_weather_city` VALUES ('CN101250806', '湖南', '娄底', '涟源', 'lianyuan');
INSERT INTO `w_weather_city` VALUES ('CN101250901', '湖南', '邵阳', '邵阳', 'shaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101250902', '湖南', '邵阳', '隆回', 'longhui');
INSERT INTO `w_weather_city` VALUES ('CN101250903', '湖南', '邵阳', '洞口', 'dongkou');
INSERT INTO `w_weather_city` VALUES ('CN101250904', '湖南', '邵阳', '新邵', 'xinshao');
INSERT INTO `w_weather_city` VALUES ('CN101250905', '湖南', '邵阳', '邵东', 'shaodong');
INSERT INTO `w_weather_city` VALUES ('CN101250906', '湖南', '邵阳', '绥宁', 'suining');
INSERT INTO `w_weather_city` VALUES ('CN101250907', '湖南', '邵阳', '新宁', 'xinning');
INSERT INTO `w_weather_city` VALUES ('CN101250908', '湖南', '邵阳', '武冈', 'wugang');
INSERT INTO `w_weather_city` VALUES ('CN101250909', '湖南', '邵阳', '城步', 'chengbu');
INSERT INTO `w_weather_city` VALUES ('CN101250910', '湖南', '邵阳', '邵阳县', 'shaoyangxian');
INSERT INTO `w_weather_city` VALUES ('CN101251001', '湖南', '岳阳', '岳阳', 'yueyang');
INSERT INTO `w_weather_city` VALUES ('CN101251002', '湖南', '岳阳', '华容', 'huarong');
INSERT INTO `w_weather_city` VALUES ('CN101251003', '湖南', '岳阳', '湘阴', 'xiangyin');
INSERT INTO `w_weather_city` VALUES ('CN101251004', '湖南', '岳阳', '汨罗', 'miluo');
INSERT INTO `w_weather_city` VALUES ('CN101251005', '湖南', '岳阳', '平江', 'pingjiang');
INSERT INTO `w_weather_city` VALUES ('CN101251006', '湖南', '岳阳', '临湘', 'linxiang');
INSERT INTO `w_weather_city` VALUES ('CN101251101', '湖南', '张家界', '张家界', 'zhangjiajie');
INSERT INTO `w_weather_city` VALUES ('CN101251102', '湖南', '张家界', '桑植', 'sangzhi');
INSERT INTO `w_weather_city` VALUES ('CN101251103', '湖南', '张家界', '慈利', 'cili');
INSERT INTO `w_weather_city` VALUES ('CN101251104', '湖南', '张家界', '武陵源', 'wulingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101251201', '湖南', '怀化', '怀化', 'huaihua');
INSERT INTO `w_weather_city` VALUES ('CN101251203', '湖南', '怀化', '沅陵', 'yuanling');
INSERT INTO `w_weather_city` VALUES ('CN101251204', '湖南', '怀化', '辰溪', 'chenxi');
INSERT INTO `w_weather_city` VALUES ('CN101251205', '湖南', '怀化', '靖州', 'jingzhou');
INSERT INTO `w_weather_city` VALUES ('CN101251206', '湖南', '怀化', '会同', 'huitong');
INSERT INTO `w_weather_city` VALUES ('CN101251207', '湖南', '怀化', '通道', 'tongdao');
INSERT INTO `w_weather_city` VALUES ('CN101251208', '湖南', '怀化', '麻阳', 'mayang');
INSERT INTO `w_weather_city` VALUES ('CN101251209', '湖南', '怀化', '新晃', 'xinhuang');
INSERT INTO `w_weather_city` VALUES ('CN101251210', '湖南', '怀化', '芷江', 'zhijiang');
INSERT INTO `w_weather_city` VALUES ('CN101251211', '湖南', '怀化', '溆浦', 'xupu');
INSERT INTO `w_weather_city` VALUES ('CN101251212', '湖南', '怀化', '中方', 'zhongfang');
INSERT INTO `w_weather_city` VALUES ('CN101251213', '湖南', '怀化', '洪江', 'hongjiang');
INSERT INTO `w_weather_city` VALUES ('CN101251401', '湖南', '永州', '永州', 'yongzhou');
INSERT INTO `w_weather_city` VALUES ('CN101251402', '湖南', '永州', '祁阳', 'qiyang');
INSERT INTO `w_weather_city` VALUES ('CN101251403', '湖南', '永州', '东安', 'dongan');
INSERT INTO `w_weather_city` VALUES ('CN101251404', '湖南', '永州', '双牌', 'shuangpai');
INSERT INTO `w_weather_city` VALUES ('CN101251405', '湖南', '永州', '道县', 'daoxian');
INSERT INTO `w_weather_city` VALUES ('CN101251406', '湖南', '永州', '宁远', 'ningyuan');
INSERT INTO `w_weather_city` VALUES ('CN101251407', '湖南', '永州', '江永', 'jiangyong');
INSERT INTO `w_weather_city` VALUES ('CN101251408', '湖南', '永州', '蓝山', 'lanshan');
INSERT INTO `w_weather_city` VALUES ('CN101251409', '湖南', '永州', '新田', 'xintian');
INSERT INTO `w_weather_city` VALUES ('CN101251410', '湖南', '永州', '江华', 'jianghua');
INSERT INTO `w_weather_city` VALUES ('CN101251411', '湖南', '永州', '冷水滩', 'lengshuitan');
INSERT INTO `w_weather_city` VALUES ('CN101251501', '湖南', '湘西', '吉首', 'jishou');
INSERT INTO `w_weather_city` VALUES ('CN101251502', '湖南', '湘西', '保靖', 'baojing');
INSERT INTO `w_weather_city` VALUES ('CN101251503', '湖南', '湘西', '永顺', 'yongshun');
INSERT INTO `w_weather_city` VALUES ('CN101251504', '湖南', '湘西', '古丈', 'guzhang');
INSERT INTO `w_weather_city` VALUES ('CN101251505', '湖南', '湘西', '凤凰', 'fenghuang');
INSERT INTO `w_weather_city` VALUES ('CN101251506', '湖南', '湘西', '泸溪', 'luxi');
INSERT INTO `w_weather_city` VALUES ('CN101251507', '湖南', '湘西', '龙山', 'longshan');
INSERT INTO `w_weather_city` VALUES ('CN101251508', '湖南', '湘西', '花垣', 'huayuan');
INSERT INTO `w_weather_city` VALUES ('CN101260101', '贵州', '贵阳', '贵阳', 'guiyang');
INSERT INTO `w_weather_city` VALUES ('CN101260102', '贵州', '贵阳', '白云', 'baiyun');
INSERT INTO `w_weather_city` VALUES ('CN101260103', '贵州', '贵阳', '花溪', 'huaxi');
INSERT INTO `w_weather_city` VALUES ('CN101260104', '贵州', '贵阳', '乌当', 'wudang');
INSERT INTO `w_weather_city` VALUES ('CN101260105', '贵州', '贵阳', '息烽', 'xifeng');
INSERT INTO `w_weather_city` VALUES ('CN101260106', '贵州', '贵阳', '开阳', 'kaiyang');
INSERT INTO `w_weather_city` VALUES ('CN101260107', '贵州', '贵阳', '修文', 'xiuwen');
INSERT INTO `w_weather_city` VALUES ('CN101260108', '贵州', '贵阳', '清镇', 'qingzhen');
INSERT INTO `w_weather_city` VALUES ('CN101260109', '贵州', '贵阳', '小河', 'xiaohe');
INSERT INTO `w_weather_city` VALUES ('CN101260110', '贵州', '贵阳', '云岩', 'yunyan');
INSERT INTO `w_weather_city` VALUES ('CN101260111', '贵州', '贵阳', '南明', 'nanming');
INSERT INTO `w_weather_city` VALUES ('CN101260201', '贵州', '遵义', '遵义', 'zunyi');
INSERT INTO `w_weather_city` VALUES ('CN101260202', '贵州', '遵义', '遵义县', 'zunyixian');
INSERT INTO `w_weather_city` VALUES ('CN101260203', '贵州', '遵义', '仁怀', 'renhuai');
INSERT INTO `w_weather_city` VALUES ('CN101260204', '贵州', '遵义', '绥阳', 'suiyang');
INSERT INTO `w_weather_city` VALUES ('CN101260205', '贵州', '遵义', '湄潭', 'meitan');
INSERT INTO `w_weather_city` VALUES ('CN101260206', '贵州', '遵义', '凤冈', 'fenggang');
INSERT INTO `w_weather_city` VALUES ('CN101260207', '贵州', '遵义', '桐梓', 'tongzi');
INSERT INTO `w_weather_city` VALUES ('CN101260208', '贵州', '遵义', '赤水', 'chishui');
INSERT INTO `w_weather_city` VALUES ('CN101260209', '贵州', '遵义', '习水', 'xishui');
INSERT INTO `w_weather_city` VALUES ('CN101260210', '贵州', '遵义', '道真', 'daozhen');
INSERT INTO `w_weather_city` VALUES ('CN101260211', '贵州', '遵义', '正安', 'zhengan');
INSERT INTO `w_weather_city` VALUES ('CN101260212', '贵州', '遵义', '务川', 'wuchuan');
INSERT INTO `w_weather_city` VALUES ('CN101260213', '贵州', '遵义', '余庆', 'yuqing');
INSERT INTO `w_weather_city` VALUES ('CN101260214', '贵州', '遵义', '汇川', 'huichuan');
INSERT INTO `w_weather_city` VALUES ('CN101260215', '贵州', '遵义', '红花岗', 'honghuagang');
INSERT INTO `w_weather_city` VALUES ('CN101260301', '贵州', '安顺', '安顺', 'anshun');
INSERT INTO `w_weather_city` VALUES ('CN101260302', '贵州', '安顺', '普定', 'puding');
INSERT INTO `w_weather_city` VALUES ('CN101260303', '贵州', '安顺', '镇宁', 'zhenning');
INSERT INTO `w_weather_city` VALUES ('CN101260304', '贵州', '安顺', '平坝', 'pingba');
INSERT INTO `w_weather_city` VALUES ('CN101260305', '贵州', '安顺', '紫云', 'ziyun');
INSERT INTO `w_weather_city` VALUES ('CN101260306', '贵州', '安顺', '关岭', 'guanling');
INSERT INTO `w_weather_city` VALUES ('CN101260401', '贵州', '黔南', '都匀', 'duyun');
INSERT INTO `w_weather_city` VALUES ('CN101260402', '贵州', '黔南', '贵定', 'guiding');
INSERT INTO `w_weather_city` VALUES ('CN101260403', '贵州', '黔南', '瓮安', 'wengan');
INSERT INTO `w_weather_city` VALUES ('CN101260404', '贵州', '黔南', '长顺', 'changshun');
INSERT INTO `w_weather_city` VALUES ('CN101260405', '贵州', '黔南', '福泉', 'fuquan');
INSERT INTO `w_weather_city` VALUES ('CN101260406', '贵州', '黔南', '惠水', 'huishui');
INSERT INTO `w_weather_city` VALUES ('CN101260407', '贵州', '黔南', '龙里', 'longli');
INSERT INTO `w_weather_city` VALUES ('CN101260408', '贵州', '黔南', '罗甸', 'luodian');
INSERT INTO `w_weather_city` VALUES ('CN101260409', '贵州', '黔南', '平塘', 'pingtang');
INSERT INTO `w_weather_city` VALUES ('CN101260410', '贵州', '黔南', '独山', 'dushan');
INSERT INTO `w_weather_city` VALUES ('CN101260411', '贵州', '黔南', '三都', 'sandu');
INSERT INTO `w_weather_city` VALUES ('CN101260412', '贵州', '黔南', '荔波', 'libo');
INSERT INTO `w_weather_city` VALUES ('CN101260501', '贵州', '黔东南', '凯里', 'kaili');
INSERT INTO `w_weather_city` VALUES ('CN101260502', '贵州', '黔东南', '岑巩', 'cengong');
INSERT INTO `w_weather_city` VALUES ('CN101260503', '贵州', '黔东南', '施秉', 'shibing');
INSERT INTO `w_weather_city` VALUES ('CN101260504', '贵州', '黔东南', '镇远', 'zhenyuan');
INSERT INTO `w_weather_city` VALUES ('CN101260505', '贵州', '黔东南', '黄平', 'huangping');
INSERT INTO `w_weather_city` VALUES ('CN101260507', '贵州', '黔东南', '麻江', 'majiang');
INSERT INTO `w_weather_city` VALUES ('CN101260508', '贵州', '黔东南', '丹寨', 'danzhai');
INSERT INTO `w_weather_city` VALUES ('CN101260509', '贵州', '黔东南', '三穗', 'sansui');
INSERT INTO `w_weather_city` VALUES ('CN101260510', '贵州', '黔东南', '台江', 'taijiang');
INSERT INTO `w_weather_city` VALUES ('CN101260511', '贵州', '黔东南', '剑河', 'jianhe');
INSERT INTO `w_weather_city` VALUES ('CN101260512', '贵州', '黔东南', '雷山', 'leishan');
INSERT INTO `w_weather_city` VALUES ('CN101260513', '贵州', '黔东南', '黎平', 'liping');
INSERT INTO `w_weather_city` VALUES ('CN101260514', '贵州', '黔东南', '天柱', 'tianzhu');
INSERT INTO `w_weather_city` VALUES ('CN101260515', '贵州', '黔东南', '锦屏', 'jinping');
INSERT INTO `w_weather_city` VALUES ('CN101260516', '贵州', '黔东南', '榕江', 'rongjiang');
INSERT INTO `w_weather_city` VALUES ('CN101260517', '贵州', '黔东南', '从江', 'congjiang');
INSERT INTO `w_weather_city` VALUES ('CN101260601', '贵州', '铜仁', '铜仁', 'tongren');
INSERT INTO `w_weather_city` VALUES ('CN101260602', '贵州', '铜仁', '江口', 'jiangkou');
INSERT INTO `w_weather_city` VALUES ('CN101260603', '贵州', '铜仁', '玉屏', 'yuping');
INSERT INTO `w_weather_city` VALUES ('CN101260604', '贵州', '铜仁', '万山', 'wanshan');
INSERT INTO `w_weather_city` VALUES ('CN101260605', '贵州', '铜仁', '思南', 'sinan');
INSERT INTO `w_weather_city` VALUES ('CN101260607', '贵州', '铜仁', '印江', 'yinjiang');
INSERT INTO `w_weather_city` VALUES ('CN101260608', '贵州', '铜仁', '石阡', 'shiqian');
INSERT INTO `w_weather_city` VALUES ('CN101260609', '贵州', '铜仁', '沿河', 'yanhe');
INSERT INTO `w_weather_city` VALUES ('CN101260610', '贵州', '铜仁', '德江', 'dejiang');
INSERT INTO `w_weather_city` VALUES ('CN101260611', '贵州', '铜仁', '松桃', 'songtao');
INSERT INTO `w_weather_city` VALUES ('CN101260701', '贵州', '毕节', '毕节', 'bijie');
INSERT INTO `w_weather_city` VALUES ('CN101260702', '贵州', '毕节', '赫章', 'hezhang');
INSERT INTO `w_weather_city` VALUES ('CN101260703', '贵州', '毕节', '金沙', 'jinsha');
INSERT INTO `w_weather_city` VALUES ('CN101260704', '贵州', '毕节', '威宁', 'weining');
INSERT INTO `w_weather_city` VALUES ('CN101260705', '贵州', '毕节', '大方', 'dafang');
INSERT INTO `w_weather_city` VALUES ('CN101260706', '贵州', '毕节', '纳雍', 'nayong');
INSERT INTO `w_weather_city` VALUES ('CN101260707', '贵州', '毕节', '织金', 'zhijin');
INSERT INTO `w_weather_city` VALUES ('CN101260708', '贵州', '毕节', '黔西', 'qianxi');
INSERT INTO `w_weather_city` VALUES ('CN101260801', '贵州', '六盘水', '水城', 'shuicheng');
INSERT INTO `w_weather_city` VALUES ('CN101260802', '贵州', '六盘水', '六枝', 'liuzhi');
INSERT INTO `w_weather_city` VALUES ('CN101260804', '贵州', '六盘水', '盘县', 'panxian');
INSERT INTO `w_weather_city` VALUES ('CN101260901', '贵州', '黔西南', '兴义', 'xingyi');
INSERT INTO `w_weather_city` VALUES ('CN101260902', '贵州', '黔西南', '晴隆', 'qinglong');
INSERT INTO `w_weather_city` VALUES ('CN101260903', '贵州', '黔西南', '兴仁', 'xingren');
INSERT INTO `w_weather_city` VALUES ('CN101260904', '贵州', '黔西南', '贞丰', 'zhenfeng');
INSERT INTO `w_weather_city` VALUES ('CN101260905', '贵州', '黔西南', '望谟', 'wangmo');
INSERT INTO `w_weather_city` VALUES ('CN101260907', '贵州', '黔西南', '安龙', 'anlong');
INSERT INTO `w_weather_city` VALUES ('CN101260908', '贵州', '黔西南', '册亨', 'ceheng');
INSERT INTO `w_weather_city` VALUES ('CN101260909', '贵州', '黔西南', '普安', 'puan');
INSERT INTO `w_weather_city` VALUES ('CN101270101', '四川', '成都', '成都', 'chengdu');
INSERT INTO `w_weather_city` VALUES ('CN101270102', '四川', '成都', '龙泉驿', 'longquanyi');
INSERT INTO `w_weather_city` VALUES ('CN101270103', '四川', '成都', '新都', 'xindu');
INSERT INTO `w_weather_city` VALUES ('CN101270104', '四川', '成都', '温江', 'wenjiang');
INSERT INTO `w_weather_city` VALUES ('CN101270105', '四川', '成都', '金堂', 'jintang');
INSERT INTO `w_weather_city` VALUES ('CN101270106', '四川', '成都', '双流', 'shuangliu');
INSERT INTO `w_weather_city` VALUES ('CN101270107', '四川', '成都', '郫县', 'pixian');
INSERT INTO `w_weather_city` VALUES ('CN101270108', '四川', '成都', '大邑', 'dayi');
INSERT INTO `w_weather_city` VALUES ('CN101270109', '四川', '成都', '蒲江', 'pujiang');
INSERT INTO `w_weather_city` VALUES ('CN101270110', '四川', '成都', '新津', 'xinjin');
INSERT INTO `w_weather_city` VALUES ('CN101270111', '四川', '成都', '都江堰', 'dujiangyan');
INSERT INTO `w_weather_city` VALUES ('CN101270112', '四川', '成都', '彭州', 'pengzhou');
INSERT INTO `w_weather_city` VALUES ('CN101270113', '四川', '成都', '邛崃', 'qionglai');
INSERT INTO `w_weather_city` VALUES ('CN101270114', '四川', '成都', '崇州', 'chongzhou');
INSERT INTO `w_weather_city` VALUES ('CN101270115', '四川', '成都', '青白江', 'qingbaijiang');
INSERT INTO `w_weather_city` VALUES ('CN101270201', '四川', '攀枝花', '攀枝花', 'panzhihua');
INSERT INTO `w_weather_city` VALUES ('CN101270202', '四川', '攀枝花', '仁和', 'renhe');
INSERT INTO `w_weather_city` VALUES ('CN101270203', '四川', '攀枝花', '米易', 'miyi');
INSERT INTO `w_weather_city` VALUES ('CN101270204', '四川', '攀枝花', '盐边', 'yanbian');
INSERT INTO `w_weather_city` VALUES ('CN101270301', '四川', '自贡', '自贡', 'zigong');
INSERT INTO `w_weather_city` VALUES ('CN101270302', '四川', '自贡', '富顺', 'fushun');
INSERT INTO `w_weather_city` VALUES ('CN101270303', '四川', '自贡', '荣县', 'rongxian');
INSERT INTO `w_weather_city` VALUES ('CN101270401', '四川', '绵阳', '绵阳', 'mianyang');
INSERT INTO `w_weather_city` VALUES ('CN101270402', '四川', '绵阳', '三台', 'santai');
INSERT INTO `w_weather_city` VALUES ('CN101270403', '四川', '绵阳', '盐亭', 'yanting');
INSERT INTO `w_weather_city` VALUES ('CN101270404', '四川', '绵阳', '安县', 'anxian');
INSERT INTO `w_weather_city` VALUES ('CN101270405', '四川', '绵阳', '梓潼', 'zitong');
INSERT INTO `w_weather_city` VALUES ('CN101270406', '四川', '绵阳', '北川', 'beichuan');
INSERT INTO `w_weather_city` VALUES ('CN101270407', '四川', '绵阳', '平武', 'pingwu');
INSERT INTO `w_weather_city` VALUES ('CN101270408', '四川', '绵阳', '江油', 'jiangyou');
INSERT INTO `w_weather_city` VALUES ('CN101270501', '四川', '南充', '南充', 'nanchong');
INSERT INTO `w_weather_city` VALUES ('CN101270502', '四川', '南充', '南部', 'nanbu');
INSERT INTO `w_weather_city` VALUES ('CN101270503', '四川', '南充', '营山', 'yingshan');
INSERT INTO `w_weather_city` VALUES ('CN101270504', '四川', '南充', '蓬安', 'pengan');
INSERT INTO `w_weather_city` VALUES ('CN101270505', '四川', '南充', '仪陇', 'yilong');
INSERT INTO `w_weather_city` VALUES ('CN101270506', '四川', '南充', '西充', 'xichong');
INSERT INTO `w_weather_city` VALUES ('CN101270507', '四川', '南充', '阆中', 'langzhong');
INSERT INTO `w_weather_city` VALUES ('CN101270601', '四川', '达州', '达州', 'dazhou');
INSERT INTO `w_weather_city` VALUES ('CN101270602', '四川', '达州', '宣汉', 'xuanhan');
INSERT INTO `w_weather_city` VALUES ('CN101270603', '四川', '达州', '开江', 'kaijiang');
INSERT INTO `w_weather_city` VALUES ('CN101270604', '四川', '达州', '大竹', 'dazhu');
INSERT INTO `w_weather_city` VALUES ('CN101270605', '四川', '达州', '渠县', 'quxian');
INSERT INTO `w_weather_city` VALUES ('CN101270606', '四川', '达州', '万源', 'wanyuan');
INSERT INTO `w_weather_city` VALUES ('CN101270607', '四川', '达州', '通川', 'tongchuan');
INSERT INTO `w_weather_city` VALUES ('CN101270608', '四川', '达州', '达县', 'daxian');
INSERT INTO `w_weather_city` VALUES ('CN101270701', '四川', '遂宁', '遂宁', 'suining');
INSERT INTO `w_weather_city` VALUES ('CN101270702', '四川', '遂宁', '蓬溪', 'pengxi');
INSERT INTO `w_weather_city` VALUES ('CN101270703', '四川', '遂宁', '射洪', 'shehong');
INSERT INTO `w_weather_city` VALUES ('CN101270801', '四川', '广安', '广安', 'guangan');
INSERT INTO `w_weather_city` VALUES ('CN101270802', '四川', '广安', '岳池', 'yuechi');
INSERT INTO `w_weather_city` VALUES ('CN101270803', '四川', '广安', '武胜', 'wusheng');
INSERT INTO `w_weather_city` VALUES ('CN101270804', '四川', '广安', '邻水', 'linshui');
INSERT INTO `w_weather_city` VALUES ('CN101270805', '四川', '广安', '华蓥', 'huaying');
INSERT INTO `w_weather_city` VALUES ('CN101270901', '四川', '巴中', '巴中', 'bazhong');
INSERT INTO `w_weather_city` VALUES ('CN101270902', '四川', '巴中', '通江', 'tongjiang');
INSERT INTO `w_weather_city` VALUES ('CN101270903', '四川', '巴中', '南江', 'nanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101270904', '四川', '巴中', '平昌', 'pingchang');
INSERT INTO `w_weather_city` VALUES ('CN101271001', '四川', '泸州', '泸州', 'luzhou');
INSERT INTO `w_weather_city` VALUES ('CN101271003', '四川', '泸州', '泸县', 'luxian');
INSERT INTO `w_weather_city` VALUES ('CN101271004', '四川', '泸州', '合江', 'hejiang');
INSERT INTO `w_weather_city` VALUES ('CN101271005', '四川', '泸州', '叙永', 'xuyong');
INSERT INTO `w_weather_city` VALUES ('CN101271006', '四川', '泸州', '古蔺', 'gulin');
INSERT INTO `w_weather_city` VALUES ('CN101271007', '四川', '泸州', '纳溪', 'naxi');
INSERT INTO `w_weather_city` VALUES ('CN101271101', '四川', '宜宾', '宜宾', 'yibin');
INSERT INTO `w_weather_city` VALUES ('CN101271103', '四川', '宜宾', '宜宾县', 'yibinxian');
INSERT INTO `w_weather_city` VALUES ('CN101271104', '四川', '宜宾', '南溪', 'nanxi');
INSERT INTO `w_weather_city` VALUES ('CN101271105', '四川', '宜宾', '江安', 'jiangan');
INSERT INTO `w_weather_city` VALUES ('CN101271106', '四川', '宜宾', '长宁', 'changning');
INSERT INTO `w_weather_city` VALUES ('CN101271107', '四川', '宜宾', '高县', 'gaoxian');
INSERT INTO `w_weather_city` VALUES ('CN101271108', '四川', '宜宾', '珙县', 'gongxian');
INSERT INTO `w_weather_city` VALUES ('CN101271109', '四川', '宜宾', '筠连', 'junlian');
INSERT INTO `w_weather_city` VALUES ('CN101271110', '四川', '宜宾', '兴文', 'xingwen');
INSERT INTO `w_weather_city` VALUES ('CN101271111', '四川', '宜宾', '屏山', 'pingshan');
INSERT INTO `w_weather_city` VALUES ('CN101271201', '四川', '内江', '内江', 'neijiang');
INSERT INTO `w_weather_city` VALUES ('CN101271202', '四川', '内江', '东兴', 'dongxing');
INSERT INTO `w_weather_city` VALUES ('CN101271203', '四川', '内江', '威远', 'weiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101271204', '四川', '内江', '资中', 'zizhong');
INSERT INTO `w_weather_city` VALUES ('CN101271205', '四川', '内江', '隆昌', 'longchang');
INSERT INTO `w_weather_city` VALUES ('CN101271301', '四川', '资阳', '资阳', 'ziyang');
INSERT INTO `w_weather_city` VALUES ('CN101271302', '四川', '资阳', '安岳', 'anyue');
INSERT INTO `w_weather_city` VALUES ('CN101271303', '四川', '资阳', '乐至', 'lezhi');
INSERT INTO `w_weather_city` VALUES ('CN101271304', '四川', '资阳', '简阳', 'jianyang');
INSERT INTO `w_weather_city` VALUES ('CN101271401', '四川', '乐山', '乐山', 'leshan');
INSERT INTO `w_weather_city` VALUES ('CN101271402', '四川', '乐山', '犍为', 'qianwei');
INSERT INTO `w_weather_city` VALUES ('CN101271403', '四川', '乐山', '井研', 'jingyan');
INSERT INTO `w_weather_city` VALUES ('CN101271404', '四川', '乐山', '夹江', 'jiajiang');
INSERT INTO `w_weather_city` VALUES ('CN101271405', '四川', '乐山', '沐川', 'muchuan');
INSERT INTO `w_weather_city` VALUES ('CN101271406', '四川', '乐山', '峨边', 'ebian');
INSERT INTO `w_weather_city` VALUES ('CN101271407', '四川', '乐山', '马边', 'mabian');
INSERT INTO `w_weather_city` VALUES ('CN101271408', '四川', '乐山', '峨眉', 'emei');
INSERT INTO `w_weather_city` VALUES ('CN101271409', '四川', '乐山', '峨眉山', 'emeishan');
INSERT INTO `w_weather_city` VALUES ('CN101271501', '四川', '眉山', '眉山', 'meishan');
INSERT INTO `w_weather_city` VALUES ('CN101271502', '四川', '眉山', '仁寿', 'renshou');
INSERT INTO `w_weather_city` VALUES ('CN101271503', '四川', '眉山', '彭山', 'pengshan');
INSERT INTO `w_weather_city` VALUES ('CN101271504', '四川', '眉山', '洪雅', 'hongya');
INSERT INTO `w_weather_city` VALUES ('CN101271505', '四川', '眉山', '丹棱', 'danleng');
INSERT INTO `w_weather_city` VALUES ('CN101271506', '四川', '眉山', '青神', 'qingshen');
INSERT INTO `w_weather_city` VALUES ('CN101271601', '四川', '凉山', '凉山', 'liangshan');
INSERT INTO `w_weather_city` VALUES ('CN101271603', '四川', '凉山', '木里', 'muli');
INSERT INTO `w_weather_city` VALUES ('CN101271604', '四川', '凉山', '盐源', 'yanyuan');
INSERT INTO `w_weather_city` VALUES ('CN101271605', '四川', '凉山', '德昌', 'dechang');
INSERT INTO `w_weather_city` VALUES ('CN101271606', '四川', '凉山', '会理', 'huili');
INSERT INTO `w_weather_city` VALUES ('CN101271607', '四川', '凉山', '会东', 'huidong');
INSERT INTO `w_weather_city` VALUES ('CN101271608', '四川', '凉山', '宁南', 'ningnan');
INSERT INTO `w_weather_city` VALUES ('CN101271609', '四川', '凉山', '普格', 'puge');
INSERT INTO `w_weather_city` VALUES ('CN101271610', '四川', '凉山', '西昌', 'xichang');
INSERT INTO `w_weather_city` VALUES ('CN101271611', '四川', '凉山', '金阳', 'jinyang');
INSERT INTO `w_weather_city` VALUES ('CN101271612', '四川', '凉山', '昭觉', 'zhaojue');
INSERT INTO `w_weather_city` VALUES ('CN101271613', '四川', '凉山', '喜德', 'xide');
INSERT INTO `w_weather_city` VALUES ('CN101271614', '四川', '凉山', '冕宁', 'mianning');
INSERT INTO `w_weather_city` VALUES ('CN101271615', '四川', '凉山', '越西', 'yuexi');
INSERT INTO `w_weather_city` VALUES ('CN101271616', '四川', '凉山', '甘洛', 'ganluo');
INSERT INTO `w_weather_city` VALUES ('CN101271617', '四川', '凉山', '雷波', 'leibo');
INSERT INTO `w_weather_city` VALUES ('CN101271618', '四川', '凉山', '美姑', 'meigu');
INSERT INTO `w_weather_city` VALUES ('CN101271619', '四川', '凉山', '布拖', 'butuo');
INSERT INTO `w_weather_city` VALUES ('CN101271701', '四川', '雅安', '雅安', 'yaan');
INSERT INTO `w_weather_city` VALUES ('CN101271702', '四川', '雅安', '名山', 'mingshan');
INSERT INTO `w_weather_city` VALUES ('CN101271703', '四川', '雅安', '荥经', 'yingjing');
INSERT INTO `w_weather_city` VALUES ('CN101271704', '四川', '雅安', '汉源', 'hanyuan');
INSERT INTO `w_weather_city` VALUES ('CN101271705', '四川', '雅安', '石棉', 'shimian');
INSERT INTO `w_weather_city` VALUES ('CN101271706', '四川', '雅安', '天全', 'tianquan');
INSERT INTO `w_weather_city` VALUES ('CN101271707', '四川', '雅安', '芦山', 'lushan');
INSERT INTO `w_weather_city` VALUES ('CN101271708', '四川', '雅安', '宝兴', 'baoxing');
INSERT INTO `w_weather_city` VALUES ('CN101271801', '四川', '甘孜', '甘孜', 'ganzi');
INSERT INTO `w_weather_city` VALUES ('CN101271802', '四川', '甘孜', '康定', 'kangding');
INSERT INTO `w_weather_city` VALUES ('CN101271803', '四川', '甘孜', '泸定', 'luding');
INSERT INTO `w_weather_city` VALUES ('CN101271804', '四川', '甘孜', '丹巴', 'danba');
INSERT INTO `w_weather_city` VALUES ('CN101271805', '四川', '甘孜', '九龙', 'jiulong');
INSERT INTO `w_weather_city` VALUES ('CN101271806', '四川', '甘孜', '雅江', 'yajiang');
INSERT INTO `w_weather_city` VALUES ('CN101271807', '四川', '甘孜', '道孚', 'daofu');
INSERT INTO `w_weather_city` VALUES ('CN101271808', '四川', '甘孜', '炉霍', 'luhuo');
INSERT INTO `w_weather_city` VALUES ('CN101271809', '四川', '甘孜', '新龙', 'xinlong');
INSERT INTO `w_weather_city` VALUES ('CN101271810', '四川', '甘孜', '德格', 'dege');
INSERT INTO `w_weather_city` VALUES ('CN101271811', '四川', '甘孜', '白玉', 'baiyu');
INSERT INTO `w_weather_city` VALUES ('CN101271812', '四川', '甘孜', '石渠', 'shiqu');
INSERT INTO `w_weather_city` VALUES ('CN101271813', '四川', '甘孜', '色达', 'seda');
INSERT INTO `w_weather_city` VALUES ('CN101271814', '四川', '甘孜', '理塘', 'litang');
INSERT INTO `w_weather_city` VALUES ('CN101271815', '四川', '甘孜', '巴塘', 'batang');
INSERT INTO `w_weather_city` VALUES ('CN101271816', '四川', '甘孜', '乡城', 'xiangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101271817', '四川', '甘孜', '稻城', 'daocheng');
INSERT INTO `w_weather_city` VALUES ('CN101271818', '四川', '甘孜', '得荣', 'derong');
INSERT INTO `w_weather_city` VALUES ('CN101271901', '四川', '阿坝', '阿坝', 'aba');
INSERT INTO `w_weather_city` VALUES ('CN101271902', '四川', '阿坝', '汶川', 'wenchuan');
INSERT INTO `w_weather_city` VALUES ('CN101271903', '四川', '阿坝', '理县', 'lixian');
INSERT INTO `w_weather_city` VALUES ('CN101271904', '四川', '阿坝', '茂县', 'maoxian');
INSERT INTO `w_weather_city` VALUES ('CN101271905', '四川', '阿坝', '松潘', 'songfan');
INSERT INTO `w_weather_city` VALUES ('CN101271906', '四川', '阿坝', '九寨沟', 'jiuzhaigou');
INSERT INTO `w_weather_city` VALUES ('CN101271907', '四川', '阿坝', '金川', 'jinchuan');
INSERT INTO `w_weather_city` VALUES ('CN101271908', '四川', '阿坝', '小金', 'xiaojin');
INSERT INTO `w_weather_city` VALUES ('CN101271909', '四川', '阿坝', '黑水', 'heishui');
INSERT INTO `w_weather_city` VALUES ('CN101271910', '四川', '阿坝', '马尔康', 'maerkang');
INSERT INTO `w_weather_city` VALUES ('CN101271911', '四川', '阿坝', '壤塘', 'rangtang');
INSERT INTO `w_weather_city` VALUES ('CN101271912', '四川', '阿坝', '若尔盖', 'nuoergai');
INSERT INTO `w_weather_city` VALUES ('CN101271913', '四川', '阿坝', '红原', 'hongyuan');
INSERT INTO `w_weather_city` VALUES ('CN101272001', '四川', '德阳', '德阳', 'deyang');
INSERT INTO `w_weather_city` VALUES ('CN101272002', '四川', '德阳', '中江', 'zhongjiang');
INSERT INTO `w_weather_city` VALUES ('CN101272003', '四川', '德阳', '广汉', 'guanghan');
INSERT INTO `w_weather_city` VALUES ('CN101272004', '四川', '德阳', '什邡', 'shifang');
INSERT INTO `w_weather_city` VALUES ('CN101272005', '四川', '德阳', '绵竹', 'mianzhu');
INSERT INTO `w_weather_city` VALUES ('CN101272006', '四川', '德阳', '罗江', 'luojiang');
INSERT INTO `w_weather_city` VALUES ('CN101272101', '四川', '广元', '广元', 'guangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101272102', '四川', '广元', '旺苍', 'wangcang');
INSERT INTO `w_weather_city` VALUES ('CN101272103', '四川', '广元', '青川', 'qingchuan');
INSERT INTO `w_weather_city` VALUES ('CN101272104', '四川', '广元', '剑阁', 'jiange');
INSERT INTO `w_weather_city` VALUES ('CN101272105', '四川', '广元', '苍溪', 'cangxi');
INSERT INTO `w_weather_city` VALUES ('CN101280101', '广东', '广州', '广州', 'guangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101280102', '广东', '广州', '番禺', 'panyu');
INSERT INTO `w_weather_city` VALUES ('CN101280103', '广东', '广州', '从化', 'conghua');
INSERT INTO `w_weather_city` VALUES ('CN101280104', '广东', '广州', '增城', 'zengcheng');
INSERT INTO `w_weather_city` VALUES ('CN101280105', '广东', '广州', '花都', 'huadu');
INSERT INTO `w_weather_city` VALUES ('CN101280201', '广东', '韶关', '韶关', 'shaoguan');
INSERT INTO `w_weather_city` VALUES ('CN101280202', '广东', '韶关', '乳源', 'ruyuan');
INSERT INTO `w_weather_city` VALUES ('CN101280203', '广东', '韶关', '始兴', 'shixing');
INSERT INTO `w_weather_city` VALUES ('CN101280204', '广东', '韶关', '翁源', 'wengyuan');
INSERT INTO `w_weather_city` VALUES ('CN101280205', '广东', '韶关', '乐昌', 'lechang');
INSERT INTO `w_weather_city` VALUES ('CN101280206', '广东', '韶关', '仁化', 'renhua');
INSERT INTO `w_weather_city` VALUES ('CN101280207', '广东', '韶关', '南雄', 'nanxiong');
INSERT INTO `w_weather_city` VALUES ('CN101280208', '广东', '韶关', '新丰', 'xinfeng');
INSERT INTO `w_weather_city` VALUES ('CN101280209', '广东', '韶关', '曲江', 'qujiang');
INSERT INTO `w_weather_city` VALUES ('CN101280210', '广东', '韶关', '浈江', 'zhenjiang');
INSERT INTO `w_weather_city` VALUES ('CN101280211', '广东', '韶关', '武江', 'wujiang');
INSERT INTO `w_weather_city` VALUES ('CN101280301', '广东', '惠州', '惠州', 'huizhou');
INSERT INTO `w_weather_city` VALUES ('CN101280302', '广东', '惠州', '博罗', 'boluo');
INSERT INTO `w_weather_city` VALUES ('CN101280303', '广东', '惠州', '惠阳', 'huiyang');
INSERT INTO `w_weather_city` VALUES ('CN101280304', '广东', '惠州', '惠东', 'huidong');
INSERT INTO `w_weather_city` VALUES ('CN101280305', '广东', '惠州', '龙门', 'longmen');
INSERT INTO `w_weather_city` VALUES ('CN101280401', '广东', '梅州', '梅州', 'meizhou');
INSERT INTO `w_weather_city` VALUES ('CN101280402', '广东', '梅州', '兴宁', 'xingning');
INSERT INTO `w_weather_city` VALUES ('CN101280403', '广东', '梅州', '蕉岭', 'jiaoling');
INSERT INTO `w_weather_city` VALUES ('CN101280404', '广东', '梅州', '大埔', 'dabu');
INSERT INTO `w_weather_city` VALUES ('CN101280406', '广东', '梅州', '丰顺', 'fengshun');
INSERT INTO `w_weather_city` VALUES ('CN101280407', '广东', '梅州', '平远', 'pingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101280408', '广东', '梅州', '五华', 'wuhua');
INSERT INTO `w_weather_city` VALUES ('CN101280409', '广东', '梅州', '梅县', 'meixian');
INSERT INTO `w_weather_city` VALUES ('CN101280501', '广东', '汕头', '汕头', 'shantou');
INSERT INTO `w_weather_city` VALUES ('CN101280502', '广东', '汕头', '潮阳', 'chaoyang');
INSERT INTO `w_weather_city` VALUES ('CN101280503', '广东', '汕头', '澄海', 'chenghai');
INSERT INTO `w_weather_city` VALUES ('CN101280504', '广东', '汕头', '南澳', 'nanao');
INSERT INTO `w_weather_city` VALUES ('CN101280601', '广东', '深圳', '深圳', 'shenzhen');
INSERT INTO `w_weather_city` VALUES ('CN101280701', '广东', '珠海', '珠海', 'zhuhai');
INSERT INTO `w_weather_city` VALUES ('CN101280702', '广东', '珠海', '斗门', 'doumen');
INSERT INTO `w_weather_city` VALUES ('CN101280703', '广东', '珠海', '金湾', 'jinwan');
INSERT INTO `w_weather_city` VALUES ('CN101280800', '广东', '佛山', '佛山', 'foshan');
INSERT INTO `w_weather_city` VALUES ('CN101280801', '广东', '佛山', '顺德', 'shunde');
INSERT INTO `w_weather_city` VALUES ('CN101280802', '广东', '佛山', '三水', 'sanshui');
INSERT INTO `w_weather_city` VALUES ('CN101280803', '广东', '佛山', '南海', 'nanhai');
INSERT INTO `w_weather_city` VALUES ('CN101280804', '广东', '佛山', '高明', 'gaoming');
INSERT INTO `w_weather_city` VALUES ('CN101280901', '广东', '肇庆', '肇庆', 'zhaoqing');
INSERT INTO `w_weather_city` VALUES ('CN101280902', '广东', '肇庆', '广宁', 'guangning');
INSERT INTO `w_weather_city` VALUES ('CN101280903', '广东', '肇庆', '四会', 'sihui');
INSERT INTO `w_weather_city` VALUES ('CN101280905', '广东', '肇庆', '德庆', 'deqing');
INSERT INTO `w_weather_city` VALUES ('CN101280906', '广东', '肇庆', '怀集', 'huaiji');
INSERT INTO `w_weather_city` VALUES ('CN101280907', '广东', '肇庆', '封开', 'fengkai');
INSERT INTO `w_weather_city` VALUES ('CN101280908', '广东', '肇庆', '高要', 'gaoyao');
INSERT INTO `w_weather_city` VALUES ('CN101281001', '广东', '湛江', '湛江', 'zhanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101281002', '广东', '湛江', '吴川', 'wuchuan');
INSERT INTO `w_weather_city` VALUES ('CN101281003', '广东', '湛江', '雷州', 'leizhou');
INSERT INTO `w_weather_city` VALUES ('CN101281004', '广东', '湛江', '徐闻', 'xuwen');
INSERT INTO `w_weather_city` VALUES ('CN101281005', '广东', '湛江', '廉江', 'lianjiang');
INSERT INTO `w_weather_city` VALUES ('CN101281006', '广东', '湛江', '赤坎', 'chikan');
INSERT INTO `w_weather_city` VALUES ('CN101281007', '广东', '湛江', '遂溪', 'suixi');
INSERT INTO `w_weather_city` VALUES ('CN101281008', '广东', '湛江', '坡头', 'potou');
INSERT INTO `w_weather_city` VALUES ('CN101281009', '广东', '湛江', '霞山', 'xiashan');
INSERT INTO `w_weather_city` VALUES ('CN101281010', '广东', '湛江', '麻章', 'mazhang');
INSERT INTO `w_weather_city` VALUES ('CN101281101', '广东', '江门', '江门', 'jiangmen');
INSERT INTO `w_weather_city` VALUES ('CN101281103', '广东', '江门', '开平', 'kaiping');
INSERT INTO `w_weather_city` VALUES ('CN101281104', '广东', '江门', '新会', 'xinhui');
INSERT INTO `w_weather_city` VALUES ('CN101281105', '广东', '江门', '恩平', 'enping');
INSERT INTO `w_weather_city` VALUES ('CN101281106', '广东', '江门', '台山', 'taishan');
INSERT INTO `w_weather_city` VALUES ('CN101281107', '广东', '江门', '蓬江', 'pengjiang');
INSERT INTO `w_weather_city` VALUES ('CN101281108', '广东', '江门', '鹤山', 'heshan');
INSERT INTO `w_weather_city` VALUES ('CN101281109', '广东', '江门', '江海', 'jianghai');
INSERT INTO `w_weather_city` VALUES ('CN101281201', '广东', '河源', '河源', 'heyuan');
INSERT INTO `w_weather_city` VALUES ('CN101281202', '广东', '河源', '紫金', 'zijin');
INSERT INTO `w_weather_city` VALUES ('CN101281203', '广东', '河源', '连平', 'lianping');
INSERT INTO `w_weather_city` VALUES ('CN101281204', '广东', '河源', '和平', 'heping');
INSERT INTO `w_weather_city` VALUES ('CN101281205', '广东', '河源', '龙川', 'longchuan');
INSERT INTO `w_weather_city` VALUES ('CN101281206', '广东', '河源', '东源', 'dongyuan');
INSERT INTO `w_weather_city` VALUES ('CN101281301', '广东', '清远', '清远', 'qingyuan');
INSERT INTO `w_weather_city` VALUES ('CN101281302', '广东', '清远', '连南', 'liannan');
INSERT INTO `w_weather_city` VALUES ('CN101281303', '广东', '清远', '连州', 'lianzhou');
INSERT INTO `w_weather_city` VALUES ('CN101281304', '广东', '清远', '连山', 'lianshan');
INSERT INTO `w_weather_city` VALUES ('CN101281305', '广东', '清远', '阳山', 'yangshan');
INSERT INTO `w_weather_city` VALUES ('CN101281306', '广东', '清远', '佛冈', 'fogang');
INSERT INTO `w_weather_city` VALUES ('CN101281307', '广东', '清远', '英德', 'yingde');
INSERT INTO `w_weather_city` VALUES ('CN101281308', '广东', '清远', '清新', 'qingxin');
INSERT INTO `w_weather_city` VALUES ('CN101281401', '广东', '云浮', '云浮', 'yunfu');
INSERT INTO `w_weather_city` VALUES ('CN101281402', '广东', '云浮', '罗定', 'luoding');
INSERT INTO `w_weather_city` VALUES ('CN101281403', '广东', '云浮', '新兴', 'xinxing');
INSERT INTO `w_weather_city` VALUES ('CN101281404', '广东', '云浮', '郁南', 'yunan');
INSERT INTO `w_weather_city` VALUES ('CN101281406', '广东', '云浮', '云安', 'yunan');
INSERT INTO `w_weather_city` VALUES ('CN101281501', '广东', '潮州', '潮州', 'chaozhou');
INSERT INTO `w_weather_city` VALUES ('CN101281502', '广东', '潮州', '饶平', 'raoping');
INSERT INTO `w_weather_city` VALUES ('CN101281503', '广东', '潮州', '潮安', 'chaoan');
INSERT INTO `w_weather_city` VALUES ('CN101281601', '广东', '东莞', '东莞', 'dongguan');
INSERT INTO `w_weather_city` VALUES ('CN101281701', '广东', '中山', '中山', 'zhongshan');
INSERT INTO `w_weather_city` VALUES ('CN101281801', '广东', '阳江', '阳江', 'yangjiang');
INSERT INTO `w_weather_city` VALUES ('CN101281802', '广东', '阳江', '阳春', 'yangchun');
INSERT INTO `w_weather_city` VALUES ('CN101281803', '广东', '阳江', '阳东', 'yangdong');
INSERT INTO `w_weather_city` VALUES ('CN101281804', '广东', '阳江', '阳西', 'yangxi');
INSERT INTO `w_weather_city` VALUES ('CN101281901', '广东', '揭阳', '揭阳', 'jieyang');
INSERT INTO `w_weather_city` VALUES ('CN101281902', '广东', '揭阳', '揭西', 'jiexi');
INSERT INTO `w_weather_city` VALUES ('CN101281903', '广东', '揭阳', '普宁', 'puning');
INSERT INTO `w_weather_city` VALUES ('CN101281904', '广东', '揭阳', '惠来', 'huilai');
INSERT INTO `w_weather_city` VALUES ('CN101281905', '广东', '揭阳', '揭东', 'jiedong');
INSERT INTO `w_weather_city` VALUES ('CN101282001', '广东', '茂名', '茂名', 'maoming');
INSERT INTO `w_weather_city` VALUES ('CN101282002', '广东', '茂名', '高州', 'gaozhou');
INSERT INTO `w_weather_city` VALUES ('CN101282003', '广东', '茂名', '化州', 'huazhou');
INSERT INTO `w_weather_city` VALUES ('CN101282004', '广东', '茂名', '电白', 'dianbai');
INSERT INTO `w_weather_city` VALUES ('CN101282005', '广东', '茂名', '信宜', 'xinyi');
INSERT INTO `w_weather_city` VALUES ('CN101282006', '广东', '茂名', '茂港', 'maogang');
INSERT INTO `w_weather_city` VALUES ('CN101282101', '广东', '汕尾', '汕尾', 'shanwei');
INSERT INTO `w_weather_city` VALUES ('CN101282102', '广东', '汕尾', '海丰', 'haifeng');
INSERT INTO `w_weather_city` VALUES ('CN101282103', '广东', '汕尾', '陆丰', 'lufeng');
INSERT INTO `w_weather_city` VALUES ('CN101282104', '广东', '汕尾', '陆河', 'luhe');
INSERT INTO `w_weather_city` VALUES ('CN101290101', '云南', '昆明', '昆明', 'kunming');
INSERT INTO `w_weather_city` VALUES ('CN101290103', '云南', '昆明', '东川', 'dongchuan');
INSERT INTO `w_weather_city` VALUES ('CN101290104', '云南', '昆明', '寻甸', 'xundian');
INSERT INTO `w_weather_city` VALUES ('CN101290105', '云南', '昆明', '晋宁', 'jinning');
INSERT INTO `w_weather_city` VALUES ('CN101290106', '云南', '昆明', '宜良', 'yiliang');
INSERT INTO `w_weather_city` VALUES ('CN101290107', '云南', '昆明', '石林', 'shilin');
INSERT INTO `w_weather_city` VALUES ('CN101290108', '云南', '昆明', '呈贡', 'chenggong');
INSERT INTO `w_weather_city` VALUES ('CN101290109', '云南', '昆明', '富民', 'fumin');
INSERT INTO `w_weather_city` VALUES ('CN101290110', '云南', '昆明', '嵩明', 'songming');
INSERT INTO `w_weather_city` VALUES ('CN101290111', '云南', '昆明', '禄劝', 'luquan');
INSERT INTO `w_weather_city` VALUES ('CN101290112', '云南', '昆明', '安宁', 'anning');
INSERT INTO `w_weather_city` VALUES ('CN101290113', '云南', '昆明', '太华山', 'taihuashan');
INSERT INTO `w_weather_city` VALUES ('CN101290201', '云南', '大理', '大理', 'dali');
INSERT INTO `w_weather_city` VALUES ('CN101290202', '云南', '大理', '云龙', 'yunlong');
INSERT INTO `w_weather_city` VALUES ('CN101290203', '云南', '大理', '漾濞', 'yangbi');
INSERT INTO `w_weather_city` VALUES ('CN101290204', '云南', '大理', '永平', 'yongping');
INSERT INTO `w_weather_city` VALUES ('CN101290205', '云南', '大理', '宾川', 'binchuan');
INSERT INTO `w_weather_city` VALUES ('CN101290206', '云南', '大理', '弥渡', 'midu');
INSERT INTO `w_weather_city` VALUES ('CN101290207', '云南', '大理', '祥云', 'xiangyun');
INSERT INTO `w_weather_city` VALUES ('CN101290208', '云南', '大理', '巍山', 'weishan');
INSERT INTO `w_weather_city` VALUES ('CN101290209', '云南', '大理', '剑川', 'jianchuan');
INSERT INTO `w_weather_city` VALUES ('CN101290210', '云南', '大理', '洱源', 'eryuan');
INSERT INTO `w_weather_city` VALUES ('CN101290211', '云南', '大理', '鹤庆', 'heqing');
INSERT INTO `w_weather_city` VALUES ('CN101290212', '云南', '大理', '南涧', 'nanjian');
INSERT INTO `w_weather_city` VALUES ('CN101290301', '云南', '红河', '红河', 'honghe');
INSERT INTO `w_weather_city` VALUES ('CN101290302', '云南', '红河', '石屏', 'shiping');
INSERT INTO `w_weather_city` VALUES ('CN101290303', '云南', '红河', '建水', 'jianshui');
INSERT INTO `w_weather_city` VALUES ('CN101290304', '云南', '红河', '弥勒', 'mile');
INSERT INTO `w_weather_city` VALUES ('CN101290305', '云南', '红河', '元阳', 'yuanyang');
INSERT INTO `w_weather_city` VALUES ('CN101290306', '云南', '红河', '绿春', 'lvchun');
INSERT INTO `w_weather_city` VALUES ('CN101290307', '云南', '红河', '开远', 'kaiyuan');
INSERT INTO `w_weather_city` VALUES ('CN101290308', '云南', '红河', '个旧', 'gejiu');
INSERT INTO `w_weather_city` VALUES ('CN101290309', '云南', '红河', '蒙自', 'mengzi');
INSERT INTO `w_weather_city` VALUES ('CN101290310', '云南', '红河', '屏边', 'pingbian');
INSERT INTO `w_weather_city` VALUES ('CN101290311', '云南', '红河', '泸西', 'luxi');
INSERT INTO `w_weather_city` VALUES ('CN101290312', '云南', '红河', '金平', 'jinping');
INSERT INTO `w_weather_city` VALUES ('CN101290313', '云南', '红河', '河口', 'hekou');
INSERT INTO `w_weather_city` VALUES ('CN101290401', '云南', '曲靖', '曲靖', 'qujing');
INSERT INTO `w_weather_city` VALUES ('CN101290402', '云南', '曲靖', '沾益', 'zhanyi');
INSERT INTO `w_weather_city` VALUES ('CN101290403', '云南', '曲靖', '陆良', 'luliang');
INSERT INTO `w_weather_city` VALUES ('CN101290404', '云南', '曲靖', '富源', 'fuyuan');
INSERT INTO `w_weather_city` VALUES ('CN101290405', '云南', '曲靖', '马龙', 'malong');
INSERT INTO `w_weather_city` VALUES ('CN101290406', '云南', '曲靖', '师宗', 'shizong');
INSERT INTO `w_weather_city` VALUES ('CN101290407', '云南', '曲靖', '罗平', 'luoping');
INSERT INTO `w_weather_city` VALUES ('CN101290408', '云南', '曲靖', '会泽', 'huize');
INSERT INTO `w_weather_city` VALUES ('CN101290409', '云南', '曲靖', '宣威', 'xuanwei');
INSERT INTO `w_weather_city` VALUES ('CN101290501', '云南', '保山', '保山', 'baoshan');
INSERT INTO `w_weather_city` VALUES ('CN101290503', '云南', '保山', '龙陵', 'longling');
INSERT INTO `w_weather_city` VALUES ('CN101290504', '云南', '保山', '施甸', 'sidian');
INSERT INTO `w_weather_city` VALUES ('CN101290505', '云南', '保山', '昌宁', 'changning');
INSERT INTO `w_weather_city` VALUES ('CN101290506', '云南', '保山', '腾冲', 'tengchong');
INSERT INTO `w_weather_city` VALUES ('CN101290601', '云南', '文山', '文山', 'wenshan');
INSERT INTO `w_weather_city` VALUES ('CN101290602', '云南', '文山', '西畴', 'xichou');
INSERT INTO `w_weather_city` VALUES ('CN101290603', '云南', '文山', '马关', 'maguan');
INSERT INTO `w_weather_city` VALUES ('CN101290604', '云南', '文山', '麻栗坡', 'malipo');
INSERT INTO `w_weather_city` VALUES ('CN101290605', '云南', '文山', '砚山', 'yanshan');
INSERT INTO `w_weather_city` VALUES ('CN101290606', '云南', '文山', '丘北', 'qiubei');
INSERT INTO `w_weather_city` VALUES ('CN101290607', '云南', '文山', '广南', 'guangnan');
INSERT INTO `w_weather_city` VALUES ('CN101290608', '云南', '文山', '富宁', 'funing');
INSERT INTO `w_weather_city` VALUES ('CN101290701', '云南', '玉溪', '玉溪', 'yuxi');
INSERT INTO `w_weather_city` VALUES ('CN101290702', '云南', '玉溪', '澄江', 'chengjiang');
INSERT INTO `w_weather_city` VALUES ('CN101290703', '云南', '玉溪', '江川', 'jiangchuan');
INSERT INTO `w_weather_city` VALUES ('CN101290704', '云南', '玉溪', '通海', 'tonghai');
INSERT INTO `w_weather_city` VALUES ('CN101290705', '云南', '玉溪', '华宁', 'huaning');
INSERT INTO `w_weather_city` VALUES ('CN101290706', '云南', '玉溪', '新平', 'xinping');
INSERT INTO `w_weather_city` VALUES ('CN101290707', '云南', '玉溪', '易门', 'yimen');
INSERT INTO `w_weather_city` VALUES ('CN101290708', '云南', '玉溪', '峨山', 'eshan');
INSERT INTO `w_weather_city` VALUES ('CN101290709', '云南', '玉溪', '元江', 'yuanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101290801', '云南', '楚雄', '楚雄', 'chuxiong');
INSERT INTO `w_weather_city` VALUES ('CN101290802', '云南', '楚雄', '大姚', 'dayao');
INSERT INTO `w_weather_city` VALUES ('CN101290803', '云南', '楚雄', '元谋', 'yuanmou');
INSERT INTO `w_weather_city` VALUES ('CN101290804', '云南', '楚雄', '姚安', 'yaoan');
INSERT INTO `w_weather_city` VALUES ('CN101290805', '云南', '楚雄', '牟定', 'mouding');
INSERT INTO `w_weather_city` VALUES ('CN101290806', '云南', '楚雄', '南华', 'nanhua');
INSERT INTO `w_weather_city` VALUES ('CN101290807', '云南', '楚雄', '武定', 'wuding');
INSERT INTO `w_weather_city` VALUES ('CN101290808', '云南', '楚雄', '禄丰', 'lufeng');
INSERT INTO `w_weather_city` VALUES ('CN101290809', '云南', '楚雄', '双柏', 'shuangbai');
INSERT INTO `w_weather_city` VALUES ('CN101290810', '云南', '楚雄', '永仁', 'yongren');
INSERT INTO `w_weather_city` VALUES ('CN101290901', '云南', '普洱', '普洱', 'puer');
INSERT INTO `w_weather_city` VALUES ('CN101290902', '云南', '普洱', '景谷', 'jinggu');
INSERT INTO `w_weather_city` VALUES ('CN101290903', '云南', '普洱', '景东', 'jingdong');
INSERT INTO `w_weather_city` VALUES ('CN101290904', '云南', '普洱', '澜沧', 'lancang');
INSERT INTO `w_weather_city` VALUES ('CN101290906', '云南', '普洱', '墨江', 'mojiang');
INSERT INTO `w_weather_city` VALUES ('CN101290907', '云南', '普洱', '江城', 'jiangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101290908', '云南', '普洱', '孟连', 'menglian');
INSERT INTO `w_weather_city` VALUES ('CN101290909', '云南', '普洱', '西盟', 'ximeng');
INSERT INTO `w_weather_city` VALUES ('CN101290911', '云南', '普洱', '镇沅', 'zhenyuan');
INSERT INTO `w_weather_city` VALUES ('CN101290912', '云南', '普洱', '宁洱', 'ninger');
INSERT INTO `w_weather_city` VALUES ('CN101291001', '云南', '昭通', '昭通', 'zhaotong');
INSERT INTO `w_weather_city` VALUES ('CN101291002', '云南', '昭通', '鲁甸', 'ludian');
INSERT INTO `w_weather_city` VALUES ('CN101291003', '云南', '昭通', '彝良', 'yiliang');
INSERT INTO `w_weather_city` VALUES ('CN101291004', '云南', '昭通', '镇雄', 'zhenxiong');
INSERT INTO `w_weather_city` VALUES ('CN101291005', '云南', '昭通', '威信', 'weixin');
INSERT INTO `w_weather_city` VALUES ('CN101291006', '云南', '昭通', '巧家', 'qiaojia');
INSERT INTO `w_weather_city` VALUES ('CN101291007', '云南', '昭通', '绥江', 'suijiang');
INSERT INTO `w_weather_city` VALUES ('CN101291008', '云南', '昭通', '永善', 'yongshan');
INSERT INTO `w_weather_city` VALUES ('CN101291009', '云南', '昭通', '盐津', 'yanjin');
INSERT INTO `w_weather_city` VALUES ('CN101291010', '云南', '昭通', '大关', 'daguan');
INSERT INTO `w_weather_city` VALUES ('CN101291011', '云南', '昭通', '水富', 'shuifu');
INSERT INTO `w_weather_city` VALUES ('CN101291101', '云南', '临沧', '临沧', 'lincang');
INSERT INTO `w_weather_city` VALUES ('CN101291102', '云南', '临沧', '沧源', 'cangyuan');
INSERT INTO `w_weather_city` VALUES ('CN101291103', '云南', '临沧', '耿马', 'gengma');
INSERT INTO `w_weather_city` VALUES ('CN101291104', '云南', '临沧', '双江', 'shuangjiang');
INSERT INTO `w_weather_city` VALUES ('CN101291105', '云南', '临沧', '凤庆', 'fengqing');
INSERT INTO `w_weather_city` VALUES ('CN101291106', '云南', '临沧', '永德', 'yongde');
INSERT INTO `w_weather_city` VALUES ('CN101291107', '云南', '临沧', '云县', 'yunxian');
INSERT INTO `w_weather_city` VALUES ('CN101291108', '云南', '临沧', '镇康', 'zhenkang');
INSERT INTO `w_weather_city` VALUES ('CN101291201', '云南', '怒江', '怒江', 'nujiang');
INSERT INTO `w_weather_city` VALUES ('CN101291203', '云南', '怒江', '福贡', 'fugong');
INSERT INTO `w_weather_city` VALUES ('CN101291204', '云南', '怒江', '兰坪', 'lanping');
INSERT INTO `w_weather_city` VALUES ('CN101291205', '云南', '怒江', '泸水', 'lushui');
INSERT INTO `w_weather_city` VALUES ('CN101291206', '云南', '怒江', '六库', 'liuku');
INSERT INTO `w_weather_city` VALUES ('CN101291207', '云南', '怒江', '贡山', 'gongshan');
INSERT INTO `w_weather_city` VALUES ('CN101291301', '云南', '迪庆', '香格里拉', 'xianggelila');
INSERT INTO `w_weather_city` VALUES ('CN101291302', '云南', '迪庆', '德钦', 'deqin');
INSERT INTO `w_weather_city` VALUES ('CN101291303', '云南', '迪庆', '维西', 'weixi');
INSERT INTO `w_weather_city` VALUES ('CN101291304', '云南', '迪庆', '中甸', 'zhongdian');
INSERT INTO `w_weather_city` VALUES ('CN101291401', '云南', '丽江', '丽江', 'lijiang');
INSERT INTO `w_weather_city` VALUES ('CN101291402', '云南', '丽江', '永胜', 'yongsheng');
INSERT INTO `w_weather_city` VALUES ('CN101291403', '云南', '丽江', '华坪', 'huaping');
INSERT INTO `w_weather_city` VALUES ('CN101291404', '云南', '丽江', '宁蒗', 'ninglang');
INSERT INTO `w_weather_city` VALUES ('CN101291501', '云南', '德宏', '德宏', 'dehong');
INSERT INTO `w_weather_city` VALUES ('CN101291503', '云南', '德宏', '陇川', 'longchuan');
INSERT INTO `w_weather_city` VALUES ('CN101291504', '云南', '德宏', '盈江', 'yingjiang');
INSERT INTO `w_weather_city` VALUES ('CN101291506', '云南', '德宏', '瑞丽', 'ruili');
INSERT INTO `w_weather_city` VALUES ('CN101291507', '云南', '德宏', '梁河', 'lianghe');
INSERT INTO `w_weather_city` VALUES ('CN101291508', '云南', '德宏', '芒市', 'luxi');
INSERT INTO `w_weather_city` VALUES ('CN101291601', '云南', '西双版纳', '景洪', 'jinghong');
INSERT INTO `w_weather_city` VALUES ('CN101291603', '云南', '西双版纳', '勐海', 'menghai');
INSERT INTO `w_weather_city` VALUES ('CN101291605', '云南', '西双版纳', '勐腊', 'mengla');
INSERT INTO `w_weather_city` VALUES ('CN101300101', '广西', '南宁', '南宁', 'nanning');
INSERT INTO `w_weather_city` VALUES ('CN101300103', '广西', '南宁', '邕宁', 'yongning');
INSERT INTO `w_weather_city` VALUES ('CN101300104', '广西', '南宁', '横县', 'hengxian');
INSERT INTO `w_weather_city` VALUES ('CN101300105', '广西', '南宁', '隆安', 'longan');
INSERT INTO `w_weather_city` VALUES ('CN101300106', '广西', '南宁', '马山', 'mashan');
INSERT INTO `w_weather_city` VALUES ('CN101300107', '广西', '南宁', '上林', 'shanglin');
INSERT INTO `w_weather_city` VALUES ('CN101300108', '广西', '南宁', '武鸣', 'wuming');
INSERT INTO `w_weather_city` VALUES ('CN101300109', '广西', '南宁', '宾阳', 'binyang');
INSERT INTO `w_weather_city` VALUES ('CN101300201', '广西', '崇左', '崇左', 'chongzuo');
INSERT INTO `w_weather_city` VALUES ('CN101300202', '广西', '崇左', '天等', 'tiandeng');
INSERT INTO `w_weather_city` VALUES ('CN101300203', '广西', '崇左', '龙州', 'longzhou');
INSERT INTO `w_weather_city` VALUES ('CN101300204', '广西', '崇左', '凭祥', 'pingxiang');
INSERT INTO `w_weather_city` VALUES ('CN101300205', '广西', '崇左', '大新', 'daxin');
INSERT INTO `w_weather_city` VALUES ('CN101300206', '广西', '崇左', '扶绥', 'fusui');
INSERT INTO `w_weather_city` VALUES ('CN101300207', '广西', '崇左', '宁明', 'ningming');
INSERT INTO `w_weather_city` VALUES ('CN101300301', '广西', '柳州', '柳州', 'liuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101300302', '广西', '柳州', '柳城', 'liucheng');
INSERT INTO `w_weather_city` VALUES ('CN101300304', '广西', '柳州', '鹿寨', 'luzhai');
INSERT INTO `w_weather_city` VALUES ('CN101300305', '广西', '柳州', '柳江', 'liujiang');
INSERT INTO `w_weather_city` VALUES ('CN101300306', '广西', '柳州', '融安', 'rongan');
INSERT INTO `w_weather_city` VALUES ('CN101300307', '广西', '柳州', '融水', 'rongshui');
INSERT INTO `w_weather_city` VALUES ('CN101300308', '广西', '柳州', '三江', 'sanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101300401', '广西', '来宾', '来宾', 'laibin');
INSERT INTO `w_weather_city` VALUES ('CN101300402', '广西', '来宾', '忻城', 'xicheng');
INSERT INTO `w_weather_city` VALUES ('CN101300403', '广西', '来宾', '金秀', 'jinxiu');
INSERT INTO `w_weather_city` VALUES ('CN101300404', '广西', '来宾', '象州', 'xiangzhou');
INSERT INTO `w_weather_city` VALUES ('CN101300405', '广西', '来宾', '武宣', 'wuxuan');
INSERT INTO `w_weather_city` VALUES ('CN101300406', '广西', '来宾', '合山', 'heshan');
INSERT INTO `w_weather_city` VALUES ('CN101300501', '广西', '桂林', '桂林', 'guilin');
INSERT INTO `w_weather_city` VALUES ('CN101300503', '广西', '桂林', '龙胜', 'longsheng');
INSERT INTO `w_weather_city` VALUES ('CN101300504', '广西', '桂林', '永福', 'yongfu');
INSERT INTO `w_weather_city` VALUES ('CN101300505', '广西', '桂林', '临桂', 'lingui');
INSERT INTO `w_weather_city` VALUES ('CN101300506', '广西', '桂林', '兴安', 'xingan');
INSERT INTO `w_weather_city` VALUES ('CN101300507', '广西', '桂林', '灵川', 'lingchuan');
INSERT INTO `w_weather_city` VALUES ('CN101300508', '广西', '桂林', '全州', 'quanzhou');
INSERT INTO `w_weather_city` VALUES ('CN101300509', '广西', '桂林', '灌阳', 'guanyang');
INSERT INTO `w_weather_city` VALUES ('CN101300510', '广西', '桂林', '阳朔', 'yangshuo');
INSERT INTO `w_weather_city` VALUES ('CN101300511', '广西', '桂林', '恭城', 'gongcheng');
INSERT INTO `w_weather_city` VALUES ('CN101300512', '广西', '桂林', '平乐', 'pingle');
INSERT INTO `w_weather_city` VALUES ('CN101300513', '广西', '桂林', '荔浦', 'lipu');
INSERT INTO `w_weather_city` VALUES ('CN101300514', '广西', '桂林', '资源', 'ziyuan');
INSERT INTO `w_weather_city` VALUES ('CN101300601', '广西', '梧州', '梧州', 'wuzhou');
INSERT INTO `w_weather_city` VALUES ('CN101300602', '广西', '梧州', '藤县', 'tengxian');
INSERT INTO `w_weather_city` VALUES ('CN101300604', '广西', '梧州', '苍梧', 'cangwu');
INSERT INTO `w_weather_city` VALUES ('CN101300605', '广西', '梧州', '蒙山', 'mengshan');
INSERT INTO `w_weather_city` VALUES ('CN101300606', '广西', '梧州', '岑溪', 'cenxi');
INSERT INTO `w_weather_city` VALUES ('CN101300701', '广西', '贺州', '贺州', 'hezhou');
INSERT INTO `w_weather_city` VALUES ('CN101300702', '广西', '贺州', '昭平', 'zhaoping');
INSERT INTO `w_weather_city` VALUES ('CN101300703', '广西', '贺州', '富川', 'fuchuan');
INSERT INTO `w_weather_city` VALUES ('CN101300704', '广西', '贺州', '钟山', 'zhongshan');
INSERT INTO `w_weather_city` VALUES ('CN101300801', '广西', '贵港', '贵港', 'guigang');
INSERT INTO `w_weather_city` VALUES ('CN101300802', '广西', '贵港', '桂平', 'guiping');
INSERT INTO `w_weather_city` VALUES ('CN101300803', '广西', '贵港', '平南', 'pingnan');
INSERT INTO `w_weather_city` VALUES ('CN101300901', '广西', '玉林', '玉林', 'yulin');
INSERT INTO `w_weather_city` VALUES ('CN101300902', '广西', '玉林', '博白', 'bobai');
INSERT INTO `w_weather_city` VALUES ('CN101300903', '广西', '玉林', '北流', 'beiliu');
INSERT INTO `w_weather_city` VALUES ('CN101300904', '广西', '玉林', '容县', 'rongxian');
INSERT INTO `w_weather_city` VALUES ('CN101300905', '广西', '玉林', '陆川', 'luchuan');
INSERT INTO `w_weather_city` VALUES ('CN101300906', '广西', '玉林', '兴业', 'xingye');
INSERT INTO `w_weather_city` VALUES ('CN101301001', '广西', '百色', '百色', 'baise');
INSERT INTO `w_weather_city` VALUES ('CN101301002', '广西', '百色', '那坡', 'napo');
INSERT INTO `w_weather_city` VALUES ('CN101301003', '广西', '百色', '田阳', 'tianyang');
INSERT INTO `w_weather_city` VALUES ('CN101301004', '广西', '百色', '德保', 'debao');
INSERT INTO `w_weather_city` VALUES ('CN101301005', '广西', '百色', '靖西', 'jingxi');
INSERT INTO `w_weather_city` VALUES ('CN101301006', '广西', '百色', '田东', 'tiandong');
INSERT INTO `w_weather_city` VALUES ('CN101301007', '广西', '百色', '平果', 'pingguo');
INSERT INTO `w_weather_city` VALUES ('CN101301008', '广西', '百色', '隆林', 'longlin');
INSERT INTO `w_weather_city` VALUES ('CN101301009', '广西', '百色', '西林', 'xilin');
INSERT INTO `w_weather_city` VALUES ('CN101301010', '广西', '百色', '乐业', 'leye');
INSERT INTO `w_weather_city` VALUES ('CN101301011', '广西', '百色', '凌云', 'lingyun');
INSERT INTO `w_weather_city` VALUES ('CN101301012', '广西', '百色', '田林', 'tianlin');
INSERT INTO `w_weather_city` VALUES ('CN101301101', '广西', '钦州', '钦州', 'qinzhou');
INSERT INTO `w_weather_city` VALUES ('CN101301102', '广西', '钦州', '浦北', 'pubei');
INSERT INTO `w_weather_city` VALUES ('CN101301103', '广西', '钦州', '灵山', 'lingshan');
INSERT INTO `w_weather_city` VALUES ('CN101301201', '广西', '河池', '河池', 'hechi');
INSERT INTO `w_weather_city` VALUES ('CN101301202', '广西', '河池', '天峨', 'tiane');
INSERT INTO `w_weather_city` VALUES ('CN101301203', '广西', '河池', '东兰', 'donglan');
INSERT INTO `w_weather_city` VALUES ('CN101301204', '广西', '河池', '巴马', 'bama');
INSERT INTO `w_weather_city` VALUES ('CN101301205', '广西', '河池', '环江', 'huanjiang');
INSERT INTO `w_weather_city` VALUES ('CN101301206', '广西', '河池', '罗城', 'luocheng');
INSERT INTO `w_weather_city` VALUES ('CN101301207', '广西', '河池', '宜州', 'yizhou');
INSERT INTO `w_weather_city` VALUES ('CN101301208', '广西', '河池', '凤山', 'fengshan');
INSERT INTO `w_weather_city` VALUES ('CN101301209', '广西', '河池', '南丹', 'nandan');
INSERT INTO `w_weather_city` VALUES ('CN101301210', '广西', '河池', '都安', 'andu');
INSERT INTO `w_weather_city` VALUES ('CN101301211', '广西', '河池', '大化', 'dahua');
INSERT INTO `w_weather_city` VALUES ('CN101301301', '广西', '北海', '北海', 'beihai');
INSERT INTO `w_weather_city` VALUES ('CN101301302', '广西', '北海', '合浦', 'hepu');
INSERT INTO `w_weather_city` VALUES ('CN101301303', '广西', '北海', '涠洲岛', 'weizhoudao');
INSERT INTO `w_weather_city` VALUES ('CN101301401', '广西', '防城港', '防城港', 'fangchenggang');
INSERT INTO `w_weather_city` VALUES ('CN101301402', '广西', '防城港', '上思', 'shangsi');
INSERT INTO `w_weather_city` VALUES ('CN101301403', '广西', '防城港', '东兴', 'dongxing');
INSERT INTO `w_weather_city` VALUES ('CN101301405', '广西', '防城港', '防城', 'fangcheng');
INSERT INTO `w_weather_city` VALUES ('CN101310101', '海南', '海口', '海口', 'haikou');
INSERT INTO `w_weather_city` VALUES ('CN101310201', '海南', '三亚', '三亚', 'sanya');
INSERT INTO `w_weather_city` VALUES ('CN101310202', '海南', '东方', '东方', 'dongfang');
INSERT INTO `w_weather_city` VALUES ('CN101310203', '海南', '临高', '临高', 'lingao');
INSERT INTO `w_weather_city` VALUES ('CN101310204', '海南', '澄迈', '澄迈', 'chengmai');
INSERT INTO `w_weather_city` VALUES ('CN101310205', '海南', '儋州', '儋州', 'danzhou');
INSERT INTO `w_weather_city` VALUES ('CN101310206', '海南', '昌江', '昌江', 'changjiang');
INSERT INTO `w_weather_city` VALUES ('CN101310207', '海南', '白沙', '白沙', 'baisha');
INSERT INTO `w_weather_city` VALUES ('CN101310208', '海南', '琼中', '琼中', 'qiongzhong');
INSERT INTO `w_weather_city` VALUES ('CN101310209', '海南', '定安', '定安', 'dingan');
INSERT INTO `w_weather_city` VALUES ('CN101310210', '海南', '屯昌', '屯昌', 'tunchang');
INSERT INTO `w_weather_city` VALUES ('CN101310211', '海南', '琼海', '琼海', 'qionghai');
INSERT INTO `w_weather_city` VALUES ('CN101310212', '海南', '文昌', '文昌', 'wenchang');
INSERT INTO `w_weather_city` VALUES ('CN101310214', '海南', '保亭', '保亭', 'baoting');
INSERT INTO `w_weather_city` VALUES ('CN101310215', '海南', '万宁', '万宁', 'wanning');
INSERT INTO `w_weather_city` VALUES ('CN101310216', '海南', '陵水', '陵水', 'lingshui');
INSERT INTO `w_weather_city` VALUES ('CN101310217', '海南', '西沙', '西沙', 'xisha');
INSERT INTO `w_weather_city` VALUES ('CN101310220', '海南', '南沙', '南沙', 'nansha');
INSERT INTO `w_weather_city` VALUES ('CN101310221', '海南', '乐东', '乐东', 'ledong');
INSERT INTO `w_weather_city` VALUES ('CN101310222', '海南', '五指山', '五指山', 'wuzhishan');
INSERT INTO `w_weather_city` VALUES ('CN101310224', '海南', '中沙', '中沙', 'zhongsha');
INSERT INTO `w_weather_city` VALUES ('CN101310230', '海南', '南子岛', '南子岛', 'nanzidao');
INSERT INTO `w_weather_city` VALUES ('CN101320101', '香港', '香港', '香港', 'hongkong');
INSERT INTO `w_weather_city` VALUES ('CN101320102', '香港', '香港', '九龙', 'jiulong');
INSERT INTO `w_weather_city` VALUES ('CN101320103', '香港', '香港', '新界', 'xinjie');
INSERT INTO `w_weather_city` VALUES ('CN101330101', '澳门', '澳门', '澳门', 'macao');
INSERT INTO `w_weather_city` VALUES ('CN101330102', '澳门', '澳门', '氹仔岛', 'dangzidao');
INSERT INTO `w_weather_city` VALUES ('CN101330103', '澳门', '澳门', '路环岛', 'luhuandao');
INSERT INTO `w_weather_city` VALUES ('CN101340101', '台湾', '台北', '台北', 'taibeixian');
INSERT INTO `w_weather_city` VALUES ('CN101340102', '台湾', '台北', '桃园', 'taoyuan');
INSERT INTO `w_weather_city` VALUES ('CN101340103', '台湾', '台北', '新竹', 'xinzhu');
INSERT INTO `w_weather_city` VALUES ('CN101340104', '台湾', '台北', '宜兰', 'yilan');
INSERT INTO `w_weather_city` VALUES ('CN101340201', '台湾', '高雄', '高雄', 'gaoxiong');
INSERT INTO `w_weather_city` VALUES ('CN101340202', '台湾', '高雄', '嘉义', 'jiayi');
INSERT INTO `w_weather_city` VALUES ('CN101340203', '台湾', '高雄', '台南', 'tainan');
INSERT INTO `w_weather_city` VALUES ('CN101340204', '台湾', '高雄', '台东', 'taidong');
INSERT INTO `w_weather_city` VALUES ('CN101340205', '台湾', '高雄', '屏东', 'pingdong');
INSERT INTO `w_weather_city` VALUES ('CN101340401', '台湾', '台中', '台中', 'taizhong');
INSERT INTO `w_weather_city` VALUES ('CN101340402', '台湾', '台中', '苗栗', 'miaoli');
INSERT INTO `w_weather_city` VALUES ('CN101340403', '台湾', '台中', '彰化', 'zhanghua');
INSERT INTO `w_weather_city` VALUES ('CN101340404', '台湾', '台中', '南投', 'nantou');
INSERT INTO `w_weather_city` VALUES ('CN101340405', '台湾', '台中', '花莲', 'hualian');
INSERT INTO `w_weather_city` VALUES ('CN101340406', '台湾', '台中', '云林', 'yunlin');

-- ----------------------------
-- Table structure for w_weather_data
-- ----------------------------
DROP TABLE IF EXISTS `w_weather_data`;
CREATE TABLE `w_weather_data` (
  `weather_city_code` varchar(16) NOT NULL COMMENT '城市编码',
  `collect_date` date NOT NULL COMMENT '采集日期',
  `cond_code` varchar(10) DEFAULT NULL COMMENT '天气状况代码',
  `cond_code_url` varchar(255) DEFAULT NULL COMMENT '天气状况图标',
  `cond_txt` varchar(100) DEFAULT NULL COMMENT '天气状况描述',
  `fl` varchar(20) DEFAULT NULL COMMENT '体感温度',
  `hum` varchar(20) DEFAULT NULL COMMENT '相对湿度（%）',
  `pcpn` varchar(20) DEFAULT NULL COMMENT '降水量（mm）',
  `pres` varchar(20) DEFAULT NULL COMMENT '气压',
  `tmp` varchar(20) DEFAULT NULL COMMENT '温度',
  `vis` varchar(20) DEFAULT NULL COMMENT '能见度（km）',
  `wind_deg` varchar(20) DEFAULT NULL COMMENT '风向（360度）',
  `wind_dir` varchar(20) DEFAULT NULL COMMENT '风向',
  `wind_sc` varchar(20) DEFAULT NULL COMMENT '风力',
  `wind_spd` varchar(20) DEFAULT NULL COMMENT '风速（kmph）',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`weather_city_code`,`collect_date`),
  UNIQUE KEY `weather_city_code` (`weather_city_code`,`collect_date`) USING BTREE,
  CONSTRAINT `w_weather_data_ibfk_1` FOREIGN KEY (`weather_city_code`) REFERENCES `w_weather_city` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市天气数据';

-- ----------------------------
-- Records of w_weather_data
-- ----------------------------
INSERT INTO `w_weather_data` VALUES ('CN101010100', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '63', '0', '1022', '0', '4', '80', '西南风', '3-4', '13', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010100', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '61', '0', '1022', '-2', '10', '110', '东风', '4-5', '20', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101010200', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '70', '0', '1022', '-2', '4', '80', '北风', '微风', '3', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010200', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '81', '0', '1022', '-6', '10', '110', '东北风', '3-4', '16', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101010300', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '53', '0', '1022', '0', '4', '80', '东北风', '3-4', '10', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010300', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '64', '0', '1022', '-4', '10', '110', '东风', '3-4', '12', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101010400', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '50', '0', '1022', '0', '4', '80', '北风', '3-4', '11', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010400', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '63', '0', '1022', '-4', '10', '110', '东北风', '3-4', '11', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101010500', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '55', '0', '1022', '-2', '4', '80', '西北风', '3-4', '16', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010500', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '76', '0', '1022', '-7', '10', '110', '西北风', '3-4', '14', '2016-12-17 09:36:02');
INSERT INTO `w_weather_data` VALUES ('CN101010600', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '73', '0', '1022', '-2', '4', '80', '东南风', '3-4', '15', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010600', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '83', '0', '1022', '-6', '10', '110', '北风', '3-4', '10', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101010700', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '46', '0', '1022', '-1', '4', '80', '西北风', '3-4', '15', '2016-12-16 22:51:01');
INSERT INTO `w_weather_data` VALUES ('CN101010700', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '67', '0', '1022', '-5', '10', '110', '北风', '3-4', '15', '2016-12-17 09:36:04');
INSERT INTO `w_weather_data` VALUES ('CN101010800', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-6', '39', '0', '1022', '-2', '4', '80', '东风', '4-5', '22', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010800', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '68', '0', '1022', '-9', '10', '110', '东北风', '3-4', '11', '2016-12-17 09:36:02');
INSERT INTO `w_weather_data` VALUES ('CN101010900', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '67', '0', '1022', '-1', '4', '80', '西风', '3-4', '15', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101010900', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '77', '0', '1022', '-5', '10', '110', '南风', '3-4', '14', '2016-12-17 09:36:02');
INSERT INTO `w_weather_data` VALUES ('CN101011000', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '60', '0', '1022', '-1', '4', '80', '北风', '3-4', '16', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101011000', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '74', '0', '1022', '-5', '10', '110', '东风', '3-4', '11', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101011100', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '73', '0', '1022', '-2', '4', '80', '南风', '3-4', '14', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101011100', '2016-12-17', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-9', '87', '0', '1022', '-6', '10', '110', '东北风', '3-4', '15', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101011200', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-10', '65', '0', '1025', '-2', '10', '164', '北风', '微风', '8', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101011200', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '70', '0', '1024', '-6', '10', '168', '北风', '3-4', '11', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101011300', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '59', '0', '1022', '-5', '4', '80', '东南风', '3-4', '16', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101011300', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '72', '0', '1022', '-6', '10', '110', '东风', '4-5', '20', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101011400', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '52', '0', '1022', '-1', '4', '80', '东北风', '4-5', '17', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101011400', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '52', '0', '1022', '-2', '10', '110', '东北风', '4-5', '17', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101011500', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '54', '0', '1024', '-2', '10', '296', '东北风', '4-5', '20', '2016-12-16 22:51:00');
INSERT INTO `w_weather_data` VALUES ('CN101011500', '2016-12-17', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '88', '0', '1023', '-8', '10', '331', '东风', '3-4', '16', '2016-12-17 09:36:03');
INSERT INTO `w_weather_data` VALUES ('CN101020100', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '2', '64', '0', '1031', '4', '4', '210', '北风', '微风', '4', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101020200', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '87', '0', '1031', '2', '4', '210', '北风', '微风', '9', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101020300', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '87', '0', '1031', '2', '4', '210', '北风', '微风', '0', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101020500', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '87', '0', '1031', '2', '4', '210', '南风', '3-4', '14', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101020600', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '89', '0', '1031', '2', '4', '210', '北风', '微风', '10', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101020700', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '91', '0', '1031', '2', '4', '210', '北风', '微风', '5', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101020800', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '94', '0', '1031', '1', '4', '210', '北风', '微风', '7', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101020900', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '90', '0', '1031', '2', '4', '210', '北风', '微风', '5', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101021000', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '95', '0', '1031', '0', '4', '210', '北风', '微风', '2', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101021100', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '2', '95', '0', '1031', '0', '4', '210', '东南风', '3-4', '14', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101021200', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '2', '64', '0', '1031', '4', '4', '210', '北风', '微风', '4', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101030100', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '51', '0', '1023', '4', '3', '240', '西南风', '3-4', '13', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101030200', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '83', '0', '1023', '-2', '3', '240', '北风', '微风', '5', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101030300', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '3', '86', '0', '1023', '-5', '3', '240', '东风', '3-4', '16', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101030400', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '53', '0', '1023', '3', '3', '240', '西南风', '4-5', '23', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101030500', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '64', '0', '1023', '1', '3', '240', '东南风', '4-5', '21', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101030600', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '57', '0', '1023', '4', '3', '240', '西南风', '4-5', '18', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101030700', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '66', '0', '1023', '1', '3', '240', '南风', '3-4', '15', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101030900', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '60', '0', '1023', '3', '3', '240', '南风', '4-5', '18', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101031000', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '53', '0', '1023', '3', '3', '240', '东南风', '3-4', '10', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101031100', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '49', '0', '1023', '4', '3', '240', '西南风', '4-5', '22', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101031400', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '45', '0', '1022', '1', '4', '80', '北风', '3-4', '10', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101040100', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '75', '0', '1024', '10', '8', '10', '西北风', '4-5', '17', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101040200', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '79', '0', '1024', '9', '8', '10', '东北风', '3-4', '16', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101040300', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '83', '0', '1024', '9', '8', '10', '东北风', '5-6', '30', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101040400', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '81', '0', '1025', '7', '10', '126', '北风', '3-4', '14', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101040500', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '74', '0', '1024', '10', '8', '10', '东北风', '4-5', '21', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101040600', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '52', '0', '1024', '9', '10', '128', '北风', '3-4', '10', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101040700', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '75', '0', '1024', '9', '8', '10', '东北风', '5-6', '25', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101040800', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '87', '0', '1024', '8', '8', '10', '西风', '3-4', '15', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101040900', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '73', '0', '1024', '9', '8', '10', '北风', '4-5', '19', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101041000', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '80', '0', '1024', '9', '8', '10', '东北风', '3-4', '14', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101041100', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '68', '0', '1029', '5', '10', '137', '西北风', '3-4', '16', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101041300', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '88', '0', '1025', '7', '10', '105', '南风', '3-4', '14', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101041400', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '77', '0', '1024', '9', '8', '10', '东风', '4-5', '18', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101041500', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '77', '0', '1025', '9', '10', '46', '北风', '微风', '0', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101041600', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '72', '0', '1025', '5', '10', '223', '南风', '3-4', '15', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101041700', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '83', '0', '1026', '9', '10', '35', '西北风', '4-5', '20', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101041800', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '87', '0', '1026', '5', '10', '113', '北风', '微风', '2', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101041900', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '74', '0', '1026', '9', '10', '113', '南风', '3-4', '14', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101042000', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '73', '0', '1026', '9', '10', '115', '西南风', '3-4', '10', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101042100', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '93', '0', '1024', '9', '8', '10', '北风', '3-4', '14', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101042200', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '82', '0', '1025', '8', '10', '105', '北风', '微风', '6', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101042300', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '92', '0', '1025', '4', '10', '62', '北风', '3-4', '11', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101042400', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '85', '0', '1025', '9', '10', '105', '西风', '4-5', '21', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101042500', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '78', '0', '1025', '5', '10', '105', '西风', '3-4', '15', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101042600', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '89', '0', '1024', '9', '8', '10', '东风', '3-4', '16', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101042700', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '94', '0', '1024', '9', '10', '60', '东北风', '4-5', '18', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101042800', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '85', '0', '1024', '9', '8', '10', '东北风', '4-5', '18', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101042900', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '80', '0', '1024', '9', '8', '10', '北风', '4-5', '22', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101043000', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '66', '0', '1025', '10', '10', '105', '东北风', '4-5', '22', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101043100', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '73', '0', '1024', '7', '8', '10', '东风', '3-4', '12', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101043200', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '76', '0', '1026', '6', '10', '146', '东南风', '3-4', '14', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101043300', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '65', '0', '1024', '9', '10', '128', '东北风', '4-5', '23', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101043400', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '78', '0', '1027', '3', '10', '85', '北风', '4-5', '21', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101043600', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '69', '0', '1027', '5', '10', '85', '东南风', '4-5', '22', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101050101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '86', '0', '1019', '-16', '3', '210', '西风', '3-4', '13', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101050102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '73', '0', '1019', '-14', '3', '210', '西风', '4-5', '21', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101050103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '81', '0', '1019', '-22', '3', '210', '西南风', '3-4', '16', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101050104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '83', '0', '1019', '-17', '3', '210', '南风', '3-4', '16', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101050105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '73', '0', '1019', '-13', '3', '210', '西风', '4-5', '20', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101050106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '63', '0', '1020', '-15', '10', '256', '西风', '6-7', '40', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101050107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '82', '0', '1023', '-21', '0', '239', '北风', '微风', '7', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101050108', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-23', '80', '0', '1022', '-26', '0', '250', '东北风', '3-4', '10', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101050109', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-23', '82', '0', '1022', '-20', '0', '250', '西南风', '3-4', '11', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101050110', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-22', '78', '0', '1022', '-24', '10', '216', '西风', '3-4', '13', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101050111', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '81', '0', '1022', '-19', '3', '238', '南风', '3-4', '12', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101050112', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '79', '0', '1023', '-16', '2', '197', '东南风', '4-5', '17', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101050113', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '77', '0', '1019', '-24', '3', '210', '东北风', '3-4', '10', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101050201', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-20', '84', '0', '1021', '-19', '10', '293', '西南风', '3-4', '15', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101050202', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-23', '71', '0', '1020', '-21', '7', '255', '东南风', '3-4', '14', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101050203', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-20', '78', '0', '1021', '-14', '10', '282', '西风', '4-5', '19', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101050204', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-19', '78', '0', '1021', '-17', '10', '273', '西风', '3-4', '12', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101050205', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-20', '78', '0', '1021', '-22', '10', '293', '南风', '3-4', '11', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101050206', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-25', '75', '0', '1021', '-21', '2', '282', '西南风', '3-4', '12', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101050207', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-24', '77', '0', '1021', '-24', '1', '272', '北风', '微风', '9', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101050208', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-26', '77', '0', '1021', '-24', '7', '279', '西南风', '3-4', '16', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101050209', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-27', '72', '0', '1021', '-20', '7', '273', '西风', '3-4', '14', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101050210', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-17', '81', '0', '1021', '-19', '10', '98', '北风', '3-4', '15', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '64', '0', '1021', '-14', '10', '237', '西南风', '3-4', '15', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101050302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-25', '75', '0.0', '1021', '-21', '2', '250', '北风', '4-5', '21', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101050303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-22', '60', '0', '1020', '-16', '10', '249', '西南风', '4-5', '23', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101050304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-26', '67', '0', '1020', '-18', '10', '239', '东北风', '4-5', '24', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101050305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '58', '0', '1019', '-15', '10', '279', '西风', '5-6', '27', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101050306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-23', '65', '0', '1022', '-15', '5', '227', '东南风', '3-4', '10', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101050307', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-23', '63', '0.0', '1019', '-15', '10', '279', '西北风', '4-5', '17', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101050401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-28', '61', '0', '1019', '-19', '10', '229', '西风', '3-4', '14', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101050402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-23', '57', '0', '1019', '-17', '10', '229', '西南风', '5-6', '29', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101050403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-25', '61', '0', '1009', '-18', '10', '250', '西南风', '6-7', '40', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101050404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '59', '0', '1019', '-17', '10', '229', '西风', '4-5', '21', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101050405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-22', '70', '0', '1019', '-15', '10', '278', '西风', '6-7', '41', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101050406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-25', '60', '0', '1015', '-18', '10', '276', '西风', '5-6', '28', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101050407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '64', '0', '1015', '-18', '10', '276', '西风', '6-7', '41', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101050501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '80', '0', '1022', '-17', '0', '239', '西北风', '4-5', '24', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101050502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '81', '0', '1019', '-18', '3', '210', '西风', '4-5', '23', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101050503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '82', '0', '1021', '-20', '1', '242', '西南风', '3-4', '15', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101050504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-26', '80', '0', '1022', '-28', '0', '261', '东南风', '3-4', '12', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101050505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '79', '0', '1021', '-19', '1', '272', '西北风', '3-4', '11', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101050506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '81', '0', '1022', '-20', '0', '254', '北风', '4-5', '23', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101050507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '87', '0', '1019', '-20', '3', '210', '西风', '3-4', '10', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101050508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-23', '86', '0', '1022', '-19', '2', '256', '北风', '微风', '7', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101050509', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '79', '0', '1023', '-28', '0', '239', '东北风', '3-4', '13', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101050510', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-26', '76', '0', '1022', '-27', '0', '261', '东风', '3-4', '16', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101050601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-23', '58', '0', '1013', '-19', '10', '260', '西北风', '3-4', '11', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-28', '76', '0', '1019', '-26', '0', '272', '东北风', '3-4', '10', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-27', '67', '0', '1019', '-22', '10', '267', '北风', '微风', '1', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-28', '55', '0', '1018', '-19', '2', '272', '西南风', '4-5', '19', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-30', '74', '0', '1020', '-30', '10', '268', '东北风', '3-4', '15', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-29', '78', '0', '1021', '-28', '7', '273', '北风', '微风', '0', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101050701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '77', '0', '1017', '-23', '2', '249', '西风', '4-5', '24', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101050702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '76', '0', '1017', '-23', '2', '249', '西风', '3-4', '12', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101050703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-26', '76', '0', '1019', '-27', '2', '217', '东南风', '4-5', '21', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101050704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '77', '0', '1017', '-29', '2', '249', '南风', '3-4', '12', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101050705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-26', '72', '0', '1019', '-30', '2', '225', '北风', '微风', '0', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101050706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-26', '77', '0', '1020', '-25', '2', '271', '西风', '3-4', '13', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101050708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '77', '0', '1020', '-23', '2', '283', '西风', '4-5', '20', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101050801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '73', '0', '1022', '-23', '7', '191', '西南风', '3-4', '15', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101050802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-31', '76', '0', '1019', '-24', '0', '250', '南风', '3-4', '16', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101050803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-27', '70', '0', '1019', '-21', '0', '250', '西南风', '4-5', '18', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101050804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-25', '76', '0', '1022', '-28', '7', '191', '东南风', '3-4', '16', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101050805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-27', '72', '0', '1016', '-32', '3', '303', '东风', '3-4', '15', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101050901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '82', '0', '1021', '-17', '1', '239', '北风', '微风', '3', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101050902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-23', '80', '0', '1021', '-19', '2', '287', '南风', '4-5', '18', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101050903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '80', '0', '1019', '-18', '3', '210', '西南风', '3-4', '10', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101050904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '81', '0', '1019', '-17', '3', '210', '西南风', '3-4', '10', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101050905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '85', '0', '1021', '-17', '7', '293', '东风', '3-4', '16', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101051002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '67', '0', '1019', '-16', '10', '290', '西南风', '4-5', '23', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101051003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-26', '62', '0', '1019', '-17', '10', '281', '东南风', '3-4', '10', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101051101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-22', '57', '0', '1019', '-16', '10', '250', '西风', '4-5', '24', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101051102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '57', '0', '1017', '-16', '2', '263', '西风', '4-5', '24', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101051103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '52', '0', '1018', '-14', '7', '295', '西风', '4-5', '18', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101051104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '55', '0', '1019', '-15', '10', '255', '西风', '5-6', '31', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101051201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '49', '0', '1018', '-16', '10', '273', '西北风', '4-5', '20', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101051202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '68', '0', '1015', '-21', '10', '276', '西风', '6-7', '42', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101051203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-17', '48', '0', '1016', '-15', '2', '283', '西风', '5-6', '31', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101051301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '48', '0', '1018', '-14', '10', '259', '南风', '4-5', '20', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101051302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-19', '50', '0', '1018', '-14', '10', '259', '西风', '4-5', '22', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101051303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '62', '0', '1017', '-19', '10', '266', '西北风', '3-4', '15', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101051304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '59', '0', '1016', '-15', '10', '238', '西风', '5-6', '29', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101051305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-22', '48', '0', '1018', '-14', '10', '259', '南风', '4-5', '19', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101060101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '72', '0', '1020', '-7', '7', '190', '西南风', '4-5', '18', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101060102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '85', '0', '1019', '-16', '3', '210', '北风', '3-4', '16', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101060103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '83', '0', '1020', '-14', '7', '190', '南风', '3-4', '16', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101060104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '74', '0', '1020', '-12', '7', '190', '南风', '4-5', '17', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101060105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-22', '84', '0', '1023', '-16', '5', '214', '西南风', '4-5', '21', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101060106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '65', '0', '1020', '-9', '7', '190', '南风', '4-5', '17', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101060201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-18', '67', '0', '1024', '-11', '10', '186', '南风', '4-5', '22', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101060202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '68', '0', '1023', '-13', '2', '197', '南风', '4-5', '18', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101060203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-22', '78', '0', '1024', '-15', '10', '188', '北风', '微风', '3', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101060204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-23', '80', '0', '1024', '-19', '1', '234', '东风', '4-5', '21', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101060205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '67', '0', '1025', '-12', '7', '204', '东南风', '4-5', '24', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101060206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '79', '0', '1025', '-14', '2', '208', '北风', '3-4', '15', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101060301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-18', '53', '0', '1022', '-10', '10', '272', '西风', '5-6', '33', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101060302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-18', '57', '0', '1024', '-12', '1', '259', '西南风', '3-4', '13', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101060303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '56', '0', '1023', '-12', '10', '251', '西北风', '4-5', '21', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101060304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-23', '71', '0', '1020', '-18', '2', '258', '南风', '3-4', '10', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101060305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-14', '52', '0', '1023', '-8', '10', '251', '南风', '4-5', '23', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101060307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-18', '67', '0', '1022', '-13', '10', '272', '西南风', '4-5', '21', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101060308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '44', '0', '1021', '-7', '10', '299', '西风', '3-4', '16', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101060309', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-12', '37', '0', '1021', '-6', '10', '286', '西北风', '4-5', '22', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101060401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '86', '0', '1023', '-12', '10', '195', '北风', '微风', '6', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101060402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '88', '0', '1021', '-14', '10', '184', '北风', '3-4', '15', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101060403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-17', '79', '0', '1022', '-8', '10', '195', '西风', '3-4', '10', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101060404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-14', '80', '0', '1023', '-8', '10', '210', '南风', '4-5', '19', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101060405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '68', '0', '1020', '-10', '7', '190', '东南风', '4-5', '20', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101060501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '72', '0', '1027', '-12', '7', '163', '西风', '3-4', '12', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101060502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '62', '0', '1026', '-10', '10', '197', '南风', '4-5', '19', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101060503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-17', '58', '0', '1026', '-10', '10', '179', '西南风', '5-6', '25', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101060504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '64', '0', '1026', '-12', '2', '204', '东南风', '4-5', '17', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101060505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '66', '0', '1027', '-13', '10', '171', '北风', '4-5', '23', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101060506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-17', '82', '0', '1026', '-15', '10', '174', '东风', '3-4', '15', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101060601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '85', '0', '1021', '-15', '7', '136', '北风', '3-4', '11', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101060602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '76', '0', '1021', '-14', '7', '136', '北风', '微风', '6', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101060603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-18', '84', '0', '1021', '-16', '7', '269', '北风', '微风', '5', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101060604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-18', '83', '0', '1020', '-15', '1', '129', '东北风', '3-4', '14', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101060605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-13', '69', '0', '1020', '-13', '10', '244', '南风', '3-4', '11', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101060701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-18', '73', '0', '1024', '-10', '10', '199', '东南风', '3-4', '14', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101060702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '76', '0', '1025', '-15', '10', '199', '东北风', '3-4', '14', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101060703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-18', '73', '0', '1024', '-10', '10', '199', '东南风', '3-4', '13', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101060801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '74', '0', '1021', '-13', '10', '227', '北风', '微风', '3', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101060802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-18', '66', '0', '1021', '-10', '10', '217', '西南风', '4-5', '18', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101060803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '79', '0', '1021', '-15', '10', '227', '北风', '微风', '2', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101060804', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-17', '81', '0', '1021', '-8', '10', '192', '西南风', '4-5', '23', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101060805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '83', '0', '1019', '-15', '3', '210', '北风', '微风', '3', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101060901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '82', '0', '1027', '-16', '7', '163', '东风', '3-4', '12', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101060902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '70', '0', '1026', '-15', '2', '204', '北风', '3-4', '15', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101060903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-12', '91', '0', '1026', '-17', '7', '198', '北风', '3-4', '11', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101060904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-22', '54', '0', '1025', '-13', '2', '181', '西南风', '3-4', '15', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101060905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '78', '0', '1025', '-17', '10', '226', '东北风', '3-4', '16', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101060906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-21', '82', '0', '1026', '-16', '1', '183', '东风', '3-4', '11', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101060907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-20', '78', '0', '1026', '-19', '2', '192', '南风', '3-4', '16', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101070101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '76', '0', '1020', '-9', '10', '120', '东北风', '3-4', '14', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101070103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '70', '0', '1020', '-4', '10', '120', '南风', '4-5', '22', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101070104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '70', '0', '1020', '-6', '10', '120', '西南风', '3-4', '13', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101070105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '63', '0', '1020', '-7', '10', '120', '西南风', '4-5', '23', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101070106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '70', '0', '1020', '-6', '10', '120', '东南风', '3-4', '11', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101070201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '49', '0', '1023', '5', '10', '250', '西南风', '5-6', '27', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '70', '0', '1023', '3', '10', '250', '西风', '4-5', '18', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '45', '0', '1021', '4', '10', '247', '西风', '4-5', '24', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '66', '0', '1023', '3', '10', '250', '南风', '4-5', '17', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '54', '0', '1023', '5', '10', '250', '西南风', '6-7', '42', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '64', '0', '1023', '4', '10', '250', '北风', '4-5', '22', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '70', '0', '1023', '-5', '10', '250', '东北风', '3-4', '12', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101070301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '56', '0', '1020', '3', '10', '120', '南风', '5-6', '33', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101070302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '82', '0', '1021', '0', '10', '217', '南风', '3-4', '13', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101070303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-12', '86', '0', '1024', '-11', '10', '123', '北风', '微风', '0', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101070304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '63', '0', '1023', '0', '10', '183', '东南风', '4-5', '22', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101070401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '65', '0', '1020', '-10', '10', '120', '东北风', '4-5', '21', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101070402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '76', '0', '1026', '-15', '10', '150', '西风', '3-4', '12', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101070403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '80', '0', '1025', '-13', '10', '164', '北风', '微风', '10', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101070404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '65', '0', '1020', '-10', '10', '120', '东北风', '4-5', '21', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101070501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '56', '0', '1020', '-5', '10', '120', '东北风', '3-4', '12', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101070502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '63', '0', '1020', '-6', '10', '120', '东南风', '4-5', '22', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101070504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-17', '56', '0', '1026', '-10', '10', '174', '南风', '3-4', '13', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101070601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '58', '0', '1026', '-4', '10', '94', '东北风', '4-5', '21', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101070602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '53', '0', '1025', '-6', '10', '115', '西风', '3-4', '12', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101070603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '67', '0', '1026', '-7', '10', '94', '东南风', '3-4', '11', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101070604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '57', '0', '1025', '-4', '10', '99', '东风', '4-5', '21', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101070701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '61', '0', '1021', '-1', '10', '247', '西风', '3-4', '11', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101070702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '75', '0', '1021', '-1', '10', '247', '北风', '3-4', '10', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101070704', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-5', '54', '0', '1021', '-6', '10', '247', '西北风', '3-4', '12', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101070705', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-7', '87', '0', '1021', '-6', '10', '223', '东北风', '3-4', '15', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101070706', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-7', '51', '0', '1021', '-2', '10', '248', '西风', '3-4', '14', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101070801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '81', '0', '1022', '3', '10', '219', '南风', '5-6', '33', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101070802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '76', '0', '1023', '3', '10', '216', '南风', '6-7', '40', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101070803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '74', '0', '1023', '3', '10', '234', '西南风', '5-6', '27', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101070901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '69', '0', '1020', '-10', '10', '244', '北风', '微风', '8', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101070902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '91', '0', '1020', '-11', '10', '120', '东南风', '3-4', '12', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101071001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '65', '0', '1020', '-5', '10', '120', '东南风', '3-4', '16', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101071002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '62', '0', '1020', '2', '10', '120', '南风', '5-6', '32', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101071003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '61', '0', '1020', '-4', '10', '120', '南风', '6-7', '41', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101071004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '65', '0', '1020', '-5', '10', '120', '东南风', '3-4', '13', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101071101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '60', '0', '1020', '-5', '10', '120', '东南风', '3-4', '16', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101071102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '67', '0', '1020', '-8', '10', '120', '西风', '3-4', '12', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101071103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '62', '0', '1023', '-5', '10', '177', '南风', '4-5', '17', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101071104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-17', '84', '0', '1023', '-15', '10', '177', '南风', '3-4', '12', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101071105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '60', '0', '1020', '-5', '10', '120', '东南风', '3-4', '16', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101071201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '45', '0', '1021', '-2', '10', '261', '南风', '3-4', '12', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101071203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '42', '0', '1022', '-1', '10', '245', '东风', '3-4', '10', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101071204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '33', '0', '1022', '2', '10', '245', '西风', '3-4', '16', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101071205', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-8', '43', '0', '1021', '-5', '10', '244', '南风', '3-4', '14', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101071207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '31', '0', '1022', '1', '10', '245', '西风', '5-6', '28', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101071301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '83', '0', '1021', '1', '10', '217', '南风', '4-5', '23', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101071302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '83', '0', '1022', '1', '10', '223', '南风', '4-5', '18', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101071303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '88', '0', '1021', '-1', '10', '217', '西南风', '4-5', '24', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101071401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '68', '0', '1022', '-2', '10', '248', '北风', '4-5', '19', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101071402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '43', '0', '1022', '-1', '10', '259', '东风', '3-4', '10', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101071403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '43', '0', '1022', '1', '10', '248', '西南风', '4-5', '24', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101071404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '47', '0', '1022', '-2', '10', '248', '北风', '微风', '10', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101080101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '48', '0', '1020', '-7', '10', '50', '西北风', '5-6', '29', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '45', '0.0', '1025', '-5', '10', '101', '西北风', '3-4', '15', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '60', '0.0', '1025', '-10', '10', '101', '东南风', '3-4', '13', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '51', '0.0', '1020', '-7', '10', '50', '北风', '微风', '3', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '46', '0.0', '1020', '-5', '10', '50', '东风', '3-4', '12', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '47', '0', '1020', '-5', '10', '50', '东南风', '3-4', '15', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-12', '47', '0.0', '1025', '-7', '10', '207', '东南风', '4-5', '21', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101080201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '53', '0', '1025', '-7', '10', '102', '东北风', '4-5', '21', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101080202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '48', '0.0', '1024', '-6', '10', '204', '西风', '6-7', '40', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101080203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '42', '0', '1023', '-6', '10', '258', '西风', '6-7', '35', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101080204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '45', '0.0', '1025', '-4', '10', '101', '东风', '3-4', '12', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101080205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '51', '0.0', '1025', '-9', '10', '102', '东风', '3-4', '15', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101080206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '40', '0', '1024', '-7', '10', '224', '东南风', '3-4', '14', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101080207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-12', '49', '0', '1025', '-8', '10', '207', '西风', '4-5', '19', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101080301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '65', '0', '1022', '-7', '10', '294', '东南风', '3-4', '13', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101080401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '36', '0', '1025', '-4', '10', '255', '东风', '3-4', '13', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '60', '0.0', '1025', '-11', '10', '255', '南风', '3-4', '15', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '45', '0', '1025', '-6', '10', '268', '西南风', '4-5', '23', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '51', '0.0', '1025', '-9', '10', '268', '东风', '4-5', '20', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '44', '0.0', '1026', '-6', '10', '251', '西风', '5-6', '26', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '50', '0', '1020', '-8', '10', '50', '东风', '3-4', '15', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '54', '0.0', '1026', '-7', '10', '251', '北风', '微风', '1', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101080409', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '54', '0.0', '1025', '-9', '10', '255', '西风', '5-6', '25', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101080410', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '45', '0.0', '1025', '-7', '10', '255', '西南风', '3-4', '12', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101080411', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-12', '47', '0', '1025', '-8', '10', '220', '南风', '3-4', '10', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101080412', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '55', '0.0', '1026', '-8', '10', '251', '北风', '微风', '4', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101080501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-8', '68', '0', '1020', '-9', '10', '279', '西风', '3-4', '15', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101080502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-8', '64', '0', '1020', '-12', '10', '279', '西风', '3-4', '14', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101080503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-13', '82', '0', '1021', '-13', '10', '208', '南风', '3-4', '11', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101080504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-8', '93', '0', '1020', '-9', '10', '120', '西风', '3-4', '13', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101080505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '65', '0', '1021', '-10', '10', '278', '东北风', '4-5', '20', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101080506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-8', '56', '0', '1021', '-11', '10', '302', '北风', '微风', '2', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101080507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-12', '62', '0', '1020', '-7', '10', '279', '北风', '4-5', '19', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101080508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-12', '64', '0', '1020', '-9', '10', '279', '北风', '微风', '8', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101080509', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-13', '51', '0', '1022', '-8', '10', '299', '西北风', '3-4', '12', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101080511', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-14', '62', '0', '1024', '-9', '10', '282', '西风', '3-4', '12', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101080601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '48', '0', '1022', '-5', '10', '268', '北风', '3-4', '13', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101080603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-12', '58', '0', '1022', '-10', '10', '294', '西南风', '4-5', '17', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101080604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-13', '57', '0', '1023', '-7', '10', '307', '西北风', '6-7', '38', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101080605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-13', '61', '0', '1023', '-8', '10', '307', '西风', '3-4', '16', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101080606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '65', '0', '1024', '-8', '10', '286', '西南风', '3-4', '14', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101080607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '57', '0', '1024', '-8', '10', '286', '西北风', '4-5', '24', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101080608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '59', '0', '1024', '-7', '10', '286', '西北风', '4-5', '22', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101080609', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '52', '0', '1022', '-8', '10', '268', '西南风', '3-4', '13', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101080610', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '50', '0', '1022', '-6', '10', '268', '西北风', '4-5', '17', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101080611', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '39', '0', '1023', '-2', '10', '274', '西南风', '3-4', '11', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101080612', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-11', '41', '0.0', '1023', '-2', '10', '274', '北风', '3-4', '10', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101080613', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '40', '0', '1022', '-1', '10', '245', '南风', '3-4', '10', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101080614', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '51', '0', '1021', '-8', '10', '258', '西南风', '4-5', '22', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101080615', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '52', '0', '1021', '-10', '10', '278', '西南风', '3-4', '12', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101080701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '40', '0', '1025', '-1', '10', '203', '南风', '3-4', '14', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101080703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '59', '0.0', '1025', '-6', '10', '203', '东风', '3-4', '11', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101080704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '47', '0.0', '1025', '-4', '10', '176', '北风', '3-4', '12', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101080705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '56', '0.0', '1021', '-4', '10', '225', '西南风', '3-4', '14', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101080706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '61', '0.0', '1022', '-5', '10', '214', '东南风', '3-4', '12', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101080707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '57', '0.0', '1023', '-9', '10', '256', '南风', '4-5', '24', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101080708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '56', '0', '1022', '-6', '10', '231', '西风', '3-4', '16', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101080709', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '49', '0.0', '1023', '-5', '10', '203', '西风', '4-5', '20', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101080710', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '49', '0.0', '1023', '-2', '10', '209', '西北风', '3-4', '14', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101080711', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '43', '0.0', '1023', '-2', '10', '178', '西南风', '4-5', '21', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101080712', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '50', '0', '1023', '-5', '10', '178', '西北风', '4-5', '20', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101080713', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '40', '0', '1025', '-1', '10', '203', '南风', '3-4', '16', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101080801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '59', '0', '1023', '-8', '10', '157', '西北风', '3-4', '14', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101080802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '63', '0.0', '1024', '-8', '10', '148', '西南风', '3-4', '14', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101080803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '62', '0.0', '1022', '-5', '10', '281', '西南风', '4-5', '22', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101080804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '44', '0.0', '1024', '-2', '10', '148', '南风', '4-5', '19', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101080805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '48', '0.0', '1024', '-7', '10', '148', '西北风', '3-4', '12', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101080806', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '54', '0', '1023', '-8', '10', '160', '东北风', '3-4', '15', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101080807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '61', '0.0', '1021', '-7', '10', '247', '西北风', '3-4', '11', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101080808', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '57', '0', '1021', '-8', '10', '247', '南风', '5-6', '26', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101080809', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '73', '0', '1024', '-16', '10', '321', '北风', '微风', '1', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101080810', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '67', '0', '1022', '-8', '10', '281', '北风', '微风', '1', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101080901', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '76', '0', '1024', '-14', '10', '253', '南风', '3-4', '11', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101080903', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-8', '65', '0', '1023', '-10', '10', '270', '西北风', '3-4', '16', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101080904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-16', '69', '0', '1024', '-11', '10', '284', '西北风', '3-4', '15', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101080906', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-10', '64', '0', '1024', '-11', '10', '259', '东南风', '3-4', '14', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101080907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-10', '59', '0.0', '1024', '-7', '10', '243', '西南风', '5-6', '30', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101080908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '49', '0', '1024', '-6', '10', '243', '西南风', '5-6', '29', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101080909', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '80', '0', '1026', '-17', '10', '309', '北风', '3-4', '10', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101080910', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '84', '0', '1025', '-17', '10', '253', '北风', '微风', '5', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101080911', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-16', '61', '0', '1025', '-9', '10', '254', '南风', '3-4', '16', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101080912', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '56', '0.0', '1025', '-7', '10', '268', '西南风', '3-4', '15', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101080913', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '71', '0.0', '1024', '-12', '10', '259', '北风', '微风', '3', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101080914', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-14', '58', '0.0', '1025', '-7', '10', '260', '西南风', '4-5', '17', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101080915', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '57', '0', '1025', '-7', '10', '269', '西南风', '4-5', '18', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101080916', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '66', '0', '1023', '-14', '2', '290', '西风', '3-4', '11', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101080917', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '86', '0', '1024', '-19', '5', '284', '西风', '3-4', '10', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101081001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '76', '0', '1025', '-21', '2', '201', '南风', '5-6', '33', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101081002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-25', '74', '0', '1021', '-26', '7', '281', '北风', '3-4', '10', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-22', '69', '0', '1022', '-17', '7', '294', '西北风', '3-4', '13', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-23', '70', '0', '1020', '-18', '7', '255', '西北风', '3-4', '12', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-26', '76', '0', '1021', '-21', '2', '279', '西北风', '3-4', '14', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '75', '0', '1025', '-22', '2', '201', '东南风', '4-5', '17', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-24', '79', '0', '1025', '-25', '2', '201', '北风', '微风', '10', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081008', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-22', '75', '0', '1025', '-19', '10', '209', '南风', '3-4', '12', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081009', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '77', '0', '1024', '-19', '10', '273', '西风', '4-5', '22', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081010', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-19', '76', '0', '1023', '-21', '10', '284', '西南风', '4-5', '22', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081011', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-29', '77', '0', '1025', '-27', '0', '221', '西南风', '3-4', '15', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081012', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-22', '84', '0', '1022', '-17', '7', '294', '东风', '3-4', '10', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101081014', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-28', '74', '0', '1024', '-28', '0', '187', '东风', '3-4', '12', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101081015', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-28', '76', '0', '1024', '-29', '0', '243', '北风', '微风', '0', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101081016', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-28', '75', '0', '1024', '-29', '0', '243', '南风', '4-5', '20', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101081101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '72', '0', '1021', '-13', '10', '327', '西风', '3-4', '16', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101081102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-27', '76', '0', '1024', '-22', '0', '296', '西南风', '3-4', '11', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101081103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-14', '65', '0', '1021', '-8', '10', '308', '北风', '5-6', '31', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101081104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '79', '0', '1021', '-18', '10', '327', '南风', '3-4', '12', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101081105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-18', '72', '0', '1021', '-13', '10', '204', '西北风', '3-4', '12', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101081106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-24', '75', '0', '1022', '-18', '10', '286', '南风', '3-4', '13', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101081107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-15', '65', '0', '1021', '-10', '10', '313', '西北风', '3-4', '12', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101081109', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-21', '72', '0', '1021', '-13', '10', '327', '西风', '3-4', '14', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101081201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '40', '0', '1022', '-4', '10', '24', '东南风', '3-4', '15', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101081202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '45', '0', '1023', '0', '10', '353', '北风', '4-5', '24', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101081203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '51', '0', '1025', '-4', '10', '277', '西南风', '4-5', '19', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101081204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '51', '0', '1024', '-4', '10', '273', '西南风', '5-6', '31', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101081205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '51', '0', '1022', '-7', '10', '24', '西南风', '5-6', '29', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101081206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '57', '0.0', '1021', '-5', '10', '4', '北风', '微风', '5', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101081207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '38', '0.0', '1019', '1', '10', '287', '西风', '4-5', '24', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101081208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '52', '0.0', '1024', '-6', '10', '307', '西风', '4-5', '20', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101081209', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '53', '0', '1023', '-6', '10', '228', '北风', '3-4', '13', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101081210', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '52', '0.0', '1024', '-6', '10', '307', '西风', '4-5', '20', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101081211', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '38', '0.0', '1019', '1', '10', '287', '西风', '4-5', '18', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101081212', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '57', '0.0', '1021', '-5', '10', '4', '北风', '微风', '0', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101090101', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '73', '0', '1022', '1', '2', '320', '西北风', '3-4', '16', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101090102', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '69', '0', '1022', '0', '2', '320', '北风', '3-4', '14', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101090103', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '78', '0', '1022', '1', '2', '320', '北风', '微风', '4', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101090104', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '85', '0', '1022', '0', '2', '320', '西北风', '3-4', '10', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101090105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '79', '0', '1022', '-1', '2', '320', '西风', '3-4', '12', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101090106', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '72', '0', '1022', '1', '2', '320', '东风', '3-4', '15', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101090107', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-6', '92', '0', '1022', '-4', '2', '320', '西北风', '4-5', '18', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101090108', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '84', '0', '1024', '-1', '10', '191', '东南风', '3-4', '15', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101090109', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '69', '0', '1022', '1', '2', '320', '北风', '3-4', '14', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101090110', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '88', '0', '1024', '-2', '10', '191', '西北风', '3-4', '15', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101090111', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '71', '0', '1022', '1', '2', '320', '西北风', '3-4', '13', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101090112', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '85', '0', '1022', '-2', '2', '320', '西南风', '3-4', '13', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090113', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '84', '0', '1022', '-2', '2', '320', '南风', '3-4', '16', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090114', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '0', '61', '0', '1024', '3', '10', '192', '南风', '4-5', '19', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090115', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '89', '0', '1024', '-1', '10', '191', '北风', '3-4', '11', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090116', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '67', '0', '1024', '2', '10', '191', '南风', '3-4', '12', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090117', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '72', '0', '1022', '1', '2', '320', '西风', '3-4', '13', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090118', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '73', '0', '1022', '1', '2', '320', '西北风', '3-4', '12', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101090201', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '87', '0', '1024', '-4', '10', '216', '西风', '3-4', '10', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090202', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '64', '0', '1024', '2', '10', '216', '西南风', '3-4', '16', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090203', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '67', '0', '1022', '-2', '2', '320', '西北风', '3-4', '13', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090204', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '81', '0', '1024', '-2', '10', '216', '东风', '3-4', '13', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090205', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '75', '0', '1022', '0', '2', '320', '西南风', '3-4', '12', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090206', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '62', '0', '1023', '3', '3', '240', '西南风', '4-5', '18', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090207', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '74', '0', '1024', '0', '10', '216', '南风', '3-4', '14', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090209', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-9', '48', '0', '1024', '-4', '10', '331', '北风', '3-4', '11', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101090210', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '80', '0', '1022', '-2', '2', '320', '西风', '3-4', '13', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101090211', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '72', '0', '1024', '0', '10', '216', '东南风', '3-4', '10', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101090212', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '77', '0', '1022', '-5', '2', '320', '北风', '3-4', '15', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101090214', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '88', '0', '1022', '-5', '2', '320', '西风', '3-4', '16', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101090215', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '84', '0', '1023', '-2', '3', '240', '西南风', '3-4', '11', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101090216', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '56', '0', '1022', '2', '2', '320', '西风', '4-5', '17', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101090217', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '68', '0', '1023', '1', '3', '240', '西南风', '3-4', '11', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101090218', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-8', '76', '0', '1022', '-2', '4', '80', '北风', '微风', '7', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101090219', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '78', '0', '1022', '0', '2', '320', '西风', '3-4', '14', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101090220', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '85', '0', '1023', '-1', '3', '240', '西南风', '3-4', '14', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101090221', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '81', '0', '1024', '-2', '10', '216', '南风', '3-4', '16', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101090222', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-8', '76', '0', '1022', '-2', '4', '80', '北风', '微风', '3', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101090223', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-8', '81', '0', '1022', '-2', '4', '80', '南风', '3-4', '14', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101090224', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '87', '0', '1024', '-4', '10', '216', '西风', '3-4', '11', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101090225', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '85', '0', '1023', '-1', '3', '240', '西南风', '3-4', '10', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101090301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '43', '0', '1025', '-5', '10', '239', '西北风', '3-4', '13', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101090302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '62', '0', '1025', '-9', '10', '307', '西南风', '4-5', '17', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101090303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '39', '0', '1025', '-3', '10', '239', '西南风', '4-5', '22', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-14', '78', '0', '1025', '-14', '10', '259', '东南风', '3-4', '14', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-16', '61', '0', '1025', '-10', '10', '254', '东北风', '4-5', '17', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '50', '0', '1025', '-7', '10', '249', '西风', '3-4', '15', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '47', '0', '1024', '-4', '10', '331', '西南风', '3-4', '10', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '49', '0', '1025', '-7', '10', '248', '北风', '3-4', '11', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090309', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '41', '0', '1025', '-5', '10', '248', '西北风', '3-4', '10', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101090310', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '48', '0', '1025', '-6', '10', '239', '东北风', '4-5', '19', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101090311', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '40', '0', '1022', '-2', '4', '80', '北风', '微风', '10', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101090312', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '39', '0', '1022', '-2', '4', '80', '西北风', '3-4', '12', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101090313', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '47', '0', '1022', '-6', '4', '80', '西北风', '3-4', '16', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101090314', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '61', '0', '1025', '-10', '10', '239', '东北风', '3-4', '10', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101090402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '63', '0', '1024', '-6', '10', '317', '东风', '3-4', '10', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '73', '0', '1024', '-8', '10', '225', '东北风', '3-4', '14', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '36', '0', '1024', '-1', '10', '305', '西风', '5-6', '31', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090405', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-11', '62', '0', '1023', '-6', '10', '274', '东风', '3-4', '14', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '58', '0', '1024', '-6', '10', '144', '北风', '3-4', '16', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '73', '0', '1024', '-10', '10', '252', '东北风', '3-4', '14', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '60', '0', '1025', '-9', '10', '248', '北风', '4-5', '22', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090409', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '53', '0', '1024', '-4', '10', '225', '西南风', '3-4', '15', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101090410', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-15', '58', '0', '1024', '-9', '10', '252', '东风', '3-4', '15', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101090501', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '86', '0', '1023', '-4', '3', '240', '东风', '3-4', '15', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101090502', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '78', '0', '1023', '-2', '3', '240', '东风', '3-4', '13', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101090503', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '71', '0', '1023', '-1', '3', '240', '东北风', '3-4', '11', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101090504', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '75', '0', '1023', '-2', '3', '240', '西南风', '3-4', '10', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101090505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '83', '0', '1024', '-1', '10', '262', '西北风', '3-4', '13', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101090506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '72', '0', '1024', '2', '10', '262', '北风', '3-4', '10', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101090507', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '64', '0', '1024', '-3', '10', '225', '东南风', '3-4', '12', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101090508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '77', '0.0', '1023', '-2', '3', '240', '东风', '3-4', '11', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101090509', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '54', '0', '1024', '4', '10', '262', '西南风', '5-6', '27', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101090510', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '64', '0', '1024', '-2', '10', '225', '北风', '3-4', '16', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101090511', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '61', '0', '1023', '-1', '3', '240', '北风', '微风', '6', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101090512', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '61', '0', '1024', '4', '10', '262', '西南风', '5-6', '26', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101090601', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '74', '0', '1023', '-1', '3', '240', '北风', '微风', '2', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101090602', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '83', '0', '1025', '-2', '10', '192', '北风', '微风', '10', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101090603', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '77', '0', '1023', '-2', '3', '240', '南风', '3-4', '14', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101090604', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '3', '89', '0', '1023', '-5', '3', '240', '东风', '3-4', '12', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101090605', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '65', '0', '1023', '2', '3', '240', '南风', '4-5', '17', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101090606', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '75', '0', '1023', '-1', '3', '240', '西南风', '4-5', '20', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101090607', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '70', '0', '1023', '-2', '3', '240', '东南风', '3-4', '11', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101090608', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '77', '0', '1023', '-2', '3', '240', '东风', '3-4', '12', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101090609', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-8', '73', '0', '1022', '-4', '4', '80', '北风', '微风', '2', '2016-12-16 23:15:39');
INSERT INTO `w_weather_data` VALUES ('CN101090701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '51', '0', '1023', '5', '3', '240', '西南风', '6-7', '35', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101090702', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '57', '0', '1024', '3', '10', '206', '西南风', '5-6', '26', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101090703', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '62', '0', '1024', '3', '10', '206', '南风', '4-5', '20', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101090704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '55', '0', '1023', '3', '3', '240', '西南风', '5-6', '30', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101090705', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '58', '0', '1023', '2', '3', '240', '西南风', '4-5', '23', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101090706', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '74', '0', '1023', '1', '3', '240', '南风', '3-4', '14', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101090707', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '62', '0', '1024', '2', '10', '206', '南风', '4-5', '18', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101090708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '56', '0', '1025', '5', '10', '197', '西南风', '6-7', '39', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101090709', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '67', '0', '1024', '2', '10', '206', '南风', '4-5', '23', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101090710', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '62', '0', '1023', '2', '3', '240', '西南风', '4-5', '18', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101090711', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '58', '0', '1024', '3', '10', '206', '西南风', '4-5', '24', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101090712', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '63', '0', '1023', '3', '3', '240', '西南风', '3-4', '14', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101090713', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '53', '0', '1023', '3', '3', '240', '西南风', '5-6', '29', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101090714', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '69', '0', '1023', '2', '3', '240', '南风', '5-6', '27', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101090716', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '51', '0', '1023', '5', '3', '240', '西南风', '6-7', '42', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101090801', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '68', '0', '1024', '3', '10', '195', '西南风', '4-5', '20', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101090802', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '74', '0', '1024', '1', '10', '195', '南风', '3-4', '12', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101090803', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '0', '69', '0', '1024', '3', '10', '192', '南风', '4-5', '22', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101090804', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '82', '0', '1024', '0', '10', '195', '南风', '4-5', '19', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101090805', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '75', '0', '1023', '0', '3', '240', '南风', '4-5', '23', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101090806', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '72', '0', '1023', '0', '3', '240', '南风', '4-5', '20', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101090807', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '0', '69', '0', '1024', '3', '10', '192', '南风', '4-5', '23', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101090808', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '62', '0', '1025', '3', '10', '197', '南风', '5-6', '25', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101090809', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '65', '0', '1024', '3', '10', '206', '西南风', '4-5', '22', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101090810', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '0', '75', '0', '1024', '1', '10', '192', '南风', '4-5', '23', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101090811', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '69', '0', '1024', '3', '10', '195', '东南风', '4-5', '17', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101090901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '66', '0', '1025', '3', '10', '187', '西北风', '4-5', '21', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101090902', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-6', '88', '0', '1022', '0', '2', '320', '北风', '3-4', '14', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101090904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '84', '0', '1025', '-2', '10', '187', '西北风', '4-5', '23', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101090905', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '98', '0', '1022', '-4', '2', '320', '西北风', '4-5', '18', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101090906', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '62', '0', '1022', '3', '2', '320', '南风', '4-5', '20', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101090907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '70', '0', '1025', '3', '10', '187', '南风', '4-5', '17', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101090908', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '76', '0', '1022', '0', '2', '320', '西北风', '3-4', '14', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101090909', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '69', '0', '1024', '3', '10', '192', '南风', '5-6', '26', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101090910', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '75', '0', '1024', '2', '10', '192', '南风', '4-5', '23', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101090911', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '67', '0', '1024', '4', '10', '192', '南风', '5-6', '27', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101090912', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '70', '0', '1025', '3', '10', '187', '南风', '4-5', '17', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101090913', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '67', '0', '1026', '3', '10', '190', '南风', '5-6', '27', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101090914', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '60', '0', '1025', '4', '10', '192', '南风', '5-6', '30', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101090915', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '71', '0', '1026', '3', '10', '190', '东南风', '5-6', '27', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101090916', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '63', '0', '1024', '4', '10', '192', '南风', '5-6', '31', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101090917', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '74', '0', '1025', '1', '10', '187', '南风', '4-5', '23', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101090918', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '70', '0', '1025', '3', '10', '187', '南风', '4-5', '19', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101091001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '61', '0', '1025', '5', '10', '189', '西南风', '5-6', '26', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101091002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '59', '0', '1025', '3', '10', '197', '东南风', '4-5', '19', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101091003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '66', '0', '1026', '4', '10', '189', '南风', '4-5', '19', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101091004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '69', '0', '1026', '4', '10', '189', '南风', '4-5', '22', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101091005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '65', '0', '1026', '4', '10', '190', '南风', '5-6', '27', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '48', '0', '1026', '1', '10', '190', '西风', '3-4', '14', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101091007', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '62', '0', '1026', '3', '10', '189', '西南风', '4-5', '17', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '72', '0', '1025', '3', '10', '189', '南风', '4-5', '24', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091009', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '60', '0', '1025', '4', '10', '189', '西南风', '5-6', '29', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091010', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '71', '0', '1026', '3', '10', '190', '南风', '5-6', '33', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091011', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '66', '0', '1025', '4', '10', '187', '南风', '4-5', '22', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091012', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '62', '0', '1026', '5', '10', '190', '南风', '5-6', '32', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091013', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '64', '0', '1026', '4', '10', '190', '南风', '5-6', '29', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101091014', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '60', '0', '1026', '5', '10', '189', '南风', '6-7', '41', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101091015', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '61', '0.0', '1025', '5', '10', '189', '南风', '4-5', '17', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101091016', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '54', '0', '1025', '3', '10', '197', '西南风', '4-5', '24', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101091101', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-3', '60', '0', '1023', '2', '10', '268', '西风', '4-5', '17', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101091102', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-6', '32', '0', '1023', '3', '10', '251', '西南风', '4-5', '21', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101091103', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '46', '0', '1024', '5', '10', '265', '西风', '5-6', '29', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101091104', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-5', '54', '0', '1024', '3', '10', '265', '西北风', '5-6', '33', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101091105', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-5', '60', '0', '1024', '2', '10', '265', '西风', '4-5', '18', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101091106', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-5', '60', '0', '1024', '2', '10', '265', '西风', '4-5', '19', '2016-12-16 23:15:19');
INSERT INTO `w_weather_data` VALUES ('CN101100101', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '79', '0.0', '1022', '-5', '6', '40', '西北风', '3-4', '11', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101100102', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '71', '0', '1022', '-5', '6', '40', '东北风', '3-4', '15', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101100103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '65', '0', '1022', '-7', '6', '40', '东北风', '3-4', '10', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101100104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '55', '0', '1022', '-7', '6', '40', '东南风', '3-4', '12', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101100105', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '53', '0.0', '1022', '-4', '6', '40', '西南风', '4-5', '18', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101100106', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '57', '0.0', '1022', '-4', '6', '40', '北风', '3-4', '16', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101100107', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '79', '0.0', '1022', '-5', '6', '40', '西北风', '3-4', '16', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101100201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '53', '0', '1025', '-10', '10', '224', '西北风', '3-4', '15', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101100202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '36', '0', '1025', '-2', '10', '248', '西北风', '3-4', '16', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101100203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '52', '0.0', '1025', '-11', '10', '224', '北风', '3-4', '16', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101100204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '39', '0', '1025', '-6', '10', '248', '北风', '3-4', '13', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101100205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '55', '0.0', '1025', '-6', '10', '285', '西风', '4-5', '18', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101100206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '58', '0', '1024', '-5', '10', '301', '东风', '3-4', '10', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101100207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '71', '0', '1025', '-9', '10', '193', '北风', '4-5', '24', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101100208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '37', '0.0', '1025', '-4', '10', '246', '南风', '5-6', '28', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101100301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '31', '0.0', '1022', '1', '6', '40', '西北风', '3-4', '16', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101100302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '48', '0', '1022', '-5', '6', '40', '西北风', '3-4', '14', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101100303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '49', '0', '1022', '-2', '6', '40', '西风', '3-4', '14', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101100401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '63', '0.0', '1022', '-5', '6', '40', '西风', '4-5', '21', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101100402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '63', '0.0', '1022', '-5', '6', '40', '西风', '4-5', '20', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101100403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '57', '0', '1022', '-6', '6', '40', '西北风', '3-4', '13', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101100404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '60', '0.0', '1022', '-8', '6', '40', '东南风', '4-5', '23', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101100405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '53', '0', '1022', '-6', '6', '40', '东风', '3-4', '14', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101100406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '47', '0.0', '1022', '-2', '6', '40', '东北风', '3-4', '13', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101100407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '64', '0', '1022', '-9', '6', '40', '西北风', '3-4', '16', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101100408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '68', '0', '1022', '-4', '6', '40', '东北风', '3-4', '15', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101100409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '58', '0.0', '1022', '-2', '6', '40', '西南风', '3-4', '12', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101100410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '67', '0.0', '1022', '-5', '6', '40', '南风', '3-4', '10', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101100411', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '49', '0', '1022', '-2', '6', '40', '西北风', '3-4', '12', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101100412', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '65', '0', '1022', '-1', '6', '40', '西南风', '4-5', '18', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101100501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '44', '0', '1026', '0', '10', '190', '西南风', '5-6', '29', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101100502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '53', '0.0', '1025', '-2', '10', '273', '南风', '3-4', '11', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101100503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '47', '0.0', '1026', '-1', '10', '190', '北风', '3-4', '10', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101100504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '51', '0.0', '1026', '-2', '10', '190', '西南风', '3-4', '16', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101100505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '58', '0', '1026', '-2', '10', '190', '东南风', '3-4', '10', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101100506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '27', '0.0', '1026', '3', '10', '190', '南风', '4-5', '19', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101100507', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '40', '0.0', '1022', '0', '6', '40', '东风', '4-5', '20', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101100508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '68', '0.0', '1022', '-6', '6', '40', '东北风', '3-4', '13', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101100509', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '58', '0', '1026', '-1', '10', '190', '南风', '4-5', '19', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101100510', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '66', '0.0', '1022', '-7', '6', '40', '北风', '3-4', '10', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101100511', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '31', '0.0', '1026', '1', '10', '190', '南风', '5-6', '28', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101100601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '52', '0', '1026', '2', '10', '153', '东南风', '3-4', '11', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101100602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '65', '0.0', '1026', '-2', '10', '180', '西风', '4-5', '20', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101100603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '67', '0', '1026', '0', '10', '180', '北风', '微风', '4', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101100604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '47', '0.0', '1026', '-1', '10', '153', '东南风', '3-4', '14', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101100605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '69', '0.0', '1026', '-3', '10', '153', '东风', '3-4', '14', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101100606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '52', '0', '1026', '2', '10', '180', '东南风', '3-4', '12', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101100701', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '4', '50', '0', '1025', '0', '10', '142', '东南风', '3-4', '11', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101100702', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '5', '58', '0.0', '1025', '0', '10', '144', '东南风', '4-5', '20', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101100703', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '57', '0.0', '1025', '-5', '10', '135', '北风', '3-4', '15', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101100704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '46', '0', '1025', '-4', '10', '135', '西风', '3-4', '11', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101100705', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '53', '0.0', '1025', '-3', '10', '135', '北风', '3-4', '16', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101100706', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '47', '0', '1024', '-2', '10', '176', '东北风', '4-5', '23', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101100707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '48', '0.0', '1025', '1', '10', '144', '西南风', '3-4', '11', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101100708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '49', '0.0', '1025', '-4', '10', '142', '东南风', '4-5', '17', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101100709', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '40', '0', '1022', '0', '6', '40', '西南风', '3-4', '11', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101100710', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '54', '0.0', '1022', '0', '6', '40', '东北风', '3-4', '16', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101100711', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-6', '61', '0.0', '1022', '-2', '6', '40', '西南风', '3-4', '15', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101100712', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '46', '0.0', '1025', '-2', '10', '70', '东风', '4-5', '24', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101100713', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '49', '0.0', '1025', '1', '10', '144', '东北风', '3-4', '13', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101100714', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '5', '56', '0', '1025', '0', '10', '144', '北风', '微风', '5', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101100715', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-5', '51', '0.0', '1026', '0', '10', '169', '北风', '3-4', '15', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101100716', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '74', '0', '1022', '-7', '6', '40', '北风', '3-4', '13', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101100717', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '61', '0.0', '1025', '-4', '10', '142', '东南风', '3-4', '12', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101100801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '64', '0', '1025', '1', '10', '110', '东风', '3-4', '13', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101100802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '52', '0.0', '1025', '3', '10', '40', '北风', '4-5', '19', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '51', '0.0', '1025', '1', '10', '70', '南风', '4-5', '23', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101100804', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '59', '0.0', '1025', '0', '10', '70', '南风', '3-4', '10', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '42', '0.0', '1025', '3', '10', '70', '北风', '微风', '3', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '42', '0.0', '1025', '3', '10', '144', '东风', '3-4', '14', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100807', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '46', '0.0', '1025', '2', '10', '144', '西风', '3-4', '16', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100808', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '63', '0.0', '1025', '0', '10', '144', '北风', '3-4', '13', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100809', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '73', '0', '1026', '0', '10', '76', '北风', '微风', '3', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100810', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '56', '0', '1025', '3', '10', '168', '西风', '5-6', '27', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100811', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '56', '0.0', '1025', '3', '10', '110', '西南风', '4-5', '18', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100812', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '75', '0.0', '1025', '-2', '10', '110', '东北风', '3-4', '10', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101100813', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '56', '0.0', '1025', '3', '10', '119', '北风', '微风', '4', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101100901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '77', '0', '1025', '-9', '10', '241', '西风', '3-4', '13', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101100902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '57', '0.0', '1025', '-6', '10', '119', '北风', '4-5', '24', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101100903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '52', '0', '1025', '-5', '10', '246', '西南风', '3-4', '14', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101100904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '55', '0', '1020', '-11', '10', '50', '东风', '3-4', '14', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101100905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '66', '0.0', '1025', '-6', '10', '193', '西风', '3-4', '12', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101100906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '41', '0.0', '1025', '-4', '10', '246', '北风', '微风', '8', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101101001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '60', '0.0', '1022', '-5', '6', '40', '西南风', '3-4', '10', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101101002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '69', '0', '1022', '-8', '6', '40', '东南风', '3-4', '11', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101101003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '72', '0.0', '1022', '-10', '6', '40', '西北风', '3-4', '16', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101101004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '42', '0', '1025', '-2', '10', '176', '东风', '3-4', '15', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101101005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '49', '0.0', '1025', '-6', '10', '176', '南风', '4-5', '22', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101101006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-11', '56', '0.0', '1025', '-6', '10', '241', '西北风', '4-5', '24', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101101007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '48', '0', '1025', '-4', '10', '234', '西南风', '4-5', '19', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101101008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-9', '76', '0', '1025', '-9', '10', '234', '东北风', '3-4', '12', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101101009', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-14', '60', '0.0', '1024', '-7', '10', '271', '东风', '4-5', '21', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101101010', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-18', '59', '0', '1024', '-10', '10', '271', '北风', '3-4', '12', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101101011', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '56', '0.0', '1025', '-2', '10', '176', '东风', '3-4', '11', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101101012', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '61', '0.0', '1022', '-7', '6', '40', '北风', '3-4', '16', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101101013', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-13', '50', '0.0', '1025', '-4', '10', '167', '南风', '3-4', '10', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101101014', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-13', '67', '0', '1025', '-9', '10', '167', '西南风', '3-4', '14', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101101015', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '57', '0', '1025', '-5', '10', '234', '西北风', '3-4', '12', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101101100', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '49', '0', '1025', '-1', '10', '138', '东北风', '3-4', '10', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101101101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '49', '0', '1025', '-1', '10', '138', '东北风', '3-4', '14', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101101102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '39', '0', '1025', '0', '10', '138', '东北风', '3-4', '13', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '51', '0', '1025', '-1', '10', '160', '东风', '5-6', '27', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-11', '77', '0.0', '1025', '-9', '10', '160', '东南风', '3-4', '15', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '56', '0.0', '1025', '-1', '10', '138', '东北风', '4-5', '17', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '28', '0.0', '1025', '3', '10', '135', '南风', '5-6', '31', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-11', '61', '0.0', '1025', '-4', '10', '160', '东北风', '4-5', '17', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101108', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '52', '0', '1025', '-6', '10', '135', '北风', '微风', '9', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101109', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '46', '0.0', '1025', '-4', '10', '138', '东南风', '4-5', '24', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101101110', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '48', '0.0', '1022', '-4', '6', '40', '西风', '3-4', '10', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101101111', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '70', '0.0', '1022', '-5', '6', '40', '西南风', '3-4', '16', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101101112', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '72', '0', '1022', '-5', '6', '40', '西南风', '3-4', '16', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101101113', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '60', '0.0', '1022', '-5', '6', '40', '西风', '3-4', '10', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101110101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '55', '0', '1023', '3', '4', '270', '西南风', '4-5', '23', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110102', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '80', '0', '1023', '0', '4', '270', '东风', '3-4', '15', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110103', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '53', '0.0', '1023', '5', '4', '270', '西南风', '4-5', '23', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110104', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '83', '0.0', '1023', '0', '4', '270', '东风', '3-4', '14', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110105', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '7', '75', '0.0', '1024', '0', '10', '138', '西风', '4-5', '23', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110106', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '80', '0.0', '1023', '0', '4', '270', '北风', '微风', '10', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110107', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '73', '0.0', '1023', '1', '4', '270', '西南风', '4-5', '24', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101110200', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '72', '0', '1023', '0', '4', '270', '西北风', '4-5', '18', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101110201', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '75', '0.0', '1023', '1', '4', '270', '西北风', '3-4', '16', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101110202', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '66', '0.0', '1023', '1', '4', '270', '西北风', '4-5', '20', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101110203', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '61', '0', '1023', '0', '4', '270', '北风', '3-4', '14', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101110204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '65', '0.0', '1023', '-1', '10', '139', '北风', '微风', '8', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101110205', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '70', '0.0', '1023', '1', '4', '270', '西风', '3-4', '16', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101110206', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '72', '0', '1023', '1', '4', '270', '西北风', '4-5', '18', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101110207', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '73', '0.0', '1023', '0', '4', '270', '北风', '4-5', '18', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101110208', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '56', '0.0', '1023', '2', '10', '139', '东南风', '4-5', '21', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101110209', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '62', '0', '1023', '1', '10', '139', '南风', '3-4', '14', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101110210', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '60', '0.0', '1023', '-2', '10', '139', '东南风', '3-4', '12', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101110211', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '81', '0.0', '1023', '1', '4', '270', '西北风', '3-4', '13', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101110300', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '40', '0', '1023', '2', '10', '189', '西南风', '4-5', '18', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '65', '0', '1024', '-5', '10', '176', '东南风', '3-4', '16', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '61', '0.0', '1023', '-4', '10', '184', '西南风', '3-4', '10', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101110303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '56', '0.0', '1023', '-2', '10', '184', '东风', '4-5', '18', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101110304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '53', '0', '1024', '-2', '10', '176', '西南风', '4-5', '23', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101110305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '62', '0.0', '1023', '-5', '10', '169', '南风', '3-4', '12', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110306', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '71', '0.0', '1022', '-4', '10', '221', '南风', '3-4', '10', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110307', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '64', '0.0', '1023', '-5', '10', '189', '西北风', '3-4', '12', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110308', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '64', '0.0', '1023', '-4', '10', '189', '西南风', '3-4', '12', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110309', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '37', '0', '1023', '2', '10', '148', '南风', '4-5', '23', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101110310', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '53', '0.0', '1023', '0', '10', '193', '西北风', '3-4', '12', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101110311', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '51', '0.0', '1024', '-4', '10', '176', '南风', '3-4', '15', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101110312', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '70', '0', '1022', '-5', '10', '221', '西风', '3-4', '15', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101110401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '31', '0', '1024', '1', '10', '163', '东南风', '4-5', '23', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101110402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '38', '0', '1025', '0', '10', '176', '西南风', '3-4', '12', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101110403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '39', '0', '1025', '-1', '10', '177', '东北风', '3-4', '14', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101110404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '61', '0', '1024', '-4', '10', '162', '西北风', '3-4', '15', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101110405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '51', '0', '1022', '0', '10', '214', '西风', '4-5', '18', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101110406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '47', '0', '1022', '2', '10', '219', '西南风', '4-5', '22', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101110407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '50', '0', '1022', '-2', '10', '219', '南风', '3-4', '16', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101110408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '54', '0.0', '1024', '-2', '10', '162', '北风', '微风', '2', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101110409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '60', '0.0', '1024', '-5', '10', '156', '南风', '3-4', '11', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101110410', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '47', '0', '1024', '-2', '10', '156', '南风', '3-4', '15', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101110411', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '71', '0.0', '1024', '-2', '10', '156', '北风', '微风', '0', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101110412', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '60', '0.0', '1023', '-4', '10', '184', '西北风', '3-4', '16', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101110413', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '31', '0', '1024', '1', '10', '163', '东南风', '4-5', '18', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101110501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '60', '0', '1023', '2', '4', '270', '西风', '3-4', '13', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101110502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '86', '0', '1023', '-1', '4', '270', '西南风', '3-4', '13', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101110503', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '57', '0.0', '1025', '2', '10', '168', '北风', '微风', '4', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101110504', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '66', '0.0', '1025', '2', '10', '168', '西风', '3-4', '10', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101110505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '56', '0.0', '1023', '0', '4', '270', '西风', '4-5', '17', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101110506', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '67', '0.0', '1023', '2', '4', '270', '西风', '4-5', '19', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101110507', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '53', '0', '1023', '3', '4', '270', '北风', '微风', '8', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101110508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '47', '0.0', '1024', '2', '10', '33', '北风', '4-5', '24', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101110509', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '37', '0.0', '1024', '3', '10', '33', '北风', '微风', '6', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101110510', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '38', '0', '1025', '3', '10', '70', '西风', '4-5', '21', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101110511', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '72', '0.0', '1025', '1', '10', '168', '南风', '3-4', '12', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101110601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '63', '0', '1023', '4', '4', '270', '东南风', '5-6', '32', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101110602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '76', '0.0', '1025', '0', '10', '168', '北风', '微风', '3', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101110603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '73', '0', '1023', '3', '4', '270', '北风', '微风', '9', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101110604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '63', '0', '1025', '4', '10', '158', '东南风', '5-6', '25', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101110605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '65', '0', '1023', '5', '4', '270', '西风', '3-4', '11', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101110606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '65', '0.0', '1026', '3', '10', '128', '东北风', '4-5', '20', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101110607', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '71', '0', '1026', '3', '10', '128', '北风', '微风', '9', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101110608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '76', '0.0', '1025', '2', '10', '158', '东风', '3-4', '13', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101110701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '84', '0', '1025', '4', '10', '109', '东北风', '3-4', '12', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101110702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '77', '0', '1025', '6', '10', '223', '东风', '3-4', '14', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101110703', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '9', '78', '0', '1025', '5', '10', '73', '北风', '3-4', '13', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101110704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '86', '0.0', '1025', '5', '10', '73', '北风', '微风', '3', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101110705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '83', '0.0', '1025', '5', '10', '109', '东南风', '3-4', '15', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101110706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '76', '0.0', '1025', '5', '10', '223', '西风', '3-4', '16', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101110707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '85', '0.0', '1025', '2', '10', '109', '东南风', '4-5', '24', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101110708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '82', '0.0', '1026', '4', '10', '98', '东南风', '3-4', '14', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101110709', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '64', '0', '1026', '3', '10', '169', '北风', '4-5', '22', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101110710', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '71', '0', '1025', '5', '10', '130', '北风', '微风', '0', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101110801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '81', '0', '1025', '6', '10', '155', '南风', '3-4', '12', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '59', '0', '1023', '6', '10', '184', '东风', '3-4', '14', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '80', '0.0', '1024', '6', '9', '169', '东风', '3-4', '11', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110804', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '4', '69', '0', '1025', '4', '10', '160', '西北风', '3-4', '10', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '82', '0.0', '1025', '6', '10', '155', '北风', '微风', '8', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101110806', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '80', '0.0', '1025', '6', '10', '155', '西北风', '3-4', '12', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '83', '0.0', '1025', '5', '10', '186', '南风', '3-4', '12', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110808', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '66', '0', '1025', '6', '10', '186', '东南风', '3-4', '10', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101110809', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '69', '0', '1024', '5', '10', '184', '东南风', '3-4', '10', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101110810', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '75', '0.0', '1025', '6', '10', '153', '西北风', '3-4', '13', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101110811', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '84', '0', '1025', '6', '10', '186', '东南风', '3-4', '12', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101110901', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '6', '65', '0', '1024', '1', '10', '185', '北风', '3-4', '11', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110903', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '5', '78', '0.0', '1024', '-1', '10', '185', '西北风', '3-4', '14', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110904', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '76', '0.0', '1023', '-4', '4', '270', '西南风', '3-4', '12', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110905', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '7', '82', '0.0', '1024', '-1', '10', '138', '西风', '3-4', '16', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110906', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '6', '76', '0', '1024', '-1', '10', '158', '西北风', '4-5', '19', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110907', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '7', '81', '0.0', '1024', '-1', '10', '138', '西北风', '3-4', '16', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110908', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '9', '73', '0.0', '1024', '1', '10', '158', '西风', '4-5', '19', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '57', '0', '1024', '3', '10', '138', '西北风', '6-7', '37', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110910', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '74', '0', '1031', '3', '4', '210', '北风', '微风', '6', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101110911', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '76', '0', '1023', '-1', '10', '252', '西北风', '3-4', '10', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101110912', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '5', '73', '0.0', '1024', '0', '10', '158', '西北风', '3-4', '11', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101111001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '59', '0', '1023', '2', '4', '270', '东北风', '4-5', '18', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101111002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '59', '0', '1023', '2', '4', '270', '东北风', '4-5', '19', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101111003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '43', '0', '1023', '3', '4', '270', '西南风', '5-6', '30', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101111004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '59', '0', '1023', '2', '4', '270', '东北风', '4-5', '20', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101111101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '73', '0', '1024', '0', '10', '138', '北风', '4-5', '22', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101120101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '40', '0', '1026', '6', '10', '192', '西南风', '6-7', '42', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101120102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '50', '0', '1026', '5', '10', '182', '南风', '7-8', '52', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101120103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '67', '0', '1026', '0', '10', '213', '西南风', '4-5', '19', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101120104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '46', '0', '1027', '5', '10', '201', '西南风', '5-6', '31', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101120105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '66', '0', '1027', '3', '10', '176', '南风', '6-7', '35', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101120106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '49', '0', '1027', '4', '10', '195', '南风', '4-5', '20', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101120201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '42', '0', '1027', '4', '10', '200', '西南风', '5-6', '31', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101120202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '39', '0', '1027', '4', '10', '200', '西南风', '3-4', '15', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101120204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '45', '0', '1027', '3', '10', '200', '西南风', '5-6', '32', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101120205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '44', '0', '1027', '3', '10', '200', '西南风', '6-7', '39', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101120206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '45', '0', '1027', '3', '10', '200', '西风', '3-4', '13', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101120207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '54', '0', '1027', '2', '10', '200', '西南风', '4-5', '23', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101120208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '55', '0', '1027', '0', '10', '200', '北风', '微风', '2', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101120301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '55', '0', '1027', '3', '10', '204', '南风', '4-5', '22', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101120302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '43', '0', '1028', '5', '10', '196', '南风', '6-7', '35', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101120303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '50', '0', '1028', '3', '10', '196', '东南风', '5-6', '29', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101120304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '75', '0', '1026', '-4', '10', '212', '东南风', '3-4', '14', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101120305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '45', '0', '1028', '4', '10', '199', '南风', '5-6', '29', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101120306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '54', '0', '1028', '2', '10', '223', '西风', '3-4', '10', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101120307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '43', '0', '1027', '5', '10', '212', '西南风', '4-5', '18', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101120308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '57', '0', '1027', '0', '10', '210', '西南风', '3-4', '12', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101120401', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '54', '0', '1025', '4', '10', '197', '南风', '4-5', '22', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101120402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '56', '0', '1025', '5', '10', '197', '南风', '6-7', '39', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101120403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '59', '0', '1026', '3', '10', '200', '西南风', '5-6', '29', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101120404', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-1', '64', '0', '1025', '2', '10', '200', '南风', '5-6', '32', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101120405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '55', '0', '1026', '4', '10', '182', '南风', '6-7', '36', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101120406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '54', '0', '1026', '3', '10', '213', '西南风', '4-5', '24', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101120407', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '62', '0', '1026', '1', '10', '213', '南风', '4-5', '22', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101120408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '64', '0', '1026', '2', '10', '200', '南风', '4-5', '19', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101120409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '53', '0', '1022', '3', '2', '320', '西南风', '5-6', '33', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101120410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '56', '0', '1025', '5', '10', '192', '南风', '5-6', '29', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101120411', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '54', '0', '1027', '4', '10', '176', '南风', '5-6', '25', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101120501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '44', '0', '1027', '3', '10', '226', '西南风', '7-8', '53', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101120502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '47', '0', '1027', '3', '10', '198', '南风', '4-5', '23', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101120503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '48', '0', '1026', '3', '10', '228', '西南风', '6-7', '39', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101120504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '43', '0', '1027', '2', '10', '222', '西南风', '5-6', '31', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101120505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '39', '0', '1027', '3', '10', '217', '西南风', '5-6', '32', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101120506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '51', '0', '1027', '0', '10', '206', '西南风', '4-5', '21', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101120507', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '49', '0', '1027', '2', '10', '206', '南风', '7-8', '44', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101120508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '39', '0', '1027', '3', '10', '226', '西南风', '5-6', '30', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101120509', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '43', '0', '1027', '3', '10', '226', '西南风', '5-6', '32', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101120510', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '54', '0', '1027', '1', '10', '200', '西南风', '3-4', '14', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101120511', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '64', '0', '1027', '0', '10', '200', '西北风', '3-4', '14', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101120601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '46', '0', '1028', '3', '10', '199', '西南风', '4-5', '24', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101120602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '51', '0', '1028', '3', '10', '212', '南风', '3-4', '13', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101120603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '48', '0', '1028', '3', '10', '200', '南风', '4-5', '20', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101120604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '43', '0', '1028', '4', '10', '215', '南风', '4-5', '19', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101120605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '39', '0', '1028', '4', '10', '199', '南风', '4-5', '17', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101120606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '58', '0', '1028', '2', '10', '197', '南风', '5-6', '33', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101120607', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '58', '0', '1028', '2', '10', '209', '南风', '5-6', '32', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101120608', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '49', '0', '1027', '2', '10', '200', '南风', '5-6', '32', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101120609', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '59', '0', '1029', '2', '10', '218', '西南风', '4-5', '17', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101120701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '63', '0', '1028', '5', '10', '176', '西风', '3-4', '16', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101120702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '59', '0', '1028', '4', '10', '182', '南风', '4-5', '20', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101120703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '75', '0', '1029', '3', '10', '182', '西风', '3-4', '10', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101120704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '85', '0', '1029', '2', '10', '181', '东南风', '4-5', '24', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101120705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '69', '0', '1028', '3', '10', '176', '东南风', '4-5', '21', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101120706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '68', '0', '1028', '3', '10', '177', '南风', '5-6', '32', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101120707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '77', '0', '1027', '2', '10', '176', '东南风', '4-5', '21', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101120708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '60', '0', '1028', '3', '10', '184', '南风', '4-5', '17', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101120709', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '59', '0', '1027', '4', '10', '181', '南风', '5-6', '30', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101120710', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '68', '0', '1028', '3', '10', '177', '东南风', '3-4', '12', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101120711', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '65', '0', '1028', '3', '10', '174', '南风', '5-6', '26', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101120801', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-3', '63', '0', '1027', '3', '10', '181', '西风', '4-5', '24', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101120802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '54', '0', '1029', '3', '10', '195', '东南风', '3-4', '11', '2016-12-16 23:01:01');
INSERT INTO `w_weather_data` VALUES ('CN101120804', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '63', '0', '1027', '3', '10', '176', '东南风', '3-4', '14', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101120805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '69', '0', '1027', '3', '10', '176', '东南风', '4-5', '17', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101120806', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '-2', '75', '0', '1028', '1', '10', '175', '东南风', '4-5', '20', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101120901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '56', '0', '1030', '3', '10', '210', '西南风', '4-5', '19', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '60', '0', '1030', '2', '10', '216', '西南风', '3-4', '11', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '64', '0', '1029', '2', '10', '212', '西南风', '3-4', '16', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '64', '0', '1030', '2', '10', '187', '西南风', '3-4', '10', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '55', '0', '1030', '3', '10', '210', '南风', '4-5', '24', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '69', '0', '1030', '2', '10', '199', '南风', '4-5', '21', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '56', '0', '1029', '2', '10', '214', '东风', '4-5', '17', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '68', '0', '1027', '1', '10', '176', '东南风', '5-6', '32', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101120909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '74', '0', '1030', '2', '10', '193', '北风', '微风', '9', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101120910', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '56', '0', '1029', '2', '10', '216', '南风', '4-5', '24', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101121001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '63', '0', '1027', '3', '10', '187', '南风', '4-5', '19', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '58', '0', '1027', '4', '10', '188', '南风', '4-5', '22', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '61', '0', '1027', '3', '10', '187', '南风', '4-5', '21', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '66', '0', '1027', '3', '10', '187', '南风', '4-5', '21', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101121005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '59', '0', '1027', '4', '10', '184', '南风', '5-6', '26', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '63', '0', '1028', '3', '10', '182', '南风', '5-6', '31', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121007', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '67', '0', '1028', '3', '10', '178', '南风', '4-5', '21', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '65', '0', '1028', '3', '10', '177', '南风', '3-4', '12', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101121009', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '64', '0', '1029', '4', '10', '173', '南风', '5-6', '31', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101121101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '69', '0', '1026', '-2', '10', '212', '东风', '3-4', '16', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101121102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '47', '0', '1027', '3', '10', '212', '南风', '3-4', '11', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101121103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '52', '0', '1026', '3', '10', '213', '西南风', '4-5', '19', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101121104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '55', '0', '1026', '2', '10', '213', '西南风', '3-4', '13', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101121105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '48', '0', '1026', '3', '10', '213', '西南风', '4-5', '21', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101121106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '57', '0', '1026', '0', '10', '213', '西南风', '4-5', '18', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101121107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '37', '0', '1027', '6', '10', '201', '东南风', '3-4', '11', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101121201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '39', '0', '1027', '5', '10', '212', '西南风', '4-5', '20', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101121202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '44', '0', '1027', '3', '10', '212', '西南风', '4-5', '23', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101121203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '42', '0', '1027', '4', '10', '215', '西南风', '4-5', '20', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101121204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '49', '0', '1027', '2', '10', '212', '西南风', '4-5', '23', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101121205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '46', '0', '1028', '3', '10', '200', '西南风', '4-5', '22', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101121301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '35', '0', '1026', '4', '10', '237', '西南风', '5-6', '33', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101121302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '55', '0', '1027', '3', '10', '235', '西南风', '5-6', '30', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101121303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '66', '0', '1027', '1', '10', '235', '西北风', '3-4', '14', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101121304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '68', '0', '1027', '-2', '10', '200', '西北风', '3-4', '16', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101121305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '63', '0', '1027', '4', '10', '235', '西南风', '6-7', '41', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101121306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '58', '0', '1027', '6', '10', '235', '西南风', '5-6', '26', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101121401', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '83', '0', '1030', '0', '10', '193', '东北风', '3-4', '16', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101121402', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '68', '0', '1030', '3', '10', '179', '东南风', '4-5', '17', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101121403', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '83', '0', '1030', '0', '10', '193', '东南风', '3-4', '15', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101121404', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '63', '0', '1030', '3', '10', '184', '南风', '4-5', '22', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101121405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '74', '0', '1029', '3', '10', '176', '南风', '4-5', '20', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101121501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '44', '0', '1030', '3', '10', '232', '西南风', '5-6', '29', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101121502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '45', '0', '1029', '4', '10', '218', '南风', '4-5', '21', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101121503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '60', '0', '1029', '2', '10', '212', '南风', '4-5', '23', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101121601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '52', '0', '1028', '3', '10', '196', '西南风', '4-5', '17', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101121701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '61', '0', '1026', '3', '10', '188', '南风', '4-5', '18', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101121702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '62', '0', '1026', '4', '10', '190', '南风', '5-6', '32', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101121703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '59', '0', '1026', '4', '10', '185', '南风', '6-7', '36', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101121704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '54', '0', '1026', '5', '10', '200', '南风', '4-5', '19', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101121705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '52', '0', '1026', '5', '10', '188', '南风', '6-7', '34', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101121706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '48', '0', '1026', '6', '10', '182', '南风', '6-7', '42', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101121707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '65', '0', '1025', '3', '10', '192', '南风', '5-6', '29', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101121709', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '65', '0', '1026', '3', '10', '186', '南风', '4-5', '20', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101130101', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-7', '96', '0', '1021', '-6', '1', '30', '东北风', '3-4', '11', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101130103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '48', '0', '1021', '0', '1', '30', '西南风', '4-5', '21', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101130105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '71', '0', '1022', '-2', '10', '90', '东南风', '5-6', '26', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101130108', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '37', '0', '1021', '1', '1', '30', '西南风', '4-5', '24', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101130109', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '56', '0', '1021', '-1', '1', '30', '东南风', '5-6', '33', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101130110', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '37', '0', '1021', '1', '1', '30', '西南风', '4-5', '22', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101130201', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-7', '96', '0', '1022', '-6', '10', '150', '东风', '3-4', '11', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101130202', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-10', '96', '0', '1023', '-6', '10', '247', '东风', '3-4', '15', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101130203', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-7', '96', '0', '1022', '-6', '10', '150', '东风', '3-4', '15', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101130301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '86', '0', '1022', '-2', '10', '45', '东风', '3-4', '11', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101130302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '88', '0', '1021', '-4', '10', '69', '东北风', '4-5', '17', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101130303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '92', '0', '1022', '-5', '10', '45', '东北风', '3-4', '15', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101130401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '65', '0', '1021', '-2', '1', '30', '北风', '4-5', '23', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '96', '0', '1022', '-4', '10', '45', '北风', '微风', '5', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '84', '0', '1021', '-4', '1', '30', '东北风', '3-4', '13', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '88', '0', '1021', '-4', '1', '30', '东北风', '4-5', '24', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130405', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-5', '95', '0', '1023', '-6', '10', '99', '东风', '4-5', '22', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130406', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-5', '94', '0', '1023', '-8', '10', '99', '东南风', '4-5', '24', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '94', '0', '1022', '-2', '10', '45', '东北风', '3-4', '14', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101130408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '59', '0', '1024', '-5', '10', '106', '南风', '4-5', '20', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101130409', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '83', '0', '1021', '-2', '1', '30', '东北风', '4-5', '22', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101130501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '54', '0', '1023', '2', '10', '123', '北风', '4-5', '23', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101130502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '65', '0', '1022', '-2', '10', '232', '西风', '4-5', '22', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101130504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '69', '0', '1024', '-3', '10', '106', '东北风', '3-4', '13', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101130601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '81', '0.0', '1023', '-2', '10', '228', '西北风', '3-4', '15', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '89', '0', '1022', '-5', '10', '229', '北风', '3-4', '15', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101130603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '83', '0', '1025', '-6', '10', '250', '北风', '微风', '4', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '76', '0', '1024', '-6', '10', '1', '东南风', '3-4', '11', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '55', '0', '1022', '-1', '10', '57', '东北风', '3-4', '14', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '82', '0', '1019', '-4', '10', '123', '北风', '3-4', '14', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '88', '0', '1023', '-5', '10', '228', '西南风', '3-4', '14', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '91', '0.5', '1022', '-5', '10', '213', '东风', '3-4', '14', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101130610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-20', '79', '0', '1019', '-25', '10', '123', '西北风', '3-4', '16', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101130611', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '70', '0', '1027', '-4', '10', '258', '北风', '微风', '5', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101130612', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '91', '0.0', '1023', '-4', '10', '228', '南风', '3-4', '12', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101130613', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '63', '0', '1022', '-10', '10', '65', '北风', '微风', '8', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101130614', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '71', '0', '1021', '-9', '10', '214', '东北风', '3-4', '16', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101130701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '83', '0', '1023', '-6', '10', '198', '东北风', '3-4', '10', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101130801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '84', '0', '1020', '-5', '10', '156', '东北风', '3-4', '11', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101130802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '87', '0', '1020', '-5', '10', '130', '南风', '4-5', '24', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101130803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '81', '0', '1020', '-2', '10', '156', '东北风', '3-4', '12', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101130804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '97', '0', '1020', '-6', '10', '180', '北风', '微风', '5', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101130805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '90', '0', '1021', '-4', '10', '250', '北风', '4-5', '18', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101130806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '74', '0', '1021', '-2', '10', '250', '西北风', '3-4', '16', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101130807', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '1', '86', '0', '1021', '-5', '10', '250', '北风', '3-4', '10', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101130808', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '81', '0', '1022', '-1', '10', '183', '北风', '3-4', '14', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101130809', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '87', '0', '1022', '-4', '10', '204', '西北风', '3-4', '16', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101130901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '83', '0', '1020', '0', '4', '300', '西北风', '3-4', '12', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101130902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '77', '0', '1020', '-1', '4', '300', '西北风', '3-4', '14', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101130903', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-12', '37', '0', '1022', '-8', '10', '191', '西南风', '3-4', '16', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101130904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '72', '0', '1019', '-2', '10', '82', '东南风', '3-4', '12', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101130905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '74', '0', '1019', '-2', '10', '82', '北风', '微风', '6', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101130906', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '61', '0', '1018', '0', '10', '45', '西南风', '3-4', '12', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101130907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '70', '0', '1019', '-2', '10', '49', '北风', '微风', '5', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101130908', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '77', '0', '1022', '-3', '10', '228', '北风', '微风', '2', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101130909', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '78', '0', '1020', '-2', '4', '300', '北风', '微风', '2', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101130910', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '82', '0', '1020', '-2', '4', '300', '西北风', '3-4', '11', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101130911', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '83', '0', '1020', '0', '4', '300', '西北风', '3-4', '10', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101130912', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '83', '0', '1020', '0', '4', '300', '西北风', '3-4', '15', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101131001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '87', '0', '1016', '0', '10', '87', '北风', '微风', '1', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '86', '0', '1016', '1', '10', '233', '东风', '3-4', '13', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '79', '0', '1018', '-1', '10', '89', '东风', '3-4', '12', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '51', '0', '1016', '3', '10', '87', '西北风', '4-5', '19', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '76', '0', '1018', '0', '10', '89', '北风', '微风', '5', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '51', '0', '1018', '3', '10', '89', '南风', '4-5', '21', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131007', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '70', '0', '1016', '-8', '10', '22', '西风', '4-5', '24', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '64', '0', '1016', '-5', '10', '233', '北风', '微风', '6', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101131009', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '70', '0', '1014', '3', '10', '68', '北风', '3-4', '16', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101131010', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '60', '0', '1014', '3', '10', '68', '东北风', '3-4', '11', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101131011', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '90', '0', '1021', '-3', '10', '69', '东北风', '3-4', '15', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101131101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '64', '0', '1018', '-2', '10', '65', '东风', '3-4', '13', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '75', '0', '1017', '-2', '10', '128', '南风', '3-4', '12', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '79', '0', '1020', '-5', '10', '110', '东风', '4-5', '22', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '77', '0', '1023', '-10', '10', '247', '东北风', '4-5', '20', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '78', '0', '1020', '-6', '10', '190', '东风', '3-4', '12', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '90', '0', '1021', '-3', '10', '69', '东北风', '3-4', '14', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '90', '0', '1022', '-3', '10', '45', '东风', '3-4', '15', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101131201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '78', '0', '1026', '-6', '10', '186', '东风', '3-4', '14', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101131203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '73', '0', '1025', '-12', '10', '183', '西南风', '3-4', '14', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101131204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '55', '0', '1032', '-8', '10', '59', '西南风', '4-5', '24', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101131301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '47', '0', '1020', '2', '10', '70', '东风', '3-4', '12', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101131302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '55', '0', '1019', '0', '10', '125', '西风', '3-4', '16', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101131303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '58', '0', '1020', '0', '10', '70', '东风', '3-4', '15', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101131304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '54', '0', '1020', '1', '10', '70', '东北风', '3-4', '12', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101131305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '56', '0', '1020', '0', '10', '70', '东南风', '3-4', '15', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101131306', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '57', '0', '1020', '0', '10', '45', '北风', '微风', '5', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101131307', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '57', '0', '1019', '0', '10', '19', '东北风', '3-4', '15', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101131401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '89', '0', '1023', '-14', '10', '102', '北风', '3-4', '11', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '92', '0', '1022', '-8', '10', '102', '东风', '5-6', '32', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '58', '0', '1022', '0', '10', '107', '东南风', '9-10', '76', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '88', '0', '1022', '-6', '10', '107', '东南风', '6-7', '38', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '90', '0', '1024', '-6', '10', '133', '东风', '4-5', '17', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-9', '84', '0', '1023', '-16', '10', '166', '北风', '微风', '4', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-11', '83', '0', '1022', '-19', '10', '109', '东风', '3-4', '16', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101131501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '78', '0', '1020', '0', '4', '300', '北风', '微风', '9', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101131502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '84', '0', '1018', '-4', '10', '63', '西北风', '3-4', '14', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101131503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '85', '0', '1020', '-2', '4', '300', '西南风', '3-4', '13', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101131504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '63', '0', '1020', '-6', '10', '130', '西风', '4-5', '22', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101131601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '78', '0', '1018', '-4', '10', '20', '西风', '3-4', '11', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101131602', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '-4', '89', '0', '1016', '-11', '10', '214', '西南风', '3-4', '14', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101131603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '89', '0', '1018', '-2', '10', '20', '北风', '微风', '4', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101131606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '91', '0', '1017', '-2', '10', '163', '南风', '6-7', '34', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101140101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '22', '0', '1014', '0', '10', '272', '北风', '微风', '3', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101140102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '21', '0', '1014', '-1', '10', '272', '东风', '4-5', '19', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101140103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '15', '0', '1015', '2', '10', '279', '北风', '微风', '8', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101140104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '42', '0', '1014', '-5', '10', '272', '西风', '3-4', '16', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101140105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '18', '0', '1014', '1', '10', '272', '北风', '3-4', '16', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101140106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '30', '0', '1015', '0', '10', '280', '西北风', '3-4', '11', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101140107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '18', '0', '1014', '0', '10', '272', '东风', '4-5', '21', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101140108', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '25', '0', '1015', '-2', '10', '154', '东南风', '4-5', '20', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101140201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '25', '0', '1015', '-1', '10', '229', '东北风', '3-4', '16', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '9', '0', '1016', '6', '10', '280', '西风', '3-4', '11', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '20', '0', '1015', '-2', '10', '229', '北风', '微风', '7', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '25', '0', '1021', '2', '6', '110', '西北风', '3-4', '15', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101140205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '12', '0', '1016', '2', '10', '280', '南风', '3-4', '10', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101140206', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '50', '0', '1016', '-3', '10', '269', '东风', '3-4', '14', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101140207', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '38', '0', '1016', '-5', '10', '189', '北风', '微风', '7', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101140208', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '7', '0.0', '1020', '1', '10', '235', '西南风', '7-8', '45', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101140209', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '12', '0', '1017', '3', '10', '304', '东北风', '5-6', '33', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101140210', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '13', '0', '1017', '1', '10', '304', '东北风', '4-5', '20', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101140211', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '14', '0', '1019', '3', '10', '0', '东南风', '3-4', '13', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101140212', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '7', '0', '1015', '6', '10', '290', '东南风', '4-5', '17', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101140213', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '9', '0', '1016', '5', '10', '279', '西南风', '4-5', '21', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101140214', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '13', '0', '1015', '1', '10', '226', '东风', '4-5', '19', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101140216', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '11', '0', '1016', '1', '10', '273', '东北风', '4-5', '21', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140217', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '20', '0', '1015', '0', '10', '290', '南风', '3-4', '11', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140218', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '38', '0', '1018', '-5', '10', '160', '北风', '微风', '0', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140219', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '15', '0', '1016', '0', '10', '269', '东风', '3-4', '16', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101140220', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '15', '0', '1015', '2', '10', '290', '南风', '4-5', '20', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101140301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '35', '0', '1015', '-2', '10', '269', '西南风', '3-4', '12', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101140302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '55', '0', '1015', '-4', '10', '280', '西风', '3-4', '14', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101140303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '28', '0', '1015', '0', '10', '269', '西南风', '4-5', '24', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101140304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '19', '0', '1015', '3', '10', '269', '西南风', '3-4', '14', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101140305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '18', '0', '1016', '3', '10', '269', '北风', '4-5', '24', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101140306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '64', '0', '1018', '-7', '10', '204', '西风', '3-4', '11', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101140307', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '44', '0', '1015', '1', '10', '283', '东南风', '3-4', '10', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101140308', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '35', '0', '1015', '-2', '10', '269', '西南风', '3-4', '15', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101140309', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '35', '0', '1015', '-2', '10', '269', '西南风', '3-4', '14', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101140310', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '13', '0', '1015', '2', '10', '269', '南风', '3-4', '16', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101140311', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '27', '0', '1018', '3', '10', '160', '东南风', '4-5', '19', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101140312', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '35', '0', '1015', '1', '3', '0', '东南风', '4-5', '19', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101140313', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '25', '0', '1015', '-1', '10', '269', '南风', '4-5', '24', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101140314', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '11', '0', '1015', '1', '10', '269', '东南风', '5-6', '29', '2016-12-16 23:15:54');
INSERT INTO `w_weather_data` VALUES ('CN101140401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '40', '0', '1019', '6', '10', '161', '南风', '4-5', '24', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101140402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '39', '0', '1019', '8', '10', '192', '西北风', '5-6', '25', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101140403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '48', '0', '1017', '4', '10', '163', '东南风', '3-4', '12', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101140404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '58', '0', '1021', '5', '10', '64', '北风', '微风', '10', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101140405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '20', '0', '1018', '3', '10', '150', '西南风', '4-5', '23', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101140406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '13', '0', '1016', '7', '10', '218', '东北风', '微风', '1', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101140407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '85', '0', '1019', '11', '10', '192', '北风', '3-4', '12', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101140501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '17', '0', '1016', '2', '10', '213', '东北风', '3-4', '15', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101140502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '25', '0', '1017', '-2', '10', '241', '北风', '3-4', '11', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101140503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '16', '0', '1018', '0', '10', '249', '东北风', '4-5', '19', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101140504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '19', '0', '1019', '4', '10', '212', '东南风', '4-5', '21', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101140505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '26', '0', '1016', '0', '10', '231', '东北风', '3-4', '16', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101140506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '37', '0.0', '1016', '0', '10', '231', '北风', '微风', '10', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101140507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '20', '0', '1016', '0', '10', '213', '南风', '3-4', '12', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101140508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '12', '0', '1017', '7', '10', '220', '西南风', '3-4', '15', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101140509', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '31', '0', '1014', '-6', '10', '225', '东北风', '3-4', '15', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101140510', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '17', '0', '1016', '3', '10', '219', '西风', '3-4', '16', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101140511', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '15', '0', '1015', '3', '10', '209', '西北风', '3-4', '12', '2016-12-16 23:01:47');
INSERT INTO `w_weather_data` VALUES ('CN101140601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '12', '0', '1014', '0', '10', '286', '西风', '5-6', '27', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '12', '0', '1014', '-2', '10', '286', '西北风', '5-6', '27', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '11', '0', '1017', '0', '10', '268', '西北风', '5-6', '33', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-9', '22', '0', '1013', '-2', '10', '289', '西风', '4-5', '19', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-10', '9', '0', '1014', '-4', '10', '279', '西北风', '6-7', '38', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '5', '0', '1016', '3', '10', '291', '西南风', '6-7', '41', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-10', '14', '0', '1014', '-8', '10', '279', '西风', '6-7', '35', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '20', '0', '1016', '-4', '10', '291', '南风', '4-5', '23', '2016-12-16 23:02:29');
INSERT INTO `w_weather_data` VALUES ('CN101140609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '13', '0.0', '1017', '1', '10', '253', '东北风', '3-4', '14', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101140610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-9', '10', '0', '1013', '-10', '10', '289', '西风', '6-7', '42', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101140701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '14', '0', '1021', '-6', '10', '196', '东风', '4-5', '21', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '14', '0', '1014', '-6', '10', '283', '东风', '4-5', '24', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '17', '0', '1013', '-1', '10', '280', '东北风', '4-5', '24', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '13', '0', '1020', '0', '10', '236', '西风', '4-5', '20', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '11', '0', '1021', '3', '10', '196', '北风', '微风', '1', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '13', '0', '1019', '1', '10', '220', '西风', '3-4', '15', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-7', '13', '0', '1020', '0', '10', '238', '西风', '4-5', '20', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '18', '0', '1021', '2', '10', '235', '西南风', '6-7', '34', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101140709', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-12', '18', '0', '1018', '-3', '10', '256', '西南风', '4-5', '22', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101140710', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-5', '16', '0', '1017', '1', '10', '270', '西风', '5-6', '31', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101150101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '56', '0', '1016', '-6', '10', '72', '东北风', '3-4', '11', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101150102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '55', '0', '1025', '-5', '10', '224', '西北风', '3-4', '13', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101150103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '49', '0', '1014', '-6', '10', '350', '北风', '3-4', '14', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101150104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '45', '0', '1016', '-4', '10', '72', '西南风', '3-4', '10', '2016-12-16 23:15:55');
INSERT INTO `w_weather_data` VALUES ('CN101150201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '43', '0', '1014', '1', '10', '6', '东南风', '4-5', '17', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101150202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '47', '0', '1016', '0', '10', '125', '东风', '3-4', '10', '2016-12-16 23:01:06');
INSERT INTO `w_weather_data` VALUES ('CN101150203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '70', '0', '1014', '-4', '10', '6', '南风', '3-4', '11', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101150204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '59', '0', '1016', '-6', '10', '72', '北风', '微风', '6', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101150205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '43', '0', '1014', '-7', '10', '6', '西北风', '4-5', '23', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101150206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '36', '0', '1014', '1', '10', '6', '西南风', '3-4', '12', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101150301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '29', '0', '1012', '-1', '10', '231', '西南风', '3-4', '14', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101150302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '38', '0', '1014', '-1', '10', '6', '西风', '4-5', '18', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101150303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '34', '0', '1012', '-10', '10', '215', '西北风', '3-4', '10', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101150304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '43', '0', '1012', '-11', '10', '231', '南风', '4-5', '24', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101150401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '45', '0', '1014', '-9', '10', '350', '北风', '3-4', '13', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101150404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '31', '0', '1014', '-1', '10', '5', '西南风', '4-5', '18', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101150406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '39', '0', '1013', '-13', '10', '62', '西南风', '4-5', '20', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101150407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '40', '0', '1013', '-11', '10', '198', '南风', '3-4', '14', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101150408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '31', '0', '1013', '-7', '10', '198', '南风', '3-4', '12', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101150501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '34', '0', '1013', '-11', '10', '253', '北风', '微风', '1', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101150502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '33', '0', '1013', '-7', '10', '221', '西北风', '3-4', '12', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101150503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '20', '0', '1013', '-9', '10', '253', '西南风', '3-4', '15', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101150504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '20', '0', '1013', '-8', '10', '253', '南风', '4-5', '19', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101150505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '38', '0', '1012', '-9', '10', '253', '西南风', '3-4', '16', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101150506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '20', '0', '1013', '-13', '10', '256', '东北风', '3-4', '12', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101150601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '25', '0', '1013', '-1', '10', '243', '西风', '3-4', '16', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101150602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '35', '0', '1013', '-13', '10', '243', '东南风', '4-5', '19', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101150603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-10', '37', '0', '1012', '-6', '10', '244', '西风', '3-4', '16', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101150604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '25', '0', '1013', '-6', '10', '251', '南风', '4-5', '24', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101150605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '22', '0', '1015', '-1', '10', '267', '西南风', '4-5', '24', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101150606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '25', '0', '1011', '-7', '10', '270', '东北风', '4-5', '24', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101150701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '31', '0', '1015', '-8', '10', '236', '北风', '微风', '3', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101150708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-6', '30', '0.0', '1017', '-13', '10', '301', '西风', '3-4', '16', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101150709', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '37', '0', '1013', '-10', '10', '285', '东北风', '3-4', '14', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101150712', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '33', '0.0', '1019', '-7', '10', '92', '东北风', '3-4', '14', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101150713', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '24', '0', '1019', '-6', '10', '293', '东南风', '3-4', '15', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101150716', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '37', '0.0', '1015', '-13', '10', '236', '东风', '3-4', '11', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101150801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '64', '0', '1016', '-12', '10', '177', '西北风', '4-5', '23', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101150802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '56', '0', '1018', '-10', '10', '73', '西北风', '3-4', '14', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101150803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '37', '0', '1018', '-8', '10', '46', '东风', '4-5', '18', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101150806', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '45', '0', '1016', '-11', '10', '177', '北风', '3-4', '10', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101160101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '60', '0', '1022', '-1', '5', '330', '东风', '3-4', '10', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101160102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '59', '0', '1022', '-5', '5', '330', '北风', '4-5', '17', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101160103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '56', '0.0', '1016', '-5', '10', '125', '北风', '3-4', '12', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101160104', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-9', '57', '0', '1022', '-4', '5', '330', '西风', '4-5', '23', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101160201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '70', '0', '1021', '-2', '10', '135', '东南风', '4-5', '22', '2016-12-16 23:15:06');
INSERT INTO `w_weather_data` VALUES ('CN101160202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '80', '0.0', '1021', '-3', '10', '135', '西风', '3-4', '14', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '77', '0.0', '1021', '-3', '10', '135', '北风', '微风', '3', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '68', '0.0', '1018', '-6', '10', '88', '西南风', '4-5', '18', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160205', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '2', '65', '0', '1015', '-5', '10', '78', '西风', '3-4', '11', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '68', '0.0', '1020', '-3', '10', '123', '西北风', '3-4', '11', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160207', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '1', '56', '0', '1016', '-2', '10', '165', '西南风', '3-4', '11', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '70', '0', '1021', '-2', '10', '135', '东南风', '4-5', '24', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101160301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '66', '0', '1023', '-1', '10', '237', '北风', '4-5', '24', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '82', '0.0', '1023', '-4', '10', '157', '西南风', '3-4', '11', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '78', '0.0', '1023', '-2', '4', '270', '北风', '4-5', '20', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '70', '0.0', '1024', '0', '10', '218', '西风', '4-5', '23', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '85', '0.0', '1023', '-5', '10', '237', '西南风', '3-4', '12', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '68', '0.0', '1023', '2', '10', '252', '东风', '3-4', '15', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '74', '0.0', '1022', '0', '10', '151', '北风', '微风', '3', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '66', '0', '1023', '-1', '10', '237', '北风', '4-5', '23', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101160401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '60', '0', '1023', '2', '10', '157', '西南风', '4-5', '23', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '60', '0', '1022', '-2', '10', '179', '西北风', '4-5', '23', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '79', '0.0', '1022', '-6', '10', '179', '北风', '3-4', '16', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '53', '0.0', '1023', '1', '10', '193', '南风', '4-5', '23', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '52', '0.0', '1023', '1', '10', '139', '南风', '4-5', '20', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '71', '0.0', '1023', '-2', '10', '139', '南风', '3-4', '13', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '73', '0.0', '1023', '-1', '10', '237', '西北风', '3-4', '16', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '73', '0.0', '1023', '-2', '10', '157', '南风', '3-4', '12', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101160501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '55', '0', '1020', '-1', '10', '24', '西南风', '3-4', '12', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101160502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '47', '0', '1022', '-1', '10', '330', '西南风', '3-4', '14', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101160503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '21', '0.0', '1018', '-1', '10', '33', '南风', '4-5', '23', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101160505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '36', '0.0', '1018', '-8', '10', '52', '东风', '4-5', '18', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101160601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '50', '0.0', '1022', '-2', '10', '356', '西南风', '3-4', '10', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101160602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '34', '0', '1022', '-4', '10', '356', '西南风', '5-6', '25', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101160701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '56', '0', '1021', '-8', '10', '336', '东南风', '4-5', '20', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101160702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '40', '0.0', '1018', '-8', '10', '46', '西南风', '3-4', '16', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101160703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '45', '0.0', '1021', '-9', '10', '294', '南风', '4-5', '24', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101160704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '50', '0.0', '1021', '-2', '10', '336', '东风', '4-5', '23', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101160705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '74', '0', '1019', '-6', '10', '331', '东北风', '3-4', '13', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101160706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '45', '0', '1021', '-4', '10', '294', '东南风', '4-5', '20', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101160801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '49', '0', '1020', '-2', '10', '326', '西南风', '4-5', '18', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101160803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '54', '0', '1021', '-2', '10', '283', '西风', '4-5', '23', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101160804', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '61', '0', '1025', '-5', '10', '239', '南风', '3-4', '15', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101160805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '70', '0', '1023', '-6', '10', '260', '东南风', '3-4', '13', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101160806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '63', '0.0', '1025', '-9', '10', '239', '东风', '4-5', '18', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101160807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '61', '0', '1022', '-5', '10', '276', '西风', '4-5', '20', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101160808', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-2', '61', '0', '1025', '-5', '10', '239', '南风', '3-4', '13', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101160901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '66', '0.0', '1023', '4', '10', '176', '南风', '3-4', '12', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101160903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '74', '0.0', '1023', '3', '10', '252', '东南风', '3-4', '13', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101160904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '68', '0.0', '1023', '3', '10', '176', '北风', '3-4', '13', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101160905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '75', '0.0', '1020', '1', '10', '123', '西风', '3-4', '16', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101160906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '79', '0.0', '1020', '0', '10', '123', '东北风', '3-4', '13', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101160907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '72', '0.0', '1023', '2', '10', '176', '西风', '3-4', '13', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101160908', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '4', '68', '0', '1023', '4', '10', '176', '北风', '微风', '4', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101161001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '57', '0', '1021', '6', '10', '170', '东风', '3-4', '16', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101161002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '77', '0.0', '1023', '4', '10', '184', '北风', '3-4', '15', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101161003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '61', '0.0', '1022', '7', '10', '146', '东南风', '4-5', '18', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101161004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '69', '0.0', '1021', '-1', '10', '170', '西北风', '3-4', '15', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101161005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '81', '0.0', '1023', '4', '10', '184', '西风', '3-4', '12', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101161006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '76', '0.0', '1023', '3', '10', '131', '西北风', '3-4', '16', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101161007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '67', '0.0', '1023', '3', '10', '131', '北风', '3-4', '10', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101161008', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '78', '0.0', '1025', '3', '4', '190', '北风', '微风', '7', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101161009', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '73', '0.0', '1024', '3', '10', '177', '北风', '微风', '5', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101161101', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '3', '58', '0', '1014', '-2', '10', '30', '西风', '3-4', '11', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101161102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '51', '0.0', '1015', '-4', '10', '78', '东南风', '4-5', '17', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101161103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '64', '0.0', '1014', '-2', '10', '30', '西北风', '3-4', '14', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101161104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '70', '0.0', '1015', '-4', '10', '78', '西南风', '3-4', '13', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101161105', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '3', '62', '0.0', '1014', '-4', '10', '30', '西南风', '3-4', '11', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101161106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '39', '0.0', '1014', '1', '10', '30', '东南风', '5-6', '33', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101161107', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '3', '58', '0', '1014', '-2', '10', '30', '西风', '3-4', '15', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101161201', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '1', '37', '0', '1013', '-4', '10', '203', '南风', '3-4', '12', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101161202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '38', '0.0', '1016', '-4', '10', '165', '北风', '4-5', '22', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101161203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '46', '0.0', '1014', '-4', '10', '215', '北风', '3-4', '16', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101161204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '61', '0.0', '1021', '3', '10', '170', '东风', '3-4', '13', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101161205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '47', '0.0', '1016', '-3', '10', '165', '东南风', '3-4', '10', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101161206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '30', '0', '1012', '-4', '10', '180', '西北风', '4-5', '21', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101161207', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-2', '34', '0.0', '1012', '-4', '10', '180', '北风', '3-4', '12', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101161208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '26', '0.0', '1013', '-2', '10', '203', '南风', '4-5', '18', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101161301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '62', '0.0', '1022', '-2', '5', '330', '西风', '3-4', '14', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101161302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '75', '0', '1022', '-4', '5', '330', '西风', '3-4', '15', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101161303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '77', '0.0', '1021', '-4', '10', '110', '西南风', '3-4', '13', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101161304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-9', '62', '0.0', '1022', '-2', '5', '330', '西风', '3-4', '16', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101161305', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '3', '42', '0', '1019', '-1', '10', '135', '东南风', '4-5', '20', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101161401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '51', '0', '1020', '-1', '10', '316', '西风', '4-5', '24', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101170101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '66', '0', '1022', '-4', '10', '100', '西南风', '3-4', '11', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101170102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '72', '0', '1022', '-3', '10', '259', '南风', '3-4', '13', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101170103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '84', '0', '1022', '-5', '10', '259', '东南风', '4-5', '22', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101170104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '74', '0', '1022', '-4', '10', '100', '北风', '微风', '8', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101170201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '38', '0', '1022', '0', '10', '219', '西北风', '4-5', '19', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101170202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '41', '0', '1022', '1', '10', '219', '北风', '4-5', '24', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101170203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '79', '0', '1022', '-5', '10', '219', '南风', '3-4', '11', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101170204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '62', '0', '1022', '-6', '10', '130', '东风', '3-4', '16', '2016-12-16 23:16:26');
INSERT INTO `w_weather_data` VALUES ('CN101170301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '61', '0', '1022', '-2', '10', '259', '西风', '3-4', '14', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101170302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '47', '0', '1021', '0', '10', '241', '北风', '4-5', '23', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101170303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '53', '0', '1021', '-1', '10', '225', '西风', '4-5', '19', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101170306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '57', '0', '1022', '-1', '10', '259', '西南风', '4-5', '23', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101170401', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-4', '55', '0', '1022', '0', '10', '244', '西南风', '3-4', '13', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101170402', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '-2', '82', '0', '1022', '-6', '10', '151', '西北风', '3-4', '11', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101170403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '75', '0', '1022', '-2', '10', '151', '南风', '3-4', '15', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101170404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '60', '0', '1023', '-1', '10', '252', '西风', '5-6', '32', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101170406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '77', '0', '1022', '-5', '10', '244', '北风', '微风', '2', '2016-12-16 23:02:22');
INSERT INTO `w_weather_data` VALUES ('CN101170501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '49', '0', '1019', '-1', '10', '287', '西北风', '4-5', '24', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101170502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '45', '0', '1022', '1', '10', '289', '西风', '4-5', '24', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101170504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-4', '40', '0', '1021', '2', '10', '226', '西北风', '4-5', '20', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101180101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '56', '0', '1025', '6', '4', '190', '南风', '4-5', '23', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '71', '0', '1026', '2', '10', '116', '北风', '微风', '7', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '45', '0', '1025', '7', '4', '190', '东南风', '3-4', '12', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '52', '0', '1025', '4', '4', '190', '西北风', '4-5', '20', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '55', '0', '1025', '5', '4', '190', '西风', '3-4', '16', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '72', '0', '1025', '3', '4', '190', '南风', '4-5', '22', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '66', '0', '1025', '4', '4', '190', '东南风', '3-4', '12', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '45', '0', '1027', '7', '10', '165', '东南风', '3-4', '12', '2016-12-16 23:01:38');
INSERT INTO `w_weather_data` VALUES ('CN101180201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '53', '0', '1026', '5', '10', '189', '南风', '5-6', '30', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101180202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '68', '0', '1026', '4', '10', '189', '南风', '6-7', '39', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101180203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '63', '0', '1025', '4', '4', '190', '西南风', '5-6', '33', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101180204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '63', '0', '1026', '4', '10', '193', '南风', '5-6', '30', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101180205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '51', '0', '1026', '4', '10', '190', '西风', '5-6', '31', '2016-12-16 23:02:23');
INSERT INTO `w_weather_data` VALUES ('CN101180301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '63', '0', '1025', '5', '4', '190', '南风', '4-5', '21', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101180302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '84', '0', '1025', '1', '4', '190', '北风', '微风', '8', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101180303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '68', '0', '1025', '4', '4', '190', '南风', '4-5', '20', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101180304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '77', '0', '1025', '2', '4', '190', '东北风', '3-4', '13', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101180305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '71', '0', '1025', '3', '4', '190', '西南风', '3-4', '10', '2016-12-16 23:15:35');
INSERT INTO `w_weather_data` VALUES ('CN101180306', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '66', '0', '1025', '4', '4', '190', '南风', '4-5', '21', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101180307', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '70', '0', '1025', '3', '4', '190', '南风', '4-5', '22', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101180308', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '64', '0', '1026', '4', '10', '199', '南风', '4-5', '24', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101180401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '74', '0', '1025', '2', '4', '190', '南风', '4-5', '24', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101180402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '64', '0', '1025', '4', '4', '190', '南风', '4-5', '20', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101180403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '57', '0', '1025', '6', '4', '190', '西南风', '4-5', '18', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101180404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '69', '0', '1025', '4', '4', '190', '南风', '5-6', '25', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101180405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '64', '0', '1025', '5', '4', '190', '南风', '3-4', '13', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101180501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '60', '0', '1025', '6', '4', '190', '南风', '5-6', '28', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101180502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '65', '0', '1025', '5', '4', '190', '西风', '3-4', '12', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101180503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '62', '0', '1025', '4', '4', '190', '南风', '4-5', '24', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101180504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '69', '0', '1027', '3', '10', '161', '东风', '4-5', '24', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101180505', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '63', '0', '1025', '4', '4', '190', '西南风', '3-4', '11', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101180506', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '3', '85', '0', '1025', '2', '4', '190', '西南风', '4-5', '19', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101180507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '57', '0', '1027', '6', '10', '216', '东南风', '4-5', '21', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101180508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '62', '0', '1025', '4', '4', '190', '南风', '4-5', '24', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101180601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '52', '0', '1029', '6', '10', '174', '东风', '4-5', '24', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101180602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '53', '0', '1029', '5', '10', '151', '南风', '3-4', '16', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101180603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '57', '0', '1029', '5', '10', '151', '南风', '3-4', '15', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101180604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '84', '0', '1029', '2', '10', '130', '东风', '3-4', '16', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101180605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '59', '0', '1029', '4', '10', '177', '南风', '5-6', '33', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101180606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '65', '0', '1029', '4', '10', '130', '南风', '3-4', '10', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101180607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '50', '0', '1029', '6', '10', '130', '南风', '4-5', '22', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101180608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '62', '0', '1030', '5', '10', '128', '东南风', '4-5', '17', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101180609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '70', '0', '1028', '4', '4', '140', '西南风', '3-4', '15', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101180701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '65', '0', '1027', '5', '10', '192', '西南风', '4-5', '20', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101180702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '63', '0', '1027', '3', '10', '225', '东风', '3-4', '14', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101180703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '71', '0', '1027', '4', '10', '216', '西南风', '4-5', '22', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101180704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '63', '0', '1028', '4', '10', '168', '东南风', '3-4', '11', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101180705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '73', '0', '1026', '4', '10', '76', '西北风', '3-4', '13', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101180706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '76', '0', '1027', '3', '10', '63', '东北风', '4-5', '18', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101180707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '68', '0', '1027', '6', '10', '116', '南风', '4-5', '22', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101180708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '83', '0', '1027', '3', '10', '63', '北风', '3-4', '16', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101180709', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '79', '0', '1028', '4', '10', '154', '南风', '3-4', '13', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101180710', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '51', '0', '1028', '6', '10', '168', '南风', '4-5', '23', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101180711', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '88', '0', '1027', '3', '10', '122', '东北风', '3-4', '11', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101180712', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '46', '0', '1028', '6', '10', '167', '西南风', '3-4', '16', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101180801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '56', '0', '1025', '5', '4', '190', '西南风', '4-5', '24', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101180802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '67', '0', '1025', '3', '4', '190', '南风', '4-5', '18', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101180803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '60', '0', '1025', '4', '4', '190', '南风', '4-5', '17', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101180804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '65', '0', '1025', '4', '4', '190', '南风', '5-6', '32', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101180805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '63', '0', '1028', '4', '10', '178', '南风', '4-5', '19', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101180901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '49', '0', '1026', '4', '10', '116', '北风', '微风', '1', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101180902', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '54', '0', '1026', '4', '10', '180', '北风', '3-4', '15', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101180903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '49', '0', '1026', '4', '10', '106', '北风', '微风', '3', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101180904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '57', '0', '1026', '4', '10', '180', '东风', '3-4', '16', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101180905', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '64', '0', '1025', '3', '10', '119', '北风', '微风', '1', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101180906', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '74', '0', '1026', '1', '10', '180', '西南风', '3-4', '16', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101180907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '66', '0', '1026', '3', '10', '180', '南风', '4-5', '24', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101180908', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '42', '0', '1027', '7', '10', '165', '东北风', '3-4', '16', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101180909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '62', '0', '1026', '2', '10', '180', '西风', '3-4', '14', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101180910', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '65', '0', '1026', '3', '10', '180', '东北风', '3-4', '16', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101180911', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '80', '0', '1026', '0', '10', '106', '西南风', '3-4', '16', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101181001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '64', '0', '1028', '3', '10', '175', '南风', '4-5', '20', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101181003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '63', '0', '1025', '3', '4', '190', '南风', '4-5', '19', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '61', '0', '1028', '3', '10', '178', '西南风', '4-5', '19', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '72', '0', '1028', '2', '10', '175', '南风', '4-5', '19', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '60', '0', '1028', '3', '10', '178', '南风', '4-5', '20', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181007', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '60', '0', '1028', '3', '10', '178', '南风', '4-5', '19', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '68', '0', '1029', '4', '10', '161', '东南风', '4-5', '22', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181009', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '72', '0', '1030', '4', '10', '172', '东南风', '4-5', '18', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101181101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '55', '0', '1025', '5', '4', '190', '西风', '3-4', '15', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101181102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '84', '0', '1025', '-2', '4', '190', '西北风', '3-4', '14', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101181103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '71', '0', '1025', '2', '4', '190', '东北风', '3-4', '14', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101181104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '75', '0', '1026', '1', '10', '142', '西北风', '3-4', '10', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101181106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '64', '0', '1025', '3', '4', '190', '北风', '3-4', '13', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101181107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '70', '0', '1025', '2', '4', '190', '西风', '3-4', '14', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101181108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '80', '0', '1026', '0', '10', '116', '西南风', '3-4', '11', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101181201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '77', '0', '1026', '2', '10', '199', '南风', '4-5', '21', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101181202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '59', '0', '1026', '5', '10', '199', '南风', '5-6', '31', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101181203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '80', '0', '1025', '2', '4', '190', '南风', '4-5', '18', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101181301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '69', '0', '1026', '3', '10', '191', '南风', '4-5', '22', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101181302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '59', '0', '1026', '4', '10', '185', '南风', '5-6', '27', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101181303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '65', '0', '1026', '4', '10', '186', '南风', '5-6', '32', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101181304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '68', '0', '1026', '3', '10', '193', '南风', '6-7', '34', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101181305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '64', '0', '1027', '4', '10', '188', '南风', '5-6', '31', '2016-12-16 23:16:22');
INSERT INTO `w_weather_data` VALUES ('CN101181401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '57', '0', '1028', '5', '10', '171', '东风', '4-5', '24', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101181402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '59', '0', '1025', '5', '4', '190', '东南风', '4-5', '18', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101181403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '56', '0', '1028', '5', '10', '178', '南风', '4-5', '23', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101181404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '56', '0', '1028', '5', '10', '171', '东南风', '3-4', '14', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101181405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '52', '0', '1028', '6', '10', '166', '南风', '4-5', '19', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101181406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '61', '0', '1028', '4', '10', '171', '南风', '4-5', '22', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101181407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '55', '0', '1028', '6', '10', '166', '东风', '4-5', '19', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101181408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '56', '0', '1029', '5', '10', '168', '东南风', '3-4', '10', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101181409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '61', '0', '1029', '4', '10', '171', '南风', '3-4', '11', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101181410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '60', '0', '1029', '5', '10', '168', '东南风', '4-5', '22', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101181501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '58', '0', '1025', '5', '4', '190', '南风', '4-5', '17', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101181502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '74', '0', '1025', '3', '4', '190', '东南风', '3-4', '16', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101181503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '79', '0', '1025', '3', '4', '190', '南风', '3-4', '10', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101181601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '45', '0', '1028', '7', '10', '168', '东南风', '4-5', '19', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101181602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '65', '0', '1028', '3', '10', '170', '南风', '4-5', '18', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101181603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '64', '0', '1028', '4', '10', '170', '南风', '4-5', '17', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101181604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '64', '0', '1028', '4', '10', '166', '南风', '4-5', '19', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101181605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '65', '0', '1028', '3', '10', '161', '南风', '4-5', '22', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101181606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '63', '0', '1025', '3', '4', '190', '东风', '3-4', '11', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101181607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '54', '0', '1028', '6', '10', '161', '南风', '4-5', '18', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101181608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '62', '0', '1029', '5', '10', '151', '南风', '4-5', '22', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101181609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '50', '0', '1028', '6', '10', '168', '南风', '4-5', '22', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101181610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '51', '0', '1029', '6', '10', '151', '南风', '4-5', '24', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101181701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '54', '0', '1025', '4', '10', '119', '东北风', '4-5', '22', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101181702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '54', '0', '1026', '3', '10', '183', '西风', '4-5', '22', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101181703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '72', '0', '1026', '0', '10', '76', '西北风', '3-4', '14', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101181704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '54', '0', '1026', '5', '10', '183', '西北风', '6-7', '42', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101181705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '72', '0', '1026', '0', '10', '59', '西北风', '3-4', '16', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101181706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '54', '0', '1025', '4', '10', '119', '东北风', '4-5', '24', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101181801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '82', '0', '1026', '1', '10', '106', '西风', '3-4', '16', '2016-12-16 23:01:18');
INSERT INTO `w_weather_data` VALUES ('CN101190101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '86', '0', '1031', '2', '2', '0', '东北风', '3-4', '14', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101190102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '100', '0', '1031', '-1', '2', '0', '南风', '3-4', '10', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101190103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '100', '0', '1031', '2', '2', '0', '东南风', '3-4', '11', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101190104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '86', '0', '1031', '2', '2', '0', '东北风', '3-4', '12', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101190105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '91', '0', '1031', '0', '2', '0', '北风', '微风', '2', '2016-12-16 23:15:33');
INSERT INTO `w_weather_data` VALUES ('CN101190106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '90', '0', '1031', '2', '2', '0', '西北风', '3-4', '14', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101190107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '90', '0', '1031', '2', '2', '0', '西北风', '3-4', '14', '2016-12-16 23:15:34');
INSERT INTO `w_weather_data` VALUES ('CN101190201', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '9', '99', '0', '1032', '1', '10', '269', '北风', '微风', '8', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101190202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '91', '0', '1032', '1', '10', '272', '北风', '微风', '9', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101190203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '73', '0', '1031', '2', '2', '0', '西南风', '3-4', '12', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101190204', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '9', '99', '0', '1032', '1', '10', '269', '北风', '微风', '10', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101190301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '70', '0', '1032', '3', '10', '117', '南风', '3-4', '13', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101190302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '77', '0', '1032', '2', '10', '241', '东南风', '3-4', '10', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101190303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '94', '0', '1032', '1', '10', '268', '南风', '3-4', '16', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101190304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '88', '0', '1031', '2', '2', '0', '东南风', '3-4', '14', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101190305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '70', '0', '1032', '3', '10', '117', '南风', '3-4', '13', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101190401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '88', '0', '1032', '3', '10', '278', '西南风', '3-4', '13', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190402', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '9', '93', '0', '1032', '2', '10', '265', '北风', '微风', '5', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190403', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '10', '81', '0', '1032', '2', '10', '259', '东南风', '3-4', '14', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '87', '0', '1032', '3', '10', '286', '北风', '微风', '2', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '88', '0', '1032', '3', '10', '278', '西南风', '3-4', '11', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '94', '0', '1031', '2', '4', '210', '东南风', '3-4', '12', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190408', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '2', '100', '0', '1031', '1', '4', '210', '西南风', '4-5', '22', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101190501', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '9', '77', '0', '1032', '2', '10', '80', '南风', '3-4', '14', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101190502', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '6', '81', '0', '1031', '1', '10', '266', '南风', '3-4', '14', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101190503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '91', '0', '1032', '-2', '10', '210', '南风', '3-4', '11', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101190504', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '6', '80', '0', '1031', '0', '10', '76', '北风', '微风', '1', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101190507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '89', '0', '1031', '0', '4', '210', '东南风', '3-4', '15', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101190508', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '8', '71', '0', '1032', '3', '10', '70', '东南风', '3-4', '12', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101190509', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '8', '70', '0', '1032', '3', '10', '70', '东南风', '3-4', '10', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101190601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '95', '0', '1031', '-1', '10', '120', '北风', '微风', '7', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101190602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '61', '0', '1031', '2', '10', '192', '东南风', '3-4', '10', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101190603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '96', '0', '1031', '-1', '10', '132', '东南风', '3-4', '13', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101190604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '59', '0', '1031', '1', '10', '195', '南风', '3-4', '13', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101190605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '95', '0', '1031', '-2', '10', '224', '北风', '微风', '4', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101190606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '95', '0', '1031', '-1', '10', '120', '北风', '微风', '9', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101190701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '79', '0', '1031', '0', '10', '220', '南风', '3-4', '15', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101190702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '58', '0', '1031', '1', '10', '205', '南风', '3-4', '14', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '62', '0', '1031', '2', '10', '221', '西南风', '4-5', '17', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '65', '0', '1031', '2', '10', '192', '南风', '4-5', '18', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '64', '0', '1031', '1', '10', '239', '西南风', '4-5', '21', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '67', '0', '1031', '2', '10', '220', '南风', '4-5', '21', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '94', '0', '1031', '-1', '10', '252', '东南风', '3-4', '11', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '92', '0', '1031', '-2', '10', '248', '西南风', '3-4', '10', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190709', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '79', '0', '1019', '0', '10', '54', '南风', '3-4', '16', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101190801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '66', '0', '1030', '4', '10', '179', '南风', '3-4', '13', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101190802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '66', '0', '1030', '4', '10', '179', '南风', '3-4', '12', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101190803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '81', '0', '1031', '2', '4', '210', '南风', '4-5', '22', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101190804', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '71', '0', '1029', '3', '10', '173', '东南风', '4-5', '19', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101190805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '56', '0', '1030', '3', '10', '184', '南风', '4-5', '19', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101190806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '52', '0', '1030', '3', '10', '179', '南风', '4-5', '20', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101190807', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '75', '0', '1030', '1', '10', '187', '南风', '3-4', '14', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101190901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '55', '0', '1031', '3', '10', '189', '南风', '4-5', '24', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101190902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '62', '0', '1031', '3', '10', '192', '南风', '4-5', '20', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101190903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '62', '0', '1031', '3', '2', '0', '东南风', '3-4', '13', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101190904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '87', '0', '1031', '-1', '10', '179', '南风', '3-4', '13', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101190905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '70', '0', '1031', '1', '10', '188', '南风', '3-4', '12', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101190906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '55', '0', '1031', '3', '10', '189', '南风', '4-5', '18', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101190908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '83', '0', '1031', '0', '10', '189', '西南风', '3-4', '14', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101191001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '55', '0', '1030', '1', '10', '215', '南风', '3-4', '13', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101191002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '60', '0', '1030', '2', '10', '199', '南风', '4-5', '18', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101191003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '51', '0', '1030', '3', '10', '215', '南风', '4-5', '21', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101191004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '57', '0', '1031', '0', '10', '205', '南风', '3-4', '15', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101191005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '43', '0', '1031', '3', '10', '205', '西南风', '4-5', '20', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101191101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '90', '0', '1032', '2', '10', '241', '北风', '微风', '1', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101191102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '92', '0', '1031', '2', '2', '0', '东南风', '3-4', '15', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101191103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '93', '0', '1031', '1', '2', '0', '南风', '3-4', '12', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101191104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '90', '0', '1032', '2', '10', '241', '北风', '微风', '6', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101191201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '97', '0', '1031', '0', '10', '246', '东南风', '3-4', '15', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101191202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '97', '0', '1031', '-2', '10', '224', '南风', '3-4', '15', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101191203', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '8', '81', '0', '1032', '1', '10', '268', '北风', '微风', '5', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101191204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '90', '0', '1032', '1', '10', '268', '北风', '微风', '4', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101191205', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '8', '77', '0', '1032', '3', '10', '272', '东南风', '3-4', '16', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101191301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '49', '0', '1030', '4', '10', '179', '南风', '4-5', '19', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101191302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '43', '0', '1031', '2', '10', '205', '南风', '3-4', '12', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101191303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '51', '0', '1031', '3', '10', '186', '南风', '3-4', '14', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101191304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '53', '0', '1031', '4', '10', '177', '东南风', '4-5', '24', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101191305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '49', '0', '1031', '4', '10', '186', '南风', '4-5', '17', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101200101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '95', '0', '1028', '2', '4', '140', '东南风', '3-4', '15', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101200102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '94', '0', '1028', '5', '4', '140', '西南风', '3-4', '15', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101200103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '77', '0', '1028', '4', '4', '140', '东南风', '3-4', '16', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101200104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '81', '0', '1028', '3', '4', '140', '东南风', '3-4', '15', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101200105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '62', '0', '1028', '5', '4', '140', '东风', '4-5', '24', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101200106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '95', '0', '1028', '2', '4', '140', '东南风', '3-4', '12', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101200201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '62', '0', '1028', '8', '10', '154', '南风', '8-9', '58', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '62', '0', '1028', '8', '10', '154', '南风', '8-9', '61', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '79', '0', '1028', '4', '10', '195', '北风', '微风', '7', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '60', '0', '1028', '7', '10', '195', '东南风', '4-5', '18', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '75', '0', '1028', '7', '10', '164', '南风', '5-6', '33', '2016-12-16 23:01:37');
INSERT INTO `w_weather_data` VALUES ('CN101200206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '92', '0', '1027', '3', '10', '122', '东南风', '4-5', '22', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200207', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '8', '93', '0', '1027', '4', '10', '122', '西南风', '4-5', '21', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200208', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '50', '0', '1028', '6', '10', '154', '东南风', '4-5', '23', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101200301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '58', '0', '1030', '5', '10', '129', '东风', '5-6', '31', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101200302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '58', '0', '1030', '5', '10', '127', '东风', '5-6', '28', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101200401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '79', '0', '1028', '3', '4', '140', '南风', '3-4', '11', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101200402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '62', '0', '1029', '5', '10', '157', '东南风', '4-5', '23', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101200403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '68', '0', '1028', '4', '4', '140', '南风', '3-4', '15', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101200404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-4', '70', '0', '1014', '4', '10', '175', '北风', '微风', '8', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101200405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '66', '0', '1028', '6', '4', '140', '东南风', '3-4', '13', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101200406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '80', '0', '1028', '4', '4', '140', '北风', '微风', '4', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101200407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '66', '0', '1029', '5', '10', '157', '东南风', '4-5', '17', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101200501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '65', '0', '1028', '5', '4', '140', '东南风', '5-6', '25', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101200502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '71', '0', '1028', '3', '4', '140', '北风', '微风', '5', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101200503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '80', '0', '1028', '4', '4', '140', '东风', '3-4', '12', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101200504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '79', '0', '1030', '3', '10', '154', '北风', '4-5', '18', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101200505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '86', '0', '1030', '3', '10', '140', '西南风', '3-4', '14', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101200506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '74', '0', '1030', '4', '10', '132', '东风', '4-5', '21', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101200507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '82', '0', '1030', '4', '10', '118', '东北风', '3-4', '10', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101200508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '91', '0', '1030', '3', '10', '58', '东北风', '3-4', '13', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101200509', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '93', '0', '1030', '3', '10', '118', '东风', '4-5', '19', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101200510', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '69', '0', '1030', '4', '10', '129', '东南风', '4-5', '19', '2016-12-16 23:16:25');
INSERT INTO `w_weather_data` VALUES ('CN101200601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '77', '0', '1030', '4', '10', '132', '东南风', '3-4', '11', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101200602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '62', '0', '1030', '4', '10', '127', '东南风', '3-4', '16', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101200603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '52', '0', '1030', '5', '10', '118', '东北风', '4-5', '17', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101200604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '77', '0', '1030', '4', '10', '127', '东南风', '3-4', '15', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101200605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '77', '0', '1030', '4', '10', '127', '东南风', '3-4', '10', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101200606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '77', '0', '1030', '4', '10', '132', '东南风', '3-4', '15', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101200701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '85', '0', '1029', '3', '10', '110', '东南风', '4-5', '21', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101200702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '83', '0', '1028', '5', '5', '162', '西南风', '3-4', '14', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101200703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '75', '0', '1029', '5', '10', '100', '西南风', '4-5', '17', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101200704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '83', '0', '1029', '4', '10', '82', '西南风', '3-4', '16', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101200705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '79', '0', '1028', '3', '5', '162', '东南风', '3-4', '14', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101200706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '85', '0', '1029', '4', '10', '99', '北风', '微风', '10', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101200801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '80', '0', '1028', '5', '10', '154', '南风', '3-4', '16', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101200802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '63', '0', '1028', '8', '10', '154', '南风', '4-5', '21', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101200803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '63', '0', '1028', '8', '10', '153', '南风', '4-5', '24', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101200804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '68', '0', '1028', '6', '10', '133', '南风', '4-5', '18', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101200805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '66', '0', '1028', '7', '10', '125', '东南风', '3-4', '10', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101200806', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '84', '0', '1029', '4', '10', '90', '东南风', '3-4', '12', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101200807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '70', '0', '1028', '7', '10', '153', '西南风', '4-5', '21', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101200901', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '9', '75', '0', '1028', '6', '10', '130', '东风', '4-5', '20', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101200902', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '87', '0', '1028', '4', '10', '130', '北风', '3-4', '10', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101200903', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '6', '79', '0', '1028', '6', '10', '138', '西南风', '3-4', '15', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101200904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '69', '0', '1028', '6', '10', '138', '东风', '3-4', '12', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101200906', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '4', '81', '0', '1028', '3', '10', '198', '北风', '微风', '6', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101200907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '92', '0', '1028', '5', '10', '169', '西北风', '3-4', '10', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101200908', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '87', '0', '1028', '5', '10', '198', '西风', '3-4', '12', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101200909', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '65', '0', '1028', '6', '10', '130', '西风', '3-4', '15', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101200910', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '79', '0', '1028', '7', '10', '169', '南风', '3-4', '14', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101200911', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '83', '0', '1028', '6', '10', '130', '北风', '4-5', '24', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101200912', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '84', '0', '1028', '6', '10', '130', '北风', '微风', '7', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101201001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '82', '0', '1027', '6', '10', '191', '西风', '3-4', '15', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101201002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '80', '0', '1026', '2', '10', '166', '南风', '3-4', '15', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101201003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '85', '0', '1027', '4', '10', '213', '东风', '3-4', '13', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101201004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '84', '0', '1027', '2', '10', '141', '北风', '微风', '9', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101201005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '90', '0', '1027', '3', '10', '191', '西北风', '3-4', '10', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101201006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '88', '0', '1028', '3', '10', '174', '南风', '3-4', '10', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101201007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '89', '0', '1027', '3', '10', '141', '南风', '3-4', '11', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101201008', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '72', '0', '1027', '7', '10', '213', '南风', '4-5', '21', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101201101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '89', '0', '1026', '3', '10', '74', '西风', '3-4', '15', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '93', '0', '1025', '1', '10', '109', '西风', '3-4', '15', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '86', '0', '1026', '3', '10', '98', '西南风', '3-4', '16', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '88', '0', '1026', '4', '10', '74', '西南风', '3-4', '10', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '89', '0', '1027', '4', '10', '105', '东风', '3-4', '10', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '88', '0', '1027', '3', '10', '105', '北风', '微风', '7', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '90', '0', '1027', '4', '10', '87', '东北风', '3-4', '12', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '89', '0', '1026', '3', '10', '74', '西风', '3-4', '12', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '89', '0', '1026', '3', '10', '74', '西风', '3-4', '16', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101201201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '76', '0', '1027', '2', '10', '105', '西风', '3-4', '10', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101201301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '65', '0', '1028', '3', '10', '155', '南风', '3-4', '10', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101201302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '61', '0', '1029', '5', '10', '159', '东南风', '4-5', '20', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101201401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '74', '0', '1028', '6', '10', '164', '南风', '5-6', '25', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101201402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '62', '0', '1028', '5', '10', '153', '东南风', '5-6', '32', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101201403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '73', '0', '1028', '4', '10', '152', '东风', '3-4', '15', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101201404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '74', '0', '1028', '6', '10', '164', '南风', '5-6', '30', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101201405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '74', '0', '1028', '6', '10', '164', '南风', '5-6', '31', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101201501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '53', '0', '1029', '7', '10', '137', '东南风', '3-4', '13', '2016-12-16 23:01:45');
INSERT INTO `w_weather_data` VALUES ('CN101201601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '86', '0', '1028', '3', '4', '140', '东南风', '3-4', '12', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101201701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '71', '0', '1029', '3', '10', '137', '南风', '3-4', '11', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101210101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '71', '0', '1031', '4', '4', '120', '西南风', '4-5', '17', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101210102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '73', '0', '1031', '4', '4', '120', '东南风', '4-5', '21', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101210103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '85', '0', '1031', '3', '4', '120', '西北风', '4-5', '24', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101210104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '72', '0', '1031', '5', '10', '106', '东风', '3-4', '15', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101210105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '82', '0', '1031', '3', '10', '106', '北风', '3-4', '15', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101210106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '86', '0', '1031', '3', '4', '120', '东风', '3-4', '14', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101210107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '88', '0', '1032', '2', '10', '82', '西南风', '4-5', '22', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101210108', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '91', '0', '1032', '3', '10', '82', '北风', '4-5', '20', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101210201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '96', '0', '1032', '2', '10', '73', '南风', '3-4', '11', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101210202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '95', '0', '1032', '3', '10', '73', '北风', '微风', '8', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101210203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '87', '0', '1031', '2', '2', '0', '西南风', '4-5', '18', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101210204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '92', '0', '1031', '3', '4', '120', '西北风', '4-5', '21', '2016-12-16 23:15:42');
INSERT INTO `w_weather_data` VALUES ('CN101210301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '97', '0', '1031', '2', '4', '210', '南风', '3-4', '10', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101210302', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '2', '96', '0', '1031', '1', '4', '210', '东南风', '3-4', '11', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101210303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '97', '0', '1031', '0', '4', '210', '东风', '3-4', '14', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101210304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '87', '0', '1031', '3', '4', '210', '东风', '3-4', '10', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101210305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '94', '0', '1031', '1', '4', '210', '北风', '微风', '10', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101210306', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '95', '0', '1031', '2', '4', '210', '东南风', '3-4', '13', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101210401', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '79', '0', '1032', '3', '4', '250', '西风', '3-4', '14', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101210403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '83', '0', '1032', '3', '4', '250', '东北风', '3-4', '13', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101210404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '83', '0', '1032', '3', '4', '250', '东南风', '4-5', '24', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101210405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '79', '0', '1032', '3', '4', '250', '东北风', '3-4', '10', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101210406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '90', '0', '1032', '2', '4', '250', '西北风', '3-4', '11', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101210408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '83', '0', '1032', '3', '4', '250', '东南风', '3-4', '11', '2016-12-16 23:01:46');
INSERT INTO `w_weather_data` VALUES ('CN101210410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '84', '0', '1032', '3', '4', '250', '西南风', '3-4', '10', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101210411', '2016-12-16', '502', 'http://files.heweather.com/cond_icon/502.png', '霾', '1', '79', '0', '1032', '3', '4', '250', '西风', '3-4', '10', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101210412', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '97', '0', '1032', '0', '4', '250', '北风', '3-4', '12', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101210501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '81', '0', '1031', '3', '4', '120', '东南风', '3-4', '11', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101210502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '78', '0', '1031', '3', '4', '120', '西南风', '3-4', '16', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101210503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '89', '0', '1031', '2', '4', '120', '东南风', '3-4', '11', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101210504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '82', '0', '1032', '3', '10', '62', '东南风', '4-5', '24', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101210505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '81', '0', '1032', '3', '10', '62', '西风', '3-4', '12', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101210601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '64', '0', '1032', '4', '10', '13', '东北风', '3-4', '13', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101210603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '59', '0', '1031', '6', '10', '31', '北风', '4-5', '22', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101210604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '83', '0', '1031', '3', '10', '15', '北风', '3-4', '16', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101210605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '78', '0', '1032', '3', '10', '130', '东南风', '3-4', '14', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101210606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '71', '0', '1031', '3', '10', '35', '北风', '微风', '5', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101210607', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '70', '0', '1031', '4', '10', '15', '西风', '3-4', '10', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101210609', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '64', '0', '1031', '4', '10', '31', '东北风', '3-4', '11', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101210610', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '92', '0', '1031', '3', '10', '13', '南风', '3-4', '12', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101210611', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '92', '0', '1031', '3', '10', '15', '南风', '3-4', '15', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101210612', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '92', '0', '1031', '3', '10', '16', '南风', '3-4', '16', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101210613', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '70', '0', '1031', '4', '10', '16', '西风', '3-4', '14', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101210701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '70', '0', '1031', '7', '10', '38', '北风', '3-4', '11', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101210702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '78', '0', '1030', '2', '10', '252', '北风', '微风', '2', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101210703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '81', '0', '1031', '3', '10', '44', '西南风', '4-5', '20', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101210704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '83', '0', '1031', '5', '10', '44', '西风', '3-4', '16', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101210705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '59', '0', '1031', '6', '10', '44', '北风', '3-4', '12', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101210706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '58', '0', '1031', '8', '10', '38', '东北风', '4-5', '21', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101210707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '54', '0', '1031', '6', '10', '38', '北风', '5-6', '26', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101210708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '78', '0', '1031', '4', '10', '38', '东风', '3-4', '12', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101210709', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '81', '0', '1031', '4', '10', '44', '西北风', '4-5', '19', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101210801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '69', '0', '1031', '3', '10', '34', '东风', '3-4', '14', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101210802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '81', '0', '1030', '2', '10', '76', '西南风', '3-4', '12', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101210803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '71', '0', '1030', '3', '10', '76', '西北风', '3-4', '16', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101210804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '91', '0', '1031', '1', '10', '35', '东风', '3-4', '11', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101210805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '65', '0', '1031', '5', '10', '34', '西南风', '3-4', '13', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101210806', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '86', '0', '1031', '2', '10', '82', '西风', '3-4', '11', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101210807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '74', '0', '1030', '3', '10', '162', '西南风', '3-4', '16', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101210808', '2016-12-16', '300', 'http://files.heweather.com/cond_icon/300.png', '阵雨', '5', '89', '0.1', '1031', '4', '10', '34', '东风', '3-4', '15', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101210809', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '83', '0', '1031', '3', '10', '82', '西南风', '3-4', '13', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101210901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '72', '0', '1031', '3', '10', '73', '东南风', '3-4', '15', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101210902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '79', '0', '1031', '3', '10', '73', '西北风', '4-5', '18', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101210903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '74', '0', '1031', '3', '10', '85', '北风', '微风', '9', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101210904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '71', '0', '1032', '3', '10', '59', '北风', '4-5', '19', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101210905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '69', '0', '1032', '4', '10', '62', '东南风', '3-4', '16', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101210906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '80', '0', '1031', '3', '10', '34', '西南风', '3-4', '15', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101210907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '67', '0', '1031', '4', '10', '49', '东北风', '3-4', '11', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101210908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '86', '0', '1032', '0', '10', '62', '西南风', '3-4', '15', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101211001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '68', '0', '1031', '4', '10', '66', '东北风', '4-5', '17', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101211002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '62', '0', '1031', '5', '10', '82', '北风', '4-5', '19', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101211003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '86', '0', '1031', '2', '10', '82', '北风', '微风', '0', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101211004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '83', '0', '1031', '3', '10', '85', '东南风', '3-4', '11', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101211005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '56', '0', '1030', '5', '10', '70', '东北风', '5-6', '29', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101211006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '68', '0', '1031', '4', '10', '66', '东北风', '4-5', '22', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101211101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '91', '0', '1032', '2', '4', '250', '北风', '微风', '0', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101211102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '56', '0', '1032', '4', '4', '190', '西风', '3-4', '13', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101211104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '68', '0', '1032', '3', '4', '250', '北风', '3-4', '11', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101211105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '65', '0', '1032', '4', '4', '250', '西北风', '4-5', '24', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101211106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '91', '0', '1032', '2', '4', '250', '北风', '微风', '0', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101220101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '84', '0', '1029', '3', '5', '150', '东南风', '3-4', '15', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101220102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '69', '0', '1031', '3', '10', '155', '东南风', '3-4', '11', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101220103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '86', '0', '1029', '3', '5', '150', '东南风', '3-4', '14', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101220104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '68', '0', '1029', '4', '5', '150', '东南风', '3-4', '13', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101220105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '88', '0', '1029', '2', '5', '150', '东南风', '4-5', '21', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101220106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '75', '0', '1029', '4', '5', '150', '东南风', '4-5', '18', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101220201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '83', '0', '1031', '1', '10', '167', '东南风', '3-4', '12', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101220202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '59', '0', '1031', '5', '10', '167', '南风', '4-5', '23', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101220203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '74', '0', '1030', '2', '10', '173', '东南风', '4-5', '17', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101220204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '71', '0', '1031', '2', '10', '167', '东南风', '4-5', '21', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101220301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '82', '0', '1031', '3', '2', '0', '东南风', '3-4', '15', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101220302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '96', '0', '1029', '1', '5', '150', '西南风', '3-4', '14', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101220303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '91', '0', '1031', '2', '2', '0', '东南风', '4-5', '18', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101220304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '94', '0', '1031', '1', '2', '0', '西风', '3-4', '15', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101220305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '89', '0', '1029', '3', '5', '150', '东北风', '4-5', '17', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101220401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '46', '0', '1030', '5', '10', '154', '东南风', '3-4', '10', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101220402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '70', '0', '1030', '5', '10', '155', '东南风', '5-6', '25', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101220403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '46', '0', '1030', '5', '10', '155', '东南风', '3-4', '15', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101220501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '76', '0', '1031', '3', '2', '0', '东南风', '5-6', '31', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101220502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '82', '0', '1031', '3', '2', '0', '东风', '4-5', '21', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101220503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '95', '0', '1029', '1', '5', '150', '东北风', '3-4', '10', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101220504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '80', '0', '1031', '3', '2', '0', '东南风', '3-4', '12', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101220601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '80', '0', '1031', '3', '10', '51', '西风', '4-5', '21', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101220602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '84', '0', '1031', '3', '10', '51', '北风', '4-5', '22', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101220603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '71', '0', '1030', '4', '10', '74', '西风', '4-5', '21', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101220604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '69', '0', '1031', '3', '10', '136', '西风', '4-5', '19', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101220605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '75', '0', '1031', '3', '10', '51', '西风', '3-4', '13', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101220606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '83', '0', '1030', '3', '10', '74', '西风', '3-4', '12', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101220607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '72', '0', '1030', '5', '10', '43', '东风', '4-5', '20', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101220608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '83', '0', '1030', '1', '10', '74', '西南风', '3-4', '16', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101220609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '84', '0', '1031', '2', '10', '136', '西北风', '4-5', '19', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101220701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '90', '0', '1030', '1', '10', '173', '东南风', '3-4', '12', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101220702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '80', '0', '1029', '3', '10', '173', '南风', '5-6', '26', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101220703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '80', '0', '1030', '2', '10', '173', '南风', '4-5', '20', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101220704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '73', '0', '1030', '2', '10', '173', '东南风', '3-4', '13', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101220705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '94', '0', '1030', '-2', '10', '172', '北风', '3-4', '11', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101220801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '81', '0', '1029', '3', '10', '161', '东风', '4-5', '18', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101220802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '64', '0', '1029', '5', '10', '161', '东南风', '4-5', '24', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101220803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '80', '0', '1030', '3', '10', '151', '东南风', '4-5', '24', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101220804', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '68', '0', '1029', '4', '10', '148', '南风', '4-5', '22', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101220805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '69', '0', '1029', '4', '10', '168', '南风', '4-5', '20', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101220806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '74', '0', '1029', '4', '10', '168', '东南风', '4-5', '19', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101220901', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '68', '0', '1029', '4', '10', '171', '东南风', '5-6', '27', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101220902', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '74', '0', '1030', '4', '10', '168', '东南风', '4-5', '18', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101220903', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '75', '0', '1030', '3', '10', '165', '东南风', '3-4', '10', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101220904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '77', '0', '1030', '3', '10', '165', '南风', '5-6', '30', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101221001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '81', '0', '1031', '3', '10', '57', '西北风', '4-5', '21', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101221002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '85', '0', '1031', '0', '10', '57', '北风', '微风', '4', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101221003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '81', '0', '1031', '3', '10', '82', '西北风', '4-5', '17', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101221004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '82', '0', '1030', '0', '10', '57', '东风', '3-4', '11', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101221005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '88', '0', '1030', '0', '10', '57', '东北风', '3-4', '13', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101221006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '83', '0', '1031', '2', '10', '65', '北风', '微风', '6', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101221007', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '89', '0', '1031', '2', '10', '65', '西北风', '3-4', '11', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101221008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '10', '0', '1031', '2', '10', '82', '南风', '5-6', '27', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101221101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '90', '0', '1031', '1', '2', '0', '北风', '微风', '4', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101221102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '91', '0', '1031', '0', '10', '167', '东风', '3-4', '15', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101221103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '66', '0', '1031', '3', '10', '155', '南风', '4-5', '22', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101221104', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '65', '0', '1031', '4', '10', '155', '东南风', '4-5', '17', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101221105', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '81', '0', '1031', '2', '2', '0', '东南风', '3-4', '13', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101221106', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '85', '0', '1031', '1', '2', '0', '北风', '微风', '3', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101221107', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '59', '0', '1031', '3', '10', '164', '东风', '3-4', '15', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101221201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '85', '0', '1030', '3', '10', '172', '南风', '4-5', '22', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101221202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '1', '75', '0', '1030', '4', '10', '168', '南风', '5-6', '27', '2016-12-16 23:02:24');
INSERT INTO `w_weather_data` VALUES ('CN101221301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '88', '0', '1029', '3', '5', '150', '东北风', '3-4', '15', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101221401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '95', '0', '1031', '1', '2', '0', '东风', '3-4', '15', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101221402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '96', '0', '1031', '0', '2', '0', '南风', '3-4', '15', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101221403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '86', '0', '1031', '0', '10', '57', '东南风', '3-4', '12', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101221404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '91', '0', '1031', '0', '10', '96', '东南风', '3-4', '13', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101221405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '80', '0', '1031', '1', '10', '57', '东北风', '4-5', '20', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101221406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '91', '0', '1031', '1', '2', '0', '东南风', '3-4', '10', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101221407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '91', '0', '1031', '2', '2', '0', '东南风', '4-5', '24', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101221501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '75', '0', '1030', '3', '10', '121', '东南风', '5-6', '30', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101221502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '70', '0', '1030', '4', '10', '151', '西南风', '5-6', '29', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101221503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '89', '0', '1030', '2', '10', '151', '东南风', '4-5', '22', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101221505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '89', '0', '1028', '3', '4', '140', '南风', '3-4', '16', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101221506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '92', '0', '1030', '1', '10', '140', '南风', '3-4', '16', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101221507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-3', '74', '0', '1029', '4', '5', '150', '东风', '4-5', '17', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101221701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '92', '0', '1031', '2', '10', '80', '西南风', '3-4', '10', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101221702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '92', '0', '1030', '2', '10', '43', '东南风', '3-4', '14', '2016-12-16 23:15:14');
INSERT INTO `w_weather_data` VALUES ('CN101221703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '90', '0', '1031', '2', '10', '80', '东风', '3-4', '15', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101221704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '49', '0', '1031', '3', '10', '64', '南风', '3-4', '15', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101221705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '94', '0', '1031', '1', '10', '64', '东风', '4-5', '23', '2016-12-16 23:15:15');
INSERT INTO `w_weather_data` VALUES ('CN101230101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '58', '0', '1029', '8', '10', '40', '西北风', '4-5', '21', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101230102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '67', '0', '1029', '7', '10', '40', '西北风', '4-5', '19', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101230103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '76', '0', '1029', '6', '10', '40', '东风', '3-4', '12', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101230104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '84', '0', '1029', '4', '10', '40', '西北风', '4-5', '24', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101230105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '81', '0', '1029', '5', '10', '40', '东南风', '4-5', '17', '2016-12-16 23:01:51');
INSERT INTO `w_weather_data` VALUES ('CN101230107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '80', '0', '1029', '5', '10', '40', '北风', '4-5', '21', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101230108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '68', '0', '1029', '12', '10', '40', '东北风', '5-6', '31', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101230110', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '60', '0', '1029', '10', '10', '40', '东北风', '4-5', '21', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101230111', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '54', '0', '1029', '10', '10', '40', '北风', '5-6', '33', '2016-12-16 23:15:07');
INSERT INTO `w_weather_data` VALUES ('CN101230201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '40', '0', '1028', '10', '10', '30', '东北风', '5-6', '27', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101230202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '45', '0', '1028', '9', '10', '30', '东北风', '4-5', '24', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101230301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '71', '0', '1029', '7', '10', '40', '北风', '3-4', '16', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101230302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '58', '0', '1029', '6', '10', '83', '北风', '4-5', '17', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101230303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '63', '0', '1029', '6', '10', '40', '北风', '5-6', '33', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101230304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '71', '0', '1030', '1', '10', '28', '西风', '3-4', '15', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101230305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '76', '0', '1029', '2', '10', '40', '东南风', '3-4', '13', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101230306', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '67', '0', '1029', '6', '10', '40', '东风', '3-4', '11', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101230307', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '70', '0', '1030', '3', '10', '252', '东北风', '4-5', '23', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101230308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '71', '0', '1030', '5', '10', '252', '西北风', '3-4', '12', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101230309', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '0', '73', '0', '1029', '2', '10', '83', '东风', '3-4', '14', '2016-12-16 23:15:57');
INSERT INTO `w_weather_data` VALUES ('CN101230401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '52', '0', '1029', '9', '10', '40', '北风', '4-5', '23', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101230402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '47', '0', '1026', '9', '10', '44', '东风', '3-4', '13', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101230403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '53', '0', '1026', '10', '10', '44', '东北风', '5-6', '30', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101230404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '52', '0', '1029', '9', '10', '40', '北风', '4-5', '24', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101230405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '53', '0', '1029', '10', '10', '40', '东北风', '5-6', '30', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101230406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '52', '0', '1029', '9', '10', '40', '北风', '4-5', '20', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101230407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '52', '0', '1029', '9', '10', '40', '北风', '4-5', '21', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101230501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '51', '0', '1026', '9', '10', '44', '东北风', '6-7', '38', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101230502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '58', '0', '1026', '7', '10', '44', '东风', '4-5', '18', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101230504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '59', '0', '1028', '7', '10', '30', '西北风', '3-4', '14', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101230505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '66', '0', '1028', '5', '10', '30', '西南风', '4-5', '23', '2016-12-16 23:02:06');
INSERT INTO `w_weather_data` VALUES ('CN101230506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '45', '0', '1028', '10', '10', '30', '东北风', '4-5', '19', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101230507', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '58', '0', '1028', '11', '10', '30', '北风', '7-8', '49', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101230508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '51', '0', '1026', '9', '10', '44', '东北风', '6-7', '40', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101230509', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '46', '0', '1026', '10', '10', '44', '北风', '6-7', '39', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101230510', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '51', '0', '1026', '9', '10', '41', '东北风', '6-7', '36', '2016-12-16 23:02:02');
INSERT INTO `w_weather_data` VALUES ('CN101230601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '39', '0', '1028', '11', '10', '30', '东风', '4-5', '17', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101230602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '49', '0', '1028', '11', '10', '30', '东南风', '4-5', '20', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101230603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '77', '0', '1028', '8', '10', '30', '西北风', '4-5', '24', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101230604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '74', '0', '1028', '8', '10', '30', '西北风', '4-5', '18', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101230605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '49', '0', '1028', '11', '10', '30', '东风', '5-6', '25', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101230606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '73', '0', '1028', '8', '10', '30', '东北风', '4-5', '19', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101230607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '53', '0', '1027', '10', '10', '60', '东风', '3-4', '11', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101230608', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '46', '0', '1027', '12', '10', '60', '东北风', '8-9', '59', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101230609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '54', '0', '1027', '11', '10', '60', '西北风', '4-5', '24', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101230610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '81', '0', '1027', '7', '10', '30', '东北风', '3-4', '16', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101230701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '74', '0', '1027', '6', '10', '36', '东风', '4-5', '23', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '83', '0', '1028', '4', '10', '12', '西北风', '3-4', '14', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '73', '0', '1028', '5', '10', '34', '西北风', '4-5', '20', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '68', '0', '1028', '7', '10', '352', '东南风', '3-4', '15', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '60', '0', '1028', '8', '10', '34', '西南风', '3-4', '12', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '85', '0', '1027', '7', '10', '72', '北风', '3-4', '10', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '78', '0', '1027', '7', '10', '30', '南风', '3-4', '11', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101230801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '74', '0', '1028', '6', '10', '65', '东北风', '3-4', '13', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '76', '0', '1028', '5', '10', '27', '东风', '3-4', '14', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '89', '0', '1028', '4', '10', '27', '北风', '3-4', '11', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '87', '0', '1029', '3', '10', '7', '东北风', '3-4', '16', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '82', '0', '1029', '4', '10', '51', '东南风', '3-4', '10', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '93', '0', '1029', '3', '10', '7', '北风', '微风', '5', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230807', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '84', '0', '1029', '3', '10', '51', '东风', '3-4', '12', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230808', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '80', '0', '1028', '5', '10', '65', '南风', '3-4', '13', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230809', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '83', '0', '1028', '4', '10', '127', '北风', '微风', '2', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101230810', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '77', '0', '1028', '6', '10', '64', '南风', '3-4', '10', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101230811', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '79', '0', '1028', '5', '10', '30', '西风', '4-5', '24', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101230901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '73', '0', '1029', '6', '10', '355', '南风', '3-4', '13', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230902', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '89', '0', '1029', '4', '10', '16', '西风', '3-4', '12', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230903', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '96', '0', '1029', '2', '10', '153', '西风', '3-4', '12', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '93', '0', '1029', '3', '10', '42', '西南风', '3-4', '16', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101230905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '74', '0', '1029', '4', '10', '35', '北风', '3-4', '16', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '86', '0', '1029', '3', '10', '35', '西南风', '3-4', '16', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '88', '0', '1029', '3', '10', '35', '南风', '3-4', '13', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230908', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '65', '0', '1030', '4', '10', '162', '东风', '3-4', '11', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230909', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '84', '0', '1030', '3', '10', '162', '东南风', '3-4', '12', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101230910', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '85', '0', '1029', '4', '10', '128', '西风', '3-4', '13', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101231001', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '18', '30', '0', '1026', '9', '10', '36', '北风', '8-9', '54', '2016-12-16 23:02:25');
INSERT INTO `w_weather_data` VALUES ('CN101240101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '74', '0', '1030', '5', '10', '30', '东北风', '3-4', '11', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101240102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '61', '0', '1029', '6', '10', '51', '东风', '3-4', '11', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101240103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '83', '0', '1029', '4', '10', '51', '北风', '微风', '6', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101240104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '82', '0', '1030', '2', '10', '30', '北风', '3-4', '14', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101240105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '66', '0', '1029', '7', '10', '38', '北风', '4-5', '24', '2016-12-16 23:15:56');
INSERT INTO `w_weather_data` VALUES ('CN101240201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '89', '0', '1030', '3', '10', '58', '南风', '3-4', '16', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '89', '0', '1030', '2', '10', '108', '西风', '3-4', '11', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '18', '0', '1030', '3', '10', '31', '南风', '4-5', '23', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '80', '0', '1029', '4', '10', '107', '西风', '3-4', '10', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '91', '0', '1030', '2', '10', '31', '西风', '3-4', '15', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '84', '0', '1030', '4', '10', '31', '西北风', '3-4', '14', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '85', '0', '1030', '3', '10', '58', '西风', '3-4', '16', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '81', '0', '1030', '3', '10', '43', '东风', '3-4', '11', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240209', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '62', '0', '1030', '5', '10', '31', '北风', '3-4', '15', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101240210', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '77', '0', '1030', '4', '10', '47', '东北风', '4-5', '19', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101240212', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '100', '0', '1029', '3', '10', '99', '东北风', '3-4', '15', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101240301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '66', '0', '1030', '4', '10', '52', '北风', '4-5', '23', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101240302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '66', '0', '1030', '6', '10', '25', '北风', '4-5', '22', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101240303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '64', '0', '1030', '3', '10', '81', '东北风', '4-5', '22', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101240305', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '83', '0', '1030', '5', '10', '35', '西南风', '3-4', '14', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101240306', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '86', '0', '1030', '3', '10', '23', '西南风', '3-4', '13', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101240307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '88', '0', '1030', '3', '10', '81', '南风', '3-4', '16', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101240308', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '58', '0', '1029', '6', '10', '74', '东风', '4-5', '24', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101240309', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '81', '0', '1029', '5', '10', '74', '东南风', '3-4', '10', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101240310', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '88', '0', '1030', '4', '10', '52', '东南风', '3-4', '11', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101240311', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '77', '0', '1031', '4', '10', '136', '东南风', '3-4', '12', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101240312', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '76', '0', '1030', '4', '10', '46', '东北风', '4-5', '21', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101240313', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '49', '0', '1030', '5', '10', '52', '东风', '4-5', '23', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101240401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '75', '0', '1029', '5', '10', '40', '西风', '3-4', '14', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101240402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '73', '0', '1029', '5', '10', '26', '西北风', '3-4', '11', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101240403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '74', '0', '1029', '4', '10', '47', '西风', '3-4', '10', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101240404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '94', '0', '1029', '3', '10', '34', '西南风', '3-4', '14', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101240405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '69', '0', '1029', '4', '10', '355', '东南风', '3-4', '11', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101240406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '93', '0', '1029', '2', '10', '153', '南风', '3-4', '11', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101240407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '90', '0', '1029', '3', '10', '355', '东风', '3-4', '13', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101240408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '77', '0', '1029', '5', '10', '355', '北风', '3-4', '16', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101240409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '75', '0', '1029', '5', '10', '26', '西风', '3-4', '14', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101240410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '90', '0', '1029', '4', '10', '355', '东南风', '3-4', '12', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101240411', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '95', '0', '1029', '3', '10', '39', '北风', '4-5', '17', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101240501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '74', '0', '1029', '4', '10', '84', '东南风', '4-5', '20', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '88', '0', '1029', '3', '10', '99', '西南风', '3-4', '10', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '96', '0', '1029', '3', '10', '76', '北风', '3-4', '10', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '88', '0', '1029', '3', '10', '84', '北风', '微风', '0', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '86', '0', '1029', '5', '10', '76', '南风', '3-4', '14', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '73', '0', '1029', '4', '10', '76', '西北风', '4-5', '24', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '81', '0', '1029', '3', '10', '107', '西南风', '3-4', '13', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '78', '0', '1029', '5', '10', '76', '东风', '3-4', '11', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240509', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '81', '0', '1029', '4', '10', '51', '北风', '微风', '6', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101240510', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '86', '0', '1029', '3', '10', '51', '北风', '微风', '8', '2016-12-16 23:16:08');
INSERT INTO `w_weather_data` VALUES ('CN101240601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '73', '0', '1029', '6', '10', '23', '西北风', '3-4', '10', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '73', '0', '1029', '6', '10', '23', '西北风', '3-4', '12', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '78', '0', '1029', '5', '10', '23', '东南风', '4-5', '19', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '98', '0', '1029', '4', '10', '23', '东南风', '3-4', '13', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '77', '0', '1029', '4', '10', '23', '北风', '微风', '6', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '82', '0', '1029', '4', '10', '47', '西南风', '3-4', '10', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '78', '0', '1029', '3', '10', '98', '东南风', '3-4', '10', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240608', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '85', '0', '1029', '1', '10', '227', '西风', '3-4', '11', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101240609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '88', '0', '1029', '4', '10', '227', '西风', '3-4', '10', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101240610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '83', '0', '1029', '4', '10', '227', '西风', '3-4', '13', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101240611', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '66', '0', '1029', '7', '10', '227', '西南风', '3-4', '11', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101240612', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '88', '0', '1029', '3', '10', '98', '西北风', '3-4', '15', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101240613', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '89', '0', '1029', '3', '10', '98', '南风', '3-4', '15', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101240701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '68', '0', '1028', '7', '10', '229', '东北风', '3-4', '16', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101240702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '77', '0', '1028', '5', '10', '37', '东风', '3-4', '16', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101240703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '72', '0', '1028', '6', '10', '37', '北风', '微风', '7', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101240704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '77', '0', '1028', '5', '10', '229', '西南风', '3-4', '14', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101240705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '86', '0', '1028', '4', '10', '37', '西风', '4-5', '24', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101240706', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '55', '0', '1028', '8', '10', '43', '西风', '3-4', '11', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101240707', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '58', '0', '1029', '7', '10', '26', '北风', '4-5', '23', '2016-12-16 23:01:30');
INSERT INTO `w_weather_data` VALUES ('CN101240708', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '91', '0', '1028', '3', '10', '27', '东北风', '4-5', '23', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101240709', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '68', '0', '1028', '6', '10', '12', '西风', '3-4', '15', '2016-12-16 23:01:31');
INSERT INTO `w_weather_data` VALUES ('CN101240710', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '75', '0', '1029', '8', '10', '352', '南风', '3-4', '16', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101240711', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '79', '0', '1028', '6', '10', '233', '西南风', '3-4', '15', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240712', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '81', '0', '1028', '5', '10', '233', '西北风', '3-4', '14', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240713', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '90', '0', '1028', '3', '10', '349', '西风', '4-5', '21', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240714', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '79', '0', '1028', '5', '10', '349', '南风', '4-5', '19', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101240715', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '56', '0', '1028', '8', '10', '349', '西风', '4-5', '17', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240716', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '87', '0', '1027', '5', '10', '341', '西南风', '3-4', '11', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240717', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '73', '0', '1029', '6', '10', '352', '北风', '3-4', '16', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240718', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '68', '0', '1028', '7', '10', '229', '东北风', '3-4', '12', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101240801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '75', '0', '1030', '4', '10', '33', '东风', '3-4', '12', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101240802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '77', '0', '1030', '3', '10', '23', '东风', '3-4', '13', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101240803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '84', '0', '1030', '2', '10', '33', '北风', '3-4', '14', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101240901', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '80', '0', '1029', '5', '10', '81', '南风', '3-4', '12', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101240902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '83', '0', '1029', '4', '10', '98', '北风', '3-4', '16', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101240903', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '84', '0', '1029', '4', '10', '76', '西北风', '3-4', '15', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101240904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '80', '0', '1026', '5', '10', '25', '南风', '3-4', '14', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101240905', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '86', '0', '1029', '4', '10', '86', '西南风', '3-4', '14', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101240906', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '80', '0', '1029', '5', '10', '76', '南风', '3-4', '14', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101241001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '65', '0', '1029', '6', '10', '45', '东北风', '3-4', '10', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101241002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '74', '0', '1029', '5', '10', '61', '东风', '3-4', '14', '2016-12-16 23:16:29');
INSERT INTO `w_weather_data` VALUES ('CN101241101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '77', '0', '1029', '5', '10', '59', '东风', '3-4', '16', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101241102', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '81', '0', '1029', '3', '10', '59', '西北风', '4-5', '17', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101241103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '93', '0', '1029', '4', '10', '74', '东南风', '3-4', '14', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101250101', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '78', '0', '1028', '6', '5', '7', '北风', '微风', '3', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101250102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '82', '0', '1029', '6', '10', '29', '西南风', '3-4', '11', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101250103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '91', '0', '1028', '3', '5', '100', '东南风', '3-4', '11', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101250104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '87', '0', '1028', '4', '5', '7', '西北风', '4-5', '19', '2016-12-16 23:02:05');
INSERT INTO `w_weather_data` VALUES ('CN101250105', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '5', '67', '0.0', '1028', '8', '5', '7', '北风', '6-7', '37', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101250201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '83', '0', '1028', '5', '5', '22', '东北风', '3-4', '10', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101250202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '90', '0', '1029', '4', '10', '29', '西北风', '3-4', '16', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101250203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '83', '0', '1029', '5', '10', '64', '北风', '微风', '10', '2016-12-16 23:15:26');
INSERT INTO `w_weather_data` VALUES ('CN101250301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '87', '0', '1028', '6', '5', '46', '北风', '微风', '5', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101250302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '93', '0', '1029', '6', '10', '47', '东风', '3-4', '10', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101250303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '89', '0', '1028', '4', '5', '63', '西南风', '3-4', '11', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101250305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '60', '0', '1029', '7', '10', '47', '东北风', '3-4', '15', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101250306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '93', '0', '1029', '3', '10', '47', '东南风', '3-4', '13', '2016-12-16 23:16:09');
INSERT INTO `w_weather_data` VALUES ('CN101250401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '61', '0', '1029', '8', '10', '11', '东北风', '4-5', '18', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101250402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '99', '0', '1029', '6', '10', '11', '东风', '3-4', '10', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101250403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '90', '0', '1029', '5', '10', '11', '东风', '3-4', '11', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101250404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '77', '0', '1028', '6', '10', '55', '西北风', '3-4', '14', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101250405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '81', '0', '1028', '6', '10', '55', '西北风', '3-4', '12', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101250406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '82', '0', '1017', '6', '10', '208', '南风', '3-4', '14', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101250407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '66', '0', '1029', '6', '10', '11', '东北风', '4-5', '18', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101250408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '70', '0', '1029', '7', '10', '349', '北风', '微风', '1', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101250409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '75', '0', '1029', '1', '10', '11', '东南风', '6-7', '34', '2016-12-16 23:01:26');
INSERT INTO `w_weather_data` VALUES ('CN101250501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '67', '0', '1028', '6', '10', '123', '西北风', '3-4', '12', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '81', '0', '1027', '6', '10', '14', '南风', '3-4', '15', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '87', '0', '1028', '5', '10', '63', '南风', '3-4', '10', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101250504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '86', '0', '1028', '6', '10', '350', '北风', '3-4', '10', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '92', '0', '1028', '4', '10', '350', '西南风', '3-4', '15', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '99', '0', '1028', '5', '10', '320', '西北风', '3-4', '13', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '58', '0', '1028', '5', '10', '35', '西南风', '3-4', '11', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250509', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '85', '0', '1029', '5', '10', '47', '北风', '3-4', '12', '2016-12-16 23:01:29');
INSERT INTO `w_weather_data` VALUES ('CN101250510', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '92', '0', '1028', '5', '10', '320', '北风', '微风', '4', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101250511', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '81', '0', '1029', '2', '10', '227', '北风', '3-4', '13', '2016-12-16 23:02:16');
INSERT INTO `w_weather_data` VALUES ('CN101250512', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '67', '0', '1028', '6', '10', '123', '西北风', '3-4', '16', '2016-12-16 23:02:15');
INSERT INTO `w_weather_data` VALUES ('CN101250601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '76', '0', '1028', '5', '10', '182', '东风', '4-5', '19', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101250602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '62', '0', '1028', '6', '10', '129', '南风', '3-4', '12', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101250603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '79', '0', '1028', '6', '10', '155', '西南风', '3-4', '12', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101250604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '71', '0', '1029', '7', '10', '144', '东南风', '4-5', '24', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101250605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '75', '0', '1028', '6', '10', '173', '南风', '3-4', '12', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101250606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '80', '0', '1028', '5', '10', '166', '南风', '3-4', '15', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101250607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '69', '0', '1028', '7', '10', '207', '西风', '3-4', '14', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101250608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '80', '0', '1028', '5', '10', '166', '南风', '3-4', '16', '2016-12-16 23:02:19');
INSERT INTO `w_weather_data` VALUES ('CN101250700', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '88', '0', '1029', '5', '10', '136', '西南风', '3-4', '11', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101250701', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '88', '0', '1029', '5', '10', '136', '西南风', '3-4', '10', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101250702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '66', '0', '1028', '5', '10', '129', '南风', '3-4', '11', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101250703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '15', '71', '0', '1029', '6', '10', '136', '西北风', '3-4', '15', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101250704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '84', '0', '1029', '3', '10', '78', '北风', '4-5', '19', '2016-12-16 23:15:38');
INSERT INTO `w_weather_data` VALUES ('CN101250705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '75', '0', '1029', '7', '10', '144', '南风', '3-4', '16', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101250801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '66', '0', '1029', '6', '10', '87', '东北风', '3-4', '13', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101250802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '86', '0', '1029', '4', '10', '64', '南风', '3-4', '14', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101250803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '64', '0', '1029', '6', '10', '108', '东南风', '3-4', '11', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101250805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '66', '0', '1029', '6', '10', '125', '西南风', '3-4', '13', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101250806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '86', '0', '1029', '4', '10', '70', '东南风', '3-4', '14', '2016-12-16 23:16:21');
INSERT INTO `w_weather_data` VALUES ('CN101250901', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '61', '0', '1029', '6', '10', '77', '东风', '3-4', '11', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250902', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '75', '0', '1029', '4', '10', '125', '西北风', '3-4', '16', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250903', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '86', '0', '1029', '3', '10', '56', '西北风', '3-4', '10', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '76', '0', '1029', '4', '10', '77', '东北风', '3-4', '12', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250905', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '89', '0', '1029', '4', '10', '77', '南风', '3-4', '12', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250906', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '79', '0', '1028', '5', '10', '26', '西北风', '3-4', '15', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '96', '0', '1029', '3', '10', '56', '西南风', '3-4', '11', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '80', '0', '1029', '5', '10', '56', '东风', '3-4', '14', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '82', '0', '1028', '4', '10', '45', '西南风', '3-4', '14', '2016-12-16 23:01:41');
INSERT INTO `w_weather_data` VALUES ('CN101250910', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '85', '0', '1029', '3', '10', '77', '北风', '3-4', '16', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101251001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '66', '0', '1029', '8', '10', '88', '东南风', '4-5', '22', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101251002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '85', '0', '1028', '4', '10', '133', '东南风', '3-4', '12', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101251003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '78', '0', '1029', '6', '10', '136', '东风', '3-4', '14', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101251004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '85', '0', '1028', '5', '5', '144', '东南风', '3-4', '10', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101251005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '90', '0', '1028', '3', '5', '275', '西风', '3-4', '16', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101251006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '90', '0', '1029', '3', '10', '88', '东北风', '3-4', '16', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101251101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '79', '0', '1028', '5', '10', '123', '西风', '3-4', '16', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101251102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '84', '0', '1028', '3', '10', '110', '东南风', '3-4', '12', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101251103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '76', '0', '1028', '6', '10', '173', '西北风', '3-4', '14', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101251104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '79', '0', '1028', '5', '10', '123', '西风', '3-4', '16', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101251201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '78', '0', '1029', '5', '10', '314', '北风', '微风', '1', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101251203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '81', '0', '1029', '6', '10', '66', '西北风', '3-4', '15', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101251204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '71', '0', '1029', '6', '10', '130', '北风', '微风', '8', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101251205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '92', '0', '1028', '3', '10', '9', '南风', '3-4', '12', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101251206', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '86', '0', '1029', '4', '10', '24', '东南风', '3-4', '11', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101251207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '92', '0', '1028', '3', '10', '26', '西南风', '3-4', '14', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101251208', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '73', '0', '1029', '5', '10', '333', '西风', '3-4', '11', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101251209', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '84', '0', '1028', '3', '10', '81', '北风', '3-4', '16', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101251210', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '83', '0', '1028', '4', '10', '169', '西风', '3-4', '16', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101251211', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '69', '0', '1029', '6', '10', '190', '东风', '3-4', '10', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101251212', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '78', '0', '1029', '5', '10', '314', '北风', '微风', '10', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101251213', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '80', '0', '1029', '5', '10', '190', '西风', '3-4', '11', '2016-12-16 23:16:01');
INSERT INTO `w_weather_data` VALUES ('CN101251401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '83', '0', '1028', '6', '10', '61', '南风', '4-5', '20', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101251402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '71', '0', '1028', '6', '10', '55', '东北风', '3-4', '15', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101251403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '84', '0', '1028', '5', '10', '45', '西风', '3-4', '12', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '85', '0', '1027', '4', '10', '42', '南风', '3-4', '10', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '75', '0', '1027', '7', '10', '41', '西风', '3-4', '13', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '72', '0', '1028', '7', '10', '63', '东北风', '3-4', '14', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '82', '0', '1027', '6', '10', '41', '西南风', '4-5', '18', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251408', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '5', '84', '0', '1027', '5', '10', '14', '东南风', '3-4', '15', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '80', '0', '1028', '5', '10', '63', '西北风', '3-4', '14', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '71', '0', '1027', '7', '10', '41', '北风', '4-5', '24', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101251411', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '83', '0', '1028', '6', '10', '74', '西北风', '4-5', '18', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101251501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '81', '0', '1029', '4', '10', '77', '西南风', '3-4', '13', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101251502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '87', '0', '1029', '4', '10', '77', '北风', '3-4', '16', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101251503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '95', '0', '1028', '3', '10', '126', '西风', '3-4', '12', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101251504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '81', '0', '1029', '3', '10', '66', '西南风', '3-4', '12', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101251505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '77', '0', '1029', '4', '10', '77', '东风', '3-4', '16', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101251506', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '70', '0', '1029', '6', '10', '130', '东北风', '3-4', '10', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101251507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '84', '0', '1027', '4', '10', '141', '东风', '3-4', '13', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101251508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '88', '0', '1029', '3', '10', '77', '西风', '3-4', '14', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101260101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '48', '0', '1024', '6', '10', '115', '东风', '4-5', '17', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101260102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '49', '0', '1024', '6', '10', '115', '南风', '4-5', '20', '2016-12-16 23:16:17');
INSERT INTO `w_weather_data` VALUES ('CN101260103', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '44', '0', '1024', '8', '10', '115', '南风', '4-5', '17', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '65', '0', '1024', '5', '10', '115', '西风', '4-5', '22', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '59', '0', '1024', '5', '10', '124', '东南风', '3-4', '13', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '50', '0', '1024', '4', '10', '115', '南风', '4-5', '24', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '59', '0', '1024', '5', '10', '115', '东南风', '3-4', '11', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '50', '0', '1024', '7', '10', '115', '东南风', '4-5', '23', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '48', '0', '1024', '6', '10', '115', '东风', '4-5', '21', '2016-12-16 23:16:18');
INSERT INTO `w_weather_data` VALUES ('CN101260110', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '48', '0', '1024', '6', '10', '115', '东风', '4-5', '21', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101260111', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '48', '0', '1024', '6', '10', '115', '东风', '4-5', '22', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101260201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '67', '0', '1025', '6', '10', '100', '北风', '微风', '4', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101260202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '54', '0', '1024', '5', '10', '124', '东风', '4-5', '19', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101260203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '41', '0', '1024', '9', '10', '116', '西南风', '3-4', '15', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101260204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '77', '0', '1025', '4', '10', '128', '东北风', '3-4', '15', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101260205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '77', '0', '1027', '4', '10', '131', '东风', '4-5', '21', '2016-12-16 23:01:32');
INSERT INTO `w_weather_data` VALUES ('CN101260206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '90', '0', '1027', '3', '10', '131', '东北风', '3-4', '15', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101260207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '66', '0', '1025', '5', '10', '128', '北风', '微风', '1', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101260208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '80', '0', '1024', '10', '10', '141', '北风', '微风', '4', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101260209', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '74', '0', '1024', '4', '10', '141', '东北风', '3-4', '11', '2016-12-16 23:01:33');
INSERT INTO `w_weather_data` VALUES ('CN101260210', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '76', '0', '1026', '5', '10', '115', '东风', '3-4', '10', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101260211', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '65', '0', '1026', '6', '10', '115', '西南风', '3-4', '10', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101260212', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '75', '0', '1026', '5', '10', '115', '东南风', '3-4', '12', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101260213', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '64', '0', '1027', '5', '10', '131', '东北风', '3-4', '16', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101260214', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '51', '0', '1025', '6', '10', '100', '东南风', '3-4', '13', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101260215', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '67', '0', '1025', '6', '10', '100', '北风', '微风', '6', '2016-12-16 23:01:34');
INSERT INTO `w_weather_data` VALUES ('CN101260301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '66', '0', '1024', '7', '10', '144', '南风', '4-5', '21', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101260302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '67', '0', '1024', '8', '10', '144', '南风', '4-5', '22', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101260303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '67', '0', '1024', '8', '10', '144', '南风', '4-5', '18', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101260304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '56', '0', '1024', '8', '10', '115', '南风', '4-5', '19', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101260305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '52', '0', '1024', '7', '10', '129', '西南风', '3-4', '15', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101260306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '68', '0', '1023', '8', '10', '130', '东南风', '4-5', '22', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101260401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '61', '0', '1024', '4', '10', '40', '北风', '3-4', '16', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '58', '0', '1024', '5', '10', '40', '北风', '微风', '2', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '62', '0', '1024', '3', '10', '39', '西南风', '3-4', '13', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '45', '0', '1024', '8', '10', '115', '西风', '3-4', '12', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '64', '0', '1024', '4', '10', '39', '北风', '3-4', '15', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260406', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '52', '0', '1024', '8', '10', '115', '东南风', '3-4', '15', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260407', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '64', '0', '1024', '4', '10', '115', '东北风', '3-4', '12', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '72', '0', '1026', '7', '10', '91', '东风', '3-4', '14', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260409', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '68', '0', '1026', '4', '10', '91', '东北风', '4-5', '20', '2016-12-16 23:02:12');
INSERT INTO `w_weather_data` VALUES ('CN101260410', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '57', '0', '1026', '5', '10', '46', '西南风', '3-4', '15', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101260411', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '79', '0', '1026', '5', '10', '69', '北风', '微风', '6', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101260412', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '71', '0', '1026', '7', '10', '46', '西南风', '3-4', '15', '2016-12-16 23:02:14');
INSERT INTO `w_weather_data` VALUES ('CN101260501', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '69', '0', '1024', '4', '10', '77', '东北风', '3-4', '15', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101260502', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '77', '0', '1028', '3', '10', '81', '北风', '微风', '0', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101260503', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '72', '0', '1027', '4', '10', '111', '西南风', '3-4', '12', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101260504', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '73', '0', '1027', '4', '10', '111', '东北风', '3-4', '13', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101260505', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '67', '0', '1024', '4', '10', '77', '东北风', '3-4', '13', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101260507', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '57', '0', '1024', '4', '10', '39', '西南风', '3-4', '14', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101260508', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '51', '0', '1024', '6', '10', '77', '西南风', '4-5', '21', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101260509', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '81', '0', '1028', '3', '10', '81', '北风', '微风', '0', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101260510', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '77', '0', '1028', '4', '10', '94', '北风', '微风', '1', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101260511', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '79', '0', '1028', '4', '10', '94', '西风', '3-4', '12', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101260512', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '82', '0', '1024', '3', '10', '77', '北风', '微风', '10', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101260513', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '80', '0', '1028', '4', '10', '9', '西风', '3-4', '15', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101260514', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '72', '0', '1029', '3', '10', '24', '西风', '3-4', '10', '2016-12-16 23:15:29');
INSERT INTO `w_weather_data` VALUES ('CN101260515', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '81', '0', '1028', '4', '10', '9', '西风', '3-4', '10', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101260516', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '82', '0', '1027', '6', '10', '54', '西南风', '3-4', '11', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101260517', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '88', '0', '1027', '6', '10', '236', '北风', '微风', '6', '2016-12-16 23:15:30');
INSERT INTO `w_weather_data` VALUES ('CN101260601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '70', '0', '1028', '6', '10', '88', '东南风', '3-4', '10', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101260602', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '69', '0', '1028', '5', '10', '88', '东北风', '3-4', '10', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101260603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '79', '0', '1028', '3', '10', '81', '西北风', '3-4', '14', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101260604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '56', '0', '1028', '4', '10', '88', '东风', '3-4', '11', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101260605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '68', '0', '1027', '7', '10', '113', '南风', '3-4', '12', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101260607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '84', '0', '1027', '4', '10', '113', '北风', '微风', '4', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101260608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '65', '0', '1027', '6', '10', '111', '西南风', '3-4', '16', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101260609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '68', '0', '1027', '7', '10', '85', '北风', '微风', '8', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101260610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '78', '0', '1027', '5', '10', '85', '北风', '微风', '3', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101260611', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '81', '0', '1028', '4', '10', '119', '北风', '微风', '4', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101260701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '3', '84', '0', '1023', '5', '10', '141', '东风', '3-4', '12', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101260702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '89', '0', '1022', '5', '10', '141', '东风', '3-4', '16', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101260703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '4', '50', '0', '1024', '7', '10', '124', '东风', '4-5', '18', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101260704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '94', '0', '1021', '4', '3', '142', '东南风', '4-5', '18', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101260705', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '82', '0', '1023', '5', '10', '136', '东南风', '4-5', '18', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101260706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '77', '0', '1022', '7', '3', '165', '南风', '4-5', '24', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101260707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '71', '0', '1024', '8', '10', '148', '南风', '3-4', '15', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101260708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '47', '0', '1024', '9', '10', '124', '东南风', '3-4', '10', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101260801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '87', '0', '1022', '5', '3', '165', '东南风', '5-6', '33', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101260802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '73', '0', '1023', '7', '10', '162', '东南风', '4-5', '22', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101260804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '83', '0', '1021', '6', '5', '144', '南风', '4-5', '23', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101260901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '84', '0', '1022', '6', '10', '127', '南风', '3-4', '11', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101260902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '77', '0', '1023', '6', '10', '162', '东南风', '5-6', '30', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101260903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '75', '0', '1023', '7', '10', '130', '东南风', '3-4', '14', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101260904', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '72', '0', '1024', '7', '10', '129', '北风', '3-4', '15', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101260905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '70', '0', '1024', '9', '10', '129', '东北风', '4-5', '18', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101260907', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '89', '0', '1023', '4', '10', '130', '北风', '微风', '9', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101260908', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '89', '0', '1024', '8', '10', '135', '北风', '微风', '8', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101260909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '83', '0', '1021', '6', '5', '144', '东北风', '3-4', '16', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101270101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '52', '0', '1024', '6', '3', '320', '东北风', '3-4', '15', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101270102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '97', '0', '1024', '5', '3', '320', '西北风', '4-5', '19', '2016-12-16 23:01:27');
INSERT INTO `w_weather_data` VALUES ('CN101270103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '99', '0', '1024', '7', '3', '320', '北风', '3-4', '14', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '92', '0', '1024', '8', '3', '320', '北风', '3-4', '15', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '89', '0', '1023', '7', '10', '140', '西风', '3-4', '12', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '97', '0', '1024', '8', '3', '320', '西北风', '3-4', '12', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '98', '0', '1024', '8', '3', '320', '北风', '3-4', '12', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '85', '0', '1024', '9', '3', '320', '北风', '3-4', '14', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '99', '0', '1021', '8', '10', '42', '南风', '3-4', '14', '2016-12-16 23:01:28');
INSERT INTO `w_weather_data` VALUES ('CN101270110', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '97', '0', '1024', '8', '3', '320', '北风', '3-4', '15', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101270111', '2016-12-16', '300', 'http://files.heweather.com/cond_icon/300.png', '阵雨', '8', '98', '1', '1024', '7', '3', '320', '东风', '3-4', '14', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101270112', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '8', '100', '0.2', '1024', '8', '3', '320', '东北风', '4-5', '20', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101270113', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '88', '0', '1024', '8', '3', '320', '北风', '3-4', '16', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101270114', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '96', '0', '1024', '8', '3', '320', '西北风', '3-4', '14', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101270115', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '99', '0', '1024', '7', '3', '320', '北风', '3-4', '12', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101270201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '72', '0', '1018', '12', '10', '100', '西北风', '3-4', '12', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101270202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '74', '0', '1018', '12', '10', '149', '东南风', '3-4', '15', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101270203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '85', '0', '1018', '10', '10', '144', '东北风', '3-4', '13', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101270204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '73', '0', '1018', '12', '10', '99', '北风', '4-5', '20', '2016-12-16 23:02:13');
INSERT INTO `w_weather_data` VALUES ('CN101270301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '92', '0', '1023', '10', '10', '79', '北风', '4-5', '23', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101270302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '82', '0', '1023', '12', '10', '79', '东北风', '3-4', '14', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101270303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '87', '0', '1023', '10', '10', '90', '西北风', '3-4', '16', '2016-12-16 23:15:28');
INSERT INTO `w_weather_data` VALUES ('CN101270401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '93', '0', '1023', '8', '10', '341', '东北风', '3-4', '16', '2016-12-16 23:16:06');
INSERT INTO `w_weather_data` VALUES ('CN101270402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '97', '0', '1024', '7', '10', '135', '北风', '3-4', '11', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101270403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '91', '0', '1024', '8', '10', '135', '北风', '4-5', '18', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101270404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '91', '0', '1024', '8', '3', '320', '东北风', '3-4', '10', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101270405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '97', '0', '1023', '5', '5', '162', '东北风', '3-4', '10', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101270406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '98', '0.1', '1023', '7', '10', '269', '西北风', '3-4', '16', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101270407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '66', '0', '1022', '8', '10', '146', '北风', '微风', '5', '2016-12-16 23:16:05');
INSERT INTO `w_weather_data` VALUES ('CN101270408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '93', '0', '1023', '8', '10', '269', '北风', '3-4', '11', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101270501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '82', '0', '1024', '9', '10', '95', '东北风', '5-6', '27', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101270502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '95', '0', '1024', '8', '10', '114', '北风', '4-5', '18', '2016-12-16 23:01:17');
INSERT INTO `w_weather_data` VALUES ('CN101270503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '94', '0', '1024', '10', '10', '95', '西北风', '3-4', '10', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101270504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '87', '0', '1024', '10', '10', '95', '北风', '4-5', '21', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101270505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '100', '0', '1024', '7', '10', '114', '东北风', '5-6', '31', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101270506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '94', '0', '1024', '9', '10', '120', '东北风', '4-5', '20', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101270507', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '93', '0', '1024', '8', '10', '127', '东风', '4-5', '22', '2016-12-16 23:01:16');
INSERT INTO `w_weather_data` VALUES ('CN101270601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '80', '0', '1025', '10', '10', '87', '东北风', '3-4', '11', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101270602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '91', '0', '1025', '9', '10', '87', '东北风', '3-4', '10', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101270603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '82', '0', '1025', '7', '10', '62', '东风', '4-5', '18', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101270604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '87', '0', '1025', '8', '10', '90', '东风', '3-4', '13', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101270605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '88', '0', '1024', '10', '10', '91', '西北风', '3-4', '13', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101270606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '74', '0', '1025', '7', '10', '217', '北风', '微风', '3', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101270607', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '80', '0', '1025', '10', '10', '87', '东北风', '3-4', '16', '2016-12-16 23:02:00');
INSERT INTO `w_weather_data` VALUES ('CN101270608', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '80', '0', '1025', '10', '10', '87', '东北风', '3-4', '11', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101270701', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '13', '99', '0', '1024', '9', '10', '120', '北风', '4-5', '21', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101270702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '99', '0', '1024', '9', '10', '120', '北风', '4-5', '21', '2016-12-16 23:15:13');
INSERT INTO `w_weather_data` VALUES ('CN101270703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '94', '0', '1024', '9', '10', '135', '西南风', '3-4', '12', '2016-12-16 23:15:12');
INSERT INTO `w_weather_data` VALUES ('CN101270801', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '78', '0', '1024', '9', '10', '91', '东北风', '4-5', '21', '2016-12-16 23:15:53');
INSERT INTO `w_weather_data` VALUES ('CN101270802', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '94', '0', '1024', '8', '10', '91', '东北风', '4-5', '21', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101270803', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '7', '99', '0', '1024', '9', '8', '10', '北风', '4-5', '18', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101270804', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '91', '0', '1024', '7', '10', '91', '西北风', '3-4', '14', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101270805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '?', '0', '1024', '7', '10', '91', '北风', '微风', '2', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101270901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '82', '0', '1025', '9', '10', '110', '北风', '3-4', '13', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101270902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '90', '0', '1025', '6', '10', '110', '西北风', '4-5', '17', '2016-12-16 23:01:50');
INSERT INTO `w_weather_data` VALUES ('CN101270903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '88', '0', '1025', '6', '10', '153', '东风', '4-5', '24', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101270904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '82', '0', '1025', '9', '10', '87', '北风', '微风', '6', '2016-12-16 23:01:49');
INSERT INTO `w_weather_data` VALUES ('CN101271001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '81', '0', '1023', '11', '10', '46', '东风', '4-5', '21', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101271003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '91', '0', '1023', '11', '10', '46', '东北风', '4-5', '24', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101271004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '87', '0', '1024', '10', '10', '107', '北风', '3-4', '11', '2016-12-16 23:02:20');
INSERT INTO `w_weather_data` VALUES ('CN101271005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '67', '0', '1023', '11', '10', '121', '北风', '微风', '4', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101271006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '88', '0', '1024', '7', '10', '116', '西风', '3-4', '15', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101271007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '81', '0', '1023', '11', '10', '46', '东风', '4-5', '21', '2016-12-16 23:02:21');
INSERT INTO `w_weather_data` VALUES ('CN101271101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '82', '0', '1022', '12', '10', '47', '北风', '3-4', '14', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '85', '0', '1022', '12', '10', '248', '西北风', '3-4', '10', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '82', '0', '1022', '12', '10', '47', '北风', '3-4', '13', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '83', '0', '1022', '11', '10', '248', '东北风', '4-5', '22', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101271106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '81', '0', '1017', '13', '10', '208', '北风', '3-4', '13', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '83', '0', '1022', '12', '10', '248', '西北风', '4-5', '22', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '82', '0', '1022', '12', '10', '248', '东北风', '3-4', '10', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '95', '0', '1022', '10', '10', '248', '北风', '3-4', '12', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101271110', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '82', '0', '1023', '11', '10', '121', '东北风', '3-4', '15', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101271111', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '7', '96', '0', '1021', '11', '3', '81', '西北风', '3-4', '10', '2016-12-16 23:15:37');
INSERT INTO `w_weather_data` VALUES ('CN101271201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '96', '0', '1024', '10', '10', '85', '东北风', '4-5', '19', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101271202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '96', '0', '1024', '10', '10', '60', '东北风', '4-5', '17', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101271203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '87', '0', '1023', '11', '10', '90', '北风', '4-5', '17', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101271204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '99', '0', '1024', '10', '10', '102', '西北风', '3-4', '14', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101271205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '89', '0', '1024', '10', '10', '60', '东北风', '6-7', '39', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101271301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '93', '0', '1023', '9', '10', '140', '北风', '3-4', '12', '2016-12-16 23:16:10');
INSERT INTO `w_weather_data` VALUES ('CN101271302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '94', '0', '1024', '9', '10', '102', '东北风', '4-5', '19', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101271303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '95', '0', '1023', '9', '10', '140', '东北风', '4-5', '22', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101271304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '90', '0', '1023', '8', '10', '140', '东北风', '4-5', '19', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101271401', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '14', '82', '0', '1022', '10', '10', '197', '东北风', '3-4', '14', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '92', '0', '1021', '10', '10', '60', '西北风', '4-5', '22', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '95', '0', '1022', '8', '10', '197', '东北风', '4-5', '22', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271404', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '12', '84', '0', '1022', '10', '10', '61', '西北风', '3-4', '15', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271405', '2016-12-16', '300', 'http://files.heweather.com/cond_icon/300.png', '阵雨', '7', '97', '0.6', '1021', '10', '3', '81', '北风', '3-4', '14', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '85', '0', '1021', '9', '10', '60', '东北风', '3-4', '10', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '78', '0', '1021', '11', '3', '81', '东北风', '3-4', '12', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271408', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '6', '92', '0', '1021', '9', '10', '60', '西南风', '3-4', '13', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271409', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '1', '96', '0', '1021', '-4', '10', '60', '西风', '5-6', '32', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101271501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '97', '0', '1024', '9', '3', '320', '北风', '微风', '0', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101271502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '97', '0', '1024', '9', '3', '320', '北风', '3-4', '12', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101271503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '89', '0', '1024', '9', '3', '320', '东北风', '3-4', '12', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101271504', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '6', '90', '0', '1021', '8', '10', '60', '东风', '3-4', '11', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101271505', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '9', '94', '0', '1021', '8', '10', '42', '东北风', '3-4', '15', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101271506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '89', '0', '1022', '9', '10', '197', '北风', '3-4', '10', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101271601', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '70', '0', '1027', '8', '10', '181', '北风', '3-4', '13', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271603', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '52', '0.0', '1018', '8', '10', '197', '北风', '4-5', '21', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271604', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '65', '0', '1018', '4', '10', '197', '南风', '3-4', '14', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271605', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '75', '0', '1018', '10', '10', '174', '东南风', '4-5', '17', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271606', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '78', '0', '1018', '7', '10', '144', '东南风', '3-4', '11', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271607', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '87', '0.0', '1026', '6', '10', '90', '北风', '3-4', '15', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '83', '0', '1018', '9', '10', '144', '南风', '3-4', '10', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271609', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '90', '0.0', '1019', '6', '10', '198', '西风', '3-4', '12', '2016-12-16 23:15:22');
INSERT INTO `w_weather_data` VALUES ('CN101271610', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '70', '0', '1018', '8', '10', '174', '北风', '3-4', '14', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101271611', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '76', '0', '1019', '9', '10', '198', '南风', '3-4', '15', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101271612', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '83', '0', '1019', '5', '10', '198', '东北风', '3-4', '10', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101271613', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '74', '0.0', '1018', '7', '10', '174', '东南风', '3-4', '15', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101271614', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '69', '0.0', '1018', '8', '10', '174', '西风', '3-4', '10', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101271615', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '89', '0', '1019', '4', '10', '213', '西风', '3-4', '13', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101271616', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '79', '0.0', '1019', '8', '10', '213', '南风', '3-4', '14', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101271617', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '82', '0', '1021', '8', '3', '81', '东风', '3-4', '16', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101271618', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '86', '0', '1021', '4', '3', '81', '北风', '3-4', '12', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101271619', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '84', '0', '1019', '2', '10', '198', '西南风', '3-4', '15', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101271701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '85', '0', '1021', '9', '10', '42', '东北风', '3-4', '11', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101271702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '91', '0', '1021', '8', '10', '42', '北风', '4-5', '18', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101271703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '79', '0', '1021', '8', '10', '42', '北风', '4-5', '24', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101271704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '70', '0', '1021', '9', '10', '60', '南风', '3-4', '10', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101271705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '76', '0', '1019', '9', '10', '213', '西南风', '4-5', '24', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101271706', '2016-12-16', '300', 'http://files.heweather.com/cond_icon/300.png', '阵雨', '9', '93', '0.1', '1021', '8', '10', '42', '北风', '3-4', '14', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101271707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '91', '0', '1021', '8', '10', '42', '东北风', '3-4', '14', '2016-12-16 23:16:00');
INSERT INTO `w_weather_data` VALUES ('CN101271708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '78', '0', '1019', '8', '10', '258', '西风', '4-5', '24', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101271801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '43', '0', '1025', '-2', '10', '90', '南风', '4-5', '20', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101271802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '89', '0', '1019', '0', '10', '192', '北风', '微风', '3', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101271803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '69', '0', '1019', '7', '10', '192', '西南风', '3-4', '15', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101271804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '55', '0', '1017', '6', '10', '140', '东南风', '3-4', '14', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101271805', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '0', '63', '0', '1018', '2', '4', '202', '西北风', '4-5', '23', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101271806', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '8', '48', '0', '1014', '3', '10', '33', '西风', '3-4', '16', '2016-12-16 23:01:10');
INSERT INTO `w_weather_data` VALUES ('CN101271807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '50', '0', '1017', '0', '10', '140', '西风', '3-4', '13', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101271808', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '30', '0', '1013', '-1', '10', '230', '西南风', '3-4', '12', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101271809', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '29', '0', '1013', '0', '10', '264', '西北风', '3-4', '12', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101271810', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '27', '0', '1014', '-2', '10', '225', '北风', '3-4', '10', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101271811', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '28', '0', '1015', '1', '10', '209', '南风', '3-4', '13', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101271812', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '34', '0', '1014', '-3', '10', '233', '南风', '5-6', '27', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101271813', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '26', '0', '1013', '-8', '10', '207', '西风', '3-4', '11', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101271814', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '-1', '24', '0', '1013', '3', '10', '242', '东风', '4-5', '20', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101271815', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '26', '0', '1013', '6', '10', '225', '东北风', '3-4', '12', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101271816', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '22', '0', '1014', '6', '10', '213', '南风', '3-4', '16', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101271817', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '30', '0', '1013', '0', '10', '260', '西南风', '3-4', '14', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101271818', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '2', '27', '0', '1015', '7', '10', '211', '西北风', '3-4', '11', '2016-12-16 23:01:11');
INSERT INTO `w_weather_data` VALUES ('CN101271901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-8', '52', '0', '1014', '-6', '10', '210', '北风', '微风', '4', '2016-12-16 23:01:54');
INSERT INTO `w_weather_data` VALUES ('CN101271902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '1', '60', '0', '1021', '7', '10', '151', '南风', '4-5', '19', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '70', '0', '1021', '3', '10', '151', '南风', '3-4', '14', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '77', '0', '1021', '4', '10', '151', '东风', '5-6', '30', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '50', '0', '1019', '-4', '10', '217', '北风', '4-5', '17', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-2', '60', '0', '1021', '4', '10', '170', '西北风', '4-5', '17', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '63', '0', '1017', '3', '10', '141', '西北风', '3-4', '13', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-1', '41', '0', '1019', '3', '10', '258', '东风', '3-4', '12', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-7', '57', '0', '1018', '0', '10', '235', '北风', '微风', '5', '2016-12-16 23:01:53');
INSERT INTO `w_weather_data` VALUES ('CN101271910', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '47', '0', '1017', '-2', '10', '141', '东南风', '3-4', '15', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101271911', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-5', '37', '0', '1013', '-4', '10', '207', '东风', '3-4', '12', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101271912', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-3', '37', '0', '1014', '-5', '10', '215', '北风', '3-4', '11', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101271913', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '-6', '53', '0', '1016', '-10', '10', '174', '南风', '3-4', '15', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101272001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '92', '0', '1024', '8', '3', '320', '东北风', '4-5', '17', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101272002', '2016-12-16', '501', 'http://files.heweather.com/cond_icon/501.png', '雾', '8', '96', '0', '1024', '8', '3', '320', '东北风', '3-4', '12', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101272003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '100', '0', '1024', '7', '3', '320', '北风', '3-4', '16', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101272004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '98', '0', '1024', '7', '3', '320', '北风', '4-5', '19', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101272005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '98', '0.1', '1024', '7', '3', '320', '东北风', '4-5', '24', '2016-12-16 23:15:40');
INSERT INTO `w_weather_data` VALUES ('CN101272006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '92', '0', '1024', '8', '3', '320', '东北风', '4-5', '21', '2016-12-16 23:15:41');
INSERT INTO `w_weather_data` VALUES ('CN101272101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '87', '0', '1024', '6', '5', '155', '西北风', '3-4', '12', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101272102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '87', '0', '1024', '7', '5', '155', '北风', '3-4', '11', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101272103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '81', '0', '1022', '7', '10', '160', '东风', '3-4', '13', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101272104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '92', '0', '1023', '6', '5', '162', '西南风', '3-4', '11', '2016-12-16 23:16:19');
INSERT INTO `w_weather_data` VALUES ('CN101272105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '90', '0', '1024', '8', '10', '127', '东北风', '3-4', '10', '2016-12-16 23:16:20');
INSERT INTO `w_weather_data` VALUES ('CN101280101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '58', '0', '1026', '11', '10', '19', '北风', '3-4', '15', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101280102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '70', '0', '1025', '11', '10', '30', '西北风', '3-4', '14', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101280103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '98', '0', '1026', '6', '10', '25', '东风', '3-4', '15', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101280104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '88', '0', '1026', '10', '10', '25', '西北风', '4-5', '23', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101280105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '60', '0', '1026', '10', '10', '20', '北风', '4-5', '19', '2016-12-16 23:15:27');
INSERT INTO `w_weather_data` VALUES ('CN101280201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '89', '0', '1027', '6', '10', '74', '东南风', '4-5', '21', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '78', '0', '1027', '7', '10', '56', '北风', '微风', '1', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '64', '0', '1027', '7', '10', '47', '东北风', '4-5', '24', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '75', '0', '1027', '7', '10', '47', '东南风', '4-5', '20', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '71', '0', '1028', '8', '10', '350', '西北风', '5-6', '29', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '100', '0', '1028', '5', '10', '35', '东风', '3-4', '14', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '63', '0', '1028', '7', '10', '43', '东北风', '4-5', '23', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '82', '0', '1027', '7', '10', '47', '西风', '3-4', '10', '2016-12-16 23:16:04');
INSERT INTO `w_weather_data` VALUES ('CN101280209', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '89', '0', '1027', '6', '10', '56', '东南风', '4-5', '21', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101280210', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '89', '0', '1027', '6', '10', '74', '东南风', '4-5', '23', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101280211', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '89', '0', '1027', '6', '10', '74', '东南风', '4-5', '18', '2016-12-16 23:16:07');
INSERT INTO `w_weather_data` VALUES ('CN101280301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '61', '0', '1026', '12', '10', '90', '北风', '3-4', '13', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101280302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '69', '0', '1026', '10', '10', '90', '西北风', '4-5', '21', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101280303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '56', '0', '1026', '12', '10', '90', '东北风', '3-4', '13', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101280304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '74', '0', '1026', '11', '10', '90', '东北风', '4-5', '24', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101280305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '95', '0', '1026', '7', '10', '90', '北风', '3-4', '16', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101280401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '83', '0', '1027', '8', '10', '333', '西北风', '3-4', '11', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101280402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '75', '0', '1027', '9', '10', '345', '西北风', '3-4', '13', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101280403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '80', '0', '1027', '7', '10', '333', '东北风', '3-4', '14', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101280404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '95', '0', '1027', '8', '10', '72', '东南风', '3-4', '13', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101280406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '85', '0', '1027', '9', '10', '60', '北风', '3-4', '14', '2016-12-16 23:01:59');
INSERT INTO `w_weather_data` VALUES ('CN101280407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '81', '0', '1027', '8', '10', '345', '东南风', '3-4', '14', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101280408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '80', '0', '1027', '9', '10', '60', '南风', '3-4', '16', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101280409', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '83', '0', '1027', '8', '10', '333', '西北风', '3-4', '13', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101280501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '51', '0', '1027', '14', '10', '60', '东风', '4-5', '21', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101280502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '51', '0', '1027', '14', '10', '60', '东北风', '4-5', '21', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101280503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '52', '0', '1027', '13', '10', '60', '东北风', '5-6', '33', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101280504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '54', '0', '1027', '13', '10', '60', '北风', '3-4', '12', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101280601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '56', '0', '1026', '13', '10', '90', '北风', '4-5', '19', '2016-12-16 23:15:52');
INSERT INTO `w_weather_data` VALUES ('CN101280701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '52', '0', '1025', '14', '10', '30', '北风', '3-4', '14', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101280702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '58', '0', '1025', '13', '10', '30', '北风', '3-4', '13', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101280703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '52', '0', '1025', '14', '10', '30', '北风', '3-4', '12', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101280800', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '51', '0', '1026', '12', '10', '19', '北风', '3-4', '12', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101280801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '51', '0', '1026', '13', '10', '19', '东北风', '3-4', '10', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101280802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '67', '0', '1026', '11', '10', '28', '西北风', '3-4', '14', '2016-12-16 23:02:28');
INSERT INTO `w_weather_data` VALUES ('CN101280803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '51', '0', '1026', '12', '10', '19', '北风', '3-4', '16', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101280804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '51', '0', '1025', '12', '10', '30', '北风', '3-4', '14', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101280901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '74', '0', '1026', '11', '10', '59', '东北风', '3-4', '10', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101280902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '84', '0', '1026', '7', '10', '29', '西风', '3-4', '10', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101280903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '89', '0', '1026', '8', '10', '47', '西风', '4-5', '18', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101280905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '93', '0', '1025', '8', '10', '29', '东北风', '3-4', '15', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101280906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '84', '0', '1026', '8', '10', '29', '西北风', '3-4', '14', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101280907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '90', '0', '1025', '8', '10', '24', '西南风', '3-4', '12', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101280908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '74', '0', '1026', '11', '10', '59', '东北风', '3-4', '14', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101281001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '59', '0', '1023', '14', '10', '111', '北风', '4-5', '21', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '60', '0', '1023', '15', '10', '111', '东北风', '4-5', '22', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '65', '0', '1023', '14', '8', '50', '东北风', '3-4', '16', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '70', '0', '1023', '16', '8', '50', '东北风', '5-6', '31', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '70', '0', '1023', '13', '10', '40', '东北风', '3-4', '15', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '59', '0', '1023', '14', '10', '111', '北风', '4-5', '18', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '68', '0', '1023', '13', '10', '40', '东北风', '3-4', '13', '2016-12-16 23:16:15');
INSERT INTO `w_weather_data` VALUES ('CN101281008', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '59', '0', '1023', '14', '10', '111', '北风', '4-5', '21', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101281009', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '59', '0', '1023', '14', '10', '111', '北风', '4-5', '21', '2016-12-16 23:16:14');
INSERT INTO `w_weather_data` VALUES ('CN101281010', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '59', '0', '1023', '14', '10', '111', '北风', '4-5', '22', '2016-12-16 23:16:16');
INSERT INTO `w_weather_data` VALUES ('CN101281101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '47', '0', '1025', '14', '10', '30', '东北风', '5-6', '27', '2016-12-16 23:16:12');
INSERT INTO `w_weather_data` VALUES ('CN101281103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '78', '0', '1025', '11', '10', '30', '西南风', '3-4', '15', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '47', '0', '1025', '14', '10', '30', '东北风', '5-6', '27', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '81', '0', '1025', '9', '10', '31', '西南风', '3-4', '15', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '57', '0', '1025', '12', '10', '30', '北风', '3-4', '16', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '47', '0', '1025', '14', '10', '30', '东北风', '5-6', '30', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '57', '0', '1025', '11', '10', '30', '东北风', '3-4', '10', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '47', '0', '1025', '14', '10', '30', '东北风', '5-6', '31', '2016-12-16 23:16:11');
INSERT INTO `w_weather_data` VALUES ('CN101281201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '66', '0', '1026', '10', '10', '15', '东风', '3-4', '11', '2016-12-16 23:01:22');
INSERT INTO `w_weather_data` VALUES ('CN101281202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '87', '0', '1027', '8', '10', '60', '东南风', '3-4', '14', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101281203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '69', '0', '1027', '7', '10', '16', '西南风', '3-4', '15', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101281204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '77', '0', '1027', '7', '10', '341', '西风', '3-4', '15', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101281205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '55', '0', '1027', '10', '10', '345', '西风', '3-4', '14', '2016-12-16 23:01:21');
INSERT INTO `w_weather_data` VALUES ('CN101281206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '66', '0', '1026', '10', '10', '15', '东风', '3-4', '14', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101281301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '45', '0', '1026', '12', '10', '20', '东北风', '5-6', '25', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101281302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '74', '0', '1027', '7', '10', '11', '西风', '4-5', '18', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101281303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '78', '0', '1027', '7', '10', '11', '东北风', '3-4', '13', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101281304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '92', '0', '1026', '5', '10', '29', '北风', '微风', '1', '2016-12-16 23:02:08');
INSERT INTO `w_weather_data` VALUES ('CN101281305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '70', '0', '1027', '9', '10', '11', '西风', '3-4', '12', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101281306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '82', '0', '1026', '7', '10', '20', '东风', '3-4', '12', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101281307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '73', '0', '1027', '9', '10', '56', '西南风', '3-4', '11', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101281308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '45', '0', '1026', '12', '10', '20', '东北风', '5-6', '32', '2016-12-16 23:02:07');
INSERT INTO `w_weather_data` VALUES ('CN101281401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '80', '0', '1026', '9', '10', '59', '东风', '3-4', '14', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101281402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '88', '0', '1025', '10', '10', '61', '西南风', '3-4', '14', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101281403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '83', '0', '1025', '9', '10', '31', '西北风', '3-4', '16', '2016-12-16 23:15:21');
INSERT INTO `w_weather_data` VALUES ('CN101281404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '81', '0', '1025', '9', '10', '29', '南风', '3-4', '11', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101281406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '80', '0', '1026', '9', '10', '59', '东风', '3-4', '16', '2016-12-16 23:15:20');
INSERT INTO `w_weather_data` VALUES ('CN101281501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '72', '0', '1027', '9', '10', '60', '东北风', '3-4', '13', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101281502', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '54', '0', '1027', '11', '10', '60', '东北风', '4-5', '23', '2016-12-16 23:15:59');
INSERT INTO `w_weather_data` VALUES ('CN101281503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '72', '0', '1027', '9', '10', '60', '东北风', '3-4', '12', '2016-12-16 23:15:58');
INSERT INTO `w_weather_data` VALUES ('CN101281601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '62', '0', '1026', '12', '10', '90', '东北风', '3-4', '13', '2016-12-16 23:01:09');
INSERT INTO `w_weather_data` VALUES ('CN101281701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '58', '0', '1025', '12', '10', '30', '东北风', '3-4', '14', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101281801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '51', '0', '1024', '13', '10', '42', '东北风', '6-7', '41', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101281802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '59', '0', '1025', '13', '10', '40', '东北风', '4-5', '17', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101281803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '51', '0', '1024', '13', '10', '42', '东北风', '6-7', '42', '2016-12-16 23:15:09');
INSERT INTO `w_weather_data` VALUES ('CN101281804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '51', '0', '1024', '13', '10', '42', '东北风', '6-7', '35', '2016-12-16 23:15:08');
INSERT INTO `w_weather_data` VALUES ('CN101281901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '73', '0', '1027', '10', '10', '60', '北风', '4-5', '20', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101281902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '81', '0', '1027', '10', '10', '60', '北风', '微风', '2', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101281903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '70', '0', '1027', '11', '10', '60', '西风', '3-4', '10', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101281904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '70', '0', '1027', '11', '10', '60', '北风', '5-6', '27', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101281905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '73', '0', '1027', '10', '10', '60', '北风', '4-5', '20', '2016-12-16 23:16:28');
INSERT INTO `w_weather_data` VALUES ('CN101282001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '22', '56', '0', '1023', '13', '10', '153', '东风', '3-4', '11', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101282002', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '86', '0', '1024', '11', '10', '349', '北风', '3-4', '10', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101282003', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '70', '0', '1023', '13', '10', '241', '北风', '3-4', '13', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101282004', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '22', '64', '0', '1023', '13', '10', '153', '东风', '4-5', '18', '2016-12-16 23:01:36');
INSERT INTO `w_weather_data` VALUES ('CN101282005', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '58', '0', '1025', '12', '10', '36', '北风', '4-5', '20', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101282006', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '56', '0', '1023', '13', '10', '40', '东风', '3-4', '16', '2016-12-16 23:01:35');
INSERT INTO `w_weather_data` VALUES ('CN101282101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '60', '0', '1025', '13', '10', '44', '东北风', '4-5', '19', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101282102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '80', '0', '1025', '10', '10', '21', '西风', '3-4', '13', '2016-12-16 23:02:18');
INSERT INTO `w_weather_data` VALUES ('CN101282103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '62', '0', '1025', '13', '10', '44', '东南风', '3-4', '10', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101282104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '60', '0', '1025', '13', '10', '34', '东北风', '4-5', '19', '2016-12-16 23:02:17');
INSERT INTO `w_weather_data` VALUES ('CN101290101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '82', '0', '1026', '9', '6', '210', '西南风', '4-5', '23', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101290103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '76', '0', '1019', '10', '10', '185', '北风', '微风', '4', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101290104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '94', '0', '1020', '5', '10', '205', '北风', '3-4', '13', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101290105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '85', '0', '1026', '9', '6', '210', '西南风', '3-4', '14', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101290106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '83', '0', '1020', '8', '10', '174', '西北风', '4-5', '23', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101290107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '80', '0', '1020', '8', '10', '174', '南风', '3-4', '10', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101290108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '84', '0', '1026', '8', '6', '210', '西南风', '5-6', '30', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101290109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '84', '0', '1026', '9', '6', '210', '北风', '微风', '6', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101290110', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '99', '0', '1020', '6', '10', '205', '东南风', '3-4', '10', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101290111', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '78', '0', '1026', '11', '6', '210', '西南风', '3-4', '10', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101290112', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '79', '0', '1026', '9', '6', '210', '西南风', '4-5', '18', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101290113', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '99', '0', '1026', '5', '6', '210', '西南风', '5-6', '28', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101290201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '83', '0', '1018', '5', '10', '233', '西风', '3-4', '11', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101290202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '74', '0', '1018', '7', '10', '235', '东风', '3-4', '10', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101290203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '77', '0', '1017', '8', '10', '227', '西北风', '3-4', '15', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101290204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '85', '0', '1017', '7', '10', '227', '东北风', '3-4', '13', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101290205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '65', '0', '1018', '9', '10', '199', '东南风', '3-4', '16', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101290206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '61', '0', '1018', '10', '10', '209', '东南风', '3-4', '14', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101290207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '59', '0', '1018', '10', '10', '237', '东南风', '3-4', '11', '2016-12-16 23:01:58');
INSERT INTO `w_weather_data` VALUES ('CN101290208', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '78', '0', '1018', '8', '10', '237', '东风', '4-5', '19', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101290209', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '61', '0', '1018', '6', '10', '224', '东北风', '3-4', '14', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101290210', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '65', '0', '1018', '7', '10', '224', '东南风', '4-5', '22', '2016-12-16 23:02:03');
INSERT INTO `w_weather_data` VALUES ('CN101290211', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '82', '0', '1018', '5', '10', '224', '东风', '3-4', '15', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101290212', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '78', '0', '1018', '11', '10', '209', '东南风', '3-4', '12', '2016-12-16 23:02:04');
INSERT INTO `w_weather_data` VALUES ('CN101290301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '76', '0', '1020', '12', '5', '166', '东风', '5-6', '29', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101290302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '79', '0', '1020', '11', '5', '160', '东南风', '3-4', '15', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101290303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '90', '0', '1020', '11', '5', '160', '东南风', '3-4', '12', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101290304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '84', '0', '1020', '10', '10', '174', '东南风', '3-4', '12', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101290305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '66', '0', '1020', '17', '5', '166', '东南风', '4-5', '20', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101290306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '90', '0', '1020', '10', '5', '166', '东南风', '3-4', '10', '2016-12-16 23:15:11');
INSERT INTO `w_weather_data` VALUES ('CN101290307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '85', '0', '1021', '10', '10', '152', '北风', '微风', '6', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101290308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '86', '0', '1021', '9', '10', '152', '南风', '4-5', '22', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101290309', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '78', '0', '1021', '11', '10', '153', '南风', '4-5', '19', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101290310', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '92', '0', '1021', '9', '10', '124', '东风', '3-4', '10', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101290311', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '14', '82', '0', '1020', '8', '10', '174', '西南风', '3-4', '14', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101290312', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '8', '91', '0', '1028', '11', '10', '9', '南风', '4-5', '17', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101290313', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '83', '0', '1022', '16', '10', '114', '北风', '3-4', '12', '2016-12-16 23:15:18');
INSERT INTO `w_weather_data` VALUES ('CN101290401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '89', '0', '1021', '6', '10', '171', '东南风', '3-4', '16', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '86', '0', '1021', '6', '10', '171', '南风', '4-5', '18', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '94', '0', '1021', '4', '10', '151', '西北风', '3-4', '10', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '92', '0', '1021', '5', '5', '144', '东南风', '4-5', '19', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '92', '0', '1021', '6', '10', '171', '西南风', '6-7', '38', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '98', '0', '1022', '5', '10', '127', '西南风', '4-5', '21', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290407', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '93', '0', '1022', '4', '10', '127', '东南风', '3-4', '13', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290408', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '77', '0', '1019', '6', '10', '185', '西风', '5-6', '28', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101290409', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '6', '85', '0', '1021', '7', '3', '142', '南风', '4-5', '21', '2016-12-16 23:15:51');
INSERT INTO `w_weather_data` VALUES ('CN101290501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '70', '0', '1017', '10', '10', '227', '北风', '微风', '5', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101290503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '94', '0', '1018', '8', '4', '240', '北风', '微风', '2', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101290504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '71', '0', '1018', '11', '4', '240', '南风', '3-4', '14', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101290505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '90', '0', '1017', '7', '10', '208', '东南风', '3-4', '14', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101290506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '86', '0', '1016', '8', '10', '201', '东南风', '4-5', '20', '2016-12-16 23:01:48');
INSERT INTO `w_weather_data` VALUES ('CN101290601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '80', '0', '1022', '9', '3', '149', '东南风', '3-4', '16', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101290602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '84', '0', '1022', '6', '3', '151', '东北风', '3-4', '10', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101290603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '84', '0', '1024', '10', '0', '110', '西南风', '3-4', '10', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101290604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '88', '0', '1023', '9', '10', '150', '北风', '3-4', '16', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101290605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '78', '0', '1022', '9', '3', '149', '东南风', '4-5', '23', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101290606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '83', '0', '1022', '7', '10', '131', '东风', '3-4', '15', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101290607', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '85', '0', '1023', '6', '10', '110', '北风', '3-4', '13', '2016-12-16 23:02:26');
INSERT INTO `w_weather_data` VALUES ('CN101290608', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '82', '0', '1023', '8', '10', '145', '东北风', '3-4', '10', '2016-12-16 23:02:27');
INSERT INTO `w_weather_data` VALUES ('CN101290701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '81', '0', '1026', '9', '6', '210', '西南风', '4-5', '23', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101290702', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '83', '0', '1026', '9', '6', '210', '东北风', '3-4', '11', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101290703', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '86', '0', '1026', '8', '6', '210', '西南风', '4-5', '20', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101290704', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '85', '0', '1026', '8', '6', '210', '南风', '4-5', '23', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101290705', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '89', '0', '1020', '7', '10', '174', '北风', '3-4', '10', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101290706', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '84', '0', '1019', '10', '10', '151', '东北风', '3-4', '15', '2016-12-16 23:15:43');
INSERT INTO `w_weather_data` VALUES ('CN101290707', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '77', '0', '1026', '11', '6', '210', '南风', '5-6', '30', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101290708', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '92', '0', '1019', '7', '10', '151', '北风', '微风', '4', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101290709', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '66', '0', '1029', '17', '10', '144', '东南风', '3-4', '12', '2016-12-16 23:15:44');
INSERT INTO `w_weather_data` VALUES ('CN101290801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '86', '0', '1018', '9', '4', '185', '西南风', '4-5', '23', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '79', '0', '1018', '9', '10', '149', '西南风', '3-4', '10', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '58', '0', '1018', '16', '10', '156', '东南风', '5-6', '31', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290804', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '81', '0', '1018', '9', '4', '185', '西南风', '4-5', '18', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101290805', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '83', '0', '1018', '10', '4', '185', '南风', '5-6', '33', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101290806', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '86', '0', '1018', '10', '4', '185', '南风', '3-4', '11', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290807', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '84', '0', '1018', '11', '10', '156', '南风', '3-4', '10', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290808', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '83', '0', '1026', '11', '6', '210', '西南风', '3-4', '12', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290809', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '98', '0', '1018', '8', '4', '185', '南风', '3-4', '10', '2016-12-16 23:16:24');
INSERT INTO `w_weather_data` VALUES ('CN101290810', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '91', '0', '1018', '8', '10', '149', '西北风', '3-4', '12', '2016-12-16 23:16:27');
INSERT INTO `w_weather_data` VALUES ('CN101290901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '82', '0', '1019', '14', '3', '137', '东风', '3-4', '13', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101290902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '86', '0', '1018', '17', '3', '158', '北风', '微风', '1', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101290903', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '18', '80', '0', '1018', '15', '3', '175', '南风', '4-5', '23', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101290904', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '18', '81', '0', '1017', '18', '9', '145', '北风', '3-4', '10', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101290906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '83', '0', '1018', '13', '3', '158', '南风', '3-4', '15', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101290907', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '91', '0', '1019', '13', '3', '121', '南风', '3-4', '15', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101290908', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '90', '0', '1017', '17', '9', '145', '西北风', '3-4', '14', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101290909', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '84', '0', '1018', '17', '0', '134', '北风', '微风', '10', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101290911', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '84', '0', '1018', '15', '3', '158', '南风', '4-5', '20', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101290912', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '87', '0', '1019', '14', '3', '137', '南风', '3-4', '13', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101291001', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '80', '0', '1020', '5', '5', '64', '北风', '微风', '4', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101291002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '79', '0', '1020', '5', '5', '64', '北风', '微风', '4', '2016-12-16 23:01:23');
INSERT INTO `w_weather_data` VALUES ('CN101291003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '68', '0', '1020', '12', '5', '64', '西风', '3-4', '13', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101291004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '6', '92', '0', '1022', '3', '10', '141', '西南风', '3-4', '13', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101291005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '79', '0', '1023', '8', '10', '121', '南风', '3-4', '13', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101291006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '65', '0', '1019', '13', '10', '218', '北风', '3-4', '12', '2016-12-16 23:01:24');
INSERT INTO `w_weather_data` VALUES ('CN101291007', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '7', '91', '0', '1021', '10', '3', '81', '西南风', '4-5', '20', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101291008', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '70', '0', '1020', '11', '5', '89', '南风', '3-4', '15', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101291009', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '84', '0', '1020', '12', '5', '89', '东北风', '3-4', '10', '2016-12-16 23:01:25');
INSERT INTO `w_weather_data` VALUES ('CN101291010', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '80', '0', '1020', '9', '5', '89', '东北风', '3-4', '12', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101291011', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '91', '0', '1022', '10', '10', '47', '西南风', '4-5', '21', '2016-12-16 23:01:20');
INSERT INTO `w_weather_data` VALUES ('CN101291101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '11', '85', '0', '1018', '12', '3', '194', '南风', '3-4', '13', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101291102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '95', '0', '1018', '13', '0', '134', '西南风', '3-4', '14', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101291103', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '19', '87', '0', '1018', '14', '0', '124', '西南风', '3-4', '15', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101291104', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '19', '87', '0', '1018', '15', '0', '124', '西风', '3-4', '13', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101291105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '79', '0', '1017', '10', '10', '208', '西风', '4-5', '23', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101291106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '72', '0', '1018', '14', '4', '240', '西南风', '4-5', '24', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101291107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '70', '0', '1017', '13', '10', '208', '东北风', '3-4', '12', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101291108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '91', '0', '1018', '14', '4', '240', '东北风', '3-4', '13', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101291201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '59', '0', '1018', '14', '10', '174', '北风', '微风', '5', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101291203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '83', '0', '1020', '8', '10', '251', '北风', '微风', '6', '2016-12-16 23:15:23');
INSERT INTO `w_weather_data` VALUES ('CN101291204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '9', '81', '0', '1016', '3', '10', '246', '西北风', '3-4', '15', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101291205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '59', '0', '1016', '14', '10', '199', '北风', '微风', '9', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101291206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '59', '0', '1018', '14', '10', '256', '北风', '微风', '5', '2016-12-16 23:15:25');
INSERT INTO `w_weather_data` VALUES ('CN101291207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '67', '0', '1018', '7', '10', '174', '南风', '3-4', '12', '2016-12-16 23:15:24');
INSERT INTO `w_weather_data` VALUES ('CN101291301', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '51', '0', '1015', '-1', '10', '217', '东北风', '4-5', '19', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101291302', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '2', '43', '0', '1015', '0', '10', '211', '西风', '4-5', '23', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101291303', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '59', '0', '1016', '4', '10', '240', '东南风', '4-5', '17', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101291304', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '3', '51', '0', '1015', '-1', '10', '217', '东北风', '4-5', '21', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101291401', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '67', '0', '1018', '7', '10', '175', '北风', '4-5', '21', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101291402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '83', '0', '1018', '4', '10', '175', '南风', '3-4', '16', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101291403', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '17', '77', '0', '1018', '11', '10', '149', '北风', '微风', '0', '2016-12-16 23:01:12');
INSERT INTO `w_weather_data` VALUES ('CN101291404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '78', '0', '1018', '4', '10', '175', '东南风', '5-6', '27', '2016-12-16 23:01:13');
INSERT INTO `w_weather_data` VALUES ('CN101291501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '82', '0', '1018', '14', '4', '240', '东风', '3-4', '15', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101291503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '87', '0', '1015', '14', '10', '217', '西南风', '3-4', '13', '2016-12-16 23:01:57');
INSERT INTO `w_weather_data` VALUES ('CN101291504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '74', '0', '1016', '14', '10', '201', '北风', '微风', '6', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101291506', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '21', '89', '0', '1015', '16', '10', '204', '西北风', '3-4', '11', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101291507', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '84', '0', '1018', '12', '4', '240', '东北风', '3-4', '16', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101291508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '82', '0', '1018', '14', '4', '240', '东风', '3-4', '11', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101291601', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '21', '69', '0', '1019', '20', '5', '126', '南风', '3-4', '14', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101291603', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '21', '90', '0', '1019', '14', '5', '126', '东北风', '4-5', '20', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101291605', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '16', '87', '0', '1021', '16', '0', '127', '北风', '微风', '9', '2016-12-16 23:15:10');
INSERT INTO `w_weather_data` VALUES ('CN101300101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '55', '0', '1026', '11', '7', '360', '东风', '5-6', '25', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101300103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '62', '0', '1026', '11', '7', '360', '东北风', '3-4', '12', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101300104', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '71', '0', '1026', '9', '7', '360', '西北风', '3-4', '14', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101300105', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '75', '0', '1026', '10', '7', '360', '西北风', '3-4', '12', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101300106', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '58', '0', '1025', '10', '10', '51', '东北风', '3-4', '10', '2016-12-16 23:15:45');
INSERT INTO `w_weather_data` VALUES ('CN101300107', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '88', '0', '1026', '7', '7', '360', '北风', '微风', '5', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101300108', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '49', '0', '1026', '13', '7', '360', '东南风', '3-4', '13', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101300109', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '64', '0', '1026', '11', '7', '360', '西风', '4-5', '18', '2016-12-16 23:15:46');
INSERT INTO `w_weather_data` VALUES ('CN101300201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '16', '54', '0', '1024', '13', '10', '54', '北风', '微风', '6', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101300202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '10', '68', '0', '1026', '9', '7', '360', '北风', '微风', '4', '2016-12-16 23:15:16');
INSERT INTO `w_weather_data` VALUES ('CN101300203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '51', '0', '1024', '14', '10', '77', '南风', '3-4', '16', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101300204', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '16', '55', '0', '1024', '12', '10', '53', '北风', '微风', '9', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101300205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '15', '70', '0', '1024', '10', '10', '48', '西北风', '3-4', '11', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101300206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '55', '0', '1024', '12', '10', '30', '东南风', '4-5', '23', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101300207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '54', '0', '1024', '14', '10', '54', '东北风', '3-4', '16', '2016-12-16 23:15:17');
INSERT INTO `w_weather_data` VALUES ('CN101300301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '51', '0', '1025', '11', '10', '17', '东北风', '3-4', '15', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '84', '0', '1025', '8', '10', '17', '西风', '3-4', '13', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300304', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '68', '0', '1025', '8', '10', '17', '北风', '微风', '4', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300305', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '73', '0', '1025', '9', '10', '17', '西风', '3-4', '12', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300306', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '82', '0', '1026', '7', '10', '19', '东南风', '3-4', '13', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300307', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '66', '0', '1026', '9', '10', '19', '东北风', '3-4', '14', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300308', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '84', '0', '1026', '6', '10', '19', '北风', '3-4', '14', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101300401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '75', '0', '1025', '8', '10', '7', '西北风', '3-4', '14', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101300402', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '59', '0', '1025', '10', '10', '51', '东北风', '3-4', '10', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101300403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '9', '82', '0', '1025', '4', '10', '69', '西北风', '3-4', '14', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101300404', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '89', '0', '1025', '7', '10', '7', '西北风', '3-4', '13', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101300405', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '17', '79', '0', '1025', '10', '10', '2', '东风', '4-5', '22', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101300406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '75', '0', '1025', '8', '10', '7', '西北风', '3-4', '16', '2016-12-16 23:01:05');
INSERT INTO `w_weather_data` VALUES ('CN101300501', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '50', '0', '1027', '9', '5', '340', '北风', '4-5', '18', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300503', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '83', '0', '1027', '6', '5', '340', '南风', '3-4', '10', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300504', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '67', '0', '1027', '8', '5', '340', '北风', '4-5', '21', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300505', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '51', '0', '1027', '9', '5', '340', '西风', '3-4', '11', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300506', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '69', '0', '1027', '6', '5', '340', '西南风', '3-4', '16', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300507', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '53', '0', '1027', '9', '5', '340', '东北风', '3-4', '16', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300508', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '66', '0', '1027', '7', '5', '340', '东风', '3-4', '16', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300509', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '89', '0', '1027', '4', '5', '340', '西风', '3-4', '16', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101300510', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '80', '0', '1027', '7', '5', '340', '西北风', '3-4', '13', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101300511', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '61', '0', '1027', '9', '5', '340', '东风', '3-4', '15', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101300512', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '82', '0', '1027', '7', '5', '340', '东南风', '3-4', '11', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101300513', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '4', '84', '0', '1027', '8', '5', '340', '东南风', '3-4', '14', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101300514', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '5', '91', '0', '1028', '3', '10', '45', '北风', '微风', '0', '2016-12-16 23:01:52');
INSERT INTO `w_weather_data` VALUES ('CN101300601', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '71', '0', '1025', '10', '10', '24', '西南风', '3-4', '11', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101300602', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '77', '0', '1025', '10', '10', '72', '东北风', '3-4', '15', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101300604', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '75', '0', '1025', '10', '10', '24', '东南风', '3-4', '10', '2016-12-16 23:15:31');
INSERT INTO `w_weather_data` VALUES ('CN101300605', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '14', '82', '0', '1025', '7', '10', '69', '西北风', '4-5', '20', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101300606', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '75', '0', '1025', '8', '10', '40', '北风', '3-4', '12', '2016-12-16 23:15:32');
INSERT INTO `w_weather_data` VALUES ('CN101300701', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '79', '0', '1026', '7', '10', '13', '西风', '3-4', '11', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101300702', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '78', '0', '1025', '9', '10', '35', '东风', '3-4', '12', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101300703', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '59', '0', '1026', '9', '10', '13', '北风', '3-4', '12', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101300704', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '71', '0', '1025', '8', '10', '35', '北风', '3-4', '15', '2016-12-16 23:16:13');
INSERT INTO `w_weather_data` VALUES ('CN101300801', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '59', '0', '1025', '12', '10', '43', '西北风', '3-4', '11', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101300802', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '75', '0', '1025', '11', '10', '72', '西北风', '3-4', '10', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101300803', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '55', '0', '1025', '12', '10', '72', '东北风', '3-4', '16', '2016-12-16 23:01:19');
INSERT INTO `w_weather_data` VALUES ('CN101300901', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '70', '0', '1025', '11', '10', '24', '北风', '4-5', '21', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101300902', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '61', '0', '1024', '11', '10', '15', '东北风', '4-5', '24', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101300903', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '56', '0', '1025', '12', '10', '24', '东北风', '4-5', '17', '2016-12-16 23:02:09');
INSERT INTO `w_weather_data` VALUES ('CN101300904', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '63', '0', '1025', '11', '10', '24', '北风', '5-6', '25', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101300905', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '72', '0', '1024', '10', '10', '15', '东北风', '3-4', '12', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101300906', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '70', '0', '1025', '11', '10', '43', '北风', '4-5', '20', '2016-12-16 23:02:10');
INSERT INTO `w_weather_data` VALUES ('CN101301001', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '18', '70', '0', '1025', '10', '10', '102', '北风', '3-4', '16', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301002', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '80', '0', '1024', '7', '10', '101', '北风', '3-4', '12', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301003', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '15', '67', '0', '1025', '12', '10', '117', '西南风', '4-5', '21', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301004', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '68', '0', '1024', '8', '10', '85', '东北风', '3-4', '13', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301005', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '55', '0', '1024', '10', '10', '85', '北风', '微风', '7', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301006', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '17', '80', '0', '1025', '9', '10', '114', '东风', '4-5', '23', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301007', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '19', '62', '0', '1025', '12', '10', '114', '西南风', '3-4', '15', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301008', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '90', '0', '1024', '9', '10', '120', '西风', '4-5', '24', '2016-12-16 23:15:49');
INSERT INTO `w_weather_data` VALUES ('CN101301009', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '77', '0', '1023', '12', '10', '110', '北风', '3-4', '10', '2016-12-16 23:15:50');
INSERT INTO `w_weather_data` VALUES ('CN101301010', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '67', '0', '1025', '6', '10', '97', '东北风', '3-4', '10', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101301011', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '67', '0', '1025', '9', '10', '97', '西风', '3-4', '16', '2016-12-16 23:15:47');
INSERT INTO `w_weather_data` VALUES ('CN101301012', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '13', '88', '0', '1024', '8', '10', '135', '西风', '3-4', '15', '2016-12-16 23:15:48');
INSERT INTO `w_weather_data` VALUES ('CN101301101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '55', '0', '1026', '13', '7', '360', '东北风', '4-5', '20', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101301102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '60', '0', '1026', '12', '7', '360', '西北风', '3-4', '13', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101301103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '90', '0', '1026', '9', '7', '360', '东风', '3-4', '11', '2016-12-16 23:16:23');
INSERT INTO `w_weather_data` VALUES ('CN101301201', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '61', '0', '1026', '10', '10', '120', '南风', '3-4', '13', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101301202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '78', '0', '1026', '8', '10', '75', '北风', '微风', '4', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101301203', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '15', '81', '0', '1025', '7', '10', '53', '西南风', '3-4', '11', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101301204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '83', '0', '1025', '7', '10', '53', '西南风', '4-5', '19', '2016-12-16 23:01:43');
INSERT INTO `w_weather_data` VALUES ('CN101301205', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '14', '45', '0', '1026', '11', '10', '120', '东南风', '5-6', '28', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101301206', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '66', '0', '1025', '7', '10', '51', '东风', '3-4', '12', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101301207', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '12', '62', '0', '1025', '10', '10', '51', '东风', '4-5', '20', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101301208', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '80', '0', '1025', '6', '10', '97', '西风', '3-4', '12', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101301209', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '11', '71', '0', '1026', '5', '10', '69', '北风', '3-4', '15', '2016-12-16 23:01:44');
INSERT INTO `w_weather_data` VALUES ('CN101301210', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '58', '0', '1026', '12', '7', '360', '北风', '4-5', '18', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101301211', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '83', '0', '1026', '7', '7', '360', '西南风', '4-5', '18', '2016-12-16 23:01:42');
INSERT INTO `w_weather_data` VALUES ('CN101301301', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '53', '0', '1024', '14', '10', '16', '东北风', '4-5', '17', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101301302', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '55', '0', '1024', '13', '10', '16', '北风', '4-5', '18', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101301303', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '21', '58', '0', '1023', '14', '10', '26', '北风', '5-6', '31', '2016-12-16 23:01:08');
INSERT INTO `w_weather_data` VALUES ('CN101301401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '46', '0', '1026', '15', '7', '360', '东北风', '4-5', '23', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101301402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '79', '0', '1024', '10', '10', '30', '东南风', '3-4', '10', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101301403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '46', '0', '1024', '14', '10', '58', '东北风', '5-6', '28', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101301405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '10', '58', '0', '1026', '13', '7', '360', '东北风', '3-4', '15', '2016-12-16 23:02:01');
INSERT INTO `w_weather_data` VALUES ('CN101310101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '71', '0', '1023', '17', '10', '59', '东风', '5-6', '33', '2016-12-16 23:16:02');
INSERT INTO `w_weather_data` VALUES ('CN101310201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '72', '0', '1021', '19', '10', '60', '北风', '4-5', '22', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101310202', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '21', '76', '0', '1022', '16', '10', '46', '东北风', '7-8', '47', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101310203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '72', '0', '1023', '17', '8', '50', '东风', '4-5', '17', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101310204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '78', '0', '1023', '16', '8', '50', '北风', '3-4', '10', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101310205', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '17', '81', '0', '1023', '15', '8', '50', '东风', '3-4', '15', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101310206', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '76', '0', '1022', '16', '10', '68', '东风', '4-5', '22', '2016-12-16 23:01:04');
INSERT INTO `w_weather_data` VALUES ('CN101310207', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '18', '88', '0', '1022', '14', '10', '68', '东南风', '4-5', '20', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101310208', '2016-12-16', '300', 'http://files.heweather.com/cond_icon/300.png', '阵雨', '20', '98', '0.3', '1021', '13', '10', '60', '西风', '3-4', '14', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101310209', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '17', '77', '0', '1023', '17', '8', '50', '北风', '4-5', '24', '2016-12-16 23:01:07');
INSERT INTO `w_weather_data` VALUES ('CN101310210', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '17', '80', '0', '1023', '16', '8', '50', '北风', '3-4', '16', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101310211', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '83', '0.2', '1023', '17', '8', '50', '西北风', '4-5', '21', '2016-12-16 23:01:03');
INSERT INTO `w_weather_data` VALUES ('CN101310212', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '77', '0', '1023', '18', '8', '50', '东北风', '4-5', '19', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101310214', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '20', '73', '0', '1021', '17', '10', '60', '东北风', '3-4', '16', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101310215', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '83', '0', '1023', '16', '8', '50', '北风', '5-6', '31', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101310216', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '78', '0', '1021', '17', '10', '60', '东北风', '5-6', '32', '2016-12-16 23:01:01');
INSERT INTO `w_weather_data` VALUES ('CN101310217', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '30', '75', '0', '1016', '24', '10', '40', '东北风', '6-7', '42', '2016-12-16 23:01:02');
INSERT INTO `w_weather_data` VALUES ('CN101310220', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '36', '79', '0.0', '1010', '28', '10', '183', '西南风', '3-4', '15', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101310221', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '20', '79', '0', '1021', '16', '10', '60', '东北风', '4-5', '22', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101310222', '2016-12-16', '104', 'http://files.heweather.com/cond_icon/104.png', '阴', '20', '80', '0', '1021', '15', '10', '60', '北风', '4-5', '19', '2016-12-16 23:01:15');
INSERT INTO `w_weather_data` VALUES ('CN101310224', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '30', '89', '0.0', '1016', '26', '10', '40', '东北风', '7-8', '52', '2016-12-16 23:01:14');
INSERT INTO `w_weather_data` VALUES ('CN101320101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '56', '0.0', '1026', '23', '10', '90', '北风', '6-7', '36', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101320102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '57', '0.0', '1026', '22', '10', '90', '北风', '6-7', '39', '2016-12-16 23:01:55');
INSERT INTO `w_weather_data` VALUES ('CN101320103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '57', '0.0', '1026', '22', '10', '90', '北风', '6-7', '40', '2016-12-16 23:01:56');
INSERT INTO `w_weather_data` VALUES ('CN101330101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '58', '0.0', '1025', '23', '10', '30', '北风', '6-7', '41', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101330102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '58', '0.0', '1025', '23', '10', '30', '北风', '6-7', '36', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101330103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '58', '0.0', '1025', '23', '10', '30', '北风', '6-7', '41', '2016-12-16 23:16:03');
INSERT INTO `w_weather_data` VALUES ('CN101340101', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '12', '65', '0.0', '1027', '18', '10', '90', '东风', '5-6', '33', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101340102', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '74', '0.0', '1026', '17', '10', '60', '东北风', '8-9', '56', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101340103', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '71', '0.0', '1026', '19', '10', '60', '东北风', '7-8', '53', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101340104', '2016-12-16', '300', 'http://files.heweather.com/cond_icon/300.png', '阵雨', '12', '74', '0.25', '1027', '18', '10', '90', '北风', '5-6', '33', '2016-12-16 23:02:11');
INSERT INTO `w_weather_data` VALUES ('CN101340201', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '61', '0.0', '1022', '25', '6', '350', '西风', '5-6', '30', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101340202', '2016-12-16', '100', 'http://files.heweather.com/cond_icon/100.png', '晴', '16', '61', '0.0', '1022', '22', '10', '20', '北风', '6-7', '35', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101340203', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '59', '0.0', '1022', '23', '6', '350', '北风', '5-6', '27', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101340204', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '75', '0.0', '1022', '22', '6', '350', '北风', '5-6', '25', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101340205', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '19', '61', '0.0', '1022', '25', '6', '350', '西风', '5-6', '29', '2016-12-16 23:15:36');
INSERT INTO `w_weather_data` VALUES ('CN101340401', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '59', '0.0', '1022', '22', '10', '20', '北风', '7-8', '43', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101340402', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '13', '70', '0.0', '1026', '19', '10', '60', '北风', '7-8', '43', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101340403', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '60', '0.0', '1022', '21', '10', '20', '北风', '7-8', '44', '2016-12-16 23:01:40');
INSERT INTO `w_weather_data` VALUES ('CN101340404', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '17', '57', '0.0', '1024', '22', '10', '14', '北风', '5-6', '30', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101340405', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '16', '77', '0.0', '1025', '21', '7', '43', '东风', '4-5', '17', '2016-12-16 23:01:39');
INSERT INTO `w_weather_data` VALUES ('CN101340406', '2016-12-16', '101', 'http://files.heweather.com/cond_icon/101.png', '多云', '15', '60', '0.0', '1022', '22', '10', '20', '北风', '6-7', '41', '2016-12-16 23:01:39');

-- ----------------------------
-- Table structure for w_weather_icon
-- ----------------------------
DROP TABLE IF EXISTS `w_weather_icon`;
CREATE TABLE `w_weather_icon` (
  `code` char(3) NOT NULL COMMENT '天气图标编码',
  `name` varchar(10) DEFAULT NULL COMMENT '天气图标名称',
  `english_name` varchar(24) DEFAULT NULL COMMENT '天气图标英文名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '天气图标资源路径',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='天气图标';

-- ----------------------------
-- Records of w_weather_icon
-- ----------------------------
INSERT INTO `w_weather_icon` VALUES ('100', '晴', 'Sunny/Clear', 'http://files.heweather.com/cond_icon/100.png');
INSERT INTO `w_weather_icon` VALUES ('101', '多云', 'Cloudy', 'http://files.heweather.com/cond_icon/101.png');
INSERT INTO `w_weather_icon` VALUES ('102', '少云', 'Few Clouds', 'http://files.heweather.com/cond_icon/102.png');
INSERT INTO `w_weather_icon` VALUES ('103', '晴间多云', 'Partly Cloudy', 'http://files.heweather.com/cond_icon/103.png');
INSERT INTO `w_weather_icon` VALUES ('104', '阴', 'Overcast', 'http://files.heweather.com/cond_icon/104.png');
INSERT INTO `w_weather_icon` VALUES ('200', '有风', 'Windy', 'http://files.heweather.com/cond_icon/200.png');
INSERT INTO `w_weather_icon` VALUES ('201', '平静', 'Calm', 'http://files.heweather.com/cond_icon/201.png');
INSERT INTO `w_weather_icon` VALUES ('202', '微风', 'Light Breeze', 'http://files.heweather.com/cond_icon/202.png');
INSERT INTO `w_weather_icon` VALUES ('203', '和风', 'Moderate/Gentle Bree', 'http://files.heweather.com/cond_icon/203.png');
INSERT INTO `w_weather_icon` VALUES ('204', '清风', 'Fresh Breeze', 'http://files.heweather.com/cond_icon/204.png');
INSERT INTO `w_weather_icon` VALUES ('205', '强风/劲风', 'Strong Breeze', 'http://files.heweather.com/cond_icon/205.png');
INSERT INTO `w_weather_icon` VALUES ('206', '疾风', 'High Wind, Near Gale', 'http://files.heweather.com/cond_icon/206.png');
INSERT INTO `w_weather_icon` VALUES ('207', '大风', 'Gale', 'http://files.heweather.com/cond_icon/207.png');
INSERT INTO `w_weather_icon` VALUES ('208', '烈风', 'Strong Gale', 'http://files.heweather.com/cond_icon/208.png');
INSERT INTO `w_weather_icon` VALUES ('209', '风暴', 'Storm', 'http://files.heweather.com/cond_icon/209.png');
INSERT INTO `w_weather_icon` VALUES ('210', '狂爆风', 'Violent Storm', 'http://files.heweather.com/cond_icon/210.png');
INSERT INTO `w_weather_icon` VALUES ('211', '飓风', 'Hurricane', 'http://files.heweather.com/cond_icon/211.png');
INSERT INTO `w_weather_icon` VALUES ('212', '龙卷风', 'Tornado', 'http://files.heweather.com/cond_icon/212.png');
INSERT INTO `w_weather_icon` VALUES ('213', '热带风暴', 'Tropical Storm', 'http://files.heweather.com/cond_icon/213.png');
INSERT INTO `w_weather_icon` VALUES ('300', '阵雨', 'Shower Rain', 'http://files.heweather.com/cond_icon/300.png');
INSERT INTO `w_weather_icon` VALUES ('301', '强阵雨', 'Heavy Shower Rain', 'http://files.heweather.com/cond_icon/301.png');
INSERT INTO `w_weather_icon` VALUES ('302', '雷阵雨', 'Thundershower', 'http://files.heweather.com/cond_icon/302.png');
INSERT INTO `w_weather_icon` VALUES ('303', '强雷阵雨', 'Heavy Thunderstorm', 'http://files.heweather.com/cond_icon/303.png');
INSERT INTO `w_weather_icon` VALUES ('304', '雷阵雨伴有冰雹', 'Hail', 'http://files.heweather.com/cond_icon/304.png');
INSERT INTO `w_weather_icon` VALUES ('305', '小雨', 'Light Rain', 'http://files.heweather.com/cond_icon/305.png');
INSERT INTO `w_weather_icon` VALUES ('306', '中雨', 'Moderate Rain', 'http://files.heweather.com/cond_icon/306.png');
INSERT INTO `w_weather_icon` VALUES ('307', '大雨', 'Heavy Rain', 'http://files.heweather.com/cond_icon/307.png');
INSERT INTO `w_weather_icon` VALUES ('308', '极端降雨', 'Extreme Rain', 'http://files.heweather.com/cond_icon/308.png');
INSERT INTO `w_weather_icon` VALUES ('309', '毛毛雨/细雨', 'Drizzle Rain', 'http://files.heweather.com/cond_icon/309.png');
INSERT INTO `w_weather_icon` VALUES ('310', '暴雨', 'Storm', 'http://files.heweather.com/cond_icon/310.png');
INSERT INTO `w_weather_icon` VALUES ('311', '大暴雨', 'Heavy Storm', 'http://files.heweather.com/cond_icon/311.png');
INSERT INTO `w_weather_icon` VALUES ('312', '特大暴雨', 'Severe Storm', 'http://files.heweather.com/cond_icon/312.png');
INSERT INTO `w_weather_icon` VALUES ('313', '冻雨', 'Freezing Rain', 'http://files.heweather.com/cond_icon/313.png');
INSERT INTO `w_weather_icon` VALUES ('400', '小雪', 'Light Snow', 'http://files.heweather.com/cond_icon/400.png');
INSERT INTO `w_weather_icon` VALUES ('401', '中雪', 'Moderate Snow', 'http://files.heweather.com/cond_icon/401.png');
INSERT INTO `w_weather_icon` VALUES ('402', '大雪', 'Heavy Snow', 'http://files.heweather.com/cond_icon/402.png');
INSERT INTO `w_weather_icon` VALUES ('403', '暴雪', 'Snowstorm', 'http://files.heweather.com/cond_icon/403.png');
INSERT INTO `w_weather_icon` VALUES ('404', '雨夹雪', 'Sleet', 'http://files.heweather.com/cond_icon/404.png');
INSERT INTO `w_weather_icon` VALUES ('405', '雨雪天气', 'Rain And Snow', 'http://files.heweather.com/cond_icon/405.png');
INSERT INTO `w_weather_icon` VALUES ('406', '阵雨夹雪', 'Shower Snow', 'http://files.heweather.com/cond_icon/406.png');
INSERT INTO `w_weather_icon` VALUES ('407', '阵雪', 'Snow Flurry', 'http://files.heweather.com/cond_icon/407.png');
INSERT INTO `w_weather_icon` VALUES ('500', '薄雾', 'Mist', 'http://files.heweather.com/cond_icon/500.png');
INSERT INTO `w_weather_icon` VALUES ('501', '雾', 'Foggy', 'http://files.heweather.com/cond_icon/501.png');
INSERT INTO `w_weather_icon` VALUES ('502', '霾', 'Haze', 'http://files.heweather.com/cond_icon/502.png');
INSERT INTO `w_weather_icon` VALUES ('503', '扬沙', 'Sand', 'http://files.heweather.com/cond_icon/503.png');
INSERT INTO `w_weather_icon` VALUES ('504', '浮尘', 'Dust', 'http://files.heweather.com/cond_icon/504.png');
INSERT INTO `w_weather_icon` VALUES ('506', '火山灰', 'Volcanic Ash', 'http://files.heweather.com/cond_icon/506.png');
INSERT INTO `w_weather_icon` VALUES ('507', '沙尘暴', 'Duststorm', 'http://files.heweather.com/cond_icon/507.png');
INSERT INTO `w_weather_icon` VALUES ('508', '强沙尘暴', 'Sandstorm', 'http://files.heweather.com/cond_icon/508.png');
INSERT INTO `w_weather_icon` VALUES ('900', '热', 'Hot', 'http://files.heweather.com/cond_icon/900.png');
INSERT INTO `w_weather_icon` VALUES ('901', '冷', 'Cold', 'http://files.heweather.com/cond_icon/901.png');
INSERT INTO `w_weather_icon` VALUES ('999', '未知', 'Unknown', 'http://files.heweather.com/cond_icon/999.png');

-- ----------------------------
-- Table structure for w_weather_key
-- ----------------------------
DROP TABLE IF EXISTS `w_weather_key`;
CREATE TABLE `w_weather_key` (
  `id` bigint(20) NOT NULL,
  `weather_key` varchar(64) NOT NULL,
  `weather_email` varchar(64) NOT NULL,
  `weather_email_password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_weather_key
-- ----------------------------
INSERT INTO `w_weather_key` VALUES ('1', 'e799f8b19d7344aab6ba1f96f67a717d', 'xiafengfeiwu@126.com', null);
INSERT INTO `w_weather_key` VALUES ('2', '61f8b49409404b679018a177fe840efc', 'weah_1@outlook.com', null);
INSERT INTO `w_weather_key` VALUES ('3', 'e799f8b19d7344aab6ba1f96f67a717d', 'weah_1@outlook.com', null);
INSERT INTO `w_weather_key` VALUES ('809645772998967297', '8b75a4d5835c40f191e9b44d325f170c', 'weah_1@outlook.com', 'weather123');
