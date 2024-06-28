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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>我的购买 </nav>
<div class="page-container">
	<div class="text-c">
		<form action="UserServlet?action=findBuyByUser" method="post">
			<input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:250px" class="input-text">
			<input type="hidden" value="${customer.stuno}" name="stuno">
			<input type="text" name="vcdName" id="vcdName" placeholder="根据名称查询" style="width:250px" class="input-text">
			<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
	<span class="msg" style="color:red;">${requestScope.msg}</span>

	
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					
					<th width="80">编号</th>
					<th width="80">名称</th>
					<th width="80">购买时间</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${buys}" var="u" >
				<tr class="text-c">
					
				<td>${u.vcdNo }</td>
				<td>${u.vcdName }</td>
				<td>${u.creatTime }</td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br>
		<div style="text-align: center">
			<div class="inline pull-right page">
				<a class="btn btn-secondary-outline  size-MINI radius" href='UserServlet?action=queryBuyVcd&currentPage=1&stuno=${customer.stuno}' >首页</a>

				<a class="btn btn-secondary-outline  size-MINI radius"href='UserServlet?action=queryBuyVcd&currentPage=${pageTool.lastPage}&stuno=${customer.stuno}'>上一页</a>

				<a class="btn btn-secondary-outline  size-MINI radius"href='UserServlet?action=queryBuyVcd&currentPage=${pageTool.nextPage}&stuno=${customer.stuno}'>下一页</a>

				<a class="btn btn-secondary-outline  size-MINI radius" href='UserServlet?action=queryBuyVcd&currentPage=${pageTool.pageCount}&stuno=${customer.stuno}'>尾页</a>

				&nbsp;&nbsp;&nbsp;共<span class='current'> ${pageTool.totalCount } </span>条记录
				<span class='current'> ${pageTool.currentPage }/${pageTool.pageCount } </span>页

			</div>

		</div>
		
</div>
</div>
		
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">
function del_book(obj,id){
	 //用户安全提示
    if(confirm("您确定要删除该条记录吗？")){
        //访问路径
        location.href="${pageContext.request.contextPath}/CounterServlet?action=deleteScts&id="+id;
    }
}

</script>


</body>
</html>