<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>问卷</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${ctx}/static/css/questionNaireSurvey.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="${ctx}/static/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <style>
        .mui-checkbox.mui-left label, .mui-radio.mui-left label{
            padding-left: 40px;
        }
        .mui-input-row label{
            padding: 18px 15px;
        }
        .td1{
            font-size: 15px;
            padding: 5px;
            line-height: 25px;
            width: 60%;
        }
        .td2{
            width: 20%;
        }
        .td3{
            width: 20%;
        }
        .mycontent table{
            width: 96%;
        }
        .mui-progressbar
        {
            background: none;
        }
    </style>
</head>
<body>
<div style="max-width:720px;margin:0 auto;background-color: #87b2ff;height: 100%;">
    <div style="width: 100%;height: 13%;margin: 0 auto;">
        <img src="${ctx}/static/images/top_1.png" width="100%" height="100%">
    </div>
    <div class="mycontent" style="margin-top: 3px">
        <div  style="padding: 10px 10px; font-size: 18px;color: #086cfe;text-align: center;font-weight: bold;">
            中国儿童能力指数（eHCi）
        </div>
    </div>
    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <div class="mycontent">
            <%--        <img src="/static/images/6_top.png" style="width: 40%;height: 28%;float: right;" >--%>
            <div style="color: #086CFF;text-indent: 30px;line-height: 30px;padding: 5px 10px;">
                eHCi问卷是关于儿童早期发展能力的国际标准化问卷，分别从社交能力、交流能力、语言认知能力、
                毅力、学习方法、心理成熟度、身体健康状况6个方面测试儿童目前的能力水平。该问卷适用于3-6岁的儿童，
                此时您的孩子不需要完成问卷中的每件事。同时，每个儿童都有他自己的发育和成长轨迹，
                如，有些儿童学会走路比其他儿童早，这是正常的。请您根据孩子的实际发展情况，给出一个客观真实的答案。
            </div>
        </div>


        <div  class="mycontent">
            <br/>
            <table border="1" style="margin:0px 8px;color:  #666666 ">
                <tr style="text-align: center;">
                    <td>语言交流能力</td>
                    <td>已能</td>
                    <td>还不能</td>
                </tr>
                <tbody id="table_1">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>学习方法</td>
                    <td>是</td>
                    <td>否</td>
                </tr>
                <tbody id="table_2">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>数和概念</td>
                    <td>已能</td>
                    <td>还不能</td>
                </tr>
                <tbody id="table_3">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>阅读</td>
                    <td>已能</td>
                    <td>还不能</td>
                </tr>
                <tbody id="table_4">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>书写</td>
                    <td>已能</td>
                    <td>还不能</td>
                </tr>
                <tbody id="table_5">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>文化认同</td>
                    <td>已能/是</td>
                    <td>还不能/否</td>
                </tr>
                <tbody id="table_6">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>社会和情感技能</td>
                    <td>已能/是</td>
                    <td>还不能/否</td>
                </tr>
                <tbody id="table_7">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>坚毅</td>
                    <td>是</td>
                    <td>否</td>
                </tr>
                <tbody id="table_8">
                </tbody>
            </table>
            <table border="1" style="margin:0px 8px;color:  #666666">
                <tr style="text-align: center;">
                    <td>身体健康</td>
                    <td>是</td>
                    <td>否</td>
                </tr>
                <tbody id="table_9">
                </tbody>
            </table>
            <br/>



        </div>

        <div id="2" style="color: #666666" class="mycontent">
            <div style="width: 85%;margin-right: 8%; margin-left: 8%;margin-bottom: 5%;margin-top: 10px;">
                61.孩子的身高多少厘米（cm）？
                <div id="6_61childHeight"></div>
            </div>
            <input type="hidden" id="height" name="height" value="100" />

            <div style="width: 85%;margin-right: 8%; margin-left: 8%;margin-bottom: 5%;margin-top: 10px;">
                62.孩子的体重多少<span style="color: red;">公斤（kg）</span>(请将斤转换为公斤在选择)？
                <div id="6_62childWeight"></div>
            </div>
            <input type="hidden" id="weight" name="weight" value="15" />

        </div>


        <div class="mycontent">
            <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                您已顺利填写完成eHCi问卷，希望您也能多多关注孩子的社交能力、交流能力、
                语言认知能力、毅力、学习方法、心理成熟度及身体健康状况，保证这些方面均衡发展，
                您的孩子将会更轻松的适应未来的学习和生活，并且会有出色的表现哦。
            </div>
        </div>


        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao7" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>
    <div style="border:  1px solid #007aff;width: 100%;height: 20px;margin-top: 5px;">
        <div id="demo7" class="mui-progressbar" style="height: 18px;background: #fff;">
            <span></span>
            <div style="position: absolute; left: 45%; color: orange; top: 0">70%</div>
        </div>
    </div>
</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<%--<script>
    var childMonthAge="${sessionScope.childInfo.getMonthAge()}"
</script>--%>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/ion.rangeSlider.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/init7.js?v=1"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>

    $(function () {
        back_listener();
        mui("#demo7").progressbar({progress:70}).show();
    })
</script>
</html>
