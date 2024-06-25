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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图书管理 <span class="c-gray en">&gt;</span>图书管理查询 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

	<span class="msg" style="color:red;">${requestScope.msg}</span>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> 
 <a class="btn btn-success radius" title="返回主界面" href="LoginServlet?action=loginOut" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>

	
	</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					
					<th width="80">编号</th>
					<th width="80">书名</th>
					<th width="80">作者</th>
					<th width="50">出版日期</th>
					<th width="80">地址</th>
					<th width="120">数量</th>
					<th width="75">剩余数量</th>
				</tr>
			</thead>
			<tbody>

			<c:forEach items="${list}" var="u" >
				<tr class="text-c">
				<td>${u.bookNo }</td>
				<td>${u.name }</td>
					<%--<td><img src="/upload/${u.imgUrl }" style="width:60px;height: 80px;"></td>--%>
				<td>${u.auth }</td>
				<td>${u.creatTime }</td>
				<td>${u.location }</td>
				<td>${u.number }</td>
				<td>${u.sysl }</td>
				<%--<td class="f-14 td-manage">--%>
					<%--<a style="text-decoration:none" class="ml-5" href="TeacherServlet?action=query&id=${u.id}" onclick="Hui_admin_tab(this)"   title="编辑" ><i class="Hui-iconfont">&#xe6df;</i></a>--%>
					<%--<a style="text-decoration:none" class="ml-5" onClick="del_teacher(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>--%>
				<%--</td>--%>

				</tr>

			</c:forEach>
			</tbody>
		</table>
		<br>

</div>
</div>
		
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">
function del_teacher(obj,id){
	 //用户安全提示
    if(confirm("您确定要删除该条记录吗？")){
        //访问路径
        location.href="${pageContext.request.contextPath}/TeacherServlet?action=delete&id="+id;
    }
}

</script>


</body>
</html>