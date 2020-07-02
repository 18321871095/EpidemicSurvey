var answer3=["完全没有","每周少于一次","每周1次","每周2次","每周3次","每周4-5次","每周6次或以上"];
for(var i=1;i<=12;i++){
    for(var j=0;j<7;j++){
        $("#3_"+i).append("<div class=\"mui-input-row mui-radio mui-left\">\n" +
            "<label>"+answer3[j]+"</label>\n" +
            "<input  name='cpcis"+i+"' type=\"radio\"  value="+j+">\n" +
            " </div>");
    }
}


$("#tijiao4").click(function () {
    var data = {}, message = [];
    try {
            for (var j = 1; j <= 12; j++) {
                $("#div" + j).each(function () {
                    var radioValue = "";
                    $(this).find("input").each(function () {
                        if ($(this).is(":checked")) {
                            radioValue = $(this).val();
                            data[$(this).attr("name")] = radioValue;
                        } else {
                            data[$(this).attr("name")] = radioValue;
                        }
                    })
                });
            }
            for(var m=1;m<=12;m++){
                if(data["cpcis"+m]==''){
                    message.push(m);
                    break;
                }
            }
        if(message.length==0){
           // console.log(JSON.stringify(data))
            sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:4},function (data) {
                if(data.msg=='success'){
                    window.location.href="/util/goIndex";
                }else{
                    mui.alert(data.result);
                }
            })
        }else {
            for(var i=0;i<message.length;i++){
                document.getElementById("div"+message[i]).scrollIntoView();
                $("#div"+message[i]).css("border", "2px solid red");
                mui.toast("红色方框中的题目未作答",{duration: 3000})
                break;
            }
        }

}
catch (err){
    mui.alert("<span style='color: red;font-size: 15px;'>页面脚本发生错误：</span>"+err);
    $.post("/util/writeJSError",{err:err+""},function () {});
}
    //console.log(JSON.stringify(data));


});
