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
    </style>
</head>
<body >
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>

    <div class="mycontent" style="margin-top: 3px">
        <div  style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            照养人心理健康状况
        </div>
    </div>


    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div class="mycontent">
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                请在下面五个句子的每个句子（表达）中标出在过去两星期里你最接近感觉状态。
                请注意数字越大表明你的身心越健康。例如：第一题，如果你在过去两星期里有一半以上时间感到快乐、
                心情舒畅，就选择“超过一半的时间”。
            </div>
        </div>


        <div  id="div1" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">1.我感觉快乐、心情舒畅</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>5&nbsp;所有时间</label>
                    <input  name="who1" type="radio"  value="5">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>4&nbsp;大部分时间</label>
                    <input  name="who1" type="radio"  value="4">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>3&nbsp;超过一半的时间</label>
                    <input  name="who1" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>2&nbsp;少于一半的时间</label>
                    <input  name="who1" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>1&nbsp;有时候</label>
                    <input  name="who1" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>0&nbsp;从未有过</label>
                    <input  name="who1" type="radio"  value="0">
                </div>

            </div>
        </div>

        <div  id="div2" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">2.我感觉宁静和放松</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>5&nbsp;所有时间</label>
                    <input  name="who2" type="radio"  value="5">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>4&nbsp;大部分时间</label>
                    <input  name="who2" type="radio"  value="4">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>3&nbsp;超过一半的时间</label>
                    <input  name="who2" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>2&nbsp;少于一半的时间</label>
                    <input  name="who2" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>1&nbsp;有时候</label>
                    <input  name="who2" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>0&nbsp;从未有过</label>
                    <input  name="who2" type="radio"  value="0">
                </div>

            </div>
        </div>

        <div  id="div3" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">3.我感觉充满活力、精力充沛</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>5&nbsp;所有时间</label>
                    <input  name="who3" type="radio"  value="5">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>4&nbsp;大部分时间</label>
                    <input  name="who3" type="radio"  value="4">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>3&nbsp;超过一半的时间</label>
                    <input  name="who3" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>2&nbsp;少于一半的时间</label>
                    <input  name="who3" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>1&nbsp;有时候</label>
                    <input  name="who3" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>0&nbsp;从未有过</label>
                    <input  name="who3" type="radio"  value="0">
                </div>

            </div>
        </div>

        <div  id="div4" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">4.我睡醒时感到清新、得到了足够的休息</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>5&nbsp;所有时间</label>
                    <input  name="who4" type="radio"  value="5">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>4&nbsp;大部分时间</label>
                    <input  name="who4" type="radio"  value="4">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>3&nbsp;超过一半的时间</label>
                    <input  name="who4" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>2&nbsp;少于一半的时间</label>
                    <input  name="who4" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>1&nbsp;有时候</label>
                    <input  name="who4" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>0&nbsp;从未有过</label>
                    <input  name="who4" type="radio"  value="0">
                </div>

            </div>
        </div>

        <div  id="div5" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">5.我每天生活充满了有趣的事情</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>5&nbsp;所有时间</label>
                    <input  name="who5" type="radio"  value="5">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>4&nbsp;大部分时间</label>
                    <input  name="who5" type="radio"  value="4">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>3&nbsp;超过一半的时间</label>
                    <input  name="who5" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>2&nbsp;少于一半的时间</label>
                    <input  name="who5" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>1&nbsp;有时候</label>
                    <input  name="who5" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>0&nbsp;从未有过</label>
                    <input  name="who5" type="radio"  value="0">
                </div>

            </div>
        </div>


        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao11" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>
    <div style="border:  1px solid #007aff;width: 100%;height: 20px;margin-top: 5px;">
        <div id="demo11" class="mui-progressbar" style="height: 18px;background: #fff;">
            <span></span>
            <div style="position: absolute; left: 45%; color: orange; top: 0">95%</div>
        </div>
    </div>
</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/init11.js?v=1"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
        mui("#demo11").progressbar({progress:95}).show();
    })
</script>
</html>
