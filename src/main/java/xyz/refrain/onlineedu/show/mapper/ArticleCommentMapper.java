package xyz.refrain.onlineedu.show.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xyz.refrain.onlineedu.show.domain.ArticleComment;
import xyz.refrain.onlineedu.show.domain.ArticleCommentVO;

import java.util.List;

/**
 * 博客Mapper接口
 * 
 * @author paopao
 * @date 2023-04-29
 */
public interface ArticleCommentMapper extends BaseMapper<ArticleComment>
{

    List<ArticleCommentVO> selectCommentByBid(Integer articleId);

    ArticleCommentVO selectCommentById(Integer id);
}
