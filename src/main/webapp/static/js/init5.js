var timu4=['1.孩子晚上是否在固定时间上床睡觉?','2.孩子上床后是否可在20分钟内入睡?','3.孩子是否独自在自己床上睡觉?',
    '4.孩子是否在他人床上入睡?',
    '5.孩子入睡时是否需要陪伴?','6.到了就寝时间，孩子是否有如哭闹、拒绝待在床上等不良行为?',
    '7.孩子是否害怕在黑暗中睡觉?', '8.孩子是否害怕一个人睡觉?','9.您是否认为孩子睡得太少?',
    '10.您是否认为孩子的睡眠时间合适?','11.您孩子每日的睡眠量是否保持一致?',
    '12.孩子是否有尿床现象?','13.孩子是否有说梦话现象?','14.孩子睡眠过程中是否不安宁，常有肢体动作?',
    '15.孩子是否有梦游（睡眠过程中行走）现象?','16.孩子是否有半夜转移到他人（父母、兄弟姐妹等）床上的现象?',
    '17.孩子睡眠中是否有磨牙现象?','18.孩子睡眠中是否有打鼾很响的现象?',
    '19.孩子睡眠中是否有呼吸暂停现象?','20.孩子睡眠中是否有憋气或气急等呼吸困难现象?',
    '21.孩子不在家睡是否会有问题?(例如到亲戚家或去旅行)','22.孩子是否有半夜醒来伴无法安慰的哭吵、出汗的现象?',
    '23.孩子是否有被噩梦惊醒的现象?','24.孩子是否会夜间醒来一次?',
    '25.孩子是否会夜间醒来一次以上?','26.孩子早晨可否自己醒来?',
    '27.孩子是否醒来后情绪不佳?','28.孩子早晨是否由他人唤醒?','29.早上是否很难把孩子叫起床?',
    '30.孩子早晨起床后是否需长时间才能清醒?','31.孩子是否看起来疲乏?'];

for(var i=0;i<timu4.length;i++){
    $("#mytable").append("<tr id=div"+(i+9)+" onclick='hideBorder1(this)'>\n" +
        "                <td style='width: 57%'>"+timu4[i]+"</td>\n" +
        "                <td >\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=chsq"+(i+9)+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td >\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=chsq"+(i+9)+""+" type=\"radio\"  value=\"2\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td >\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=chsq"+(i+9)+""+" type=\"radio\"  value=\"3\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    /*$("#mytable").append("<tr id=div"+(i+9)+" onclick=\"hideBorder1(this)\" >\n" +
        "                        <td style='width: 62%'>" +timu4[i]+
        "                        </td>\n" +
        "                        <td style='height: 45px'>\n" +
        " <div style=\"position: relative;line-height: 36px;\">\n" +
        "  <input class=\"myinput\"  id=chsq"+(i+9)+""+" type=\"radio\" name=chsq"+(i+9)+""+" value=\"1\" >\n" +
        "  <label class=\"mylabel\" for=chsq"+(i+9)+""+" ></label>\n" +
        "     <span></span>\n" +
        "  </div>"+
        "                        </td>\n" +
        "<td>" +
        " <div style=\"position: relative;line-height: 36px;\">\n" +
        "   <input class=\"myinput\"  id=chsq"+(i+9)+""+" type=\"radio\" name=chsq"+(i+9)+""+" value=\"2\" >\n" +
        " <label class=\"mylabel\" for=chsq"+(i+9)+""+" ></label>\n" +
        "    <span></span>\n" +
        "   </div>"+
        "</td>"+
        "<td>" +
        " <div style=\"position: relative;line-height: 36px;\">\n" +
        " <input class=\"myinput\"  id=chsq"+(i+9)+""+" type=\"radio\" name=chsq"+(i+9)+""+" value=\"3\" >\n" +
        "    <label class=\"mylabel\" for=chsq"+(i+9)+""+" ></label>\n" +
        "     <span></span>\n" +
        "    </div>"+
        "</td>"+
        "                    </tr>");*/
}


$("#tijiao5").click(function () {

    var data = {}, message = [];
try{
    for(var j=1;j<=8;j++){
       if(j==4){
           var radioValue1="";
           $("#div4").find("input").each(function () {
               if ($(this).is(":checked")) {
                   radioValue1 = $(this).val();
                   data[$(this).attr("name")] = radioValue1;
               } else {
                   data[$(this).attr("name")] = radioValue1;
               }
           });
           data["chsq42"]=$("#chsq42").val();
           data["chsq42a"]=$("#chsq42a").val();
       }else if(j==8){
           var radioValue2="";
           $("#div8").find("input").each(function () {
               if ($(this).is(":checked")) {
                   radioValue2 = $(this).val();
                   data[$(this).attr("name")] = radioValue2;
               } else {
                   data[$(this).attr("name")] = radioValue2;
               }
           });
           data["chsq43"]=$("#chsq43").val();
           data["chsq43a"]=$("#chsq43a").val();
       }else{
            $("#div"+j).each(function () {
                $(this).find("input").each(function () {
                    data[$(this).attr("name")] = $(this).val();
                });
            });
        }
    }
  //  console.log(JSON.stringify(data))
    $("#mytable").find("tr").each(function () {
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
    var radioValue40 = "";
    $("#div40").find("input").each(function () {
        if ($(this).is(":checked")) {
            radioValue40 = $(this).val();
            data[$(this).attr("name")] = radioValue40;
        } else {
            data[$(this).attr("name")] = radioValue40;
        }
    });
    var radioValue41 = "";
    $("#div41").find("input").each(function () {
        if ($(this).is(":checked")) {
            radioValue41 = $(this).val();
            data[$(this).attr("name")] = radioValue41;
        } else {
            data[$(this).attr("name")] = radioValue41;
        }
    });

    var state="1";
    if(state=='1'){
        if(data["chsq1"]=='' ||data["chsq1a"]=='' ){
            message.push(1);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq2"]=='' ||data["chsq2a"]=='' ){
            message.push(2);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq3"]=='' ||data["chsq3a"]=='' ){
            message.push(3);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq42r"]==''){
            message.push(4);
            state='0';
        }else if((data["chsq42r"]=='1')){
            if(data["chsq42"]=='' ||data["chsq42a"]=='' ){
                message.push(4+"_"+"1");
                state='0';
            }
        }

    }
    if(state=='1'){
        if(data["chsq5"]=='' ||data["chsq5a"]=='' ){
            message.push(5);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq6"]=='' ||data["chsq6a"]=='' ){
            message.push(6);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq7"]=='' ||data["chsq7a"]=='' ){
            message.push(7);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq43r"]==''){
            message.push(8);
            state='0';
        }else if((data["chsq43r"]=='1')){
            if(data["chsq43"]=='' ||data["chsq43a"]=='' ){
                message.push(8+"_"+1);
                state='0';
            }
        }

    }
    if(state=='1'){
        for(var mm=9;mm<=39;mm++){
            if(data["chsq"+mm]==''){
                message.push(mm);
                state='0';
                break;
            }

        }
    }
    if(state=='1'){
        if(data["chsq40"]==''){
            message.push(40);
            state='0';
        }
    }
    if(state=='1'){
        if(data["chsq41"]==''){
            message.push(41);
            state='0';
        }
    }
    if(message.length==0){
        // console.log(JSON.stringify(data))
        sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:5},function (data) {
            if(data.msg=='success'){
                window.location.href="/util/goIndex";
            }else{
                mui.alert(data.result);
            }
        })
    }else {
        for(var m=0;m<message.length;m++){
            if($("#div"+message[m]).css("display")=='none'){
                $("#div"+message[m]).show();
            }
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



