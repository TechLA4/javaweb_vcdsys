<%--
  Created by IntelliJ IDEA.
  User: 82405
  Date: 2024/6/25
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span> 零售记录 </nav>
<div class="page-container">
    <div class="text-c">
        <form action="VcdServlet?action=findBuyByNameOrId" method="post">
        </form>
    </div>
</div>

</body>
</html>
