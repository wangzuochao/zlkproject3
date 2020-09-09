package com.zlk.zlkproject.community.entity;

import com.zlk.zlkproject.user.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @author: zhc
 * @time: 2020/9/4 11:39
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleComment {
    /**文章评论id*/
    private Integer commentId;
    /**评论用户id*/
    private Integer userId;
    /**文章id*/
    private Integer articleId;
    /**评论内容*/
    private String commentContent;
    /**评论时间*/
    private Date commentDate;
    /**DATE TO STRING*/
    private String stringDate;
    /**注入评论回复关联*/
    private List<ArticleCommentRefReply> articleCommentRefReplies;
    /**注入评论用户*/
    private User user;
}
