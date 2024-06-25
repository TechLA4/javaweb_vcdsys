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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span>vcd购买管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form action="VcdServlet?action=findBuyByNameOrId" method="post">
			<input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:150px" class="input-text">
			<input type="text" name="gmr" id="gmr" placeholder="根据购买人查询" style="width:150px" class="input-text">
<%--			<input type="text" name="createtime" id="createtime" placeholder="根据时间查询" style="width:150px" class="input-text">--%>
			<button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</form>
	</div>
	<div class="mt-20">
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
			<c:forEach items="${vcdList}" var="u" >
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
		<div style="text-align: center">
			 <div class="inline pull-right page">
						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=queryBuyVcd&currentPage=1' >首页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=queryBuyVcd&currentPage=${pageTool.lastPage}'>上一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius"href='VcdServlet?action=queryBuyVcd&currentPage=${pageTool.nextPage}'>下一页</a>

						<a class="btn btn-secondary-outline  size-MINI radius" href='VcdServlet?action=queryBuyVcd&currentPage=${pageTool.pageCount}'>尾页</a>

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
            location.href="${pageContext.request.contextPath}/VcdServlet?action=deleteByBuy&id="+id;
        }
    }

</script>


</body>
</html>