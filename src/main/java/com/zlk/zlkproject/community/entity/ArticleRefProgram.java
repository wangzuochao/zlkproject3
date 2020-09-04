package com.zlk.zlkproject.community.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/3 11:15
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleRefProgram {
    /**文章栏目关联id*/
    private Integer articleProgramId;
    /**文章id*/
    private Integer articleId;
    /**栏目id*/
    private Integer programId;
    /**注入栏目对象*/
    private ArticleProgram articleProgram;

}
