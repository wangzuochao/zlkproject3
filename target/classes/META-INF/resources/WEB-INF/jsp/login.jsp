<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>博客</title>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
    <script src="<%=basePath%>/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-anim layui-anim-scale">
        <ul class="layui-nav layui-hide-xs">
            <li class="layui-nav-item"><a href="/blog/login">首页</a></li>
            <li class="layui-nav-item"><a href="/blog/login">关于我</a></li>
            <li class="layui-nav-item"><a href="/blog/login">生活</a></li>
            <li class="layui-nav-item"><a href="/blog/login">学无止境</a></li>
            <li class="layui-nav-item"><a href="/blog/login">留言</a></li>
        </ul>
        <ul class="layui-nav layui-hide-sm">
            <li class="layui-nav-item">菜单<a href="javascript:;"></a>
                <dl class="layui-nav-child">
                    <dd>
                        <a>首页</a>
                    </dd>
                    <dd>
                        <a>关于我</a>
                    </dd>
                    <dd>
                        <a>生活</a>
                    </dd>
                    <dd>
                        <a>学无止境</a>
                    </dd>
                    <dd>
                        <a>留言</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <shiro:user>
                <li class="layui-nav-item"><a href="javascript:;"> <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> <span id="curName"></span>
                </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/blog/index">后台管理</a>
                        </dd>
                        <dd>
                            <a href="/blog/logout">退出</a>
                        </dd>
                    </dl></li>
            </shiro:user>
            <shiro:guest>
                <li class="layui-nav-item"><a href="/blog/login">登录</a></li>
            </shiro:guest>
        </ul>
    </div>
    <div class="layui-body layui-anim layui-anim-scale" style="left: 0px">
        <div class="layui-container">
            <div class="layui-carousel layui-hide-xs" id="lb" style="margin-top: 15px">
                <div class="layui-form-item" carousel-item="">
                    <img src="http://101.200.49.60:8888/group1/M00/00/00/rBFRjFoZr22AULCAAAAhLswIq4c983.jpg" alt=""> <img src="http://101.200.49.60:8888/group1/M00/00/00/rBFRjFoaVRyAPjzeAABKZnDs4Tg276.jpg" alt="" width="245" height="200" title="" align="right">
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm6 layui-col-md9" style="padding: 5px">
                    <ul id="flows" class="flow-default">
                    </ul>
                </div>
                <div class="layui-col-xs12 layui-col-sm6 layui-col-md3" style="padding: 5px">
                    <blockquote style="margin-top: 10px; height: 300px" class="layui-elem-quote layui-text">
                        Layui - 用心与你沟通
                    </blockquote>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer layui-anim layui-anim-scale" style="text-align: center; left: 0px;">博客</div>
</div>
</body>
<script type="text/javascript">
    var element;
    var carousel;
    var flow;
    var layer;
    $.ajax({
        url : '/blog/getUserName',
        type : 'post',
        cache : false,
        async : false,
        success : function(res) {
            $("#curName").text(res.nickname);
        }
    });
    layui.define([ 'element', 'carousel', 'flow', 'code' ], function(exports) {
        element = layui.element, carousel = layui.carousel, flow = layui.flow;
        var $ = layui.jquery;
        layui.code();
        carousel.render({
            elem : '#lb',
            interval : 2800,
            anim : 'fade',
            //arrow : 'none',
            width : '100%',
            indicator : "none",
            height : '200px'
        });
        flow.load({
            elem : '#flows',
            scrollElem : '#flows',
            isAuto : false,
            isLazyimg : true,
            done : function(page, next) {
                //模拟插入
                setTimeout(function() {
                    var lis = [];
                    $.get('/blog/ui/articles?page=' + page + '&limit=2',
                        function(res) {
                            console.info(res);
                            //假设你的列表返回在data集合中
                            layui.each(res.data, function(index, item) {
                                var str='<div><blockquote class="layui-elem-quote" style="margin-top: 10px;">'+item.articlename+"<font style='margin-left:30px;'>创建时间："+item.articletime+'</font></blockquote></div>';
                                str+='<blockquote class="layui-elem-quote layui-quote-nm layui-text" style="font-size:16px;letter-spacing:2px;line-height:25px;">'+"Layui - 用心与你沟通(content)"+'</blockquote>';
                                lis.push('<li>' + str + '</li>');
                            });
                            next(lis.join(''), page < res.count); //假设总页数为 6
                        });
                }, 500);
            }
        });
        element.init();
    });
</script>
</html>

