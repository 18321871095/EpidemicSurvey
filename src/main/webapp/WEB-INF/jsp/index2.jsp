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
    <link href="${ctx}/static/css/muikuozhan.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.picker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.dtpicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/mui.poppicker.css" rel="stylesheet">
    <style>
        .ul_input{
            border-top: none;
            border-right: none;
            border-left: none;
            text-align: center;
        }
        .mydiv{
            margin: 0 20px;
            border: 2px dotted #666666;
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
            疫情期间相关
        </div>
    </div>
    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">
        <%--index--%>
            <div  class="mycontent">
                <div class="timu" style="line-height: 28px;text-indent: 30px;">
                    以下问题是关于您和孩子在疫情一级响应期间（1月24日至3月24日之间）的情况，请根据实际情况填写。
                    <br>
                </div>
            </div>
            <div id="div1" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">1.疫情严重时期（1月至3月底），参与孩子照顾和教育的家庭成员有哪些（多选）？</div>
                <div class="answer">
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>父亲</label>
                        <input  name="care4a" type="checkbox"  >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>母亲</label>
                        <input  name="care4b" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>祖父/祖母</label>
                        <input  name="care4c" type="checkbox"  >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>外公/外婆</label>
                        <input  name="care4d" type="checkbox"  >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>哥哥/姐姐</label>
                        <input  name="care4e" type="checkbox"  >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>保姆</label>
                        <input  name="care4f" type="checkbox"  >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>其他人</label>
                        <input  name="care4g" type="checkbox"  >
                    </div>
                    <input id="care4g1" type="text" name="care4g1" readonly="readonly"
                           style="width: 150px;margin-left: 58px;height: 30px" value="" >
                </div>
            </div>

            <div  id="div2" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">2.疫情严重时期（1月至3月底），孩子的主要照护人是（主要照护人是指照顾孩子时间最长的家人）</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>母亲</label>
                        <input  name="care1" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>父亲</label>
                        <input  name="care1" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>爷爷、奶奶、外公、外婆</label>
                        <input  name="care1" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>其他人</label>
                        <input  name="care1" type="radio"  value="4">
                    </div>
                    <input id="care1_input" type="text" name="care1a" readonly="readonly"
                           style="width: 150px;margin-left: 58px;height: 30px" value="" >
                </div>
            </div>

            <div  id="div3" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">3.请问疫情期间孩子的主要照护人受教育程度？</div>
                <div id="1_3"  class="answer"></div>
            </div>

            <div  id="div4" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">4.您全家过去6个月收入有怎样的变化？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没有变化</label>
                        <input  name="cov4" type="radio"  value="0">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>增加</label>
                        <input  name="cov4" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>减少</label>
                        <input  name="cov4" type="radio"  value="2">
                    </div>
                    <div id="4_div" onclick="hideBorder(this)" style="display: none;" class="mydiv">
                        <div class="timu">4.1.您全家过去6个月收入减少的程度为？</div>
                        <div id="4_div_1"  class="answer" style="text-align: center;">
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">明显减少</label>
                                <input  name="cov4a" type="radio"  value="1">
                            </div>
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">稍微减少</label>
                                <input  name="cov4a" type="radio"  value="0">
                            </div>
                        </div>
                        <div class="timu">4.2.您全家过去6个月收入减少是否影响生活？</div>
                        <div id="4_div_2"  class="answer" style="text-align: center;">
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">非常大</label>
                                <input  name="cov4b" type="radio"  value="4">
                            </div>
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">比较大</label>
                                <input  name="cov4b" type="radio"  value="3">
                            </div>
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">一般</label>
                                <input  name="cov4b" type="radio"  value="2">
                            </div>
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">比较小</label>
                                <input  name="cov4b" type="radio"  value="1">
                            </div>
                            <div class="mui-input-row mui-radio mui-left">
                                <label style="text-align: left;">非常小</label>
                                <input  name="cov4b" type="radio"  value="0">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div  id="div5" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">5.疫情严重时期（1月至3月底），父母陪伴孩子的时间有怎样的变化？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著增多</label>
                        <input  name="cov5" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>增多</label>
                        <input  name="cov5" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没有变化</label>
                        <input  name="cov5" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>减少</label>
                        <input  name="cov5" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著减少</label>
                        <input  name="cov5" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div6" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">6.疫情严重时期（1月至3月底），孩子主要通过哪些途径和同龄孩子交流互动？（多选）</div>
                <div class="answer">
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>几乎没有</label>
                        <input  name="cov6a" type="checkbox"  >
                    </div>

                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>与家里的其他孩子一起玩耍</label>
                        <input  name="cov6b" type="checkbox" >
                    </div>


                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>校外机构网络课程</label>
                        <input  name="cov6c" type="checkbox"  >
                    </div>
                    <div id="6_1_div" onclick="hideBorder(this)" style="text-align: center;display: none;">
                        频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov6aa_input"  type="text" name="cov6aa"  placeholder="请填写"
                                   style="width: 83px;height: 30px" value=""  >次/
                        <input id="cov6ab_input_temp" type="text" name="cov6ab_input" readonly="readonly"  placeholder="请选择"
                               style="width: 85px;height: 30px" value="" >
                        <input id="cov6ab_input" type="text" name="cov6ab" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    </div>

                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>家庭或朋友聚会，小区内与同伴一起玩</label>
                        <input  name="cov6d" type="checkbox"  >
                    </div>
                    <div id="6_2_div" onclick="hideBorder(this)" style="text-align: center;display: none;">
                        频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov6da_input" type="text" name="cov6da"  placeholder="请填写"
                                   style="width: 83px;height: 30px" value="" >次/
                        <input id="cov6db_input_temp" type="text" name="cov6db_input" readonly="readonly"  placeholder="请选择"
                               style="width: 85px;height: 30px" value="" >
                        <input id="cov6db_input" type="text" name="cov6db" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    </div>

                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>使用手机与同伴聊天</label>
                        <input  name="cov6e" type="checkbox"  >
                    </div>
                    <div id="6_3_div" onclick="hideBorder(this)" style="text-align: center;display: none;">
                        频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov6ea_input" type="text" name="cov6ea"  placeholder="请填写"
                                   style="width: 83px;height: 30px" value="" >次/
                        <input id="cov6eb_input_temp" type="text" name="cov6eb_input" readonly="readonly"  placeholder="请选择"
                               style="width: 85px;height: 30px" value="" >
                        <input id="cov6eb_input" type="text" name="cov6eb" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    </div>

                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>线上游戏</label>
                        <input  name="cov6f" type="checkbox"  >
                    </div>
                    <div id="6_4_div" onclick="hideBorder(this)" style="text-align: center;display: none;">
                        频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov6fa_input" type="text" name="cov6fa"  placeholder="请填写"
                                   style="width: 83px;height: 30px" value="" >次/
                        <input id="cov6fb_input_temp" type="text" name="cov6fb_input" readonly="readonly"  placeholder="请选择"
                               style="width: 85px;height: 30px" value="" >
                        <input id="cov6fb_input" type="text" name="cov6fb" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    </div>

                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>其他</label>
                        <input  name="cov6g" type="checkbox"  >
                    </div>
                    <input id="cov6gc_input" type="text" name="cov6gc" readonly="readonly"
                           style="width: 150px;margin-left: 58px;height: 30px" value="" >
                    <div id="6_5_div" onclick="hideBorder(this)" style="text-align: center;display: none;">
                        频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov6ga_input" type="text" name="cov6ga"  placeholder="请填写"
                                   style="width: 83px;height: 30px" value="" >次/
                        <input id="cov6gb_input_temp" type="text" name="cov6gb_input" readonly="readonly"  placeholder="请选择"
                               style="width: 85px;height: 30px" value="" >
                        <input id="cov6gb_input" type="text" name="cov6gb" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    </div>
                </div>
            </div>

            <div  id="div7" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">7.疫情严重时期（1月至3月底），您认为孩子的睡眠时间有怎样的变化？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著增多</label>
                        <input  name="cov7" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>增多</label>
                        <input  name="cov7" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没有变化</label>
                        <input  name="cov7" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>减少</label>
                        <input  name="cov7" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著减少</label>
                        <input  name="cov7" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div8" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">8.疫情严重时期（1月至3月底），您认为孩子的睡眠质量有怎样的变化？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著变好</label>
                        <input  name="cov8" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>变好</label>
                        <input  name="cov8" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没有变化</label>
                        <input  name="cov8" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>变差</label>
                        <input  name="cov8" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著变差</label>
                        <input  name="cov8" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div9" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">9.疫情严重时期（1月至3月底），您认为孩子的作息规律吗？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>非常不规律</label>
                        <input  name="cov9" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>比较不规律</label>
                        <input  name="cov9" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一般</label>
                        <input  name="cov9" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>比较规律</label>
                        <input  name="cov9" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>非常规律</label>
                        <input  name="cov9" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div10" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">10.疫情严重时期（1月至3月底），您认为孩子使用屏幕（包括电视、电脑、手机、iPad）的时间有怎样的变化？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著增多</label>
                        <input  name="cov10" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>增多</label>
                        <input  name="cov10" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没有变化</label>
                        <input  name="cov10" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>减少</label>
                        <input  name="cov10" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>显著减少</label>
                        <input  name="cov10" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div11" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">11.疫情严重时期（1月至3月底），您是否担心孩子使用屏幕（包括电视、电脑、手机、iPad）？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>非常担心</label>
                        <input  name="cov11" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>比较担心</label>
                        <input  name="cov11" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一般 </label>
                        <input  name="cov11" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有点担心</label>
                        <input  name="cov11" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>基本不担心</label>
                        <input  name="cov11" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div12" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">12.疫情严重时期（1月至3月底），您是否限制孩子使用屏幕（包括电视、电脑、手机、iPad）的时间和/或内容？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>是</label>
                        <input  name="cov12" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>否</label>
                        <input  name="cov12" type="radio"  value="0">
                    </div>
                </div>
            </div>

            <div  id="div13" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">13.疫情严重时期（1月至3月底），孩子户外活动的频率和时间：</div>
                <div class="answer" style="text-align: center;">
                        频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov13_input" type="text" name="cov13"  placeholder="请填写"
                                   style="width: 85px;height: 30px" value="" >次/
                        <input id="cov13a_input_temp" type="text" name="cov13a_input" readonly="readonly"  placeholder="请选择"
                               style="width: 85px;height: 30px" value="" >
                        <input id="cov13a_input" type="text" name="cov13a" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    <br/>
                    <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov13bh_input_temp" type="text" name="cov13bh_input"   placeholder="请填写"
                           style="width: 90px;height: 30px" value="" >小时
                    <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov13bm_input_temp" type="text" name="cov13bm_input"   placeholder="请填写"
                           style="width: 90px;height: 30px" value="" >分钟/次
                </div>
            </div>

            <div  id="div14" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">14.疫情严重时期（1月至3月底），<span style="text-decoration: underline">孩子</span>最长有多久没有出门？ </div>
                <div class="answer" style="text-align: center;">
                    <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov14_input" type="text" name="cov14"   placeholder="请填写"
                           style="width: 60%" value="" >天
                </div>
            </div>

            <div  id="div15" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">15.孩子或家庭成员是否因新冠而被隔离过（不包括自我隔离）？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>是</label>
                        <input  name="cov15" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>否</label>
                        <input  name="cov15" type="radio"  value="0">
                    </div>
                </div>
                <div id="15_div" onclick="hideBorder(this)" style="display: none;margin-left: 20px;">
                    <div class="timu">15.1.隔离的原因是：</div>
                    <div class="answer">
                        <div class="mui-input-row mui-radio mui-left">
                            <label>确诊患者</label>
                            <input  name="cov15a" type="radio"  value="1">
                        </div>
                        <div class="mui-input-row mui-radio mui-left">
                            <label>密切接触者</label>
                            <input  name="cov15a" type="radio"  value="2">
                        </div>
                        <div class="mui-input-row mui-radio mui-left">
                            <label>其他</label>
                            <input  name="cov15a" type="radio"  value="3">
                        </div>
                        <input id="cov15b_input" type="text" name="cov15b" readonly="readonly"
                               style="width: 150px;margin-left: 58px;height: 30px" value="" >
                    </div>
                    <div class="timu">15.2.是谁被隔离？</div>
                    <div class="answer">
                        <input id="cov15c_input" type="text" name="cov15c" placeholder="请填写"
                               style="width: 150px;margin-left: 58px;height: 30px" value="" >
                    </div>
                </div>
            </div>

            <div  id="div16" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">16.疫情严重时期（1月至3月底），您有多么担心自己和家人感染新冠肺炎？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>非常担心</label>
                        <input  name="cov16" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>比较担心</label>
                        <input  name="cov16" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一般</label>
                        <input  name="cov16" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有点担心</label>
                        <input  name="cov16" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>基本不担心</label>
                        <input  name="cov16" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div17" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">17.疫情期间，<span style="text-decoration: underline">您觉得孩子</span>有多么担心感染新冠肺炎？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>非常担心</label>
                        <input  name="cov17" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>比较担心</label>
                        <input  name="cov17" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一般</label>
                        <input  name="cov17" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有点担心</label>
                        <input  name="cov17" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>基本不担心</label>
                        <input  name="cov17" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <div  id="div18" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">18.疫情严重时期（1月至3月底），您或家人是否和孩子讨论过疫情</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>讨论过</label>
                        <input  name="cov18" type="radio"  value="1">
                    </div>
                    <div id="18_div" style="margin-left: 20px;display: none;">
                        讨论疫情的频率是 <input oninput="this.value = this.value.replace(/[^0-9]/g, '');" id="cov18a_input" type="text" name="cov18a"  placeholder="请填写"
                                   style="width: 90px;height: 30px" value="" >次/
                        <input id="cov18b_input_temp" type="text" name="cov18b_input" readonly="readonly"  placeholder="请选择"
                               style="width: 66px;height: 30px" value="" >
                        <input id="cov18b_input" type="text" name="cov18b" readonly="readonly"  placeholder="请选择"
                               style="display: none;" value="" >
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没讨论过</label>
                        <input  name="cov18" type="radio"  value="2">
                    </div>
                </div>
            </div>

            <div  id="div19" onclick="hideBorder(this)" class="mycontent">
                <div class="timu">19.<span style="text-decoration: underline">孩子</span>6月2日以来是否去上幼儿园？</div>
                <div class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>是</label>
                        <input  name="cov19" type="radio"  value="1">
                    </div>
                        <div id="19_div_1" style="margin-left: 20px;display: none;text-align: center;">
                            孩子哪一天开始上幼儿园<br/>
                            <input type='text' id="cov19a" name="cov19a" style="width: 62%;" readonly="readonly" placeholder="请选择日期" >
                        </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>否</label>
                        <input  name="cov19" type="radio"  value="0">
                    </div>
                        <div id="19_div_2" style="margin-left: 20px;display: none;text-align: center;">
                            打算让孩子哪一天开始上幼儿园<br/>
                            <input type='text' id="cov19b" name="cov19b" style="width: 62%;" readonly="readonly" placeholder="请选择日期" >
                        </div>
                </div>
            </div>

        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao2" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>


</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.dtpicker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/init2.js?v=6"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();

        $("[name='care4g']").click(function () {
            if($(this).is(":checked")){
                $("#care4g1").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#care4g1").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }

        });
        $("[name='cov6a']").click(function () {
            if($(this).is(":checked")){
                $("#div6").find("input[type='checkbox']").each(function () {
                    if($(this).attr("name")!='cov6a'){
                        $(this).prop("checked",false);
                        $(this).attr("disabled",true);
                    }
                });
            }else{
                $("#div6").find("input[type='checkbox']").each(function () {
                    if($(this).attr("name")!='cov6a') {
                        $(this).prop("checked", false);
                        $(this).attr("disabled",false );
                    }
                });
            }
            $("#6_1_div").hide().find("input[type='text']").val("");
            $("#6_2_div").hide().find("input[type='text']").val("");
            $("#6_3_div").hide().find("input[type='text']").val("");
            $("#6_4_div").hide().find("input[type='text']").val("");
            $("#6_5_div").hide().find("input[type='text']").val("");
            $("#cov6gc_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                .attr("readonly","readonly").removeAttr("placeholder");
        });
        $("[name='care1']").click(function () {
            if($(this).val()=='4'){
                $("#care1_input").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
                $("#div3").show().find("input[type='radio']").prop("checked",false);
            }else{
                $("#care1_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
                if($(this).val()!='3'){
                    $("#div3").hide().find("input[type='radio']").prop("checked",false);
                }else{
                    $("#div3").show().find("input[type='radio']").prop("checked",false);
                }
            }

        });

        $("[name='cov4']").click(function () {
            if($(this).val()=='2'){
                $("#4_div").show().find("input[type='radio']").prop("checked",false);
            }else{
                $("#4_div").hide().find("input[type='radio']").prop("checked",false);
            }
        });

        $("[name='cov6c']").click(function () {
            if($(this).is(":checked")){
                $("#6_1_div").show().find("input[type='text']").val("");
            }else{
                $("#6_1_div").hide().find("input[type='text']").val("");
            }
        });
        $("[name='cov6d']").click(function () {
            if($(this).is(":checked")){
                $("#6_2_div").show().find("input[type='text']").val("");
            }else{
                $("#6_2_div").hide().find("input[type='text']").val("");
            }
        });
        $("[name='cov6e']").click(function () {
            if($(this).is(":checked")){
                $("#6_3_div").show().find("input[type='text']").val("");
            }else{
                $("#6_3_div").hide().find("input[type='text']").val("");
            }
        });
        $("[name='cov6f']").click(function () {
            if($(this).is(":checked")){
                $("#6_4_div").show().find("input[type='text']").val("");
            }else{
                $("#6_4_div").hide().find("input[type='text']").val("");
            }
        });
        $("[name='cov6g']").click(function () {
            if($(this).is(":checked")){
                $("#6_5_div").show().find("input[type='text']").val("");
                $("#cov6gc_input").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#6_5_div").hide().find("input[type='text']").val("");
                $("#cov6gc_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }
        });

        $("[name='cov15']").click(function () {
            if($(this).val()=='1'){
                $("#15_div").show().find("input[type='radio']").prop("checked",false);
            }else{
                $("#15_div").hide().find("input[type='radio']").prop("checked",false);
            }
            $("#cov15b_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                .attr("readonly","readonly").removeAttr("placeholder");
        });

        $("[name='cov15a']").click(function () {
            if($(this).val()=='3'){
                $("#cov15b_input").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#cov15b_input").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }

        });
        $("[name='cov18']").click(function () {
            if($(this).val()=='1'){
                $("#18_div").show();
            }else{
                $("#18_div").hide();
            }
            $("#cov18a_input").val("");
            $("#cov18b_input_temp").val("");
            $("#cov18b_input").val("");

        });
        $("[name='cov19']").click(function () {
            if($(this).val()=='1'){
                $("#19_div_1").show();
                $("#19_div_2").hide();
            }else{
                $("#19_div_1").hide();
                $("#19_div_2").show();
            }
            $("#cov19a").val("");
            $("#cov19b").val("");
        });

        $("#cov6ab_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov6ab_input_temp").val(selectItems[0].text);
                $("#cov6ab_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });

        $("#cov6db_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov6db_input_temp").val(selectItems[0].text);
                $("#cov6db_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });
        $("#cov6eb_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov6eb_input_temp").val(selectItems[0].text);
                $("#cov6eb_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });
        $("#cov6fb_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov6fb_input_temp").val(selectItems[0].text);
                $("#cov6fb_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });
        $("#cov6gb_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov6gb_input_temp").val(selectItems[0].text);
                $("#cov6gb_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });
        $("#cov13a_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov13a_input_temp").val(selectItems[0].text);
                $("#cov13a_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });
        $("#cov18b_input_temp").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([
                {
                    value: '1',
                    text: '每月'
                },
                {
                    value: '2',
                    text: '每周'
                },
                {
                    value: '3',
                    text: '每天'
                }
            ]);
            userPicker.show(function (selectItems) {
                $("#cov18b_input_temp").val(selectItems[0].text);
                $("#cov18b_input").val(selectItems[0].value);
                userPicker.dispose();

            });
        });

        $("#cov19a").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2020 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='cov19a']").val(date);
                }else{
                    $("[name='cov19a']").val("");
                    alert("日期不能大于当前时间");
                }
                dtPicker.dispose();
            })
        });
        $("#cov19b").click(function () {
            var dtPicker = new mui.DtPicker({ type: 'date',beginYear:1991,endYear:2021 });
            dtPicker.show(function (selectItems) {
                var y = selectItems.y.text;  //获取选择的年
                var m = selectItems.m.text;  //获取选择的月
                var d = selectItems.d.text;  //获取选择的日
                var date = y + "-" + m + "-" + d;
                if(checkTime(y + "-" + m + "-" + d )){
                    $("[name='cov19b']").val("");
                    alert("日期不能小于当前时间");
                }else{
                    $("[name='cov19b']").val(date);
                }
                dtPicker.dispose();
            })
        });

    });

    function checkTime(paramTime) {
        var param=new Date(paramTime.replace(/-/g,"/"));
        var currentTime=new Date();
        //js判断日期
        if(param-currentTime>0){
            return false;
        }else{
            return true;
        }

    }

</script>
</html>
