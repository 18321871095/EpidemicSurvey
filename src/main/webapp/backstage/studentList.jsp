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
<style>

    /* 使得下拉框与单元格刚好合适 */
  a:hover{
      color: red;
      cursor: pointer;
  }

</style>
</head>
<body>


<div style="padding: 10px 10px">
    <button style="width: 12%;" id="tijiao"  class="layui-btn layui-btn-sm ">
        <i class="layui-icon">&#xe605;</i>提交</button>
    <button style="width: 12%;" id="baocun"
            class="layui-btn layui-btn-warm layui-btn-sm "><i class="layui-icon">&#xe605;</i>保存</button>
    <button style="width: 12%;" id="xaizaiinfo1"
            class="layui-btn layui-btn-normal layui-btn-sm "><i class="layui-icon">&#xe601;</i>下载小班名单</button>
<c:if test="${sessionScope.LoginInfo.getAdminPss()==1}">
    <button style="width: 12%;" id="download" class="layui-btn layui-btn-sm">
        <i class="layui-icon">&#xe601;</i>下载小班问卷码</button>
    <button style="width: 12%;" id="download_file" class="layui-btn layui-btn-sm">
        <i class="layui-icon">&#xe601;</i>下载小班调研说明</button>
</c:if>
<c:if test="${sessionScope.LoginInfo.getAdminPss()!=1}">
    <button style="width: 12%;" id="download" class="layui-btn layui-btn-disabled layui-btn-sm">
        <i class="layui-icon">&#xe601;</i>下载小班问卷码</button>
    <button style="width: 12%;" id="download_file" class="layui-btn layui-btn-disabled layui-btn-sm" disabled="disabled">
        <i class="layui-icon">&#xe601;</i>下载小班调研说明</button>
</c:if>
    <span style="font-size: 20px;color: red;float: right;">小班在园人数：<span id="zaiyuan"></span></span>
</div>
<%--565--%>
<div id="mydiv" style="padding: 0px 10px;overflow-y:auto;" class="layui-form">
    <table style="margin: 0;" class="layui-table">
        <thead>
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>生日</th>
            <th>班级</th>
           <%-- <th>证件类型</th>
            <th>证件号</th>--%>
         <%--   <th>国籍</th>
            <th>民族</th>
            <th>户籍</th>--%>
            <th>在园状态</th>
        </tr>
        </thead>
        <tbody id="studentBody">
        </tbody>
    </table>
</div>

