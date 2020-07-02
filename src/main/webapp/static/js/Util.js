function sendRequest(message,time,url,data,callback) {
    mui.showLoading(message,"div");
    $.ajax({
        type: "POST",
        url: url,
        data:data,
        timeout:time,
        success: function (data) {
            mui.hideLoading();
            if(data=='noLogin'){
                mui.alert("登录信息失效，请重新登录",function () {
                    window.location.href="/frontEnd/login.jsp";
                })
            }else if(data=='isNull'){
                mui.alert("服务器发生错误，获取对象为空")
            }
            else{
                callback(data);
            }
        },
        error: function (e, jqxhr, settings, exception) {
            mui.hideLoading();
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


function back_listener() {
    if (window.history && window.history.pushState) {
        $(window).on('popstate', function () {
            window.history.pushState('forward', null, '#');
            window.history.forward(1);
            mui.confirm("<span style='color: red;font-size: 18px;'>是否退出问卷填写？</span>", '提示', ['退出', '继续'], function(e) {
                if (e.index == 1) {
                } else {
                    //确定
                   window.location.href="/survey/signout";
                }
            });
        });
    }

    window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
    window.history.forward(1);
}


function hideBorder(obj) {
    var mythis=$(obj);
    mythis.css("border","none");
}

function hideBorder1(obj) {
    var mythis=$(obj);
    mythis.css("border","grey");
}

