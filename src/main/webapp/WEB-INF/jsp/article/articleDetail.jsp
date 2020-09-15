<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/9/7
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    <title>${article.articleTitle}</title>
</rapid:override>

<rapid:override name="header-style">
    <rapid:override name="header-style">
        <link rel="stylesheet" href="/articleDetailModel/css/highlight.css">
        <link rel="stylesheet" href="/layui/css/layui.css" media="all">
        <style>
            .entry-title {
                background: #f8f8f8;
            }
        </style>
    </rapid:override>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/community">
            <i class="fa fa-home"></i>首页
        </a>
        <c:choose>
            <c:when test="${article.articleProgram != null}">
                <i class="fa fa-angle-right"></i>
                <a href="/articleByProgram?programId=${article.articleProgram.programId}">
                        ${article.articleProgram.programName}
                </a>
            </c:when>
            <c:otherwise>
                <i class="fa fa-angle-right"></i>
                <a>未分类</a>
            </c:otherwise>
        </c:choose>
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">
    <%--    举报弹出框--%>
    <form class="layui-form" action="" id="formCustomClick" style="display: none" lay-filter="formCustomFilter">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 110px"><span style="color: red">*</span>举报理由：</label>
                <div class="layui-input-block">
                    <textarea id="c10" name="note" style="display: none;"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="customClick">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <%--博客主体-左侧文章正文 start--%>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" id="articleDetail" data-id="${article.articleId}">
                <header class="entry-header">
                    <h1 class="entry-title">
                            ${article.articleTitle}
                    </h1>
                </header><!-- .entry-header -->
                <div class="entry-content">
                    <div class="single-content">
                            ${article.articleContentHtml}
                    </div>
                    <div class="clear"></div>
                    <div id="social">
                        <div class="social-main">
                            <span class="like">
                                <a href="javascript:;" data-action="ding" data-id="1" title="点赞"
                                   class="favorite" onclick="increaseLikeCount()">
                                    <i class="fa fa-thumbs-up">&nbsp;&nbsp;</i>赞
                                    <i class="likeCount"
                                       id="count-${article.articleId}">${article.likeNum}</i>
                                </a>
                            </span>
                            <div class="shang-p">
                                <div class="shang-empty"><span></span></div>
                                <span class="shang-s">
                                    <a href="javascript:;" data-action="ding" data-id="2" title="举报"
                                       class="favorite" onclick="increaseReportCount()">
                                    <i class="fa fa-exclamation-circle fa-3x"></i>
                                </a>
                                </span>
                            </div>
                            <div class="share-sd">
                                <span class="share-s" style="margin-top: 25px!important;">
                                            <a href="javascript:;" data-action="ding" data-id="3" title="踩"
                                               class="favorite" onclick="increaseStampCount()">
                                    <i class="fa fa-thumbs-down">&nbsp;&nbsp;</i>踩
                                    <i class="stampCount"
                                       id="count-${article.articleId}">${article.stampNum}</i>
                                </a>
                                        </span>

                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <li class="comment">
                                <a href="#comments"
                                   rel="external nofollow">
                                    <i class="fa fa-comment-o"></i>
                                    <i class="comment-count">${article.articleRefComments.size()}</i>
                                </a>
                            </li>
                            <li class="views">
                                <i class="fa fa-eye"></i> <span
                                    class="articleViewCount">${article.pageviews}</span>
                                views
                            </li>
                            <li class="r-hide">
                                <a href="javascript:pr()" title="侧边栏">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                        <div class="single-cat-tag">
                            <div class="single-cat">所属分类：
                                <a href="/articleByProgram?programId=${article.articleProgram.programId}">
                                        ${article.articleProgram.programName}
                                </a>
                            </div>
                        </div>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article><!-- #post -->

                <%--所属标签 start--%>
            <div class="single-tag">
                <ul class="" data-wow-delay="0.3s">
                    <c:forEach items="${article.articleRefLabels}" var="t">
                        <li>
                            <a href="/articleByLabel?labelId=${t.articleLabel.labelId}" rel="tag"
                               style="background:#666666" target="pageTarget2">
                                    ${t.articleLabel.labelName}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
                <%--所属标签 end--%>


                <%--版权声明 start--%>
            <div class="authorbio wow fadeInUp">
                <img alt="${article.user.userName}" src="${article.user.imgUrl}"
                     class="avatar avatar-64 photo" height="64" width="64">
                <ul class="postinfo">
                    <li></li>
                    <li><strong>版权声明：</strong>本站原创文章，于${article.stringDate}，由
                        <strong>
                                ${article.user.userName}
                        </strong>
                        发表。
                    </li>
                    <li class="reprinted"><strong>转载请注明：</strong>
                        <a href="/article/${article.articleId}"
                           rel="bookmark"
                           title="本文固定链接 /article/${article.articleId}">
                                ${article.articleTitle} </a>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>
                <%--版权声明 end--%>
                <%--评论区域 start--%>
            <div class="scroll-comments"></div>
            <div id="comments" class="comments-area">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title"><span id="reply-title-word">发表评论</span>
                        <a rel="nofollow" id="cancel-comment-reply-link"
                           href="/article/${article.articleId}#respond"
                           style="">取消回复</a>
                    </h3>
                    <form id="comment_form" method="post">
