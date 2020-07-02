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
    <link rel="stylesheet" href="${ctx}/static/css/mui.poppicker.css">
    <link href="${ctx}/static/css/mui.dtpicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.picker.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
</head>
<body style="background: #fff;">
    <div class="mui-content" style="background: #fff;">
        <div>
            <img src="${ctx}/static/images/xx-img.png" width="100%">
            <div class="formBox">
                <div class="mui-input-group">
                    <ul class="mui-table-view mui-table-view-chevron">
                       <%-- <li class="mui-table-view-cell">
                            <a href="#" id='schoolPicker' class="mui-navigate-right">学校<span id='schoolResult' class="mui-pull-right">请选择</span></a>
                        </li>--%>
                           <li class="mui-table-view-cell">
                               <a href="#" >学校
                                   <span id='schoolResult' class="mui-pull-right">${sessionScope.childAnswer.getChild_schoolName()}</span>
                               </a>
                           </li>
                    </ul>
                    <div class="mui-input-row">
                        <label>姓名</label>
                        <input id="name" type="text" placeholder="请输入孩子姓名">
                    </div>
                    <ul class="mui-table-view mui-table-view-chevron">
                        <li class="mui-table-view-cell">
                            <a href="#" id="sexPicker" class="mui-navigate-right">性别
                                <span id='sexResult' class="mui-pull-right">请选择孩子性别</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="mui-table-view mui-table-view-chevron">
                        <li class="mui-table-view-cell">
                            <a href="#" id='classPicker' class="mui-navigate-right">年级
                                <span id='classResult' class="mui-pull-right">请选择孩子年级</span>
                                <input id='classResultInput' value="" style="display: none;" />
                            </a>
                        </li>
                    </ul>
                    <ul class="mui-table-view mui-table-view-chevron">
                        <li class="mui-table-view-cell">
                            <a href="#" id='birthdayPicker' class="mui-navigate-right">生日
                                <span id='birthdayResult' class="mui-pull-right">请选择孩子生日</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="mui-input-row">
                    <button id="tijiao" class="subBtn">下一步</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/js/mui.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.dtpicker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script>
    $(function () {
        $("#sexPicker").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '男',
                    text: '男'
                },
                {
                    value: '女',
                    text: '女'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#sexResult").text(selectItems[0].value);
                userPicker.dispose();
            });
        });
        
        $("#classPicker").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '1年级'
                },
                {
                    value: '2',
                    text: '2年级'
                },
                {
                    value: '3',
                    text: '3年级'
                },
                {
                    value: '4',
                    text: '4年级'
                },
                {
                    value: '5',
                    text: '5年级'
                },
                {
                    value: '6',
                    text: '6年级'
                },
                {
                    value: '7',
                    text: '7年级'
                },
                {
                    value: '8',
                    text: '8年级'
                },
                {
                    value: '9',
                    text: '9年级'
                },
                {
                    value: '10',
                    text: '高中1年级'
                },
                {
                    value: '11',
                    text: '高中2年级'
                },
                {
                    value: '12',
                    text: '高中3年级'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#classResult").text(selectItems[0].text);
                $("#classResultInput").val(selectItems[0].value)
                userPicker.dispose();
            });
        });

        $("#birthdayPicker").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                  //  $("[name='care3b1']").val(date);
                    $("#birthdayResult").text(date);
                }else{
                    $("#birthdayResult").text("请选择孩子生日");
                    mui.alert("生日不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });

        $("#tijiao").click(function () {
            var name=$.trim($("#name").val());
            var sex=$.trim($("#sexResult").text());
            var banji=$.trim(   $("#classResultInput").val());
            var birthday=$.trim($("#birthdayResult").text());
            if(name=='' || sex=='请选择孩子性别' || banji=='请选择孩子年级'|| birthday=='请选择孩子生日'){
                mui.toast("有空选项")
             }else{
                var data={name:name,sex:sex,banji:banji,birthday:birthday};
                sendRequest("提交中...",10000,"/survey/addChild",data,function (data) {
                    if(data.msg=='001'){
                        window.location.href="/frontEnd/login.jsp";
                    }else if(data.msg=='err'){
                        mui.toast("服务器出错");
                    }else if(data.msg=='success'){
                       window.location.href="/old/zqtyj.jsp";
                    }
                    else {
                        mui.toast(data.result);
                    }
                })
            }

        });


    })
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
