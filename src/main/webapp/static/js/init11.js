
$("#tijiao11").click(function () {
    var data={},message=[];
try{
    $("div[class='mycontent']").each(function () {
        var radioValue="";
        $(this).find("input").each(function () {
            if($(this).is(":checked")){
                radioValue=$(this).val();
                data[$(this).attr("name")]=radioValue;
            }else {
                data[$(this).attr("name")] = radioValue;
            }
        })
    });


    //console.log(JSON.stringify(data));
    var state='1';
    if(state=='1'){
        if(data["who1"]==''){
            message.push("div1");
            state="0";
        }
    }
    if(state=='1'){
        if(data["who2"]==''){
            message.push("div2");
            state="0";
        }
    }
    if(state=='1'){
        if(data["who3"]==''){
            message.push("div3");
            state="0";
        }
    }
    if(state=='1'){
        if(data["who4"]==''){
            message.push("div4");
            state="0";
        }
    }
    if(state=='1'){
        if(data["who5"]==''){
            message.push("div5");
            state="0";
        }
    }

    if(message.length==0){
        // console.log(JSON.stringify(data));
        sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:11},function (data) {
            if(data.msg=='success'){
                window.location.href="/util/goIndex";
            }else if(data.msg=='complete'){
                window.location.href="/util/complete";
            }else{
                mui.alert(data.result);
            }
        })
    }else {
        for(var m=0;m<message.length;m++){
            document.getElementById(""+message[m]).scrollIntoView();
            $("#"+message[m]).css("border", "2px solid red");
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