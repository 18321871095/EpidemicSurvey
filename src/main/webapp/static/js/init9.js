
for(var i=1;i<=23;i++){
    $("#range"+i).ionRangeSlider(getParam($("#gem"+i)));
}

function getParam(o) {
    return  obj= {
        min: -4,
        max: 4,
        from: 0,
        step: 1,
        hide_min_max: true,
        grid: true,
        postfix: '',
        grid_num: 8,
        onFinish: function (data) {
            //console.log(data.from_pretty)
            o.val(data.from_pretty);
          //  console.log(o.val())
        }
    }
}


$("#tijiao9").click(function () {
    var data={};
try{
    for(var j=0;j<=23;j++){
        data["gem"+j]=$("#gem"+j).val();
    }
     //console.log(JSON.stringify(data));
    sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:9},function (data) {
        if(data.msg=='success'){
            window.location.href="/util/goIndex";
        }else if(data.msg=='complete'){
            window.location.href="/util/complete";
        }
        else{
            mui.alert(data.result);
        }
    })

}
catch (err){
    mui.alert("<span style='color: red;font-size: 15px;'>页面脚本发生错误：</span>"+err);
    $.post("/util/writeJSError",{err:err+""},function () {});
}


});