/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 127.0.0.1:3306
 Source Schema         : davinci

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 22/01/2020 14:34:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cron_job
-- ----------------------------
DROP TABLE IF EXISTS `cron_job`;
CREATE TABLE `cron_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `job_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron_expression` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime(0) NOT NULL,
  `end_date` datetime(0) NOT NULL,
  `config` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `exec_log` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `full_parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_folder` tinyint(1) NULL DEFAULT NULL,
  `index` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `dashboard_portal_id` bigint(20) NOT NULL COMMENT 'portal id',
  `type` smallint(1) NOT NULL COMMENT '是文件夹还是看板 文件夹 0  看板 1',
  `index` int(4) NOT NULL COMMENT '顺序',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属文件夹id',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有图标配置json',
  `full_parent_Id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全部上级id',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dashboard_id`(`dashboard_portal_id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '看板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard
-- ----------------------------
INSERT INTO `dashboard` VALUES (1, '软件评测', 1, 0, 0, 0, NULL, NULL, 1, '2020-01-22 12:00:11', NULL, NULL);
INSERT INTO `dashboard` VALUES (2, 'xunxiao-dev', 1, 1, 0, 1, NULL, '1', 1, '2020-01-22 12:00:50', NULL, NULL);

-- ----------------------------
-- Table structure for dashboard_portal
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_portal`;
CREATE TABLE `dashboard_portal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图地址',
  `publish` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发布 发布 1 编辑 0',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '看板门户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard_portal
-- ----------------------------
INSERT INTO `dashboard_portal` VALUES (1, '软件评测', '', 1, '1', 0, 1, '2020-01-22 11:58:34', 1, '2020-01-22 11:59:12');

-- ----------------------------
-- Table structure for davinci_statistic_duration
-- ----------------------------
DROP TABLE IF EXISTS `davinci_statistic_duration`;
CREATE TABLE `davinci_statistic_duration`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计持续时间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of davinci_statistic_duration
-- ----------------------------
INSERT INTO `davinci_statistic_duration` VALUES (1, 1, 'abc@qq.com', '2020-01-22 12:00:50', '2020-01-22 12:01:30');
INSERT INTO `davinci_statistic_duration` VALUES (2, 1, 'abc@qq.com', '2020-01-22 12:01:39', '2020-01-22 12:01:40');
INSERT INTO `davinci_statistic_duration` VALUES (3, 1, 'abc@qq.com', '2020-01-22 12:01:39', '2020-01-22 12:13:17');
INSERT INTO `davinci_statistic_duration` VALUES (4, 1, 'abc@qq.com', '2020-01-22 12:18:10', '2020-01-22 12:18:38');
INSERT INTO `davinci_statistic_duration` VALUES (5, 1, 'abc@qq.com', '2020-01-22 12:18:40', '2020-01-22 12:18:55');
INSERT INTO `davinci_statistic_duration` VALUES (6, 1, 'abc@qq.com', '2020-01-22 12:18:55', '2020-01-22 12:18:55');
INSERT INTO `davinci_statistic_duration` VALUES (7, 1, 'abc@qq.com', '2020-01-22 12:18:57', '2020-01-22 12:19:46');
INSERT INTO `davinci_statistic_duration` VALUES (8, 1, 'abc@qq.com', '2020-01-22 13:48:29', '2020-01-22 13:49:21');
INSERT INTO `davinci_statistic_duration` VALUES (9, 1, 'abc@qq.com', '2020-01-22 13:48:29', '2020-01-22 13:49:21');
INSERT INTO `davinci_statistic_duration` VALUES (10, 1, 'abc@qq.com', '2020-01-22 13:49:37', '2020-01-22 13:51:01');
INSERT INTO `davinci_statistic_duration` VALUES (11, 1, 'abc@qq.com', '2020-01-22 13:51:17', '2020-01-22 13:51:22');
INSERT INTO `davinci_statistic_duration` VALUES (12, 1, 'abc@qq.com', '2020-01-22 13:51:22', '2020-01-22 13:51:22');
INSERT INTO `davinci_statistic_duration` VALUES (13, 1, 'abc@qq.com', '2020-01-22 13:51:23', '2020-01-22 13:52:16');
INSERT INTO `davinci_statistic_duration` VALUES (14, 1, 'abc@qq.com', '2020-01-22 13:52:17', '2020-01-22 13:53:05');
INSERT INTO `davinci_statistic_duration` VALUES (15, 1, 'abc@qq.com', '2020-01-22 13:53:24', '2020-01-22 13:53:39');
INSERT INTO `davinci_statistic_duration` VALUES (16, 1, 'abc@qq.com', '2020-01-22 13:58:52', '2020-01-22 13:58:58');
INSERT INTO `davinci_statistic_duration` VALUES (17, 1, 'abc@qq.com', '2020-01-22 14:03:58', '2020-01-22 14:04:00');
INSERT INTO `davinci_statistic_duration` VALUES (18, 1, 'abc@qq.com', '2020-01-22 14:10:32', '2020-01-22 14:10:34');
INSERT INTO `davinci_statistic_duration` VALUES (19, 1, 'abc@qq.com', '2020-01-22 14:21:35', '2020-01-22 14:22:02');
INSERT INTO `davinci_statistic_duration` VALUES (20, 1, 'abc@qq.com', '2020-01-22 14:22:05', '2020-01-22 14:22:35');
INSERT INTO `davinci_statistic_duration` VALUES (21, 1, 'abc@qq.com', '2020-01-22 14:23:47', '2020-01-22 14:23:48');
INSERT INTO `davinci_statistic_duration` VALUES (22, 1, 'abc@qq.com', '2020-01-22 13:58:41', '2020-01-22 13:58:52');
INSERT INTO `davinci_statistic_duration` VALUES (23, 1, 'abc@qq.com', '2020-01-22 13:58:52', '2020-01-22 13:58:52');

