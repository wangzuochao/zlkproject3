package com.zlk.zlkproject.article.service;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.article.entity.Article;
import com.zlk.zlkproject.article.entity.ArticleRefReport;

import java.util.List;
import java.util.Map;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleService
 * @package: com.zlk.zlkproject.community.service
 * @author: zhc
 * @date: 2020/9/3 9:15
 */
public interface ArticleService {
    /**
     * 分页显示
     *
     * @param pageIndex 第几页开始
     * @param pageSize  一页显示多少
     * @param userId  用户id
     * @param programId  栏目id
     * @return 文章列表
     */
    PageInfo<Article> pageArticle1(Integer pageIndex, Integer pageSize,Integer userId,Integer programId,Integer labelId);
    /**
     * 根据栏目Id 或标签ID 或全部获取文章总数
     *
     * @param map
     * @return 数量
     */
    Integer countArticle(Map map);
    /**
     * 文章详情页面显示
     *
     * @param id     文章ID
     * @return 文章
     */
    Article getArticleById(Integer id);
    /**
     * 查询热门文章
     *
     *
     * @return 文章列表
     */
    List<Article> findHotArticle(Integer programId);
    /**
     * 根据文章Id更新文章
     *
     * @param article 文章
     */
    Integer updateArticle(Article article);
    /**
     * 添加对一篇文章的举报
     *
     * @param articleRefReport
     * @return 数量
     */
    Integer insertArticleReport(ArticleRefReport articleRefReport);

}
