<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>问卷调查</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <style>
        html,body,button,input,div{
            margin: 0; padding: 0;
            outline: none;
            border: none;
        }
        body{
            width: 100%;
            max-width: 720px;
        }
        button{ width: 60%; margin: 0 20%; display: inline-block; line-height: 3em; color: #fff; box-sizing: border-box;
            border-radius: 10px;}
        .btnBox button{
            margin-top: 2em;
        }
        .btnBox button:nth-child(2){
            margin-bottom: 5em;
        }
        @media screen and (max-width: 720px) {
            .btnBox button:nth-child(2){
                margin-bottom: 0em;
            }
        }


    </style>
</head>
<body style="max-width: 720px; width: 100%; margin: 0 auto;  background: #fff; ">
<div style="width: 100%;  ">
    <img src="${ctx}/static/images/1.png" width="100%">
</div>



<div style=" width: 84%; margin: 1em 8%; font-size: 1em; color: #333; box-sizing: border-box;">
    <p style="margin-bottom: 0; line-height: 1.8;">立项单位：上海市教委托幼处</p>
    <p style="margin-bottom: 0; line-height: 1.8;">评估单位：国家儿童医学中心/上海儿童医学中心<br>
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>上海市教委信息中心学前教育信息部</p>
</div>


<div class="btnBox"  style=" width: 100%;">
    <button id="goComplete" style="background: #4cd964;">填写本次问卷</button>
    <button id="look" style="background: #f0ad4e;">查看既往报告</button>
</div>
</body>

<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        $("#goComplete").click(function () {
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

        $("#look").click(function () {
            window.location.href="/frontEnd/childPDF.jsp";
        });

    })
</script>
</html>
