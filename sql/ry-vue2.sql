/*
 Navicat Premium Data Transfer

 Source Server         : work2
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : ry-vue2

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 23/04/2023 22:45:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'tqcgl_passenger', '乘客管理', NULL, NULL, 'TqcglPassenger', 'crud', 'com.ruoyi.biz', 'passenger', 'passenger', '乘客管理', 'zhu', '0', '/', '{\"parentMenuId\":\"3\"}', 'admin', '2023-04-22 02:17:20', '', '2023-04-23 22:14:42', NULL);
INSERT INTO `gen_table` VALUES (6, 'tqcgl_reservation', '预约管理', NULL, NULL, 'TqcglReservation', 'crud', 'com.ruoyi.biz', 'reservation', 'reservation', '预约管理', 'zhu', '0', '/', '{\"parentMenuId\":\"3\"}', 'admin', '2023-04-22 02:30:23', '', '2023-04-23 22:36:50', NULL);
INSERT INTO `gen_table` VALUES (8, 'tqcgl_drivers', '司机管理', NULL, NULL, 'TqcglDrivers', 'crud', 'com.ruoyi.biz', 'drivers', 'drivers', '司机管理', 'zhu', '0', '/', '{\"parentMenuId\":3}', 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:12:01', NULL);
INSERT INTO `gen_table` VALUES (9, 'tqcgl_enterprise', '企业管理', NULL, NULL, 'TqcglEnterprise', 'crud', 'com.ruoyi.biz', 'enterprise', 'enterprise', '企业管理', 'zhu', '0', '/', '{\"parentMenuId\":3}', 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:13:34', NULL);
INSERT INTO `gen_table` VALUES (10, 'tqcgl_leader', '车长管理', NULL, NULL, 'TqcglLeader', 'crud', 'com.ruoyi.biz', 'leader', 'leader', '车长管理', 'zhu', '0', '/', '{\"parentMenuId\":3}', 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:14:05', NULL);
INSERT INTO `gen_table` VALUES (11, 'tqcgl_shifts', '班次管理', NULL, NULL, 'TqcglShifts', 'crud', 'com.ruoyi.biz', 'shifts', 'shifts', '班次管理', 'zhu', '0', '/', '{\"parentMenuId\":3}', 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:12:52', NULL);
INSERT INTO `gen_table` VALUES (12, 'tqcgl_vehicles', '车辆管理', NULL, NULL, 'TqcglVehicles', 'crud', 'com.ruoyi.biz', 'vehicles', 'vehicles', '车辆管理', 'zhu', '0', '/', '{\"parentMenuId\":\"3\"}', 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:05:30', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (16, '4', 'passenger_id', '乘客ID，自增长', 'int(10) unsigned zerofill', 'String', 'passengerId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-22 02:17:20', '', '2023-04-23 22:14:42');
INSERT INTO `gen_table_column` VALUES (17, '4', 'passenger_name', '乘客姓名', 'varchar(20)', 'String', 'passengerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-22 02:17:20', '', '2023-04-23 22:14:42');
INSERT INTO `gen_table_column` VALUES (20, '4', 'passenger_phone', '联系电话', 'varchar(20)', 'String', 'passengerPhone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-22 02:17:20', '', '2023-04-23 22:14:42');
INSERT INTO `gen_table_column` VALUES (21, '4', 'passenger_photo', '乘客照片', 'varchar(20)', 'String', 'passengerPhoto', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-22 02:17:20', '', '2023-04-23 22:14:42');
INSERT INTO `gen_table_column` VALUES (36, '6', 'reservation_id', '', 'int(10) unsigned zerofill', 'Integer', 'reservationId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-22 02:30:23', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (37, '6', 'classes_name', '班次名称', 'varchar(20)', 'String', 'classesName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (38, '6', 'license_plate', '车牌', 'varchar(20)', 'String', 'licensePlate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (39, '6', 'driver_name', '司机姓名', 'varchar(20)', 'String', 'driverName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (40, '6', 'driver_phone', '司机联系电话', 'varchar(20)', 'String', 'driverPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (41, '6', 'over_name', '车长姓名', 'varchar(20)', 'String', 'overName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (42, '6', 'over_phone', '车长联系电话', 'varchar(20)', 'String', 'overPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (43, '6', 'departure_time', '发车时间', 'datetime', 'Date', 'departureTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (44, '6', 'staff_name', '员工姓名', 'varchar(20)', 'String', 'staffName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (45, '6', 'staff_company', '员工所属公司', 'varchar(50)', 'String', 'staffCompany', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (46, '6', 'staff_depart', '员工所属部门', 'varchar(20)', 'String', 'staffDepart', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:50');
INSERT INTO `gen_table_column` VALUES (47, '6', 'staff_phone', '员工联系电话', 'varchar(20)', 'String', 'staffPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:51');
INSERT INTO `gen_table_column` VALUES (48, '6', 'reservation_time', '预约时间', 'datetime', 'Date', 'reservationTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:51');
INSERT INTO `gen_table_column` VALUES (49, '6', 'reservation_status', '预约状态1代表已预约，0代表已取消', 'int', 'Long', 'reservationStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2023-04-22 02:30:24', '', '2023-04-23 22:36:51');
INSERT INTO `gen_table_column` VALUES (53, '8', 'drivers_id', '每个司机记录的唯一标识符', 'int unsigned', 'String', 'driversId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:12:01');
INSERT INTO `gen_table_column` VALUES (54, '8', 'drivers_name', '司机姓名', 'varchar(50)', 'String', 'driversName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:12:01');
INSERT INTO `gen_table_column` VALUES (55, '8', 'drivers_phone', '司机联系电话', 'varchar(20)', 'String', 'driversPhone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:12:01');
INSERT INTO `gen_table_column` VALUES (56, '8', 'drivers_supplier', '提供该司机的公司或供应商名称', 'varchar(50)', 'String', 'driversSupplier', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:12:01');
INSERT INTO `gen_table_column` VALUES (57, '9', 'enterprise_id', '每个企业记录的唯一标识符', 'int unsigned', 'String', 'enterpriseId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:13:34');
INSERT INTO `gen_table_column` VALUES (58, '9', 'enterprise_name', '企业名称', 'varchar(50)', 'String', 'enterpriseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:13:34');
INSERT INTO `gen_table_column` VALUES (59, '10', 'leader_id', '车长ID，自增长', 'int unsigned', 'String', 'leaderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:14:05');
INSERT INTO `gen_table_column` VALUES (60, '10', 'leader_name', '车长姓名', 'varchar(50)', 'String', 'leaderName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:14:05');
INSERT INTO `gen_table_column` VALUES (61, '10', 'leader_phone', '联系电话', 'varchar(20)', 'String', 'leaderPhone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:14:05');
INSERT INTO `gen_table_column` VALUES (62, '10', 'leader_enterprise', '所属企业名称', 'varchar(50)', 'String', 'leaderEnterprise', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 14:14:05');
INSERT INTO `gen_table_column` VALUES (63, '11', 'shifts_id', '班次ID，自增长', 'int unsigned', 'String', 'shiftsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (64, '11', 'shifts_name', '班次名称', 'varchar(50)', 'String', 'shiftsName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (65, '11', 'shifts_plate_number', '车牌号码', 'int', 'String', 'shiftsPlateNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (66, '11', 'shifts_driver_name', '司机姓名', 'varchar(50)', 'String', 'shiftsDriverName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (67, '11', 'shifts_driver_phone', '司机联系电话', 'varchar(20)', 'String', 'shiftsDriverPhone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (68, '11', 'shifts_leader_name', '车长姓名', 'varchar(50)', 'String', 'shiftsLeaderName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (69, '11', 'shifts_leader_phone', '车长联系电话', 'varchar(20)', 'String', 'shiftsLeaderPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (70, '11', 'shifts_departure_time', '发车时间', 'datetime', 'Date', 'shiftsDepartureTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:20:01');
INSERT INTO `gen_table_column` VALUES (71, '12', 'vehicles_id', '每个车辆记录的唯一标识符', 'int unsigned', 'String', 'vehiclesId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:05:30');
INSERT INTO `gen_table_column` VALUES (72, '12', 'vehicles_license_plate', '车辆的车牌号码', 'varchar(255)', 'String', 'vehiclesLicensePlate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:05:30');
INSERT INTO `gen_table_column` VALUES (73, '12', 'vehicles_model', '车辆的型号', 'varchar(255)', 'String', 'vehiclesModel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:05:30');
INSERT INTO `gen_table_column` VALUES (74, '12', 'vehicles_capacity', '车辆最多可搭载乘客数', 'int', 'Long', 'vehiclesCapacity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:05:30');
INSERT INTO `gen_table_column` VALUES (75, '12', 'vehicles_supplier', '提供车辆的公司或供应商名称', 'varchar(255)', 'String', 'vehiclesSupplier', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-23 02:13:15', '', '2023-04-23 22:05:30');
INSERT INTO `gen_table_column` VALUES (76, '4', 'passenger_enterprise', '所属企业名称', 'varchar(50)', 'String', 'passengerEnterprise', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2023-04-23 22:14:26', '', '2023-04-23 22:14:42');
INSERT INTO `gen_table_column` VALUES (77, '4', 'passenger_department', '所属部门名称', 'varchar(50)', 'String', 'passengerDepartment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2023-04-23 22:14:26', '', '2023-04-23 22:14:42');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-04-21 20:14:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-04-21 20:14:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-04-21 20:14:24', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-04-21 20:14:24', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-04-21 20:14:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-04-21 20:14:24', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:03', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:03', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-04-21 20:14:04', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 20:14:23', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-04-21 20:14:21', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-04-21 20:14:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-04-21 20:14:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-04-21 20:14:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-21 22:03:44');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-21 22:57:02');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-22 01:50:08');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-22 13:35:31');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-23 01:25:31');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-23 01:40:40');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-23 13:41:28');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-23 21:52:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2091 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-04-21 20:14:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统工具', 0, 2, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-04-21 20:14:06', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (3, '通勤车管理', 0, 3, 'biz', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'job', 'admin', '2023-04-21 22:04:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4, '部门管理', 0, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-04-21 20:14:06', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (5, '车辆管理', 0, 5, 'vehicles', 'vehicles/vehicles/index', NULL, 1, 0, 'C', '0', '0', 'vehicles:vehicles:list', 'vehicles', 'admin', '2023-04-23 02:16:04', 'admin', '2023-04-23 15:02:44', '车辆管理菜单');
INSERT INTO `sys_menu` VALUES (6, '司机管理', 0, 6, 'drivers', 'drivers/drivers/index', NULL, 1, 0, 'C', '0', '0', 'drivers:drivers:list', 'driver', 'admin', '2023-04-23 14:42:54', 'admin', '2023-04-23 15:03:59', '司机管理菜单');
INSERT INTO `sys_menu` VALUES (7, '企业管理', 0, 7, 'enterprise', 'enterprise/enterprise/index', NULL, 1, 0, 'C', '0', '0', 'enterprise:enterprise:list', 'enterprise', 'admin', '2023-04-23 14:44:02', 'admin', '2023-04-23 15:03:40', '企业管理菜单');
INSERT INTO `sys_menu` VALUES (8, '车长管理', 0, 8, 'leader', 'leader/leader/index', NULL, 1, 0, 'C', '0', '0', 'leader:leader:list', 'leader', 'admin', '2023-04-23 14:45:46', 'admin', '2023-04-23 15:03:49', '车长管理菜单');
INSERT INTO `sys_menu` VALUES (9, '乘客管理', 0, 9, 'passenger', 'passenger/passenger/index', NULL, 1, 0, 'C', '0', '0', 'passenger:passenger:list', 'passenger', 'admin', '2023-04-23 14:47:03', 'admin', '2023-04-23 15:03:30', '乘客管理菜单');
INSERT INTO `sys_menu` VALUES (10, '班次管理', 0, 10, 'shifts', 'shifts/shifts/index', NULL, 1, 0, 'C', '0', '0', 'shifts:shifts:list', 'shifts', 'admin', '2023-04-23 14:47:48', 'admin', '2023-04-23 15:04:36', '班次管理菜单');
INSERT INTO `sys_menu` VALUES (11, '预约管理', 0, 11, 'reservation', 'reservation/reservation/index', NULL, 1, 0, 'C', '0', '0', 'reservation:reservation:list', 'reservation', 'admin', '2023-04-23 14:48:43', 'admin', '2023-04-23 15:04:21', '预约管理菜单');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-04-21 20:14:06', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-04-21 20:14:06', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-04-21 20:14:06', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-04-21 20:14:06', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-04-21 20:14:06', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-04-21 20:14:06', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-04-21 20:14:06', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-04-21 20:14:06', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 2, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-04-21 20:14:07', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 2, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-04-21 20:14:07', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 2, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-04-21 20:14:07', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-04-21 20:14:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 4, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 4, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 4, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 4, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-04-21 20:14:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-04-21 20:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-04-21 20:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-04-21 20:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-04-21 20:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-04-21 20:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-04-21 20:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-04-21 20:14:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-04-21 20:14:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-04-21 20:14:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-04-21 20:14:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-04-21 20:14:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-04-21 20:14:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-04-21 20:14:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-04-21 20:14:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-04-21 20:14:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-04-21 20:14:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-04-21 20:14:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-04-21 20:14:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-04-21 20:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-04-21 20:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-04-21 20:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-04-21 20:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-04-21 20:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-04-21 20:14:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '车辆管理查询', 5, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'vehicles:vehicles:query', '#', 'admin', '2023-04-23 02:16:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '车辆管理新增', 5, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'vehicles:vehicles:add', '#', 'admin', '2023-04-23 02:16:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '车辆管理修改', 5, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'vehicles:vehicles:edit', '#', 'admin', '2023-04-23 02:16:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '车辆管理删除', 5, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'vehicles:vehicles:remove', '#', 'admin', '2023-04-23 02:16:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '车辆管理导出', 5, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'vehicles:vehicles:export', '#', 'admin', '2023-04-23 02:16:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '司机管理查询', 6, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drivers:drivers:query', '#', 'admin', '2023-04-23 14:42:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '司机管理新增', 6, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drivers:drivers:add', '#', 'admin', '2023-04-23 14:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '司机管理修改', 6, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drivers:drivers:edit', '#', 'admin', '2023-04-23 14:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '司机管理删除', 6, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drivers:drivers:remove', '#', 'admin', '2023-04-23 14:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '司机管理导出', 6, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drivers:drivers:export', '#', 'admin', '2023-04-23 14:42:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '企业管理查询', 7, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'enterprise:enterprise:query', '#', 'admin', '2023-04-23 14:44:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '企业管理新增', 7, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'enterprise:enterprise:add', '#', 'admin', '2023-04-23 14:44:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '企业管理修改', 7, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'enterprise:enterprise:edit', '#', 'admin', '2023-04-23 14:44:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '企业管理删除', 7, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'enterprise:enterprise:remove', '#', 'admin', '2023-04-23 14:44:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '企业管理导出', 7, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'enterprise:enterprise:export', '#', 'admin', '2023-04-23 14:44:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '车长管理查询', 8, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'leader:leader:query', '#', 'admin', '2023-04-23 14:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '车长管理新增', 8, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'leader:leader:add', '#', 'admin', '2023-04-23 14:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '车长管理修改', 8, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'leader:leader:edit', '#', 'admin', '2023-04-23 14:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '车长管理删除', 8, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'leader:leader:remove', '#', 'admin', '2023-04-23 14:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '车长管理导出', 8, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'leader:leader:export', '#', 'admin', '2023-04-23 14:45:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '乘客管理查询', 9, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'passenger:passenger:query', '#', 'admin', '2023-04-23 14:47:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '乘客管理新增', 9, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'passenger:passenger:add', '#', 'admin', '2023-04-23 14:47:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '乘客管理修改', 9, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'passenger:passenger:edit', '#', 'admin', '2023-04-23 14:47:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '乘客管理删除', 9, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'passenger:passenger:remove', '#', 'admin', '2023-04-23 14:47:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '乘客管理导出', 9, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'passenger:passenger:export', '#', 'admin', '2023-04-23 14:47:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '班次管理查询', 10, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'shifts:shifts:query', '#', 'admin', '2023-04-23 14:47:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '班次管理新增', 10, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'shifts:shifts:add', '#', 'admin', '2023-04-23 14:47:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '班次管理修改', 10, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'shifts:shifts:edit', '#', 'admin', '2023-04-23 14:47:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '班次管理删除', 10, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'shifts:shifts:remove', '#', 'admin', '2023-04-23 14:47:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '班次管理导出', 10, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'shifts:shifts:export', '#', 'admin', '2023-04-23 14:47:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '预约管理查询', 11, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:reservation:query', '#', 'admin', '2023-04-23 14:48:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '预约管理新增', 11, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:reservation:add', '#', 'admin', '2023-04-23 14:48:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '预约管理修改', 11, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:reservation:edit', '#', 'admin', '2023-04-23 14:48:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '预约管理删除', 11, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:reservation:remove', '#', 'admin', '2023-04-23 14:48:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '预约管理导出', 11, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:reservation:export', '#', 'admin', '2023-04-23 14:48:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-04-21 20:14:26', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-04-21 20:14:26', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 20:34:00', 239);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classes\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaFi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 20:35:16', 68);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classes\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 20:35:16\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 20:35:16\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 20:35:16\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 20:35:38', 52);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 20:35:46', 278);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"classes/classes/index\",\"createTime\":\"2023-04-21 20:40:43\",\"icon\":\"icon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"班次管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"classes\",\"perms\":\"classes:classes:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 20:50:23', 102);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通勤车管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"biz\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 22:04:29', 89);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classes\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 20:35:38\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 20:35:38\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 20:35:38\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 22:05:35', 126);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 22:05:40', 244);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classes\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 22:05:35\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 22:05:35\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 22:05:35\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 22:59:23', 118);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 22:59:25', 48);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classess\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 22:59:23\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 22:59:23\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 22:59:23\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 23:00:18', 112);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 23:00:21', 31);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 23:00:28', 30);
INSERT INTO `sys_oper_log` VALUES (113, '班次管理', 1, 'com.ruoyi.biz.classes.controller.TqcglClassesController.add()', 'POST', 1, 'admin', NULL, '/classes/classes', '127.0.0.1', '内网IP', '{\"departure\":\"18:00\",\"driverName\":\"梁国柱\",\"driverPhone\":\"18027844119\",\"licensePlate\":\"粤CTH818\",\"ovnerName\":\"梁国柱\",\"ovnerPhone\":\"18027844119\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'classes_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ZHYGJ\\Desktop\\RuoYi-Vue-master\\biz\\target\\classes\\mapper\\classes\\TqcglClassesMapper.xml]\r\n### The error may involve com.ruoyi.biz.classes.mapper.TqcglClassesMapper.insertTqcglClasses-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tqcgl_classes          ( license_plate,             driver_name,             driver_phone,             ovner_name,             ovner_phone,             departure )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'classes_name\' doesn\'t have a default value\n; Field \'classes_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'classes_name\' doesn\'t have a default value', '2023-04-21 23:17:23', 180);
INSERT INTO `sys_oper_log` VALUES (114, '班次管理', 1, 'com.ruoyi.biz.classes.controller.TqcglClassesController.add()', 'POST', 1, 'admin', NULL, '/classes/classes', '127.0.0.1', '内网IP', '{\"departure\":\"18:00\",\"driverName\":\"梁国柱\",\"driverPhone\":\"18027844119\",\"licensePlate\":\"粤cth818\",\"ovnerName\":\"梁国柱\",\"ovnerPhone\":\"18027844119\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 23:19:44', 62);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classess\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:00:18\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:00:18\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:00:18\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 23:29:08', 123);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 23:29:10', 277);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 23:29:13', 35);
INSERT INTO `sys_oper_log` VALUES (118, '班次管理', 1, 'com.ruoyi.biz.classes.controller.TqcglClassesController.add()', 'POST', 1, 'admin', NULL, '/classes/classes', '127.0.0.1', '内网IP', '{\"departure\":\"1\",\"driverName\":\"1\",\"driverPhone\":\"18027844119\",\"licensePlate\":\"1\",\"ovnerName\":\"1\",\"ovnerPhone\":\"18027844119\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 23:46:28', 98);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classes\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:29:08\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:29:08\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:29:08\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 23:47:35', 89);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-21 23:47:37', 38);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classes\",\"className\":\"TqcglClasses\",\"columns\":[{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":1,\"columnName\":\"classes_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:47:35\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":2,\"columnName\":\"license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:47:35\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":3,\"columnName\":\"driver_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-04-21 23:47:35\",\"usableColumn\":false},{\"capJavaField\":\"DriverPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":4,\"columnName\":\"driver_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 20:34:00\",\"dictType\":\"\",\"edit\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 00:25:26', 142);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_classes\"}', NULL, 0, NULL, '2023-04-22 00:25:28', 257);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_owner\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 01:53:16', 175);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"owner\",\"className\":\"TqcglOwner\",\"columns\":[{\"capJavaField\":\"OwnerId\",\"columnComment\":\"id\",\"columnId\":8,\"columnName\":\"owner_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 01:53:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"javaField\":\"ownerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerName\",\"columnComment\":\"车长姓名\",\"columnId\":9,\"columnName\":\"owner_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 01:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerPhone\",\"columnComment\":\"车长电话\",\"columnId\":10,\"columnName\":\"owner_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 01:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerCompany\",\"columnComment\":\"车长所属公司\",\"columnId\":11,\"columnName\":\"owner_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 01:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 01:54:42', 116);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_owner\"}', NULL, 0, NULL, '2023-04-22 01:54:46', 406);
INSERT INTO `sys_oper_log` VALUES (126, '车长管理', 1, 'com.ruoyi.biz.owner.controller.TqcglOwnerController.add()', 'POST', 1, 'admin', NULL, '/owner/owner', '127.0.0.1', '内网IP', '{\"ownerCompany\":\"广东\",\"ownerName\":\"admin\",\"ownerPhone\":\"18027844119\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ZHYGJ\\Desktop\\RuoYi-Vue-master\\biz\\target\\classes\\mapper\\owner\\TqcglOwnerMapper.xml]\r\n### The error may involve com.ruoyi.biz.owner.mapper.TqcglOwnerMapper.insertTqcglOwner-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tqcgl_owner          ( owner_name,             owner_phone,             owner_company )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\n; Field \'owner_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value', '2023-04-22 02:02:09', 272);
INSERT INTO `sys_oper_log` VALUES (127, '车长管理', 1, 'com.ruoyi.biz.owner.controller.TqcglOwnerController.add()', 'POST', 1, 'admin', NULL, '/owner/owner', '127.0.0.1', '内网IP', '{\"ownerCompany\":\"广东\",\"ownerName\":\"admin\",\"ownerPhone\":\"18027844119\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ZHYGJ\\Desktop\\RuoYi-Vue-master\\biz\\target\\classes\\mapper\\owner\\TqcglOwnerMapper.xml]\r\n### The error may involve com.ruoyi.biz.owner.mapper.TqcglOwnerMapper.insertTqcglOwner-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tqcgl_owner          ( owner_name,             owner_phone,             owner_company )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\n; Field \'owner_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value', '2023-04-22 02:02:47', 7);
INSERT INTO `sys_oper_log` VALUES (128, '车长管理', 1, 'com.ruoyi.biz.owner.controller.TqcglOwnerController.add()', 'POST', 1, 'admin', NULL, '/owner/owner', '127.0.0.1', '内网IP', '{\"ownerCompany\":\"广东\",\"ownerName\":\"admin\",\"ownerPhone\":\"18027844119\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ZHYGJ\\Desktop\\RuoYi-Vue-master\\biz\\target\\classes\\mapper\\owner\\TqcglOwnerMapper.xml]\r\n### The error may involve com.ruoyi.biz.owner.mapper.TqcglOwnerMapper.insertTqcglOwner-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tqcgl_owner          ( owner_name,             owner_phone,             owner_company )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\n; Field \'owner_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value', '2023-04-22 02:03:27', 205);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:03:59', 125);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_owner\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:04:03', 268);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_owner\"}', NULL, 0, NULL, '2023-04-22 02:04:06', 344);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"owner\",\"className\":\"TqcglOwner\",\"columns\":[{\"capJavaField\":\"OwnerId\",\"columnComment\":\"id\",\"columnId\":12,\"columnName\":\"owner_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerName\",\"columnComment\":\"车长名\",\"columnId\":13,\"columnName\":\"owner_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerPhone\",\"columnComment\":\"车长电话\",\"columnId\":14,\"columnName\":\"owner_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OwnerCompany\",\"columnComment\":\"车长所属公司\",\"columnId\":15,\"columnName\":\"owner_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:07:25', 119);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"owner\",\"className\":\"TqcglOwner\",\"columns\":[{\"capJavaField\":\"OwnerId\",\"columnComment\":\"id\",\"columnId\":12,\"columnName\":\"owner_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"ownerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:07:25\",\"usableColumn\":false},{\"capJavaField\":\"OwnerName\",\"columnComment\":\"车长名\",\"columnId\":13,\"columnName\":\"owner_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:07:25\",\"usableColumn\":false},{\"capJavaField\":\"OwnerPhone\",\"columnComment\":\"车长电话\",\"columnId\":14,\"columnName\":\"owner_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ownerPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:07:25\",\"usableColumn\":false},{\"capJavaField\":\"OwnerCompany\",\"columnComment\":\"车长所属公司\",\"columnId\":15,\"columnName\":\"owner_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:04:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:07:37', 86);
INSERT INTO `sys_oper_log` VALUES (134, '车长管理', 1, 'com.ruoyi.biz.owner.controller.TqcglOwnerController.add()', 'POST', 1, 'admin', NULL, '/owner/owner', '127.0.0.1', '内网IP', '{\"ownerCompany\":\"广东\",\"ownerName\":\"admin\",\"ownerPhone\":\"18027844119\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ZHYGJ\\Desktop\\RuoYi-Vue-master\\biz\\target\\classes\\mapper\\owner\\TqcglOwnerMapper.xml]\r\n### The error may involve com.ruoyi.biz.owner.mapper.TqcglOwnerMapper.insertTqcglOwner-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tqcgl_owner          ( owner_name,             owner_phone,             owner_company )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\n; Field \'owner_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value', '2023-04-22 02:13:53', 214);
INSERT INTO `sys_oper_log` VALUES (135, '车长管理', 1, 'com.ruoyi.biz.owner.controller.TqcglOwnerController.add()', 'POST', 1, 'admin', NULL, '/owner/owner', '127.0.0.1', '内网IP', '{\"ownerCompany\":\"广东\",\"ownerName\":\"admin\",\"ownerPhone\":\"18027844119\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\ZHYGJ\\Desktop\\RuoYi-Vue-master\\biz\\target\\classes\\mapper\\owner\\TqcglOwnerMapper.xml]\r\n### The error may involve com.ruoyi.biz.owner.mapper.TqcglOwnerMapper.insertTqcglOwner-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tqcgl_owner          ( owner_name,             owner_phone,             owner_company )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\n; Field \'owner_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value', '2023-04-22 02:13:57', 7);
INSERT INTO `sys_oper_log` VALUES (136, '车长管理', 1, 'com.ruoyi.biz.owner.controller.TqcglOwnerController.add()', 'POST', 1, 'admin', NULL, '/owner/owner', '127.0.0.1', '内网IP', '{\"ownerCompany\":\"广东\",\"ownerName\":\"admin\",\"ownerPhone\":\"18027844119\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:15:21', 116);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_passenger\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:17:20', 142);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"passenger\",\"className\":\"TqcglPassenger\",\"columns\":[{\"capJavaField\":\"PassengerId\",\"columnComment\":\"乘客id\",\"columnId\":16,\"columnName\":\"passenger_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"passengerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PassengerName\",\"columnComment\":\"乘客名\",\"columnId\":17,\"columnName\":\"passenger_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PassengerCompany\",\"columnComment\":\"乘客所属公司\",\"columnId\":18,\"columnName\":\"passenger_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerCompany\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PassengerDepart\",\"columnComment\":\"乘客所属部门\",\"columnId\":19,\"columnName\":\"passenger_depart\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:17:57', 98);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"passenger\",\"className\":\"TqcglPassenger\",\"columns\":[{\"capJavaField\":\"PassengerId\",\"columnComment\":\"乘客id\",\"columnId\":16,\"columnName\":\"passenger_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"passengerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:17:57\",\"usableColumn\":false},{\"capJavaField\":\"PassengerName\",\"columnComment\":\"乘客名\",\"columnId\":17,\"columnName\":\"passenger_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:17:57\",\"usableColumn\":false},{\"capJavaField\":\"PassengerCompany\",\"columnComment\":\"乘客所属公司\",\"columnId\":18,\"columnName\":\"passenger_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerCompany\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:17:57\",\"usableColumn\":false},{\"capJavaField\":\"PassengerDepart\",\"columnComment\":\"乘客所属部门\",\"columnId\":19,\"columnName\":\"passenger_depart\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:18:28', 77);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"passenger\",\"className\":\"TqcglPassenger\",\"columns\":[{\"capJavaField\":\"PassengerId\",\"columnComment\":\"乘客id\",\"columnId\":16,\"columnName\":\"passenger_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"passengerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:18:28\",\"usableColumn\":false},{\"capJavaField\":\"PassengerName\",\"columnComment\":\"乘客名\",\"columnId\":17,\"columnName\":\"passenger_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:18:28\",\"usableColumn\":false},{\"capJavaField\":\"PassengerCompany\",\"columnComment\":\"乘客所属公司\",\"columnId\":18,\"columnName\":\"passenger_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerCompany\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:18:28\",\"usableColumn\":false},{\"capJavaField\":\"PassengerDepart\",\"columnComment\":\"乘客所属部门\",\"columnId\":19,\"columnName\":\"passenger_depart\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:18:36', 60);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_passenger\"}', NULL, 0, NULL, '2023-04-22 02:18:40', 120);
INSERT INTO `sys_oper_log` VALUES (142, '乘客管理', 1, 'com.ruoyi.biz.passenger.controller.TqcglPassengerController.add()', 'POST', 1, 'admin', NULL, '/passenger/passenger', '127.0.0.1', '内网IP', '{\"params\":{},\"passengerCompany\":\"广东\",\"passengerDepart\":\"竞赛\",\"passengerId\":1,\"passengerName\":\"admin\",\"passengerPhone\":\"18027844119\",\"passengerPhoto\":\"null\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:22:35', 217);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:24:42', 342);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"预约管理\",\"columns\":[{\"capJavaField\":\"ReservationId\",\"columnComment\":\"id\",\"columnId\":22,\"columnName\":\"reservation_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:24:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"reservationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":23,\"columnName\":\"classes_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:24:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":24,\"columnName\":\"license_plate\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:24:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":25,\"columnName\":\"driver_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:24:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"driverNa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:25:48', 116);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"预约管理\"}', NULL, 0, NULL, '2023-04-22 02:25:53', 379);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:30:17', 137);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:30:24', 127);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"TqcglReservation\",\"columns\":[{\"capJavaField\":\"ReservationId\",\"columnComment\":\"预约单号\",\"columnId\":36,\"columnName\":\"reservation_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"reservationId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":37,\"columnName\":\"classes_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":38,\"columnName\":\"license_plate\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":39,\"columnName\":\"driver_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:31:16', 92);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"TqcglReservation\",\"columns\":[{\"capJavaField\":\"ReservationId\",\"columnComment\":\"预约单号\",\"columnId\":36,\"columnName\":\"reservation_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"reservationId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:31:16\",\"usableColumn\":false},{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":37,\"columnName\":\"classes_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:31:16\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":38,\"columnName\":\"license_plate\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:31:16\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":39,\"columnName\":\"driver_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:31:27', 90);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', NULL, 0, NULL, '2023-04-22 02:32:28', 143);
INSERT INTO `sys_oper_log` VALUES (151, '预约管理', 1, 'com.ruoyi.biz.reservation.controller.TqcglReservationController.add()', 'POST', 1, 'admin', NULL, '/reservation/reservation', '127.0.0.1', '内网IP', '{\"classesName\":\"1\",\"departureTime\":\"2023-04-04\",\"driverName\":\"1\",\"driverPhone\":\"18027844119\",\"licensePlate\":\"1\",\"overName\":\"1\",\"overPhone\":\"1\",\"params\":{},\"reservationId\":1,\"reservationTime\":\"2023-04-04\",\"staffCompany\":\"1\",\"staffDepart\":\"1\",\"staffName\":\"1\",\"staffPhone\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 02:40:34', 260);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/114', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-04-23 01:42:09', 96);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_shifts,tqcgl_leader,tqcgl_enterprise,tqcgl_drivers,tqcgl_vehicles,tqcgl_department\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:13:15', 451);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"vehicles\",\"className\":\"TqcglVehicles\",\"columns\":[{\"capJavaField\":\"VehiclesId\",\"columnComment\":\"每个车辆记录的唯一标识符\",\"columnId\":71,\"columnName\":\"vehicles_id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"vehiclesId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VehiclesLicensePlate\",\"columnComment\":\"车辆的车牌号码\",\"columnId\":72,\"columnName\":\"vehicles_license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vehiclesLicensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VehiclesModel\",\"columnComment\":\"车辆的型号\",\"columnId\":73,\"columnName\":\"vehicles_model\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vehiclesModel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VehiclesCapacity\",\"columnComment\":\"车辆最多可搭载乘客数\",\"columnId\":74,\"columnName\":\"vehicles_capacity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:14:40', 178);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_vehicles\"}', NULL, 0, NULL, '2023-04-23 02:14:58', 274);
INSERT INTO `sys_oper_log` VALUES (156, '车辆管理', 1, 'com.ruoyi.biz.vehicles.controller.TqcglVehiclesController.add()', 'POST', 1, 'admin', NULL, '/vehicles/vehicles', '127.0.0.1', '内网IP', '{\"params\":{},\"vehiclesCapacity\":10,\"vehiclesId\":\"1\",\"vehiclesLicensePlate\":\"粤Ct1234\",\"vehiclesModel\":\"null\",\"vehiclesSupplier\":\"广东\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:25:58', 190);
INSERT INTO `sys_oper_log` VALUES (157, '车辆管理', 3, 'com.ruoyi.biz.vehicles.controller.TqcglVehiclesController.remove()', 'DELETE', 1, 'admin', NULL, '/vehicles/vehicles/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:26:09', 115);
INSERT INTO `sys_oper_log` VALUES (158, '车辆管理', 1, 'com.ruoyi.biz.vehicles.controller.TqcglVehiclesController.add()', 'POST', 1, 'admin', NULL, '/vehicles/vehicles', '127.0.0.1', '内网IP', '{\"params\":{},\"vehiclesId\":\"2\",\"vehiclesLicensePlate\":\"qwe\",\"vehiclesModel\":\"1\",\"vehiclesSupplier\":\"广东\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:28:14', 66);
INSERT INTO `sys_oper_log` VALUES (159, '车辆管理', 3, 'com.ruoyi.biz.vehicles.controller.TqcglVehiclesController.remove()', 'DELETE', 1, 'admin', NULL, '/vehicles/vehicles/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:28:21', 68);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1046', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-04-23 02:29:20', 11);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1047', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-04-23 02:30:16', 8);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1054', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-04-23 02:31:44', 11);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1050', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-04-23 02:37:31', 7);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"vehicles/vehicles/index\",\"createTime\":\"2023-04-23 02:16:04\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"车辆管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"vehicles\",\"perms\":\"vehicles:vehicles:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 02:42:57', 81);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:08:54', 150);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:09:53', 184);
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:09:55', 63);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"drivers\",\"className\":\"TqcglDrivers\",\"columns\":[{\"capJavaField\":\"DriversId\",\"columnComment\":\"每个司机记录的唯一标识符\",\"columnId\":53,\"columnName\":\"drivers_id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"driversId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriversName\",\"columnComment\":\"司机姓名\",\"columnId\":54,\"columnName\":\"drivers_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"driversName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriversPhone\",\"columnComment\":\"司机联系电话\",\"columnId\":55,\"columnName\":\"drivers_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"driversPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriversSupplier\",\"columnComment\":\"提供该司机的公司或供应商名称\",\"columnId\":56,\"columnName\":\"drivers_supplier\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:12:01', 94);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"shifts\",\"className\":\"TqcglShifts\",\"columns\":[{\"capJavaField\":\"ShiftsId\",\"columnComment\":\"班次ID，自增长\",\"columnId\":63,\"columnName\":\"shifts_id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"shiftsId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShiftsName\",\"columnComment\":\"班次名称\",\"columnId\":64,\"columnName\":\"shifts_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shiftsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShiftsPlateNumber\",\"columnComment\":\"车牌号码\",\"columnId\":65,\"columnName\":\"shifts_plate_number\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"shiftsPlateNumber\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ShiftsDriverName\",\"columnComment\":\"司机姓名\",\"columnId\":66,\"columnName\":\"shifts_driver_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:12:52', 88);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"enterprise\",\"className\":\"TqcglEnterprise\",\"columns\":[{\"capJavaField\":\"EnterpriseId\",\"columnComment\":\"每个企业记录的唯一标识符\",\"columnId\":57,\"columnName\":\"enterprise_id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"enterpriseId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnterpriseName\",\"columnComment\":\"企业名称\",\"columnId\":58,\"columnName\":\"enterprise_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"enterpriseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"zhu\",\"functionName\":\"企业管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"enterprise\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.biz\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":false,\"tableComment\":\"企业管理\",\"tableId\":9,\"tableName\":\"tqcgl_enterprise\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:13:34', 78);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"leader\",\"className\":\"TqcglLeader\",\"columns\":[{\"capJavaField\":\"LeaderId\",\"columnComment\":\"车长ID，自增长\",\"columnId\":59,\"columnName\":\"leader_id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"leaderId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeaderName\",\"columnComment\":\"车长姓名\",\"columnId\":60,\"columnName\":\"leader_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"leaderName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeaderPhone\",\"columnComment\":\"联系电话\",\"columnId\":61,\"columnName\":\"leader_phone\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"leaderPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeaderEnterprise\",\"columnComment\":\"所属企业名称\",\"columnId\":62,\"columnName\":\"leader_enterprise\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:14:05', 102);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_vehicles\"}', NULL, 0, NULL, '2023-04-23 14:14:34', 328);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_drivers\"}', NULL, 0, NULL, '2023-04-23 14:18:08', 48);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_enterprise\"}', NULL, 0, NULL, '2023-04-23 14:23:04', 24);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_leader\"}', NULL, 0, NULL, '2023-04-23 14:26:45', 28);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"passenger\",\"className\":\"TqcglPassenger\",\"columns\":[{\"capJavaField\":\"PassengerId\",\"columnComment\":\"乘客id\",\"columnId\":16,\"columnName\":\"passenger_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"passengerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:18:36\",\"usableColumn\":false},{\"capJavaField\":\"PassengerName\",\"columnComment\":\"乘客名\",\"columnId\":17,\"columnName\":\"passenger_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:18:36\",\"usableColumn\":false},{\"capJavaField\":\"PassengerCompany\",\"columnComment\":\"乘客所属公司\",\"columnId\":18,\"columnName\":\"passenger_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerCompany\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:18:36\",\"usableColumn\":false},{\"capJavaField\":\"PassengerDepart\",\"columnComment\":\"乘客所属部门\",\"columnId\":19,\"columnName\":\"passenger_depart\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:31:01', 103);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_passenger\"}', NULL, 0, NULL, '2023-04-23 14:31:04', 50);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_shifts\"}', NULL, 0, NULL, '2023-04-23 14:33:29', 38);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_shifts\"}', NULL, 0, NULL, '2023-04-23 14:33:49', 40);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"TqcglReservation\",\"columns\":[{\"capJavaField\":\"ReservationId\",\"columnComment\":\"预约单号\",\"columnId\":36,\"columnName\":\"reservation_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"reservationId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:31:27\",\"usableColumn\":false},{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":37,\"columnName\":\"classes_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:31:27\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":38,\"columnName\":\"license_plate\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-22 02:31:27\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":39,\"columnName\":\"driver_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 14:36:17', 116);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', NULL, 0, NULL, '2023-04-23 14:36:54', 43);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', NULL, 0, NULL, '2023-04-23 14:37:03', 45);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"vehicles/vehicles/index\",\"createTime\":\"2023-04-23 02:16:04\",\"icon\":\"vehicles\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"车辆管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"vehicles\",\"perms\":\"vehicles:vehicles:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:02:44', 95);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"passenger/passenger/index\",\"createTime\":\"2023-04-23 14:47:03\",\"icon\":\"passenger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":9,\"menuName\":\"乘客管理\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"passenger\",\"perms\":\"passenger:passenger:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:03:30', 68);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"enterprise/enterprise/index\",\"createTime\":\"2023-04-23 14:44:02\",\"icon\":\"enterprise\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":7,\"menuName\":\"企业管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"enterprise\",\"perms\":\"enterprise:enterprise:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:03:40', 68);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"leader/leader/index\",\"createTime\":\"2023-04-23 14:45:46\",\"icon\":\"leader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":8,\"menuName\":\"车长管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"leader\",\"perms\":\"leader:leader:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:03:49', 74);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"drivers/drivers/index\",\"createTime\":\"2023-04-23 14:42:54\",\"icon\":\"driver\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":6,\"menuName\":\"司机管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"drivers\",\"perms\":\"drivers:drivers:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:03:59', 66);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"reservation/reservation/index\",\"createTime\":\"2023-04-23 14:48:43\",\"icon\":\"reservation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":11,\"menuName\":\"预约管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"reservation\",\"perms\":\"reservation:reservation:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:04:21', 65);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shifts/shifts/index\",\"createTime\":\"2023-04-23 14:47:48\",\"icon\":\"shifts\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":10,\"menuName\":\"班次管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"shifts\",\"perms\":\"shifts:shifts:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 15:04:36', 65);
INSERT INTO `sys_oper_log` VALUES (190, '司机管理', 1, 'com.ruoyi.biz.controller.TqcglDriversController.add()', 'POST', 1, 'admin', NULL, '/drivers/drivers', '127.0.0.1', '内网IP', '{\"driversId\":\"1\",\"driversName\":\"lgz\",\"driversPhone\":\"18027844119\",\"driversSupplier\":\"广东\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 21:53:36', 154);
INSERT INTO `sys_oper_log` VALUES (191, '企业管理', 1, 'com.ruoyi.biz.controller.TqcglEnterpriseController.add()', 'POST', 1, 'admin', NULL, '/enterprise/enterprise', '127.0.0.1', '内网IP', '{\"enterpriseId\":\"3\",\"enterpriseName\":\"广东\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 21:53:49', 70);
INSERT INTO `sys_oper_log` VALUES (192, '车长管理', 1, 'com.ruoyi.biz.controller.TqcglLeaderController.add()', 'POST', 1, 'admin', NULL, '/leader/leader', '127.0.0.1', '内网IP', '{\"leaderEnterprise\":\"广东\",\"leaderId\":\"1\",\"leaderName\":\"zhu\",\"leaderPhone\":\"18027844119\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 21:54:06', 67);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_vehicles\"}', NULL, 0, NULL, '2023-04-23 22:05:04', 1691);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"vehicles\",\"className\":\"TqcglVehicles\",\"columns\":[{\"capJavaField\":\"VehiclesId\",\"columnComment\":\"每个车辆记录的唯一标识符\",\"columnId\":71,\"columnName\":\"vehicles_id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"vehiclesId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 02:14:40\",\"usableColumn\":false},{\"capJavaField\":\"VehiclesLicensePlate\",\"columnComment\":\"车辆的车牌号码\",\"columnId\":72,\"columnName\":\"vehicles_license_plate\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vehiclesLicensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 02:14:40\",\"usableColumn\":false},{\"capJavaField\":\"VehiclesModel\",\"columnComment\":\"车辆的型号\",\"columnId\":73,\"columnName\":\"vehicles_model\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vehiclesModel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 02:14:40\",\"usableColumn\":false},{\"capJavaField\":\"VehiclesCapacity\",\"columnComment\":\"车辆最多可搭载乘客数\",\"columnId\":74,\"columnName\":\"vehicles_capacity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-23 02:13:', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:05:30', 435);
INSERT INTO `sys_oper_log` VALUES (195, '车辆管理', 1, 'com.ruoyi.biz.controller.TqcglVehiclesController.add()', 'POST', 1, 'admin', NULL, '/vehicles/vehicles', '127.0.0.1', '内网IP', '{\"params\":{},\"vehiclesCapacity\":12,\"vehiclesId\":\"3\",\"vehiclesLicensePlate\":\"c\",\"vehiclesModel\":\"123\",\"vehiclesSupplier\":\"广东\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:09:03', 248);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"passenger\",\"className\":\"TqcglPassenger\",\"columns\":[{\"capJavaField\":\"PassengerId\",\"columnComment\":\"乘客id\",\"columnId\":16,\"columnName\":\"passenger_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"passengerId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 14:31:01\",\"usableColumn\":false},{\"capJavaField\":\"PassengerName\",\"columnComment\":\"乘客名\",\"columnId\":17,\"columnName\":\"passenger_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 14:31:01\",\"usableColumn\":false},{\"capJavaField\":\"PassengerCompany\",\"columnComment\":\"乘客所属公司\",\"columnId\":18,\"columnName\":\"passenger_company\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerCompany\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 14:31:01\",\"usableColumn\":false},{\"capJavaField\":\"PassengerDepart\",\"columnComment\":\"乘客所属部门\",\"columnId\":19,\"columnName\":\"passenger_depart\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:10:23', 211);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tqcgl_passenger', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:14:26', 854);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_passenger\"}', NULL, 0, NULL, '2023-04-23 22:14:27', 482);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"passenger\",\"className\":\"TqcglPassenger\",\"columns\":[{\"capJavaField\":\"PassengerId\",\"columnComment\":\"乘客ID，自增长\",\"columnId\":16,\"columnName\":\"passenger_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"passengerId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 22:14:26\",\"usableColumn\":false},{\"capJavaField\":\"PassengerName\",\"columnComment\":\"乘客姓名\",\"columnId\":17,\"columnName\":\"passenger_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:17:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"passengerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 22:14:26\",\"usableColumn\":false},{\"capJavaField\":\"PassengerEnterprise\",\"columnComment\":\"所属企业名称\",\"columnId\":76,\"columnName\":\"passenger_enterprise\",\"columnType\":\"varchar(50)\",\"createBy\":\"\",\"createTime\":\"2023-04-23 22:14:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"passengerEnterprise\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PassengerDepartment\",\"columnComment\":\"所属部门名称\",\"columnId\":77,\"columnName\":\"passenger_department\",\"columnType\":\"varchar(50)\",\"createBy\":\"\",\"createTime\":\"2023-04-23 22:14:26\",\"dictType\":\"\",\"edit\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:14:43', 161);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tqcgl_shifts', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:20:02', 309);
INSERT INTO `sys_oper_log` VALUES (201, '班次管理', 1, 'com.ruoyi.biz.controller.TqcglShiftsController.add()', 'POST', 1, 'admin', NULL, '/shifts/shifts', '127.0.0.1', '内网IP', '{\"params\":{},\"shiftsDepartureTime\":\"2023-04-23\",\"shiftsDriverName\":\"zhu\",\"shiftsDriverPhone\":\"18027844119\",\"shiftsId\":\"1\",\"shiftsLeaderName\":\"zhu\",\"shiftsLeaderPhone\":\"18027844119\",\"shiftsName\":\"2\",\"shiftsPlateNumber\":\"zhu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:25:51', 564);
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tqcgl_reservation', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:36:39', 399);
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"TqcglReservation\",\"columns\":[{\"capJavaField\":\"ReservationId\",\"columnComment\":\"\",\"columnId\":36,\"columnName\":\"reservation_id\",\"columnType\":\"int(10) unsigned zerofill\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"reservationId\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 22:36:39\",\"usableColumn\":false},{\"capJavaField\":\"ClassesName\",\"columnComment\":\"班次名称\",\"columnId\":37,\"columnName\":\"classes_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"classesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 22:36:39\",\"usableColumn\":false},{\"capJavaField\":\"LicensePlate\",\"columnComment\":\"车牌\",\"columnId\":38,\"columnName\":\"license_plate\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"licensePlate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-04-23 22:36:39\",\"usableColumn\":false},{\"capJavaField\":\"DriverName\",\"columnComment\":\"司机姓名\",\"columnId\":39,\"columnName\":\"driver_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-22 02:30:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"inpu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:36:51', 310);
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', NULL, 0, NULL, '2023-04-23 22:36:54', 178);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tqcgl_reservation\"}', NULL, 0, NULL, '2023-04-23 22:40:21', 78);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-04-21 20:14:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-04-21 20:14:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-04-21 20:14:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-04-21 20:14:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-04-21 20:14:05', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-04-21 20:14:05', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (0, 100);
INSERT INTO `sys_role_dept` VALUES (0, 101);
INSERT INTO `sys_role_dept` VALUES (0, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-23 21:52:47', 'admin', '2023-04-21 20:14:04', '', '2023-04-23 21:52:46', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-21 20:14:04', 'admin', '2023-04-21 20:14:04', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tqcgl_classes
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_classes`;
CREATE TABLE `tqcgl_classes`  (
  `classes_id` int NOT NULL AUTO_INCREMENT,
  `classes_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班次名称',
  `license_plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌',
  `driver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `driver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '司机联系电话',
  `ovner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车长姓名',
  `ovner_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车长联系电话',
  `departure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发车时间',
  PRIMARY KEY (`classes_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_classes
-- ----------------------------
INSERT INTO `tqcgl_classes` VALUES (1, NULL, '粤cth818', '梁国柱', '18027844119', '梁国柱', '18027844119', '18:00');
INSERT INTO `tqcgl_classes` VALUES (2, NULL, '1', '1', '18027844119', '1', '18027844119', '1');

-- ----------------------------
-- Table structure for tqcgl_department
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_department`;
CREATE TABLE `tqcgl_department`  (
  `department_id` int NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `department_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '部门名称',
  `enterprise_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '所属企业',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tqcgl_department
-- ----------------------------
INSERT INTO `tqcgl_department` VALUES (2, '13', '12');
INSERT INTO `tqcgl_department` VALUES (3, '12321', '213213');

-- ----------------------------
-- Table structure for tqcgl_drivers
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_drivers`;
CREATE TABLE `tqcgl_drivers`  (
  `drivers_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '每个司机记录的唯一标识符',
  `drivers_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '司机姓名',
  `drivers_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '司机联系电话',
  `drivers_supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提供该司机的公司或供应商名称',
  PRIMARY KEY (`drivers_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_drivers
-- ----------------------------
INSERT INTO `tqcgl_drivers` VALUES (1, 'lgz', '18027844119', '广东');

-- ----------------------------
-- Table structure for tqcgl_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_enterprise`;
CREATE TABLE `tqcgl_enterprise`  (
  `enterprise_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '每个企业记录的唯一标识符',
  `enterprise_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '企业名称',
  PRIMARY KEY (`enterprise_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tqcgl_enterprise
-- ----------------------------
INSERT INTO `tqcgl_enterprise` VALUES (2, '华为');
INSERT INTO `tqcgl_enterprise` VALUES (3, '广东');

-- ----------------------------
-- Table structure for tqcgl_leader
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_leader`;
CREATE TABLE `tqcgl_leader`  (
  `leader_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '车长ID，自增长',
  `leader_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车长姓名',
  `leader_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `leader_enterprise` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属企业名称',
  PRIMARY KEY (`leader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_leader
-- ----------------------------
INSERT INTO `tqcgl_leader` VALUES (1, 'zhu', '18027844119', '广东');

-- ----------------------------
-- Table structure for tqcgl_passenger
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_passenger`;
CREATE TABLE `tqcgl_passenger`  (
  `passenger_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '乘客ID，自增长',
  `passenger_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客姓名',
  `passenger_enterprise` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属企业名称',
  `passenger_department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门名称',
  `passenger_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `passenger_photo` blob NULL COMMENT '乘客照片',
  PRIMARY KEY (`passenger_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_passenger
-- ----------------------------
INSERT INTO `tqcgl_passenger` VALUES (1, 'admin', '广东', '竞赛', '18027844119', 0x6E756C6C);

-- ----------------------------
-- Table structure for tqcgl_reservation
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_reservation`;
CREATE TABLE `tqcgl_reservation`  (
  `reservation_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `classes_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班次名称',
  `license_plate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌',
  `driver_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `driver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '司机联系电话',
  `over_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车长姓名',
  `over_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车长联系电话',
  `departure_time` datetime NULL DEFAULT NULL COMMENT '发车时间',
  `staff_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `staff_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工所属公司',
  `staff_depart` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工所属部门',
  `staff_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工联系电话',
  `reservation_time` datetime NULL DEFAULT NULL COMMENT '预约时间',
  `reservation_status` int NULL DEFAULT NULL COMMENT '预约状态1代表已预约，0代表已取消',
  PRIMARY KEY (`reservation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_reservation
-- ----------------------------
INSERT INTO `tqcgl_reservation` VALUES (0000000001, '1', '1', '1', '18027844119', '1', '1', '2023-04-04 00:00:00', '1', '1', '1', '1', '2023-04-04 00:00:00', NULL);

-- ----------------------------
-- Table structure for tqcgl_shifts
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_shifts`;
CREATE TABLE `tqcgl_shifts`  (
  `shifts_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '班次ID，自增长',
  `shifts_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班次名称',
  `shifts_plate_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号码',
  `shifts_driver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '司机姓名',
  `shifts_driver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '司机联系电话',
  `shifts_leader_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车长姓名',
  `shifts_leader_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车长联系电话',
  `shifts_departure_time` datetime NOT NULL COMMENT '发车时间',
  PRIMARY KEY (`shifts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_shifts
-- ----------------------------
INSERT INTO `tqcgl_shifts` VALUES (1, '2', 'zhu', 'zhu', '18027844119', 'zhu', '18027844119', '2023-04-23 00:00:00');

-- ----------------------------
-- Table structure for tqcgl_vehicles
-- ----------------------------
DROP TABLE IF EXISTS `tqcgl_vehicles`;
CREATE TABLE `tqcgl_vehicles`  (
  `vehicles_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '每个车辆记录的唯一标识符',
  `vehicles_license_plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆的车牌号码',
  `vehicles_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆的型号',
  `vehicles_capacity` int NULL DEFAULT NULL COMMENT '车辆最多可搭载乘客数',
  `vehicles_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提供车辆的公司或供应商名称',
  PRIMARY KEY (`vehicles_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tqcgl_vehicles
-- ----------------------------
INSERT INTO `tqcgl_vehicles` VALUES (3, 'c', '123', 12, '广东');

SET FOREIGN_KEY_CHECKS = 1;
