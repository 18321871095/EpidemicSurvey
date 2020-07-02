var answer2=['很少','1～3次/每月','1～2次/每周','3～4次/每周','几乎每天'];

for(var i=1;i<=8;i++){
    for(var j=0;j<5;j++){
        $("#2_"+i).append("<div class=\"mui-input-row mui-radio mui-left\">\n" +
            "<label>"+answer2[j]+"</label>\n" +
            "<input  name='icce"+i+"' type=\"radio\"  value="+(j+1)+">\n" +
            " </div>");
    }
}
$("#tijiao3").click(function () {
    var data = {}, message = [];
    try{
        for(var i=1;i<=22;i++){
            $("div[name="+i+"]").each(function () {
                var radioValue="";
                $(this).find("input").each(function () {
                    var type=$(this).attr("type");
                    if(type=='radio'){
                        if($(this).is(":checked")){
                            radioValue=$(this).val();
                            data[$(this).attr("name")]=radioValue;
                        }else{
                            data[$(this).attr("name")]=radioValue;
                        }
                    }else if(type=='checkbox'){
                        if($(this).is(":checked")){
                            data[$(this).attr("name")]="1";
                        }else{
                            data[$(this).attr("name")]="0";
                        }
                    }else if(type=='text'){
                        if($(this).attr("id")=='icce17'){
                            data["icce17"]=$(this).attr("name")
                        }else{
                            data[$(this).attr("name")]=$(this).val();
                        }
                    }
                });
            });
        }
       // console.log(JSON.stringify(data));
        var state='1';
        if(state=='1'){
            for(var j=1;j<=11;j++){
                if(data["icce"+j]==''){
                    message.push(j);
                    state='0';
                    break;
                }
            }
        }
        if(state=='1'){
            if(data["icce12"]==''){
                message.push(12);
                state='0';
            }
           if(data["icce12"]=='1'){
                if(data["icce12a"]=='0'&&data["icce12b"]=='0'&&data["icce12c"]=='0'&&data["icce12d"]=='0'&&data["icce12e"]=='0'
                    &&data["icce12f"]=='0'&&data["icce12g"]=='0'&&data["icce12h"]=='0'){
                    message.push(12);
                    state='0';
                }
           }
        }
        if(state=='1'){
            if(data["icce13"]==''){
                message.push(13);
                state='0';
            }
            if(data["icce13"]=='1'){
                if(data["icce13a"]=='0'&&data["icce13b"]=='0'&&data["icce13c"]=='0'&&data["icce13d"]=='0'&&data["icce13e"]=='0'
                    &&data["icce13f"]=='0'&&data["icce13g"]=='0'&&data["icce13h"]=='0'&&data["icce13i"]=='0'&&data["icce13j"]=='0'&&data["icce13k"]=='0'){
                    message.push(13);
                    state='0';
                }
            }
        }
        if(state=='1'){
            if(data["icce17"]==''){
                message.push(14);
                state='0';
            }
        }
        if(state=='1'){
            if(data["icce18"]==''){
                message.push(15);
                state='0';
            }
            if(data["icce18"]=='1'){
                if(data["icce18a"]==''){
                    message.push(15);
                    state='0';
                }
            }
            if(data["icce19"]==''){
                message.push(15);
                state='0';
            }
            if(data["icce19"]=='1'){
                if(data["icce19a"]==''){
                    message.push(15);
                    state='0';
                }
            }
        }
        if(state=='1'){
            if(data["icce20a"]=='0'&&data["icce20b"]=='0'&&data["icce20c"]=='0'&&data["icce20d"]=='0'&&data["icce20e"]=='0'
                &&data["icce20f"]=='0'&&data["icce20g"]=='0'&&data["icce20h"]=='0'&&data["icce20i"]=='0'&&data["icce20j"]=='0'&&data["icce20k"]=='0'){
                message.push(16);
                state='0';
            }
        }
        if(state=='1'){
            if(data["icce14a"]==''){
                message.push(17);
                state='0';
            }
            if(data["icce14b"]==''){
                message.push(18);
                state='0';
            }
            if(data["icce14c"]==''){
                message.push(19);
                state='0';
            }
            if(data["icce14d"]==''){
                message.push(20);
                state='0';
            }
            if(data["icce15"]==''){
                message.push(21);
                state='0';
            }
            if(data["icce16"]==''){
                message.push(22);
                state='0';
            }
        }
        if(message.length==0){
            //console.log(JSON.stringify(data))
            sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:3},function (data) {
                if(data.msg=='success'){
                    window.location.href="/util/goIndex";
                }else{
                    mui.alert(data.result);
                }
            })
        }else {
            for(var i=0;i<message.length;i++){
                if($("#div"+message[i]).css("display")=='none'){
                    $("#div"+message[i]).show();
                }
                document.getElementById("div"+message[i]).scrollIntoView();
                $("#div"+message[i]).css("border", "2px solid red");
                mui.toast("红色方框中的题目未作答",{duration: 3000})
                break;
            }
        }

    }catch (err){
        mui.alert("<span style='color: red;font-size: 15px;'>页面脚本发生错误：</span>"+err);
        $.post("/util/writeJSError",{err:err+""},function () {});
    }





});
