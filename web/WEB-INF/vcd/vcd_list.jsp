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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>vcd信息管理 </nav>
<div class="page-container">
	<div class="text-c">
		<form action="VcdServlet?action=findVcdByNameOrId" method="post">
			<input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:250px" class="input-text">
			<input type="text" name="vcdName" id="vcdName" placeholder="根据名称查询" style="width:250px" class="input-text">
			<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
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
					<th width="150">类型</th>
					<th width="150">上架日期</th>
					<th width="250">价格</th>
					<th width="250">库存</th>
					<th width="50">基础操作</th>

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
<%--					<td>${u.stock }</td>--%>
					<td>
						<c:choose>
							<c:when test="${u.stock == 0}">
								<span style="color:red; font-weight:bold;">${u.stock}</span>
							</c:when>
							<c:otherwise>
								${u.stock}
							</c:otherwise>
						</c:choose>
					</td>
					<td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" href="VcdServlet?action=query&id=${u.id}" onclick="Hui_admin_tab(this)"   title="编辑" ><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="del_vcd(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>
		<div style="text-align: center">
			 <div class="inline pull-right page">
						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=vcdList&currentPage=1' >首页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=vcdList&currentPage=${pageTool.lastPage}'>上一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=vcdList&currentPage=${pageTool.nextPage}'>下一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=vcdList&currentPage=${pageTool.pageCount}'>尾页</a>

						&nbsp;&nbsp;&nbsp;共<span class='current'> ${pageTool.totalCount } </span>条记录
						<span class='current'> ${pageTool.currentPage }/${pageTool.pageCount } </span>页

					</div>

                </div>
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