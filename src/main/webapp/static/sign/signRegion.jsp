<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>区注册</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctx}/static/css/mui.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/muikuozhan.css">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link rel="stylesheet" href="${ctx}/static/css/mui.picker.css">
    <link rel="stylesheet" href="${ctx}/static/css/mui.poppicker.css">
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .tishi{
            color: red;
            line-height: 30px;
            font-size: 14px;
            text-align: left;
            display: inline-block;
            text-indent: 28px;
        }
        .mui-input-row{
            border-top: none;
        }
    </style>
</head>
<body>


<div class="mui-content">
    <div id="editor_bgImg" style="width: 100%; background:url(/static/images/region.jpg) no-repeat; background-size: 100% 100%; position: relative; overflow: hidden;">
        <div class="formBox" style="position: absolute; top: 200px; left: 5%; width: 90%; box-sizing: border-box;  border-radius: 10px;">
            <div id="myform" class="mui-input-group">
               <%-- <ul class="mui-table-view mui-table-view-chevron">
                    <li class="mui-table-view-cell">
                        <a href="#" class="mui-navigate-right">所属区<span style="margin-left: 25%">浦东新区</span></a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a href="#" class="mui-navigate-right">学校</a>
                    </li>
                </ul>
--%>
               <div class="mui-input-row" style="border-radius: 0;">
                   <label>所属区</label>
                   <input id="region" name="userArea" readonly type="text" placeholder="请选择所属区">
               </div>

                <div class="mui-input-row" style="border-radius: 0;">
                    <label>姓名</label>
                    <input id="name" type="text" name="name" placeholder="请输入您的姓名">
                </div>
                <div class="mui-input-row" style="border-radius: 0;">
                    <label>手机号</label>
                    <input id="phone" type="tel" name="userAccount" placeholder="请输入您的手机号">
                </div>
                <div class="mui-input-row" style="border-radius: 0;">
                    <label>密码</label>
                    <input id="password" name="userPwd" oninput="value=value.replace(/[\u4e00-\u9fa5]/ig,'')"  type="password"
                           placeholder="请输入注册密码" class="mui-input-password">
                </div>
                <div class="mui-input-row mui-row" style="border-radius: 0;">
                    <div class="mui-col-sm-8 mui-col-xs-8">
                        <input id="code" name="code" type="tel" placeholder="请输入验证码" class="mui-input-clear">
                    </div>
                    <div class="mui-col-sm-4 mui-col-xs-4">
                        <button id="codebtn" class="yzmBtn">获取验证码</button>
                    </div>

                </div>


            </div>
            <div class="mui-input-row">
                <button id="sign" class="subBtn">立即注册</button>
            </div>

        </div>


    </div>
    <!--  -->

</div>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/jsencrypt.js"></script>
<script src="${ctx}/static/js/signRegion.js?v=1"></script>
<script>
    var schools=[];
    $("#region").click(function () {
        var userPicker = new mui.PopPicker();
        userPicker.setData([{
            value: '嘉定区',
            text: '嘉定区'
        }, {
            value: '奉贤区',
            text: '奉贤区'
        }, {
            value: '宝山区',
            text: '宝山区'
        }, {
            value: '崇明区',
            text: '崇明区'
        }, {
            value: '徐汇区',
            text: '徐汇区'
        }, {
            value: '普陀区',
            text: '普陀区'
        }, {
            value: '杨浦区',
            text: '杨浦区'
        }, {
            value: '松江区',
            text: '松江区'
        }, {
            value: '浦东新区',
            text: '浦东新区'
        }, {
            value: '虹口区',
            text: '虹口区'
        }, {
            value: '金山区',
            text: '金山区'
        }, {
            value: '长宁区',
            text: '长宁区'
        }, {
            value: '闵行区',
            text: '闵行区'
        }, {
            value: '青浦区',
            text: '青浦区'
        }, {
            value: '静安区',
            text: '静安区'
        }, {
            value: '黄浦区',
            text: '黄浦区'
        }]);
        userPicker.show(function (selectItems) {
            $("#region").val(selectItems[0].text);
            userPicker.dispose();
            schools=[];
            getSchools(selectItems[0].value,schools);
        });
    });


</script>
</html>
