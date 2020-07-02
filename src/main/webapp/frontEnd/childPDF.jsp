<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body style="max-width: 720px; width: 100%; margin: 0 auto;  background: #fff; ">
<iframe  id="pdfiframe" width="100%" height="95%"></iframe>
<div style="height: 5%;text-align: center;">
    <button id="goSurvey" style="background: #4cd964;
    color: #fff;
    border: 1px solid #4cd964;
    width: 50%;">填写本次问卷</button>
</div>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        var mysrc="${ctx}/static/pdfjs/web/viewer.html?file="+encodeURIComponent("${ctx}/survey/lookPDF")
        $("#pdfiframe").attr("src",mysrc);
        hideCss();
        $("#goSurvey").click(function () {
            //window.location.href="/frontEnd/informedConsent.jsp";
            sendRequest("查询中...",10000,"/survey/getAnswer",{},function (data) {
                if(data.msg=='001'){
                    mui.alert(data.result);
                }else if(data.msg=='002'){
                    window.location.href="/frontEnd/informedConsent.jsp?biaoshi="+data.result;
                }else if(data.msg=='003'){
                    window.location.href="/util/goIndex";
                }
            });
        });
    })

    function hideCss() {
        var time = setInterval(function () {
            console.log("查找")
            if($("#pdfiframe").contents().find("#toolbarViewerLeft")!=undefined){
                $("#pdfiframe").contents().find("#toolbarViewerLeft").css("display","none");
                if($("#pdfiframe").contents().find("#toolbarViewerRight")!=undefined){
                    $("#pdfiframe").contents().find("#toolbarViewerRight").css("display","none");
                    if($("#pdfiframe").contents().find("#scaleSelectContainer")!=undefined){
                        $("#pdfiframe").contents().find("#scaleSelectContainer").css("display","none");
                        clearInterval(time);
                    }
                }
            }

        },500)
    }
</script>
</body>
</html>
