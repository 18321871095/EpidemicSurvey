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
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <style>
        .mycontent{
            height: 75%;
            overflow-y: auto;
            background-color: #fff;
            background-clip: padding-box;
            border-radius: 10px;
            margin-left: 20px;
            margin-right: 20px;
        }
        *{
            margin: 0;
            padding: 0;
        }

        .timu{
            font-size: 17px;
            color: #086cfe;
            padding-top: 5px;
            padding-left: 10px;
            padding-right: 10px;
            padding-bottom: 3px;
        }
        .answer{
            padding-bottom: 10px;
            padding-left: 20px;
            padding-right: 20px;
            font-size: 17px;
            color: #666666;
        }
    </style>
</head>
<body>

<div style="max-width: 750px;margin:  0 auto;background-color: #87b2ff;height: 100%">

        <br/><br/><br/>
        <div name="1" class="mycontent">
            <div class="timu">1.孩子母亲的受教育程度？</div>
            <div class="answer">
                <div class="mui-input-row mui-radio mui-left">
                    <label>未受过正式教育</label>
                    <input  name="ques4a" type="radio"  value="1">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>未读完小学，但能够读、写</label>
                    <input  name="ques4a" type="radio"  value="2">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>小学毕业</label>
                    <input  name="ques4a" type="radio"  value="3">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>初中毕业</label>
                    <input  name="ques4a" type="radio"  value="4">
                </div>

                <div class="mui-input-row mui-radio mui-left">
                    <label>高中毕业</label>
                    <input  name="ques4a" type="radio"  value="5">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>中专（包括中等师范、职高）毕业</label>
                    <input  name="ques4a" type="radio"  value="6">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>大专毕业</label>
                    <input  name="ques4a" type="radio"  value="7">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>本科毕业</label>
                    <input  name="ques4a" type="radio"  value="8">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>硕士毕业</label>
                    <input  name="ques4a" type="radio"  value="9">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>博士毕业</label>
                    <input  name="ques4a" type="radio"  value="10">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>不知道</label>
                    <input  name="ques4a" type="radio"  value="11">
                </div>
                <div class="mui-input-row mui-radio mui-left">
                    <label>拒绝回答</label>
                    <input  name="ques4a" type="radio"  value="12">
                </div>
            </div>
        </div>
    <br/>
      <div  style="text-align: center;">
            <button id="tijiao0" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>
        <br/>


</div>

</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script>
    $(function () {
        $("#tijiao0").click(function () {
            var data={};
           var value=$("[name='ques4a']:checked").val();
            if(typeof (value)=='undefined'){
                mui.toast("请选择答案");
            } else {
                data["ques4a"]=value;
                $.post("/survey/addAnswerByNo",{data:JSON.stringify(data)},function (data) {
                    if(data=='success'){
                        window.location.href="/survey/signout";
                    }else if(data=='fail'){
                        mui.alert("提交失败，请重新尝试");
                    }else if(data=='noLogin'){
                        mui.alert("登录信息失效，请重新登录",function () {
                            window.location.href="/frontEnd/login.jsp";
                        });
                    }else if(data=='isNull'){
                        mui.alert("服务器发生错误，获取对象为空");
                    }
                    else {
                        mui.alert("服务器发生错误");
                    }
                });
            }
        })
    });

</script>

</html>
