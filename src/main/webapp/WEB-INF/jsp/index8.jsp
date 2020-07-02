<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>问卷</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${ctx}/static/css/questionNaireSurvey.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <style>
        .mui-progressbar
        {
            background: none;
        }
        .mui-select:before{
            right: -3px;
            color: red;
            top:13px;
        }
        .mytd7{
            width: 65%;
            line-height: 26px;
            padding: 0px 5px;
        }


        .myinput {
            width: 20px;
            height: 20px;
            opacity: 0;
        }

        .table11 .mui-checkbox.mui-left label, .table11 .mui-radio.mui-left label{
            padding-right: 15px;
            padding-left: 0px;
            margin-left: 0px;
        }
        .table11 .mui-checkbox input[type=checkbox], .table11 .mui-radio input[type=radio]{
            margin: 0px;
        }
        .table11 .mui-checkbox input[type=checkbox], .table11 .mui-radio input[type=radio]{
            position: unset;
        }


    </style>
</head>
<body>
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>
    <div class="mycontent" style="margin-top: 3px">
        <div  style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            长处和困难调查表
        </div>
    </div>

    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div class="mycontent">
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                对于下面的各个问题，请在相应的空格上划勾，以表明是否符合您孩子的情况。
                <span style="text-decoration: underline;">请根据您孩子过去6个月的行为来回答。</span>
                请务必回答每一道题，即使您对某一题不是十分确定或不很清楚。
            </div>
        </div>

        <div  name="1" class="mycontent">
            <div style="margin: 10px 5px;">
                <table  border="1" style="width: 100%;color: #666666" >
                    <tr>
                        <td style="text-align: center;width: 64%">问题选项</td>
                        <td style="width: 12%">不真实</td>
                        <td style="width: 12%">有点真实</td>
                        <td style="width: 12%">完全真实</td>
                    </tr>
                </table>
                <div style="height: 300px;overflow-y: auto;">
                    <table border="1" class="table11" style="color: #666666;width: 100%;table-layout: fixed;">
                        <tbody id="table_7">

                        </tbody>
                    </table>
                </div>


            </div>
            <br/>
        </div>


        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao8" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>
</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/init8.js?v=123"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();

    })
</script>
</html>
