package com.zlk.zlkproject.article.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/4 11:52
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleRefComment {
    /**文章评论关联id*/
    private Integer articleCommentId;
    /**文章id*/
    private Integer articleId;
    /**评论id*/
    private Integer commentId;
    /**注入评论对象*/
    private ArticleComment articleComment;
}
