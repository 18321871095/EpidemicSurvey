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
        /* 防止下拉框的下拉列表被隐藏---必须设置--- */
   /*     .layui-table-cell {            overflow: visible !important;         }*/
        /* 使得下拉框与单元格刚好合适 */
        td .layui-form-select{
            margin-top: -10px;
            margin-left: -15px;
            margin-right: -15px;
        }
    </style>
</head>
<body>


<div style="padding: 10px 10px;">
    <%--<button id="baocun" class="layui-btn"><i class="layui-icon">&#xe605;</i>确认</button>--%>
    <input id="selName" placeholder="姓名模糊查询" style="height: 28px"/>&nbsp;&nbsp;
    <%--<button id="reserch" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button>--%>
        &nbsp;&nbsp;
        <input id="schoolName1" placeholder="学校名称模糊查询" style="height: 28px"/>&nbsp;&nbsp;
        &nbsp;&nbsp;
        <input id="token1" placeholder="问卷码" style="height: 28px"/>&nbsp;&nbsp;
        <input id="phone1" placeholder="手机号" style="height: 28px"/>&nbsp;&nbsp;
        <button id="sousuo1" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i>搜索</button>
  <%--  <button id="addStu" class="layui-btn  layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe654;</i>添加</button>--%>
</div>

<div style="padding: 0px 10px;" class="layui-form">

    <table class="layui-hide" id="demo" lay-filter="demo" style="margin-top: 0px;"></table>

</div>




