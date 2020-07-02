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
    <link href="${ctx}/static/css/mui.picker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.dtpicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.poppicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <style>
        .mui-progressbar
        {
            background: none;
        }
        input{
            border-top: none;
            border-right: none;
            border-left: none;
            border-bottom: 1px solid #000;
            width: 86%;
            text-align: center;
        }
        .myi{
            display:inline-block;
            width:0;
            height:0;
            border-top:5px solid red;
            border-left:4px solid transparent;
            border-right:4px solid transparent;
            border-bottom:0;
            position: relative;
            right: 8px;
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
            屏幕暴露的问题
        </div>
    </div>
    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div id="div1" onclick="hideBorder(this)" name="1" class="mycontent">
            <div class="timu">1.您的孩子第一次接触电子屏幕（包括电视、电脑、平板电脑、手机等）的时间？</div>
            <div  class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>12月龄以前</label>
                    <input  name="media2" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>12-18月龄</label>
                    <input  name="media2" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>18-24月龄</label>
                    <input  name="media2" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>24月龄以后</label>
                    <input  name="media2" type="radio"  value="4">
                </div>
            </div>
        </div>

        <div class="mycontent">
            <div class="timu">2.<span style="font-weight: bold;text-decoration: underline;">
                过去一个月内,</span>您的孩子平均每天花多少时间在屏幕媒介
                （如电视、电脑、手机、平板等）？ </div>
            <div style="margin: 5px 10px;">
                <span style="font-weight: bold;color: #086cfe;text-decoration: underline; ">益智类视频节目</span>
                <div style="margin: 5px 15px;text-indent: 20px;line-height: 25px;color: #666666 !important;">
                    具有明确的提高认知或亲社会意图，认知包括数数、阅读技能及其他入学准备技能；亲社会包括适合情景的行为和人际互动，如分享、友情、药物知识等。
                    包括：巧虎、爱探险的朵拉、多纳英语、小猪佩琪、宝宝巴士、螺丝钉钉钉、米奇妙妙屋、小P优优、蓝迪、芝麻街、智慧树、科学小子席德等
                </div>
            </div>
            <div style="margin: 5px 10px;">
                <span style="font-weight: bold;color: #086cfe;text-decoration: underline; ">娱乐类儿童视频节目</span>
                <div style="margin: 5px 15px;text-indent: 20px;line-height: 25px;color: #666666 !important;">
                    包括：迪亚哥、小马宝莉、大头儿子小头爸爸、熊出处、火影忍者、柯南、海底小纵队、小羊肖恩、
                    超级飞侠、小公主苏菲亚、黑猫警长、欢乐蹦蹦跳、瓦贝儿歌、托马斯、好朋友乐高、米菲兔、大力水手、
                    麦昆、喜羊羊、天线宝宝等
                </div>
            </div>
            <div style="margin: 10px;">
                <span style="font-weight: bold;color: #086cfe;text-decoration: underline; ">上学日（周一至周五）</span>
                <div id="div2" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    1)看益智类或早教类视频节目
                    <div style="display: inline-block;width: 100%">
                        <input id="media3" name="media3" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>
                <div id="div3" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    2)看娱乐卡通类视频节目
                    <div style="display: inline-block;width: 100%">
                        <input id="media4" name="media4" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

                <div id="div4" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    3)看看非儿童类视频节目
                    <div style="display: inline-block;width: 100%">
                        <input id="media5" name="media5" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

                <div id="div5" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    4)玩电子游戏的时间
                    <div style="display: inline-block;width: 100%">
                        <input id="media6" name="media6" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

                <div id="div6" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    5)上网（如浏览网页、微信、微博等）
                    <div style="display: inline-block;width: 100%">
                        <input id="media7" name="media7" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

            </div>
            <div style="margin: 10px;">
                <span style="font-weight: bold;color: #086cfe;text-decoration: underline; ">休息日（周六及周日）</span>
                <div id="div7" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    1)看益智类或早教类视频节目
                    <div style="display: inline-block;width: 100%">
                        <input id="media8" name="media8" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>
                <div id="div8" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    2)看娱乐卡通类视频节目
                    <div style="display: inline-block;width: 100%">
                        <input id="media9" name="media9" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

                <div id="div9" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    3)看看非儿童类视频节目
                    <div style="display: inline-block;width: 100%">
                        <input id="media10" name="media10" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

                <div id="div10" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    4)玩电子游戏的时间
                    <div style="display: inline-block;width: 100%">
                        <input id="media11" name="media11" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

                <div id="div11" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                    5)上网（如浏览网页、微信、微博等）
                    <div style="display: inline-block;width: 100%">
                        <input id="media12" name="media12" readonly="readonly"/><i class="myi"></i>
                    </div>
                </div>

            </div>
            <div id="div12" onclick="hideBorder(this)" style="margin: 10px 15px;color: #666666 !important;">
                主要观看的节目有哪些（如巧虎）?
                <div style="margin: 10px 15px">
                    <input type="text" id="media13" name="media13"  placeholder="请填写"/>
                </div>
            </div>
            <br/>
        </div>


        <div id="div13" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">3.您的孩子观看电视时，您或者其他照养人陪同观看的时间？</div>
            <div  class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>一半或不到一半的时间</label>
                    <input  name="media14" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>绝大多数的时间</label>
                    <input  name="media14" type="radio"  value="2">
                </div>

            </div>

        </div>

        <div id="div14" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">4.您的孩子观看电视时，您或者其他照养人与其交流电视内容的时间？</div>
            <div  class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>一半或不到一半的时间</label>
                    <input  name="media15" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>绝大多数的时间</label>
                    <input  name="media15" type="radio"  value="2">
                </div>

            </div>

        </div>


        <div class="mycontent">
            <div style="color: #086CFF;font-weight: bold;padding: 5px 5px;">目前权威建议：</div>
            <%--  <img src="/static/images/5_bottom.jpg" style="width: 40%;height: 20%;float: right;" >--%>
            <div style="color: #086CFF;text-indent: 20px;line-height: 30px;margin: 5px 10px;">
                对于2-5岁儿童，每天观看电子产品节目的时间不要超过1个小时，
                父母要特别关注电子产品的内容，使其有教育性。鼓励家长陪同观看并和儿童讨论，
                帮助他们更好地理解内容。
            </div>

        </div>

        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao6" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>
    <div style="border:  1px solid #007aff;width: 100%;height: 20px;margin-top: 5px;">
        <div id="demo6" class="mui-progressbar" style="height: 18px;background: #fff;">
            <span></span>
            <div style="position: absolute; left: 45%; color: orange; top: 0">60%</div>
        </div>
    </div>
</div>
<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.dtpicker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/init6.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
        mui("#demo6").progressbar({progress:60}).show();
        $("#media3").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media3").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media4").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media4").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media5").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media5").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media6").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media6").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media7").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media7").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media8").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media8").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media9").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media9").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media10").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media10").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media11").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media11").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        });
        $("#media12").click(function () {
            var dtPicker = new mui.DtPicker({
                type:"time",
                value:"00:00"
            });
            dtPicker.show(function (selectItems){
                var vaule=selectItems.text.split(":");
                $("#media12").val(parseInt(vaule[0]*60)+parseInt(vaule[1])+'');
                dtPicker.dispose();
            });

        })
    })
</script>
</html>
