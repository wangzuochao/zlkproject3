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
    <title>文章</title>
    <link rel="stylesheet" href="<%=basePath%>/editor.md-master/css/editormd.min.css">
    <script type="text/javascript" src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/editor.md-master/editormd.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
    <table id="demo" lay-filter="test"></table>
</head>
<body>
<script src="<%=basePath%>/layui/layui.js"></script>
<script>

        layui.use(['table', 'element', 'util'], function () {
            var table = layui.table,
                util = layui.util,
                element = layui.element;
            //第一个实例
            table.render({
                elem: '#demo' //指定表格容器
                , height: 500
                , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                , url: '<%=basePath%>/essay/selectEssay' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {type: 'numbers', fixed: 'left'}
                    , {type: 'checkbox', fixed: 'left'},
                    {field: 'id', title: '客户编号', width: 80, sort: true, fixed: 'left'}
                    , {field: 'content', title: '客户姓名', width: 500}
                ]]
            });
        })

</script>
</body>
</html>
