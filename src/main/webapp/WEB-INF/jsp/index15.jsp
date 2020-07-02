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
    <style>
        .mui-progressbar {
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
        <div style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            母亲共情能力问卷
        </div>
    </div>


    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div class="mycontent">
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                不同情况下人们会有不同的感受。下面你将看到一些描述，请阅读每一项描述，
                并判断你在多大程度上同意或是不同意这些描述，在对应得数字打勾。
                题目没有对错，请尽快并诚实回答。
            </div>
        </div>


        <div id="div1" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">1.有时候我发现从他人的角度看事情是困难的</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem1" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem1" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem1" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem1" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div2" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">2.看电影或看戏时，我通常是客观的，而且不常全身心投入</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem2" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem2" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem2" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem2" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div3" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">3.做决定之前，我试着去看分歧中每个人的立场</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem3" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem3" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem3" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem3" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div4" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">4.有时候我想象从朋友的观点来看事情，以便更好理解他们</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem4" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem4" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem4" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem4" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div5" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">5.当我对一个人生气时，我通常会试着从他的角度想一下</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem5" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem5" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem5" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem5" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div6" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">6.在批评别人前，我会试着想象：假如我处在他的情况，我的感受会是如何</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem6" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem6" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem6" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem6" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div7" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">7.我经常为朋友们的问题担心</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem7" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem7" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem7" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem7" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div8" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">8.当我周围的人看起来焦虑时，我也会倾向于变得焦虑</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem8" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem8" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem8" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem8" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div9" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">9.和我一起的其他人对我的情绪有很大影响</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem9" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem9" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem9" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem9" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div10" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">10.如果我的朋友看起来很难过，对我影响很大</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem10" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem10" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem10" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem10" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div11" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">11.我经常深深陷入电影，戏剧和小说中的人物的感情</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem11" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem11" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem11" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem11" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div12" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">12.看到别人哭，我感到非常难过</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem12" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem12" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem12" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem12" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div13" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">13.和高兴的人在一起我感到开心，和伤心的人在一起我感到悲伤</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem13" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem13" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem13" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem13" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div14" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">14.他人的忧虑和恐惧令我感到担忧</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem14" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem14" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem14" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem14" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div15" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">15.如果有人想加入谈话，我能轻易察觉</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem15" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem15" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem15" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem15" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div16" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">16.当别人说话口是心非的时候，我能很快发现</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem16" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem16" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem16" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem16" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div17" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">17.我很难理解有些事情会让人们那么不安</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem17" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem17" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem17" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem17" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div18" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">18.从别人的角度设身处地地想问题对我来说很容易</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem18" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem18" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem18" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem18" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div19" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">19.我擅长预测别人的感受</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem19" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem19" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem19" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem19" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div20" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">20.一群人中如果有人感到尴尬或是不舒服，我能够很快发现</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem20" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem20" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem20" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem20" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div21" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">21.其他人告诉我，我善于理解他们的感受和想法</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem21" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem21" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem21" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem21" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div22" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">22.我能够轻易发现别人对我正在谈论的事情是有兴趣的，还是感到厌烦</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem22" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem22" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem22" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem22" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div23" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">23.朋友们经常和我谈论他们的问题因为他们认为我非常能够理解他们</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem23" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem23" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem23" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem23" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div24" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">24.我可以察觉我是否打扰到别人，即使他们没说</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem24" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem24" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem24" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem24" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div25" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">25.我能够很容易发现其他人想要谈论的事情</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem25" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem25" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem25" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem25" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div26" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">26.当人们掩盖他们真实情感的时候，我能看出来</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem26" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem26" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem26" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem26" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div27" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">27.我善于预测别人的行为</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem27" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem27" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem27" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem27" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div28" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">28.我通常能够理解他人的观点，即使我不赞同</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem28" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem28" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem28" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem28" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div29" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">29.看电影时，我通常在情感上是与电影脱离的</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem29" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem29" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem29" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem29" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div30" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">30.做事情之前我总是尽量考虑到他人的感受</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem30" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem30" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem30" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem30" type="radio" value="4">
                </div>
            </div>
        </div>
        <div id="div31" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">31.做事情之前，我尽量考虑到朋友们会有什么反应</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不同意</label>
                    <input name="qacem31" type="radio" value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点不同意</label>
                    <input name="qacem31" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>有点同意</label>
                    <input name="qacem31" type="radio" value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常同意</label>
                    <input name="qacem31" type="radio" value="4">
                </div>
            </div>
        </div>


        <%--提交--%>
        <div style="text-align: center;">
            <button id="tijiao15"
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
<script src="${ctx}/static/js/init15.js?v=123"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
    })
</script>
</html>
