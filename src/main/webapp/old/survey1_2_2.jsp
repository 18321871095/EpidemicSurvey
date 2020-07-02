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
    <link rel="stylesheet" href="${ctx}/static/css/mui.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link href="${ctx}/static/css/mui.picker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.poppicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">

</head>
<body style="background: #fff;">

<div class="mui-content" style="background: #fff;">
    <div>
        <c:choose>
            <c:when test="${sessionScope.childAnswer.getType()== '1'}">
                <c:choose>
                    <c:when test="${sessionScope.childAnswer.getChild_class()== '1' || sessionScope.childAnswer.getChild_class()== '2'}">
                        <img src="${ctx}/static/images/12-img.png" width="100%;">
                    </c:when>
                    <c:when test="${sessionScope.childAnswer.getChild_class()== '3' || sessionScope.childAnswer.getChild_class()== '4' || sessionScope.childAnswer.getChild_class()=='5' }">
                        <img src="${ctx}/static/images/35j-img.png" width="100%;">
                    </c:when>
                    <c:otherwise>
                        <img src="${ctx}/static/images/63j-img.png" width="100%;">
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${sessionScope.childAnswer.getChild_class()== '3' || sessionScope.childAnswer.getChild_class()== '4' || sessionScope.childAnswer.getChild_class()=='5' }">
                        <img src="${ctx}/static/images/35-img.png" width="100%;">
                    </c:when>
                    <c:otherwise>
                        <img src="${ctx}/static/images/63-img.png" width="100%;">
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="con12">
        <h4 class="con12-tit">屏幕暴露</h4>
    </div>

    <div id="div1" onclick="hideBorder(this)"  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">1.请根据最近一周，孩子
                <span style="font-weight: bold">每天通过电子媒介</span>（电视、电脑、PAD及手机等）进行哪些屏幕活动？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>上海市在线教育“空中课堂”</label>
                    <input  name="media1" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                        <div style="display: inline-block;width: 28%">
                            <input class="myi_input" id="media1a_h" readonly="readonly"/><i class="myi"></i>
                        </div>小时
                        <div style="display: inline-block;width: 28%">
                            <input class="myi_input" id="media1a_m"  readonly="readonly"/><i class="myi"></i>
                        </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>校外机构网络课程</label>
                    <input  name="media2" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media2a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media2a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>班级统一组织的学习互动讨论</label>
                    <input  name="media3" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media3a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media3a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>与同学或朋友进行交流互动（除了集体互动学习以外的沟通）</label>
                    <input  name="media4" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media4a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media4a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>观看娱乐视频</label>
                    <input  name="media5" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media5a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media5a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>浏览网页新闻</label>
                    <input  name="media6" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media6a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media6a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>玩电子游戏</label>
                    <input  name="media7" type="checkbox"  >
                </div>
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media7a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media7a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>其他</label>
                    <input  name="media8" type="checkbox"  >
                </div>
                <input id="media8b" type="text" name="media8b" readonly="readonly"
                       style="width: 150px;margin-left: 58px;height: 30px" value="" >
                <div onclick="hideBorder(this)" class="mydiv" style="margin: 0px 0px;font-size: 14px;padding: 5px 10px;">平均每天
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media8a_h" readonly="readonly"/><i class="myi"></i>
                    </div>小时
                    <div style="display: inline-block;width: 28%">
                        <input class="myi_input" id="media8a_m"  readonly="readonly"/><i class="myi"></i>
                    </div>分钟
                </div>
            </div>
        </div>
    </div>

    <div style="text-align: center;margin-bottom: 50px;">
        <button  class="mybtn">提交</button>
    </div>

</div>

