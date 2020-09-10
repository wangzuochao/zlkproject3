package com.zlk.zlkproject.article.entity;

import com.zlk.zlkproject.user.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author: zhc
 * @time: 2020/9/4 11:39
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleCommentReply {
    /**文章的评论回复id*/
    private Integer comReplyId;
    /**用户id*/
    private Integer userId;
    /**评论id*/
    private Integer commentId;
    /**回复内容*/
    private String comReplyContent;
    /**回复时间*/
    private Date comReplyDate;
    /**DATE TO STRING*/
    private String stringDate;
    /**注入回复用户*/
    private User user;
}
