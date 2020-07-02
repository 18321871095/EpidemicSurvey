<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>二维码</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${ctx}/static/css/questionNaireSurvey.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
</head>
<body >
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>

  <%--  <div class="mycontent" style="margin-top: 3px">
        <div  style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            二维码
        </div>
    </div>--%>


    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div class="mycontent">
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                母亲心理状况及共情能力对儿童早期发展至关重要，我们强烈建议母亲填写心理状况及共情能力问卷，请选择：
            </div>
                <div class="timu">1.我感觉快乐、心情舒畅</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>母亲继续填写问卷</label>
                        <input  name="select" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>拒绝</label>
                        <input  name="select" type="radio"  value="0">
                    </div>
                    <input id="select_input" type="text" name="selecta" readonly="readonly"
                           style="width: 190px;margin-left: 58px;height: 30px" value="" >
                </div>


        </div>

        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao12" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>
    <div style="border:  1px solid #007aff;width: 100%;height: 20px;margin-top: 5px;">
        <div id="demo12" class="mui-progressbar" style="height: 18px;background: #fff;">
            <span></span>
            <div style="position: absolute; left: 45%; color: orange; top: 0">95%</div>
        </div>
    </div>
</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
        mui("#demo12").progressbar({progress:95}).show();
        $("[name='select']").click(function () {
            if($(this).val()=='0'){
                $("#select_input").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写拒绝原因");

            }else{
                $("#select_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");

            }

        });

        $("#tijiao12").click(function () {
            var data={};
            var flag=true;
            data["select"]=$("[name='select']:checked").val()==undefined ? "" : $("[name='select']:checked").val();
            data["selecta"]=$("#select_input").val();
            if(data["select"]==''){
                mui.toast("请选择答案");
                flag=false;
            }else if(data["select"]=='0'){
                if(  data["selecta"]==''){
                    mui.toast("请填写拒绝原因");
                    flag=false;
                }
            }
            if(flag){
               // console.log(JSON.stringify(data));
                sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:12},function (data) {
                    if(data.msg=='success'){
                        window.location.href="/util/goIndex";
                    }else if(data.msg=='complete'){
                        window.location.href="/util/complete";
                    }else{
                        mui.alert(data.result);
                    }
                })
            }
        });

    })

   /* function showEncode() {
        $("#myEnCode").empty().qrcode({
            render: "canvas", //table方式
            width: 200, //宽度
            height:200, //高度
            text:url + "/jsp/frontEnd/login.jsp"
        });
    }*/
</script>
</html>
