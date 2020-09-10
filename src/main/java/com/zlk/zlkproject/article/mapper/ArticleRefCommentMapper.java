package com.zlk.zlkproject.article.mapper;

import com.zlk.zlkproject.article.entity.ArticleRefComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleCommentMapper
 * @package: com.zlk.zlkproject.community.mapper
 * @author: zhc
 * @date: 2020/9/4 13:35
 */
@Mapper
public interface ArticleRefCommentMapper {
    /**
     * 获得文章对应的所有评论
     *
     * @param articleId 文章id
     * @return 评论列表
     */
    List<ArticleRefComment> findComment(Integer articleId);
}
