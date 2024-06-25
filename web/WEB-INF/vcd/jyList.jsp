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
	<div class="text-c">
		<form action="VcdServlet?action=findJhxxByNameOrId" method="post">
			<input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:250px" class="input-text">
			<input type="text" name="jyr" id="jyr" placeholder="根据借阅人查询" style="width:250px" class="input-text">
			<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">

					<th width="100">编号</th>
					<th width="150">名称</th>
					<th width="150">借阅人</th>
					<th width="150">借阅时间</th>
					<th width="250">归还时间</th>
					<th width="250">是否归还</th>
					<th width="50">基础操作</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${vcdList}" var="u" >
				<tr class="text-c">
					<td>${u.vcdNo }</td>
					<td>${u.vcdName }</td>
					<td>${u.jyr }</td>
					<td>${u.jysj }</td>
					<td>${u.ghsj }</td>
					<c:if test="${u.flag == 0}">
						<td style="background: red">未归还</td>
					</c:if>
					<c:if test="${u.flag == 1}">
						<td>已归还</td>
					</c:if>
					<td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" href="VcdServlet?action=updateUser&id=${u.id}" onclick="Hui_admin_tab(this)"   title="归还" ><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="del_vcd(this,'${u.id }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr>

			</c:forEach>

			</tbody>
		</table>
		<br>
		<div style="text-align: center">
			 <div class="inline pull-right page">
						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=findJhxx&currentPage=1' >首页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=findJhxx&currentPage=${pageTool.lastPage}'>上一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=findJhxx&currentPage=${pageTool.nextPage}'>下一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=findJhxx&currentPage=${pageTool.pageCount}'>尾页</a>

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
            location.href="${pageContext.request.contextPath}/VcdServlet?action=deleteUser&id="+id;
        }
    }

</script>


</body>
</html>