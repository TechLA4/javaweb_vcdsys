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
    <title>音响店VCD零售\出租管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/css/login.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />


</head>

<body>
<%--借书规则--%>
<div class="m-login-bg">



</div>


</body>

<script src="<%=path %>/static/layui/layui.js"></script>


<script>


    layui.use([ 'form','jquery','layer' ], function() {
        var form = layui.form,
            layer = layui.layer,
            $= layui.jquery;



    });
</script>
</html>