</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script>
    $(function () {
        back_listener();
        var h=[],m=[];
        for(var i=0;i<=12;i++){
            var tempi={};
            tempi["value"]=i+"";
            tempi["text"]=i+"";
            h.push(tempi);
        }
        for(var j=0;j<=60;j++){
            var tempj={};
            tempj["value"]=j+"";
            tempj["text"]=j+"";
            m.push(tempj);
        }

        $("[name='media1']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media2']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media3']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media4']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media5']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media6']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media7']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("div[class='mydiv']").show().find("input").val("");
            }else{
                $(this).parent("div").next("div[class='mydiv']").hide().find("input").val("");
            }
        });
        $("[name='media8']").click(function () {
            if($(this).is(":checked")){
                $(this).parent("div").next("input").next("div[class='mydiv']").show().find("input").val("");
                $("#media8b").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $(this).parent("div").next("input").next("div[class='mydiv']").hide().find("input").val("");
                $("#media8b").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }
        });


        $("#media1a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media1a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media1a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media1a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media2a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media2a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media2a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media2a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media3a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media3a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media3a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media3a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media4a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media4a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media4a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media4a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media5a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media5a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media5a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media5a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media6a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media6a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media6a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media6a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media7a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media7a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media7a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media7a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $("#media8a_h").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(h);
            userPicker.show(function (selectItems) {
                $("#media8a_h").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("#media8a_m").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(m);
            userPicker.show(function (selectItems) {
                $("#media8a_m").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

        $(".mybtn").click(function () {
            var data={},message=[];
            $(".answer12").find("input").each(function () {
                var type=$(this).attr("type");
                if(type=='checkbox'){
                    if($(this).is(":checked")){
                        data[$(this).attr("name")]="1";
                    }else{
                        data[$(this).attr("name")]="2";
                    }
                }else{
                    data[$(this).attr("id")]=$(this).val();
                }

            });
            if(data["media1"]=='2'&&data["media2"]=='2'&&data["media3"]=='2'&&data["media4"]=='2'
                &&data["media5"]=='2'&&data["media6"]=='2'&&data["media7"]=='2'&&data["media8"]=='2'){
                message.push(document.getElementById("div1"))
            }else{
                if(data["media1"]=='1'){
                    if(data["media1a_h"]==''||data["media1a_m"]==''){
                        message.push($("[name='media1']").parent("div").next("div")[0])
                    }
                }
                if(data["media2"]=='1'){
                    if(data["media2a_h"]==''||data["media2a_m"]==''){
                        message.push($("[name='media2']").parent("div").next("div")[0])
                    }
                }
                if(data["media3"]=='1'){
                    if(data["media3a_h"]==''||data["media3a_m"]==''){
                        message.push($("[name='media3']").parent("div").next("div")[0])
                    }
                }
                if(data["media4"]=='1'){
                    if(data["media4a_h"]==''||data["media4a_m"]==''){
                        message.push($("[name='media4']").parent("div").next("div")[0])
                    }
                }
                if(data["media5"]=='1'){
                    if(data["media5a_h"]==''||data["media5a_m"]==''){
                        message.push($("[name='media5']").parent("div").next("div")[0])
                    }
                }
                if(data["media6"]=='1'){
                    if(data["media6a_h"]==''||data["media6a_m"]==''){
                        message.push($("[name='media6']").parent("div").next("div")[0])
                    }
                }
                if(data["media7"]=='1'){
                    if(data["media7a_h"]==''||data["media7a_m"]==''){
                        message.push($("[name='media7']").parent("div").next("div")[0])
                    }
                }
                if(data["media8"]=='1'){
                    if(data["media8a_h"]==''||data["media8a_m"]==''){
                        message.push($("[name='media8']").parent("div").next("input").next("div")[0])
                    }
                }
            }
            if(message.length>0){
                for (var m = 0; m < message.length; m++) {
                   showBorder(message[m])
                    break;
                }
            }else{
                //console.log(JSON.stringify(data))
                addAnswer(data);
            }


        });

    })
    function hideBorder(obj) {
        var mythis=$(obj);
        mythis.css("border","1px solid #87b2ff");
    }


</script>
</html>
