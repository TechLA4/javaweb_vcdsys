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
	<div class="text-c">
		<form action="AdminServlet?action=findjybookmessage" method="post">
			<%--<input type="text" name="id" id="id">--%>
			<input type="text" name="bookNo" id="bookNo" placeholder="根据编号查询" style="width:250px" class="input-text">
			<input type="text" name="name" id="name" placeholder="根据书名查询" style="width:250px" class="input-text">
			<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
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
		<div style="text-align: center">
			<div class="inline pull-right page">
				<a class="btn btn-secondary-outline  size-MINI radius" href='BookServlet?action=findJyxx&currentPage=1' >首页</a>

				<a class="btn btn-secondary-outline  size-MINI radius"href='BookServlet?action=findJyxx&currentPage=${pageTool.lastPage}'>上一页</a>

				<a class="btn btn-secondary-outline  size-MINI radius"href='BookServlet?action=findJyxx&currentPage=${pageTool.nextPage}'>下一页</a>

				<a class="btn btn-secondary-outline  size-MINI radius" href='BookServlet?action=findJyxx&currentPage=${pageTool.pageCount}'>尾页</a>

				&nbsp;&nbsp;&nbsp;共<span class='current'> ${pageTool.totalCount } </span>条记录
				<span class='current'> ${pageTool.currentPage }/${pageTool.pageCount } </span>页

			</div>

		</div>
</div>
</div>

<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">

</script>


</body>
</html>