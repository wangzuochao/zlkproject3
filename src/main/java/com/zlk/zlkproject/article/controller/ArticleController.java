package com.zlk.zlkproject.article.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.article.entity.Article;
import com.zlk.zlkproject.article.entity.ArticleComment;
import com.zlk.zlkproject.article.entity.ArticleCommentReply;
import com.zlk.zlkproject.article.entity.ArticleRefReport;
import com.zlk.zlkproject.article.service.ArticleCommentService;
import com.zlk.zlkproject.article.service.ArticleService;
import com.zlk.zlkproject.label.entity.Label;
import com.zlk.zlkproject.label.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
    @Autowired
    private ArticleCommentService articleCommentService;
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
     * 流加载查询全部文章或我的文章列表
     * 根据栏目查询文章列表
     *
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 8:39
     */

    @RequestMapping("/flow")
    @ResponseBody
    public Map<String, Object> flow(Integer page, Integer limit, Integer programId) throws Exception {
        //添加userId的获取方法
        Integer userId = null;
        Integer labelId = null;
        //System.out.println(programId);
        //文章列表
        PageInfo<Article> articleList = articleService.pageArticle1(page, limit, userId, programId, labelId);
        Map<String, Object> map1 = new HashMap<String, Object>();
        map1.put("programId", programId);
        Integer pages = articleService.countArticle(map1) / limit + 1;
        System.out.println(pages);
        // System.out.println(articleService.countArticle(1));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", articleList);
        map.put("pages", pages);
        map.put("islogin", 0);
        return map;
    }

    /**
     * 根据标签查询文章列表
     *
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 8:39
     */

    @RequestMapping("/flowByLabel")
    @ResponseBody
    public Map<String, Object> flowByLabel(Integer page, Integer limit, Integer labelId) throws Exception {
        //添加userId的获取方法
        Integer userId = null;
        Integer programId = null;
        //System.out.println(labelId);
        //文章列表
        PageInfo<Article> articleList = articleService.pageArticle1(page, limit, userId, programId, labelId);
        Map<String, Object> map1 = new HashMap<String, Object>();
        map1.put("labelId", labelId);
        Integer pages = articleService.countArticle(map1) / limit + 1;
        // System.out.println(articleService.countArticle(1));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", articleList);
        map.put("pages", pages);
        map.put("islogin", 0);
        return map;
    }

    /**
     * 一篇文章详情页显示
     *
     * @param articleId 文章ID
     * @return jsp
     */
    @RequestMapping(value = "/article/{articleId}")
    public String getArticleDetailPage(@PathVariable("articleId") Integer articleId, Model model) {

        //文章信息，分类，标签，作者，评论
        Article article = articleService.getArticleById(articleId);
        //文章信息
        model.addAttribute("article", article);
        //热门文章信息
        List<Article> articleList = articleService.findHotArticle(null);
        model.addAttribute("hotArticleList", articleList);
        //获取所有标签
        List<Label> labels = labelService.selectAllLabel();
        model.addAttribute("labelList", labels);
        //评论列表
        //List<Comment> commentList = commentService.listCommentByArticleId(articleId);
        //model.addAttribute("commentList", commentList);


        return "article/articleDetail";
    }

    /**
     * 查询文章(根据栏目变化而改变 排序按照点赞数降序排列)
     *
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 14:49
     */
    @RequestMapping("/articleProgram/{programId}")
    @ResponseBody
    public Object hotArticle(@PathVariable("programId") Integer programId) {
        //System.out.println(programId);

        //文章列表
        List<Article> articleList = articleService.findHotArticle(programId);
        return articleList;
    }

    /**
     * 查询主页面的热门文章
     *
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/9/7 15:29
     */
    @RequestMapping("/hotArticle")
    public String hotArticle1(Model model) {
        Integer programId = null;
        //文章列表
        List<Article> articleList = articleService.findHotArticle(programId);
        model.addAttribute("hotArticleList", articleList);
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
     * @param
     * @return 举报数量
     */
    @RequestMapping(value = "/article/reportArticle", method = {RequestMethod.POST})
    @ResponseBody
    public String increaseReportCount(@RequestBody ArticleRefReport report) {
        System.out.println(report.toString());
        Integer flag = 0;
        if (report.getReport() != null && report.getReport() != "") {
            flag = articleService.insertArticleReport(report);
        }
        //Article article = articleService.getArticleById(custom.getArticleId());
        //Integer articleReportCount = article.getArticleReportNum() + 1;
        // article.setArticleReportNum(articleReportCount);
        //Integer num = articleService.updateArticle(article);
        //System.out.println(num);

        return String.valueOf(flag);
    }

    /**
     * '添加评论回复
     *
     * @param articleCommentReply
     */
    @RequestMapping(value = "/commentReply", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> insertComment(HttpServletRequest request, ArticleCommentReply articleCommentReply) {

        //添加评论
        articleCommentReply.setComReplyDate(new Date());
        System.out.println(articleCommentReply.toString());
        articleCommentReply.setUserId(1);
        //articleCommentReply.setUserId();
//        if (request.getSession().getAttribute("user") != null) {
//            comment.setCommentRole(Role.ADMIN.getValue());
//        } else {
//            comment.setCommentRole(Role.VISITOR.getValue());
//        }
        if (articleCommentReply.getCommentId() != null) {
            //插入文章评论回复表
            articleCommentService.insertCommentReply(articleCommentReply);
            //插入文章评论回复关联表
            articleCommentService.insertCommentRefReply(articleCommentReply);
//            commentService.insertComment(comment);
//            //更新文章的评论数
//            Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), comment.getCommentArticleId());
//            articleService.updateCommentCount(article.getArticleId());
        } else {
            ArticleComment articleComment = new ArticleComment();
            articleComment.setUserId(1);
            articleComment.setCommentId(articleCommentReply.getCommentId());
            articleComment.setArticleId(articleCommentReply.getArticleId());
            articleComment.setCommentDate(new Date());
            articleComment.setCommentContent(articleCommentReply.getComReplyContent());
            //插入文章评论表
            articleCommentService.insertComment(articleComment);
            //插入文章评论关联表
            articleCommentService.insertCommentRef(articleComment);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        return map;
    }
}
