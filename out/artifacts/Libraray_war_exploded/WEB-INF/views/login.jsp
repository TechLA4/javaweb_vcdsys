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
            <li class="layui-nav-item"><a href="StudentServlet?action=toBorrow">借阅规则</a></li>
            <li class="layui-nav-item"><a href="BookServlet?action=toBorrow">查询图书</a></li>
            <li class="layui-nav-item"><a href="StudentServlet?action=toTsgjj">图书馆简介</a></li>
                <%--点击我的图书馆跳转登陆页面，进行登陆--%>
            <li class="layui-nav-item"><a href="LoginServlet?action=loginOut">我的图书馆</a></li>
        </ul>
    </div>
    <div class="m-login">
        <h3>图书馆管理系统</h3>
        <div class="m-login-warp">
            <form class="layui-form"  action="LoginServlet?action=login" method="post">
                <div class="layui-form-item">


                    <input type="text" name="username" id="username" placeholder="请输入学号/用户名" autocomplete="off" class="layui-input">
                    <span style="color:red;" >${msg}</span>
                    <span style="color:red;" id="msg"></span>
                </div>
                <div class="layui-form-item">
                    <input type="text" name="pwd" id="pwd"   placeholder="密码" autocomplete="off" class="layui-input">

                </div>
                <div class="layui-form-item" style="text-align: center">
                    &emsp;    &emsp;
                    <input type="radio" name="type"  value="1" title="学生" checked="">
                    <input type="radio" name="type"  value="2"  title="管理员">

                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" id="login" type="submit">登录</button>
                    </div>
                    <div class="layui-inline">
                        <button type="button" onclick="location.href='StudentServlet?action=toRegiste'" class="layui-btn layui-btn-normal" >注册</button>


                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 源码客栈-逍遥游 2021年4月 </p>
    </div>
</div>


</body>

<script src="<%=path %>/static/layui/layui.js"></script>


<script>


    layui.use([ 'form','jquery','layer' ], function() {
        var form = layui.form,
            layer = layui.layer,
            $= layui.jquery;

        $("#login").on("click", function() {
            var username = $("#username").val().trim(); // trim()去除空格
            var pwd = $("#pwd").val().trim();

            if(!username) {
                $("#msg").html("用户名不能为空！");
                $("#username").focus(); // 聚焦
                return false;
            } else {
                if(!pwd) {
                    $("#msg").html("密码不能为空！");
                    $("#password").focus(); // 聚焦
                    return false;
                } else {
                    $("#msg").html("");
                }
            }
        });

    });
</script>
</html>