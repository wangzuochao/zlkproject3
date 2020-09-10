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
    <title>社区</title>
    <link rel="stylesheet" href="<%=basePath%>/editor.md-master/css/editormd.min.css">
    <script type="text/javascript" src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/editor.md-master/editormd.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
    <style>

        .contentHight {
            height: 700px;
        }

        .rcorners1 {
            border-radius: 25px;
            background: dodgerblue;
            padding: 5px;
            width: 200px;
            height: 50px;

        }

        .layui-tab-brief > .layui-tab-title .layui-this:after {
            border: none;
            border-radius: 0;
            border-bottom: 2px solid dodgerblue;
        }

        .resource {
            color: dodgerblue;
        }

        a:hover {
            color: dodgerblue;
        }

        .layui-form-select dl dd.layui-this {
            background-color: dodgerblue;
            color: #fff;
        }



    </style>
</head>
<body class="layui-layout-body">
<div class="layui-col-md2">&nbsp;</div>
<div class="layui-layout layui-layout-admin">
    <div class="layui-col-md8">
        &nbsp;
        <ul class="layui-nav layui-bg-blue" lay-filter="">
            <li class="layui-nav-item"><a href="">首页</a></li>
            <li class="layui-nav-item "><a href="">项目</a></li>
            <li class="layui-nav-item layui-this"><a id="start" href="">社区</a></li>
            <li class="layui-nav-item " style="margin-left: 400px" ;><input placeholder="请输入关键字"><a href=""></a></li>
            <li class="layui-nav-item " style="margin-left: 50px" ;>
                <button id="but_b" class="layui-btn layui-btn-radius" style="position: relative;margin-left: -30px">搜索
                </button>
            </li>
        </ul>
        <div id="div_body" style="height: 700px;border:0px solid #F00;">
            <div id="community" class="layui-tab" lay-filter="tabDemo">
                <ul class="layui-tab-title">
                    <li id="ask" class="layui-this layui-bg-blue"><a href="<%=basePath%>/ask" target="pageTarget">提问</a>
                    </li>
                    <li id="title"><a href="" target="pageTarget">文章</a></li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div id="sidebar-div" class="layui-col-md3 contentHight"
                             style="border:0px solid #F00;text-align: center;">
                            <h3>关注列表</h3>
                            <hr class="layui-bg-blue">
                            <dl id="label">
                            </dl>
                        </div>
                        <div class="layui-col-md6 contentHight" style="border:0px solid #F00;text-align: center;">
                            <div id="all" class="layui-tab layui-tab-brief " lay-filter="docDemoTabBrief"
                                 style="margin-top: -8px;margin-left: 10px">
                                <ul class="layui-tab-title ">
                                    <li class="layui-this "><a href="<%=basePath%>/ask" target="pageTarget">全部</a>
                                    </li>
                                    <li><a id="myask" href="" target="pageTarget">我的提问</a></li>
                                    <li><a href="<%=basePath%>ask?target=myReply" target="pageTarget">我的回答</a></li>
                                </ul>
                                <%--                                <div class="layui-tab-content"></div>--%>
                            </div>
                            <iframe id="c-c-iframe" src="<%=basePath%>/ask" name="pageTarget"
                                    style="width: 100%;height: 550px;border: 0 none;vertical-align: middle;"
                                    frameborder="1">
                            </iframe>
                        </div>
                        <div class="layui-col-md3 contentHight" style="border:0px solid #F00;text-align: center;">
                            <h3>热门提问</h3>
                            <hr class="layui-bg-blue">
                            <iframe src="<%=basePath%>/hotAsk" name="pageTarget1"
                                    style="width: 100%;height: 80%;border: 0 none;vertical-align: middle;"
                                    frameborder="1">
                            </iframe>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div id="side-div" class="layui-col-md3 contentHight"
                             style="border:0px solid #F00;text-align: center;">
                            <h3>推荐</h3>
                            <hr class="layui-bg-blue">
                            <dl id="program">
                            </dl>
                        </div>
                        <div class="layui-col-md6 contentHight" style="border:0px solid #F00;text-align: left;">
                            <div id="full" class="layui-tab layui-tab-brief " lay-filter="docDemoTabBrief2"
                                 style="margin-top: -8px;margin-left: 10px">
                                <ul class="layui-tab-title ">
                                    <li class="layui-this "><a href="<%=basePath%>/article" target="pageTarget2">全部</a>
                                    </li>
                                    <li><a id="mytitle" href="<%=basePath%>/list" target="pageTarget2">我的文章</a></li>
                                </ul>
                                <%--                                <div class="layui-tab-content"></div>--%>
                            </div>

                            <iframe id="no" src="<%=basePath%>/article" name="pageTarget2"
                                    style="width: 100%;height: 100%;border: 0 none;vertical-align: middle;"
                                    frameborder="1">
                            </iframe>

                        </div>
                        <div class="layui-col-md3 contentHight" style="border:0px solid #F00;text-align: center;">
                            <h3>热门文章</h3>
                            <hr class="layui-bg-blue">
                            <iframe src="<%=basePath%>/hotArticle" name="pageTarget3"
                                    style="width: 100%;height: 100%;border: 0 none;vertical-align: middle;"
                                    frameborder="1">
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
            <button id="but_a" class="layui-btn layui-btn-normal"
                    style="position: relative;margin-left: 900px;margin-top:-1490px;">发起提问
            </button>
        </div>

        <div id="div_body1" style="height: 650px;border:0px solid #3aff55;display: none">
            <dl>
                <dd style="text-align: center;color: dodgerblue;margin-top: 45px"><h1><strong>快速了解如何发文</strong></h1>
                </dd>
                <dd><img src="<%=basePath%>/img/title.png"
                         style="height: 50px;width: 50px;margin-top: -50px;margin-left: 350px"></img></dd>
                <dd style="margin-top: 0px;margin-left: 180px"><h2><strong>写前须知</strong></h2></dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 8px"><h3><strong>·</strong>这不止是你的个人文章，也是给大家阅读的文章，请认真撰写，和我们一起分享
                </h3></dd>
                <dd style="margin-top: 30px;margin-left: 180px"><h2><strong>好文章应该具备这些条件</strong></h2></dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 8px"><h3><strong>·</strong>原创性高，专业性强，让人看后能为之受用
                </h3></dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 5px"><h3><strong>·</strong>规范有层次的对字段进行排版</h3>
                </dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 5px"><h3><strong>·</strong>与大家分享相关的开发技巧，职业心得，业内新闻等有意义内容
                </h3></dd>
                <dd style="margin-top: 30px;margin-left: 180px"><h2><strong>热心和大家交流</strong></h2></dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 8px"><h3><strong>·</strong>相信团队的力量，和大家交流碰撞出有趣的点子或技巧
                </h3></dd>
                <dd style="margin-top: 30px;margin-left: 180px;color: red"><h2><strong>违规说明</strong></h2></dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 8px"><h3><strong>·</strong>频繁发布无意义内容，随意灌水</h3>
                </dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 5px"><h3><strong>·</strong>发布违法，低俗等不良内容或广告
                </h3></dd>
                <dd style="color: darkgray;margin-left: 200px;margin-top: 5px"><h3><strong>·</strong>恶意谩骂攻击他人</h3></dd>
            </dl>
            <button id="continue" type="button" class="layui-btn layui-btn-fluid layui-bg-blue" lay-submit
                    lay-filter="formDemo"
                    style="margin-left: 400px;margin-top:50px;width: 300px">知道了，开始撰写
            </button>
        </div>

        <div id="div_body2" name="body2" style="height: 650px;border:0px solid #3aff55;display: none">
            <div style="margin-top: 10px;color: dodgerblue;font-size: 17px">
                文 章 标 题 ： <input id="articleTitle" type="text" style="width: 850px;border: white" required
                                 placeholder="请在此输入文章标题">
            </div>
            <hr class="layui-bg-blue">
            <div class="layui-form-item">
                <div id="test-editor">
                    <textarea style="display:none;"></textarea>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 700px;margin-top: 30px">
                        <button id="remove" type="button" class="layui-btn layui-btn-fluid layui-bg-gray"
                                style="width: 150px">取消
                        </button>
                        <button id="next" class="layui-btn layui-btn-fluid layui-bg-blue" style="width: 150px"
                                lay-submit>下一步
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="layui-col-md2">&nbsp;</div>

