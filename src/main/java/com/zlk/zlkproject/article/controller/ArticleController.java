package com.zlk.zlkproject.article.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.article.entity.Article;
import com.zlk.zlkproject.article.service.ArticleService;
import com.zlk.zlkproject.label.entity.Label;
import com.zlk.zlkproject.label.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    private LabelService labelService;
    /**
     *
     * 判断用户是否登录
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 10:44
     */

    /*
    @RequestMapping("/isLoginOrNo")
    public Integer isLogin(HttpServletRequest request){

        //获取登录信息     request.getSession().setAttribute("loginUser", user);
        User user=(User)request.getSession().getAttribute("loginUser");
        if(user==null){
           return -1;
        }else{

            //若已登录，跳转
            return 1;
        }
    }
    */

    /**
     *
     * 流加载查询全部文章或我的文章列表
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 8:39
     */

    @RequestMapping("/flow")
    @ResponseBody
    public Map<String,Object> flow(Integer page, Integer limit,Integer programId)throws Exception{
//添加userId的获取方法
        Integer userId = null;
        //System.out.println(programId);
        //文章列表
        PageInfo<Article> articleList = articleService.pageArticle1(page,limit,userId,programId);
        Integer pages = articleService.countArticle(programId)/limit+1;
        // System.out.println(articleService.countArticle(1));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("data",articleList);
        map.put("pages",pages);
        map.put("islogin",0);
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
        //热门文章信息
        List<Article> articleList = articleService.findHotArticle(null);
        model.addAttribute("hotArticleList",articleList);
        //获取所有标签
        List<Label> labels = labelService.selectAllLabel();
        model.addAttribute("labelList",labels);
        //评论列表
        //List<Comment> commentList = commentService.listCommentByArticleId(articleId);
        //model.addAttribute("commentList", commentList);


        return "article/articleDetail";
    }
    /**
     *
     * 查询文章(根据栏目变化而改变 排序按照点赞数降序排列)
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 14:49
     */
    @RequestMapping("/articleProgram/{programId}")
    @ResponseBody
    public Object hotArticle(@PathVariable("programId") Integer programId){
        //System.out.println(programId);

        //文章列表
        List<Article> articleList = articleService.findHotArticle(programId);
        return articleList;
    }
    /**
     *
     * 查询主页面的热门文章
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 15:29
     */
    @RequestMapping("/hotArticle")
    public String hotArticle1(Model model){
        Integer programId = null;
        //文章列表
        List<Article> articleList = articleService.findHotArticle(programId);
        model.addAttribute("hotArticleList",articleList);
        return "article/sidebar-2";
    }

    /**
     * 文章访问量数增加
     *
     * @param id 文章ID
     * @return 访问量数量
     */
    @RequestMapping(value = "/article/view/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public String increaseViewCount(@PathVariable("id") Integer id) {
        Article article = articleService.getArticleById(id);
        Integer articleViewCount = article.getPageviews() + 1;
        article.setPageviews(articleViewCount);
        Integer num = articleService.updateArticle(article);
        System.out.println(num);
        return JSON.toJSONString(articleViewCount);

    }
    /**
     * 点赞增加
     *
     * @param id 文章ID
     * @return 点赞量数量
     */
    @RequestMapping(value = "/article/like/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public String increaseLikeCount(@PathVariable("id") Integer id) {
        Article article = articleService.getArticleById(id);
        Integer articleLikeCount = article.getLikeNum() + 1;
        article.setLikeNum(articleLikeCount);
        Integer num = articleService.updateArticle(article);
        System.out.println(num);
        return JSON.toJSONString(articleLikeCount);
    }
    /**
     * 踩增加
     *
     * @param id 文章ID
     * @return 踩数量
     */
    @RequestMapping(value = "/article/stamp/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public String increaseStampCount(@PathVariable("id") Integer id) {
        Article article = articleService.getArticleById(id);
        Integer articleStampCount = article.getStampNum() + 1;
        article.setStampNum(articleStampCount);
        Integer num = articleService.updateArticle(article);
        System.out.println(num);
        return JSON.toJSONString(articleStampCount);
    }
    /**
     * 举报增加
     *
     * @param id 文章ID
     * @return 举报数量
     */
    @RequestMapping(value = "/article/report/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public String increaseReportCount(@PathVariable("id") Integer id) {
        Article article = articleService.getArticleById(id);
        Integer articleReportCount = article.getArticleReportNum() + 1;
        article.setArticleReportNum(articleReportCount);
        Integer num = articleService.updateArticle(article);
        System.out.println(num);
        return JSON.toJSONString(articleReportCount);
    }
}
