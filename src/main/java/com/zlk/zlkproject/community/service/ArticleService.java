package com.zlk.zlkproject.community.service;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.community.entity.Article;

import java.util.HashMap;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleService
 * @package: com.zlk.zlkproject.community.service
 * @author: zhc
 * @date: 2020/9/3 9:15
 */
public interface ArticleService {
    /**
     * 分页显示
     *
     * @param pageIndex 第几页开始
     * @param pageSize  一页显示多少
     * @return 文章列表
     */
    PageInfo<Article> pageArticle1(Integer pageIndex, Integer pageSize);
    /**
     * 获取文章总数
     *
     * @param
     * @return 数量
     */
    Integer countArticle();
}
