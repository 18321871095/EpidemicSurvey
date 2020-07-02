<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>知情同意</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <style>
        .btn{
            background: #2d78f4;
            border: 1px solid #2d78f4;
            width: 75%;
            color: #fff;
            height: 35px;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div style="max-width: 750px;margin:  0 auto;background-color: #4b98e6;">
    <div style="width: 100%;height: 12%;margin: 0 auto;">
        <img src="${ctx}/static/images/informedConsent.jpg" width="100%" height="100%">
    </div>
    <div style=" width: 100%;margin: 0 auto;">
        <div class="mui-card mydiv">
            <div class="mui-card-content">
                <div style=" font-family: '微软雅黑';font-size: 17px;padding-left: 10px;padding-bottom: 5px;padding-top: 10px">
                    亲爱的孩子家长：
                </div>
                <c:if test="${param.biaoshi=='2'}">
                    <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                        &nbsp; &nbsp; &nbsp; &nbsp;作为全国0－3岁婴幼儿早期教养工作的试点地区之一，上海市教委一直在积极探索更有效的早教指导方式。为了更好的了解、评估上海市儿童的早期发展水平，2017年11月，在上海市所有幼儿园新入园儿童中随机抽取约2.5万人，进行了第一轮调查。首先非常感谢您积极配合当时的调查，利用宝贵的时间完成了一份问卷，提供了您的宝宝关于儿童早期发展的一些详细信息，您细心的回答确保了我们调研结果的可靠性。为了给家长们在育儿过程中提供一些科学的建议，我们已经为每个宝宝建立了成长档案，家长们可以通过问卷平台查阅宝宝在当时的各项成长和发展指标，并且与上海市总体同年龄儿童平均水平进行比对。上期调研结果的总体情况，也已经形成政策建议报告提交给上海市教委，为政府在上海市儿童早期发展的下一步工作提供了决策建议。在此，我们向您再一次表示由衷的感谢！</p>
                    <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                        &nbsp; &nbsp; &nbsp; &nbsp;现在，您的宝宝已经进入幼儿园学习生涯的结束阶段，我们拟在上一轮调查的基础上，开展第二轮调研。本次调查仍然通过问卷的形式，旨在动态评估上海市儿童的早期发展水平变化，为未来提供更好的早教服务提供科学依据。在完成本轮调查后，您家宝宝的成长档案将会进一步丰富，您将能够看到宝宝的发展和进步，也将能够在与上海市同龄儿童的总体情况对比下，得到进一步的育儿建议。</p>
                    <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                        &nbsp; &nbsp; &nbsp; &nbsp;本调查受上海市教育委员会委托，将在上海市所有幼儿园2017年入学时参与并完成了第一轮调查的宝宝中开展，总调查人数为2.5万人。该研究的参与坚持自愿原则，受调查者可以随时终止或退出调查。所有填写信息资料仅作为研究用途，研究记录除可能被申办者、伦理委员会查阅以外，严格保密，不会有任何泄露。研究结束后，相关结果我们会以科普报告的形式反馈给学校和社会，并且通过媒体开展相关知识的宣传，与家长共享最新的科学育儿知识，为您的孩子的身心健康和一生幸福保驾护航。
                    </p>
                </c:if>
                <c:if test="${param.biaoshi=='1'}">
                    <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                        &nbsp; &nbsp; &nbsp; &nbsp;您好！2020年1月，由新型病毒感染引起的急性传染病蔓延全国，疫情发生后，全国所有省市进入公共卫生一级响应状态，我们的孩子也经历了一整个学习的特殊“居家”生活。有研究提出，居家限制的特殊时期中，孩子们的生活行为方式会发生各种变化，比如和小朋友的互动机会减少，运动水平降低、屏幕时间增加、睡眠规律变差等等，同时，这些变化可能会导致孩子们的身体健康和心理健康发生变化，如何能够通过学校和家庭的共同努力，帮助我们的孩子度过这个特殊时期，恢复正常的学习生活，正是我们的家长和学校在这一阶段所共同关心的问题。</p>
                    <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                        &nbsp; &nbsp; &nbsp; &nbsp;您的孩子在2019年11月参加了“上海市儿童早期发展状况”调查项目，我们已为您的孩子制定了个人专属健康小档案，可以下载查看。同时，我们也诚邀您参加此次“上海市儿童早期发展状况——疫情居家学习专题”，在这次调查中，我们将会针对疫情期间孩子的生活行为方式和健康水平进行调查，并与去年11月的情况进行比较，这些信息汇总整理分析后，将为提高上海市学前工作课程及服务质量提供非常有力的理论依据，给您和您的孩子在疫情后时代提供更细致、更满意的教育服务。您的认真有效填写及信息反馈将形成宝贵的财富，在调查过程中您也可以通过回答相关问题了解一些有关儿童早期发展真是的知识和育儿要点，最终还能得到一份专属报告，以更好地陪伴您宝宝的成长与发展。 </p>
                </c:if>
                <div style="  font-family: '微软雅黑'; font-size: 16px;padding-left: 10px;padding-right: 10px;line-height: 30px;">
                    研究联系人：国家儿童医学中心/上海儿童医学中心儿童健康管理研究所
                </div>

            </div>
            <div style="  font-family: '微软雅黑'; font-size: 16px;padding-left: 10px;padding-right: 10px;line-height: 30px;">
                赵瑾（021-38626092，18221608697）
            </div>
            <br><br>
        </div>
        <div class="mui-card mydiv">
            <div class="mui-card-content">
                <div style="font-family: '微软雅黑';font-size: 17px;padding-left: 10px;padding-bottom: 10px;padding-top:
                            10px;text-decoration: underline;font-weight: bold">受调查者知情同意声明：</div>
                <p style="line-height: 31px;font-size: 16px;padding-left: 10px;padding-right: 10px;">
                    &nbsp; &nbsp; &nbsp; &nbsp;我已被告知“上海市儿童早期发展状况评估”调研项目的背景、目的、
                    调查内容及获益情况。我已知晓我所提供的的资料中涉及到的个人信息会得到保密，不会泄露。</p>
            </div>
            <div class="mui-input-row mui-radio mui-left">
                <label style="font-weight: bold;font-family: '微软雅黑';font-size: 16px">同意参加这项调研</label>
                <input name="ques4_w3" type="radio" value="1">
            </div>
            <div class="mui-input-row mui-radio mui-left">
                <label style="font-weight: bold;font-family: '微软雅黑';font-size: 16px">不同意参加这项调研</label>
                <input name="ques4_w3" type="radio" value="2">
            </div>
            <br>
            <div style="text-align: center;">
                <button id="queding" class="btn">确定</button>
            </div>
            <br><br>
        </div>
        <br><br>
    </div>
</div>

</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script>
    $(function () {
        $("#queding").click(function () {
            var value=$("[name='ques4_w3']:checked").val();
            if(value=='1'){
                window.location.href="/survey/questionnaire";
            }else{
                mui.confirm('是否不同意此次问卷调查？', '提示', ['取消','确定'], function(e) {
                    if (e.index == 1) {
                        window.location.href="/frontEnd/notagree.jsp";
                    }
                })
            }
        });
    })
</script>
</html>