<%--                        <c:if test="${sessionScope.user!=null}">--%>
<%--                            <div class="user_avatar">--%>
<%--                                <img alt="言曌"--%>
<%--                                     src="${sessionScope.user.userAvatar}"--%>
<%--                                     class="avatar avatar-64 photo" height="64" width="64">--%>
<%--                                登录者：${sessionScope.user.userNickname}--%>
<%--                                <br> <a href="javascript:void(0)" onclick="logout()">登出</a>--%>
<%--                                <input type="hidden" name="commentRole" value="1">--%>
<%--                                <input type="hidden" name="commentAuthorName"--%>
<%--                                       value="${sessionScope.user.getUserNickname()}">--%>
<%--                                <input type="hidden" name="commentAuthorEmail"--%>
<%--                                       value="${sessionScope.user.getUserEmail()}">--%>
<%--                                <input type="hidden" name="commentAuthorUrl" value="${sessionScope.user.getUserUrl()}">--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
                        <p class="comment-form-comment">
                            <textarea id="comment" name="comReplyContent" rows="4" tabindex="1" required></textarea>
                        </p>
                        <div id="comment-author-info">
                            <input type="hidden" name="commentId" value=''>
                            <input type="hidden" name="userId" value=''>
<%--                            <c:if test="${sessionScope.user == null}">--%>
<%--                                <input type="hidden" name="commentRole" value="0">--%>
<%--                                <p class="comment-form-author">--%>
<%--                                    <label for="author_name">--%>
<%--                                        昵称<span class="required">*</span>--%>
<%--                                    </label>--%>
<%--                                    <input type="text" name="commentAuthorName" id="author_name" class="" value=""--%>
<%--                                           tabindex="2" required>--%>
<%--                                </p>--%>
<%--                                <p class="comment-form-email">--%>
<%--                                    <label for="author_email">--%>
<%--                                        邮箱<span class="required">*</span>--%>
<%--                                    </label>--%>
<%--                                    <input type="email" name="commentAuthorEmail" id="author_email" class="" value=""--%>
<%--                                           tabindex="3" required>--%>
<%--                                </p>--%>
<%--                                <p class="comment-form-url">--%>
<%--                                    <label for="author_url">网址</label>--%>
<%--                                    <input type="url" name="commentAuthorUrl" id="author_url" class="" value=""--%>
<%--                                           tabindex="4">--%>
<%--                                </p>--%>
<%--                            </c:if>--%>
                        </div>
                        <div class="clear"></div>
                        <p class="form-submit">
                            <input id="submit" name="submit" type="submit" tabindex="5" value="提交评论">
                            <input type="hidden" name="articleId"
                                   value="${article.articleId}" id="article_id">
<%--                            <input type="hidden" name="commentPid" id="comment_pid" value="0">--%>
                        </p>
                    </form>
                </div>
                <ol class="comment-list">
                    <c:set var="floor" value="0"/>
                    <c:forEach items="${article.articleRefComments}" var="c">
                        <c:set var="floor" value="${floor + 1}"/>
                        <li class="comments-anchor">
                            <ul id="anchor-comment-${c.commentId}"></ul>
                        </li>
                        <li class="comment">
                            <div id="div-comment-${c.commentId}" class="comment-body">
                                <div class="comment-author vcard">
                                    <img class="avatar" src="${c.articleComment.user.imgUrl}" alt="avatar"
                                         style="display: block;">
                                    <strong>${c.articleComment.user.userName} </strong>
                                    <c:if test="${c.articleComment.user.userId ==article.userId}">
                                        <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                        <span class=""
                                              style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>文章发表者</b></span>
                                    </c:if>
                                    <span class="comment-meta commentmetadata">
                                            <span class="ua-info" style="display: inline;">
                                                <br>
                                                <span class="comment-aux">
                                                    <span class="reply">
                                                        <a rel="nofollow" class="comment-reply-link" href="#respond"
                                                           onclick="">回复
                                                        </a>
                                                    </span>
                                                    ${c.articleComment.stringDate}
