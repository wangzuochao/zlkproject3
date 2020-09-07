package com.zlk.zlkproject.community.controller;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.service.ArticleService;
import com.zlk.zlkproject.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: zhc
 * @time: 2020/9/3 9:13
 */
@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    /**
     *
     * //判断用户是否登录
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 10:44
     */
    @RequestMapping("/isLoginOrNo")
    public String isLogin(HttpServletRequest request){

        //获取登录信息     request.getSession().setAttribute("loginUser", user);
        User user=(User)request.getSession().getAttribute("loginUser");
        if(user==null){
           return"articleDetail";
        }else{

            //若已登录，跳转
            return "article";
        }
    }
    /**
     *
     * 流加载查询全部文章列表
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 8:39
     */
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

    /**
     * 一篇文章详情页显示
     *
     * @param articleId 文章ID
     * @return modelAndView
     */
    @RequestMapping(value = "/article/{articleId}")
    public String getArticleDetailPage(@PathVariable("articleId") Integer articleId, Model model) {

        //文章信息，分类，标签，作者，评论
        Article article = articleService.getArticleById(articleId);


        //文章信息
        model.addAttribute("article", article);

        //评论列表
        //List<Comment> commentList = commentService.listCommentByArticleId(articleId);
        //model.addAttribute("commentList", commentList);


        return "articleDetail";
    }

}
