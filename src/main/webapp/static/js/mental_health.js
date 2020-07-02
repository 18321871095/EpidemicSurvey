var timu7=["1.能体谅到别人的感受","2.不安定、过分活跃、不能长久静止","3.经常抱怨头痛、肚子痛或恶心",
    "4.很乐意与别的小孩分享东西(糖果、玩具、笔等等)","5.经常发脾气,易怒","6.颇孤独,比较多自己玩",
    "7.一般来说比较顺从,通常是成年人要求要做的都肯做","8.有很多担忧,经常表现出忧虑","9.如果有人受伤、沮丧或是生病,都很乐意提供帮助",
    "10.当坐着时,会持续不断地摆弄手脚或扭动身子","11.至少有一个好朋友","12.经常与别的小孩吵架或欺负他们","13.经常不高兴、情绪低落或哭泣",
    "14.一般来说,受别的小孩所喜欢","15.容易分心,不能全神贯注","16.在新的情况下,会紧张或爱粘人,容易失去信心",
    "17.对年纪小的小孩和善","18.经常撒谎或欺骗","19.受别的小孩作弄或欺负",
    "20.经常自愿地帮助别人(父母、老师或其他小孩)","21.做事前会思考","22.从家里、学校或其他地方偷东西",
    "23.跟成年人相处比跟小孩相处融洽","24.对很多事物感到害怕,容易受惊吓","25.做事情能做到底,注意力持久"];

for(var i=0;i<timu7.length;i++){
    $("#table_7").append("<tr onclick='hideBorder(this)' id=div"+(i+1)+"  style='height:50px;'>\n" +
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

    /*$("#table_7").append("<tr id=div"+(i+1)+" onclick='hideBorder1(this)' style='height:50px;'>\n" +
        "                        <td style=\"width: 64%\">\n" +
        timu7[i] +
        "                        </td>\n" +
        "                        <td style=\"width: 12%\">\n" +
        "                            <div style=\"position: relative;line-height: 36px;\">\n" +
        "                                <input class=\"myinput\"  id=sdq"+(i+1)+""+" type=\"radio\" name=sdq"+(i+1)+""+" value=\"1\" >\n" +
        "                                <label style=\"left: 5px\" class=\"mylabel\" for=sdq"+(i+1)+""+" ></label>\n" +
        "                                <span></span>\n" +
        "                            </div>\n" +
        "                        </td>\n" +
        "                        <td style=\"width: 12%\">\n" +
        "                            <div style=\"position: relative;line-height: 36px;\">\n" +
        "                                <input class=\"myinput\"  id=sdq"+(i+1)+""+" type=\"radio\" name=sdq"+(i+1)+""+" value=\"2\" >\n" +
        "                                <label style=\"left: 5px\" class=\"mylabel\" for=sdq"+(i+1)+"_w3_2"+" ></label>\n" +
        "                                <span></span>\n" +
        "                            </div>\n" +
        "                        </td>\n" +
        "                        <td style=\"width: 12%\">\n" +
        "                            <div style=\"position: relative;line-height: 36px;\">\n" +
        "                                <input class=\"myinput\"  id=sdq"+(i+1)+""+" type=\"radio\" name=sdq"+(i+1)+""+" value=\"3\" >\n" +
        "                                <label style=\"left: 5px\" class=\"mylabel\" for=sdq"+(i+1)+"_w3_3"+"></label>\n" +
        "                                <span></span>\n" +
        "                            </div>\n" +
        "                        </td>\n" +
        "                    </tr>");*/
}
/*
var sleep_time=setInterval(function () {
    var width=$(".table11").find("td").eq(0).css("width");
    if(typeof (width)=='undefined'){
        console.log("获取")
    }else{
        clearInterval(sleep_time);
        $("#table1_td").css("width",width);
    }
},100)
*/
