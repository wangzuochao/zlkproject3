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
        <link rel="stylesheet" href="/layui/css/layui.css" media="all" >
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
        <a class="crumbs" href="/test">
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
    <form  class="layui-form" action="" id="formCustomClick" style="display: none" lay-filter="formCustomFilter">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">举报理由：</label>
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
                                <a href="/article/${article.articleId}#comments"
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

    <script src="/layui/layui.js"></script>

    <script type="text/javascript">


       var articleId = $("#articleDetail").attr("data-id");
       increaseViewCount(articleId);

    </script>

</rapid:override>


<%@ include file="framework.jsp" %>