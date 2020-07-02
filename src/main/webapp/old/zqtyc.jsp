<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>知情同意</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/mui.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
</head>
<body style="background: #fff;">

<div class="mui-content" style="background: #fff; width: 90%; margin:0 auto;">

    <h2 class="zqtyJ-tit">孩子知情同意书</h2>
    <div id="div1" style="width:100%; height:62%;overflow: auto">
        <div class="zqtyJ">
            <div style=" font-family: '微软雅黑';font-size: 17px;padding-left: 10px;padding-bottom: 5px;padding-top: 10px">
                亲爱的孩子：
            </div>
            <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                &nbsp; &nbsp; &nbsp; &nbsp;在这个特殊的时期，每一个中国人都在以居家隔离的方式，与新冠疫情开展着积极的斗争。我们的孩子们也不例外，不能出门、不能走亲戚、不能去游乐场，如今又迎来了上“网课”的全新教育方式。为了更好地帮助孩子们度过这一重要时期，应对超长假期所带来的屏幕时间过长、身体活动减少、睡眠时间不规律等健康风险因素，为孩子们提供更好的活动素材，为家长做好支持，本调查拟通过问卷调查的形式，了解疫情期间上海市儿童青少年的生活行为方式和心理健康水平，为紧接着提供更好的服务提供科学依据。</p>
            <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                &nbsp; &nbsp; &nbsp; &nbsp;1.疫情期间居家上课，大家积极参与，我们作为上海市教委抗疫专家组成员，特别关注。。。问题，在上海市教委的大力支持下，开展。。。项目，为大家提供服务，广泛征询资源，网，为了。。。调查</p>
            <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                &nbsp; &nbsp; &nbsp; &nbsp;本调查受上海市教育委员会委托，将在上海市小学、中学和高中在校学生中开展，总调查人数为2万人。该研究的参与坚持自愿原则，受调查者可以随时终止或退出调查。所有填写信息资料仅作为研究用途，研究记录除可能被申办者、伦理委员会查阅以外，严格保密，不会有任何泄露。研究结束后，相关结果我们会以科普报告的形式反馈给学校和社会，并且通过媒体开展相关知识的宣传，为孩子们定制疫情期间生活安排和健康指导的特别计划，为您的孩子的身心健康和一生幸福保驾护航。</p>

            <div style="  font-family: '微软雅黑'; font-size: 16px;padding-left: 10px;padding-right: 10px;line-height: 30px;">
                研究联系人：国家儿童医学中心/上海儿童医学中心儿童健康管理研究所
            </div>
            <div style="  font-family: '微软雅黑'; font-size: 16px;padding-left: 10px;padding-right: 10px;line-height: 30px;">
                赵瑾（021-38626064，18221608697）
            </div>
            <p class="yy">受调查者知情同意声明：</p>
            <p class="yy">我已被告知“上海市学龄儿童青少年新冠疫情期间健康生活行为方式”调研项目的背景、目的、调查内容及获益情况。我已知晓我所提供的的资料中涉及到的个人信息会得到保密，不会泄露。</p>

        </div>
    </div>

    <p class="yy">已阅读本协议，是否同意本协议：</p>
    <div>

        <div class="mui-row mui-input-row">
            <div class="mui-col-sm-6">
                <div class=" mui-radio mui-left">
                    <label>是</label>
                    <input name="radio1" type="radio" value="1">
                </div>
            </div>
            <div class=" mui-col-sm-6">
                <div class="mui-radio mui-left">
                    <label>否</label>
                    <input name="radio1" type="radio" value="0">
                </div>
            </div>
        </div>

        <div class="mui-input-row">
            <button class="subBtn">提交</button>
        </div>
    </div>

</div>

</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script>
    $(function () {
        $(".subBtn").click(function () {
            var agree=$("[name='radio1']:checked").val();
            if(typeof (agree)=='undefined'){
                mui.toast("请选择是否同意")
            }else{
                if(agree=='1'){
                   window.location.href="/survey/doSurveyChild";
                }else{
                    window.location.href="/survey/childNotAgree";
                }
            }
        });
    })
</script>
</html>
