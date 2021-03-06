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
    <script type="text/javascript" src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <style>

        /*流加载样式*/
        .layui-flow-more a cite {
            padding: 0 20px;
            border-radius: 3px;
            background-color: dodgerblue;
            color: white;
            font-style: normal;
        }

        ::-webkit-scrollbar {
            display: none
        }
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
            isAuto: true,
            isLazyimg: true,
            //end: '<p style="color:red">没有更多了</p>',   //加载所有后显示文本，默认'没有更多了'
            done: function (page, next) {
                /* console.info(page);*/
                //模拟插入
                setTimeout(function () {
                    var lis = [];
                    var url = 'askAll?page=' + page + '&limit=2';
                    var labelIdList = getQueryValue('labelIdList');
                    if(labelIdList != null){
                        url += "&labelIdList=" + labelIdList;
                    }
                    $.get(url,
                        function (res) {
                            /*console.info(res);*/
                            //假设你的列表返回在data集合中
                            layui.each(res.data.list, function (index, item) {

                                var count = "";
                                var replyPerson;
                                var table = "";
                                var span = "";
                                for (var i = 0; i < item.askRefLabels.length; i++) {
                                    span += "<span class='layui-badge layui-bg-gray' style='border-radius: 20px;margin-right: 8px'>" + item.askRefLabels[i].askLabel.labelName + "</span>";
                                }
                                if(item.replyPerson == null) {
                                    table += "<div id=\"reply\" class='layui-row' style='width: 100%;height: 100%;margin-top: 17px'>";
                                    table += "<table>";
                                    table += "<tr>";
                                    table += "<th style='color:  #a7a7a7;'>此问题暂无任何回答";
                                    table += "</th>";
                                    table += "</tr>";
                                    table += "</table>";
                                    table += "</div>";
                                }else{
                                    table += "<div id=\"reply\" class='layui-row' style='width: 100%;height: 100%;margin-top: 17px'>";
                                    table += "<table>";
                                    table += "<tr>";
                                    table += "<th style='color: #626262;'>";
                                    table += item.replyPerson;
                                    table += "</th>";
                                    table += "<th style='color: #a7a7a7;'>回答：";
                                    table += "</th>";
                                    table += "</tr>";
                                    table += "</table>";
                                    table += "</div>";
                                    table += "<div id=\"content\" style='margin-top: 5px;color: #888888'>";
                                    table += item.replyContent.substring(0,52);
                                    table += "（此处最多显示两行内容，点击提问内容，进入详情页中查看全部内容）</div>";
                                }
                                if(item.replyCount == null){
                                    count += "<div class='layui-col-xs2' style='color: gray'>回答:";
                                    count += "0";
                                    count += "</div>";
                                }else{
                                    count += "<div class='layui-col-xs2' style='color: gray'>回答:";
                                    count += item.replyCount;
                                    count += "</div>";
                                }
                                var tmpHtml = "";
                                tmpHtml += "<div class='layui-row' style='border:0px solid #F00; horiz-align: center;vertical-align: middle;background-color: #fafafa;margin-top: 12px'>";
                                tmpHtml += "<div class='layui-col-xs2' style='padding:0px 0 20px;text-align: center'>";
                                tmpHtml += "<li><img src=\"<%=basePath%>"+item.askImg+"\" style=\"margin-top: 25px;width: 60px;height:60px \"></li>";
                                tmpHtml += "<li>";
                                tmpHtml += item.askPerson;
                                tmpHtml += "</li>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs10'>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px'>";
                                tmpHtml += span;
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;'><strong>请问，";
                                tmpHtml += "<a href=\"<%=basePath%>replyContent?askId="+item.askId+"\" target='_top'>";
                                tmpHtml += item.askContent;
                                tmpHtml += "</a>";
                                tmpHtml += "</strong>";
                                tmpHtml += "</div>";
                                tmpHtml += table;
                                tmpHtml += "<div class='layui-row' style='margin-top: 17px;font-size: 10px'><strong>来自：人工智能百度文库java";
                                tmpHtml += "</strong>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='margin-top: 10px;margin-bottom: 10px'>";
                                tmpHtml += count;
                                tmpHtml += "<div class='layui-col-xs1'>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>举报:";
                                tmpHtml += item.askReportNum;
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2'>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs4' style='margin-left: 250px;margin-top: -15px;font-size: x-small;color: gray'>";
                                tmpHtml += item.askDate;
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

    function getQueryValue(queryName) {
        var query = decodeURI(window.location.search.substring(1));
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == queryName) { return pair[1]; }
        }
        return null;
    }
</script>
</body>
</html>
