var timu6_1=["1.孩子是否能够通过哭或手势来表达他们的需求？","2.孩子是否能够用简单的词/ 字来描述日常事情？",
"3.孩子是否能用简单的句子来描述日常事情？","4.孩子是否能用复杂句来描述日常事情？(如：孩子能使用“如果我好好穿衣服，你就给我买糖吃”)",
"5.孩子是否能与人交谈？（有问有答，一问一答）","6.孩子能否像大人一样与人交谈？（有来有往，交互探讨）"];
var tim6_2=["7.与熟悉的东西相比，孩子是否对没见过的东西更感兴趣？","8.孩子是否会探索一个新的玩具/游戏/智力游戏（如：汽车，积木，拼图）应该怎么玩？",
    "9.孩子是否总想学新的东西？","10.当有熟人（如：父母）在时，孩子是否能在陌生的环境中玩得很开心？",
    "11.孩子是否能认真地做新事情？（如：第一次自己穿衣，自己洗漱等）","12.遇到不懂的问题，孩子是否愿意去寻找答案？（如问成人、自己摸索）"];
var tim6_3=["13.孩子认识物体的形状（如：三角形、圆形、方形）吗？","14.孩子能说出并区分至少3种颜色吗？",
    "15.孩子能依据某种共同特性（如：形状、颜色、大小）将物品归类吗？","16.孩子能认识1到10这些数字吗？",
    "17.在没有提示的情况下，孩子能数到10吗？","18.在没有提示的情况下，孩子能数到20吗？",
    "19.在没有提示的情况下，孩子能数到100吗？","20.孩子知道牛和狗哪个高吗？","21.孩子知道日常生活的先后次序吗（如：早饭后是午饭，然后是晚饭，然后睡觉）？",
"22.孩子能理解昨天、今天、明天的概念吗？","23.孩子知道牛和老鼠哪个重吗？","24.孩子知道8和2哪个多吗？"];
var tim6_4=["25.孩子能认识10个汉字吗？","26.孩子能认20个汉字吗？","27.孩子能认识100个汉字吗？",
    "28.孩子能将书拿正，不颠倒吗？","29.孩子能按照正确的阅读顺序读书吗（从左到右，从上到下）？",
    "30.孩子能独立地一页一页翻书看吗？","31.孩子是否能读出有3-5个汉字的简单句？","32.孩子是否能读出有6-8个汉字的简单句？"];
var tim6_5=["33.孩子能模仿老师（家长）写不同笔划吗？","34.孩子能写3个不同的汉字吗？","35.孩子能写简单句吗？"];
var tim6_6=["36.孩子能表现出对他人的同情和理解吗？（如：在别人摔倒痛哭时表现出不自在或痛苦，或者前去安慰他人）",
    "37.孩子能容忍或原谅他人的错误吗？.","38.孩子能否识别两种常见的传统节日食物？（如：月饼、饺子、汤圆等）",
    "39.孩子说话是否有礼貌？","40.孩子是否能做到别人对他好，他也对别人好？","41.孩子对成人是否尊重？",
    "42.孩子是否孝敬父母？（如：好东西与父母分享、做事让父母开心） "];
var tim6_7=["43.孩子是否愿意分享他的玩具和物品？ ","44.孩子是否爱护自己的东西？（如：不故意碰摔自己的玩具、在玩具上乱涂乱画等）",
    "45.孩子是否尊重其他小朋友？（如：在游戏时和其他小朋友轮流玩玩具）",
    "46.孩子是否能对自己的行为负责？",
    "47.孩子是否总是考虑他人的感受？ （如家长，老师，其他小朋友）","48.孩子是否总是乐于助人？",
    "49.孩子是否和其他小朋友友好相处？","50.孩子是否会踢、咬、打大人或其他小朋友？","51.孩子是否容易失去耐心？","52.孩子是否总能知道什么是对的，什么是错的？"];
var tim6_8=["53.孩子是否总能在没有大人帮助下独立完成自己力所能及的事情？","54.孩子是否能从头到尾坚持做完一件事？",
    "55.孩子在完成事情的过程中，是否需要家长不断地提醒和督促？","56.孩子做事时是否容易分心？"];
var tim6_9=["57.孩子是否频繁生病？（如：经常感冒、发烧等）","58.孩子是否能够总是做到饭前便后洗手？",
    "59.孩子是否有残障或特殊需求？（如：需要听力、智能和身体方面的帮助）","60.孩子是否能规律进食（早、中、晚饭）？"];

var count=1;
for(var i=0;i<timu6_1.length;i++){
    $("#table_1").append("<tr id=div"+count+" onclick='hideBorder1(this)' >\n" +
        "                <td class=\"td1\">"+timu6_1[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_2.length;i++){
    $("#table_2").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_2[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_3.length;i++){
    $("#table_3").append("<tr id=div"+count+" onclick='hideBorder1(this)' >\n" +
        "                <td class=\"td1\">"+tim6_3[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_4.length;i++){
    $("#table_4").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_4[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_5.length;i++){
    $("#table_5").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_5[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_6.length;i++){
    $("#table_6").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_6[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_7.length;i++){
    $("#table_7").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_7[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_8.length;i++){
    $("#table_8").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_8[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}
for(var i=0;i<tim6_9.length;i++){
    $("#table_9").append("<tr id=div"+count+" onclick='hideBorder1(this)'>\n" +
        "                <td class=\"td1\">"+tim6_9[i]+"</td>\n" +
        "                <td class=\"td2\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td class=\"td3\">\n" +
        "                    <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=ehci"+count+""+" type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
    count++;
}


//之前是70-160
$("#6_61childHeight").ionRangeSlider({
    min: 70,
    max: 130,
    from: 100,
    step:1,
    hide_min_max: true,
    grid: true,
    postfix:'cm',
    onFinish: function (data) {
         $("#height").val(data.from_pretty);
    },
});
//之前是8-60

$("#6_62childWeight").ionRangeSlider({
    min: 8,
    max: 30,
    from: 15,
    step:0.1,
    hide_min_max: true,
    grid: true,
    postfix:'Kg',
    onFinish: function (data) {

         $("#weight").val(data.from_pretty);
    },
});

$("#tijiao7").click(function () {
    var data={},message=[];
try{
    for (var j1 = 1; j1 <= 60; j1++) {
        $("#div" + j1).each(function () {
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
    data["height"] = $("#height").val();
    data["weight"] = $("#weight").val();

    for(var mm=1;mm<=60;mm++){
        if(data["ehci"+mm]==''){
            message.push(mm);
            break;
        }
    }
    if(message.length==0){
        // console.log(JSON.stringify(data));
        sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:7},function (data) {
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