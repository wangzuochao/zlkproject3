package com.zlk.zlkproject.community.mapper;

import com.zlk.zlkproject.community.entity.ArticleCommentRefReply;
import com.zlk.zlkproject.community.entity.ArticleRefComment;
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
}
