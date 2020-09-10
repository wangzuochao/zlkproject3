<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/9/3
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="max-age=72000"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script src="<%=basePath%>/layui/layui.js"></script>
    <script src="<%=basePath%>/articleDetailModel/js/jquery.min.js"></script>
    <script type="text/javascript">
        /*获取到Url里面的参数*/
        (function ($) {
            $.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        })(jQuery);
    </script>
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

<div class="layui-container" id="clearArticle">
<%--    <div id="clearArticle">--%>

<%--    </div>--%>
</div>
<script>

    layui.use(['element','jquery','layer','util','flow'], function() {
        var element = layui.element,
            $ = layui.$,//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
            layer = layui.layer,
            util = layui.util;
        var flow = layui.flow;
        flow.load({
            elem: '#clearArticle',
            /*scrollElem: '#ask',*/
            isAuto: true,
            isLazyimg: true,
            //end: '<p style="color:red">没有更多了</p>',   //加载所有后显示文本，默认'没有更多了'
            done: function (page, next) {
                /* console.info(page);*/
                //模拟插入
                setTimeout(function () {
                    var lis = [];
                    var programId = $.getUrlParam('programId');
                    console.log(programId);
                    $.get('flow?page=' + page + '&limit=1&programId='+programId,
                        function (res) {
                            //$("#clearArticle").empty();
                            console.log(res);
                            console.log(res.data);
                            console.log(res.data.list);
                            //假设你的列表返回在data集合中
                            layui.each(res.data.list, function (index, item) {
                                console.log(item.articleTitle);
                                /* for(var i=0;i<data.list.length;i++){
                                     data.list[i]
                                 }*/
                                //console.log(item);
                                //console.log(data.list);
                                //console.log(list);
                                var span = "";
                                for (var i = 0; i <item.articleRefLabels.length ; i++) {
                                    span += "<span class='layui-badge layui-bg-gray' style='border-radius: 20px'>"+item.articleRefLabels[i].articleLabel.labelName+"</span>";
                                }
                                var zhiding = "";
                                for(var j = 0; j <item.length ; j++) {
                                    if (item.topStatus == 1) {
                                        zhiding += '<span class="layui-badge layui-bg-orange" style="margin-left: 185px">置顶</span>'
                                    }
                                }


                                var tmpHtml = " ";
                                tmpHtml += "<div class='layui-row' style='border:0px solid #F00; horiz-align: center;vertical-align: middle;background-color: #fafafa;margin-top: 12px'>";
                                tmpHtml += "<div class='layui-col-xs2' style='padding:0px 0 20px;text-align: center'>";
                                tmpHtml += "<li><img src='<%=basePath%>"+item.articleImage+"' style='margin-top: 30px;width: 60px;height:60px '></li>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs10'>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px' id='label'>";
                                tmpHtml += span;
                                tmpHtml += zhiding;
                                //tmpHtml += "<span class='layui-badge layui-bg-gray' style='border-radius: 20px'>"+item.articleRefLabels[0].articleLabel.labelName+"</span>";
                                //tmpHtml += "<span class='layui-badge layui-bg-gray' style='border-radius: 20px'>"+item.articleRefLabels[1].articleLabel.labelName+"</span>";
                                // tmpHtml += "<span class='layui-badge layui-bg-gray' style='border-radius: 20px'>"+item.articleRefLabels[2].articleLabel.labelName+"</span>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;'><strong>";
                                tmpHtml += "<a href='/article/"+item.articleId+"' target='_top'>"+item.articleTitle+ "</a>";
                                tmpHtml += "</strong>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='margin-top: 17px;font-size: 10px'><strong>";
                                tmpHtml += item.articleProgram.programName;
                                tmpHtml += "</strong>";
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-row' style='margin-top: 10px;margin-bottom: 10px'>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>点赞";
                                tmpHtml += item.likeNum;
                                tmpHtml += "</div>";
                                //tmpHtml += "<div class='layui-col-xs2' style='color: gray'>评论";
                                // tmpHtml += item.stringDate;
                                //tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>浏览";
                                tmpHtml += item.pageviews;
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>举报";
                                tmpHtml += item.articleReportNum;
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs2' style='color: gray'>踩";
                                tmpHtml += item.stampNum;
                                tmpHtml += "</div>";
                                tmpHtml += "<div class='layui-col-xs4' style='margin-left: 250px;margin-top: -10px;font-size: x-small;color: gray'>";
                                tmpHtml += item.stringDate;
                                tmpHtml += "</div>";
                                tmpHtml += "</div>";
                                tmpHtml += "</div>";
                                tmpHtml += "</div>";

                                lis.push(
                                    tmpHtml
                                );



                            });
                            //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page <res.pages); //总页数
                        });
                }, 200);
            }
        });
    });

</script>

</body>


</html>
