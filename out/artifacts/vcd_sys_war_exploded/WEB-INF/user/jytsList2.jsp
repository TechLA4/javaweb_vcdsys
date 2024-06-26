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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>个人借阅vcd </nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <a class="btn btn-success radius" title="返回主界面" href="UserServlet?action=findMyJyxx&stuno=${student.stuno}" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>
		</span>  </div>
	<div class="mt-20">
	<span class="msg" style="color:red;">${requestScope.msg}</span>


		<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="50">编号</th>
					<th width="50">名称</th>
					<th width="120">借阅人</th>
					<th width="80">归还时间</th>
					<th width="50">借阅时间</th>
					<th width="50">备注</th>
					<th width="50">是否归还</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u" >
				<tr class="text-c">
				<td>${u.vcdNo }</td>
				<td>${u.vcdName }</td>
				<td>${u.jyr }</td>
				<td>${u.ghsj }</td>
				<td>${u.jysj }</td>
				<td>${u.note }</td>
				<c:if test="${u.flag == 0}">
					<td style="background: red">未归还</td>
				</c:if>
				<c:if test="${u.flag == 1}">
					<td>已归还</td>
				</c:if>

				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>

		</div>
</div>
</div>

<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">


</script>


</body>
</html>