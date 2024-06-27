<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<body>
<div class="panel panel-default">
    <div class="panel-header">备份成功</div>
    <div class="panel-body"><button class="btn btn-success size-S radius" onclick="location.href='VcdServlet?action=ToMain'">返回主页面</button></div>



</div>
</body>

</html>