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
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.picker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.dtpicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.poppicker.css" rel="stylesheet">
    <style>
        .ul_input{
            border-top: none;
            border-right: none;
            border-left: none;
            text-align: center;
        }
        .mydiv{
            margin: 0 20px;
            border: 2px dotted #666666;
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
            孩子以及家庭的基本信息
        </div>
    </div>
    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">
        <%--index--%>
        <div name="0" class="mycontent">
            <div class="timu" style="line-height: 28px;text-indent: 30px;">
                这是一项科学研究，所以您填写的所有内容除了本研究团队人员，
                没有征得您本人同意任何人（包括老师、孩子及其他人员）都不会知晓，严格保密。
                为此我们想征求您意见，并按照您的意见进行后续反馈。
                <br>
                <div style="font-weight: bold;text-indent: 30px">我个人填写以下内容的报告分析，我希望最后能够：</div>
            </div>
            <div id="div0"  class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>反馈给老师及我们家长</label>
                    <input  name="ques5" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>仅反馈给我们家长</label>
                    <input  name="ques5" type="radio" value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>不需要任何反馈</label>
                    <input  name="ques5" type="radio"  value="3">
                </div>
            </div>
        </div>
        <%--1--%>
        <div name="1" id="div1" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">1.您跟孩子的关系是?</div>
            <div class="answer">
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
                <input id="ques2_input" type="text" name="ques2a" readonly="readonly"
                       style="width: 150px;margin-left: 58px;height: 30px" value="" >
            </div>
        </div>
        <%--2--%>
        <div name="2" id="div2" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">2.请问自2019年11月（上次调研时间）至今孩子的父母亲受教育程度有无改变？</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>父亲受教育程度改变</label>
                    <input  name="ses0" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>母亲受教育程度改变</label>
                    <input  name="ses0" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>父母亲受教育程度均改变</label>
                    <input  name="ses0" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>无</label>
                    <input  name="ses0" type="radio"  value="0">
                </div>
            </div>
        </div>
        <%--3--%>
        <div name="3" id="div3" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">3.请问孩子的父亲当前的受教育程度？</div>
            <div id="1_3"  class="answer"></div>
        </div>
        <%--4--%>
        <div name="4" id="div4" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">4.请问孩子的母亲当前的受教育程度？</div>
            <div id="1_4"  class="answer"></div>
        </div>


        <div name="5" id="div5" onclick="hideBorder(this)" class="mycontent">
            <div class="timu">5.孩子是否是独生子女？</div>
            <div id="div12" class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>是</label>
                    <input  name="care3" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>否</label>
                    <input  name="care3" type="radio"  value="0">
                </div>
            </div>
            <div id="div6" onclick="hideBorder(this)" style="display: none;" class="mydiv">
                <div>
                    <div class="timu">1.您家里有几个孩子？</div>
                    <div id="div12_1"  class="answer" style="text-align: center;">
                        <input id="care3b_input_temp" type="text" name="care3b_temp" readonly="readonly" placeholder="请选择"
                               style="width: 150px;height: 30px" value="" >
                        <input id="care3b_input" type="hidden" name="care3b" readonly="readonly"
                               style="width: 150px;height: 30px" value="" >
                    </div>
                </div>
                <div id="div7">
                    <div class="timu">2.每个孩子的出生年月（<span style="color: red;">如有双胞胎，请分别填写两个双胞胎的生日</span>）？</div>
                    <div id="div12_2"  class="answer" style="font-size: 15px;">
                        <div id="childBirthday1" style="display: none;">
                            第一个孩子<input type='text' id="care3b1" name="care3b1" style="width: 62%;" readonly="readonly" placeholder="请选择生日" >
                            <div style="margin-left: 20%;" class="mui-input-row mui-checkbox mui-left">
                                <label>本次调查儿童</label>
                                <input  name="care3b1a" type="checkbox">
                            </div>
                        </div>
                        <div id="childBirthday2" style="display: none;">
                            第二个孩子<input type='text' id="care3b2" name="care3b2" style="width: 62%;" readonly="readonly" placeholder="请选择生日" >
                            <div style="margin-left: 20%;" class="mui-input-row mui-checkbox mui-left">
                                <label>本次调查儿童</label>
                                <input  name="care3b2a" type="checkbox">
                            </div>
                        </div>
                        <div id="childBirthday3" style="display: none;">
                            第三个孩子<input type='text' id="care3b3" name="care3b3" style="width: 62%;" readonly="readonly" placeholder="请选择生日" >
                            <div style="margin-left: 20%;" class="mui-input-row mui-checkbox mui-left">
                                <label>本次调查儿童</label>
                                <input  name="care3b3a" type="checkbox">
                            </div>
                        </div>
                        <div id="childBirthday4" style="display: none;">
                            第四个孩子<input type='text' id="care3b4" name="care3b4" style="width: 62%;" readonly="readonly" placeholder="请选择生日" >
                            <div style="margin-left: 20%;" class="mui-input-row mui-checkbox mui-left">
                                <label>本次调查儿童</label>
                                <input  name="care3b4a" type="checkbox">
                            </div>
                        </div>
                        <div id="childBirthday5" style="display: none;">
                            第五个孩子<input type='text' id="care3b5" name="care3b5" style="width: 62%;" readonly="readonly" placeholder="请选择生日" >
                            <div style="margin-left: 20%;" class="mui-input-row mui-checkbox mui-left">
                                <label>本次调查儿童</label>
                                <input  name="care3b5a" type="checkbox">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao1" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>
<br/>
    </div>
</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.dtpicker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/init1.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();

        $("[name='ques2']").click(function () {
            if($(this).val()=='4'){
                $("#ques2_input").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#ques2_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }

        });

        $("[name='ses0']").click(function () {
            if($(this).val()=='1'){
                $("#div4").hide().find("input[type='radio']").prop("checked",false);
                $("#div3").show().find("input[type='radio']").prop("checked",false);
            }else if($(this).val()=='2'){
                $("#div3").hide().find("input[type='radio']").prop("checked",false);
                $("#div4").show().find("input[type='radio']").prop("checked",false);
            }else if($(this).val()=='3'){
                $("#div3").show().find("input[type='radio']").prop("checked",false);
                $("#div4").show().find("input[type='radio']").prop("checked",false);
            }else{
                $("#div3").hide().find("input[type='radio']").prop("checked",false);
                $("#div4").hide().find("input[type='radio']").prop("checked",false);
            }

        });

        $("[name='care3']").click(function () {
            var val=$(this).val();
            if(val=='1'){
                $("#div6").hide();
            }else{
                $("#div6").show();
            }
            $("#div6").find("input[type='text']").val("");
            $("#div6").find("input[type='checkbox']").prop("checked",false);
            $("#childBirthday1").hide();
            $("#childBirthday2").hide();
            $("#childBirthday3").hide();
            $("#childBirthday4").hide();
            $("#childBirthday5").hide();
        });

        $("#care3b_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                  {
                      value: '1',
                      text: '1个'
                  },
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
                $("#care3b_input_temp").val(selectItems[0].text);
                $("#care3b_input").val(selectItems[0].value);
                userPicker.dispose();
                $("#div12_2").find("input[type='text']").val("");
                $("#div12_2").find("input[type='checkbox']").prop("checked",false);
                if(selectItems[0].value=='1'){
                    $("#childBirthday1").show();
                    $("#childBirthday2").hide();
                    $("#childBirthday3").hide();
                    $("#childBirthday4").hide();
                    $("#childBirthday5").hide();
                }else if(selectItems[0].value=='2'){
                    $("#childBirthday1").show();
                    $("#childBirthday2").show();
                    $("#childBirthday3").hide();
                    $("#childBirthday4").hide();
                    $("#childBirthday5").hide();
                }else if(selectItems[0].value=='3'){
                    $("#childBirthday1").show();
                    $("#childBirthday2").show();
                    $("#childBirthday3").show();
                    $("#childBirthday4").hide();
                    $("#childBirthday5").hide();
                }else if(selectItems[0].value=='4'){
                    $("#childBirthday1").show();
                    $("#childBirthday2").show();
                    $("#childBirthday3").show();
                    $("#childBirthday4").show();
                    $("#childBirthday5").hide();
                }else if(selectItems[0].value=='5'){
                    $("#childBirthday1").show();
                    $("#childBirthday2").show();
                    $("#childBirthday3").show();
                    $("#childBirthday4").show();
                    $("#childBirthday5").show();
                }
            });
        });
        $("#care3b1").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='care3b1']").val(date);
                }else{
                    $("[name='care3b1']").val("");
                    alert("生日不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });
        $("#care3b2").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='care3b2']").val(date);
                }else{
                    $("[name='care3b2']").val("");
                    alert("生日不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });
        $("#care3b3").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='care3b3']").val(date);
                }else{
                    $("[name='care3b3']").val("");
                    alert("生日不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });
        $("#care3b4").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='care3b4']").val(date);
                }else{
                    $("[name='care3b4']").val("");
                    alert("生日不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });
        $("#care3b5").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='care3b5']").val(date);
                }else{
                    $("[name='care3b5']").val("");
                    alert("生日不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });


    });

    function checkTime(paramTime) {
        var param=new Date(paramTime.replace(/-/g,"/"));
        var currentTime=new Date();
        //js判断日期
        if(param-currentTime>0){
            return false;
        }else{
            return true;
        }

    }
</script>
</html>
