package com.zlk.zlkproject.community.mapper;

import com.zlk.zlkproject.community.entity.ArticleRefLabel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 〈功能概述〉<br>
 *
 * @className: ArticleRefMapper
 * @package: com.zlk.zlkproject.community.mapper
 * @author: zhc
 * @date: 2020/9/3 16:26
 */
@Mapper
public interface ArticleRefLabelMapper {
    /**
     * 获得文章对应的所有标签
     *
     * @param articleId 文章id
     * @return 标签列表
     */
    List<ArticleRefLabel> findLabel(Integer articleId);
}
