
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
    <title>全部提问</title>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script src="<%=basePath%>/layui/layui.js"></script>
    <style>

    </style>
</head>
<body>
<div id="ask" >
</div>
<script>
    layui.use(['element', 'jquery', 'layer', 'util', 'flow'], function () {
        var element = layui.element,
            $ = layui.$,//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
            layer = layui.layer,
            util = layui.util,
            flow = layui.flow;

        flow.load({
            elem: '#ask',
            /*scrollElem: '#ask',*/
            isAuto: false,
            isLazyimg: true,
            //end: '<p style="color:red">没有更多了</p>',   //加载所有后显示文本，默认'没有更多了'
            done: function (page, next) {
                /* console.info(page);*/
                //模拟插入
                setTimeout(function () {
                    var lis = [];
                    $.get('show?page=' + page + '&limit=2',
                        function (res) {
                            /*console.info(res);*/
                            //假设你的列表返回在data集合中
                            layui.each(res.data, function (index, item) {
                                // for (var i = 0; i < item.length; i++) {
                                    lis.push('<div>' +
                                        '<img src="<%=basePath%>/img/titie" style="margin-top: 30px">' +
                                        '<li style="font-size: 25px">' + item.askContent +'</li>' +
                                        '<li style="font-size: 10px">' + item.askTime +'</li>' +
                                        '<li>' + item.askId+'</li>' +
                                        '</div>');
                                // }
                            });
                            //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page < res.pages); //总页数
                        });
                }, 200);
            }
        });
    });
</script>
</body>
</html>
