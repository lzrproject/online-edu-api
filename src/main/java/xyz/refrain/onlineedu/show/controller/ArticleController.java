package xyz.refrain.onlineedu.show.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.refrain.onlineedu.model.securtiy.AclUserDetail;
import xyz.refrain.onlineedu.model.vo.R;
import xyz.refrain.onlineedu.show.domain.Article;
import xyz.refrain.onlineedu.show.domain.ArticleSearchParam;
import xyz.refrain.onlineedu.show.service.IArticleService;
import xyz.refrain.onlineedu.utils.IPUtils;
import xyz.refrain.onlineedu.utils.RUtils;
import xyz.refrain.onlineedu.utils.SessionUtils;

/**
 * 博客Controller
 *
 * @author paopao
 * @date 2023-04-29
 */
@RestController
@RequestMapping("/api/admin/article")
public class ArticleController {
    @Autowired
    private IArticleService articleService;

    /**
     * 查询博客列表(全部)
     */
    @GetMapping("/list")
    public R list(ArticleSearchParam article) {
        return RUtils.success("", articleService.selectArticleList(article));
    }

    /**
     * 查询博客列表(根据用户)
     */
    @GetMapping("/listByUid")
    public R listByUid(ArticleSearchParam article) {
        return RUtils.success("", articleService.selectArticlesByUid(article));
    }

    /**
     * 获取博客详细信息
     */
    @GetMapping(value = "/{id}")
    public R getInfo(@PathVariable("id") Long id) {
        return RUtils.success("", articleService.selectArticleById(id));
    }

    /**
     * 新增博客
     */
    @PostMapping
    public R add(@RequestBody Article article) {
        return RUtils.success("", articleService.insertArticle(article));
    }

    /**
     * 修改博客
     */
    @PutMapping
    public R edit(@RequestBody Article article) {
        return RUtils.success("", articleService.updateArticle(article));
    }

    /**
     * 删除博客
     */
    @DeleteMapping("/{id}")
    public R remove(@PathVariable Long id) {
        return RUtils.success("", articleService.deleteArticleById(id));
    }

    /**
     * 发布博客
     */
    @GetMapping("/enable/{statusId}")
    public R enable(@PathVariable Integer statusId) {
        AclUserDetail aclUser = SessionUtils.getAclUser(IPUtils.getRequest());
        Article article = new Article();
        article.setEnable(statusId);
        article.setId(aclUser.getId());
        return RUtils.success("", articleService.updateArticle(article));
    }

    /**
     * 下线博客
     */
    @GetMapping("/disable/{statusId}")
    public R disable(@PathVariable Integer statusId) {
        AclUserDetail aclUser = SessionUtils.getAclUser(IPUtils.getRequest());
        Article article = new Article();
        article.setEnable(statusId);
        article.setId(aclUser.getId());
        return RUtils.success("", articleService.updateArticle(article));
    }
}
