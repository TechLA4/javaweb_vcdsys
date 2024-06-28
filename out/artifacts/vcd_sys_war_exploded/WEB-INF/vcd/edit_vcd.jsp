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
	<form action="VcdServlet?action=updateVcd" method="post" class="form form-horizontal" >
		<input type="hidden" value="${vcd.id}" name="id">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				编&emsp;&emsp;号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${vcd.vcdNo}" placeholder="请输入编号" id="vcdNo" name="vcdNo">
			</div>
			<span class="msg" style="color:red;">${requestScope.msg}</span>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				名&emsp;&emsp;称：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${vcd.vcdName}" placeholder="请输入名称" id="vcdName" name="vcdName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				价&emsp;&emsp;格：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${vcd.price}" placeholder="请输入价格" id="price" name="price">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				出版日期：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="date" class="input-text" value="${vcd.creatTime}"  id="creatTime" name="creatTime">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				类&emsp;&emsp;型：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${vcd.profile}" placeholder="请输入类型" id="profile" name="profile">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				库&emsp;&emsp;存：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${vcd.stock}" placeholder="请输入类型" id="stock" name="stock">
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




			//校验编号
			var bookNo = $("#bookNo").val();
			if (bookNo =="") {
				$("span.msg").text("编号不许为空！");
				return false;
			}

			//书名
			var name = $("#name").val();
			if (name =="") {
				$("span.msg").text("书名不许为空！");
				return false;
			}

			//地址
			var location = $("#location").val();
			if (location =="") {
				$("span.msg").text("地址不许为空！");
				return false;
			}


		});
		// 去掉错误信息
		setTimeout(function(){ $(".msg").html("")},10000);
	})






</script>


</body>
</html>