<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script type="text/html" id="selectSex" >
    <select>
        {{#  if(d.sex == '男'){ }}
        <option value="男">男</option>
        <option value="女">女</option>
        {{#  } else { }}
           <option value="男">男</option>
           <option value="女" selected>女</option>
        {{#  } }}
    </select>
</script>
<script type="text/html" id="status" >
    <select>
        {{#  if(d.status == '1'){ }}
        <option value="1" selected>在园</option>
        <option value="0">离园</option>
        <option value="2">转园</option>
        <option value="3">退学</option>
        <option value="4">请假</option>
        <option value="5">死亡</option>
        {{#  } else if (d.status == '0'){ }}
        <option value="1">在园</option>
        <option value="0" selected>离园</option>
        <option value="2">转园</option>
        <option value="3">退学</option>
        <option value="4">请假</option>
        <option value="5">死亡</option>
        {{#  } else if (d.status == '2'){ }}
        <option value="1">在园</option>
        <option value="0">离园</option>
        <option value="2" selected>转园</option>
        <option value="3">退学</option>
        <option value="4">请假</option>
        <option value="5">死亡</option>
        {{#  } else if (d.status == '3'){ }}
        <option value="1">在园</option>
        <option value="0">离园</option>
        <option value="2">转园</option>
        <option value="3" selected>退学</option>
        <option value="4">请假</option>
        <option value="5">死亡</option>
        {{#  } else if (d.status == '4'){ }}
        <option value="1">在园</option>
        <option value="0">离园</option>
        <option value="2">转园</option>
        <option value="3">退学</option>
        <option value="4" selected>请假</option>
        <option value="5">死亡</option>
        {{#  } else if (d.status == '5'){ }}
        <option value="1">在园</option>
        <option value="0">离园</option>
        <option value="2">转园</option>
        <option value="3">退学</option>
        <option value="4">请假</option>
        <option value="5" selected>死亡</option>
        {{#  } }}
    </select>
</script>
<script type="text/html" id="selectTime">
    <div class="getBirthday">{{d.birthday}}</div>
</script>
<script>
    var layerCRUD;
    $(function () {
        var myheight=document.body.clientHeight*0.886;
        layui.use(['layer','form','table','laydate'], function(){
            layerCRUD = layui.layer;
            var form=layui.form,table=layui.table,laydate=layui.laydate;
                    var index=layerCRUD.load(2,{offset:'200px'});
                        table.render({
                            elem: '#demo',
                            url: '/backstage/getStudentsByBeizhu'
                            ,height:myheight
                            ,cols: [[ //标题栏
                                {field: 'schoolname', title: '学校', minWidth: 200 },
                                {field: 'token', title: '问卷码', minWidth: 80 },
                                {field: 'phone', title: '手机号', minWidth: 120,edit:'text' },
                                {field: 'name', title: '姓名', minWidth: 80 ,	edit:'text'}
                                ,{field: 'sex', title: '性别', minWidth: 80,templet:'#selectSex'}
                                ,{field: 'birthday', title: '生日', minWidth: 150,templet:'#selectTime'}
                                ,{field: 'banji', title: '班级', minWidth: 100}
                                ,{field: 'certificateType', title: '证件类型', minWidth: 150,edit:'text'}
                                ,{field: 'certificate', title: '证件号', minWidth: 200,	edit:'text'}
                                ,{field: 'nation', title: '国籍', minWidth: 80,	edit:'text'}
                                ,{field: 'minzu', title: '民族', minWidth: 80,	edit:'text'}
                                ,{field: 'huji', title: '户籍', minWidth: 80,	edit:'text'}
                                ,{field: 'status', title: '在园状态', minWidth: 80,templet:'#status'}
                                ,{field: 'oldphone',hide:true}
                                ,{field: '', title: '操作', minWidth: 80,templet:'<div>' +
                                '<button name="xiugai" onclick="xiugai(this)" class="layui-btn layui-btn-normal layui-btn-sm">' +
                                '修改</button></div><div>'}
                            ]],
                            page:true,
                            done: function(res, curr, count){
                                layerCRUD.close(index);
                                $("#demo").next("div").find("table").find("td[data-field='sex']").each(function () {
                                    $(this).find("div").eq(0).css("overflow","visible");
                                });
                                $("#demo").next("div").find("table").find("td[data-field='status']").each(function () {
                                    $(this).find("div").eq(0).css("overflow","visible");
                                });
                                //在渲染元素后为每个添加日期选择器
                                lay('.getBirthday').each(function(){
                                    laydate.render({
                                        elem: this
                                        ,trigger: 'click'
                                    });
                                });
                            }
                        });

            $("#sousuo1").click(function () {
                var index1=layerCRUD.load(2,{offset:'200px'});
                var name=$("#selName").val();
                var schoolName=$("#schoolName1").val();
                var phone=$("#phone1").val();
                var token=$("#token1").val();
                    table.render({
                        elem: '#demo',
                        url: '/backstage/searchChildBySchool'
                        ,height:myheight
                        ,where:{name:name,schoolName:schoolName,phone:phone,token:token}
                        ,cols: [[ //标题栏
                            {field: 'schoolname', title: '学校', minWidth: 200 },
                            {field: 'token', title: '问卷码', minWidth: 80, },
                            {field: 'phone', title: '手机号', minWidth: 120,edit:'text' },
                            {field: 'name', title: '姓名', minWidth: 80 ,	edit:'text'}
                            ,{field: 'sex', title: '性别', minWidth: 80,templet:'#selectSex'}
                            ,{field: 'birthday', title: '生日', minWidth: 150,templet:'#selectTime'}
                            ,{field: 'banji', title: '班级', minWidth: 100,	edit:'text'}
                            ,{field: 'certificateType', title: '证件类型', minWidth: 150,edit:'text'}
                            ,{field: 'certificate', title: '证件号', minWidth: 200,	edit:'text'}
                            ,{field: 'nation', title: '国籍', minWidth: 80,	edit:'text'}
                            ,{field: 'minzu', title: '民族', minWidth: 80,	edit:'text'}
                            ,{field: 'huji', title: '户籍', minWidth: 80,	edit:'text'}
                            ,{field: 'status', title: '在园状态', minWidth: 80,templet:'#status'}
                            ,{field: 'oldphone',hide:true}
                            ,{field: '', title: '操作', minWidth: 80,templet:'<div>' +
                            '<button name="xiugai" onclick="xiugai(this)" class="layui-btn layui-btn-normal layui-btn-sm">' +
                            '修改</button></div><div>'}
                        ]],
                        page:true,
                        done: function(res, curr, count){
                            layerCRUD.close(index);
                            layerCRUD.close(index1);
                            $("#demo").next("div").find("table").find("td[data-field='sex']").each(function () {
                                $(this).find("div").eq(0).css("overflow","visible");
                            });
                            $("#demo").next("div").find("table").find("td[data-field='status']").each(function () {
                                $(this).find("div").eq(0).css("overflow","visible");
                            });
                            //在渲染元素后为每个添加日期选择器
                            lay('.getBirthday').each(function(){
                                laydate.render({
                                    elem: this
                                    ,trigger: 'click'
                                });
                            });
                        }
                    });

            });
        });



    });
    function xiugai(obj) {
        var index=layerCRUD.load(0,{offset:'300px'});
        var mythis=$(obj);
        var token=mythis.parents("tr").find("td[data-field='token']").find("div").eq(0).text();
        var phone=mythis.parents("tr").find("td[data-field='phone']").find("div").eq(0).text();
        var oldphone=mythis.parents("tr").find("td[data-field='oldphone']").find("div").eq(0).text();
        var name=mythis.parents("tr").find("td[data-field='name']").find("div").eq(0).text();
        var sex=mythis.parents("tr").find("td[data-field='sex']").find(".layui-this").eq(0).text();
        var birthday=mythis.parents("tr").find("td[data-field='birthday']").find(".getBirthday").eq(0).text();
        var banji=mythis.parents("tr").find("td[data-field='banji']").find("div").eq(0).text();
        var certificateType=mythis.parents("tr").find("td[data-field='certificateType']").find("div").eq(0).text();
        var certificate=mythis.parents("tr").find("td[data-field='certificate']").find("div").eq(0).text();
        var nation=mythis.parents("tr").find("td[data-field='nation']").find("div").eq(0).text();
        var minzu=mythis.parents("tr").find("td[data-field='minzu']").find("div").eq(0).text();
        var huji=mythis.parents("tr").find("td[data-field='huji']").find("div").eq(0).text();
        var status=mythis.parents("tr").find("td[data-field='status']").find(".layui-this").eq(0).attr("lay-value");

        //console.log(token+","+phone+","+oldphone+","+name+","+sex+","+birthday+","+banji+","+certificateType+","+nation+","+minzu+","+huji+","+certificate+","+status)
       $.post("/backstage/updateStudentInfo",{token:token,name:name,banji:banji,sex:sex,birthday:birthday,phone:phone,oldphone:oldphone,
            certificate:certificate,status:status,certificateType:certificateType,minzu:minzu,huji:huji,nation:nation},function (data) {
            layerCRUD.close(index);
            if(data.msg=='success'){
                layerCRUD.msg("成功",{offset:'200px'});
            }else {
                alert(data.result);
               // mythis.parents("tr").find("td[data-field='phone']").find("div").eq(0).text(oldphone);
            }
        });
    }
</script>


</body>

</html>
