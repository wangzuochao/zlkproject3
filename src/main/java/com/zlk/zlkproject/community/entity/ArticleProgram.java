package com.zlk.zlkproject.community.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: zhc
 * @time: 2020/9/3 11:13
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArticleProgram {
    /**栏目id*/
    private Integer programId;
    /**栏目名称*/
    private String programName;
}
