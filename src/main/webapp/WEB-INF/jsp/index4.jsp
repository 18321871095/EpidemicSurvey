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
<body>
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>
    <div class="mycontent" style="margin-top: 3px">
        <div  style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            亲子活动
        </div>
    </div>
    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <%--index--%>
        <div  class="mycontent">
            <div class="timu" style="line-height: 30px;text-indent: 30px;">
                请您仔细回想并指出<span style="font-weight: bold;text-decoration: underline;">过去的一个月</span>里家人与您的孩子参与这些活动的次数，并圈出相应的答案。
            </div>
        </div>

        <%--1--%>
        <div onclick="hideBorder(this)" id="div1" class="mycontent">
            <div class="timu">1.与孩子一起阅读、看图画书 </div>
            <div id="3_1" class="answer"></div>
        </div>
        <%--2--%>
        <div onclick="hideBorder(this)" id="div2" class="mycontent">
            <div class="timu">2.在生活中教孩子数的概念</div>
            <div id="3_2" class="answer"></div>
        </div>
        <%--3--%>
        <div onclick="hideBorder(this)" id="div3" class="mycontent">
            <div class="timu">3.涂涂画画</div>
            <div id="3_3" class="answer"></div>
        </div>
        <%--4--%>
        <div onclick="hideBorder(this)" id="div4" class="mycontent">
            <div class="timu">4.跟孩子一起玩开发智力的游戏(如搭积木、图形配对、过家家等)</div>
            <div id="3_4" class="answer"></div>
        </div>
        <%--5--%>
        <div onclick="hideBorder(this)" id="div5" class="mycontent">
            <div class="timu">5.结合日常生活与孩子一起识字</div>
            <div id="3_5" class="answer"></div>
        </div>
        <%--6--%>
        <div onclick="hideBorder(this)" id="div6" class="mycontent">
            <div class="timu">6.一起听唱歌曲、诗歌、童谣</div>
            <div id="3_6" class="answer"></div>
        </div>
        <%--7--%>
        <div onclick="hideBorder(this)" id="div7" class="mycontent">
            <div class="timu">7.讲故事(家长讲，孩子听)</div>
            <div id="3_7" class="answer"></div>
        </div>
        <%--8--%>
        <div onclick="hideBorder(this)" id="div8" class="mycontent">
            <div class="timu">8.做手工（撕纸、剪纸、叠纸或叠手绢、捏泥等）</div>
            <div id="3_8" class="answer"></div>
        </div>

            <%--9--%>
            <div onclick="hideBorder(this)" id="div9" class="mycontent">
                <div class="timu">9.做运动（跑步或散步、踢球或抛接球、小区运动器械活动等）</div>
                <div id="3_9" class="answer"></div>
            </div>
            <%--10--%>
            <div onclick="hideBorder(this)" id="div10" class="mycontent">
                <div class="timu">10.教孩子生活自理技能，如吃饭、穿衣等</div>
                <div id="3_10" class="answer"></div>
            </div>
            <%--11--%>
            <div onclick="hideBorder(this)" id="div11" class="mycontent">
                <div class="timu">11.与孩子谈论周围发生的一些事</div>
                <div id="3_11" class="answer"></div>
            </div>
            <%--12--%>
            <div onclick="hideBorder(this)" id="div12" class="mycontent">
                <div class="timu">12.与孩子一起认识大自然的动植物</div>
                <div id="3_12" class="answer"></div>
            </div>


        <div class="mycontent">
            <div style="color: #086CFF;font-weight: bold;text-decoration: underline;padding: 5px 5px;">研究表明</div>
            <img src="/static/images/3_bottom.jpg" style="width: 40%;height: 20%;float: right;" >
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                亲子活动不但能够增进您和孩子的感情，也有利于宝宝的大脑发育，认知能力，并促进儿童的社会交往能力。
                以上问卷中的亲子项目都是非常有益于儿童发展的活动形式，请爸爸妈妈多抽时间陪陪孩子，多与他们交流互动，
                您将收获一个更加优秀的宝宝哦。

            </div>
        </div>

        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao4" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
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
<script src="${ctx}/static/js/init4.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
    })
</script>
</html>
