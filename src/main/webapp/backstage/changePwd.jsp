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
        .mybtn{
            width: 100px;height: 30px;cursor: pointer;background:transparent;
            border: 1px solid #1ab394;text-align: center;font-weight: bold;
            margin-top: 10px;margin-left: -75px;
        }
        .mybtn:hover{
            background:#1ab394;
            color: #fff;
        }
    </style>
</head>
<body>

<div style="padding: 10px 20px;width: 300px;height: 300px;margin: 0 auto;margin-top: 100px"  >
    <div style="text-align: center;">
        <div style="display: inline-block">
            <input id="mima"  type="password" placeholder="请输入新密码" style="height: 35px" />
        </div>
        <div class="layui-form" style="display: inline-block">
            <input type="checkbox" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="查看|隐藏">
        </div>
        <div style="margin-top: 20px">
            <button id="xiugaimima" class="mybtn">确定</button>
        </div>
    </div>
</div>


<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/jsencrypt.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script>
    $(function () {
        layui.use('form', function() {
            var form = layui.form,layer=layui.layer;
            //监听指定开关
            form.on('switch(switchTest)', function(data){
              if(this.checked){
                    $("#mima").attr("type","text");
              }else{
                  $("#mima").attr("type","password");
              }
            });

            $("#xiugaimima").click(function () {
                    //do something
                  if($("#mima").val()==''){
                      layer.msg("密码为空",{offset:'200px'});
                  }else if($("#mima").val().length>10){
                      layer.msg("密码长度最大为10",{offset:'200px'});
                  }
                  else{
                      layer.confirm('修改成功后需要重新登录，确定修改?', {icon: 3, title:'提示',offset:'200px'}, function(index){
                          $.post("/util/getPasswprdKey",{},function (data) {
                              if (data != '0') {
                                  var encrypt = new JSEncrypt();
                                  encrypt.setPublicKey(data);
                                  var encrypt_password = encrypt.encrypt($("#mima").val());
                                  $.post("/backstage/changePwd",{pwd:encrypt_password},function (data) {
                                      layer.close(index);
                                      if(data.msg=='success'){
                                          parent.window.location.href="/login/login.jsp";
                                      }else {
                                          layer.msg(data.result,{offset:'200px'});
                                      }
                                  })
                              }else{

                              }

                          });
                      });
                  }

            });


        });
    })
</script>


</body>

</html>
