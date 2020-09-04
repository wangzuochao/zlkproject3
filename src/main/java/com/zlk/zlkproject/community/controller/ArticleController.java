package com.zlk.zlkproject.community.controller;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: zhc
 * @time: 2020/9/3 9:13
 */
@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @RequestMapping("/flow")
    @ResponseBody
    public Map<String,Object> flow(Integer page, Integer limit)throws Exception{
        //文章列表
        PageInfo<Article> articleList = articleService.pageArticle1(page,limit);
        Integer pages = articleService.countArticle()/limit+1;
        // System.out.println(articleService.countArticle(1));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",articleList);
        map.put("pages",pages);
        return map;
    }

}
