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
                    <li class="layui-this layui-bg-blue"><a href="<%=basePath%>/ask" target="pageTarget">提问</a></li>
                    <li id="title"><a href="<%=basePath%>/content" target="pageTarget">文章</a></li>
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
                                    <li class="layui-this "><a href="<%=basePath%>/list" target="pageTarget">全部</a>
                                    </li>
                                    <li><a href="<%=basePath%>/login" target="pageTarget">我的提问</a></li>
                                    <li><a href="" target="pageTarget">我的回答</a></li>
                                </ul>
                                <%--                                <div class="layui-tab-content"></div>--%>

                            </div>
                            <iframe src="<%=basePath%>/ask" name="pageTarget"
                                    style="width: 100%;height: 550px;border: 0 none;vertical-align: middle;"
                                    frameborder="1">
                            </iframe>
                        </div>
                        <div class="layui-col-md3 contentHight" style="border:0px solid #F00;text-align: center;">
                            <h3>热门提问</h3>
                            <hr class="layui-bg-blue">
                            <iframe src="<%=basePath%>/list" name="pageTarget"
                                    style="width: 100%;height: 550px;border: 0 none;vertical-align: middle;"
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
                                    <li><a href="" target="pageTarget2">我的文章</a></li>
                                </ul>
                                <%--                                <div class="layui-tab-content"></div>--%>
                            </div>
                            <iframe src="" name="pageTarget2"
                                    style="width: 100%;height: 100%;border: 0 none;vertical-align: middle;"
                                    frameborder="1">
                            </iframe>
                        </div>
                        <div class="layui-col-md3 contentHight" style="border:0px solid #F00;text-align: center;">
                            <h3>热门文章</h3>
                            <hr class="layui-bg-blue">
                            <iframe src="" name="pageTarget3"
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
            <div id="test-editor">
                <textarea style="display:none;"></textarea>
            </div>
            <button id="publish" type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo"
                    style="margin-left: 930px">发表文章
            </button>
        </div>
    </div>
</div>
<div class="layui-col-md2">&nbsp;</div>

<script src="<%=basePath%>/layui/layui.js"></script>
<script>
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
        $("#button > div> button").click(function (e) {

            if ($(e.currentTarget).hasClass("layui-bg-blue")) {
                $(e.currentTarget).removeClass("layui-bg-blue");
            } else {
                $(e.currentTarget).addClass("layui-bg-blue");
                changeColorArray.push($(e.currentTarget));
            }
            if (changeColorArray.length > 3) {
                changeColorArray[0].removeClass("layui-bg-blue");
                changeColorArray.splice(0, 1);

            }
        });
        $("#cancel").click(function () {
            layer.closeAll();
        })
        $("#continue").click(function () {
            $("#div_body1").css("display", "none");
            $("#div_body2").css("display", "block");
            testEditor = editormd("test-editor", {
                width: "100%",
                height: 550,
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
            var sendData = {
                "content": aa,
                "markdown": bb
            };
            layer.confirm('你确定发表文章吗？', {
                btn: ['确定', '取消'],
                shade: false //不显示遮罩
            }, function () {
                $.ajax({
                    type: "POST",
                    url: '<%=basePath%>/essay/insertEssay',
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
                        alert("dddddd");
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
                layer.open({
                    area: ['900px', '550px'],
                    title: "提问题",
                    shade: 0,
                    type: 1,
                    content: $('#noteform') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                });
            }
        });
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

                    } else {
                        $(e.currentTarget).addClass("rcorners1");
                        changeColorArray.push($(e.currentTarget));
                    }
                    if (changeColorArray.length > 2) {
                        changeColorArray[0].removeClass("rcorners1");
                        changeColorArray.splice(0, 1);
                    }
                    $("#all > ul> li >a").click(function () {
                        $("#label > dd").find("a").removeClass("rcorners1");
                    });
                    var labelId = $(e.currentTarget).attr("labelId");
                    // alert(labelId);
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

        $.ajax({
            url: '<%=basePath%>/program/selectProgram',
            type: 'GET',
            contentType: "application/json",
            dataType: 'json',
            data: {},
            async: false,
            success: function (data) {
                var html = programHtml(data);
                $("#program").html(html);
                $("#program > dd").find("a").click(function (e) {
                    if ($(e.currentTarget).hasClass("resource")) {
                        $(e.currentTarget).removeClass("resource");
                    } else {
                        $(e.currentTarget).addClass("resource");
                        changeColorArray.push($(e.currentTarget));
                    }
                    if (changeColorArray.length > 2) {
                        changeColorArray[0].removeClass("resource");
                        changeColorArray.splice(0, 1);
                    }
                    $("#full > ul> li >a").click(function () {
                        $("#program > dd").find("a").removeClass("resource");
                    });
                    var programId = $(e.currentTarget).attr("programId");
                    // alert(programId);
                });
            },
            error: function (xhr, status, error) {
                debugger;
                console.log("发生错误");
            }
        });

        function programHtml(result) {
            var result = result;
            var html = "";
            for (var i = 0; i < result.length; i++) {
                html += "<dd>";
                html += "<h3>";
                html += "<a programId=\"" + result[i].programId + "\" style=\"height: 100px; line-height: 40px\">";
                html += result[i].programName;
                html += "</a>";
                html += "</h3>";
                html += "</dd>";
            }
            html += "";
            return html;
        }
    });

</script>
<form id="noteform" class="layui-form" action="#" method="post" style="display: none">
    <div class="layui-form-item">
        <textarea id="Demo" name="description" class="fsLayedit" height="80">请输入200-500字数内容</textarea>
        <div id="button" class="layui-form-item">
            <div class="layui-input-block" style="margin-left: 20px;margin-top: -150px">
                <table>
                    <tr>
                        <th><h6 style="color: red">★</h6></th>
                        <th><h6 style="color: lightgray">至少选择1个，最多选择三个</h6></th>
                    </tr>
                </table>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 50px;height: 20px;">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -45px">Java</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 100px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -95px">HTML5+CSS</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 80px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -77px">JavaScript</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 55px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -52px">Jquery</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 50px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -48px">C语言</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 50px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -44px">C++</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 50px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -45px">Web</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 50px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -45px">Layui</span>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-radius"
                        style="background: whitesmoke;border-radius: 20px; padding:0px 1px 1px 1px;width: 50px;height: 20px;margin-left: 20px">

                </button>
                <span style="margin-bottom: 1000px; margin-left: -45px">Vue</span>
                <div>
                    <h6 style="color: lightgray; margin-top: 35px">请选择问题相对路径</h6>
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
</form>
</body>
</html>



