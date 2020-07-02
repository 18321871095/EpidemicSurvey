<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/indexSelect.css?v=1">
</head>
<body style="max-width: 720px;margin:  0 auto;">

<!-- <header class="mui-bar mui-bar-nav">
    <h1 class="mui-title">签到</h1>

</header> -->

    <div id="editor_bgImg" style="width: 100%; background:url(/static/images/bg1.jpg) no-repeat; background-size: cover; position: relative; overflow: auto;">
        <div class="formBox" style="position: absolute; top: 0; left: 5%; width: 90%; box-sizing: border-box;  border-radius: 10px;">
            <img src="/static/images/z.png" width="100%" style="margin-top: 130px;"/>
            <ul id="myul" class="btnList" style="margin-top: 50%">
                <li id="school">
                    <span class="iconfont">&#xe676;</span>
                    学校负责人
                </li>
                <li id="region">
                    <span class="iconfont">&#xe685;</span>
                   区教育局负责人
                </li>
            </ul>
        </div>

    </div>


</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script>
    $(function () {
        $('#editor_bgImg').height($(window).height());
       // $("#myul").css("margin-top",$(window).height()*0.25+"px");
        $("li").click(function () {
            var type=$(this).attr("id");
            if(type=='school'){
                window.location.href="/static/sign/sign.jsp";
            }else{
                window.location.href="/static/sign/signRegion.jsp";
            }

        });
    })
</script>
</html>
