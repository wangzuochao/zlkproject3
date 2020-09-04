package com.zlk.zlkproject.community.mapper;

import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.entity.ArticleLabel;
import com.zlk.zlkproject.community.entity.ArticleRefLabel;
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
     * 获取文章总数
     *
     *
     * @return 数量
     */
    Integer countArticle();
}
