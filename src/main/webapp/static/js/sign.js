$(function () {
    $('#editor_bgImg').height($(window).height());

    $("#codebtn").click(function () {
        if(!/^1[3456789]\d{9}$/.test($("#phone").val())){
            mui.toast("手机号格式错误")
        }else{
            $.post("/util/getCode",{phone:$("#phone").val()},function (data) {
                if(data.msg=='success'){
                    mui.toast("发送成功")
                    $("#codebtn").attr("disabled","disabled");
                    var count=90;
                    var time=setInterval(function () {
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

    $("#sign").click(function () {
        var region=$("#region").val();
        var school=$("#school").val();
        var name=$("#name").val();
        var phone=$("#phone").val();
        var password=$("#password").val();
        var code=$("#code").val();
          if(checkRegister(region,school,name,phone,password,code)){
              mui.showLoading("正在提交...","div");
              $.post("/util/getPasswprdKey",{},function (data) {
                  if (data != '0') {
                      //对密码进行加密
                      var encrypt = new JSEncrypt();
                      encrypt.setPublicKey(data);
                      var encrypt_password = encrypt.encrypt(password);
                      $.ajax({
                          type: "POST",
                          url: "/sign/register",
                          timeout:60000,
                          data:{school:school,name:name,phone:phone,password:encrypt_password,code:code},
                          success: function (data) {
                              mui.hideLoading();
                              if(data.msg=='success'){
                                  mui.alert("注册成功",function () {
                                      window.location.href="/static/sign/signSelect.jsp";
                                  })
                              }else{
                                  alert(data.result)
                              }
                          },
                          error: function (e, jqxhr, settings, exception) {
                              mui.hideLoading();
                              mui.toast("服务器响应失败");
                          }
                      });
                  }else{
                      mui.hideLoading();
                      alert("提交失败，请尝试重新提交");
                  }
              });

          }
    });
});
function getSchools(obj,schools) {
    mui.showLoading("获取学校列表","div");
    $("#school").val("");
    $.post("/sign/getSchools",{region:obj},function (data) {
        mui.hideLoading();
        for(var i=0;i<data.length;i++){
            var temp={};
            temp["value"]=data[i].name;
            temp["text"]=data[i].name;
            schools.push(temp);
        }
    });
}

function checkPwd(obj) {
    var mythis=$(obj);
    var value=mythis.val();
    mythis.val(value.replace(/[\W]/g,''));
}

function checkRegister(region,school,name,phone,password,code) {
    if(region==''){
        mui.toast("所属区未选择");
        return false;
    }else if(school==''){
        mui.toast("学校未选择");
        return false;
    }else if(name==''){
        mui.toast("姓名未填写");
        return false;
    }else if(phone==''){
        mui.toast("手机号未填写");
        return false;
    }else if(password==''){
        mui.toast("密码未填写");
        return false;
    }else if(code==''){
        mui.toast("验证码未填写");
        return false;
    }else{
        return true;
    }

}
