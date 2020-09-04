package com.zlk.zlkproject.community.service.impl;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.entity.ArticleLabel;
import com.zlk.zlkproject.community.entity.ArticleRefLabel;
import com.zlk.zlkproject.community.mapper.ArticleMapper;
import com.zlk.zlkproject.community.mapper.ArticleRefLabelMapper;
import com.zlk.zlkproject.community.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: zhc
 * @time: 2020/9/3 9:15
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private ArticleRefLabelMapper articleRefLabelMapper;
    @Override
    public PageInfo<Article> pageArticle1(Integer pageIndex, Integer pageSize) {
        Map<String,Object> paraMap = new HashMap<String,Object>();
        Integer pageIndex1 = (pageIndex-1)*pageSize;
        paraMap.put("pageIndex",pageIndex1);
        paraMap.put("pageSize",pageSize);
        List<Article> articleList = articleMapper.findAllLayui(paraMap);
        for (int i = 0; i < articleList.size(); i++) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String tranTime = df.format(articleList.get(i).getArticleDate());
            articleList.get(i).setStringDate(tranTime);
              //封装labelList
            List<ArticleRefLabel> labelList = articleRefLabelMapper.findLabel(articleList.get(i).getArticleId());
            articleList.get(i).setArticleRefLabels(labelList);
            System.out.println(articleList.get(i).toString()+"     ");
            //封装programList
            /*
            Integer articleId=articleList.get(i).getArticleId();
            List<Category> categoryList = categoryMapper.listCategoryByArticleId(articleId);
            // System.out.println(categoryList);
            if (categoryList == null || categoryList.size() == 0) {
                categoryList = new ArrayList<>();
                categoryList.add(Category.Default());
            }
            articleList.get(i).setCategoryList(categoryList);
            */

        }
        return new PageInfo<>(articleList);
    }

    @Override
    public Integer countArticle() {
        return articleMapper.countArticle();
    }
}
