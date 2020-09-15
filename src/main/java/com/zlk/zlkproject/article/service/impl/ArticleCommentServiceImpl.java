package com.zlk.zlkproject.article.service.impl;

import com.zlk.zlkproject.article.entity.ArticleComment;
import com.zlk.zlkproject.article.entity.ArticleCommentReply;
import com.zlk.zlkproject.article.mapper.ArticleCommentRefReplyMapper;
import com.zlk.zlkproject.article.mapper.ArticleRefCommentMapper;
import com.zlk.zlkproject.article.service.ArticleCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: zhc
 * @time: 2020/9/14 16:17
 */
@Service
public class ArticleCommentServiceImpl implements ArticleCommentService {
    @Autowired
    private ArticleCommentRefReplyMapper articleCommentRefReplyMapper;
    @Autowired
    private ArticleRefCommentMapper articleRefCommentMapper;

    @Override
    public void insertCommentReply(ArticleCommentReply articleCommentReply) {

        //插入评论回复
              articleCommentRefReplyMapper.insertCommentReply(articleCommentReply);
                //获得评论回复的自增id
                // articleCommentRefReplyMapper.findReplyId(articleCommentReply);
                //articleCommentReply.setComReplyId(comment.getComReplyId());
                //插入评论回复关联
               // articleCommentRefReplyMapper.insertCommentRefReply(articleCommentReply);
    }

    @Override
    public Integer findReplyId(ArticleCommentReply articleCommentReply) {
        return articleCommentRefReplyMapper.findReplyId(articleCommentReply);
    }

    @Override
    public void insertCommentRefReply(ArticleCommentReply articleCommentReply) {
        articleCommentRefReplyMapper.insertCommentRefReply(articleCommentReply);
    }

    @Override
    public void insertComment(ArticleComment articleComment) {
        articleRefCommentMapper.insertComment(articleComment);
    }

    @Override
    public void insertCommentRef(ArticleComment articleComment) {
        articleRefCommentMapper.insertCommentRef(articleComment);
    }
}
