var body_activities1 = ['1. 跳舞', '2. 体操（广播操）', '3. 郊游', '4. 网球', '5. 乒乓球', '6. 足球', '7. 篮球', '8. 羽毛球', '9. 手球', '10. 棒球', '11. 游泳训练', '12. 游泳（休闲）', '13. 壁球', '14. 保龄球', '15. 跳绳', '16. 排球', '17. 高尔夫', '18. 橄榄球', '19. 溜冰', '20. 骑自行车', '21. 柔道', '22. 空手道', '23. 跆拳道', '24. 武术', '25. 集体游戏（如跳橡皮筋、丢沙包等）', '26. 做家务', '27. 带狗散步', '28. 散步', '29. 慢跑', '30. 体育课', '31. 步行上下学（上学及放学=2次）','32. 其他'];
var body_activities2=['1. 做功课/上补习班','2. 看电视/电影','3. 玩游戏机/电脑游戏','4. 上网','5. 在室内玩玩具','6. 坐着聊天','7. 听电话','8. 听音乐','9. 玩乐器（如弹小提琴、钢琴等）','10. 下棋/打牌','11. 看书','12. 艺术创作（如陶瓷、编制、绘画等）','13. 乘交通工具上下学（如自行车、汽车）','14. 其他（请注明）'];
var green1=[0,1,20,21,22,23,25,29,31];
var green2=[0,1,2,3,4,5,6,7,8,9,10,11,13];
var blue1=[4,6,7,14,19,26,27,28];
var red1=[2,3,5,8,9,10,11,12,13,15,16,17,18,24,30];
var red2=[12];
for(var i=0;i<body_activities1.length;i++){
    var input="";
    if(i==31){
        input=" <input id=\"activity34a\" type=\"text\" name=\"activity34a\" readonly=\"readonly\"\n" +
            "                       style=\"width: 150px;margin-left: 58px;height: 30px\" value=\"\" >";
    }
    $("#answer_3_1").append(" <div name="+getClassName1(i)+" class=\"mui-input-row mui-checkbox mui-left\">\n" +
        "                    <label>"+body_activities1[i]+"</label>\n" +
        "                    <input  name=activity"+(i+3)+" type=\"checkbox\"  >\n" +
        "                </div>"+input)
}
for(var j=0;j<body_activities2.length;j++){
    var input1="";
    if(j==13){console.log(111111111)
        input1=" <input id=\"activity48a\" type=\"text\" name=\"activity48a\" readonly=\"readonly\"\n" +
            "                       style=\"width: 150px;margin-left: 58px;height: 30px\" value=\"\" >";
    }
    $("#answer_3_2").append(" <div name="+getClassName2(j)+" class=\"mui-input-row mui-checkbox mui-left\">\n" +
        "                    <label>"+body_activities2[j]+"</label>\n" +
        "                    <input  name=activity"+(j+35)+" type=\"checkbox\"  >\n" +
        "                </div>"+input1)
}

function gethtml_content1() {
    return "  <div >\n" +
        "                    <table border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size: 14px;width: 100%\">\n" +
        "                        <tbody>\n" +
        "                        <tr>\n" +
        "                            <th colspan=\"2\">星期一至五</th>\n" +
        "                            <th colspan=\"2\">星期六及星期日</th>\n" +
        "                        </tr>\n" +
        "                        <tr style=\"font-size: 12px;\">\n" +
        "                            <td>从星期一至五<span class=\"myspan\">总共</span>参加了多少次？</td>\n" +
        "                            <td>从星期一至五<span class=\"myspan\">总共</span>参加了多少小时/分钟？</td>\n" +
        "                            <td>星期六及日<span class=\"myspan\">总共</span>参加了多少次？</td>\n" +
        "                            <td>星期六及日<span class=\"myspan\">总共</span>参加了多少小时/分钟？</td>\n" +
        "                        </tr>\n" +
        "                        <tr style=\"font-size: 10px;text-align: center;\">\n" +
        "                            <td>\n" +
        "                                <div><input class=\"myinput1\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />次</div>\n" +
        "                            </td>\n" +
        "                            <td style=\"line-height: 30px;\">\n" +
        "                                <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />小时</div>\n" +
        "                                <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />分钟</div>\n" +
        "                            </td>\n" +
        "                            <td>\n" +
        "                                <div><input class=\"myinput1\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />次</div>\n" +
        "                            </td>\n" +
        "                            <td style=\"line-height: 30px;\">\n" +
        "                                <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />小时</div>\n" +
        "                                <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />分钟</div>\n" +
        "                            </td>\n" +
        "\n" +
        "                        </tr>\n" +
        "                        </tbody>\n" +
        "                    </table>\n" +
        "                </div>";
}

function gethtml_content2() {
    return "<div>\n" +
        "                    <table border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size: 14px;width: 100%\">\n" +
        "                        <tbody>\n" +
        "                            <tr>\n" +
        "                                <td>从<span style=\"font-weight: bold\">星期一至五</span>\n" +
        "                                    <span style=\"font-weight: bold;text-decoration: underline;font-size: 16px;\">总共</span>\n" +
        "                                    参加了多少小时/分钟？</td>\n" +
        "                                <td>从<span style=\"font-weight: bold\">星期六至日</span>\n" +
        "                                    <span style=\"font-weight: bold;text-decoration: underline;font-size: 16px;\">总共</span>\n" +
        "                                    参加了多少小时/分钟？</td>\n" +
        "                            </tr>\n" +
        "                            <tr style=\"text-align: center;\">\n" +
        "                                <td style=\"line-height: 30px;\">\n" +
        "                                  <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />小时</div>\n" +
        "                                  <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />分钟</div>\n" +
        "                                </td>\n" +
        "                                <td style=\"line-height: 30px;\">\n" +
        "                                    <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />小时</div>\n" +
        "                                    <div><input class=\"myinput2\" onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" />分钟</div>\n" +
        "                                </td>\n" +
        "                            </tr>\n" +
        "                        </tbody>\n" +
        "                    </table>\n" +
        "                </div>";
}

function getClassName1(num) {
    if(green1.indexOf(num)>-1 ){
        return "green";
    }else if(blue1.indexOf(num)>-1){
        return "blue";
    }else if(red1.indexOf(num)>-1){
        return "red";
    }
}
function getClassName2(num) {
    if(green2.indexOf(num)>-1 ){
        return "green";
    }else if(red2.indexOf(num)>-1){
        return "red";
    }
}
