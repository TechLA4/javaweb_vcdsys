<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>图书馆管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/css/login.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />


</head>

<body>

<div class="m-login-bg">
    <div>
        <ul class="layui-nav" lay-filter="">
            <%--默认在首页--%>
            <li class="layui-nav-item layui-this"><a href="LoginServlet?action=loginOut">首页</a></li>
            <li class="layui-nav-item"><a href="BorrowServlet?action=toBorrow">借阅规则</a></li>
            <li class="layui-nav-item"><a href="">查询图书</a></li>
            <li class="layui-nav-item"><a href="">图书馆简介</a></li>
                <%--点击我的图书馆跳转登陆页面，进行登陆--%>
            <li class="layui-nav-item"><a href="LoginServlet?action=loginOut">我的图书馆</a></li>
        </ul>
    </div>

</div>


</body>

<script src="<%=path %>/static/layui/layui.js"></script>

</html>