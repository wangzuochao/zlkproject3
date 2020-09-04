package com.zlk.zlkproject.community.service.impl;

import com.github.pagehelper.PageInfo;
import com.zlk.zlkproject.community.entity.*;
import com.zlk.zlkproject.community.mapper.ArticleCommentRefReplyMapper;
import com.zlk.zlkproject.community.mapper.ArticleMapper;
import com.zlk.zlkproject.community.mapper.ArticleRefCommentMapper;
import com.zlk.zlkproject.community.mapper.ArticleRefLabelMapper;
import com.zlk.zlkproject.community.service.ArticleService;
import com.zlk.zlkproject.user.entity.User;
import com.zlk.zlkproject.user.mapper.UserMapper;
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
    @Autowired
    private ArticleRefCommentMapper articleRefCommentMapper;
    @Autowired
    private ArticleCommentRefReplyMapper articleCommentRefReplyMapper;
    @Autowired
    private UserMapper userMapper;
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

    @Override
    public Article getArticleById(Integer articleId) {
        Article article = articleMapper.getArticleById(articleId);
        if (article != null) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String tranTime = df.format(article.getArticleDate());
            article.setStringDate(tranTime);
            //封装标签
            List<ArticleRefLabel> labelList = articleRefLabelMapper.findLabel(article.getArticleId());
            article.setArticleRefLabels(labelList);
            //封装评论
            List<ArticleRefComment> commentList = articleRefCommentMapper.findComment(article.getArticleId());
            article.setArticleRefComments(commentList);
            for (int i = 0; i < article.getArticleRefComments().size(); i++) {
                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String tranTime1 = df1.format(article.getArticleRefComments().get(i).getArticleComment().getCommentDate());
                article.getArticleRefComments().get(i).getArticleComment().setStringDate(tranTime1);
                User userComment = userMapper.findUserBy(article.getArticleRefComments().get(i).getArticleComment().getUserId());
                article.getArticleRefComments().get(i).getArticleComment().setUser(userComment);
                //封装回复
                List<ArticleCommentRefReply> articleCommentRefReplyList = articleCommentRefReplyMapper.findComReply(article.getArticleRefComments().get(i).getArticleCommentId());
                article.getArticleRefComments().get(i).getArticleComment().setArticleCommentRefReplies(articleCommentRefReplyList);
                for (int i1 = 0; i1 < article.getArticleRefComments().get(i).getArticleComment().getArticleCommentRefReplies().size(); i1++) {
                    DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String tranTime2 = df2.format(article.getArticleRefComments().get(i).getArticleComment().getArticleCommentRefReplies().get(i1).getArticleCommentReply().getComReplyDate());
                    article.getArticleRefComments().get(i).getArticleComment().getArticleCommentRefReplies().get(i1).getArticleCommentReply().setStringDate(tranTime2);
                    User userReply = userMapper.findUserBy(article.getArticleRefComments().get(i).getArticleComment().getArticleCommentRefReplies().get(i1).getArticleCommentReply().getUserId());
                    article.getArticleRefComments().get(i).getArticleComment().getArticleCommentRefReplies().get(i1).getArticleCommentReply().setUser(userReply);
                }
            }
        }
        return article;
    }
}
