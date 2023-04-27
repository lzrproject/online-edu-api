/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : online_edu

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 27/04/2023 23:45:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单权限表',
  `pid` int(0) UNSIGNED NOT NULL COMMENT '父级id',
  `type` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '菜单类型，0顶部菜单、1聚合菜单、2页面菜单、3接口',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称或接口名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径(以http开头时，视为打开外部链接) 或 请求接口的地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单组件，只有叶子菜单才可配置',
  `meta` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单的route.meta配置项，json格式',
  `admin` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0默认，1只有超级管理员才能使用',
  `enable` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `permission_id` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色具有的权限ID串',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES (1, '默认管理员', '', 1, '2021-01-18 19:30:48', '2021-01-18 19:30:48');
INSERT INTO `acl_role` VALUES (2, '普通管理员', '', 1, '2021-05-02 22:03:57', '2021-05-02 22:03:57');
INSERT INTO `acl_role` VALUES (3, '课程管理员', '', 1, '2021-05-02 22:04:08', '2021-05-02 22:04:00');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户头像',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户签名',
  `roleId` int(0) UNSIGNED NOT NULL COMMENT '角色id',
  `enable` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES (1, 'admin', 'ea48576f30be1669971699c09ad05c94', '默认管理员', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '默认管理员，默认启用', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 1, 1, '2022-02-20 18:26:37', '2021-01-18 19:40:03');
