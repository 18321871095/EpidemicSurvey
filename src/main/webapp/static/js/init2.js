var educational_status=['未受过正式教育','未读完小学，但能够读、写','小学毕业','初中毕业','高中毕业','中专（包括中等师范、职高）毕业','大专毕业',
    '本科毕业','硕士毕业','博士毕业','不知道','拒绝回答'];

for(var i=0;i<educational_status.length;i++){
    $("#1_3").append("<div class=\"mui-input-row mui-radio mui-left\">" +
                                    "<label>"+educational_status[i]+"</label>" +
                                    "<input  name=\"care2\" type=\"radio\"  value="+(i+1)+">" +
                                    "</div>");

}


$("#tijiao2").click(function () {
    var data={},message=[];
    try{
        getData(data,"div1");
        getData(data,"div2");
        getData(data,"div3");
        data["cov4"]=$("[name='cov4']:checked").val()==undefined ? "" : $("[name='cov4']:checked").val();
        data["cov4a"]=$("[name='cov4a']:checked").val()==undefined ? "" : $("[name='cov4a']:checked").val();
        data["cov4b"]=$("[name='cov4b']:checked").val()==undefined ? "" : $("[name='cov4b']:checked").val();
        for(var i=5;i<=14;i++){
            getData(data,"div"+i);
        }
        data["cov15"]=$("[name='cov15']:checked").val()==undefined ? "" : $("[name='cov15']:checked").val();
       data["cov15a"]=$("[name='cov15a']:checked").val()==undefined ? "" : $("[name='cov15a']:checked").val();
       data["cov15b"]=$("#cov15b_input").val();
        data["cov15c"]=$("#cov15c_input").val();
          for(var j=16;j<=19;j++){
              getData(data,"div"+j);
          }
       var state="1";
        if(state=='1'){
            if(data["care4a"]=='0'&&data["care4b"]=='0'&&data["care4c"]=='0'&&data["care4d"]=='0'&&
            data["care4e"]=='0'&&data["care4f"]=='0'&&data["care4g"]=='0'){
                message.push("div1");
                state="0";
            }
        }
        if(state=='1'){
            if(data["care1"]==''){
                message.push("div2");
                state="0";
            }else{
                if(data["care1"]=='3'||data["care1"]=='4'){
                    if(data["care2"]==''){
                        message.push("div3");
                        state="0";
                    }
                }
            }
        }
        if(state=='1'){
            if(data["cov4"]==''){
                message.push("div4");
                state="0";
            }else{
                if(data["cov4"]=='2'){
                    if(data["cov4a"]=='' || data["cov4b"]==''){
                        message.push("4_div");
                        state="0";
                    }
                }
            }
        }
        if(state=='1'){
            if(data["cov5"]==''){
                message.push("div5");
                state="0";
            }
        }
        if(state=='1'){
            if(data["cov6a"]=='0'&&data["cov6b"]=='0'&&data["cov6c"]=='0'&&data["cov6d"]=='0'&&
            data["cov6e"]=='0'&&data["cov6f"]=='0'&&data["cov6g"]=='0'){
                message.push("div6");
                state="0";
            }else {
                if(data["cov6c"]=='1'){
                    if(data["cov6aa"]=='' || data["cov6ab"]==''){
                        message.push("6_1_div");
                        state="0";
                    }
                } if(data["cov6d"]=='1'){
                    if(data["cov6da"]=='' || data["cov6db"]==''){
                        message.push("6_2_div");
                        state="0";
                    }
                } if(data["cov6e"]=='1'){
                    if(data["cov6ea"]=='' || data["cov6eb"]==''){
                        message.push("6_3_div");
                        state="0";
                    }
                } if(data["cov6f"]=='1'){
                    if(data["cov6fa"]=='' || data["cov6fb"]==''){
                        message.push("6_4_div");
                        state="0";
                    }
                } if(data["cov6g"]=='1'){
                    if(data["cov6ga"]=='' || data["cov6gb"]==''){
                        message.push("6_5_div");
                        state="0";
                    }
                }
            }
        }
        if(state=='1'){
            for(var aa=7;aa<=12;aa++){
                if(data["cov"+aa]==''){
                    message.push("div"+aa);
                    state="0";
                    break;
                }
            }
        }
        if(state=='1'){
            if(data["cov13"]==''||data["cov13a"]=='' || data["cov13bh_input"]=='' || data["cov13bm_input"]==''){
                message.push("div13");
                state="0";
            }
        }
        if(state=='1'){
            if(data["cov14"]==''){
                message.push("div14");
                state="0";
            }
        }
        if(state=='1'){
            if(data["cov15"]==''){
                message.push("div15");
                state="0";
            }else{
                if(data["cov15"]=='1'){
                    if(data["cov15a"]==''){
                        message.push("15_div");
                        state="0";
                    }
                    if(data["cov15c"]==''){
                        message.push("15_div");
                        state="0";
                    }
                }
            }
        }

        if(state=='1'){
            if(data["cov16"]==''){
                message.push("div16");
                state="0";
            }
        }
        if(state=='1'){
            if(data["cov17"]==''){
                message.push("div17");
                state="0";
            }
        }
        if(state=='1'){
            if(data["cov18"]==''){
                message.push("div18");
                state="0";
            }
        }
        if(state=='1'){
            if(data["cov19"]==''){
                message.push("div19");
                state="0";
            }
        }
        if(message.length==0){
           // console.log(JSON.stringify(data))
            sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:2},function (data) {
                if(data.msg=='success'){
                    window.location.href="/util/goIndex";
                }else{
                    mui.alert(data.result);
                }
            })
        }else{
            for(var m=0;m<message.length;m++){
                if($("#"+message[m]).css("display")=='none'){
                    $("#"+message[m]).show();
                }
                document.getElementById(""+message[m]).scrollIntoView();
                $("#"+message[m]).css("border", "2px solid red");
                mui.toast("红色方框中的题目未作答",{duration: 3000})
                break;
            }
        }

    }catch (err){
        mui.alert("<span style='color: red;font-size: 15px;'>页面脚本发生错误：</span>"+err);
        $.post("/util/writeJSError",{err:err+""},function () {});
    }

    

});
function getData(data,id) {
    var radioValue="";
   $("#"+id).find("input").each(function () {
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
           }else{
               data[$(this).attr("name")]=$(this).val();
           }
   });
}



