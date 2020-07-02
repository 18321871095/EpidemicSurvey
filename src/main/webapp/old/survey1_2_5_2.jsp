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
            <div class="problems12"> 请阅读以下各项，然后根据过去一周之内符合您的实际情况，
                选择相应的选项。您的回答没有对错之分，所以请不要在以下任何一项上花太多时间。</div>
            <div style="margin: 10px 5px;">
                <table  border="1" style="width: 100%;color: #666666" >
                    <tr>
                        <td style="text-align: center;width: 52%">题目选项</td>
                        <td style="width: 12%">不符合</td>
                        <td style="width: 12%">有点符合</td>
                        <td style="width: 12%">常常符合</td>
                        <td style="width: 12%">总是符合</td>
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



    <div style="text-align: center;margin-bottom: 50px;">
        <button class="mybtn">提交</button>
    </div>


</div>

</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/mental_health_1.js"></script>
<script>
    $(function () {
        back_listener();
        $(".mybtn").click(function () {
            var data={},message=[];
            data["123"]="123";
            addAnswer(data);
           /* for(var i=1;i<=25;i++){
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

            if(message.length>0){
                for (var m = 0; m < message.length; m++) {
                    showBorder(message[m]);
                    break;
                }
            }else{
                console.log("success")
            }*/

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
