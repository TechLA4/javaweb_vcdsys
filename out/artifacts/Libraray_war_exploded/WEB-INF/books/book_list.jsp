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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图书管理 <span class="c-gray en">&gt;</span>图书收藏管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
	<form action="StudentServlet?action=findbookmessage" method="post">
		<input type="text" name="bookNo" id="bookNo" placeholder="根据编号查询" style="width:250px" class="input-text">
		<input type="text" name="name" id="name" placeholder="根据书名查询" style="width:250px" class="input-text">

		<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</form>
</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					
					<th width="100">编号</th>
					<th width="150">书名</th>
					<%--<th width="150">图片</th>--%>
					<th width="150">作者</th>
					<th width="150">出版日期</th>
					<th width="250">地址</th>

					<th width="50">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${bookList}" var="u" >
				<tr class="text-c">				
				<td>${u.bookNo }</td>
				<td>${u.name }</td>
					<%--<td><img src="/upload/${u.imgUrl }" style="width:60px;height: 80px;"></td>--%>
				<td>${u.auth }</td>
				<td>${u.creatTime }</td>
				<td>${u.location }</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5" href="StudentServlet?action=insertBookBySc&id=${u.id}" onclick="Hui_admin_tab(this)"   title="借阅" ><i class="Hui-iconfont">&#xe6ce;</i></a>
					<a style="text-decoration:none" class="ml-5" href="StudentServlet?action=collectBook&id=${u.id}&stuno=${student.stuno}" onclick="Hui_admin_tab(this)"   title="收藏" ><i class="Hui-iconfont">&#xe630;</i></a>
					</td>
				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>
		<div style="text-align: center">
			 <div class="inline pull-right page">
						<a class="btn btn-secondary-outline  size-MINI radius" href='BookServlet?action=list&currentPage=1' >首页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='BookServlet?action=list&currentPage=${pageTool.lastPage}'>上一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='BookServlet?action=list&currentPage=${pageTool.nextPage}'>下一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius" href='BookServlet?action=list&currentPage=${pageTool.pageCount}'>尾页</a>

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