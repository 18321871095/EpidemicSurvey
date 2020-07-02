var educational_status=['未受过正式教育','未读完小学，但能够读、写','小学毕业','初中毕业','高中毕业','中专（包括中等师范、职高）毕业','大专毕业',
    '本科毕业','硕士毕业','博士毕业','不知道','拒绝回答'];

for(var i=0;i<educational_status.length;i++){
    $("#1_3").append("<div class=\"mui-input-row mui-radio mui-left\">" +
                                    "<label>"+educational_status[i]+"</label>" +
                                    "<input  name=\"ses2\" type=\"radio\"  value="+(i+1)+">" +
                                    "</div>");
    $("#1_4").append("<div class=\"mui-input-row mui-radio mui-left\">" +
        "<label>"+educational_status[i]+"</label>" +
        "<input  name=\"ses1\" type=\"radio\"  value="+(i+1)+">" +
        "</div>");

}


$("#tijiao1").click(function () {
    var data={},message=[];
    try{
        data["ques5"]=$("[name='ques5']:checked").val()==undefined ? "" : $("[name='ques5']:checked").val();
        data["ques2"]=$("[name='ques2']:checked").val()==undefined ? "" : $("[name='ques2']:checked").val();
        data["ques2a"]=$("#ques2_input").val();
        data["ses0"]=$("[name='ses0']:checked").val()==undefined ? "" : $("[name='ses0']:checked").val();
        data["ses2"]=$("[name='ses2']:checked").val()==undefined ? "" : $("[name='ses2']:checked").val();
        data["ses1"]=$("[name='ses1']:checked").val()==undefined ? "" : $("[name='ses1']:checked").val();
        data["care3"]=$("[name='care3']:checked").val()==undefined ? "" : $("[name='care3']:checked").val();
        data["care3b"]=$("#care3b_input").val();
        data["care3b1"]=$("#care3b1").val();
        data["care3b2"]=$("#care3b2").val();
        data["care3b3"]=$("#care3b3").val();
        data["care3b4"]=$("#care3b4").val();
        data["care3b5"]=$("#care3b5").val();
        data["care3b1a"]=$("[name='care3b1a']").is(":checked") ? "1" :"0";
        data["care3b2a"]=$("[name='care3b2a']").is(":checked") ? "1" :"0";
        data["care3b3a"]=$("[name='care3b3a']").is(":checked") ? "1" :"0";
        data["care3b4a"]=$("[name='care3b4a']").is(":checked") ? "1" :"0";
        data["care3b5a"]=$("[name='care3b5a']").is(":checked") ? "1" :"0";
        var state=1;
        if(state==1){
            if(data["ques5"]==''){
                message.push("div0");
                state=0;
            }
        }
        if(state==1){
            if(data["ques2"]==''){
                message.push("div1");
                state=0;
            }
        }
        if(state==1){
            if(data["ses0"]==''){
                message.push("div2");
                state=0;
            }else if(data["ses0"]=='1'){
                if(data["ses2"]==''){
                    message.push("div3");
                    state=0;
                }
            }else if(data["ses0"]=='2'){
                if(data["ses1"]==''){
                    message.push("div4");
                    state=0;
                }
            }else if(data["ses0"]=='3'){
                if(data["ses2"]==''){
                    message.push("div3");
                    state=0;
                } if(data["ses1"]==''){
                    message.push("div4");
                    state=0;
                }
            }
        }
        if(state==1){
            if(data["care3"]==''){
                message.push("div5");
                state=0;
            }else if(data["care3"]=='0'){
                if(data["care3b"]==''){
                    message.push("div6");
                    state=0;
                }
            }
        }

        if(message.length==0){
            console.log(JSON.stringify(data))
            sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:1},function (data) {
                if(data.msg=='success'){
                    window.location.href="/util/goIndex";
                }else{
                    mui.alert(data.result);
                }
            })
        }else{
            for(var i=0;i<message.length;i++){
                if($("#"+message[i]).css("display")=='none'){
                    $("#"+message[i]).show();
                }
                document.getElementById(""+message[i]).scrollIntoView();
                $("#"+message[i]).css("border", "2px solid red");
                mui.toast("红色方框中的题目未作答",{duration: 3000})
                break;
            }
        }

    }catch (err){
        mui.alert("<span style='color: red;font-size: 15px;'>页面脚本发生错误：</span>"+err);
        $.post("/util/writeJSError",{err:err+""},function () {});
    }

    

});
