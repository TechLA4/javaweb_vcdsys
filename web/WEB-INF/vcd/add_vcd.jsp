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
	<form action="VcdServlet?action=add" method="post" class="form form-horizontal" onsubmit="return validateForm();" >
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
				类&emsp;&emsp;型：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text"  placeholder="类型" value="${vcd.profile}" id="profile" name="profile">
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
<%--<script>--%>
<%--	$(function () {--%>
<%--		// 给注册绑定单击事件--%>
<%--		$("#sub_btn").click(function () {--%>
<%--			//校验编号--%>
<%--			var id = $("#id").val();--%>
<%--			if (id =="") {--%>
<%--				$("span.msg").text("编号不许为空！");--%>
<%--				return false;--%>
<%--			}--%>



<%--		});--%>
<%--		// 去掉错误信息--%>
<%--		setTimeout(function(){ $(".msg").html("")},10000);--%>
<%--	})--%>

<%--</script>--%>
<script>



	function validateForm() {
		// 获取表单元素的值
		var vcdNo = document.getElementById('vcdNo').value.trim();
		var vcdName = document.getElementById('vcdName').value.trim();
		var profile = document.getElementById('profile').value.trim();
		var price = parseFloat(document.getElementById('price').value.trim());
		var stock = parseInt(document.getElementById('stock').value.trim());

		// 验证编号、名称、类型是否为空
		if (vcdNo === "") {
			alert("编号不能为空");
			return false;
		}
		if (vcdName === "") {
			alert("名称不能为空");
			return false;
		}
		if (profile === "") {
			alert("类型不能为空");
			return false;
		}

		// 验证价格和数量
		if (isNaN(price) || price <= 0) {
			alert("价格不能为空且必须大于0");
			return false;
		}
		if (isNaN(stock) || stock < 0) {
			alert("数量不能为空且不能小于0");
			return false;
		}

		// 如果所有验证通过，允许表单提交
		return true;
	}
</script>

</body>
</html>