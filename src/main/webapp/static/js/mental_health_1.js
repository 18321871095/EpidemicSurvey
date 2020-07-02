var timu7_1=['1.我觉得很难让自己安静下来','2.我感到口干','3.我好像不能再有任何愉快、舒畅的感觉','4.我感到呼吸困难（例如不是做运动时也感到呼吸急促或透不过气来）','5.我感到很难自动去开始工作','6.我对事情往往做出过敏反应','7.我曾感到颤抖（例如：手打哆嗦）','8.我觉得自己消耗很多精神','9.我忧虑一些令自己恐慌或出丑的场合','10.我觉得自己对将来没有什么可盼望','11.我感到忐忑不安','12.我感到很难让自己放松','13.我感到忧郁沮丧','14.我无法容忍任何阻碍我继续工作的事情','15.我感到快要恐慌了','16.我对任何事也不能热衷','17.我觉得自己不怎么配做人','18.我发觉自己很容易被触怒','19.我察觉自己在没有明显的体力劳动时，也感到心律不正常','20.我无缘无故地感到害怕','21.我感到生命毫无意义',];

for(var i=0;i<timu7_1.length;i++) {
    $("#table_7").append("<tr onclick='hideBorder(this)' id=div" + (i + 1) + "  style='height:50px;'>\n" +
        "                <td style='width: 52%;'>" + timu7_1[i] + "</td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=dass" + (i + 1) + "" + " type=\"radio\"  value=\"0\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=dass" + (i + 1) + "" + " type=\"radio\"  value=\"1\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=dass" + (i + 1) + "" + " type=\"radio\"  value=\"2\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "                <td style='width: 12%;'>\n" +
        "                    <div class=\"mui-radio mui-left\">\n" +
        "                        <label></label>\n" +
        "                        <input  name=dass" + (i + 1) + "" + " type=\"radio\"  value=\"3\">\n" +
        "                    </div>\n" +
        "                </td>\n" +
        "            </tr>");
}


