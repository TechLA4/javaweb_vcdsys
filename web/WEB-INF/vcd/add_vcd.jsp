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
	<form action="VcdServlet?action=add" method="post" class="form form-horizontal" >
		<input type="hidden" value="${type}" name="type">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				编&emsp;&emsp;号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text"placeholder="请输入编号" value="${vcd.vcdNo}" id="vcdNo" name="vcdNo">
			</div>
			<span class="msg" style="color:red;">${requestScope.msg}</span>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				名&emsp;&emsp;称：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" placeholder="名称" value="${vcd.vcdName}" id="vcdName" name="vcdName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				简&emsp;&emsp;介：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text"  placeholder="简介" value="${vcd.profile}" id="profile" name="profile">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				出版日期：</label>
			<div class="formControls col-xs-3 col-sm-3">
			<input type="date" class="input-text" placeholder="出版日期" value="${vcd.creatTime}" id="creatTime" name="creatTime">
		    </div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				价&emsp;&emsp;格：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text"  placeholder="价格" value="${vcd.price}" id="price" name="price">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				数&emsp;&emsp;量：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text"  placeholder="数量" value="${vcd.stock}" id="stock" name="stock">
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
	$(function () {
		// 给注册绑定单击事件
		$("#sub_btn").click(function () {
			//校验编号
			var id = $("#id").val();
			if (id =="") {
				$("span.msg").text("编号不许为空！");
				return false;
			}



		});
		// 去掉错误信息
		setTimeout(function(){ $(".msg").html("")},10000);
	})






</script>


</body>
</html>