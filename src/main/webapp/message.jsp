<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>提示</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
</head>
<body style="background: #fff;">
<div class="mui-content" style="background: #fff;">
    <div class="tipImg" style="">
        <img src="${ctx}/static/images/tip2.png" width="100%">
    </div>
    <!--  -->
    <div class="txBox">
        ${param.message}
    </div>
</div>
</body>
<script>
    console.log(/^1[3456789]\d{9}$/.test($("#phone").val()))
</script>
</html>
