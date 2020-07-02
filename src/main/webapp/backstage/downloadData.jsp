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
<div style="margin: 10px 10px">
<%--    <button id="download2019" class="layui-btn layui-btn-sm">下载问卷2019数据</button>--%>
</div>
<div style="margin: 10px 10px">上海市总进度：
    <div class="layui-progress layui-progress-big" lay-showPercent="yes">
        <div id="myprogress" class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
    </div>
</div>
<div style="height: 620px;overflow-y: auto;margin: 10px 20px">
    <table class="layui-table">
        <colgroup>
            <col width="300">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>区名称</th>
            <th>完成进度</th>
        </tr>
        </thead>
        <tbody id="adminShangHaiTBody">
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
            $.post("/backstage/selProgressByShangHai",{},function (data) {
                layer.close(index);
                if(data.msg=='success'){
                    $("#adminShangHaiTBody").empty();
                    for(var i=0;i<data.result.length;i++){
                        $("#adminShangHaiTBody").append("<tr>\n" +
                            "<td style='cursor: pointer;' name='selProgressByArea'>"+data.result[i].qu+"</td>\n" +
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

            });

            $("#download2019").click(function () {
                var index1 = layer.load(2,{offset:'150px'});
                $.post("/backstage/download2019",{},function (data) {
                    layer.close(index1);
                    if(data.msg=='success'){
                        window.location.href="/backstage/download2019_1";
                    }else{
                        window.location.href="/message.jsp?message="+encodeURI(data.result);
                    }

                });
            });


              $(document).on("click","${'[name=\'selProgressByArea\']'}",function(){
                var area=$(this).text();
                layer.open({
                    title:area,
                    type: 2,
                    offset:'20px',
                    area: ['800px', '500px'],
                    content: '/backstage/adminProgressByArea.jsp?area='+encodeURI(area)
                });
            });

        });
    });


</script>
</html>
