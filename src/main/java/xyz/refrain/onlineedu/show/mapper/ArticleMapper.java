package xyz.refrain.onlineedu.show.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.refrain.onlineedu.show.domain.Article;
import xyz.refrain.onlineedu.show.domain.ArticleSearchParam;
import xyz.refrain.onlineedu.show.domain.ArticleVO;
import xyz.refrain.onlineedu.show.domain.DateCount;

/**
 * 博客Mapper接口
 * 
 * @author paopao
 * @date 2023-04-29
 */
public interface ArticleMapper extends BaseMapper<Article>
{
    List<ArticleVO> queryArticleAll(ArticleSearchParam article);

    IPage<ArticleVO> queryArticleByUid(@Param("page") Page<ArticleVO> page, @Param("article") ArticleSearchParam article);

    List<DateCount> getArticleDate();
}
