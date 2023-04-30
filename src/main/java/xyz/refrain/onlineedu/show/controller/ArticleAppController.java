package xyz.refrain.onlineedu.show.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xyz.refrain.onlineedu.model.vo.R;
import xyz.refrain.onlineedu.show.domain.ArticleSearchParam;
import xyz.refrain.onlineedu.show.service.IArticleService;
import xyz.refrain.onlineedu.utils.RUtils;

/**
 * @Author: paoPao
 * @Date: 2023/4/30
 * @Description:
 */
@RestController
@RequestMapping("/api/app/article")
public class ArticleAppController {
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
     * 查询博客日期
     */
    @GetMapping("/date")
    public R selectDate() {
        return RUtils.success("", articleService.getArticleDate());
    }

    /**
     * 获取博客详细信息
     */
    @GetMapping(value = "/{id}")
    public R getInfo(@PathVariable("id") Long id) {
        return RUtils.success("", articleService.selectArticleById(id));
    }
}
