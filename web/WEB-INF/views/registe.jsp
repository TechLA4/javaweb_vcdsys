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

<div class="m-login-bg">
    <div class="m-login">
        <h3>用户注册</h3>
        <div class="m-login-warp">
            <span style="color:red;" >${msg}</span>
            <span style="color:red;" id="msg"></span>
            <form class="layui-form"  action="CustomerServlet?action=registe" method="post">

                <div class="layui-form-item">
                    <input type="text" name="stuno" id="stuno" placeholder="请输入用户编号" value="${stuno}" autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <input type="text" name="realname" id="realname"   placeholder="请输入真实姓名" value="${realname}"  autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <input type="text" name="pwd" id="pwd"   placeholder="密码" autocomplete="off" value="${pwd}"  class="layui-input">
                </div>
                <%--<div class="layui-form-item">--%>
                    <%--<input type="text" name="major" id="major"   placeholder="请输入专业" value="${major}"  autocomplete="off" class="layui-input">--%>
                <%--</div>--%>

                <%--<div class="layui-form-item">--%>
                    <%--<input type="text" name="bj" id="bj"   placeholder="请输入班级" value="${bj}"  autocomplete="off" class="layui-input">--%>
                <div class="layui-form-item">
                    <input type="text" name="phone" id="phone"   placeholder="请输入手机号码" value="${phone}"  autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <input type="radio" name="type" value="男" title="男"  checked>
                    <input type="radio" name="type" value="女" title="女">
                </div>

                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" id="registe" type="submit">注册</button>
                    </div>
                    <div class="layui-inline">
                        <button type="button" onclick="location.href='LoginServlet?action=toLogin'" class="layui-btn layui-btn-primary">去登录</button>
                    </div>
                </div>
            </form>

        </div>

    </div>
        <p class="copyright">Copyright 2024 </p>
</div>




<script src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use([ 'form','jquery','layer' ], function() {
        var form = layui.form,
            layer = layui.layer,
            $= layui.jquery;
        $("#registe").on("click", function() {
            var stuno = $("#stuno").val().trim(); // trim()去除空格
            var realname = $("#realname").val().trim(); // trim()去除空格
            var pwd = $("#pwd").val().trim();
            // var bj = $("#bj").val().trim();
            // var major = $("#major").val().trim();
            var phone = $("#phone").val().trim();


            if(!stuno) {
                $("#msg").html("编号不能为空！");
                $("#stuno").focus(); // 聚焦
                return false;
            } else  if(!realname){
                $("#msg").html("真实姓名不能为空！");
                $("#realname").focus(); // 聚焦
                return false;
            } else  if(!pwd){
                $("#msg").html("密码不能为空！");
                $("#password").focus(); // 聚焦
                return false;

            }else if(!phone){
                $("#msg").html("手机号码不能为空！");
                $("#phone").focus(); // 聚焦
                return false;
            }
            else if(!(/^1[34578]\d{9}$/.test(phone)))
            {
                $("#msg").html("请输入正确的电话号码格式！");
                return false;
            }
        });

     /*   $("#registe").on("click", function() {
            var stuno = $("#stuno").val().trim();
            var relaname = $("#relaname").val().trim(); // trim()去除空格
            var pwd = $("#pwd").val().trim();
            var bj = $("#bj").val().trim();
            var major = $("#major").val().trim();


            if(!stuno) {
                $("#msg").html("编号不能为空！");
                $("#stuno").focus(); // 聚焦
                return false;
            } else  if(!relaname){
                $("#msg").html("真实姓名不能为空！");
                $("#relaname").focus(); // 聚焦
                return false;
            } else  if(!pwd){
                    $("#msg").html("密码不能为空！");
                    $("#password").focus(); // 聚焦
                    return false;

            }else  if(!major){
                $("#msg").html("专业不能为空！");
                $("#major").focus(); // 聚焦
                return false;

            }else  if(!bj){
                $("#msg").html("班级不能为空！");
                $("#bj").focus(); // 聚焦
                return false;

            }

        });
*/
    });
</script>
</body>

</html>