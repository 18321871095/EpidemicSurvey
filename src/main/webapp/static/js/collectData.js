var banji="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div  class=\"layui-form\" style=\"width: 200px;display: inline-block;\">\n" +
    "        <select lay-filter=\"banji\"  id=\"\">\n" +
    "            <option value=\"\">请选择班级数量</option>\n" +
    "            <option value=\"1\">1个</option>\n" +
    "            <option value=\"2\">2个</option>\n" +
    "            <option value=\"3\">3个</option>\n" +
    "            <option value=\"4\">4个</option>\n" +
    "            <option value=\"5\">5个</option>\n" +
    "            <option value=\"6\">6个</option>\n" +
    "            <option value=\"7\">7个</option>\n" +
    "            <option value=\"8\">8个</option>\n" +
    "            <option value=\"9\">9个</option>\n" +
    "            <option value=\"10\">10个</option>\n" +
    "            <option value=\"11\">11个</option>\n" +
    "            <option value=\"12\">12个</option>\n" +
    "            <option value=\"13\">13个</option>\n" +
    "            <option value=\"14\">14个</option>\n" +
    "            <option value=\"15\">15个</option>\n" +
    "        </select>\n" +
    "    </div>";

function getTable(num) {
    if(num==0){
        return "请先选择班级数量";
    }else{
        var count=parseInt(num);
        var result="";
        for(var i=1;i<=count;i++){
            result+= "<tr>" +
                "<td style='width: 50%'>"+i+"班</td>\n" +
                "<td><input style='text-align: center;' placeholder='请填写人数'" +
                " onkeyup=\"this.value=this.value.replace(/\\D/g,'').replace(/^0+(?=\\d)/,'')\" /></td>" +
                "</tr>";
        }
        return "<table class=\"layui-table\">\n" +
            "  <thead>\n" +
            "    <tr>\n" +
            "      <th>班级</th>\n" +
            "      <th>人数</th>\n" +
            "    </tr> \n" +
            "  </thead>\n" +
            "  <tbody>\n" +result+
            "  </tbody>\n" +
            "</table>";
    }

}

function sendCollect(layer,url,data,callback) {
    var load = layer.load("提交...",{icon:'2',offset:"200px"});
    $.ajax({
        type: "POST",
        url: url,
        data:data,
        timeout:'10000',
        success: function (data) {
           layer.close(load);
            callback(data);
        },
        error: function (e, jqxhr, settings, exception) {
            layer.close(load);
            alert("请求异常:"+jqxhr)
        }
    });
}