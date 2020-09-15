package com.zlk.zlkproject.article.mapper;

import com.zlk.zlkproject.article.entity.ArticleCommentRefReply;
import com.zlk.zlkproject.article.entity.ArticleCommentReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleCommentRefReply
 * @package: com.zlk.zlkproject.community.mapper
 * @author: zhc
 * @date: 2020/9/4 14:43
 */
@Mapper
public interface ArticleCommentRefReplyMapper {
    /**
     * 获得评论对应的所有回复
     *
     * @param commentId 评论id
     * @return 回复列表
     */
    List<ArticleCommentRefReply> findComReply(Integer commentId);
    /**
     * 插入新的评论回复
     *
     * @param articleCommentReply 评论回复
     * @return 结果
     */
    Integer insertCommentReply(ArticleCommentReply articleCommentReply);
    /**
     * 获取评论回复的id
     *
     * @param articleCommentReply 评论回复
     * @return 评论回复id
     */
    Integer findReplyId(ArticleCommentReply articleCommentReply);
    /**
     * 插入新评论回复的关联
     *
     * @param articleCommentReply 评论回复
     * @return 结果
     */
    Integer insertCommentRefReply(ArticleCommentReply articleCommentReply);
}
