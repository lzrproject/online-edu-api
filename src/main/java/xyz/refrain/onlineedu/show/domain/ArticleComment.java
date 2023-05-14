package xyz.refrain.onlineedu.show.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @Author: paoPao
 * @Date: 2023/5/13
 * @Description:
 */
@Data
public class ArticleComment {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("article_id")
    private Integer articleId;

    @TableField("comment_user")
    private Integer commentUser;

    @TableField("content")
    private String content;

    @TableField("parent_id")
    private Integer parentId;

    @TableField("to_uid")
    private Integer toUid;

    @TableField("comment_type")
    private String commentType;

    @TableField("create_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

}
