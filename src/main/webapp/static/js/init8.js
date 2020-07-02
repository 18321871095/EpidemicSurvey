var timu7=["1.能体谅到别人的感受","2.不安定、过分活跃、不能长久静止","3.经常抱怨头痛、肚子痛或恶心",
    "4.很乐意与别的小孩分享东西(糖果、玩具、笔等等)","5.经常发脾气,易怒","6.颇孤独,比较多自己玩",
    "7.一般来说比较顺从,通常是成年人要求要做的都肯做","8.有很多担忧,经常表现出忧虑","9.如果有人受伤、沮丧或是生病,都很乐意提供帮助",
    "10.当坐着时,会持续不断地摆弄手脚或扭动身子","11.至少有一个好朋友","12.经常与别的小孩吵架或欺负他们","13.经常不高兴、情绪低落或哭泣",
    "14.一般来说,受别的小孩所喜欢","15.容易分心,不能全神贯注","16.在新的情况下,会紧张或爱粘人,容易失去信心",
    "17.对年纪小的小孩和善","18.经常撒谎或欺骗","19.受别的小孩作弄或欺负",
    "20.经常自愿地帮助别人(父母、老师或其他小孩)","21.做事前会思考","22.从家里、学校或其他地方偷东西",
    "23.跟成年人相处比跟小孩相处融洽","24.对很多事物感到害怕,容易受惊吓","25.做事情能做到底,注意力持久"];

for(var i=0;i<timu7.length;i++){
    $("#table_7").append("<tr id=div"+(i+1)+" onclick='hideBorder1(this)' style='height:50px;'>\n" +
        "                <td style='width: 64%;'>"+timu7[i]+"</td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=sdq"+(i+1)+""+" type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=sdq"+(i+1)+""+" type=\"radio\"  value=\"2\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=sdq"+(i+1)+""+" type=\"radio\"  value=\"3\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");


}


$("#tijiao8").click(function () {
    var data={},message=[];
try{
    for (var j = 1; j <= 25; j++) {
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
    for(var mm=1;mm<=25;mm++){
        if(data["sdq"+mm]==''){
            message.push(mm);
            break;
        }
    }
    if(message.length==0){
        // console.log(JSON.stringify(data));
        sendRequest("提交中...",10000,"/survey/addAnswer",{data:JSON.stringify(data),num:8},function (data) {
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