-- ----------------------------
-- Table structure for davinci_statistic_terminal
-- ----------------------------
DROP TABLE IF EXISTS `davinci_statistic_terminal`;
CREATE TABLE `davinci_statistic_terminal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `browser_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器名称',
  `browser_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `engine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引擎名称',
  `engine_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引擎版本',
  `os_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统版本',
  `device_model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备模式',
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `device_vendor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备供应商',
  `cpu_architecture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cpu架构',
  `create_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计终端表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of davinci_statistic_terminal
-- ----------------------------
INSERT INTO `davinci_statistic_terminal` VALUES (1, 1, 'abc@qq.com', 'Chrome', '79.0.3945.130', 'Blink', '', 'Windows', '10', '', '', '', 'amd64', '2020-01-22 11:43:55');
INSERT INTO `davinci_statistic_terminal` VALUES (2, 1, 'abc@qq.com', 'Chrome', '79.0.3945.130', 'Blink', '', 'Windows', '10', '', '', '', 'amd64', '2020-01-22 13:49:22');

-- ----------------------------
-- Table structure for davinci_statistic_visitor_operation
-- ----------------------------
DROP TABLE IF EXISTS `davinci_statistic_visitor_operation`;
CREATE TABLE `davinci_statistic_visitor_operation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'login/visit/initial/sync/search/linkage/drill/download/print',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '组织id',
  `project_id` bigint(20) NULL DEFAULT NULL COMMENT '项目id',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `viz_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dashboard/display',
  `viz_id` bigint(20) NULL DEFAULT NULL,
  `viz_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_viz_id` bigint(20) NULL DEFAULT NULL,
  `sub_viz_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `widget_id` bigint(20) NULL DEFAULT NULL,
  `widget_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `variables` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filters` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groups` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计访客操作表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of davinci_statistic_visitor_operation
-- ----------------------------
INSERT INTO `davinci_statistic_visitor_operation` VALUES (1, 1, 'abc@qq.com', 'login', 0, 0, '', 'dashboard', 0, '', 0, '', 0, NULL, NULL, NULL, NULL, '2020-01-22 11:44:38');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (2, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 12:00:50');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (3, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 12:18:10');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (4, 1, 'abc@qq.com', 'search', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 12:18:16');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (5, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 12:18:40');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (6, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 12:18:40');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (7, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 12:18:57');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (8, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 12:18:57');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (9, 1, 'abc@qq.com', 'login', 0, 0, '', 'dashboard', 0, '', 0, '', 0, NULL, NULL, NULL, NULL, '2020-01-22 13:49:28');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (10, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 13:49:37');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (11, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:49:38');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (12, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 13:51:17');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (13, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:51:17');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (14, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 13:51:23');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (15, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:51:23');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (16, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 13:52:17');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (17, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:52:17');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (18, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:52:24');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (19, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:52:35');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (20, 1, 'abc@qq.com', 'download', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 13:58:49');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (21, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 14:10:32');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (22, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 14:10:32');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (23, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 0, NULL, NULL, NULL, NULL, '2020-01-22 14:21:35');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (24, 1, 'abc@qq.com', 'initial', 1, 1, '软件评测11', 'dashboard', 1, '软件评测', 2, 'xunxiao-dev', 2, 'hjbjjh', '[]', '[]', '[name]', '2020-01-22 14:21:35');
INSERT INTO `davinci_statistic_visitor_operation` VALUES (25, 1, 'abc@qq.com', 'visit', 1, 1, '软件评测11', 'display', 1, '软件评测', 0, '', 0, NULL, NULL, NULL, NULL, '2020-01-22 14:26:18');

