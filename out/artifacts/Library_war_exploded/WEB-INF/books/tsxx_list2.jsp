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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图书管理 <span class="c-gray en">&gt;</span>图书信息管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <a class="btn btn-success radius" title="返回主界面" href="AdminServlet?action=bookList" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>
		</span>  </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
	<a class="btn btn-primary radius" title="添加图书"  onclick="Hui_admin_tab(this)" href="BookServlet?action=toAddBook"><i class="Hui-iconfont">&#xe600;</i> 添加图书信息</a>


	</span>
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
					<th width="50">基础操作</th>

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
                        <a style="text-decoration:none" class="ml-5" href="AdminServlet?action=query&id=${u.id}" onclick="Hui_admin_tab(this)"   title="编辑" ><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="del_book(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
    function del_book(obj,id){
        //用户安全提示
        if(confirm("您确定要删除该条记录吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/BookServlet?action=delete&id="+id;
        }
    }

</script>


</body>
</html>