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
public class ArticleLabel {
    /**标签id*/
    private Integer labelId;
    /**标签名称*/
    private String labelName;
}
