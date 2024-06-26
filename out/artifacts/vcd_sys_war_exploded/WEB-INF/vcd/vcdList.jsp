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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>vcd借/售管理 </nav>
<div class="page-container">
	<div class="text-c">
	<form action="VcdServlet?action=findVcdByid" method="post">
		<input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:250px" class="input-text">

		<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</form>
</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					
					<th width="100">编号</th>
					<th width="150">名称</th>
					<th width="150">简介</th>
					<th width="150">上映日期</th>
					<th width="250">价格</th>
					<th width="250">库存</th>
					<th width="50">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${vcdList}" var="u" >
				<tr class="text-c">				
				<td>${u.vcdNo }</td>
				<td>${u.vcdName }</td>
					<%--<td><img src="/upload/${u.imgUrl }" style="width:60px;height: 80px;"></td>--%>
				<td>${u.profile }</td>
				<td>${u.creatTime }</td>
				<td>${u.price }</td>
					<td>${u.stock }</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5" href="UserServlet?action=insertVcdBySc&id=${u.id}" onclick="Hui_admin_tab(this)"   title="借阅" ><button  class="btn btn-primary  size-S radius" type="button" >借阅</button></a>
					<a style="text-decoration:none" class="ml-5" href="UserServlet?action=BuyVcdByUser&id=${u.id}&stuno=${customer.stuno}" onclick="Hui_admin_tab(this)"   title="购买" ><button  class="btn btn-warning  size-S radius" type="button" >购买</button></a>
					</td>
				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>
		<div style="text-align: center">
			 <div class="inline pull-right page">
						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=list&currentPage=1' >首页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=list&currentPage=${pageTool.lastPage}'>上一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=list&currentPage=${pageTool.nextPage}'>下一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=list&currentPage=${pageTool.pageCount}'>尾页</a>

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