-- ----------------------------
-- Table structure for display
-- ----------------------------
DROP TABLE IF EXISTS `display`;
CREATE TABLE `display`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图像地址',
  `publish` tinyint(1) NOT NULL COMMENT '发布状态 0 编辑 1 发布',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏展示表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of display
-- ----------------------------
INSERT INTO `display` VALUES (1, '软件评测', '', 1, NULL, 1, 1, '2020-01-22 14:04:22', NULL, NULL);

-- ----------------------------
-- Table structure for display_slide
-- ----------------------------
DROP TABLE IF EXISTS `display_slide`;
CREATE TABLE `display_slide`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display_id` bigint(20) NOT NULL COMMENT '大屏id',
  `index` int(12) NOT NULL COMMENT '排序',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图表配置信息',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_display_id`(`display_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏图表配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of display_slide
-- ----------------------------
INSERT INTO `display_slide` VALUES (1, 1, 0, '{\"slideParams\":{\"width\":1920,\"height\":1080,\"backgroundColor\":[255,255,255,50],\"scaleMode\":\"scaleWidth\",\"backgroundImage\":\"/image/display/1579674359990_e7e511ae-ba64-42ef-bb7b-81e13ba200dd.png\"}}', 1, '2020-01-22 14:04:22', 1, '2020-01-22 14:26:00');

-- ----------------------------
-- Table structure for download_record
-- ----------------------------
DROP TABLE IF EXISTS `download_record`;
CREATE TABLE `download_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下载文件名称',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `status` smallint(1) NOT NULL COMMENT '状态',
  `create_time` datetime(0) NOT NULL,
  `last_download_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '下载记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of download_record
-- ----------------------------
INSERT INTO `download_record` VALUES (1, 'xunxiao-dev_20200122135849', 1, 'D:\\IdeaProjects\\lucas\\davinci-boot/userfiles/\\\\download\\20200122\\excel\\1_1579672732501.xlsx', 4, '2020-01-22 13:58:50', '2020-01-22 13:58:53');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_project`(`user_id`, `project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mem_dashboard_widget
-- ----------------------------
DROP TABLE IF EXISTS `mem_dashboard_widget`;
CREATE TABLE `mem_dashboard_widget`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint(20) NOT NULL COMMENT '看板id',
  `widget_Id` bigint(20) NULL DEFAULT NULL COMMENT '图表id',
  `x` int(12) NOT NULL COMMENT 'x坐标',
  `y` int(12) NOT NULL COMMENT 'y坐标',
  `width` int(12) NOT NULL COMMENT '宽',
  `height` int(12) NOT NULL COMMENT '高',
  `polling` tinyint(1) NOT NULL DEFAULT 0 COMMENT '刷新策略 0 自动刷新 1 手动刷新',
  `frequency` int(12) NULL DEFAULT NULL COMMENT '刷新间隔时间',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_protal_id`(`dashboard_id`) USING BTREE,
  INDEX `idx_widget_id`(`widget_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图表在看板中显示位置配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mem_dashboard_widget
-- ----------------------------
INSERT INTO `mem_dashboard_widget` VALUES (1, 2, 2, 0, 0, 7, 8, 0, 60, '', 1, '2020-01-22 12:18:17', 1, '2020-01-22 14:21:39');

-- ----------------------------
-- Table structure for mem_display_slide_widget
-- ----------------------------
DROP TABLE IF EXISTS `mem_display_slide_widget`;
CREATE TABLE `mem_display_slide_widget`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display_slide_id` bigint(20) NOT NULL COMMENT '大屏图表关联id',
  `widget_id` bigint(20) NULL DEFAULT NULL COMMENT '部件id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '查询参数',
  `type` smallint(1) NOT NULL COMMENT '类型',
  `sub_type` smallint(2) NULL DEFAULT NULL COMMENT '子类型',
  `index` int(12) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_slide_id`(`display_slide_id`) USING BTREE,
  INDEX `idx_widget_id`(`widget_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图表在大屏中显示位置配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mem_display_slide_widget
-- ----------------------------
INSERT INTO `mem_display_slide_widget` VALUES (1, 1, 2, 'hjbjjh', '{\"width\":1017,\"height\":682,\"positionX\":100,\"positionY\":301,\"backgroundColor\":[255,255,255,0],\"borderColor\":[0,0,0],\"borderWidth\":null,\"borderStyle\":\"solid\",\"borderRadius\":null,\"polling\":\"false\",\"frequency\":60}', 1, NULL, 2, 1, '2020-01-22 14:04:36', 1, '2020-01-22 14:27:17');
INSERT INTO `mem_display_slide_widget` VALUES (2, 1, 1, 'fdgb', '{\"width\":460,\"height\":250,\"positionX\":410,\"positionY\":177,\"backgroundColor\":[255,255,255,0],\"borderColor\":[0,0,0],\"borderWidth\":null,\"borderStyle\":\"solid\",\"borderRadius\":null,\"polling\":\"false\",\"frequency\":60}', 1, NULL, 1, 1, '2020-01-22 14:25:41', 1, '2020-01-22 14:27:17');
INSERT INTO `mem_display_slide_widget` VALUES (3, 1, NULL, '时间器_t2qt3', '{\"width\":460,\"height\":250,\"positionX\":1129,\"positionY\":104,\"timeFormat\":\"YYYY-MM-DD HH:mm:ss\",\"timeDuration\":1000,\"fontFamily\":null,\"fontColor\":[0,0,0],\"fontSize\":40,\"textAlign\":\"justify\",\"fontWeight\":\"normal\",\"textStyle\":[],\"lineHeight\":40,\"textIndent\":null,\"paddingTop\":null,\"paddingBottom\":null,\"paddingLeft\":null,\"paddingRight\":null,\"backgroundColor\":[255,255,255,0],\"borderColor\":[0,0,0],\"borderWidth\":null,\"borderStyle\":\"solid\",\"borderRadius\":null}', 2, 23, 3, 1, '2020-01-22 14:27:26', 1, '2020-01-22 14:27:29');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织说明',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `project_num` int(20) NULL DEFAULT 0 COMMENT '项目数量',
  `member_num` int(20) NULL DEFAULT 0 COMMENT '用户数量',
  `role_num` int(20) NULL DEFAULT 0 COMMENT '角色数量',
  `allow_create_project` tinyint(1) NULL DEFAULT 1 COMMENT '允许创建的项目数量',
  `member_permission` smallint(1) NOT NULL DEFAULT 0 COMMENT '用户权限 0 不可见任何 1 只可见公开',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_by` bigint(20) NOT NULL DEFAULT 0,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, '软件评测', 'dsfsddsd', NULL, 1, 1, 3, 1, 1, 1, '2020-01-22 11:48:06', 1, '2020-01-22 11:53:59', 1);

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `checkCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测代码',
  `checkSystemToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测系统token',
  `checkUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测地址',
  `alternateField1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段',
  `alternateField2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alternateField3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alternateField4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alternateField5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `org_id` bigint(20) NOT NULL COMMENT '组织id',
  `user_id` bigint(20) NOT NULL COMMENT '所有者用户id',
  `visibility` tinyint(1) NULL DEFAULT 1 COMMENT '可见性： 公开 1 授权 0',
  `star_num` int(11) NULL DEFAULT 0 COMMENT '星星数量',
  `is_transfer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否移交',
  `initial_org_id` bigint(20) NOT NULL COMMENT '创建的组织id',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '软件评测11', 'dfddf', '4', 1, 1, 1, 6, 0, 1, 1, '2020-01-22 11:49:26', 1, '2020-01-22 11:56:50');

-- ----------------------------
-- Table structure for rel_project_admin
-- ----------------------------
DROP TABLE IF EXISTS `rel_project_admin`;
CREATE TABLE `rel_project_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_project_user`(`project_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目管理员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_dashboard`;
CREATE TABLE `rel_role_dashboard`  (
  `role_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `dashboard_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色看板关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_dashboard_widget
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_dashboard_widget`;
CREATE TABLE `rel_role_dashboard_widget`  (
  `role_id` bigint(20) NOT NULL,
  `mem_dashboard_widget_id` bigint(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `mem_dashboard_widget_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色看板图表关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_display
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_display`;
CREATE TABLE `rel_role_display`  (
  `role_id` bigint(20) NOT NULL,
  `display_id` bigint(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `display_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色大屏关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_display_slide_widget
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_display_slide_widget`;
CREATE TABLE `rel_role_display_slide_widget`  (
  `role_id` bigint(20) NOT NULL,
  `mem_display_slide_widget_id` bigint(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `mem_display_slide_widget_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色大屏幻灯片部件关联表\r\n幻灯片就类似同一个页面分了多个屏幕\r\n可以左右滑动切换或者怎么切换方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_portal
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_portal`;
CREATE TABLE `rel_role_portal`  (
  `role_id` bigint(20) NOT NULL,
  `portal_id` bigint(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `portal_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色门户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_project
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_project`;
CREATE TABLE `rel_role_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `source_permission` smallint(1) NOT NULL DEFAULT 1,
  `view_permission` smallint(1) NOT NULL DEFAULT 1,
  `widget_permission` smallint(1) NOT NULL DEFAULT 1,
  `viz_permission` smallint(1) NOT NULL DEFAULT 1,
  `schedule_permission` smallint(1) NOT NULL DEFAULT 1,
  `share_permission` tinyint(1) NOT NULL DEFAULT 0,
  `download_permission` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_role_project`(`project_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色项目关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_slide
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_slide`;
CREATE TABLE `rel_role_slide`  (
  `role_id` bigint(20) NOT NULL,
  `slide_id` bigint(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `slide_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色幻灯片关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_role_user
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_user`;
CREATE TABLE `rel_role_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_role_user`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_role_user
-- ----------------------------
INSERT INTO `rel_role_user` VALUES (1, 1, 1, 1, '2020-01-22 11:52:07', NULL, NULL);

-- ----------------------------
-- Table structure for rel_role_view
-- ----------------------------
DROP TABLE IF EXISTS `rel_role_view`;
CREATE TABLE `rel_role_view`  (
  `view_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `row_auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `column_auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`view_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色视图关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_user_organization
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_organization`;
CREATE TABLE `rel_user_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL COMMENT '组织id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role` smallint(1) NOT NULL DEFAULT 0 COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_org_user`(`org_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色用户组织表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_user_organization
-- ----------------------------
INSERT INTO `rel_user_organization` VALUES (1, 1, 1, 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL COMMENT '组织id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图表地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orgid`(`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 1, '软件评测', '', 1, '2020-01-22 11:51:15', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for share_download_record
-- ----------------------------
DROP TABLE IF EXISTS `share_download_record`;
CREATE TABLE `share_download_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(1) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `last_download_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享下载记录表\r\n（分享的页面里面点击下载了，需要进行记录）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'json配置信息',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源类型',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `full_parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_folder` tinyint(1) NULL DEFAULT NULL,
  `index` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES (1, '测试', '', '{\"ext\":false,\"password\":\"123456\",\"properties\":[],\"url\":\"jdbc:mysql://localhost:3306/davinci\",\"username\":\"root\",\"version\":\"\"}', 'jdbc', 1, 1, '2020-01-22 12:02:52', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for star
-- ----------------------------
DROP TABLE IF EXISTS `star`;
CREATE TABLE `star`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `target_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `star_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_target_id`(`target_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '星星' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of star
-- ----------------------------
INSERT INTO `star` VALUES (1, 'project', 1, 1, '2020-01-22 13:49:33');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `admin` tinyint(1) NOT NULL COMMENT '是否为管理员',
  `active` tinyint(1) NULL DEFAULT NULL COMMENT '激活状态',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_by` bigint(20) NOT NULL DEFAULT 0,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01',
  `update_by` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'abc@qq.com', 'admin', '$2a$10$z1igM3C6kpK2vcKIWd.S8usvBM2VmO2hdbIMJ.5PImFCR2/e4Zrwi', 1, 1, '软件评测', '', '', NULL, '2020-01-22 11:44:30', 0, '1970-01-01 08:00:01', 0);

-- ----------------------------
-- Table structure for view
-- ----------------------------
DROP TABLE IF EXISTS `view`;
CREATE TABLE `view`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `source_id` bigint(20) NOT NULL COMMENT '数据源id',
  `sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户输入的SQL语句',
  `model` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抽取出来的数据表模型',
  `variable` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变量配置信息',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置，暂不知什么配置',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `full_parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_folder` tinyint(1) NULL DEFAULT NULL,
  `index` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视图表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view
-- ----------------------------
INSERT INTO `view` VALUES (1, '侧饿饿', '', 1, 1, 'SELECT * FROM organization', '{\"id\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"name\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"description\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"avatar\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"user_id\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"project_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"member_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"role_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"allow_create_project\":{\"sqlType\":\"TINYINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"member_permission\":{\"sqlType\":\"SMALLINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"create_time\":{\"sqlType\":\"TIMESTAMP\",\"visualType\":\"date\",\"modelType\":\"category\"},\"create_by\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"update_time\":{\"sqlType\":\"TIMESTAMP\",\"visualType\":\"date\",\"modelType\":\"category\"},\"update_by\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"}}', '[{\"name\":\"dev\",\"alias\":\"sharcre\",\"type\":\"query\",\"valueType\":\"string\",\"udf\":false,\"defaultValues\":[],\"key\":\"oFbqK\"}]', '', 1, '2020-01-22 12:06:54', 1, '2020-01-22 12:09:35', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for widget
-- ----------------------------
DROP TABLE IF EXISTS `widget`;
CREATE TABLE `widget`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `view_id` bigint(20) NOT NULL COMMENT '视图id',
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `type` bigint(20) NOT NULL COMMENT '展示类型 ',
  `publish` tinyint(1) NOT NULL COMMENT '是否发布',
  `config` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置信息',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `full_parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_folder` tinyint(1) NULL DEFAULT NULL,
  `index` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE,
  INDEX `idx_view_id`(`view_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget
-- ----------------------------
INSERT INTO `widget` VALUES (1, 'fdgb', '', 1, 1, 1, 1, '{\"cols\":[{\"name\":\"name\",\"visualType\":\"string\",\"type\":\"category\",\"field\":{\"alias\":\"\",\"desc\":\"\",\"useExpression\":false},\"format\":{\"formatType\":\"default\"}}],\"rows\":[],\"metrics\":[{\"name\":\"member_num@davinci@CFA4F3B7\",\"visualType\":\"number\",\"type\":\"value\",\"agg\":\"sum\",\"chart\":{\"id\":1,\"name\":\"pivot\",\"title\":\"透视表\",\"icon\":\"icon-table\",\"coordinate\":\"cartesian\",\"rules\":[{\"dimension\":[0,9999],\"metric\":[0,9999]}],\"data\":{\"cols\":{\"title\":\"列\",\"type\":\"category\"},\"rows\":{\"title\":\"行\",\"type\":\"category\"},\"metrics\":{\"title\":\"指标\",\"type\":\"value\"},\"filters\":{\"title\":\"筛选\",\"type\":\"all\"},\"color\":{\"title\":\"颜色\",\"type\":\"category\"}},\"style\":{\"pivot\":{\"fontFamily\":\"PingFang SC\",\"fontSize\":\"12\",\"color\":\"#666\",\"lineStyle\":\"solid\",\"lineColor\":\"#D9D9D9\",\"headerBackgroundColor\":\"#f7f7f7\"}}},\"field\":{\"alias\":\"\",\"desc\":\"\",\"useExpression\":false},\"format\":{\"formatType\":\"default\"}},{\"name\":\"project_num@davinci@346F95E6\",\"visualType\":\"number\",\"type\":\"value\",\"agg\":\"sum\",\"chart\":{\"id\":1,\"name\":\"pivot\",\"title\":\"透视表\",\"icon\":\"icon-table\",\"coordinate\":\"cartesian\",\"rules\":[{\"dimension\":[0,9999],\"metric\":[0,9999]}],\"data\":{\"cols\":{\"title\":\"列\",\"type\":\"category\"},\"rows\":{\"title\":\"行\",\"type\":\"category\"},\"metrics\":{\"title\":\"指标\",\"type\":\"value\"},\"filters\":{\"title\":\"筛选\",\"type\":\"all\"},\"color\":{\"title\":\"颜色\",\"type\":\"category\"}},\"style\":{\"pivot\":{\"fontFamily\":\"PingFang SC\",\"fontSize\":\"12\",\"color\":\"#666\",\"lineStyle\":\"solid\",\"lineColor\":\"#D9D9D9\",\"headerBackgroundColor\":\"#f7f7f7\"}}},\"field\":{\"alias\":\"\",\"desc\":\"\",\"useExpression\":false},\"format\":{\"formatType\":\"default\"}}],\"filters\":[],\"color\":{\"title\":\"颜色\",\"type\":\"category\",\"value\":{},\"items\":[]},\"chartStyles\":{\"pivot\":{\"fontFamily\":\"PingFang SC\",\"fontSize\":\"12\",\"color\":\"#666\",\"lineStyle\":\"solid\",\"lineColor\":\"#D9D9D9\",\"headerBackgroundColor\":\"#f7f7f7\"}},\"selectedChart\":3,\"data\":[],\"pagination\":{\"pageNo\":0,\"pageSize\":0,\"withPaging\":false,\"totalCount\":0},\"renderType\":\"rerender\",\"orders\":[],\"mode\":\"pivot\",\"model\":{\"id\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"name\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"description\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"avatar\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"user_id\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"project_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"member_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"role_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"allow_create_project\":{\"sqlType\":\"TINYINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"member_permission\":{\"sqlType\":\"SMALLINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"create_time\":{\"sqlType\":\"TIMESTAMP\",\"visualType\":\"date\",\"modelType\":\"category\"},\"create_by\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"update_time\":{\"sqlType\":\"TIMESTAMP\",\"visualType\":\"date\",\"modelType\":\"category\"},\"update_by\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"}},\"controls\":[],\"computed\":[],\"cache\":false,\"expired\":300,\"autoLoadData\":true}', 1, '2020-01-22 12:14:02', 1, '2020-01-22 12:15:41', NULL, NULL, NULL, NULL);
INSERT INTO `widget` VALUES (2, 'hjbjjh', '', 1, 1, 1, 1, '{\"data\":[],\"cols\":[{\"name\":\"name\",\"visualType\":\"string\",\"type\":\"category\",\"field\":{\"alias\":\"大富科技地方\",\"useExpression\":false,\"desc\":\"\"},\"format\":{\"formatType\":\"default\"},\"from\":\"cols\"}],\"rows\":[],\"metrics\":[{\"name\":\"member_num@davinci@5E48FA7F\",\"visualType\":\"number\",\"type\":\"value\",\"agg\":\"sum\",\"chart\":{\"id\":1,\"name\":\"table\",\"title\":\"表格\",\"icon\":\"icon-table\",\"coordinate\":\"other\",\"rules\":[{\"dimension\":[0,9999],\"metric\":[0,9999]}],\"data\":{\"cols\":{\"title\":\"列\",\"type\":\"category\"},\"rows\":{\"title\":\"行\",\"type\":\"category\"},\"metrics\":{\"title\":\"指标\",\"type\":\"value\"},\"filters\":{\"title\":\"筛选\",\"type\":\"all\"}},\"style\":{\"table\":{\"fontFamily\":\"PingFang SC\",\"fontSize\":\"12\",\"color\":\"#666\",\"lineStyle\":\"solid\",\"lineColor\":\"#D9D9D9\",\"headerBackgroundColor\":\"#f7f7f7\",\"headerConfig\":[],\"columnsConfig\":[],\"leftFixedColumns\":[],\"rightFixedColumns\":[],\"headerFixed\":true,\"autoMergeCell\":true,\"bordered\":true,\"size\":\"default\",\"withPaging\":true,\"pageSize\":\"20\",\"withNoAggregators\":false},\"spec\":{}}},\"field\":{\"alias\":\"\",\"desc\":\"\",\"useExpression\":false},\"format\":{\"formatType\":\"default\"},\"from\":\"metrics\"},{\"name\":\"project_num@davinci@7FB406F1\",\"visualType\":\"number\",\"type\":\"value\",\"agg\":\"sum\",\"chart\":{\"id\":1,\"name\":\"table\",\"title\":\"表格\",\"icon\":\"icon-table\",\"coordinate\":\"other\",\"rules\":[{\"dimension\":[0,9999],\"metric\":[0,9999]}],\"data\":{\"cols\":{\"title\":\"列\",\"type\":\"category\"},\"rows\":{\"title\":\"行\",\"type\":\"category\"},\"metrics\":{\"title\":\"指标\",\"type\":\"value\"},\"filters\":{\"title\":\"筛选\",\"type\":\"all\"}},\"style\":{\"table\":{\"fontFamily\":\"PingFang SC\",\"fontSize\":\"12\",\"color\":\"#666\",\"lineStyle\":\"solid\",\"lineColor\":\"#D9D9D9\",\"headerBackgroundColor\":\"#f7f7f7\",\"headerConfig\":[],\"columnsConfig\":[],\"leftFixedColumns\":[],\"rightFixedColumns\":[],\"headerFixed\":true,\"autoMergeCell\":true,\"bordered\":true,\"size\":\"default\",\"withPaging\":true,\"pageSize\":\"20\",\"withNoAggregators\":false},\"spec\":{}}},\"field\":{\"alias\":\"\",\"desc\":\"\",\"useExpression\":false},\"format\":{\"formatType\":\"default\"},\"from\":\"metrics\"}],\"filters\":[],\"color\":{\"title\":\"颜色\",\"type\":\"category\",\"value\":{\"all\":\"#509af2\",\"member_num@davinci@5E48FA7F\":\"#509af2\",\"project_num@davinci@7FB406F1\":\"#3acf7a\"},\"items\":[]},\"tip\":{\"title\":\"提示信息\",\"type\":\"value\",\"items\":[]},\"chartStyles\":{\"bar\":{\"barChart\":false,\"border\":{\"color\":\"#000\",\"width\":0,\"type\":\"solid\",\"radius\":0},\"gap\":30,\"width\":null,\"stack\":{\"on\":false,\"percentage\":false,\"group\":[],\"sum\":{\"show\":false,\"font\":{\"fontFamily\":\"PingFang SC\",\"fontStyle\":\"normal\",\"fontSize\":\"14px\",\"fontWeight\":\"normal\",\"fontColor\":\"#666\"}}}},\"label\":{\"showLabel\":false,\"labelPosition\":\"top\",\"labelFontFamily\":\"PingFang SC\",\"labelFontSize\":\"12\",\"labelColor\":\"#666\"},\"xAxis\":{\"showLine\":true,\"lineStyle\":\"solid\",\"lineSize\":\"1\",\"lineColor\":\"#D9D9D9\",\"showLabel\":true,\"labelFontFamily\":\"PingFang SC\",\"labelFontSize\":\"12\",\"labelColor\":\"#666\",\"xAxisInterval\":0,\"xAxisRotate\":0},\"yAxis\":{\"showLine\":true,\"lineStyle\":\"solid\",\"lineSize\":\"1\",\"lineColor\":\"#D9D9D9\",\"showLabel\":true,\"labelFontFamily\":\"PingFang SC\",\"labelFontSize\":\"12\",\"labelColor\":\"#666\",\"showTitleAndUnit\":true,\"titleFontFamily\":\"PingFang SC\",\"titleFontSize\":\"12\",\"titleColor\":\"#666\",\"nameLocation\":\"middle\",\"nameRotate\":90,\"nameGap\":40,\"min\":null,\"max\":null},\"splitLine\":{\"showHorizontalLine\":true,\"horizontalLineStyle\":\"dashed\",\"horizontalLineSize\":\"1\",\"horizontalLineColor\":\"#D9D9D9\",\"showVerticalLine\":false,\"verticalLineStyle\":\"dashed\",\"verticalLineSize\":\"1\",\"verticalLineColor\":\"#D9D9D9\"},\"legend\":{\"showLegend\":true,\"legendPosition\":\"right\",\"selectAll\":true,\"fontFamily\":\"PingFang SC\",\"fontSize\":\"12\",\"color\":\"#666\"},\"spec\":{}},\"selectedChart\":3,\"pagination\":{\"pageNo\":0,\"pageSize\":0,\"withPaging\":false,\"totalCount\":0},\"dimetionAxis\":\"col\",\"renderType\":\"clear\",\"orders\":[],\"mode\":\"chart\",\"model\":{\"id\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"name\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"description\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"avatar\":{\"sqlType\":\"VARCHAR\",\"visualType\":\"string\",\"modelType\":\"category\"},\"user_id\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"project_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"member_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"role_num\":{\"sqlType\":\"INT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"allow_create_project\":{\"sqlType\":\"TINYINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"member_permission\":{\"sqlType\":\"SMALLINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"create_time\":{\"sqlType\":\"TIMESTAMP\",\"visualType\":\"date\",\"modelType\":\"category\"},\"create_by\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"},\"update_time\":{\"sqlType\":\"TIMESTAMP\",\"visualType\":\"date\",\"modelType\":\"category\"},\"update_by\":{\"sqlType\":\"BIGINT\",\"visualType\":\"number\",\"modelType\":\"value\"}},\"controls\":[],\"computed\":[],\"cache\":false,\"expired\":300,\"autoLoadData\":true}', 1, '2020-01-22 12:16:55', 1, '2020-01-22 13:51:17', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
