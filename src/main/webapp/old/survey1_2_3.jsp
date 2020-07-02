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
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <style>
        .myspan{
            text-decoration: underline;
            font-weight: bold
        }
        .myinput1{
            width: 70%;
            height: 20px;
            font-size: 14px;
            border: 1px solid red;
        }
        .myinput2{
            width: 60%;
            height: 20px;
            font-size: 14px;
            border: 1px solid red;
        }

       tr td{ width: 100px;}
    </style>
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
        <h4 class="con12-tit">身体活动</h4>
    </div>

    <div id="div1" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">1.过去一周内，孩子是否外出过？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>是</label>
                    <input  name="activity1" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>否</label>
                    <input  name="activity1" type="radio"  value="2">
                </div>
            </div>
        </div>
    </div>

    <div id="div2" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">2.过去一周内，孩子外出时是否去过体育场馆或者运动场？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>是</label>
                    <input  name="activity2" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>否</label>
                    <input  name="activity2" type="radio"  value="2">
                </div>
            </div>
        </div>
    </div>

    <div id="div3" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">在<span style="text-decoration: underline">通常的一周中，</span>下列哪些体力活动是孩子经常参加的？
            </div>
            <div  id="answer_3_1" class="answer12">
            </div>
            <div class="problems12">在<span style="text-decoration: underline">在通常的一周中，</span>下列哪些休闲活动是孩子经常参加的？
            </div>
            <div  id="answer_3_2" class="answer12">
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
<script src="${ctx}/static/js/Util.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/body_activities.js"></script>
<script>
    $(function () {
        back_listener();
        $(document).on('click', '#answer_3_1 input[type="checkbox"]', function() {
            if($(this).is(":checked")){
                if($(this).attr("name")=='activity34'){
                    $(this).parent("div").next("input").after(gethtml_content1());
                    $("#activity34a").val("").css("border","1px solid red")
                        .removeAttr("readonly").attr("placeholder","请填写");
                }else{
                    $(this).after(gethtml_content1())
                }
            }else{
                if($(this).attr("name")=='activity34'){
                    $(this).parent("div").next("input").next("div").remove();
                    $("#activity34a").val("").css("border","1px solid rgba(0,0,0,.2)")
                        .attr("readonly","readonly").removeAttr("placeholder");
                }else{
                    $(this).next("div").remove();
                }
            }
        })
        $(document).on('click', '#answer_3_2 input[type="checkbox"]', function() {
            if($(this).is(":checked")){
                if($(this).attr("name")=='activity48'){
                    $(this).parent("div").next("input").after(gethtml_content2());
                    $("#activity48a").val("").css("border","1px solid red")
                        .removeAttr("readonly").attr("placeholder","请填写");
                }else{
                    $(this).after(gethtml_content2())
                }
            }else{
                if($(this).attr("name")=='activity48'){
                    $(this).parent("div").next("input").next("div").remove();
                    $("#activity48a").val("").css("border","1px solid rgba(0,0,0,.2)")
                        .attr("readonly","readonly").removeAttr("placeholder");
                }else{
                    $(this).next("div").remove();
                }
            }
        })

        $("[name='activity1']").click(function () {
            if($(this).val()=='2'){
                $("#div2").hide().find("input[type='radio']").prop("checked",false);
                //出现绿色题目
                $("[name='bule']").hide();
                $("[name='red']").hide();
            }else{
                $("[name='green']").show();
                $("[name='bule']").show();
                $("[name='red']").show();
                $("#div2").show().find("input[type='radio']").prop("checked",false);
            }
            $("#div3").find("input[type='checkbox']").prop("checked",false);
            $("#div3").find("input").val("");
            $("#div3").find("table").remove();
            showHideText();
        });

        $("[name='activity2']").click(function () {
            if($(this).val()=='1'){
                $("[name='green']").show();
                $("[name='bule']").show();
                $("[name='red']").show();
            }else{
                $("[name='green']").hide();
                $("[name='bule']").show();
                $("[name='red']").show();
            }
            $("#div3").find("input[type='checkbox']").prop("checked",false);
            $("#div3").find("input").val("");
            $("#div3").find("table").remove();
            showHideText();
        });

        $(".mybtn").click(function () {
            var data={};
            data["name"]="123";
            addAnswer(data);
        });


    })

function showHideText() {
    if($("[name='activity34']").parent("div").css("display")=='block'){
        $("#activity34a").show();
    }else{
        $("#activity34a").hide();
    }
    if($("[name='activity48']").parent("div").css("display")=='block'){
        $("#activity48a").show();
    }else{
        $("#activity48a").hide();
    }
    $("#activity34a").val("").css("border","1px solid rgba(0,0,0,.2)")
        .attr("readonly","readonly").removeAttr("placeholder")
    $("#activity48a").val("").css("border","1px solid rgba(0,0,0,.2)")
        .attr("readonly","readonly").removeAttr("placeholder")
}
</script>
</html>