<script src="<%=basePath%>/layui/layui.js"></script>
<script>





    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: "<%=basePath%>file/imgUpload" //改成您自己的上传接口
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    })


    let testEditor;
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(tabDemo)', function (data) {
            console.log(data);
            if (data.index == 0) {
                $("#but_a").text("发起提问");
            } else if (data.index == 1) {
                $("#but_a").text("发表文章");
            }
        });
    });

    $(document).ready(function () {

        var changeColorArray = new Array();

        $("#community > ul> li").click(function (e) {
            $("#community > ul> li").removeClass("layui-bg-blue");
            $(e.currentTarget).addClass("layui-bg-blue");

        });
        // 点击提问的时候移除样式
        $("#ask").click(function (e) {
            $("#label > dd").find("a").removeClass("rcorners1");
            changeColorArray.length = 0;
        });

        $("#myask").click(function () {
            alert("登录状态");
        });
        // 点击文章的时候移除样式
        $("#title").click(function (e) {
            $("#program > dd").find("a").removeClass("resource");
            changeColorArray.length = 0;
        });
        //提问弹出层的取消按钮
        $("#cancel").click(function () {
            layer.closeAll();
            window.parent.location.reload();
        });
        // 文章弹出层的取消按钮
        $("#closeTan").click(function () {
            layer.closeAll();

        });
        // markdown的取消刷新
        $("#remove").click(function () {
            parent.location.reload();
        });
        //点击下一步的点击事件
        $("#next").click(function () {
            $.ajax({
                url: '<%=basePath%>/label/selectLabel',
                type: 'GET',
                contentType: "application/json",
                dataType: 'json',
                data: {},
                async: false,
                success: function (data) {
                    var articleLabel = askLabel(data);
                    $("#articleLabel").html(articleLabel);
                    $("#articleLabel > span").click(function (e) {
                        if ($(e.currentTarget).hasClass("layui-badge layui-bg-blue")) {
                            $(e.currentTarget).removeClass("layui-badge layui-bg-blue");
                        } else {
                            $(e.currentTarget).addClass("layui-badge layui-bg-blue");
                            changeColorArray.push($(e.currentTarget));
                        }
                        if (changeColorArray.length > 3) {
                            changeColorArray[0].removeClass("layui-badge layui-bg-blue");
                            changeColorArray.splice(0, 1);
                        }
                    });
                },
                error: function (xhr, status, error) {
                    debugger;
                    console.log("发生错误");
                }
            });
            //打开发表文章的弹出层
            layer.open({
                area: ['800px', '500px'],
                title: "请选择",
                shade: 0,
                type: 1,
                content: $('#articleform') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            });
            //打开结束
        });
        //栏目下拉框
        var proOptions = getProgramOptions();
        var proOptionHtml = [];
        if (proOptions == null) {
            return;
        }
        for (var i = 0; i < proOptions.length; i++) {
            var tmp = "<option ";
            tmp += "value='" + proOptions[i].programId + "' >";
            tmp += proOptions[i].programName;
            tmp += "</option>";
            proOptionHtml.push(tmp);
        }
        $("#programSelect").html(proOptionHtml.join(''));
        //下拉框结束

        $("#continue").click(function () {
            $("#div_body1").css("display", "none");
            $("#div_body2").css("display", "block");
            testEditor = editormd("test-editor", {
                width: "100%",
                height: 500,
                path: "<%=basePath%>/editor.md-master/lib/",
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "<%=basePath%>file/imgUpload",
                saveHTMLToTextarea: true,   // 保存 HTML 到 Textarea
            });
            // testEditor.toolbarHandlers.image = testEditor.executePlugin("imageDialog","image-dialog/image-dialog")；

        });

        $("#publish").click(function () {
            var aa = testEditor.getHTML();
            var bb = testEditor.getMarkdown();
            var cc = $("#articleTitle").text();
            var sendData = {
                "articleContentHtml": aa,
                "articleContentMarkdown": bb,
                "articleTitle": cc
            };
            layer.confirm('你确定发表文章吗？', {
                btn: ['确定', '取消'],
                shade: false //不显示遮罩
            }, function () {
                $.ajax({
                    type: "POST",
                    url: '',
                    contentType: "application/json",
                    data: JSON.stringify(sendData),
                    dataType: "json",
                    success: function (data) {
                        layer.msg("发表成功", {
                            time: 1000
                        });
                        setTimeout(function () {
                            var index = parent.layer.getFrameIndex("body2"); //获取当前窗口的name
                            parent.layer.close(index);//关闭当前窗口
                            window.parent.location.reload();//刷新
                        }, 1000)
                    },
                    error: function (xhr, status, error) {
                        debugger;
                    }
                });
            })
        })

        $("#but_a").click(function () {
            if ($("#but_a").text() == "发表文章") {
                $("#div_body").css("display", "none");
                $("#div_body1").css("display", "block");
            } else {
                $.ajax({
                    url: '<%=basePath%>/label/selectLabel',
                    type: 'GET',
                    contentType: "application/json",
                    dataType: 'json',
                    data: {},
                    async: false,
                    success: function (data) {
                        var askLabelHtml = askLabel(data);
                        $("#askLabel").html(askLabelHtml);
                        $("#askLabel > span").click(function (e) {
                            if ($(e.currentTarget).hasClass("layui-badge layui-bg-blue")) {
                                $(e.currentTarget).removeClass("layui-badge layui-bg-blue");
                            } else {
                                $(e.currentTarget).addClass("layui-badge layui-bg-blue");
                                changeColorArray.push($(e.currentTarget));
                            }
                            if (changeColorArray.length > 3) {
                                changeColorArray[0].removeClass("layui-badge layui-bg-blue");
                                changeColorArray.splice(0, 1);
                            }
                        });
                    },
                    error: function (xhr, status, error) {
                        debugger;
                        console.log("发生错误");
                    }
                });
                layer.open({
                    area: ['900px', '550px'],
                    title: "提问题",
                    shade: 0,
                    type: 1,
                    content: $('#noteform') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                });
            }
        });

        function askLabel(data) {
            var result = data;
            var html = "";
            for (var i = 0; i < result.length; i++) {
                html += "<span labelId=\"" + result[i].labelId + "\" class=\"layui-badge-rim\" style='border-radius: 20px;font-size: 15px;margin-left: 15px;margin-top: 10px'>";
                html += result[i].labelName;
                html += "</span>";
            }
            html += "";
            return html;
        }

        $.ajax({
            url: '<%=basePath%>/label/selectLabel',
            type: 'GET',
            contentType: "application/json",
            dataType: 'json',
            data: {},
            async: false,
            success: function (data) {
                var html = labelHtml(data);
                $("#label").html(html);
                $("#label > dd").find("a").click(function (e) {
                    if ($(e.currentTarget).hasClass("rcorners1")) {
                        $(e.currentTarget).removeClass("rcorners1");
                        var currIndex = getArrayIndexByValue(changeColorArray,$(e.currentTarget));
                        console.log(currIndex);
                        changeColorArray.splice(currIndex, 1);
                        //alert(changeColorArray.length);
                    } else {
                        $(e.currentTarget).addClass("rcorners1");
                        changeColorArray.push($(e.currentTarget));
                        //alert(changeColorArray.length);
                    }
                    if (changeColorArray.length > 2) {
                        changeColorArray[0].removeClass("rcorners1");
                        changeColorArray.splice(0, 1);
                    }
                    $("#all > ul> li >a").click(function () {
                        $("#label > dd").find("a").removeClass("rcorners1");
                        changeColorArray.length = 0;
                    });
                    var labelIdList = [];
                    var labelId = $(e.currentTarget).attr("labelId");
                    for (var i = 0; i < changeColorArray.length; i++) {
                        labelIdList.push(changeColorArray[i].attr("labelId"));
                        // alert(labelIdList[i]);
                    }

                    alert(JSON.stringify(labelIdList));
                    var iframeUrl = "<%=basePath%>ask";
                    if(labelIdList.length > 0){
                    iframeUrl += "?labelIdList=" + labelIdList.join(",");
                    }
                    $("#c-c-iframe").attr("src", iframeUrl);

                });
            },
            error: function (xhr, status, error) {
                debugger;
                console.log("发生错误");
            }
        });

        function labelHtml(result) {
            var result = result;
            var html = "";
            for (var i = 0; i < result.length; i++) {
                html += "<dd>";
                html += "<h2>";
                html += "<a labelId=\"" + result[i].labelId + "\" style=\"height: 100px; line-height: 40px\">";
                html += result[i].labelName;
                html += "</a>";
                html += "</h2>";
                html += "</dd>";
            }
            html += "";
            return html;
        }
        //将文章栏目渲染到文章页面上
        $.ajax({
            url: '<%=basePath%>/program/selectProgram',
            type: 'GET',
            contentType: "application/json",
            dataType: 'json',
            data: {},
            async: false,
            success: function (data) {
                console.log(data);
                var html = programHtml(data);
                $("#program").html(html);
                $("#program > dd").find("a").click(function (e) {
                    if ($(e.currentTarget).hasClass("resource")) {
                        $(e.currentTarget).removeClass("resource");
                    } else {
                        $(e.currentTarget).addClass("resource");
                        changeColorArray.push($(e.currentTarget));
                    }
                    if (changeColorArray.length > 1) {
                        changeColorArray[0].removeClass("resource");
                        changeColorArray.splice(0, 1);
                    }
                    $("#full > ul> li >a").click(function () {
                        $("#program > dd").find("a").removeClass("resource");
                        changeColorArray.length = 0;
                    });
                    var programId = $(e.currentTarget).attr("programId");


                });
            },
            error: function (xhr, status, error) {
                debugger;
                console.log("发生错误");
            }
        });
        //结束渲染

        //获取文章栏目
        function programHtml(result) {
            var result = result;
            var html = "";
            var array=new Array(15);
            for (var i = 0; i < result.length; i++) {
                array[i]= result[i].programId;
                html += "<dd>";
                html += "<h3>";
                html += "<a programId='" + array[i] + "' href='/articleByProgram?programId="+array[i]+"' target=\"pageTarget2\" style=\"height: 100px; line-height: 40px\">";
                html += result[i].programName;
                html += "</a>";
                html += "</h3>";
                html += "</dd>";
            }
            html += "";
            return html;
        }


        //获取下拉框函数
        function getProgramOptions() {
            var result;
            $.ajax({
                url: '<%=basePath%>/program/selectProgram',
                type: 'GET',
                contentType: "application/json",
                dataType: 'json',
                data: {},
                async: false,
                success: function (data) {
                    result = data;
                },
                error: function (xhr, status, error) {
                    debugger;
                    console.log("发生错误");
                }
            });
            return result;
        }
        //结束获取
    });
    //获取changeColorArray的索引值
    function getArrayIndexByValue(array,obj){
        var result = -1;
        for(var i = 0 ; i < array.length; i++){
            if(array[i][0] == obj[0]){
                return i;
            }
        }
        return result;
    }
    //获取结束


