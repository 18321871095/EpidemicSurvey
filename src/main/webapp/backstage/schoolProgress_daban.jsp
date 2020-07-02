<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="copyright" content="">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <!--html5.js解决目前IE浏览器对HTML5支持的问题,在页面中调用html5.js文件必须添加在页面的head元素内-->
    <script src="${ctx}/login/js/html5.js"></script>

</head>
<body>
<div style="margin: 10px;">
    <button style="width: 12%;" id="download_file" class="layui-btn layui-btn-sm">
        <i class="layui-icon"></i>查看未完成</button>
</div>
<div style="margin: 10px 10px">总进度：
    <div class="layui-progress layui-progress-big" lay-showPercent="yes">
        <div id="myprogress" class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
    </div>

</div>

<div id="mydiv_school" style="margin: 0px  20px;height: 500px;overflow-y: auto;/*border: 1px solid red*/">
    <table class="layui-table" style="margin-top: 0px;">
        <thead>
        <tr>
            <c:if test="${sessionScope.LoginInfo.getAdminPss()=='1'}">
                <th>问卷码</th>
            </c:if>
            <th>姓名</th>
            <th>性别</th>
            <th>生日</th>
            <th>班级</th>
            <th>手机号</th>
            <th>是否同意</th>
            <th>完成进度</th>
        </tr>
        </thead>
        <tbody id="mytbody">
        </tbody>
    </table>
</div>

