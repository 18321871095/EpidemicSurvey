<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="${ctx}/static/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="${ctx}/static/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <style>
        .mui-progressbar {
            background: none;
        }

        .myspan1 {
            float: left;
            width: 33.333%;
            display: inline-block;
        }

        .myspan2 {
            float: left;
            width: 33.333%;
            display: inline-block;
            text-align: center;
        }

        .myspan3 {
            float: left;
            width: 33.333%;
            text-align: right;
            display: inline-block;
        }

        .rangeDiv {
            width: 90%;
            margin-right: 5%;
            margin-left: 5%;
            margin-bottom: 5%;
            margin-top: 10px
        }

        .irs js-irs-0 irs-with-grid {
            width: 92% !important;
            margin: 0 auto !important;
        }
    </style>
</head>
<body>
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>
    <div class="mycontent" style="margin-top: 3px">
        <div style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            儿童共情能力调查量表
        </div>
    </div>


    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div class="mycontent">
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                请仔细阅读并完成以下每个题目，根据小孩的实际情况评估您同意或不同意以下叙述的程度，然后选择横轴上您觉得比较适合的点。横轴所代表的是同意或不同意程度的范围，也就是说最左侧（-4）代表非常不同意，最右侧（+4）代表非常同意，中间的
                0 则代表不确定，总之，离中间点（0）越远，则代表同意或不同意的程度越高。
            </div>
        </div>


        <div id=div1 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                1.看到另一个小孩找不到人一起玩，会让我的孩子感到难过。
                <div id=range1></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem1 name=gem1 value="0"/>
            <br/>
        </div>
        <div id=div2 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                2.我的孩子会把小狗小猫当成是人一样去对待。
                <div id=range2></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem2 name=gem2 value="0"/>
            <br/>
        </div>
        <div id=div3 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                3.当我的孩子看到人们在公众场合亲吻和拥抱时会反应很糟糕
                <div id=range3></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem3 name=gem3 value="0"/>
            <br/>
        </div>
        <div id=div4 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                4.我的孩子会因为另一个小孩的烦乱不安而感到过意不去
                <div id=range4></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem4 name=gem4 value="0"/>
            <br/>
        </div>
        <div id=div5 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                5.当我的孩子周围有小孩难过时，他/她也会感到难过
                <div id=range5></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem5 name=gem5 value="0"/>
            <br/>
        </div>
        <div id=div6 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                6.我的孩子不能理解为什么其他人会喜极而泣
                <div id=range6></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem6 name=gem6 value="0"/>
            <br/>
        </div>
        <div id=div7 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                7.当看到另一个小孩因为调皮而被惩罚时，我的孩子会感到不安
                <div id=range7></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem7 name=gem7 value="0"/>
            <br/>
        </div>
        <div id=div8 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                8.我的孩子看起来能对周围人的情绪做出反应
                <div id=range8></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem8 name=gem8 value="0"/>
            <br/>
        </div>
        <div id=div9 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                9.当看到另一个人表现得烦乱不安时，我的孩子也会感到烦乱不安
                <div id=range9></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem9 name=gem9 value="0"/>
            <br/>
        </div>
        <div id=div10 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                10.我的孩子喜欢看别人拆开礼物，即使没有他/她自己的一份
                <div id=range10></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem10 name=gem10 value="0"/>
            <br/>
        </div>
        <div id=div11 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                11.看到另一个小孩在哭，会让我的孩子哭泣或感到不安
                <div id=range11></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem11 name=gem11 value="0"/>
            <br/>
        </div>
        <div id=div12 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                12.当我的孩子看到另一个小孩受伤时会感到不安
                <div id=range12></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem12 name=gem12 value="0"/>
            <br/>
        </div>
        <div id=div13 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                13.当我难过的时候，我的孩子似乎没有注意到
                <div id=range13></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem13 name=gem13 value="0"/>
            <br/>
        </div>
        <div id=div14 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                14.看到另一个孩子大笑，我的孩子也会跟着笑
                <div id=range14></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem14 name=gem14 value="0"/>
            <br/>
        </div>
        <div id=div15 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                15.悲伤的电影或电视节目会让我的孩子感到难过
                <div id=range15></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem15 name=gem15 value="0"/>
            <br/>
        </div>
        <div id=div16 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                16.当我的孩子周围有其他小孩紧张时，他/她也会变得紧张
                <div id=range16></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem16 name=gem16 value="0"/>
            <br/>
        </div>
        <div id=div17 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                17.要明白为什么有人会感到烦乱不安，对于我的孩子来说很困难
                <div id=range17></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem17 name=gem17 value="0"/>
            <br/>
        </div>
        <div id=div18 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                18.我的孩子会感到烦乱不安当他/她看到有小动物受伤
                <div id=range18></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem18 name=gem18 value="0"/>
            <br/>
        </div>
        <div id=div19 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                19.我的孩子会为残疾人（例如：坐在轮椅上的人）感到难过
                <div id=range19></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem19 name=gem19 value="0"/>
            <br/>
        </div>
        <div id=div20 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                20.我的孩子几乎不怎么明白为什么其他人会哭
                <div id=range20></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem20 name=gem20 value="0"/>
            <br/>
        </div>
        <div id=div21 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                21.我的孩子会把饼干罐里的最后一块饼干吃掉，即使是当他/她知道有人也想要吃
                <div id=range21></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem21 name=gem21 value="0"/>
            <br/>
        </div>
        <div id=div22 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                22.当另一个人表现得很开心的时候，我的孩子也会表现得很开心
                <div id=range22></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem22 name=gem22 value="0"/>
            <br/>
        </div>
        <div id=div23 style="color: #666666" class="mycontent">
            <div class="rangeDiv">
                23.我的孩子不会因为周围有人烦乱不安而受到影响
                <div id=range23></div>
                <div style="width: 100%;height: 30px;font-size: 14px;">
                    <span style="float: left;" class="myspan1">非常不同意</span>
                    <span style="float: left;" class="myspan2">不确定</span>
                    <span style="float: left;" class="myspan3">非常同意</span>
                </div>
            </div>
            <input type="hidden" id=gem23 name=gem23 value="0"/>
            <br/>
        </div>


        <%--提交--%>
        <div style="text-align: center;">
            <button id="tijiao9"
                    style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
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
<script src="${ctx}/static/js/ion.rangeSlider.min.js"></script>
<script src="${ctx}/static/js/init9.js?v=1"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
        //  $("#div1").find("span[class='irs js-irs-0 irs-with-grid']").css("width","90%").css("margin","0 auto");
        /* $("#div1").find("span[class='irs-grid-text']").each(function () {
             console.log($(this))
         });*/
    })
</script>
</html>
