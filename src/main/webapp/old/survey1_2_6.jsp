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
        <h4 class="con12-tit">学习需求</h4>
    </div>

    <div id="div1" onclick="hideBorder(this)" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">1.您认为目前仍需要哪些促进青少年儿童健康科普宣教的内容？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>卫生：利用疫情期，养成孩子良好的卫生习惯</label>
                    <input  name="kepu1" type="checkbox" >
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>运动：宅在家，照样可以做运动</label>
                    <input  name="kepu2" type="checkbox" >
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>屏幕暴露：上网课，更要学会保护视力、丰富生活</label>
                    <input  name="kepu3" type="checkbox" >
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>亲子沟通：疫情期，亲子沟通交流的良机、亲子互动的妙招、阅读推荐分享</label>
                    <input  name="kepu4" type="checkbox" >
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>情绪：为毕业班学生减压加油</label>
                    <input  name="kepu5" type="checkbox" >
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>行为：孩子沉迷游戏怎么办？</label>
                    <input  name="kepu6" type="checkbox" >
                </div>
                <div class="mui-input-row mui-checkbox mui-left">
                    <label>其他</label>
                    <input  name="kepu7" type="checkbox" >
                </div>
                <input id="kepu8" type="text" name="kepu8" readonly="readonly"
                       style="width: 150px;margin-left: 58px;height: 30px" value="" >
            </div>
        </div>
    </div>

    <div style="text-align: center;margin-bottom: 50px;">
        <button class="mybtn">提交</button>
    </div>


</div>

</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>

<script>
    $(function () {
        back_listener();
        $("[name='kepu7']").click(function () {
            if($(this).is(":checked")){
                $("#kepu8").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#kepu8").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }
        });
        
        $(".mybtn").click(function () {
            var data={},message=[];
            $(".answer12").find("input").each(function () {
                var type=$(this).attr("type");
                if(type=='checkbox'){
                    if($(this).is(":checked")){
                        data[$(this).attr("name")]="1";
                    }else{
                        data[$(this).attr("name")]="0";
                    }
                }else{
                    data[$(this).attr("id")]=$(this).val();
                }
            });
            if(data["kepu1"]=='0'&&data["kepu2"]=='0'&&data["kepu3"]=='0'&&data["kepu4"]=='0'&&data["kepu5"]=='0'
                &&data["kepu6"]=='0'&&data["kepu7"]=='0'){
                message.push($("#div1")[0]);
            }
          //  console.log(JSON.stringify(data))
            if(message.length>0){
                for (var m = 0; m < message.length; m++) {
                    showBorder(message[m]);
                    break;
                }
            }else{
                //console.log("success")
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
