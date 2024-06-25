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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图书管理 <span class="c-gray en">&gt;</span>个人借阅图书 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <a class="btn btn-success radius" title="返回主界面" href="JytsServlet?action=findMyJyxx&stuno=${student.stuno}" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>
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
					<th width="50">备注</th>
					<th width="50">是否还书</th>
					<th width="50">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u" >
				<tr class="text-c">
				<td>${u.id }</td>
					<td>${u.name }</td>
					<td>${u.jyr }</td>
					<td>${u.hssj }</td>
					<td>${u.jssj }</td>
					<td>${u.note }</td>
						<c:if test="${u.flag == 0}">
						<td>未还书</td>
						</c:if>
						<c:if test="${u.flag == 1}">
						<td>已还书</td>
						</c:if>
					<c:if test="${u.flag == 0}">
						<td class="f-14 td-manage">
							<a style="text-decoration:none" class="ml-5" href="JytsServlet?action=toEditychsInfo&id=${u.id}" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
								<%--</td>--%>
								<%--<td class="f-14 td-manage">--%>
							<a style="text-decoration:none" class="ml-5" onClick="del_book(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</c:if>
					<c:if test="${u.flag == 1}">
						<td class="f-14 td-manage">
							<a style="text-decoration:none" class="ml-5" onClick="del_book(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</c:if>
				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>

</div>
</div>

<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">
function del_book(obj,id){
	 //用户安全提示
    if(confirm("您确定要删除吗？")){
        //访问路径
        location.href="${pageContext.request.contextPath}/JytsServlet?action=delete&id="+id;
    }
}

</script>


</body>
</html>