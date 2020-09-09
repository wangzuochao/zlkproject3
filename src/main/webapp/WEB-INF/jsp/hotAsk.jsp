<%--
  Created by IntelliJ IDEA.
  User: wzc
  Date: 2020/9/9
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
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
    <title>热门提问</title>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script src="<%=basePath%>/layui/layui.js"></script>
    <script type="text/javascript" src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>


</head>
<body>
<div class="layui-container" id="hotAsk">
</div>

<script>
    $(document).ready(function () {

        $.ajax({
            url: '<%=basePath%>/hotAskList',
            type: 'GET',
            contentType: "application/json",
            dataType: 'json',
            data: {},
            async: false,
            success: function (data) {
                var hotAskList = hotAsk(data.list);
                $("#hotAsk").html(hotAskList);

            },
            error: function (xhr, status, error) {
                debugger;
                console.log("发生错误");
            }
        });

    })
    function hotAsk(data) {
        var result = data;
        var tmpHtml = "";

        for (var i = 0; i < 5; i++) {
            var count = "";
            if(result[i].replyCount == null){
                count += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;margin-left: 8px'>回答：";
                count += "0";
                count += "</div>";
            }else{
                count += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;margin-left: 8px'>回答：";
                count += result[i].replyCount;
                count += "</div>";
            }


            var span = "";
            for (var j = 0; j < result[i].askRefLabels.length; j++) {
                span += "<span class='layui-badge layui-bg-gray' style='border-radius: 20px;margin-right: 8px'>" + result[i].askRefLabels[j].askLabel.labelName + "</span>";
            }
            tmpHtml += "<div class='layui-row' style='border:0px solid #F00;horiz-align: center;vertical-align: middle;background-color: #fcfcfc;margin-top: 12px'>";
            tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;'><strong>";
            tmpHtml += result[i].askContent;
            tmpHtml += "</strong>";
            tmpHtml += "（最多显示两行文字）</div>";
            tmpHtml += count;
            tmpHtml += "<div class='layui-row' style='width: 100%;height: 100%;margin-top: 10px;margin-left: 8px'>";
            tmpHtml += span;
            tmpHtml += "</div>";
            tmpHtml += "</div>";
        }
        tmpHtml += "";
        return tmpHtml;
    }
</script>
</body>
</html>
