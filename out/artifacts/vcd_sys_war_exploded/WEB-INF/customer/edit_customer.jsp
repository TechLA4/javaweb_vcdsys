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
	<form action="CustomerServlet" method="post" class="form form-horizontal" >
		<span style="color:red;" >${msg}</span>
		<span style="color:red;" id="msg"></span>
		<input type="hidden" value="${empty param.id ?"add":"update"}" name="action"/>
		<input type="hidden" value="${customer.id}" name="id">
		<input type="hidden" value="${type}" name="type">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				用户号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${customer.stuno}" placeholder="请输入用户号" id="stuno" name="stuno">
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
				姓&emsp;&emsp;名：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${customer.realname}" placeholder="请输入姓名" id="realname" name="realname">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				电&emsp;&emsp;话：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${customer.phone}" placeholder="请输入电话" id="phone" name="phone">
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
			<div class="col-9 col-offset-2">
				<button class="btn btn-primary radius"  id="sub_btn" type="submit" >${empty param.id ?"确认添加":"确认修改"}</button>

			</div>
		</div>
	</form>
</div>
<script>
	$(document).ready(function () {
		// 给注册绑定单击事件
		$("#sub_btn").click(function (event) {
			var errorMsg = ""; // 用于存储错误信息

			//校验编号
			var stunoText = $("#stuno").val().trim();
			if (stunoText == "") {
				errorMsg = "编号不许为空！";
				$("#msg").html(errorMsg);
				event.preventDefault();
				return false;
			}

			//校验密码
			var pwdText = $("#pwd").val().trim();
			var pwdPatt = /^\w{5,12}$/;
			if (!pwdPatt.test(pwdText)) {
				errorMsg = "密码至少5位到12位！";
				$("#msg").html(errorMsg);
				event.preventDefault();
				return false;
			}

			//校验姓名
			var realnameText = $("#realname").val().trim();
			if (realnameText == "") {
				errorMsg = "姓名不许为空！";
				$("#msg").html(errorMsg);
				event.preventDefault();
				return false;
			}

			//校验电话
			var phoneText = $("#phone").val().trim();
			if (phoneText == "") {
				errorMsg = "电话号不许为空！";
				$("#msg").html(errorMsg);
				event.preventDefault();
				return false;
			}
		});
	});
</script>


</body>
</html>