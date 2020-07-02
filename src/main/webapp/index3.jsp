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
    <link href="${ctx}/static/css/mui.poppicker.css" rel="stylesheet">
    <style>
        .mydiv{
            margin: 0 20px;
            border: 2px dotted #666666;
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
            养育环境评价量表
        </div>
    </div>

    <div style="/*border: 1px solid #000;*/width: 100%;height: 74%;overflow-y: auto;">

        <%--index--%>
            <div class="mycontent">
                <div class="timu" style="line-height: 28px;text-indent: 30px;">
                    家庭及社会养育环境被公认为影响儿童早期能力发展中最为重要的因素之一。
                    家庭环境观察测量量表（HOME）是全球最为权威的养育环境测量工具，被翻译成50多种语言，
                    在全世界范围内广泛应用。本研究中使用的儿童养育环境指数问卷是该工具的家长自填问卷版本，
                    通过填写该问卷，家长可以了解在儿童成长中需要重点关注的保护因素和危险因素，
                    并为儿童提供适宜的家庭及社会养育环境。
                </div>
                <div class="timu" style="line-height: 30px;text-indent: 30px;text-decoration: underline;">
                    这部分旨在了解父母/养育者在家的养育情况，我们将对您的信息严格保密，
                    信息只用于综合情况的分析，绝对不会用作个别分析。请根据你和孩子的日常生活情况，回答下面的问题。
                </div>
            </div>

        <%--1--%>
        <div onclick="hideBorder(this)" id="div1" name="1" class="mycontent">
            <div class="timu">1.一周里，你经常和孩子一起玩耍吗? </div>
            <div id="2_1" class="answer"></div>
        </div>
            <%--2--%>
            <div onclick="hideBorder(this)" id="div2" name="2" class="mycontent">
                <div class="timu">2.你经常带孩子一起去购物吗？</div>
                <div id="2_2" class="answer"></div>
            </div>
            <%--3--%>
            <div onclick="hideBorder(this)" id="div3" name="3" class="mycontent">
                <div class="timu">3.你经常给孩子读书吗?</div>
                <div id="2_3" class="answer"></div>
            </div>
            <%--4--%>
            <div onclick="hideBorder(this)" id="div4" name="4" class="mycontent">
                <div class="timu">4.你经常和孩子一起唱歌吗?</div>
                <div id="2_4" class="answer"></div>
            </div>
            <%--5--%>
            <div onclick="hideBorder(this)" id="div5" name="5" class="mycontent">
                <div class="timu">5.你经常和孩子一起去公园或到户外玩吗?</div>
                <div id="2_5" class="answer"></div>
            </div>
            <%--6--%>
            <div onclick="hideBorder(this)" id="div6" name="6" class="mycontent">
                <div class="timu">6.你经常带孩子去到朋友家或者亲戚家找同龄的小伙伴玩吗?</div>
                <div id="2_6" class="answer"></div>
            </div>
            <%--7--%>
            <div onclick="hideBorder(this)" id="div7" name="7" class="mycontent">
                <div class="timu">7.你的配偶或者家人是否经常帮你照看孩子?</div>
                <div id="2_7" class="answer"></div>
            </div>
            <%--8--%>
            <div onclick="hideBorder(this)" id="div8" name="8" class="mycontent">
                <div class="timu">8.你的孩子经常和他/她的爸爸和妈妈一起吃饭吗？</div>
                <div id="2_8" class="answer"></div>
            </div>

            <%--9--%>
            <div onclick="hideBorder(this)" id="div9" name="9" class="mycontent">
                <div class="timu">9.如果你的孩子<span style="text-decoration: underline;">故意</span>把牛奶打翻，你会怎么做？</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>打孩子</label>
                        <input  name="icce9" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>责备孩子</label>
                        <input  name="icce9" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>用其它方式教育孩子</label>
                        <input  name="icce9" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>想办法如何避免下次</label>
                        <input  name="icce9" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>其它</label>
                        <input  name="icce9" type="radio"  value="5">
                    </div>
                    <input id="icce9a" type="text" name="icce9a" readonly="readonly"
                           style="width: 150px;margin-left: 58px;height: 30px" value="" >
                </div>
            </div>
            <%--10--%>
            <div onclick="hideBorder(this)" id="div10" name="10" class="mycontent">
                <div class="timu">10.在过去的一周里，你体罚（打/踢）过孩子几次?</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>无</label>
                        <input  name="icce10" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>1～2次/周</label>
                        <input  name="icce10" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>3～4次/周</label>
                        <input  name="icce10" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>5～6次/周</label>
                        <input  name="icce10" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>几乎每天</label>
                        <input  name="icce10" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <%--11--%>
            <div onclick="hideBorder(this)" id="div11" name="11" class="mycontent">
                <div class="timu">11.你经常和你的配偶讨论孩子的事情吗？</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>很少</label>
                        <input  name="icce11" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>1～3次/每月</label>
                        <input  name="icce11" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>1～2次/每周</label>
                        <input  name="icce11" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>3～4次/每周</label>
                        <input  name="icce11" type="radio"  value="4">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>几乎每天</label>
                        <input  name="icce11" type="radio"  value="5">
                    </div>
                </div>
            </div>

            <%--12--%>
            <div onclick="hideBorder(this)" id="div12"  name="12" class="mycontent">
                <div class="timu">12.有人帮你照看孩子吗? </div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有</label>
                        <input  name="icce12" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>无</label>
                        <input  name="icce12" type="radio"  value="2">
                    </div>
                    <div class="mydiv" id="2_12_div" style="display: none;">
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>配偶</label>
                            <input  name="icce12a" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>爷爷/奶奶</label>
                            <input  name="icce12b" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>外公/外婆</label>
                            <input  name="icce12c" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>朋友</label>
                            <input  name="icce12d" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>亲戚</label>
                            <input  name="icce12e" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>邻居</label>
                            <input  name="icce12f" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>儿童保健专业人员</label>
                            <input  name="icce12g" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>阿姨（被雇佣来照顾孩子的人）</label>
                            <input  name="icce12h" type="checkbox"  >
                        </div>
                    </div>
                </div>
            </div>

            <%--13--%>
            <div  onclick="hideBorder(this)" id="div13" name="13" class="mycontent">
                <div class="timu">13.在照看孩子方面遇到困惑时，是否有人可以咨询?  </div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有</label>
                        <input  name="icce13" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>无</label>
                        <input  name="icce13" type="radio"  value="2">
                    </div>
                    <div id="2_13_child" class="mydiv" style="display: none;">
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>配偶</label>
                            <input  name="icce13a" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>祖父/祖母</label>
                            <input  name="icce13b" type="checkbox" >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>外祖父/外祖母</label>
                            <input  name="icce13c" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>朋友</label>
                            <input  name="icce13d" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>亲戚</label>
                            <input  name="icce13e" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>邻居</label>
                            <input  name="icce13f" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>儿童保健专业人员</label>
                            <input  name="icce13g" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>阿姨</label>
                            <input  name="icce13h" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>幼儿园的负责人</label>
                            <input  name="icce13i" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>幼儿园的老师</label>
                            <input  name="icce13j" type="checkbox"  >
                        </div>
                        <div class="mui-input-row mui-checkbox mui-left">
                            <label>其他</label>
                            <input  name="icce13k" type="checkbox"  >
                        </div>
                    </div>
                </div>
            </div>

            <%--14--%>
            <div onclick="hideBorder(this)" id="div14" name="14" class="mycontent">
                <div class="timu">14.孩子有多少本适合他/她现在年龄阶段的儿童读物或图画书？</div>
                <div  class="answer" style="text-align: center;margin-top: 10px;">
                    <input id="icce17" type="text" name="" readonly="readonly"
                           style="width: 150px;height: 30px" value="" placeholder="请选择" >
                 <%--   <input id="icce17" type="hidden" name="icce17" readonly="readonly"
                           style="width: 150px;height: 30px" value=""  >--%>
                </div>
            </div>

            <%--15--%>
            <div onclick="hideBorder(this)" id="div15" name="15" class="mycontent">
                <div class="timu">15.有时候，照顾孩子的大人因为需要外出买东西、 洗衣服，或其他原因不得不把孩子留在家中。在过去的7天中，</div>
                <div  class="answer" style="text-align: center;">
                    <div class="timu" style="font-size: 15px;">15.1孩子是否被单独留下超过一小时?</div>
                    <div  class="answer">
                        <div class="mui-input-row mui-radio mui-left">
                            <label style="padding-right:0px;padding-left: 0px;">是</label>
                            <input  name="icce18" type="radio"  value="1">
                        </div>
                        <input disabled="disabled" id="icce18a" type="text" name="icce18a" readonly="readonly"
                               style="width: 243px;height: 30px;font-size: 15px;" value="" >
                        <div class="mui-input-row mui-radio mui-left">
                            <label style="padding-right:0px;padding-left: 0px;">否</label>
                            <input  name="icce18" type="radio"  value="0">
                        </div>
                        <div class="mui-input-row mui-radio mui-left">
                            <label style="padding-right:0px;padding-left: 0px;">不知道</label>
                            <input  name="icce18" type="radio"  value="2">
                        </div>
                    </div>
                    <div class="timu" style="font-size: 15px;">15.2孩子是否被留下让另外一个10岁以下儿童照看超过一小时?</div>
                    <div  class="answer">
                        <div class="mui-input-row mui-radio mui-left">
                            <label style="padding-right:0px;padding-left: 0px;">是</label>
                            <input  name="icce19" type="radio"  value="1">
                        </div>
                        <input disabled="disabled" id="icce19a" type="text" name="icce19a" readonly="readonly"
                               style="width: 243px;height: 30px;font-size: 15px;" value="" >
                        <div class="mui-input-row mui-radio mui-left">
                            <label style="padding-right:0px;padding-left: 0px;">否</label>
                            <input  name="icce19" type="radio"  value="0">
                        </div>
                        <div class="mui-input-row mui-radio mui-left">
                            <label style="padding-right:0px;padding-left: 0px;">不知道</label>
                            <input  name="icce19" type="radio"  value="2">
                        </div>
                    </div>
                </div>
            </div>

            <%--16--%>
            <div onclick="hideBorder(this)" id="div16" name="16" class="mycontent">
                <div class="timu">16.成年人会用不同的方式教育儿童，告诉他们什么是正确的行为或如何改正错误行为。
                    在过去的一个月中,您或者您的家人在教育(${sessionScope.childname})时是否采取过如下各种方式。 </div>
                <div  class="answer">
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>取消孩子在家中的特权，拿走他/她喜爱的东西，或者是不准他/她出门</label>
                        <input  name="icce20a" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>向孩子解释为什么他/她的行为是错的</label>
                        <input  name="icce20b" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>动手推或摇晃他/她</label>
                        <input  name="icce20c" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>责骂、批评或吼他/她</label>
                        <input  name="icce20d" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>让他/她做其他的事</label>
                        <input  name="icce20e" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>用手打他/她的屁股</label>
                        <input  name="icce20f" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>用其他东西，例如皮带、梳子、棍子或其他硬物打她/他的屁股或身体其他部位</label>
                        <input  name="icce20g" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>骂他/她傻瓜、懒虫，或其他类似的叫法</label>
                        <input  name="icce20h" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>打他/她的脸部、头部或耳朵</label>
                        <input  name="icce20i" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>打她/他的手、手臂或腿</label>
                        <input  name="icce20j" type="checkbox" >
                    </div>
                    <div class="mui-input-row mui-checkbox mui-left">
                        <label>狠狠地揍过他/她</label>
                        <input  name="icce20k" type="checkbox" >
                    </div>
                </div>
            </div>

            <%--17--%>
            <div onclick="hideBorder(this)" id="div17" name="17" class="mycontent">
                <div class="timu">17.疫情严重时期（1月至3月底），孩子有没有在家里被成年人（包括你）打过，并导致孩子身上留下了擦伤或一些印记?</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>从不</label>
                        <input  name="icce14a" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一次或两次</label>
                        <input  name="icce14a" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有时候</label>
                        <input  name="icce14a" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>经常</label>
                        <input  name="icce14a" type="radio"  value="4">
                    </div>
                </div>
            </div>

            <%--18--%>
            <div onclick="hideBorder(this)" id="div18" name="18" class="mycontent">
                <div class="timu">18.疫情严重时期（1月至3月底），孩子有没有经历过没有足够的东西吃，或者穿脏或破损的衣服?</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>从不</label>
                        <input  name="icce14b" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一次或两次</label>
                        <input  name="icce14b" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有时候</label>
                        <input  name="icce14b" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>经常</label>
                        <input  name="icce14b" type="radio"  value="4">
                    </div>
                </div>
            </div>

            <%--19--%>
            <div onclick="hideBorder(this)" id="div19" name="19" class="mycontent">
                <div class="timu">19. 疫情严重时期（1月至3月底），孩子有没有被骂过像愚蠢、白痴、笨蛋、没用之类的话，或者被某人大吼、尖叫?</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>从不</label>
                        <input  name="icce14c" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一次或两次</label>
                        <input  name="icce14c" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有时候</label>
                        <input  name="icce14c" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>经常</label>
                        <input  name="icce14c" type="radio"  value="4">
                    </div>
                </div>
            </div>

            <%--20--%>
            <div onclick="hideBorder(this)" id="div20" name="20" class="mycontent">
                <div class="timu">20.疫情严重时期（1月至3月底），有没有人对孩子做过和性有关的事，或者如果孩子拒绝就威胁要伤害孩子？</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>从不</label>
                        <input  name="icce14d" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一次或两次</label>
                        <input  name="icce14d" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有时候</label>
                        <input  name="icce14d" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>经常</label>
                        <input  name="icce14d" type="radio"  value="4">
                    </div>
                </div>
            </div>

            <%--21--%>
            <div onclick="hideBorder(this)" id="div21" name="21" class="mycontent">
                <div class="timu">21.在您的孩子成长过程中，孩子的父母是否因家庭矛盾而分居或离婚？</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>有</label>
                        <input  name="icce15" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>没有</label>
                        <input  name="icce15" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>拒绝回答</label>
                        <input  name="icce15" type="radio"  value="3">
                    </div>
                </div>
            </div>

            <%--22--%>
            <div onclick="hideBorder(this)" id="div22" name="22" class="mycontent">
                <div class="timu">22.和其他孩子相比，您会怎么描述您孩子的身体健康？</div>
                <div  class="answer">
                    <div class="mui-input-row mui-radio mui-left">
                        <label>很好</label>
                        <input  name="icce16" type="radio"  value="1">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>好</label>
                        <input  name="icce16" type="radio"  value="2">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>一般</label>
                        <input  name="icce16" type="radio"  value="3">
                    </div>
                    <div class="mui-input-row mui-radio mui-left">
                        <label>不好</label>
                        <input  name="icce16" type="radio"  value="4">
                    </div>
                </div>
            </div>











            <div class="mycontent">
                <div style="color: #086CFF;text-indent: 30px;line-height: 28px;padding: 5px 10px;">
                    儿童养育环境指数问卷中评价了宝宝养育过程中的家庭成员交流、社会环境交互、育儿支持和回避惩罚这几个维度的情况，
                    其中，家庭成员与宝宝之间良好有效的互动和交流是父母帮助孩子充分挖掘发展潜能的最重要途径之一。
                    接下来要填写的亲子活动问卷，每一个填写项目都对亲子活动有很好的指导意义，请家长根据实际情况认真填写。
                </div>
            </div>

        <%--提交--%>
        <div  style="text-align: center;">
            <button id="tijiao3" style="width: 80%;background: #4cd964;border: 1px solid #4cd964;color: #fff;font-size: 16px;">
                提交
            </button>
        </div>

    </div>

    <div style="border:  1px solid #007aff;width: 100%;height: 20px;margin-top: 5px;">
        <div id="demo3" class="mui-progressbar" style="height: 18px;background: #fff;">
            <span></span>
            <div style="position: absolute; left: 45%; color: orange; top: 0">30%</div>
        </div>
    </div>

</div>

<%--<span style="float: right;padding-right: 10px">保存答案</span>--%>
</body>
<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/js/mui.min.js"></script>
<script src="${ctx}/static/js/mui.picker.js"></script>
<script src="${ctx}/static/js/mui.poppicker.js"></script>
<script src="${ctx}/static/js/muikuozhan.js"></script>
<script src="${ctx}/static/js/init3.js?v=123"></script>
<script src="${ctx}/static/js/Util.js"></script>
<script>
    $(function () {
        back_listener();
        mui("#demo3").progressbar({progress:30}).show();
        $("[name='icce9']").click(function () {
            if($(this).val()=='5'){
                $("#icce9a").val("").css("border","1px solid red")
                    .removeAttr("readonly").attr("placeholder","请填写");
            }else{
                $("#icce9a").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("readonly","readonly").removeAttr("placeholder");
            }

        });
        $("[name='icce12']").click(function () {
           if($(this).val()=='1'){
               $("#2_12_div").show().find("input[type='checkbox']").prop("checked",false);

           }else{
               $("#2_12_div").hide().find("input[type='checkbox']").prop("checked",false);

           }
        });
        $("[name='icce13']").click(function () {
            if($(this).val()=='1'){
                $("#2_13_child").show().find("input[type='checkbox']").prop("checked",false);
            }else{
                $("#2_13_child").hide().find("input[type='checkbox']").prop("checked",false);
            }
        });
        var tuhsu=[];
        for(var i=0;i<=10;i++){
            var temp={};
            if(i==10){
                temp["text"]="10本及以上";
                temp["value"]="10";
            }else if(i==0){
                temp["text"]="没有";
                temp["value"]="0";
            }
            else{
                temp["text"]=i+"本";
                temp["value"]=i+"";
            }
            tuhsu.push(temp);
        }
        $("#icce17").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData(tuhsu);
            userPicker.show(function (selectItems) {
                $("#icce17").val(selectItems[0].text);
                $("#icce17").attr("name",selectItems[0].value);
                userPicker.dispose();
            });
        });
        $("[name='icce18']").click(function () {
            if($(this).val()=='1'){
                $("#icce18a").val("").css("border","1px solid red")
                    .removeAttr("disabled").attr("placeholder","请选择单独留下超过一小时天数");
            }else{
                $("#icce18a").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("disabled","disabled").removeAttr("placeholder");
            }
        });
        $("#icce18a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([{"text":"1","value":"1"},{"text":"2","value":"2"},{"text":"3","value":"3"},
                {"text":"4","value":"4"},{"text":"5","value":"5"},{"text":"6","value":"6"},{"text":"7","value":"7"}]);
            userPicker.show(function (selectItems) {
                $("#icce18a").val(selectItems[0].text);
                userPicker.dispose();
            });
        });
        $("[name='icce19']").click(function () {
            if($(this).val()=='1'){
                $("#icce19a").val("").css("border","1px solid red")
                    .removeAttr("disabled").attr("placeholder","请选择天数");
            }else{
                $("#icce19a").val("").css("border","1px solid rgba(0,0,0,.2)")
                    .attr("disabled","disabled").removeAttr("placeholder");
            }
        });
        $("#icce19a").click(function () {
            var userPicker = new mui.PopPicker();
            userPicker.setData([{"text":"1","value":"1"},{"text":"2","value":"2"},{"text":"3","value":"3"},
                {"text":"4","value":"4"},{"text":"5","value":"5"},{"text":"6","value":"6"},{"text":"7","value":"7"}]);
            userPicker.show(function (selectItems) {
                $("#icce19a").val(selectItems[0].text);
                userPicker.dispose();
            });
        });

    })
</script>
</html>
