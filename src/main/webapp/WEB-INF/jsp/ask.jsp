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

        /*流加载样式*/
        .layui-flow-more a cite {
            padding: 0 20px;
            border-radius: 3px;
            background-color: dodgerblue;
            color: white;
            font-style: normal;
        }

        /*滑动条样式*/
        .test-1 {
            width: 50px;
            height: 200px;
            overflow: auto;
            float: left;
            margin: 5px;
            border: none;
        }

        .scrollbar {
            width: 30px;
            height: 300px;
            margin: 0 auto;
        }

        .test-2::-webkit-scrollbar {
            /*滚动条整体样式*/
            width: 10px; /*高宽分别对应横竖滚动条的尺寸*/
            height: 1px;
        }

        .test-2::-webkit-scrollbar-thumb {
            /*滚动条里面小方块*/
            border-radius: 10px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
            background: #535353;
        }

        .test-2::-webkit-scrollbar-track {
            /*滚动条里面轨道*/
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background: #ededed;
        }

        /*滑动条样式结束*/
    </style>
</head>
<body>
<div class="layui-container" id="ask">
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
                    $.get('show?page=' + page + '&limit=3',
                        function (res) {
                            /*console.info(res);*/
                            //假设你的列表返回在data集合中
                            layui.each(res.data, function (index, item) {
                                var tmpHtml = "";
                                tmpHtml += "<div class='layui-row' style='border:0px solid #F00; horiz-align: center;vertical-align: middle;background-color: #fafafa;margin-top: 12px'>";
                                tmpHtml += "<div class='layui-col-xs2' style='padding:0px 0 20px;text-align: center'>";
                                tmpHtml += "<li><img src=\"<%=basePath%>/img/title.png\" style=\"margin-top: 30px;width: 60px;height:60px \"></li>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs10'>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px'>";
                                tmpHtml += "<span class=\"layui-badge layui-bg-gray\" style='border-radius: 20px'>java</span>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;'><strong>请问，";
                                tmpHtml += item.askContent.substring(0, 2);
                                tmpHtml += "</strong>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 17px'>";
                                tmpHtml += "<table>";
                                tmpHtml += "<tr>";
                                tmpHtml += "<th style='color: #626262;'>";
                                tmpHtml += item.askContent.substring(0, 2);
                                tmpHtml += "</th>";
                                tmpHtml += "<th style='color: #a7a7a7;'>回答：";
                                tmpHtml += "</th>";
                                tmpHtml += "</tr>";
                                tmpHtml += "</table>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div style='margin-top: 5px'>";
                                tmpHtml += item.askContent.substring(0, 50);
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='margin-top: 17px;font-size: 10px'><strong>来自：人工智能百度文库java";
                                tmpHtml += "</strong>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='margin-top: 10px;margin-bottom: 10px'>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>回答";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs1'>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>浏览";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>举报";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2'>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs4' style='margin-left: 250px;margin-top: -10px;font-size: x-small;color: gray'>";
                                tmpHtml += item.askTime;
                                tmpHtml += "</div>";
                                tmpHtml += "</div>";
                                tmpHtml += "</div>";
                                tmpHtml += "</div>";

                                lis.push(tmpHtml);
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
