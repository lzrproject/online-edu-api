package xyz.refrain.onlineedu.show.domain;

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
@EqualsAndHashCode(callSuper = true)
@Data
public class ArticleSearchParam extends BasePageParam
{

    /** $column.columnComment */
    private Long id;

    /** 文章标题 */
    private String title;

    /** 内容 */
    private String content;

    /** 创建用户的id */
    private Integer createUser;

    /** 创建用户名称 */
    private String userName;

    /** 是否启用 */
    private Integer enable;

    /** 创建时间 */
    private Date createTime;

    /** 创建时间 */
    private Date updateTime;

    private String dateStr;
}
