package xyz.refrain.onlineedu.show.service;

import java.util.List;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import xyz.refrain.onlineedu.show.domain.*;

/**
 * 博客Service接口
 * 
 * @author paopao
 * @date 2023-04-29
 */
public interface IArticleService 
{
    /**
     * 查询博客
     * 
     * @param id 博客主键
     * @return 博客
     */
    public Article selectArticleById(Long id);

    /**
     * 查询博客列表
     * 
     * @param article 博客
     * @return 博客集合
     */
    public List<ArticleVO> selectArticleList(ArticleSearchParam article);

    IPage<ArticleVO> selectArticlesByUid(ArticleSearchParam article);

    /**
     * 新增博客
     * 
     * @param article 博客
     * @return 结果
     */
    public int insertArticle(Article article);

    /**
     * 修改博客
     * 
     * @param article 博客
     * @return 结果
     */
    public int updateArticle(Article article);


    /**
     * 删除博客信息
     * 
     * @param id 博客主键
     * @return 结果
     */
    public int deleteArticleById(Long id);


    List<DateCount> getArticleDate();

    List<Tree<Integer>> selectCommentByBid(Integer articleId);

    ArticleCommentVO addCommentOne(ArticleComment articleComment);
}
