package com.zlk.zlkproject.article.service;

import com.zlk.zlkproject.article.entity.ArticleComment;
import com.zlk.zlkproject.article.entity.ArticleCommentReply;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleCommentService
 * @package: com.zlk.zlkproject.article.service
 * @author: zhc
 * @date: 2020/9/14 16:17
 */
public interface ArticleCommentService {
    /**
     * 添加评论回复
     *
     * @param articleCommentReply 评论回复
     */
    void insertCommentReply(ArticleCommentReply articleCommentReply);
    /**
     * 查询新添加评论回复的自增id
     *
     * @param articleCommentReply 评论回复
     */
    Integer findReplyId(ArticleCommentReply articleCommentReply);
    /**
     * 添加评论回复关联
     *
     * @param articleCommentReply 评论回复
     */
    void insertCommentRefReply(ArticleCommentReply articleCommentReply);
    /**
     * 添加评论
     *
     * @param articleComment 评论
     */
    void insertComment(ArticleComment articleComment);
    /**
     * 添加评论关联
     *
     * @param articleComment 评论
     */
    void insertCommentRef(ArticleComment articleComment);
}
