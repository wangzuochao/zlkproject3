<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="max-age=72000"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="MobileOptimized" content="width"/>
    <meta name="HandheldFriendly" content="true"/>

    <rapid:block name="description">

    </rapid:block>
    <rapid:block name="keywords">

    </rapid:block>
    <rapid:block name="title">

    </rapid:block>
    <link rel="stylesheet" href="/articleDetailModel/css/style.css">
    <link rel="stylesheet" href="/articleDetailModel/plugin/font-awesome/css/font-awesome.min.css">

    <rapid:block name="header-style">

    </rapid:block>
</head>
<body>
<div id="page" class="site" style="transform: none;">
        <div id="content" class="site-content" style="transform: none;">
            <rapid:block name="breadcrumb"></rapid:block>
            <rapid:block name="left"></rapid:block>
            <rapid:block name="right">
            </rapid:block>
        </div>

    <div class="clear"></div>

</div>

<script src="/articleDetailModel/js/jquery.min.js"></script>
<script src="/articleDetailModel/js/superfish.js"></script>
<script src='/articleDetailModel/js/sticky.js'></script>
<script src="/articleDetailModel/js/script.js"></script>
<script src="/articleDetailModel/plugin/layui/layui.all.js"></script>


<rapid:block name="footer-script"></rapid:block>

</body>
</html>