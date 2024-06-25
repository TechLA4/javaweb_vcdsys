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

		<form action="JytsServlet?action=update" method="post" class="form form-horizontal" >

			<input type="hidden" value="${jyts.id}" name="id">
			<input type="hidden" value="${type}" name="type">
<%--<c:forEach items="${list}" var="u" >--%>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2" >
					编&emsp;&emsp;号：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${jyts.bookNo}" disabled="true">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2" >
					书名：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="text" class="input-text" value="${jyts.name}"disabled="true">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2" >
					原还书时间：</label>
				<div class="formControls col-xs-3 col-sm-3" >
					<input type="text" class="input-text" value="${jyts.hssj}" disabled="true">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					更改还书时间：</label>
				<div class="formControls col-xs-3 col-sm-3">
					<input type="date" class="input-text"  placeholder="请更改还书时间" id="realname" name="realname">
				</div>
			</div>
<%--</c:forEach>--%>

			<div class="row cl">
				<div class="col-9 col-offset-2">
					<button class="btn btn-primary radius"  id="sub_btn" type="submit" >确认修改</button>
				</div>
			</div>


		</form>


</div>
<script>
$(function () {

    // 去掉错误信息
    setTimeout(function(){ $(".msg").html("")},10000);
})






</script>


</body>
</html>