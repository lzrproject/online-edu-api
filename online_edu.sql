
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