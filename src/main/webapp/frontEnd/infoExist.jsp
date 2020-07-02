<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>信息</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/mui.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
</head>
<body style="max-width: 750px;margin: 0 auto;">
    <div class="mui-content" style="background: #fff;">
        <div>
            <img src="${ctx}/static/images/xx-img.png" width="100%">
            <div class="formBox">
                <div class="mui-input-group">
                    <div class="mui-input-row">
                        <label>姓名</label>
                        <input id="name" type="text" placeholder="" readonly="readonly" value="${requestScope.child.getName()}">
                    </div>
                    <div class="mui-input-row">
                        <label>性别</label>
                        <input id="sex" type="text" placeholder="" readonly="readonly" value="${requestScope.child.getSex()}">
                    </div>
                    <div class="mui-input-row">
                        <label>生日</label>
                        <input id="birthday" type="text" placeholder="" readonly="readonly" value="${requestScope.child.getBirthday()}">
                    </div>

                </div>
                <div class="mui-input-row">
                    <button id="is" class="subBtn">是我孩子信息</button>
                </div>
                <div class="mui-input-row">
                    <button id="no" class="subBtn" style="background: red;margin-bottom: 20px;">不是我孩子信息</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script>
    $(function () {
        $("#is").click(function () {
            window.location.href="/frontEnd/isMychildInfo.jsp";
        });
        $("#no").click(function () {
            mui.alert("如果不是您孩子的信息请联系老师！");
        });
    })
</script>

</html>
