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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图书管理 <span class="c-gray en">&gt;</span>图书借阅信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <a class="btn btn-success radius" title="返回主界面" href="BookServlet?action=findJyxx" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>
		</span>  </div>
	<div class="mt-20">
	<span class="msg" style="color:red;">${requestScope.msg}</span>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="50">编号</th>
					<th width="50">书名</th>
					<th width="120">借阅人</th>
					<th width="80">还书时间</th>
					<th width="50">借书时间</th>
					<th width="50">是否已还书</th>
					<th width="50">备注</th>
					<th width="50">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u" >
				<tr class="text-c">
				<td>${u.bookNo }</td>
					<td>${u.name }</td>
					<td>${u.jyr }</td>
					<td>${u.hssj }</td>
					<td>${u.jssj }</td>
					<%--<c:if test="${u.flag == 0}">--%>
						<td>未还书</td>
					<%--</c:if>--%>
					<%--<c:if test="${u.flag == 1}">--%>
						<%--<td>已还书</td>--%>
					<%--</c:if>--%>
					<td>${u.note }</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5" href="AdminServlet?action=updateHscz&id=${u.id}" onclick="Hui_admin_tab(this)"   title="还书" ><i class="Hui-iconfont">&#xe6df;</i>还书</a>
					</td>
				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>

</div>
</div>

<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">

</script>


</body>
</html>