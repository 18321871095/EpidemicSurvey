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
        .mui-select:before{
            right: -3px;
            color: red;
            top:13px;
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
        .mydiv{
            margin: 0 20px;
            border: 2px dotted #666666;
        }
        #boxscroll {
            padding: 40px;
            height: 220px;
            width: 300px;
            border: 2px solid #00F;
            overflow: auto;
            margin-bottom:20px;
        }
    </style>
</head>
<body >
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>
    <div class="mycontent" style="margin-top: 3px">
        <div  style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            儿童睡眠习惯问卷
        </div>
    </div>
    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">
        <%--index--%>
        <div class="mycontent">
            <div class="timu" style="line-height: 30px;text-indent: 30px;">
                以下是关于您孩子睡眠习惯以及可能睡眠困难的问题，请回顾孩子<span style="font-weight: bold;text-decoration: underline;">
                过去一周</span>生活情况进行回答。
                如果过去一周有某些特殊情况(如孩子因为耳部感染而无法安睡，或电视机坏了)，
                那么请根据最近情况正常的一周回答。
            </div>
        </div>

        <%--1--%>
        <div name="1" class="mycontent">
            <div class="timu">1.在<span style="text-decoration: underline">平时（周一到周五）</span>，您的孩子夜间睡眠情况： </div>
            <div  class="answer">
                <div id="div1" onclick="hideBorder(this)" style="margin-bottom: 10px;">1）在平时，您的孩子晚上上床准备睡觉的时间为
                    <div style="display: inline-block;width: 30%">
                        <input type="" id="chsq1" name="chsq1" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq1a" name="chsq1a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>
                <span style="font-weight: bold;">*注意！部分孩子上床后一段时间内会保持清醒状态！</span>

                <div id="div2" onclick="hideBorder(this)" style="margin-bottom: 10px;margin-top: 10px;">2）您的孩子实际睡着的时间为
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq2" name="chsq2" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq2a" name="chsq2a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>

                <div id="div3" onclick="hideBorder(this)"  style="margin-bottom: 10px;">3）您的孩子早晨醒来的时间为
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq3" name="chsq3" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq3a" name="chsq3a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>
            </div>
            <div   class="timu">2.在<span style="text-decoration: underline">平时（周一到周五）</span>，您的孩子白天是否小睡？</div>
                <div id="div4" onclick="hideBorder(this)" class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>是</label>
                        <input  name="chsq42r" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>否</label>
                        <input  name="chsq42r" type="radio"  value="0">
                    </div>
                </div>
                <div id="div4_1" onclick="hideBorder(this)" class="mydiv" style="display: none;">
                    <div class="timu">您的孩子白天睡多少时间？</div>
                    <div class="answer">
                        <div style="display: inline-block;width: 30%">
                            <input  id="chsq42" name="chsq42" readonly="readonly"/><i class="myi"></i>
                        </div>小时
                        <div style="display: inline-block;width: 30%">
                            <input  id="chsq42a" name="chsq42a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
                </div>


            <div   class="timu">3.在<span style="text-decoration: underline">休息日（周六到周日）</span>，您的孩子夜间睡眠情况：</div>
            <div  class="answer">
                <div id="div5" onclick="hideBorder(this)" style="margin-bottom: 10px;">1）在休息日，您的孩子晚上上床准备睡觉的时间为
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq5" name="chsq5" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq5a" name="chsq5a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>
                <span style="font-weight: bold;">*注意！部分孩子上床后一段时间内会保持清醒状态！</span>

                <div id="div6" onclick="hideBorder(this)" style="margin-bottom: 10px;margin-top: 10px;">2）您的孩子实际睡着的时间为
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq6" name="chsq6" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq6a" name="chsq6a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>

                <div id="div7" onclick="hideBorder(this)" style="margin-bottom: 10px;">3）您的孩子早晨醒来的时间为
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq7" name="chsq7" readonly="readonly"/><i class="myi"></i>
                    </div>点
                    <div style="display: inline-block;width: 30%">
                        <input id="chsq7a" name="chsq7a" readonly="readonly"/><i class="myi"></i>
                    </div>分
                </div>

            </div>


            <div  class="timu">4.在<span style="text-decoration: underline">休息日（周六到周日）</span>，您的孩子白天是否小睡？
                <div id="div8" onclick="hideBorder(this)" class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>是</label>
                        <input  name="chsq43r" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>否</label>
                        <input  name="chsq43r" type="radio"  value="0">
                    </div>
                </div>
                <div id="div8_1" onclick="hideBorder(this)" class="mydiv" style="display: none;">
                    <div class="timu">您的孩子白天睡多少时间？</div>
                    <div class="answer">
                        <div style="display: inline-block;width: 30%">
                            <input  id="chsq43" name="chsq43" readonly="readonly"/><i class="myi"></i>
                        </div>小时
                        <div style="display: inline-block;width: 30%">
                            <input  id="chsq43a" name="chsq43a" readonly="readonly"/><i class="myi"></i>
                        </div>分
                    </div>
            </div>
            <br/>
            </div>
        </div>
        <div name="2" class="mycontent">
            <div class="timu">5.以下问题选项，请根据您孩子<span style="font-weight: bold;text-decoration: underline">最近一周</span>的睡眠情况选择相应选项 </div>
            <div style="margin: 0 5px;">
              <table  border="1" style="width: 100%">
                  <tr>
                      <td style="width: 57%;text-align: center;">问题选项</td>
                      <td style="text-align: center;">通常<br/><span style="font-size: 10px">5-7次/周</span></td>
                      <td style="text-align: center;">有时<br/><span style="font-size: 10px">2-4次/周</span></td>
                      <td style="text-align: center;">偶尔<br/><span style="font-size: 10px">0-1次/周</span></td>
                  </tr>
                </table>
                <div  style="height: 350px;overflow-y: auto">
                    <table class="table11" style="color: #666666;table-layout: fixed;width: 100%" border="1" >
                            <tbody id="mytable" >

                            </tbody>
                    </table>
                </div>

            </div>
            <br/>
        </div>

        <div  class="mycontent">
            <div  class="timu">32.在过去的一周中,孩子在如下情形时是否非常瞌睡或入睡?（请选择）</div>
            <div style="padding: 5px 10px;">看电视</div>
            <div id="div40" onclick="hideBorder1(this)" name="32_1"  class="answer">
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
            <div style="padding: 5px 10px;">坐车</div>
            <div id="div41" onclick="hideBorder1(this)" name="32_2"  class="answer">
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



        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao5" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>
    <div style="border:  1px solid #007aff;width: 100%;height: 20px;margin-top: 5px;">
        <div id="demo5" class="mui-progressbar" style="height: 18px;background: #fff;">
            <span></span>
            <div style="position: absolute; left: 45%; color: orange; top: 0">50%</div>
        </div>
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
<script src="${ctx}/static/js/jquery.nicescroll.min.js"></script>
<script src="${ctx}/static/js/init5.js?v=2"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
        mui("#demo5").progressbar({progress:50}).show();
        $("#boxscroll").niceScroll({cursorborder:"",cursorcolor:"#00F",boxzoom:true}); // First scrollable DIV
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


        $("[name='chsq42r']").click(function () {
            var val=$(this).val();
            if(val=='1'){
               $("#div4_1").show();
            }else{
                $("#div4_1").hide();
            }
            $("#div4_1").find("input").val("");
        });
        $("[name='chsq43r']").click(function () {
            var val=$(this).val();
            if(val=='1'){
                $("#div8_1").show();
            }else{
                $("#div8_1").hide();
            }
            $("#div8_1").find("input").val("");
        });

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
                $("#chsq3a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });

        $("#chsq42").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data2);
            userPicker.show(function (selectItems) {
                $("#chsq42").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq42a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                $("#chsq42a").val(selectItems[0].value);
                userPicker.dispose();
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
                $("#chsq7a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });

        $("#chsq43").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(hour_data2);
            userPicker.show(function (selectItems) {
                $("#chsq43").val(selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("#chsq43a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(min_data);
            userPicker.show(function (selectItems) {
                $("#chsq43a").val(selectItems[0].value);
                userPicker.dispose();
            });
        });


    });

    function checkTime(shangchuangTime,sleepTime) {
        var date = new Date();
        var a = shangchuangTime.split(":");
        var b = sleepTime.split(":");
        var shangchuang=date.setHours(a[0],a[1]);
        var sleep=date.setHours(b[0],b[1]);
        return shangchuang>sleep;
    }
</script>
</html>
