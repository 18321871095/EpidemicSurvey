$(function () {
    layui.use(['layer','form'], function(){
        var layer = layui.layer;
        var form=layui.form;

        $("#submit_btn").click(function () {
            var username=$("#zhanghao").val();
            var password=$("#password").val();
            if(username=='' || password==''){
                layer.msg("请输入用户名或密码")
            }else{
                var index=layer.load(0);
                //获取是公密钥
                $.ajax({
                    type: "POST",
                    url: "/util/getPasswprdKey",
                    data:{},
                    timeout : 10000,
                    success: function (data) {
                        if(data!='0'){
                            //对密码进行加密
                            var encrypt = new JSEncrypt();
                            encrypt.setPublicKey(data);
                            var encrypt_password=encrypt.encrypt(password);
                            $.ajax({
                                type: "POST",
                                url: "/backstage/login",
                                data:{account:username,pwd:encrypt_password},
                                timeout : 10000,
                                success: function (data) {
                                    layer.close(index);
                                    if(data.msg=='success'){
                                        window.location.href="/backstage/backstageMain.jsp";
                                    } else{
                                        layer.alert(data.result,{offset:'200px'});
                                    }
                                },
                                error: function (e, jqxhr, settings, exception) {
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
                        }else {
                            layer.close(index);
                            alert('获取公密钥失败')
                        }
                    },
                    error: function (e, jqxhr, settings, exception) {
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
            }
        });
        var index_1; var time;
        $("#reset_pwd").click(function () {
            index_1=  layer.open({
                type: 1,
                content: '<div id="mydiv" style="margin-top: 20px;" class="layui-form">\n' +
                '    <div class="layui-form-item">\n' +
                '        <label class="layui-form-label">手机号</label>\n' +
                '        <div class="layui-input-block">' +
                '            <input id="phone" type="text" style="width: 48%;" name="title"\n' +
                '                   placeholder="请输入手机号" class="layui-input">' +
                '        </div>\n' +
                '<div class="layui-form-item">\n' +
                '    <label style="padding: 9px 10px;" class="layui-form-label">账号类别</label>\n' +
                '    <div class="layui-input-block">\n' +
                '      <input type="radio" lay-filter="mytypeFilter" name="mytype" value="1" title="学校">\n' +
                '      <input type="radio" lay-filter="mytypeFilter" name="mytype" value="2" title="区教育局">\n' +
                '    </div>\n' +
                '  </div>'+
                '    </div>\n' +
                '    <div class="layui-form-item">\n' +
                '        <label class="layui-form-label">新密码</label>\n' +
                '        <div class="layui-input-block" style="margin-left: 30px;display: inline-block;">\n' +
                '            <input id="pwd"  type="password" style="width: 100%;"' +
                '                   placeholder="请输入新密码" class="layui-input">\n' +
                '        </div>\n' +
                ' <div class="layui-form" style="display: inline-block">\n' +
                '            <input type="checkbox" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="查看|隐藏">\n' +
                '        </div>'+
                '    </div>\n' +
                '    <div class="layui-form-item">\n' +
                '        <label class="layui-form-label">验证码</label>\n' +
                '        <div class="layui-input-block" style="margin-left: 30px;display: inline-block;">\n' +
                '            <input id="code" type="text" style="width: 100%;" name="title"\n' +
                '                   placeholder="请输入验证码" class="layui-input">\n' +
                '        </div>\n' +
                ' <div class="layui-form" style="display: inline-block">\n' +
                '<button id="codebtn" class="layui-btn layui-btn-sm layui-btn-warm">发送验证码</button>'+
                '        </div>'+
                '    </div>\n' +
                '    <div class="layui-form-item" style="text-align: center;">' +
                '<button id="queding"  class="layui-btn layui-btn-sm" style="width: 50%;">确定</button>'+
                '</div>' +
                '</div>',
                area:['600px', '400px'],
                offset:'100px',
                title:'<span style="color: red;font-size: 18px;">重置密码</span>',
                success:function () {
                    var mytype="";
                    form.render();
                    var count=0;

                    form.on('switch(switchTest)', function(data){
                        if(this.checked){
                            document.getElementById("pwd").type="text";
                        }else{
                            document.getElementById("pwd").type="password";
                        }
                    });
                    form.on('radio(mytypeFilter)', function (data) {
                        mytype=data.value;
                    });
                    $("#codebtn").click(function () {
                        var phone=$("#phone").val();
                        if(!/^1[3456789]\d{9}$/.test(phone)){
                            layer.msg("手机号格式错误",{offset:'150px;'});
                        }else{
                            $.post("/util/getCode",{phone:phone},function (data) {
                                if(data.msg=='success'){
                                    layer.msg("发送成功",{offset:'150px;'});
                                    $("#codebtn").attr("disabled","disabled");
                                    var count=90;
                                    time=setInterval(function () {
                                        $("#codebtn").text(count+"s");
                                        count--;
                                        if(count<0){
                                            $("#codebtn").removeAttr("disabled");
                                            $("#codebtn").text("获取验证码");
                                            clearInterval(time);
                                        }
                                    },1000);
                                }else if(data.msg=='fail'){
                                    alert(data.result);
                                }else{
                                    alert("服务器出错，请联系管理员");
                                }
                            });
                        }
                    });

                    $("#queding").click(function () {
                        var mima=$("#pwd").val();
                        if(mima==''){
                            layer.msg("请输入密码",{offset:'150px;'});
                        }else if(mima.length>10){
                            layer.msg("密码最长为10位",{offset:'150px;'});
                        }else if(mytype==''){
                            layer.msg("账号类型没有选择",{offset:'150px;'});
                        }
                        else{
                            var index=layer.load(2,{offset:'150px;'});
                            //获取是公密钥
                            $.post("/util/getPasswprdKey",{},function (data) {
                                if(data!='0'){
                                    //对密码进行加密
                                    var encrypt = new JSEncrypt();
                                    encrypt.setPublicKey(data);
                                    var encrypt_password=encrypt.encrypt(mima);
                                    $.ajax({
                                        type: "POST",
                                        url: "/reset/resetPwd",
                                        data:{pwd:encrypt_password,code:$("#code").val(),type:mytype},
                                        success: function (data) {
                                            layer.close(index);
                                            if(data.msg=='success'){
                                                layer.close(index_1);
                                                layer.msg("重置成功！！！",{offset:'150px'});
                                            }else  if(data.msg=='002'){
                                                layer.alert("请重新获取验证码",{offset:'150px'});
                                            } else if(data.msg=='001'){
                                                layer.alert("验证码错误",{offset:'150px'});
                                            }else if(data.msg=='003'){
                                                layer.alert("该手机号信息不存在",{offset:'150px'});
                                            }else if(data.msg=='004'){
                                                layer.alert("更改失败，请尝试重新提交",{offset:'150px'});
                                            }
                                            else {
                                                layer.alert("服务器出错，请联系管理员",{offset:'150px'});
                                            }
                                        },
                                        error: function (e, jqxhr, settings, exception) {
                                            layer.close(index);
                                            alert(jqxhr)
                                        }
                                    });


                                }else {
                                    alert('获取公密钥失败')
                                }
                            });

                        }
                    });
                },
                cancel:function () {
                    clearInterval(time);
                    console.log('close')
                }
            });
        });
    });

});