<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
</body>
<script>
    var my_this;
    var opean_index;
    var layer;
    var zaiyuan=0;
    $(function () {
       // console.log(document.body.clientHeight)// 554 621     722  810  1.12
        var myheight=document.body.clientHeight;
        $("#mydiv").css("height",(myheight/1.12)+"px");
        layui.use(['layer','form','table'], function(){
            layer = layui.layer,form=layui.form,table=layui.table;
            var confirmNum=0;
            var index1=layer.load(2,{offset:'200px'});

            $.ajax({
                type: "POST",
                url: "/backstage/getStudentList",
                timeout:15000,
                data:{type:'1'},
                success: function (data) {
                    layer.close(index1);
                    if(data.msg=='success') {
                        $("#studentBody").empty();
                        var data = data.result;
                        for (var i = 0; i < data.length; i++) {
                            var temp="";
                            var mybeishu="";
                            if(data[i].status=='1'){
                                zaiyuan++;
                                temp= "<input lay-filter='myswitch' checked type=\"checkbox\" name=\"switch\" lay-skin=\"switch\" lay-text=\"是|否\">";
                            }else{
                                temp= "<input lay-filter='myswitch' type=\"checkbox\" name=\"switch\" lay-skin=\"switch\" lay-text=\"是|否\">";
                            }
                            $("#studentBody").append("<tr>" +
                                "<td>" + data[i].name + "</td>" +
                                "<td>" + data[i].sex + "</td>" +
                                "<td>" + data[i].birthday + "</td>" +
                                "<td>" +"(现)"+ data[i].banji + "</td>" +
                              /*  "<td>" + data[i].certificateType + "</td>" +
                                "<td>" + data[i].certificate + "</td>" +*/
                              /*  "<td>" + data[i].nation + "</td>" +
                                "<td>" + data[i].minzu + "</td>" +
                                "<td>" + data[i].huji + "</td>" +*/
                                "<td>" +temp+ "</td>" +
                                "<input type='hidden' value=" + data[i].id + " > " +
                                "<input type='hidden' value=" + data[i].status + " > " +
                                "</tr>");
                            form.render();
                            $("#zaiyuan").text(zaiyuan);
                        }
                    }
                    else {
                        layer.alert(data.result,{offset:'200px'})
                    }
                },
                error: function (e, jqxhr, settings, exception) {
                    layer.close(index1);
                    if(jqxhr=='timeout'){
                        alert("请求超时，请重新尝试")
                    }else if(jqxhr=='error'){
                        alert("服务器响应失败，稍后重试")
                    }else{
                        alert("未知错误")
                    }
                }
            });

            //提交
            $("#tijiao").click(function () {
                layer.confirm('确认提交？提交之后就无法再次修改保存了。', {icon: 3, title:'提示',offset: '200px'}, function(index){
                    //do something
                    var index1=layer.load(2,{offset:'200px'});
                    var data_1_tijiao=[],data_2_tijiao=[],data_3_tijiao=[],data_4_tijiao=[],data_5_tijiao=[];
                    $("#studentBody").find("tr").each(function () {
                        var value=$(this).find("input[type='hidden']").eq(1).val();
                        var mythis=$(this);
                        if(value=='1'){
                            data_1_tijiao.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else if(value=='2'){
                            data_2_tijiao.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else if(value=='3'){
                            data_3_tijiao.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else if(value=='4'){
                            data_4_tijiao.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else{
                            data_5_tijiao.push(mythis.find("input[type='hidden']").eq(0).val());
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: "/backstage/confirmStudent",
                        timeout:15000,
                        data:{data1:data_1_tijiao,data2:data_2_tijiao,data3:data_3_tijiao,data4:data_4_tijiao,data5:data_5_tijiao,type:1,type1:1},
                        success: function (data) {
                           layer.close(index1);
                            layer.close(index);
                            if(data.msg=='success'){
                                layer.msg("提交成功",{offset:'200px'});
                            }
                            else{
                                layer.alert(data.result,{offset:'200px'});
                            }
                        },
                        error: function (e, jqxhr, settings, exception) {
                            layer.close(index1);
                            layer.close(index);
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

            //保存
            $("#baocun").click(function () {
                layer.confirm('确认保存？', {icon: 3, title:'提示',offset: '200px'}, function(index){
                    //do something
                    var index1=layer.load(2,{offset:'200px'});
                    var data_1=[],data_2=[],data_3=[],data_4=[],data_5=[];
                    $("#studentBody").find("tr").each(function () {
                        var value=$(this).find("input[type='hidden']").eq(1).val();
                        var mythis=$(this);
                        if(value=='1'){
                            data_1.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else if(value=='2'){
                            data_2.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else if(value=='3'){
                            data_3.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else if(value=='4'){
                            data_4.push(mythis.find("input[type='hidden']").eq(0).val());
                        }else{
                            data_5.push(mythis.find("input[type='hidden']").eq(0).val());
                        }
                    });


                   $.ajax({
                        type: "POST",
                        url: "/backstage/confirmStudent",
                       timeout:15000,
                        data:{data1:data_1,data2:data_2,data3:data_3,data4:data_4,data5:data_5,type:0,type1:1},
                        success: function (data) {
                            layer.close(index1);
                            layer.close(index);
                            if(data.msg=='success'){
                                layer.msg("保存成功",{offset:'200px'});
                            }
                            else{
                                layer.alert(data.result,{offset:'200px'});
                            }
                        },
                        error: function (e, jqxhr, settings, exception) {
                            layer.close(index1);
                            layer.close(index);
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

            //下载问卷码
            $("#download").click(function () {
                var index = layer.load(2,{offset:'200px'});
                $.post("/backstage/downloadToken",{type:1},function (data) {
                    layer.close(index);
                    if(data.msg=='success'){
                        window.location.href="/backstage/downloadToken1?type=1";
                    }else {
                        layer.alert(data.result,{offset:'200px'});
                    }
                });
            });

            //下载学生名单
            $("#xaizaiinfo1").click(function () {
                var index = layer.load(2,{offset:'200px'});
                $.post("/backstage/downloadStudetInfo",{type:1},function (data) {
                    layer.close(index);
                    if(data.msg=='success'){
                        window.location.href="/backstage/downloadStudetInfo1?type=1";
                    }else {
                        layer.alert(data.result,{offset:'200px'});
                    }
                });
            });

            //下载调研说明
            $("#download_file").click(function () {
                window.location.href="/backstage/downloadFiles?type=1";
            });

            form.on('switch(myswitch)', function(data){
              /*  console.log(data.elem); //得到checkbox原始DOM对象
                console.log(data.elem.checked); //开关是否开启，true或者false
                console.log(data.value); //开关value值，也可以通过data.elem.value得到
                console.log(data.othis); //得到美化后的DOM对象*/
                my_this=$(this);
                if(data.elem.checked){
                    //console.log( $(this).parents("tr").find("input[type='hidden']").eq(0).val())
                    $(this).parents("tr").find("input[type='hidden']").eq(1).val("1");
                    zaiyuan++;
                    $("#zaiyuan").text(zaiyuan);
                }else{
                    opean_index = layer.open({
                        title:'请选择不在园原因',
                        closeBtn :0,//不显示关闭按钮
                        type: 1,
                        content: '<div style="text-align: center;margin-top: 20px;">' +
                        '<select style="height: 30px;width: 50%;">' +
                        '<option value="2">转园</option>'+
                        '<option value="3">退学</option>'+
                    /*    '<option value="4">请假</option>'+*/
                        '<option value="5">死亡</option>'+
                        '</select>' +
                        '</div>' +
                        '<div style="text-align: center;margin-top: 20px;">' +
                        '<button onclick="queding_status(this)" class="layui-btn layui-btn-sm" style="width: 35%;">确定</button>' +
                        '</div>',
                        area: ['300px', '200px'],
                        offset:'auto'
                    });
                }
            });





        });

    });
    function queding_status(obj) {
        var mythis=$(obj);
        var value=mythis.parent("div").prev().find("select").val();
        console.log(value)
        my_this.parents("tr").find("input[type='hidden']").eq(1).val(value);
        layer.close(opean_index);
        zaiyuan--;
        $("#zaiyuan").text(zaiyuan);
    }
    function getNum() {
        var confirmNum=0;
        $("#studentBody").find("dd[class='layui-this']").each(function () {
            if($(this).attr('lay-value')=='1'){
                confirmNum++;
            }
        });
        $("#confirmNum").text(confirmNum);
        return confirmNum;
    }
</script>

</html>
