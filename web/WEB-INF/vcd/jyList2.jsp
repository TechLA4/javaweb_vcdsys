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
			<c:forEach items="${list}" var="u" >
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