
CREATE TABLE `article` (
    `id` int NOT NULL AUTO_INCREMENT,
    `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
    `content` text DEFAULT NULL COMMENT '内容',
    `article_desc` varchar(500) DEFAULT NULL COMMENT '文章描述',
    `img_1` varchar(255) DEFAULT NULL COMMENT '图片1',
    `img_2` varchar(255) DEFAULT NULL COMMENT '图片2',
    `img_3` varchar(255) DEFAULT NULL COMMENT '图片3',
    `create_user` int DEFAULT NULL COMMENT '创建用户的id',
    `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
    `enable` tinyint(1) DEFAULT NULL COMMENT '是否启用',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT '博客表';

CREATE TABLE `article_comment` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章评论id',
    `article_id` int(0) DEFAULT NULL COMMENT '文章id',
    `comment_user` int(0) DEFAULT NULL COMMENT '评论用户的id',
    `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
    `parent_id` int DEFAULT '0' COMMENT '父评论ID',
    `to_uid` int(0) DEFAULT NULL COMMENT '回复用户的id',
    `comment_type` char(1) DEFAULT '0' comment '类型 0-文章的评论 1-评论的评论 2-评论的回复',
    `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;