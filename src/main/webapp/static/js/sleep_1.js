var sleep_timu_3=['1)在学校上课时,你有睡着或很想睡的情况吗？','2)在家做功课时,你有睡着或很想睡的情况吗?',
    '3)在一天当中,你通常都能保持清醒吗?','4)在一天中,你有感觉疲劳或脾气不好的情况吗?',
    '5)在早上起床时,你会有不想起床的情况吗?','6)在早上被唤醒后，你会再次睡着吗?','7)在早上,你需要其他人叫你起床吗?',
'8)你会想要更多的睡眠吗?'];

for(var i=0;i<sleep_timu_3.length;i++){
    $("#3_1").append("<div class=\"problems12\">"+sleep_timu_3[i]+"</div>\n" +
        "            <div  class=\"answer12\">\n" +
        "                <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                    <label>从未</label>\n" +
        "                    <input  name=3"+i+" type=\"radio\"  value=\"0\">\n" +
        "                </div>\n" +
        "                <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                    <label>很少</label>\n" +
        "                    <input  name=3"+i+" type=\"radio\"  value=\"1\">\n" +
        "                </div>\n" +
        "                <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                    <label>有时</label>\n" +
        "                    <input  name=3"+i+" type=\"radio\"  value=\"2\">\n" +
        "                </div>\n" +
        "                <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                    <label>经常</label>\n" +
        "                    <input  name=3"+i+" type=\"radio\"  value=\"3\">\n" +
        "                </div>\n" +
        "                <div class=\"mui-input-row mui-radio mui-left\">\n" +
        "                    <label>总是</label>\n" +
        "                    <input  name=3"+i+" type=\"radio\"  value=\"4\">\n" +
        "                </div>\n" +
        "            </div>");
}