<%--                                                    <c:if test="${sessionScope.user != null}">--%>
<%--                                                        <a href="javascript:void(0)"--%>
<%--                                                           onclick="deleteComment(${c.commentId})">删除</a>--%>
<%--                                                        <a class="comment-edit-link"--%>
<%--                                                           href="/admin/comment/edit/${c.commentId}"--%>
<%--                                                           target="_blank">编辑</a>--%>
<%--                                                    </c:if>--%>
                                                    <span class="floor"> &nbsp;${floor}楼 </span>
                                                </span>
                                            </span>
                                        </span>
                                    <p>
                                            <%--                                            <c:if test="${c.commentPid!=0}">--%>
                                            <%--                                                <span class="at">@ ${c.commentPname}</span>--%>
                                            <%--                                            </c:if>--%>
                                            ${c.articleComment.commentContent}
                                    </p>
                                </div>
                            </div>
                            <ul class="children">
                                <c:set var="floor2" value="0"/>
                                <c:forEach items="${c.articleComment.articleCommentRefReplies}" var="c2">
                                    <c:set var="floor2" value="${floor2+1}"/>
                                    <li class="comments-anchor">
                                        <ul id="anchor-comment-${c2.comReplyId}"></ul>
                                    </li>
                                    <li class="comment">
                                        <div id="div-comment-${c.commentId}" class="comment-body">
                                            <div class="comment-author vcard">
                                                <img class="avatar" src="${c2.articleCommentReply.user.imgUrl}"
                                                     alt="avatar"
                                                     style="display: block;">
                                                <input type="hidden" value=${c2.articleCommentReply.user.userId}>
                                                <strong>${c2.articleCommentReply.user.userName} </strong>
                                                <c:if test="${c2.articleCommentReply.user.userId ==article.userId}">
                                                    <i class="fa fa-user-circle-o" style="color: #c40000;"></i>
                                                    <span class=""
                                                          style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>作者</b></span>
                                                </c:if>
                                                <span class="comment-meta">
                                                    <span class="ua-info" style="display: inline;">
                                                    <br>
                                                    <span class="comment-aux">
<%--                                                        <span class="reply">--%>
<%--                                                            <a rel="nofollow" class="comment-reply-link" href="#respond"--%>
<%--                                                               onclick="">回复--%>
<%--                                                            </a>--%>
<%--                                                        </span>--%>
                                                        ${c2.articleCommentReply.stringDate}
<%--                                                        <c:if test="${sessionScope.user != null}">--%>
<%--                                                            <a href="javascript:void(0)"--%>
<%--                                                               onclick="deleteComment(${c2.commentId})">删除</a>--%>
<%--                                                            <a class="comment-edit-link"--%>
<%--                                                               href="/admin/comment/edit/${c2.commentId}"--%>
<%--                                                               target="_blank">编辑</a>--%>
<%--                                                        </c:if>--%>
                                                        <span class="floor"> &nbsp;${floor2}层 </span>
                                                    </span>
                                                </span>
                                                    </span>
                                                <p>
                                                    <span class="at">@ ${c.articleComment.user.userName}</span>
                                                        ${c2.articleCommentReply.comReplyContent}
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ol>
            </div>
                <%--评论框 end--%>


        </main>
        <!-- .site-main -->
    </div>
    <%--博客主体-左侧文章正文end--%>
</rapid:override>


<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="sidebar-1.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">
    <script src="/articleDetailModel/js/jquery.cookie.js"></script>

    <%-- <script src="/layui/layui.js"></script>--%>

    <script type="text/javascript">


        var articleId = $("#articleDetail").attr("data-id");
        increaseViewCount(articleId);

    </script>

</rapid:override>


<%@ include file="framework.jsp" %>