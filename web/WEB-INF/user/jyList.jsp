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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>个人借阅vcd <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form action="UserServlet?action=findMyJyxxByid" method="post">
			<input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:250px" class="input-text">
			<input type="text" name="vcdName" id="vcdName" placeholder="根据名称查询" style="width:250px" class="input-text">
			<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
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
		<div style="text-align: center">
			<div class="inline pull-right page">
				<a class="btn btn-secondary-outline  size-MINI radius" href='UserServlet?action=findMyJyxx&currentPage=1&stuno=${student.stuno}' >首页</a>

				<a class="btn btn-secondary-outline  size-MINI radius"href='UserServlet?action=findMyJyxx&currentPage=${pageTool.lastPage}&stuno=${student.stuno}'>上一页</a>

				<a class="btn btn-secondary-outline  size-MINI radius"href='UserServlet?action=findMyJyxx&currentPage=${pageTool.nextPage}&stuno=${student.stuno}'>下一页</a>

				<a class="btn btn-secondary-outline  size-MINI radius" href='UserServlet?action=findMyJyxx&currentPage=${pageTool.pageCount}&stuno=${student.stuno}'>尾页</a>

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