<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 <jsp:include page="/WEB-INF/common/header.jsp"/>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="page-container">

		<form action="CustomerServlet?action=update" method="post" class="form form-horizontal" >
			<span style="color:red;" >${msg}</span>
			<span style="color:red;" id="msg"></span>
			<input type="hidden" value="${customer.id}" name="id">
			<input type="hidden" value="${type}" name="type">

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					用户编号：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${customer.stuno}" placeholder="请输入编号" id="stuno" name="stuno">
				</div>
				<span class="msg" style="color:red;">${requestScope.msg}</span>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					登录密码：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${customer.pwd}" placeholder="请输入密码" id="pwd" name="pwd">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					用  户  名：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${customer.realname}" placeholder="请输入用户姓名" id="realname" name="realname">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					性&emsp;&emsp;别：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<select name="sex" class="select">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					手机号：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${customer.phone}" placeholder="请输入电话号码" id="phone" name="phone">
				</div>
				<span class="msg" style="color:red;">${requestScope.msg}</span>
			</div>


			<div class="row cl">
				<div class="col-9 col-offset-2">
					<button class="btn btn-primary radius"  id="sub_btn" type="submit" >确认修改</button>
				</div>
			</div>
		</form>


</div>
<script>
$(function () {
    // 给注册绑定单击事件
    $("#sub_btn").click(function () {
			//校验编号
		var stunoText = $("#stuno").val();
		if (stunoText =="") {
			$("#msg").text("用户编号不许为空！");
			return false;
		}

		//校验密码
		var pwdText = $("#pwd").val();
		//2 创建正则表达式对象
		var pwdPatt = /^\w{5,12}$/;
		//3 使用test方法验证
		if (!pwdPatt.test(pwdText)) {
			//4 提示用户结果
			$("#msg").text("密码至少6位！");

			return false;
		}
		//姓名
		var realnameText = $("#realname").val();
		if (realnameText =="") {
			$("#msg").text("姓名不许为空！");
			return false;
		}

        
               
    });
    // 去掉错误信息
    setTimeout(function(){ $(".msg").html("")},10000);
})



</script>


</body>
</html>