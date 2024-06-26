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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>vcd购买管理 </nav>
<div class="page-container">

	<div class="mt-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <a class="btn btn-success radius" title="返回零售管理界面" href="VcdServlet?action=queryBuyVcd" onclick="Hui_admin_tab(this)" ><i class="Hui-iconfont">&#xe67d;</i> 返回主界面</a>
			</span>  </div>
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">

					<th width="80">编号</th>
					<th width="80">名称</th>
					<th width="80">购买人</th>
					<th width="80">购买时间</th>
					<th width="50">价格</th>
					<th width="50">基础操作</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u" >
				<tr class="text-c">
					<td>${u.vcdNo }</td>
					<td>${u.vcdName }</td>
					<td>${u.gmr }</td>
					<td>${u.creatTime }</td>
					<td>${u.price }</td>
					<td class="f-14 td-manage">
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
            location.href="${pageContext.request.contextPath}/VcdServlet?action=deleteByBuy&id="+id;
        }
    }

</script>


</body>
</html>