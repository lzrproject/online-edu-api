package xyz.refrain.onlineedu.show.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Author: paoPao
 * @Date: 2023/5/13
 * @Description:
 */
@Data
public class ArticleCommentVO implements Serializable {
    private Integer id;
    private Integer articleId;
    private Integer commentUser;
    private String content;
    private Integer parentId;
    @TableField("to_uid")
    private Integer toUid;
    private String commentType;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private String avatar;
    private String nickname;
    private String toNickname;

    private List<ArticleCommentVO> children;
}
