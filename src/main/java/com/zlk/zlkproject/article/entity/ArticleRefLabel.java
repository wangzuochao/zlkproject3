package com.zlk.zlkproject.article.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/3 11:14
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleRefLabel {
    /**文章标签关联id*/
    private Integer articleLabelId;
    /**文章id*/
    private Integer articleId;
    /**标签id*/
    private Integer labelId;
    /**注入标签对象*/
    private ArticleLabel articleLabel;

}
