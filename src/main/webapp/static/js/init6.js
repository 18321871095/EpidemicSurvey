
$("#tijiao6").click(function () {

    var data={},message=[];
    var radioValue1 = "";
    try{
        $("#div1").find("input").each(function () {
            if ($(this).is(":checked")) {
                radioValue1 = $(this).val();
                data[$(this).attr("name")] = radioValue1;
            } else {
                data[$(this).attr("name")] = radioValue1;
            }
        });
        for(var j=2;j<=12;j++){
            $("#div"+j).each(function () {
                $(this).find("input").each(function () {
                    data[$(this).attr("name")] = $(this).val();
                });
            });
        }

        var radioValue13 = "";
        $("#div13").find("input").each(function () {
            if ($(this).is(":checked")) {
                radioValue13 = $(this).val();
                data[$(this).attr("name")] = radioValue13;
            } else {
                data[$(this).attr("name")] = radioValue13;
            }
        });
        var radioValue14 = "";
        $("#div14").find("input").each(function () {
            if ($(this).is(":checked")) {
                radioValue14 = $(this).val();
                data[$(this).attr("name")] = radioValue14;
            } else {
                data[$(this).attr("name")] = radioValue14;
            }
        });
        var state="1";
        if(state=='1'){
            if(data["media2"]==''){
                message.push(1);
                state='0';
            }
        }
        if(state=='1'){
            for(var mm=3;mm<=12;mm++){//2-11
                if(data["media"+mm]==''){
                    message.push(parseInt(mm)-1);
                    state='0';
                    break;
                }
            }
        }
        if(state=='1'){
            if(data["media13"]==''){
                message.push(12);
                state='0';
            }
        }
        if(state=='1'){
            if(data["media14"]==''){
                message.push(13);
                state='0';
            }
        }
        if(state=='1'){
            if(data["media15"]==''){
                message.push(14);
                state='0';
            }
        }

        if(message.length==0){
             //console.log(JSON.stringify(data))
            sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:6},function (data) {
                if(data.msg=='success'){
                    window.location.href="/util/goIndex";
                }else{
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