</script>
<%--提问弹出层--%>
<form id="noteform" class="layui-form" action="#" method="post" style="display: none">
    <div class="layui-form-item">
        <textarea id="Demo" name="description" class="fsLayedit" height="80">请输入200-500字数内容</textarea>
        <div id="button" class="layui-form-item">
            <div class="layui-input-block" style="margin-left: 20px;margin-top: -150px">
                <table>
                    <tr>
                        <th><h6 style="color: red">★</h6></th>
                        <th><h6 style="color: lightgray">至少选择1个，最多选择3个</h6></th>
                    </tr>
                </table>
                <div id="askLabel">
                </div>
                <div>
                    <h6 style="color: lightgray; margin-top: 10px">请选择问题相对路径</h6>
                    <table>
                        <tr>
                            <th>
                                <select name="city" lay-verify="">
                                    <option value="">请选择项目</option>
                                    <option value="010">北京</option>
                                    <option value="021">上海</option>
                                    <option value="0571">杭州</option>
                                </select>
                            </th>
                            <th>
                                <select name="city" lay-verify="">
                                    <option value="">请选择方向</option>
                                    <option value="010">北京</option>
                                    <option value="021">上海</option>
                                    <option value="0571">杭州</option>
                                </select>
                            </th>
                            <th>
                                <select name="city" lay-verify="">
                                    <option value="">请选择课程</option>
                                    <option value="010">北京</option>
                                    <option value="021">上海</option>
                                    <option value="0571">杭州</option>
                                </select>
                            </th>
                            <th>
                                <select name="city" lay-verify="">
                                    <option value="">请选择视频</option>
                                    <option value="010">北京</option>
                                    <option value="021">上海</option>
                                    <option value="0571">杭州</option>
                                </select>
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <script>
            layui.use('layedit', function () {
                var layedit = layui.layedit;
                layedit.build('Demo'); //建立编辑器
            });
        </script>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left: 550px;margin-top: 80px">
            <button id="cancel" type="button" class="layui-btn layui-btn-fluid layui-bg-gray" style="width: 150px">取消
            </button>
            <button class="layui-btn layui-btn-fluid layui-bg-blue" style="width: 150px" lay-submit>提交</button>
        </div>
    </div>
