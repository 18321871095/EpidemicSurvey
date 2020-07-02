<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="copyright" content="">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <!--html5.js解决目前IE浏览器对HTML5支持的问题,在页面中调用html5.js文件必须添加在页面的head元素内-->
    <script src="${ctx}/login/js/html5.js"></script>

</head>
<body>

<div id="mydiv_school" style="padding: 0px 10px;height: 550px;overflow-y:auto;margin-top: 20px;/*border: 1px solid;*/" class="layui-form">


    <%-- <input type="checkbox" name="like1[write]" lay-skin="primary" title="写作" checked="">
     <input type="checkbox" name="like1[read]" lay-skin="primary" title="阅读">--%>


    <table class="layui-table" style="margin: 0;">
        <thead>
        <tr>
            <th style='text-align: center;'>区域名称</th>
            <th style='text-align: center;'>注册者</th>
            <th style='text-align: center;'>账号</th>
            <th style='text-align: center;'>注册状态</th>
            <th style='text-align: center;'>区注册率</th>
        </tr>
        </thead>
        <tbody id="qusBody">
        </tbody>
    </table>
</div>

<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script>
    var layer1;var form;

    $(function () {
        var myheight=document.body.clientHeight;
        $("#mydiv_school").css("height",(myheight/1.12)+"px");
        layui.use(['layer','form','element'], function(){
            layer1 = layui.layer;
            form=layui.form;
            var element=layui.element;
            var index1=layer1.load(2,{offset:"200px"});
            $.ajax({
                type: "POST",
                url: "/backstage/adminGetQus",
                success: function (data) {
                    layer1.close(index1);
                    if(data.msg=='success'){
                        $("#qusBody").empty();
                        var data=data.result;
                        for(var i=0;i<data.length;i++){
                            var qiandao="";
                            if(data[i].qiandao=='0'){
                                qiandao="<span style='color: red;'>未签到</span>&nbsp;";
                            }else{
                                qiandao="<img src='/static/images/schoolPass.png' width=\"30px\" height=\"30px\">&nbsp;";
                            }

                            $("#qusBody").append("<tr>" +
                                "<td style='text-align: center;'>"+data[i].district+"</td>"+
                                "<td style='text-align: center;'>"+data[i].username+"</td>" +
                                "<td style='text-align: center;'>"+data[i].account+"</td>" +
                                "<td style='text-align: center;'>"+qiandao+"</td>" +
                                "<td style='text-align: center;'>"+
                                "<div class=\"layui-progress layui-progress-big\" lay-showPercent=\"yes\">\n" +
                                " <div class=\"layui-progress-bar layui-bg-green\" lay-percent="+data[i].qiandao_complete+"%"+"></div>\n" +
                                "   </div>"
                                +"</td>" +
                                "</tr>");
                        }
                        form.render();
                        element.render('progress');
                    }else if(data.msg=='001'){
                        layer1.alert("权限不够",{offset:'200px'});
                    }
                    else {
                        layer1.alert("获取信息出错",{offset:'200px'});
                    }
                },
                error: function (e, jqxhr, settings, exception) {
                    layer1.close(index1);
                    layer1.alert("服务器响应失败",{offset:'200px'});
                }
            });






        });
    });





</script>
</body>
</html>
