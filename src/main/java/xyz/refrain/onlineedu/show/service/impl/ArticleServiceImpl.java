package xyz.refrain.onlineedu.show.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.refrain.onlineedu.model.entity.EduCourseEntity;
import xyz.refrain.onlineedu.model.entity.TOrderEntity;
import xyz.refrain.onlineedu.model.securtiy.AclUserDetail;
import xyz.refrain.onlineedu.show.domain.Article;
import xyz.refrain.onlineedu.show.domain.ArticleSearchParam;
import xyz.refrain.onlineedu.show.domain.ArticleVO;
import xyz.refrain.onlineedu.show.domain.DateCount;
import xyz.refrain.onlineedu.show.mapper.ArticleMapper;
import xyz.refrain.onlineedu.show.service.IArticleService;
import xyz.refrain.onlineedu.utils.IPUtils;
import xyz.refrain.onlineedu.utils.LambdaTypeUtils;
import xyz.refrain.onlineedu.utils.SessionUtils;

import java.util.Date;
import java.util.List;

/**
 * 博客Service业务层处理
 *
 * @author paopao
 * @date 2023-04-29
 */
@Service
public class ArticleServiceImpl implements IArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 查询博客
     *
     * @param id 博客主键
     * @return 博客
     */
    @Override
    public Article selectArticleById(Long id) {
        return articleMapper.selectById(id);
    }

    /**
     * 查询博客列表
     *
     * @param article 博客
     * @return 博客
     */
    @Override
    public List<ArticleVO> selectArticleList(ArticleSearchParam article) {
//        Page<ArticleVO> page = new Page<>(article.getCurrent(), article.getPageSize());
//        QueryWrapper<Object> select = new QueryWrapper<>().select();
//        Wrapper<Article> wrapper = Wrappers.lambdaQuery(Article.class)
//                .eq(Article::getEnable, 1);
        // 分页查询
//        return articleMapper.queryArticleAll(page);
        return articleMapper.queryArticleAll(article);
    }

    @Override
    public IPage<ArticleVO> selectArticlesByUid(ArticleSearchParam article) {
        AclUserDetail aclUser = SessionUtils.getAclUser(IPUtils.getRequest());
        article.setCreateUser(aclUser.getId());
        Page<ArticleVO> page = new Page<>(article.getCurrent(), article.getPageSize());
//        Wrapper<Article> wrapper = Wrappers.lambdaQuery(Article.class)
//                .eq(Article::getCreateUser, aclUser.getId());
        // 分页查询
        return articleMapper.queryArticleByUid(page, article);
    }

    /**
     * 新增博客
     *
     * @param article 博客
     * @return 结果
     */
    @Override
    public int insertArticle(Article article) {
        AclUserDetail aclUser = SessionUtils.getAclUser(IPUtils.getRequest());
        article.setCreateUser(aclUser.getId());
        article.setCreateTime(new Date());
        article.setEnable(0);
        return articleMapper.insert(article);
    }

    /**
     * 修改博客
     *
     * @param article 博客
     * @return 结果
     */
    @Override
    public int updateArticle(Article article) {
        article.setUpdateTime(new Date());
        return articleMapper.updateById(article);
    }

    /**
     * 删除博客信息
     *
     * @param id 博客主键
     * @return 结果
     */
    @Override
    public int deleteArticleById(Long id) {
        return articleMapper.deleteById(id);
    }

    @Override
    public List<DateCount> getArticleDate() {
        return articleMapper.getArticleDate();
    }


}
