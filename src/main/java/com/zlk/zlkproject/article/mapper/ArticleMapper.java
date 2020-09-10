package com.zlk.zlkproject.article.mapper;

import com.zlk.zlkproject.article.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleMapper
 * @package: com.zlk.zlkproject.community.mapper
 * @author: zhc
 * @date: 2020/9/3 9:16
 */
@Mapper
public interface ArticleMapper {
    /**
     * 获得所有的文章
     *
     * @param map 分页条件
     * @return 文章列表
     */
    List<Article> findAllLayui(Map map);
    /**
     * 获得文章对应的所有标签
     *
     * @param articleId 文章id
     * @return 标签列表
     */
    //List<ArticleLabel> findLabel(Integer articleId);
    /**
     * 根据栏目Id获取文章总数
     *
     *
     * @return 数量
     */
    Integer countArticle(Integer programId);
    /**
     * 根据id查询带用户的文章信息
     *
     * @param articleId 文章ID
     * @return 文章
     */
    Article getArticleById( @Param(value = "articleId") Integer articleId);
    /**
     * 查询热门文章
     *
     * @param programId 栏目ID
     * @return 文章标题列表
     */
    List<Article> findHotArticle(Integer programId);
    /**
     * 更新文章
     *
     * @param article 文章
     * @return 影响行数
     */
    Integer updateArticle(Article article);
}
