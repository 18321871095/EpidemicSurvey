<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="copyright" content="">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <!--html5.js解决目前IE浏览器对HTML5支持的问题,在页面中调用html5.js文件必须添加在页面的head元素内-->
    <script src="${ctx}/login/js/html5.js"></script>

</head>
<body>
<div id="mydiv_school" style="height: 500px;overflow-y: auto;margin: 50 auto;width: 50%;/*border: 1px solid red*/">
    <table class="layui-table" style="margin-top: 0px;">
        <thead>
        <tr>
            <th>文件名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="mytbody">
      <%--  <tr>
            <td>调研纸质说明</td>
            <td>
                <button onclick="downloadFiles(1)"  class="layui-btn layui-btn-sm ">
                    <i class="layui-icon">&#xe605;</i>下载</button>
            </td>
        </tr>--%>
        <tr>
            <td>系统操作说明</td>
            <td>
                <button  onclick="downloadFiles(2)"  class="layui-btn layui-btn-sm ">
                    <i class="layui-icon">&#xe605;</i>下载</button>
            </td>
        </tr>
      <%--<tr>
          <td>2019年学校入园报告</td>
          <td>
              <button  onclick="downloadFiles(2)"  class="layui-btn layui-btn-sm ">
                  <i class="layui-icon">&#xe605;</i>下载</button>
          </td>
      </tr>--%>
     <%--   <tr>
            <td>个人报告查询说明</td>
            <td>
                <button  onclick="downloadFiles(3)"  class="layui-btn layui-btn-sm ">
                    <i class="layui-icon">&#xe605;</i>下载</button>
            </td>
        </tr>--%>
        </tbody>
    </table>
</div>

<script src="${ctx}/static/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
</body>
<script>
    function downloadFiles(num) {
        window.location.href="/backstage/downloadFiles?type=0";
    }
</script>
</html>
