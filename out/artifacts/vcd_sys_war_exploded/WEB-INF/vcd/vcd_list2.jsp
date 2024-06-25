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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>vcd信息管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
	<a class="btn btn-primary radius" title="添加VCD"  onclick="Hui_admin_tab(this)" href="VcdServlet?action=toAddVcd"><i class="Hui-iconfont">&#xe600;</i> 添加VCD信息</a>


	</span>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">

					<th width="100">编号</th>
					<th width="150">名称</th>
					<th width="150">简介</th>
					<th width="150">上架日期</th>
					<th width="250">价格</th>
					<th width="50">基础操作</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u" >
				<tr class="text-c">
					<td>${u.vcdNo }</td>
					<td>${u.vcdName }</td>
					<td>${u.profile }</td>
					<td>${u.creatTime }</td>
					<td>${u.price }</td>
					<td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" href="VcdServlet?action=query&id=${u.id}" onclick="Hui_admin_tab(this)"   title="编辑" ><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="del_vcd(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
	function del_vcd(obj,id){
		//用户安全提示
		if(confirm("您确定要删除该条记录吗？")){
			//访问路径
			location.href="${pageContext.request.contextPath}/VcdServlet?action=delete&id="+id;
		}
	}

</script>


</body>
</html>