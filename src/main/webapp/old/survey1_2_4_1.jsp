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
    <style>
        input{
            border-top: none;
            border-right: none;
            border-left: none;
            border-bottom: 1px solid #000;
            width: 86%;
            text-align: center;
        }
        .myspan{
            text-decoration: underline;font-weight: bold;
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
        <h4 class="con12-tit">睡眠</h4>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">以下问题是关于你睡眠情况的问卷，请你根据自己
                <span style="text-decoration: underline;font-weight: bold;">过去四个星期</span>真实情况填写</div>
            <div  class="answer12">
                <div onclick="hideBorder(this)"  style="margin-bottom: 10px;">1.星期一至五,你每晚通常什么时候上床睡觉?
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input type="" id="chsq1" name="chsq1" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq1a" name="chsq1a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

                <div onclick="hideBorder(this)" style="margin-bottom: 10px;margin-top: 10px;">星期一至五，你每早通常什么时候起床？
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq2" name="chsq2" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq2a" name="chsq2a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

                <div   onclick="hideBorder(this)" style="margin-bottom: 10px;">星期六、日不用上学的时候, 你每晚通常什么时候上床睡觉?
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq3" name="chsq3" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq3a" name="chsq3a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

                <div  onclick="hideBorder(this)"  style="margin-bottom: 10px;">星期六、日不用上学的时候, 你每天通常什么时候起床?
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq4" name="chsq4" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq4a" name="chsq4a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

            </div>



        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">2.你通常需要多少时间才能入睡?</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>少于15分钟</label>
                    <input  name="2" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>15-30分钟</label>
                    <input  name="2" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>30-45分钟</label>
                    <input  name="2" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>45-60分钟</label>
                    <input  name="2" type="radio"  value="4">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>超过60分钟</label>
                    <input  name="2" type="radio"  value="5">
                </div>
            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">3.请依照你目前的情形回答下列问题，每题只能选一个答案：</div>
            <div id="3_1">

            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">4.请描述你最近睡眠问题的严重程度：</div>
            <div class="problems12">a.入睡困难</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>没有</label>
                    <input  name="4_1" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>轻微</label>
                    <input  name="4_1" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="4_1" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>严重</label>
                    <input  name="4_1" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常严重</label>
                    <input  name="4_1" type="radio"  value="4">
                </div>
            </div>
            <div class="problems12">b.难以维持睡眠</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>没有</label>
                    <input  name="4_2" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>轻微</label>
                    <input  name="4_2" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="4_2" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>严重</label>
                    <input  name="4_2" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常严重</label>
                    <input  name="4_2" type="radio"  value="4">
                </div>
            </div>
            <div class="problems12">c.早睡</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>没有</label>
                    <input  name="4_3" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>轻微</label>
                    <input  name="4_3" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="4_3" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>严重</label>
                    <input  name="4_3" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常严重</label>
                    <input  name="4_3" type="radio"  value="4">
                </div>
            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">5.你对当前睡眠状况的满意度？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常满意</label>
                    <input  name="5" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较满意</label>
                    <input  name="5" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="5" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较不满意</label>
                    <input  name="5" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不满意</label>
                    <input  name="5" type="radio"  value="4">
                </div>
            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">6.你认为你的睡眠问题多大程度上干扰了你日常功能 (例如:日间疲劳、处理学习/日常事务的能力、注意力、记忆力、情绪等)?</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常满意</label>
                    <input  name="5" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较满意</label>
                    <input  name="5" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="5" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较不满意</label>
                    <input  name="5" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不满意</label>
                    <input  name="5" type="radio"  value="4">
                </div>
            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">6.你的睡眠问题对你的生活质量有多大程度的影响和损害?</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常满意</label>
                    <input  name="5" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较满意</label>
                    <input  name="5" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="5" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较不满意</label>
                    <input  name="5" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不满意</label>
                    <input  name="5" type="radio"  value="4">
                </div>
            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">7.你对当前睡眠问题有多大程度的担忧/苦恼?</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常满意</label>
                    <input  name="5" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较满意</label>
                    <input  name="5" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>一般</label>
                    <input  name="5" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>较不满意</label>
                    <input  name="5" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常不满意</label>
                    <input  name="5" type="radio"  value="4">
                </div>
            </div>
        </div>
    </div>

    <div  class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">8.请你根据 <span class="myspan">过去四个星期</span>你的情况，回答以下问题。
                每个问题只选一个答案，或一个时间点。</div>
            <div class="problems12">a.如果你仅考虑自己的生活习惯，而且能完全自由地计划白天时间，
                你<span class="myspan">希望什么时间起床？</span></div>
            <div class="problems12">b.<span class="myspan">清晨起床后半小时</span>内，你有多么的<span class="myspan">疲倦？</span></div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常疲倦</label>
                    <input  name="8" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>比较疲倦</label>
                    <input  name="8" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>比较清醒</label>
                    <input  name="8" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常清醒</label>
                    <input  name="8" type="radio"  value="3">
                </div>
            </div>
            <div class="problems12">c.你会在夜晚的什么时间赶到<span class="myspan">最疲倦</span>，而且需要睡觉？</div>
            <div class="problems12">d.一天中的什么时间是你的<span class="myspan">最佳状态</span>？</div>
            <div class="problems12">e.人可以分为<span class="myspan">“清晨”型（又称百灵鸟型，早睡早起型）和“夜晚”型
                （又称猫头鹰型，晚睡晚起型）</span>，你认为自己属于哪种类型？</div>
            <div  class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>绝对的“清晨”型</label>
                    <input  name="8_1" type="radio"  value="0">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>“清晨”型多过“夜晚”型</label>
                    <input  name="8_1" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>“夜晚”型多过“清晨”型</label>
                    <input  name="8_1" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>绝对的“夜晚”型</label>
                    <input  name="8_1" type="radio"  value="3">
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
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/sleep_1.js"></script>
<script>
    $(function () {
        back_listener();
        var hour_data=[{text: '18点之前',value:'17'},{text: '18',value:'18'},{text: '19',value:'19'},
            {text: '20',value:'20'},{text: '21',value:'21'},{text: '22',value:'22'},
            {text: '23',value:'23'},{text: '24点之后',value:'24'}];
        var hour_data1=[{text: '5点之前',value:'4'},{text: '05',value:'5'},{text: '06',value:'6'},
            {text: '07',value:'7'},{text: '08',value:'8'},{text: '09',value:'9'},
            {text: '10',value:'10'},{text: '11点之后',value:'11'}];
/*
        var hour_data2=[{text: '1小时',value:'1'},{text: '2小时',value:'2'},{text: '3小时',value:'3'},
            {text: '4小时',value:'4'},{text: '5小时',value:'5'},{text: '6小时',value:'6'},
            {text: '7小时',value:'7'},{text: '8小时',value:'8'},{text: '9小时',value:'9'},{text: '10小时',value:'10'}
            ,{text: '11小时',value:'11'},{text: '12小时',value:'12'}];*/

        var min_data=[];
        for(var i=0;i<60;i++){
            var temp={};
            temp['text']=i+'';
            temp['value']=i+'';
            min_data.push(temp);
        }

        $("#chsq1").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data);
            userPicker.show(function (selectItems) {
                $("#chsq1").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq1a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                $("#chsq1a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });


        $("#chsq2").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data1);
            userPicker.show(function (selectItems) {
                $("#chsq2").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq2a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                $("#chsq2a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });


        $("#chsq3").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data);
            userPicker.show(function (selectItems) {
                $("#chsq3").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq3a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                $("#chsq3a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });


        $("#chsq4").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data1);
            userPicker.show(function (selectItems) {
                $("#chsq4").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq4a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                $("#chsq4a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });



        $(".mybtn").click(function () {
            var data={},message=[];
            data["name"]="123";
            addAnswer(data);
            /*$("#div1").find("input").each(function () {
                data[$(this).attr("name")]=$(this).val();
                if($(this).val()==''){
                    message.push($(this).parent("div").parent("div").parent("div")[0]);
                    return false;
                }
            });
            for(var i=0;i<31;i++){
                var value=changeString($("input[name=chsq"+(i+9)+"]:checked").val());
                if(value==''){
                    message.push($("input[name=chsq"+(i+9)+"]").parents("tr")[0]);
                    break;
                }else{
                    data["chsq"+(i+9)]=value;
                }
            }
            data["chsq40"]=changeString($("input[name='chsq40']:checked").val());
            data["chsq41"]=changeString($("input[name='chsq41']:checked").val());
            if(data["chsq40"]==''){
                message.push($("input[name='chsq40']").parent("div").parent("div")[0])
            }
            if(data["chsq41"]==''){
                message.push($("input[name='chsq41']").parent("div").parent("div")[0])
            }
            if(message.length>0){
                for (var m = 0; m < message.length; m++) {
                    showBorder(message[m]);
                    break;
                }
            }else{
                //console.log("success")
                addAnswer(data);
            }*/

        });


    })

    function hideBorder(obj) {
        var mythis=$(obj);
        mythis.css("border","none");
    }
    function hideBorder1(obj) {
        var mythis=$(obj);
        mythis.css("border","1px solid #666");
    }
</script>
</html>
