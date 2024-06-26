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
<%--管理员信息修改--%>
<div class="page-container">

		<form action="AdminServlet?action=updateAdmin" method="post" class="form form-horizontal" >

			<input type="hidden" value="${admin.id}" name="id">
			<%--<input type="hidden" value="${type}" name="type">--%>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					账&emsp;&emsp;号：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${admin.username}" placeholder="请输入账号" id="username" name="username">
				</div>
				<span class="msg" style="color:red;">${requestScope.msg}</span>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					登录密码：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${admin.pwd}" placeholder="请输入密码" id="pwd" name="pwd">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>
					管理员姓名：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${admin.nickname}" placeholder="请输入管理员姓名" id="nickname" name="nickname">
				</div>
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
			//校验账号
		var username = $("#username").val();
		if (username =="") {
			$("span.msg").text("账号不许为空！");
			return false;
		}

		//校验密码
		var pwdText = $("#pwd").val();
		//2 创建正则表达式对象
		var pwdPatt = /^\w{5,12}$/;
		//3 使用test方法验证
		if (!pwdPatt.test(pwdText)) {
			//4 提示用户结果
			$("span.msg").text("密码至少6位！");

			return false;
		}
		//姓名
		var nickname = $("#nickname").val();
		if (nickname =="") {
			$("span.msg").text("管理员姓名不许为空！");
			return false;
		}
               
    });
    // 去掉错误信息
    setTimeout(function(){ $(".msg").html("")},10000);
})






</script>


</body>
</html>