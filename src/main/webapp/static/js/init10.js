

$("#tijiao10").click(function () {
    var data={},message=[];
try{

    for(var i=1;i<=31;i++){
        data["qace"+i]=$("[name=qace"+i+"]:checked").val()==undefined ? "" : $("[name=qace"+i+"]:checked").val();
    }
    for(var j=1;j<=31;j++){
        if(data["qace"+j]==''){
            message.push(j);
            break;
        }
    }

    if(message.length==0){
        // console.log(JSON.stringify(data));
        sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:10},function (data) {
            if(data.msg=='success'){
                window.location.href="/util/goIndex";
            }else if(data.msg=='complete'){
                window.location.href="/util/complete";
            }
            else{
                mui.alert(data.result);
            }
        })
    }else {
        for(var m=0;m<message.length;m++){
            document.getElementById("div"+message[m]).scrollIntoView();
            $("#div"+message[m]).css("border", "2px solid red");
            mui.toast("红色方框中的题目未作答",{duration: 3000})
            break;
        }
    }
}
catch (err){
    mui.alert("<span style='color: red;font-size: 15px;'>页面脚本发生错误：</span>"+err);
    $.post("/util/writeJSError",{err:err+""},function () {});
}


});