<%--    提问弹出层结束--%>
</form>
<%--文章弹出层--%>
<form id="articleform" class="layui-form" action="#" method="post" style="display: none">
    <div class="layui-container" style="border:0px solid #F00;height: 400px;width: 800px">
        <div class='layui-row'>
            <div class='layui-col-xs3'
                 style="border:0px solid #F00; height: 150px;width: 20%;padding:0px 0 20px;text-align: center;margin-top: 40px">
<%--                <img src="<%=basePath%>/group3/rose-4825575.jpg" style="width: 80px;height:80px">--%>
            <div class="layui-upload">
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1" style ="height: 100px;width: 100px;">
                    <p id="demoText"></p>
                </div>
                <button type="button" class="layui-btn layui-btn-normal" id="test1">本地上传</button>
            </div>

            </div>
            <div class='layui-col-xs9' style="border:0px solid #F00;height: 100%;width: 80%">
                <div class='layui-row' style="border:0px solid #F00;height: 150px;width: 100%">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 20px;margin-top: 45px">
                            <div style="font-size: 20px;color: black">选择文章栏目</div>
                            <table style="margin-top: 10px">
                                <tr style="margin-top: 50px">

                                    <th><h6 style="color: red">★</h6></th>
                                    <th><h6 style="color: #afafaf">请选择文章栏目</h6></th>
                                </tr>
                            </table>
                            <div class="layui-input-inline" style="margin-top: 10px;width: 180px">
                                <select id="programSelect" name="programSelect" lay-verify="">
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class='layui-row' style="border:0px solid #F00;height: 100px;width: 100%">
                    <div id="" class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 20px;margin-top: 0px">
                            <table>
                                <tr>
                                    <th><h6 style="color: red">★</h6></th>
                                    <th><h6 style="color: #afafaf">至少选择1个，最多选择3个</h6></th>
                                </tr>
                            </table>
                            <div id="articleLabel">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="layui-form-item" style="margin-top: -80px">
        <div class="layui-input-block">
            <button id="closeTan" type="button" class="layui-btn layui-btn-fluid layui-bg-gray"
                    style="margin-left: 300px;margin-top: 30px;width: 150px">取消
            </button>
            <button class="layui-btn layui-btn-fluid layui-bg-blue"
                    style="margin-left: 500px;margin-top: -55px;width: 150px" lay-submit>提交
            </button>
        </div>
    </div>
<%--文章弹出层结束--%>
</form>
</body>
</html>