<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
</body>
<script>
    var noCompleteList=[];
    $(function () {
        var myheight=document.body.clientHeight;
        $("#mydiv_school").css("height",(myheight/1.26)+"px");
        layui.use(['element', 'layer'], function () {
            var element=layui.element,layer=layui.layer;
            var state="${sessionScope.LoginInfo.getAdminPss()}";
            var index = layer.load(2,{offset: ['200px', '50%']});
            $.post("/backstage/selProgressBySchoolId",{type:'2'},function (data) {
                layer.close(index);
                if(data.msg=='success'){
                    $("#mytbody").empty();
                    var complete=0;
                    for(var i=0;i<data.result.length;i++){
                            if(state=='1'){
                                $("#mytbody").append("<tr>\n" +
                                    "            <td>"+(typeof(data.result[i].token)=='undefined' ? "" : data.result[i].token )+"</td>\n" +
                                    "            <td>"+data.result[i].name+"</td>\n" +
                                    "            <td>"+data.result[i].sex+"</td>\n" +
                                    "            <td>"+data.result[i].birthday+"</td>\n" +
                                    "            <td>"+data.result[i].banji+"</td>\n" +
                                    "            <td>"+(data.result[i].phone==undefined?"":data.result[i].phone)+"</td>\n" +
                                    "            <td>"+getAgree_daban(data.result[i].agree)+"</td>\n" +
                                    "            <td>\n" +
                                    "                <div class=\"layui-progress layui-progress-big\" lay-showPercent=\"yes\">\n" +
                                    "                    <div class=\"layui-progress-bar layui-bg-green\" lay-percent="+getProgress_daban(data.result[i].state,data.result[i].currentNum)+"></div>\n" +
                                    "                </div>\n" +
                                    "            </td>\n" +
                                    "        </tr>");
                            }else{
                                $("#mytbody").append("<tr>\n" +
                                    "            <td>"+data.result[i].name+"</td>\n" +
                                    "            <td>"+data.result[i].sex+"</td>\n" +
                                    "            <td>"+data.result[i].birthday+"</td>\n" +
                                    "            <td>"+data.result[i].banji+"</td>\n" +
                                    "            <td>"+(data.result[i].phone==undefined?"":data.result[i].phone)+"</td>\n" +
                                    "            <td>"+getAgree_daban(data.result[i].agree)+"</td>\n" +
                                    "            <td>\n" +
                                    "                <div class=\"layui-progress layui-progress-big\" lay-showPercent=\"yes\">\n" +
                                    "                    <div class=\"layui-progress-bar layui-bg-green\" lay-percent="+getProgress_daban(data.result[i].state,data.result[i].currentNum)+"></div>\n" +
                                    "                </div>\n" +
                                    "            </td>\n" +
                                    "        </tr>");
                            }
                            if(data.result[i].state!='1'){
                                noCompleteList.push(data.result[i]);
                            }else{
                                complete++;
                            }
                   }
                   $("#myprogress").attr("lay-percent",parseInt(complete/data.result.length*100)+"%");
                   // $("#myprogress").attr("lay-percent","50%");
                    element.render('progress');
                }else{
                   alert(data.result);
                }
            });

            $("#download_file").click(function () {
                layer.open({
                    title:'未完成',
                    area:['800px','80%'],
                    offset: '20px',
                    type: 1,
                    content: '<div style="border: 1px solid red;width: 97%;height: 95%;overflow-y: auto;margin:10px;">' +
                    '<table class="layui-table" style="margin-top: 0px;">\n' +
                    '        <thead>\n' +
                    '        <tr>\n' +
                    '            <c:if test="${sessionScope.LoginInfo.getAdminPss()==\'1\'}">\n' +
                    '                <th>问卷码</th>\n' +
                    '            </c:if>\n' +
                    '            <th>姓名</th>\n' +
                    '            <th>班级</th>\n' +
                    '            <th>完成进度</th>\n' +
                    '        </tr>\n' +
                    '        </thead>\n' +
                    '        <tbody id="mytbody1">\n' +
                    '        </tbody>\n' +
                    '    </table>' +
                    '</div>',
                    success: function(layero, index){
                       // console.log(123)
                       // console.log(noCompleteList)
                        var progress="10";
                        for(var i=0;i<noCompleteList.length;i++){
                            if(state=='1'){
                                $("#mytbody1").append("<tr>\n" +
                                    "            <td>"+(typeof(noCompleteList[i].token)=='undefined' ? "" : noCompleteList[i].token )+"</td>\n" +
                                    "            <td>"+noCompleteList[i].name+"</td>\n" +
                                    "            <td>"+noCompleteList[i].banji+"</td>\n" +
                                    "            <td>\n" +
                                    "                <div class=\"layui-progress layui-progress-big\" lay-showPercent=\"yes\">\n" +
                                    "                    <div class=\"layui-progress-bar layui-bg-green\" lay-percent="+getProgress_daban(noCompleteList[i].state,noCompleteList[i].currentNum)+"></div>\n" +
                                    "                </div>\n" +
                                    "            </td>\n" +
                                    "        </tr>");
                            }else{
                                $("#mytbody1").append("<tr>\n" +
                                    "            <td>"+noCompleteList[i].name+"</td>\n" +
                                    "            <td>"+noCompleteList[i].banji+"</td>\n" +
                                    "            <td>\n" +
                                    "                <div class=\"layui-progress layui-progress-big\" lay-showPercent=\"yes\">\n" +
                                    "                    <div class=\"layui-progress-bar layui-bg-green\" lay-percent="+getProgress_daban(noCompleteList[i].state,noCompleteList[i].currentNum)+"></div>\n" +
                                    "                </div>\n" +
                                    "            </td>\n" +
                                    "        </tr>");
                            }
                            element.render('progress');
                        }
                    }
                });
            });
            
        });
    });

function getAgree_daban(agree) {
    if(agree=='1'){
        return "同意";
    }else if(agree=='2'){
        return "不同意";
    }else{
        return "";
    }
}
function getProgress_daban(state,currentNum) {
    try {
        if (state == '1') {
            return "100%";
        } else {
            var i;
            if (currentNum == undefined || currentNum == '') {
                i = 0;
            } else {
                if(currentNum==10 || currentNum=='10'){
                    i=9;
                }else{
                    i = parseInt(currentNum);
                }

            }
            return i*10+"%";
        }
    }catch (e){
        return "0%";
    }
}
</script>
</html>
