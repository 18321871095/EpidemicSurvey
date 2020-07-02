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
        <h4 class="con12-tit">基本信息</h4>
    </div>

    <div id="div1" onclick="hideBorder_p_1_2(this)" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">1.您是孩子的</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>母亲</label>
                    <input  name="ques2" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>父亲</label>
                    <input  name="ques2" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>爷爷、奶奶、外公、外婆</label>
                    <input  name="ques2" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>其他人</label>
                    <input  name="ques2" type="radio"  value="4">
                </div>
                <input id="ques2a" type="text" name="ques2a" readonly="readonly"
                       style="width: 150px;margin-left: 58px;height: 30px" value="" >
            </div>
        </div>
    </div>

    <div id="div2" onclick="hideBorder_p_1_2(this)" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">2.请问孩子的母亲受教育程度？</div>
            <div id="1_2" class="answer12">
            </div>
        </div>
    </div>

    <div id="div3" onclick="hideBorder_p_1_2(this)" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">3.您全家过去一年总收入是多少?</div>
            <div id="1_3" class="answer12">
            </div>
        </div>
    </div>

    <div id="div4" onclick="hideBorder_p_1_2(this)" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">4.孩子白天是否一个人在家？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>是</label>
                    <input  name="ses4" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>否（父，母，。。。其他）</label>
                    <input  name="ses4" type="radio"  value="0">
                </div>
            </div>
        </div>
    </div>

    <div id="div5" onclick="hideBorder_p_1_2(this)" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">5.孩子是否是独生子女？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>是</label>
                    <input  name="care3" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>否</label>
                    <input  name="care3" type="radio"  value="0">
                </div>
                <div id="div5_1" onclick="hideBorder_p_1_2(this)"  class="mydiv" >
                    <div class="problems12">您家里有几个孩子？</div>
                    <div>
                     <input id="care3a_input" type="text"  readonly="readonly"
                               style="width: 150px;margin-left: 58px;height: 30px" value="" placeholder="请选择" >
                        <input id="care3a" name="care3a" readonly="readonly" style="display: none;" value="" />
                    </div>
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
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/base_information.js"></script>
<script>
    $(function () {
        back_listener();
        for(var i=0;i<educational_status.length;i++){
            $("#1_2").append("<div class=\"mui-input-row mui-radio mui-left\">" +
                "<label>"+educational_status[i]+"</label>" +
                "<input  name=\"ses2\" type=\"radio\"  value="+(i+1)+">" +
                "</div>");
        }
        for(var i=0;i<average_earnings.length;i++){
            $("#1_3").append("<div class=\"mui-input-row mui-radio mui-left\">" +
                "<label>"+average_earnings[i]+"</label>" +
                "<input  name=\"ses3\" type=\"radio\"  value="+(i+1)+">" +
                "</div>");
        }

        $("#care3a_input").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '2',
                    text: '2个'
                },
                {
                    value: '3',
                    text: '3个'
                },
                {
                    value: '4',
                    text: '4个'
                },
                {
                    value: '5',
                    text: '5个及以上'
                },
            ]);
            userPicker.show(function (selectItems) {
                $("#care3a_input").val(selectItems[0].text);
                $("#care3a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });

        $("[name='ques2']").click(function () {
            var val=$(this).val();
            if(val=='4'){
                $("#ques2a").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#ques2a").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }
        });

        $("[name='care3']").click(function () {
            if($(this).val()=='1'){
                $("#div5_1").hide();
            }else{
                $("#div5_1").show()
            }
            $("#care3a_input").val("请选择");
            $("#care3a").val("");

        });

        $(".mybtn").click(function () {
            var data={},message=[];
            data["ques2"]=changeString($("[name='ques2']:checked").val());
            data["ques2a"]=changeString($("#ques2a").val());
            data["ses2"]=changeString($("[name='ses2']:checked").val());
            data["ses3"]=changeString($("[name='ses3']:checked").val());
            data["ses4"]=changeString($("[name='ses4']:checked").val());
            data["care3"]=changeString($("[name='care3']:checked").val());
            data["care3a"]=changeString($("#care3a").val());

            if(data["ques2"]==''){
                message.push("div1")
            }else if(data["ses2"]==''){
                message.push("div2")
            }else if(data["ses3"]==''){
                message.push("div3")
            }else if(data["ses4"]==''){
                message.push("div4")
            }else if(data["care3"]==''){
                message.push("div5")
            }else if(data["care3"]=='0'){
               if(data["care3a"]==''){
                   message.push("div5_1")
               }
            }

            if(message.length>0){
                for (var m = 0; m < message.length; m++) {
                    showBorder(document.getElementById("" + message[m]))
                    break;
                }
            }else{
                //console.log(JSON.stringify(data))
                addAnswer(data)
            }



        });

    })
    function hideBorder_p_1_2(obj) {
        var mythis=$(obj);
        mythis.css("border","1px solid #87b2ff");
    }

</script>
</html>
