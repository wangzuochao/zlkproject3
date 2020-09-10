package com.zlk.zlkproject.article.entity;

import com.zlk.zlkproject.user.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @author: zhc
 * @time: 2020/9/3 8:51
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
    /**文章id*/
    private Integer articleId;
    /**作者id*/
    private Integer userId;
    /**栏目id*/
    private Integer programId;
    /**文章标题*/
    private String articleTitle;
    /**文章内容Markdown格式*/
    private String articleContentMarkdown;
    /**文章内容html格式*/
    private String articleContentHtml;
    /**发布时间*/
    private Date articleDate;
    /**点赞数*/
    private Integer likeNum;
    /**踩数*/
    private Integer stampNum;
    /**举报数量*/
    private Integer articleReportNum;
    /**文章图片*/
    private String articleImage;
    /**浏览量*/
    private Integer pageviews;
    /**是否置顶 是 1 否 0 */
    private Integer topStatus;
    /**DATE TO STRING*/
    private String stringDate;
    /**注入标签关联对象*/
    private List<ArticleRefLabel> articleRefLabels;
    /**注入栏目对象*/
    private ArticleProgram articleProgram;
    /**注入用户*/
    private User user;
    /**注入文章评论*/
    private List<ArticleRefComment> articleRefComments;

    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", userId=" + userId +
                ", programId=" + programId +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleContentMarkdown='" + articleContentMarkdown + '\'' +
                ", articleContentHtml='" + articleContentHtml + '\'' +
                ", articleDate=" + articleDate +
                ", likeNum=" + likeNum +
                ", stampNum=" + stampNum +
                ", articleReportNum=" + articleReportNum +
                ", articleImage='" + articleImage + '\'' +
                ", pageviews=" + pageviews +
                ", topStatus=" + topStatus +
                ", stringDate='" + stringDate + '\'' +
                ", articleRefLabels=" + articleRefLabels +
                ", articleProgram=" + articleProgram +
                '}';
    }
}
