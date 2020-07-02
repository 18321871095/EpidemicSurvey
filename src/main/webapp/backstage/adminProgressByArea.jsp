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
<div style="margin: 10px 10px">本区总进度：
    <div class="layui-progress layui-progress-big" lay-showPercent="yes">
        <div id="myprogress" class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
    </div>
</div>
<div style="height: 620px;margin: 10px 20px;">
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="300">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>学校编号</th>
            <th>学校名称</th>
            <th>完成进度</th>
        </tr>
        </thead>
        <tbody id="adminQuTBody">
       <%-- <tr>
                 <td>123</td>
                <td>测试学校1</td>
                    <td>
                    <div class="layui-progress layui-progress-big" lay-showPercent="yes">
                    <div class="layui-progress-bar layui-bg-green" lay-percent="60%"></div>
                    </div>
                </td>
            </tr>--%>

        </tbody>
    </table>
</div>

<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
</body>
<script>
    $(function () {
        layui.use(['element', 'layer'], function () {
            var element=layui.element,layer=layui.layer;
            var index = layer.load(2,{offset:'150px'});
            $.post("/backstage/adminSelProgressByQu",{name:"${param.area}"},function (data) {
                layer.close(index);
                if(data.msg=='success'){
                    $("#adminQuTBody").empty();
                    for(var i=0;i<data.result.length;i++){
                        $("#adminQuTBody").append("<tr>\n" +
                            " <td>"+data.result[i].schoolid+"</td>\n" +
                            "<td>"+data.result[i].schoolName+"</td>\n" +
                            "<td>\n" +
                            "<div class=\"layui-progress layui-progress-big\" lay-showPercent=\"yes\">\n" +
                            "<div class=\"layui-progress-bar layui-bg-green\" lay-percent="+data.result[i].complete+"%"+"></div>\n" +
                            "</div>\n" +
                            "</td>\n" +
                            "</tr>");
                    }
                    $("#myprogress").attr("lay-percent",data.total+"%").text(data.total+"%");
                    element.render('progress');

                }else{
                    window.location.href="/message.jsp?message="+encodeURI(data.result);
                }

            })


        });
    });


</script>
</html>
