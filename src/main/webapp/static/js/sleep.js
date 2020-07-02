var timu4=['1.孩子晚上是否在固定时间上床睡觉?','2.孩子上床后是否可在20分钟内入睡?','3.孩子是否独自在自己床上睡觉?','4.孩子是否在他人床上入睡?',
    '5.孩子入睡时是否需要陪伴?','6.到了就寝时间,孩子是否有如哭闹、拒绝待在床上等不良行为?',
    '7.孩子是否害怕在黑暗中睡觉?', '8.孩子是否害怕一个人睡觉?','9.您是否认为孩子睡得太少?',
    '10.您是否认为孩子的睡眠时间合适?','11.您孩子每日的睡眠量是否保持一致?',
    '12.孩子是否有尿床现象?','13.孩子是否有说梦话现象?','14.孩子睡眠过程中是否不安宁,常有肢体动作?',
    '15.孩子是否有梦游(睡眠过程中行走)现象?','16.孩子是否有半夜转移到他人(父母、兄弟姐妹等)床上的现象?',
    '17.孩子睡眠中是否有磨牙现象?','18.孩子睡眠中是否有打鼾很响的现象?',
    '19.孩子睡眠中是否有呼吸暂停现象?','20.孩子睡眠中是否有憋气或气急等呼吸困难现象?',
    '21.孩子不在家睡是否会有问题?(例如到亲戚家或去旅行)','22.孩子是否有半夜醒来伴无法安慰的哭吵、出汗的现象?',
    '23.孩子是否有被噩梦惊醒的现象?','24.孩子是否会夜间醒来一次?',
    '25.孩子是否会夜间醒来一次以上?','26.孩子早晨可否自己醒来?',
    '27.孩子是否醒来后情绪不佳?','28.孩子早晨是否由他人唤醒?','29.早上是否很难把孩子叫起床?',
    '30.孩子早晨起床后是否需长时间才能清醒?','31.孩子是否看起来疲乏?'];

for(var i=0;i<timu4.length;i++){
    $("#mytable").append("<tr onclick=\"hideBorder1(this)\" id=div"+(i+9)+" >\n" +
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
}
var sleep_time=setInterval(function () {
    var width=$(".table11").find("td").eq(0).css("width");
    if(typeof (width)=='undefined'){
        console.log("获取")
    }else{
        clearInterval(sleep_time);
        $("#table1_td").css("width",width);
    }
},100)
