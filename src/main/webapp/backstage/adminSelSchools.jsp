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
<div style="padding: 10px 10px">
    <input id="schoolName" placeholder="学校名称模糊查询" style="height: 28px"/>&nbsp;&nbsp;
    <button id="sousuo" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button>
    <button style="width: 12%;" id="download" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">&#xe601;</i>下载未签到名单</button>
    <button style="width: 12%;" id="download1" class="layui-btn layui-btn-sm layui-btn-warm"><i class="layui-icon">&#xe601;</i>下载学校基本信息</button>

</div>
<div id="mydiv_school" style="padding: 0px 10px;height: 550px;overflow-y:auto;/*border: 1px solid;*/" class="layui-form">
    <table class="layui-table" style="margin: 0;">
        <thead>
        <tr>
            <th style='text-align: center;'>学校编号</th>
            <th style='text-align: center;'>学校名称</th>
            <th style='text-align: center;'>区域</th>
            <th style='text-align: center;'>签到人</th>
            <th style='text-align: center;'>账号</th>
            <th style='text-align: center;'>密码</th>
            <th style='text-align: center;'>小班提交</th>
            <th style='text-align: center;'>大班提交</th>
            <th style='text-align: center;'>管理员确认</th>
            <th style='text-align: center;'>操作</th>
        </tr>
        </thead>
        <tbody id="schoolsBody">
        </tbody>
    </table>
</div>

