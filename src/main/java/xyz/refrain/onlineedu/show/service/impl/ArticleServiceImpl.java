package xyz.refrain.onlineedu.show.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
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
import xyz.refrain.onlineedu.model.securtiy.EduTeacherDetail;
import xyz.refrain.onlineedu.model.securtiy.UctrMemberDetail;
import xyz.refrain.onlineedu.show.domain.*;
import xyz.refrain.onlineedu.show.mapper.ArticleCommentMapper;
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

    @Autowired
    private ArticleCommentMapper articleCommentMapper;

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
//        EduTeacherDetail teacher = SessionUtils.getTeacher(IPUtils.getRequest());
//        article.setCreateUser(teacher.getId());
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
        article.setCreateTime(DateUtil.date());
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
        article.setUpdateTime(DateUtil.date());
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

    @Override
    public List<Tree<Integer>> selectCommentByBid(Integer articleId) {
        List<ArticleCommentVO> articleCommentVOS = articleCommentMapper.selectCommentByBid(articleId);
        TreeNodeConfig config = new TreeNodeConfig();
        config.setIdKey("id");
        config.setParentIdKey("parentId");
        config.setChildrenKey("children");
        config.setWeightKey("createTime desc");
        List<Tree<Integer>> build = TreeUtil.build(articleCommentVOS, 0, config, (object, treeNode) -> {
            treeNode.putExtra("id", object.getId());
            treeNode.putExtra("articleId", object.getArticleId());
            treeNode.putExtra("commentUser", object.getCommentUser());
            treeNode.putExtra("content", object.getContent());
            treeNode.putExtra("parentId", object.getParentId());
            treeNode.putExtra("createTime", object.getCreateTime());
            treeNode.putExtra("avatar", object.getAvatar());
            treeNode.putExtra("nickname", object.getNickname());
            treeNode.putExtra("toUid", object.getToUid());
            treeNode.putExtra("toNickname", object.getToNickname());
            treeNode.putExtra("commentType", object.getCommentType());
        });
        return build;
    }

    @Override
    public ArticleCommentVO addCommentOne(ArticleComment articleComment) {
        UctrMemberDetail member = SessionUtils.getMember(IPUtils.getRequest());
        articleComment.setCommentUser(member.getId());
        articleComment.setCreateTime(DateUtil.date());
        if(null == articleComment.getParentId()){
            articleComment.setCommentType("0");
        }else{
            if(null == articleComment.getToUid()){
                articleComment.setCommentType("1");
            }else{
                articleComment.setCommentType("2");
            }
        }
        int res = articleCommentMapper.insert(articleComment);
        ArticleCommentVO commentVO = null;
        if (res != 0) {
            commentVO = articleCommentMapper.selectCommentById(articleComment.getId());
        }
        return commentVO;
    }

}
