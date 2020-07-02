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
        .table11 .mui-checkbox.mui-left label, .table11 .mui-radio.mui-left label{
            padding-right: 15px;
            padding-left: 0px;
            margin-left: 0px;
        }
        .table11 .mui-checkbox input[type=checkbox], .table11 .mui-radio input[type=radio]{
            margin: 0px;
        }
        .table11 .mui-checkbox input[type=checkbox], .table11 .mui-radio input[type=radio]{
            position: unset;
        }
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
        <h4 class="con12-tit">心里健康水平</h4>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">  对于下面的各个问题，请在相应的空格上划勾，以表明是否符合您孩子的情况。
                <span style="text-decoration: underline;">请根据您孩子过去6个月的行为来回答。</span>
                请务必回答每一道题，即使您对某一题不是十分确定或不很清楚。</div>

            <div style="margin: 10px 5px;">
                <table  border="1" style="width: 100%;color: #666666" >
                    <tr>
                        <td style="text-align: center;width: 64%">问题选项</td>
                        <td style="width: 12%">不真实</td>
                        <td style="width: 12%">有点真实</td>
                        <td style="width: 12%">完全真实</td>
                    </tr>
                </table>
                <div style="height: 300px;overflow-y: auto;">
                    <table border="1" class="table11" style="color: #666666;width: 100%;table-layout: fixed;">
                        <tbody id="table_7">

                        </tbody>
                    </table>
                </div>


            </div>
            <br/>

        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">请在下面五个句子的每个句子（表达）中标出在过去两星期里您最接近的感觉状态
                。请注意数字越大表明你的身心越健康。例如：第一题，如果你在过去两星期里有一半以上时间感到快乐、
                心情舒畅，就选择3。</div>
            <div  class="problems12">1.我感觉快乐、心情舒畅</div>
            <div onclick="hideBorder1(this)" class="answer12">
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
            <div  class="problems12">2.我感觉宁静和放松</div>
            <div onclick="hideBorder1(this)" class="answer12">
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
            <div  class="problems12">3.我感觉充满活力、精力充沛</div>
            <div onclick="hideBorder1(this)" class="answer12">
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
            <div  class="problems12">4.我睡醒时感到清新、得到了足够的休息</div>
            <div onclick="hideBorder1(this)" class="answer12">
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
            <div  class="problems12">5.我每天生活充满了有趣的事情</div>
            <div onclick="hideBorder1(this)" class="answer12">
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
<script src="${ctx}/static/js/mental_health.js"></script>
<script>
    $(function () {
        back_listener();
        $(".mybtn").click(function () {
            var data={},message=[];
            for(var i=1;i<=25;i++){
                var value=changeString($("input[name=sdq"+(i)+"]:checked").val());
                if(value==''){
                    message.push($("input[name=sdq"+(i)+"]").parents("tr")[0]);
                    break;
                }else{
                    data["sdq"+(i)]=value;
                }
            }

            for(var j=1;j<=5;j++){
                var val=changeString($("input[name=who"+j+"]:checked").val());
                if(val==''){
                    message.push($("input[name=who"+(j)+"]").parents("div[class='answer12']")[0]);
                    break;
                }else{
                    data["who"+j]=val;
                }
            }
          /*  console.log(JSON.stringify(data))
            console.log(message)*/
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
        mythis.css("border","1px solid #666");
    }
    function hideBorder1(obj) {
        var mythis=$(obj);
        mythis.css("border","none");
    }


</script>
</html>