<script src="${ctx}/static/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script>
    var layer1;var form;

    $(function () {
        var myheight=document.body.clientHeight;
        $("#mydiv_school").css("height",(myheight/1.12)+"px");
        layui.use(['layer','form'], function(){
            layer1 = layui.layer;
            form=layui.form;
            var index1=layer1.load(2,{offset:"200px"});

            $.ajax({
                type: "POST",
                url: "/backstage/adminGetSchools",
                timeout:10000,
                success: function (data) {
                    layer1.close(index1);
                    if(data.msg=='success'){
                        $("#schoolsBody").empty();
                        var data=data.result;
                        for(var i=0;i<data.length;i++){
                            var username=data[i].username==null?"":data[i].username;
                            var account=data[i].account==null?"":data[i].account;
                            var qiandao="";
                            var tijiao="";
                            var shenhe="";
                            var caozuo="";
                            var mima=data[i].pwd==null?"":data[i].pwd;
                            if(data[i].adminPss=='1'){
                                shenhe="<img src='/static/images/schoolPass.png' width=\"30px\" height=\"30px\">&nbsp;";
                                caozuo="<button   disabled=\"disabled\" class=\"layui-btn layui-btn-sm layui-btn-disabled\">通过</button>";
                            }else{
                                shenhe="<span style='color: red;'>未通过</span>&nbsp;";
                                caozuo="<button name='pass'   class=\"layui-btn layui-btn-sm layui-btn-normal\">通过</button>";

                            }

                            $("#schoolsBody").append("<tr>" +
                                "<td style='text-align: center;'>"+data[i].id+"</td>"+
                                "<td style='text-align: center;'>"+data[i].name+"</td>" +
                                "<td style='text-align: center;'>"+data[i].district+"</td>" +
                                "<td style='text-align: center;'>"+username+"</td>" +
                                "<td style='text-align: center;'>"+account+"</td>" +
                                "<td style='text-align: center;'>"+mima+"</td>" +getStatus(data[i].biaoshi,data[i].status,data[i].status_daban)+
                                "<td style='text-align: center;'>"+shenhe+"</td>" +
                                "<td style='text-align: center;'>"+caozuo+"</td>" +
                                "</tr>");
                        }
                        form.render();
                    }else{
                        layer1.alert(data.result,{offset:'200px'});
                    }
                },
                error: function (e, jqxhr, settings, exception) {
                    layer1.close(index1);
                    if(jqxhr=='timeout'){
                        alert("请求超时，请重新尝试")
                    }else if(jqxhr=='error'){
                        alert("服务器响应失败，稍后重试")
                    }else{
                        alert("未知错误")
                    }
                }
            });

            $(document).on("click","${'[name=\'pass\']'}",function(){
                var index11=layer1.load(2,{offset:"200px"});
                var id=$(this).parents("tr").find("td").eq(0).text();
                var mythis=$(this);
                $.ajax({
                    type: "POST",
                    url: "/backstage/adminPassSchool",
                    data:{id:id},
                    timeout:10000,
                    success: function (data) {
                        layer1.close(index11);
                        if(data.msg=='success'){
                            layer1.msg("成功",{offset:'200px'});
                            mythis.parents("tr").find("td").eq(8).empty().append("<img src='/static/images/schoolPass.png' width=\"30px\" height=\"30px\">&nbsp;");
                            mythis.attr("disabled","disabled").addClass("layui-btn-disabled");
                        }
                        else {
                            layer1.alert(data.result,{offset:'200px'});
                        }
                    },
                    error: function (e, jqxhr, settings, exception) {
                        layer1.close(index11);
                        if(jqxhr=='timeout'){
                            alert("请求超时，请重新尝试")
                        }else if(jqxhr=='error'){
                            alert("服务器响应失败，稍后重试")
                        }else{
                            alert("未知错误")
                        }
                    }
                });
            });

            $("#download").click(function (){
                var index1=layer1.load(2,{offset:"200px"});
                $.ajax({
                    type: "POST",
                    url: "/backstage/downloadWeiQianDao",
                    success: function (data) {
                        layer1.close(index1);
                        if(data.msg=='success'){
                            window.location.href="/backstage/downloadWeiQianDao1";
                        }else if(data.msg=='001'){
                            layer1.alert("权限不够",{offset:'200px'});
                        }
                        else {
                            layer1.alert("获取信息出错",{offset:'200px'});
                        }
                    },
                    error: function (e, jqxhr, settings, exception) {
                        layer1.close(index1);
                        layer1.alert("服务器响应失败",{offset:'200px'});
                    }
                });
            });

            $("#download1").click(function (){
                var index1=layer1.load(2,{offset:"200px"});
                $.ajax({
                    type: "POST",
                    url: "/backstage/downloadSchoolsInfo",
                    success: function (data) {
                        layer1.close(index1);
                        if(data.msg=='success'){
                            window.location.href="/backstage/downloadSchoolsInfo1";
                        }else if(data.msg=='001'){
                            layer1.alert("权限不够",{offset:'200px'});
                        }
                        else {
                            layer1.alert("获取信息出错",{offset:'200px'});
                        }
                    },
                    error: function (e, jqxhr, settings, exception) {
                        layer1.close(index1);
                        layer1.alert("服务器响应失败",{offset:'200px'});
                    }
                });
            });

            $("#sousuo").click(function () {
                var name=$("#schoolName").val();
                var index2=layer1.load(2,{offset:"200px"});
                $.ajax({
                    type: "POST",
                    url: "/backstage/adminGetSchoolsByName",
                    data:{name:name},
                    timeout:10000,
                    success: function (data) {
                        layer1.close(index2);
                        if(data.msg=='success'){
                            $("#schoolsBody").empty();
                            var data=data.result;
                            for(var i=0;i<data.length;i++){
                                var username=data[i].username==null?"":data[i].username;
                                var account=data[i].account==null?"":data[i].account;
                                var qiandao="";
                                var tijiao="";
                                var shenhe="";
                                var caozuo="";
                                var mima=data[i].pwd==null?"":data[i].pwd;

                                if(data[i].adminPss=='1'){
                                    shenhe="<img src='/static/images/schoolPass.png' width=\"30px\" height=\"30px\">&nbsp;";
                                    caozuo="<button   disabled=\"disabled\" class=\"layui-btn layui-btn-sm layui-btn-disabled\">通过</button>";
                                }else{
                                    shenhe="<span style='color: red;'>未通过</span>&nbsp;";
                                    caozuo="<button name='pass'   class=\"layui-btn layui-btn-sm layui-btn-normal\">通过</button>";
                                   /* if(data[i].status=='0'){
                                        caozuo="<button   disabled=\"disabled\" class=\"layui-btn layui-btn-sm layui-btn-disabled\">通过</button>";
                                    }else{
                                        caozuo="<button name='pass'   class=\"layui-btn layui-btn-sm layui-btn-normal\">通过</button>";
                                    }*/

                                }

                                $("#schoolsBody").append("<tr>" +
                                    "<td style='text-align: center;'>"+data[i].id+"</td>"+
                                    "<td style='text-align: center;'>"+data[i].name+"</td>" +
                                    "<td style='text-align: center;'>"+data[i].district+"</td>" +
                                    "<td style='text-align: center;'>"+username+"</td>" +
                                    "<td style='text-align: center;'>"+account+"</td>" +
                                    "<td style='text-align: center;'>"+mima+"</td>" +getStatus(data[i].biaoshi,data[i].status,data[i].status_daban)+
                                    "<td style='text-align: center;'>"+shenhe+"</td>" +
                                    "<td style='text-align: center;'>"+caozuo+"</td>" +
                                    "</tr>");
                            }
                            form.render();
                        }else {
                            layer1.alert(data.result,{offset:'200px'});
                        }
                    },
                    error: function (e, jqxhr, settings, exception) {
                        layer1.close(index2);
                        if(jqxhr=='timeout'){
                            alert("请求超时，请重新尝试")
                        }else if(jqxhr=='error'){
                            alert("服务器响应失败，稍后重试")
                        }else{
                            alert("未知错误")
                        }
                    }
                });
            });

        });
    });


    function showDetail(obj) {
        var mythis=$(obj);
        console.log(mythis.text());
        layer1.open({
            type: 2,
            area: ['1200px', '550px'],
            offset:'10px',
            content: '/static/backstage/adminSelStudentList.jsp?schoolid='+mythis.parents("tr").find("td").eq(0).text()
        });
    }

    function confirm(obj) {
        var mythis = $(obj);
        layer1.confirm('是否确定?', {icon: 3, title: '提示', offset: '150px'}, function (index) {
            //do something
            var index1 = layer1.load(0, {offset: '300px'});
            $.post("/backstage/updateAdminVerifyStatus", {id: mythis.parents("tr").find("td").eq(0).text()}, function (data) {
                layer1.close(index1);
                if (data.msg == 'success') {
                    mythis.addClass("layui-btn-disabled").attr("disabled", "disabled");
                    layer1.msg("成功", {offset: '300px'});
                } else {
                    layer1.msg("学校还没提交确认名单", {offset: '300px'});
                }
            });
            layer1.close(index);
        });
    }

    function getStatus(biaoshi,status,status_daban) {
        if(biaoshi=='1'){
            if(status=='1'){
                return   "<td style='text-align: center;'>"+"<span style='color: blue'>已提交</span>"+"</td>" +
                    "<td style='text-align: center;'>"+"<span>不需要</span>"+"</td>" ;
            }else{
                return   "<td style='text-align: center;'>"+"<span style='color: red'>未提交</span>"+"</td>" +
                    "<td style='text-align: center;'>"+"<span>不需要</span>"+"</td>" ;
            }
        }else if(biaoshi=='2'){
            if(status_daban=='1'){
                return      "<td style='text-align: center;'>"+"<span>不需要</span>"+"</td>"+
                    "<td style='text-align: center;'>"+"<span style='color: blue'>已提交</span>"+"</td>" ;
            }else{
                return      "<td style='text-align: center;'>"+"<span>不需要</span>"+"</td>"+
                    "<td style='text-align: center;'>"+"<span style='color: red'>未提交</span>"+"</td>" ;
            }
        }else {
            var html="";
            if(status=='1'){
                html+="<td style='text-align: center;'>"+"<span style='color: blue'>已提交</span>"+"</td>" ;
            }else{
                html+="<td style='text-align: center;'>"+"<span style='color: red'>未提交</span>"+"</td>" ;
            }
            if(status_daban=='1'){
                html+="<td style='text-align: center;'>"+"<span style='color: blue'>已提交</span>"+"</td>" ;
            }else{
                html+="<td style='text-align: center;'>"+"<span style='color: red'>未提交</span>"+"</td>" ;
            }
            return html;
        }
    }


</script>
</body>
</html>
