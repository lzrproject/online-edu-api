package xyz.refrain.onlineedu.show.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import xyz.refrain.onlineedu.model.params.BasePageParam;

import java.io.Serializable;
import java.util.Date;

/**
 * 博客对象 article
 * 
 * @author paopao
 * @date 2023-04-29
 */
@Data
public class ArticleVO implements Serializable
{

    /** $column.columnComment */
    private Long id;

    /** 文章标题 */
    private String title;

    /** 内容 */
    private String content;

    /** 描述 */
    private String articleDesc;

    /** 创建用户的id */
    private Integer createUser;

    /** 创建用户名称 */
    private String userName;

    /** 是否启用 */
    private Integer enable;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Integer commentCounts;
}
