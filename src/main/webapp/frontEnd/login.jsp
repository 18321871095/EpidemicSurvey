<%@ page import="com.chinasofti.bean.childAnswer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>登陆</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/mui.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">

</head>


<body style="background: #fff;max-width: 750px;margin: 0 auto;">
<div class="mui-content" style="background: #fff;">
    <div class="wrap">
        <div>
            <img src="${ctx}/static/images/dl-img.png" width="100%">
        </div>
        <!--  -->
        <div class="myForm mui-input-group">
            <div class="mui-input-row">
                <label class="iconfont">&#xe791;</label>
                <input id="phone" type="text" placeholder="请输入您的手机号">
            </div>
            <div class="mui-input-row">
                <label class="iconfont">&#xe690;</label>
                <input id="token" style="width: 80%;" type="text" placeholder="请输入您的问卷码" value="">
            </div>
            <div class="mui-input-row mui-row">
                <div class="mui-col-sm-8 mui-col-xs-8">
                    <input id="code" type="text" placeholder="请输入验证码" class="mui-input-clear">
                </div>
                <div  class="mui-col-sm-4 mui-col-xs-4">
                    <input id="getcode" type="button" class="yzmBtn" value="获取验证码" style="height: 40px; color: #ff8400;">
                </div>
            </div>
            <button id="login" class="myForm-btn">登录</button>
        </div>

    </div>

</div>
</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        if("1"=="${requestScope.status}"){
            mui.confirm('${requestScope.loginphone}已经登陆系统了！', '提示', ['跳过登录','重新登录'], function(e) {
                if (e.index == 1) {
                    //重新登录
                    window.location.href="/util/reLogin";
                }else{
                    //跳过登录
                    window.location.href="/survey/infoExist";
                }
            })
        }
        $("#getcode").click(function () {

           // var telStr = /^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$/;
            if(!/^1[3456789]\d{9}$/.test($("#phone").val())){
                mui.toast("手机号格式错误")
            }else{
                $.post("/util/getCode",{phone:$("#phone").val()},function (data) {
                    if(data.msg=='success'){
                        mui.toast("发送成功");
                        $("#getcode").attr("disabled","disabled");
                        var count=90;
                        var time=setInterval(function () {
                            $("#getcode").val(count+"s");
                            count--;
                            if(count<0){
                                $("#getcode").removeAttr("disabled");
                                $("#getcode").val("获取验证码");
                                clearInterval(time);
                            }
                        },1000);
                    }else if(data.msg='fail'){
                        mui.alert(data.result);
                        $("#getcode").removeAttr("disabled");
                    }else{
                        mui.alert("发送失败");
                        $("#getcode").removeAttr("disabled");
                    }
                });
            }
        });

        $("#login").click(function () {
            if($("#code").val()!='' && $("#phone").val()!='' && $("#token").val()!=''){
                var data={
                    inputCode:$("#code").val().replace(/\s*/g,''),
                    inputPhone:$("#phone").val().replace(/\s*/g,''),
                    inputToken:$("#token").val().replace(/\s*/g,'').replace('?',''),
                    rememberMe:"1"
                };
                sendRequest("登陆中...",10000,"/survey/login",data,function(data){
                    if(data.msg=='success'){
                        window.location.href="/survey/infoExist";
                    }
                    else{
                        if(data.result=='没有该手机号绑定的孩子,请仔细检查老师所发问卷码(即手机号)'){
                            mui.alert("该问卷码查不到孩子信息，请仔细检查老师所发问卷码");
                        }else{
                            mui.alert(data.result);
                        }

                    }
                })

            }else{
                if($("#phone").val()==''){
                    mui.toast("手机号为空");
                }else if($("#token").val()==''){
                    mui.toast("问卷码为空");
                }else if($("#code").val()==''){
                    mui.toast("验证码为空");
                }
            }

        });
    })
</script>
</html>
