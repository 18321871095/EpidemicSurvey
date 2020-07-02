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
        .table11 .mui-checkbox.mui-left label, .table11 .mui-radio.mui-left label{
            padding-right: 15px;
            padding-left: 0px;
            margin-left: 0px;
        }
        .table11 .mui-checkbox input[type=checkbox], .table11 .mui-radio input[type=radio]{
            margin: 10px;
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
        <h4 class="con12-tit">睡眠</h4>
    </div>

    <div id="div1" class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12"><span style="text-decoration: underline">周一到周五</span>，您的孩子的睡眠情况：</div>
            <div  class="answer12">
                <div onclick="hideBorder(this)"  style="margin-bottom: 10px;">1.您的孩子晚上上床准备睡觉的时间为
                <div style="text-align: center">
                    <div style="display: inline-block;width: 30%">
                        <input type="" id="chsq1" name="chsq1" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq1a" name="chsq1a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>
            </div>
            <span style="font-weight: bold;">*注意！部分孩子上床后一段时间内会保持清醒状态！</span>

            <div onclick="hideBorder(this)" style="margin-bottom: 10px;margin-top: 10px;">2.您的孩子实际睡着的时间为
                <div style="text-align: center">
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq2" name="chsq2" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq2a" name="chsq2a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>
            </div>

            <div   onclick="hideBorder(this)" style="margin-bottom: 10px;">3.您的孩子早晨醒来的时间为
                <div style="text-align: center">
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq3" name="chsq3" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq3a" name="chsq3a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>
            </div>

            <div  onclick="hideBorder(this)"  style="margin-bottom: 10px;">4.您的孩子早晨起床的时间为
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

            <div class="problems12"><span style="text-decoration: underline">周六到周日</span>，您的孩子的睡眠情况：</div>
            <div   class="answer12">
                <div onclick="hideBorder(this)" style="margin-bottom: 10px;">1.在休息日，您的孩子晚上上床准备睡觉的时间为
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input type="" id="chsq5" name="chsq5" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq5a" name="chsq5a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>
                <span style="font-weight: bold;">*注意！部分孩子上床后一段时间内会保持清醒状态！</span>

                <div onclick="hideBorder(this)" style="margin-bottom: 10px;margin-top: 10px;">2.您的孩子实际睡着的时间为
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq6" name="chsq6" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq6a" name="chsq6a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

                <div onclick="hideBorder(this)"  style="margin-bottom: 10px;">3.您的孩子早晨醒来的时间为
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq7" name="chsq7" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq7a" name="chsq7a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

                <div  onclick="hideBorder(this)" style="margin-bottom: 10px;">4.您的孩子早晨起床的时间为
                    <div style="text-align: center">
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq8" name="chsq8" readonly="readonly"/><i class="myi"></i>
                        </div>点
                        <div style="display: inline-block;width: 30%">
                            <input id="chsq8a" name="chsq8a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>

            </div>

            <div  onclick="hideBorder(this)"  style="margin-bottom: 10px;margin-top: 20px;">您的孩子睡前有多少小时有屏幕暴露？
                <div style="text-align: center">
                    <div style="display: inline-block;width:60%">
                        <input id="chsq8b" name="chsq8b" readonly="readonly" value="待定" /><i class="myi"></i>
                    </div>小时
                </div>
            </div>

        </div>
    </div>

    <div class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">5以下问题选项，请根据您孩子最近<span style="text-decoration: underline;font-weight: bold;">
                一个月</span>的睡眠情况选择相应选项： </div>

                <div style="margin: 0 5px;">
                    <table   border="1" style="width: 100%">
                        <tr>
                            <td id="table1_td" style="width: 57%;text-align: center;">问题选项</td>
                            <td style="text-align: center;">通常<br/><span style="font-size: 10px">5-7次/周</span></td>
                            <td style="text-align: center;">有时<br/><span style="font-size: 10px">2-4次/周</span></td>
                            <td style="text-align: center;">偶尔<br/><span style="font-size: 10px">0-1次/周</span></td>
                        </tr>
                    </table>
                    <div style="height: 350px;overflow-y: auto">
                        <table class="table11" style="color: #666666;table-layout: fixed;" border="1" >
                            <tbody id="mytable" >

                            </tbody>
                        </table>
                    </div>

                </div>
                <br/>

        </div>
    </div>

    <div class="tmWrap12">
        <div class="tmWrap12-list">
            <div class="problems12">在过去的一周中,孩子在如下情形时是否非常瞌睡或入睡?</div>
            <div class="problems12">看电视</div>
            <div onclick="hideBorder(this)" class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>不困</label>
                    <input  name="chsq40" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常困</label>
                    <input  name="chsq40" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>会睡着</label>
                    <input  name="chsq40" type="radio"  value="3">
                </div>
            </div>
            <div class="problems12">坐车</div>
            <div onclick="hideBorder(this)" class="answer12">
                <div class="mui-input-row mui-radio mui-left">
                    <label>不困</label>
                    <input  name="chsq41" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>非常困</label>
                    <input  name="chsq41" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>会睡着</label>
                    <input  name="chsq41" type="radio"  value="3">
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
<script src="${ctx}/static/js/sleep.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script>
    $(function () {
        back_listener();
        var hour_data=[{text: '18点之前',value:'17'},{text: '18',value:'18'},{text: '19',value:'19'},
            {text: '20',value:'20'},{text: '21',value:'21'},{text: '22',value:'22'},
            {text: '23',value:'23'},{text: '24点之后',value:'24'}];
        var hour_data1=[{text: '5点之前',value:'4'},{text: '05',value:'5'},{text: '06',value:'6'},
            {text: '07',value:'7'},{text: '08',value:'8'},{text: '09',value:'9'},
            {text: '10',value:'10'},{text: '11点之后',value:'11'}];
        var hour_data2=[{text: '1小时',value:'1'},{text: '2小时',value:'2'},{text: '3小时',value:'3'},
            {text: '4小时',value:'4'},{text: '5小时',value:'5'},{text: '6小时',value:'6'},
            {text: '7小时',value:'7'},{text: '8小时',value:'8'},{text: '9小时',value:'9'},{text: '10小时',value:'10'}
            ,{text: '11小时',value:'11'},{text: '12小时',value:'12'}];

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
                if($("#chsq1").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var shangchuang=$("#chsq1").val()+":"+selectItems[0].value;
                    console.log("shangchuang:"+shangchuang)
                    if($("#chsq2").val()!=''&& $("#chsq2a").val()!=''){
                        var sleep=$("#chsq2").val()+":"+$("#chsq2a").val();
                        console.log("sleep:"+sleep)
                        if(checkTime(shangchuang,sleep)){
                            alert("上床准备睡觉时间不能大于实际睡着时间");
                            $("#chsq1").val("");
                            $("#chsq1a").val("");
                        }else{
                            $("#chsq1a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq1a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }


            });
        });


        $("#chsq2").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data);
            userPicker.show(function (selectItems) {
                $("#chsq2").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq2a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                if($("#chsq2").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var sleep=$("#chsq2").val()+":"+selectItems[0].value;
                    console.log("sleep:"+sleep)
                    if($("#chsq1").val()!=''&& $("#chsq1a").val()!=''){
                        var shangchuang=$("#chsq1").val()+":"+$("#chsq1a").val();
                        console.log("shangchuang:"+shangchuang)
                        console.log(checkTime(shangchuang,sleep))
                        if(checkTime(shangchuang,sleep)){
                            alert("上床准备睡觉时间不能大于实际睡着时间");
                            $("#chsq2").val("");
                            $("#chsq2a").val("");
                        }else{
                            $("#chsq2a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq2a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }

            });
        });

        $("#chsq3").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data1);
            userPicker.show(function (selectItems) {
                $("#chsq3").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq3a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                if($("#chsq3").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var shangchuang=$("#chsq3").val()+":"+selectItems[0].value;
                    console.log("shangchuang:"+shangchuang)
                    if($("#chsq4").val()!=''&& $("#chsq4a").val()!=''){
                        var sleep=$("#chsq4").val()+":"+$("#chsq4a").val();
                        console.log("sleep:"+sleep)
                        if(checkTime(shangchuang,sleep)){
                            alert("早晨醒来时间不能大于早晨起床时间");
                            $("#chsq3").val("");
                            $("#chsq3a").val("");
                        }else{
                            $("#chsq3a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq3a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }

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
                if($("#chsq4").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var sleep=$("#chsq4").val()+":"+selectItems[0].value;
                    console.log("sleep:"+sleep)
                    if($("#chsq3").val()!=''&& $("#chsq3a").val()!=''){
                        var shangchuang=$("#chsq3").val()+":"+$("#chsq3a").val();
                        console.log("shangchuang:"+shangchuang)
                        console.log(checkTime(shangchuang,sleep))
                        if(checkTime(shangchuang,sleep)){
                            alert("早晨醒来时间不能大于早晨起床时间");
                            $("#chsq4").val("");
                            $("#chsq4a").val("");
                        }else{
                            $("#chsq4a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq4a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }

            });
        });



        $("#chsq5").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data);
            userPicker.show(function (selectItems) {
                $("#chsq5").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq5a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                if($("#chsq5").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var shangchuang=$("#chsq5").val()+":"+selectItems[0].value;
                    if($("#chsq6").val()!=''&& $("#chsq6a").val()!=''){
                        var sleep=$("#chsq6").val()+":"+$("#chsq6a").val();
                        if(checkTime(shangchuang,sleep)){
                            alert("上床准备睡觉时间不能大于实际睡着时间");
                            $("#chsq5").val("");
                            $("#chsq5a").val("");
                        }else{
                            $("#chsq5a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq5a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }

            });
        });


        $("#chsq6").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data);
            userPicker.show(function (selectItems) {
                $("#chsq6").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq6a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                if($("#chsq6").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var sleep=$("#chsq6").val()+":"+selectItems[0].value;
                    if($("#chsq5").val()!=''&& $("#chsq5a").val()!=''){
                        var shangchuang=$("#chsq5").val()+":"+$("#chsq5a").val();
                        if(checkTime(shangchuang,sleep)){
                            alert("上床准备睡觉时间不能大于实际睡着时间");
                            $("#chsq6").val("");
                            $("#chsq6a").val("");
                        }else{
                            $("#chsq6a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq6a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }

            });
        });

        $("#chsq7").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data1);
            userPicker.show(function (selectItems) {
                $("#chsq7").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq7a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                if($("#chsq7").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var shangchuang=$("#chsq7").val()+":"+selectItems[0].value;
                    if($("#chsq8").val()!=''&& $("#chsq8a").val()!=''){
                        var sleep=$("#chsq8").val()+":"+$("#chsq8a").val();
                        if(checkTime(shangchuang,sleep)){
                            alert("早晨醒来时间不能大于早晨起床时间");
                            $("#chsq7").val("");
                            $("#chsq7a").val("");
                        }else{
                            $("#chsq7a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq7a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }
            });
        });

        $("#chsq8").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data1);
            userPicker.show(function (selectItems) {
                $("#chsq8").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq8a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                if($("#chsq8").val()==''){
                    alert('请先选择多少点');
                    userPicker.dispose();
                }else{
                    var sleep=$("#chsq8").val()+":"+selectItems[0].value;
                    if($("#chsq7").val()!=''&& $("#chsq7a").val()!=''){
                        var shangchuang=$("#chsq7").val()+":"+$("#chsq7a").val();
                        if(checkTime(shangchuang,sleep)){
                            alert("早晨醒来时间不能大于早晨起床时间");
                            $("#chsq8").val("");
                            $("#chsq8a").val("");
                        }else{
                            $("#chsq8a").val(selectItems[0].value);
                        }
                    }else{
                        $("#chsq8a").val(selectItems[0].value);
                    }
                    userPicker.dispose();
                }
            });
        });
        
        $(".mybtn").click(function () {
            var data={},message=[];
            $("#div1").find("input").each(function () {
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


           /* console.log(JSON.stringify(data))
            console.log(message)*/
            if(message.length>0){
                for (var m = 0; m < message.length; m++) {
                    showBorder(message[m]);
                    break;
                }
            }else{
               // console.log("success")
                addAnswer(data);
            }

        });


    })
    function checkTime(shangchuangTime,sleepTime) {
        var date = new Date();
        var a = shangchuangTime.split(":");
        var b = sleepTime.split(":");
        var shangchuang=date.setHours(a[0],a[1]);
        var sleep=date.setHours(b[0],b[1]);
        return shangchuang>sleep;
    }
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
