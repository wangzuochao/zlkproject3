<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/9/9
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <title>热门文章</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="max-age=72000"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/articleDetailModel/css/style.css">
    <script src="/articleDetailModel/js/jquery.min.js"></script>
    <script src="/articleDetailModel/js/superfish.js"></script>
    <script src='/articleDetailModel/js/sticky.js'></script>
    <script src="/articleDetailModel/js/script.js"></script>
    <script src="/articleDetailModel/plugin/layui/layui.all.js"></script>
    <style>
        body{
            background-color: white;
        }

    </style>
</head>
<body>
<div class="widget-sidebar-2 hot_comment">
<div id="hot_comment_widget">
<%--    热门文章--%>
    <ul>

        <c:forEach items="${hotArticleList}" var="m">
            <li>
                            <span id="hot_article_user">
                            <img  alt="${m.user.userName}" src="${m.user.imgUrl}" height="36" width="36">
                            </span>
                <a href="/article/${m.articleId}" rel="bookmark" target="_top" title="${m.articleTitle}">${m.articleTitle}</a>
            </li>

        </c:forEach>

    </ul>
</div>
</div>
<div class="clear"></div>
</body>
</html>
