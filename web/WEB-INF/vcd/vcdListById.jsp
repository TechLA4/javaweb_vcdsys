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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>vcd管理 </nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <a class="btn btn-success radius" title="返回主界面" href="VcdServlet?action=list" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>
		</span>  </div>
	<div class="mt-20">
	<span class="msg" style="color:red;">${requestScope.msg}</span>




	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="100">编号</th>
					<th width="150">名称</th>
					<th width="150">简介</th>
					<th width="150">上映日期</th>
					<th width="250">价格</th>

					<th width="50">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${vcdList}" var="u" >
				<tr class="text-c">
					<td>${u.vcdNo }</td>
					<td>${u.vcdName }</td>
					<td>${u.profile }</td>
					<td>${u.creatTime }</td>
					<td>${u.price }</td>
					<td class="f-14 td-manage">
						<a style="text-decoration:none" class="ml-5" href="UserServlet?action=insertVcdBySc&id=${u.id}" onclick="Hui_admin_tab(this)"   title="借阅" ><button  class="btn btn-primary  size-S radius" type="button" >借阅</button></a>
						<a style="text-decoration:none" class="ml-5" href="UserServlet?action=BuyVcdByUser&id=${u.id}&stuno=${customer.stuno}" onclick="Hui_admin_tab(this)"   title="购买" ><button  class="btn btn-warning  size-S radius" type="button" >购买</button></a>
					</td>
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