INSERT INTO `acl_user` VALUES (2, 'tch1', 'ea48576f30be1669971699c09ad05c94', '管理员1', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员1号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:37', '2021-05-01 23:53:25');
INSERT INTO `acl_user` VALUES (3, 'tch2', 'ea48576f30be1669971699c09ad05c94', '管理员2', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员2号号号号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:37', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (4, 'tch3', 'ea48576f30be1669971699c09ad05c94', '课程管理员3', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '课程管理员3号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 3, 1, '2022-02-20 18:26:37', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (5, 'tch4', 'ea48576f30be1669971699c09ad05c94', '管理员4', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员4号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:37', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (6, 'tch5', 'ea48576f30be1669971699c09ad05c94', '管理员5', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员5号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (7, 'tch6', 'ea48576f30be1669971699c09ad05c94', '管理员6', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员6号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (8, 'tch7', 'ea48576f30be1669971699c09ad05c94', '管理员7', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员7号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (9, 'tch8', 'ea48576f30be1669971699c09ad05c94', '管理员8', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员8号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (10, 'tch9', 'ea48576f30be1669971699c09ad05c94', '管理员9', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员9号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (11, 'tch10', 'ea48576f30be1669971699c09ad05c94', '管理员10', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员10号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (12, 'tch11', 'ea48576f30be1669971699c09ad05c94', '管理员11', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员11号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:38', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (13, 'tch12', 'ea48576f30be1669971699c09ad05c94', '管理员12', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员12号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (14, 'tch13', 'ea48576f30be1669971699c09ad05c94', '管理员13', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员13号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (15, 'tch14', 'ea48576f30be1669971699c09ad05c94', '管理员14', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员14号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (16, 'tch15', 'ea48576f30be1669971699c09ad05c94', '管理员15', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员15号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 0, '2022-02-20 18:26:39', '2021-05-01 23:55:22');
INSERT INTO `acl_user` VALUES (17, 'tch16', 'ea48576f30be1669971699c09ad05c94', '管理员16', 'https://c-ssl.duitang.com/uploads/item/201912/05/20191205152830_ULrYx.thumb.300_0.jpeg', '管理员16号', '无心插柳柳成荫，没什么期待才会偶遇惊喜！', 2, 1, '2022-02-20 18:26:39', '2021-05-01 23:55:22');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `course_id` int(0) UNSIGNED NOT NULL COMMENT '课程ID',
  `title` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '章节名称',
  `sort` int(0) NULL DEFAULT 0 COMMENT '显示排序',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程章节表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------

-- ----------------------------
-- Table structure for edu_chapter_tmp
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter_tmp`;
CREATE TABLE `edu_chapter_tmp`  (
  `id` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主键',
  `oid` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '原章节ID',
  `course_id` int(0) UNSIGNED NOT NULL COMMENT '课程ID',
  `title` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '章节名称',
  `sort` int(0) NULL DEFAULT 0 COMMENT '显示排序',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程章节临时表（用于存放二次修改的数据）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `course_id` int(0) UNSIGNED NOT NULL COMMENT '课程id',
  `teacher_id` int(0) UNSIGNED NOT NULL COMMENT '讲师id',
  `member_id` int(0) UNSIGNED NOT NULL COMMENT '会员id',
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '评论内容',
  `mark` double UNSIGNED NULL DEFAULT 5 COMMENT '评分（满分5.00）',
  `status` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '评论状态 0审核中 1通过',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_member_id_course_id`(`member_id`, `course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 651 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `teacher_id` int(0) UNSIGNED NOT NULL COMMENT '课程讲师ID',
  `subject_id` int(0) UNSIGNED NOT NULL COMMENT '课程科目分类ID',
  `title` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程标题',
  `price` double(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程封面图片路径',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程描述',
  `buy_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '浏览数量',
  `sort` int(0) NULL DEFAULT 0 COMMENT '显示排序',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上架下架，0下架 1上架',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '课程状态，草稿 审核 发表',
  `remarks` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程类别ID',
  `title` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `parent_id` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '父ID',
  `sort` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '排序字段',
  `enable` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程科目分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES (55, '课程浏览', 0, 1, 1, '2023-04-27 22:36:57', '2023-04-27 22:36:57');
INSERT INTO `edu_subject` VALUES (56, '子课程', 55, 1, 1, '2023-04-27 22:37:48', '2023-04-27 22:37:48');
INSERT INTO `edu_subject` VALUES (57, '活动浏览', 0, 1, 1, '2023-04-27 22:47:14', '2023-04-27 22:47:14');
INSERT INTO `edu_subject` VALUES (58, '博客浏览', 0, 3, 1, '2023-04-27 22:47:22', '2023-04-27 22:47:22');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '讲师ID',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱地址',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师姓名',
  `intro` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `avatar` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '讲师头像',
  `resume` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '讲师简历链接',
  `division` tinyint(0) NULL DEFAULT 80 COMMENT '分成比例，0-100',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `enable` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '讲师状态：审核通过；审核不通过；待审核',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `course_id` int(0) UNSIGNED NOT NULL COMMENT '课程ID',
  `chapter_id` int(0) UNSIGNED NOT NULL COMMENT '章节ID',
  `title` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '视频显示名称',
  `video_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '云端视频资源',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '播放次数',
  `free` tinyint(0) UNSIGNED NULL DEFAULT 1 COMMENT '是否可以试听：0免费 1收费',
  `duration` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `size` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------

-- ----------------------------
-- Table structure for edu_video_tmp
-- ----------------------------
DROP TABLE IF EXISTS `edu_video_tmp`;
CREATE TABLE `edu_video_tmp`  (
  `id` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主键(视频ID)',
  `oid` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '原视频ID',
  `course_id` int(0) UNSIGNED NOT NULL COMMENT '课程ID',
  `chapter_id` bigint(0) UNSIGNED NOT NULL COMMENT '章节ID',
  `title` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '视频显示名称',
  `video_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '云端视频资源',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '播放次数',
  `free` tinyint(0) UNSIGNED NULL DEFAULT 1 COMMENT '是否可以试听：0免费 1收费',
  `duration` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `size` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE,
  INDEX `idx_id`(`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程视频表（用于存放二次修改的数据）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for hm_banner
-- ----------------------------
DROP TABLE IF EXISTS `hm_banner`;
CREATE TABLE `hm_banner`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `enable` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页banner表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hm_banner
-- ----------------------------

-- ----------------------------
-- Table structure for rel_course_member
-- ----------------------------
DROP TABLE IF EXISTS `rel_course_member`;
CREATE TABLE `rel_course_member`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '课程Id',
  `member_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '学员Id',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_course_id`(`course_id`) USING BTREE,
  UNIQUE INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_member_course`(`member_id`, `course_id`) USING BTREE COMMENT '联合索引(member_id, course_id)'
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程订阅-学员关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_course_member
-- ----------------------------

-- ----------------------------
-- Table structure for stat_daily
-- ----------------------------
DROP TABLE IF EXISTS `stat_daily`;
CREATE TABLE `stat_daily`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` datetime(0) NOT NULL COMMENT '统计日期',
  `visit_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '访客数量',
  `register_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '注册人数',
  `login_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '活跃人数',
  `video_view_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '视频播放数',
  `course_buy_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '购买数量',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1826 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stat_daily
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `from_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送者Id',
  `from_role` tinyint(0) NOT NULL DEFAULT 0 COMMENT '发送者角色(管理员、讲师...)',
  `to_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接受者id',
  `to_role` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接受者角色(教师、学员...)',
  `title` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '消息标题',
  `content` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `has_read` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '是否已读(0未读 1已读)',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_to_id`(`to_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号(datetime+unsigned int)',
  `course_id` int(0) UNSIGNED NOT NULL COMMENT '课程id',
  `member_id` int(0) UNSIGNED NOT NULL COMMENT '会员id',
  `total_fee` double(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '支付类型（0 未支付 1：微信 2：支付宝）',
  `transaction_num` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '交易流水号',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_member_id_course_id`(`member_id`, `course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for uctr_member
-- ----------------------------
DROP TABLE IF EXISTS `uctr_member`;
CREATE TABLE `uctr_member`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱地址',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '性别 1 女，2 男',
  `age` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '年龄',
  `avatar` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户头像',
  `sign` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户签名',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用，0否1是',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `uk_nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uctr_member
-- ----------------------------
INSERT INTO `uctr_member` VALUES (1203, '13712345678', '', 'f42e3072e0fa14ce1ef5cd5d508da008', '13712345678', 0, 0, '', '', 1, '2023-04-27 23:00:55', '2023-04-27 23:00:55');

SET FOREIGN_KEY_CHECKS = 1;
