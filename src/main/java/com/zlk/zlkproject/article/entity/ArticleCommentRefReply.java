package com.zlk.zlkproject.article.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/4 11:53
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleCommentRefReply {
    /**文章评论回复关联id*/
    private Integer commentReplyId;
    /**评论id*/
    private Integer commentId;
    /**评论回复id*/
    private Integer comReplyId;
    /**注入回复*/
    private ArticleCommentReply articleCommentReply;
}
