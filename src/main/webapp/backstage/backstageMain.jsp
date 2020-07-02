<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="expires" content="0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="icon" href="${ctx}/static/images/biaozhi.png">
    <link rel="stylesheet" type="text/css" href="${ctx}/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/admin/css/admin.css"/>
</head>
<body>
<div class="main-layout" id='main-layout'>
    <!--侧边栏-->
    <div class="main-layout-side">
        <div class="m-logo">
            数据管理系统
        </div>
        <ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
            <%--4 :管理员--%>
            <c:if test="${sessionScope.LoginInfo.getAuthority()=='100'}">
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/adminSelQus.jsp" data-id='8' data-text="区签到">
                        <i class="iconfont">&#xe606;</i>区域注册列表</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/adminSelSchools.jsp" data-id='1' data-text="学校审核列表">
                        <i class="iconfont">&#xe606;</i>学校审核与注册列表</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/adminCRUDStuInfo.jsp" data-id='11' data-text="修改学生信息">
                        <i class="iconfont">&#xe60b;</i>修改学生信息</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/downloadData.jsp" data-id='12' data-text="下载问卷数据">
                        <i class="iconfont">&#xe60b;</i>下载问卷数据</a>
                </li>
            </c:if>

            <%--学校--%>
       <c:if test="${sessionScope.LoginInfo.getAuthority()=='1'}">
           <c:if test="${sessionScope.LoginInfo.getBiaoshi()=='2' || sessionScope.LoginInfo.getBiaoshi()=='3'}">
               <li class="layui-nav-item">
                   <a href="javascript:;" data-url="${ctx}/backstage/studentList_daban.jsp" data-id='14' data-text="大班学生信息审核">
                       <i class="iconfont">&#xe606;</i>大班学生信息审核</a>
               </li>
           </c:if>
           <c:if test="${sessionScope.LoginInfo.getBiaoshi()=='1' || sessionScope.LoginInfo.getBiaoshi()=='3'}">
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/studentList.jsp" data-id='4' data-text="小班学生信息审核">
                        <i class="iconfont">&#xe606;</i>小班学生信息审核</a>
                </li>
           </c:if>
           <c:if test="${sessionScope.LoginInfo.getBiaoshi()=='2' || sessionScope.LoginInfo.getBiaoshi()=='3'}">
               <li class="layui-nav-item"><%--${ctx}/jsp/backstage/countyProgress.jsp--%>
                   <a href="javascript:;" data-url="${ctx}/backstage/schoolProgress_daban.jsp" data-id='16' data-text="大班问卷完成进度">
                       <i class="iconfont">&#xe60e;</i>大班问卷完成进度</a>
               </li>
           </c:if>
           <c:if test="${sessionScope.LoginInfo.getBiaoshi()=='1' || sessionScope.LoginInfo.getBiaoshi()=='3'}">
                <li class="layui-nav-item"><%--${ctx}/jsp/backstage/countyProgress.jsp--%>
                    <a href="javascript:;" data-url="${ctx}/backstage/schoolProgress.jsp" data-id='6' data-text="小班问卷完成进度">
                        <i class="iconfont">&#xe60e;</i>小班问卷完成进度</a>
                </li>
           </c:if>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/downloadFiles.jsp" data-id='10' data-text="下载专区">
                        <i class="iconfont">&#xe602;</i>工作文档下载</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="${ctx}/backstage/changePwd.jsp" data-id='11' data-text="修改密码">
                        <i class="iconfont">&#xe602;</i>修改密码</a>
                </li>
            </c:if>

                <%--区教委--%>
                <c:if test="${sessionScope.LoginInfo.getAuthority()=='2'}">
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="${ctx}/backstage/adminProgressByArea.jsp" data-id='7' data-text="学校完成进度">
                            <i class="iconfont">&#xe60e;</i>学校完成进度</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="${ctx}/backstage/changePwd.jsp" data-id='12' data-text="修改密码">
                            <i class="iconfont">&#xe602;</i>修改密码</a>
                    </li>
                </c:if>
                <%--上海市--%>
                <c:if test="${sessionScope.LoginInfo.getAuthority()=='3'}">
                    <li class="layui-nav-item"><%--${ctx}/jsp/backstage/countyProgress.jsp--%>
                        <a href="javascript:;" data-url="${ctx}/backstage/adminProgress.jsp" data-id='8' data-text="问卷完成进度">
                            <i class="iconfont">&#xe60e;</i>区完成进度</a>
                    </li>
                </c:if>

        </ul>
    </div>
    <!--右侧内容-->
    <div class="main-layout-container">
        <!--头部-->
        <div class="main-layout-header">
            <ul class="layui-nav" lay-filter="rightNav">
                <li onclick="showSelf()" class="layui-nav-item">
                    <a  href="javascript:;" data-url="" data-id='100' data-text="个人信息">
                        欢迎，${sessionScope.LoginInfo.getName()}登陆！
                    </a>
                </li>
                <li onclick="quit()" class="layui-nav-item"><a href="javascript:;">退出</a></li>
            </ul>
        </div>
        <!--主体内容-->
        <div class="main-layout-body">
            <!--tab 切换-->
            <div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this welcome">后台主页</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show" style="background: #fff;">
                        <!--1-->
                        <iframe src="" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
                        <!--1end-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--遮罩-->
    <div class="main-mask">
    </div>
</div>
</body>
<script type="text/javascript">
    var scope={
        link:'./welcome.html'
    }
</script>
<script src="${ctx}/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/admin/js/main.js" type="text/javascript" charset="utf-8"></script>
<script>
    var main_layer;
    layui.use(['layer'], function(){
        main_layer= layui.layer;
    });
    function showSelf() {
        main_layer.msg("欢迎，${sessionScope.LoginInfo.getName()}登陆！",{offset:'250px'});
    }
    function  quit() {
        main_layer.confirm('是否退系统?', {icon: 3, title:'提示',offset:'250px'}, function(index){
            //do something
            window.location.href="/backstage/tuichu";
        });
    }
</script>
</html>
