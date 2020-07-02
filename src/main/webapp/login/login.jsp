<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" class="no-js">

<script>
    if(window!=top){
        top.location.href=location.href;
    }
</script>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="copyright" content="">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <!-- CSS -->
    <link rel="stylesheet" href="css/supersized.css">
    <link rel="stylesheet" href="css/login.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${ctx}/images/biaozhi_title.jpg">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <!--html5.js解决目前IE浏览器对HTML5支持的问题,在页面中调用html5.js文件必须添加在页面的head元素内-->
    <script src="js/html5.js"></script>
    <script src="js/jquery-1.8.2.min.js"></script>
    <style>
        a:hover{
            color: red;
        }
    </style>
</head>
<body>

<div class="page-container">
    <div class="main_box">
        <div class="login_box">
            <div class="login_logo">
                <img src="${ctx}/static/images/biaozhi.png" >
            </div>
            <div class="login_form">
                <div>
                    <div class="form-group">
                        <label for="zhanghao" class="t">账　号：</label>
                        <input id="zhanghao" value="" name="zhanghao" type="text" class="form-control x319 in"
                               autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="t">密　码：</label>
                        <input  id="password" value="" name="password" type="password"
                               class="password form-control x319 in">
                        <button id="mybtn" onclick="showPWD(this)">显示密码</button>
                    </div>
                    <div class="form-group space" id="pwd_div">
                        <label class="t"></label>　　　
                        <button type="button"  id="submit_btn" style="padding: 8px 77px"
                                class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp </button>
                        <a href="javascript:void(0);" id="reset_pwd" style="cursor: pointer;">忘记密码？</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Javascript -->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/js/login.js?v=2"></script>
<script src="${ctx}/static/js/jsencrypt.js"></script>
<script>
    function showPWD(obj) {
        var password = document.getElementById("password")
        if(password.type === "password"){
            password.type = "text";
            obj.innerHTML="隐藏密码";
        }else{
            password.type = "password";
            obj.innerHTML="显示密码";
        }
    }
</script>
</body>
</html>