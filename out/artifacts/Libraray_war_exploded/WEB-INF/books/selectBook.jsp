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
    <%--<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/login.css" />--%>
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />


</head>

<body>
<%--借书规则--%>
<div class="m-login-bg">

    <div>
        <ul class="layui-nav" lay-filter="">
            <%--默认在首页--%>
            <li class="layui-nav-item"><a href="LoginServlet?action=loginOut">首页</a></li>
            <li class="layui-nav-item"><a href="StudentServlet?action=toBorrow">借阅规则</a></li>
            <li class="layui-nav-item layui-this"><a href="">查询图书</a></li>
            <li class="layui-nav-item"><a href="StudentServlet?action=toTsgjj">图书馆简介</a></li>
            <%--点击我的图书馆跳转登陆页面，进行登陆--%>
            <li class="layui-nav-item"><a href="LoginServlet?action=loginOut">我的图书馆</a></li>
        </ul>
    </div>

    <div class="m-login" style="width: 80%;height: 100%">
        <form class="layui-form" action="BookServlet?action=findByMap" method="post" style="width: 50%;padding-left: 39%;padding-top: 6%">
            <div class="layui-form-item">
                <label class="layui-form-label">编号</label>
                <div class="layui-input-block">
                    <input type="bookNo" name="bookNo" required  lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">书名</label>
                <div class="layui-input-block">
                    <input type="name" name="name" required lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">作者</label>
                <div class="layui-input-block">
                    <input type="text" name="auth" required  lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item m-login-btn">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" type="submit">查询</button>
                </div>
            </div>
        </form>
    </div>
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