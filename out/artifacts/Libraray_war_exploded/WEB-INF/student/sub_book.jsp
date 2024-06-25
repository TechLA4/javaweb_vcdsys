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
<div class="page-container">
	<form action="StudentServlet?action=insertJyts" method="post" class="form form-horizontal" >
		<input type="hidden" value="${book.id}" name="id">
		<input type="hidden" value="${student.realname}" name="realname">
		<input type="hidden" value="${student.stuno}" name="stuno">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				编&emsp;&emsp;号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.bookNo}"  id="bookNo" name="bookNo" readonly>
			</div>
			<span class="msg" style="color:red;">${requestScope.msg}</span>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				书&emsp;&emsp;名：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.name}" readonly id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				作&emsp;&emsp;者：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.auth}" readonly id="auth" name="auth">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				出版日期：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.creatTime}" readonly id="creatTime" name="creatTime">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				还书时间：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="date" class="input-text"   id="hssj" name="hssj">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				备&emsp;&emsp;注：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text"   id="note" name="note">
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-2">
				<button class="btn btn-primary radius"  id="sub_btn" type="submit" >确认借阅</button>

			</div>
		</div>
	</form>
</div>
<script>
	$(function () {
		// 给注册绑定单击事件
		$("#sub_btn").click(function () {
			//校验还书时间
			var hssj = $("#hssj").val();
			if (hssj =="") {
				$("span.msg").text("还书时间不许为空！");
				return false;
			}


		});
		// 去掉错误信息
		setTimeout(function(){ $(".msg").html("")},10000);
	})






</script>


</body>
</html>