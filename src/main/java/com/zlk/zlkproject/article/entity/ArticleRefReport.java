package com.zlk.zlkproject.article.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/10 15:19
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleRefReport {
    /**举报id*/
    private Integer articleRefReportId;
    /**文章id*/
    private Integer articleId;
    /**用户id*/
    private Integer userId;
    /**举报内容*/
    private String report;

    @Override
    public String toString() {
        return "ArticleRefReport{" +
                "articleRefReportId=" + articleRefReportId +
                ", articleId=" + articleId +
                ", userId=" + userId +
                ", report='" + report + '\'' +
                '}';
    }
}
