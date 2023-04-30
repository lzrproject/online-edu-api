package xyz.refrain.onlineedu.show.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import xyz.refrain.onlineedu.model.params.BasePageParam;

import java.util.Date;

/**
 * 博客对象 article
 * 
 * @author paopao
 * @date 2023-04-29
 */
@Data
public class Article
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /** 文章标题 */
    @TableField("title")
    private String title;

    /** 内容 */
    @TableField("content")
    private String content;

    /** 描述 */
    @TableField("article_desc")
    private String articleDesc;

    /** 图片1 */
    @TableField("img_1")
    private String img1;

    /** 图片2 */
    @TableField("img_2")
    private String img2;

    /** 图片3 */
    @TableField("img_3")
    private String img3;

    /** 创建用户的id */
    @TableField("create_user")
    private Integer createUser;

    /** 是否启用 */
    @TableField("enable")
    private Integer enable;

    /** 创建时间 */
    @TableField("create_time")
    private Date createTime;

    /** 创建时间 */
    @TableField("update_time")
    private Date updateTime;
}
