<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>信息</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/mui.min.css">
    <style>
        p {
            text-indent: 22px;
            padding: 5px 8px;
            margin-top: 20px;
            font-size: 17px;
        }
        html,
        body,
        .mui-content {
            background-color: #fff;
        }
        h4 {
            margin-left: 5px;
        }


    </style>
</head>
<header class="mui-bar mui-bar-nav">
    <h1 class="mui-title" style="font-size: 21px;">孩子问卷二维码</h1>
</header>
<body style="max-width: 750px;margin:  0 auto;">
<div class="mui-content">
    <div class="mui-content-padded" style="margin: 50px 10px;">
        <div id="myEnCode" style="/*border: 1px solid red;*/height: 200px;width: 200px;margin: 30px auto;">

        </div>
        <p style="line-height: 30px;">亲爱的家长您好！请您的孩子用手机微信扫描上方二维码填写问卷。</p>
          <%--  <span id="url"></span></p>--%>
        <div style="text-align: center;">
        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/jquery.qrcode.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script>
    $(function () {
        var url=window.location.protocol+"//"+window.location.host;
        //console.log(url)
        $("#myEnCode").empty().qrcode({
            render: "canvas", //table方式
            width: 200, //宽度
            height:200, //高度
            text:url+"/survey/child?phone=${param.phone}&classType=${param.classType}"
        });
        //$("#url").text(url+"/survey/child");
        /* $("button").click(function () {
             window.location.href="/static/sign/mobileLogin.jsp";
         });*/
    })
</script>

</html>
