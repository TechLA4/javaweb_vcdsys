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
<div class="page-container">
	<form action="BookServlet?action=add" method="post" enctype="multipart/form-data" class="form form-horizontal" >
		<input type="hidden" value="${type}" name="type">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				编&emsp;&emsp;号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.bookNo}" placeholder="请输入编号" id="bookNo" name="bookNo">
			</div>
			<span class="msg" style="color:red;">${requestScope.msg}</span>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				书&emsp;&emsp;名：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.name}" placeholder="书名" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				作&emsp;&emsp;者：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.auth}" placeholder="作者" id="auth" name="auth">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				出版日期：</label>
			<div class="formControls col-xs-3 col-sm-3">
			<input type="date" class="input-text" value="${book.creatTime}" placeholder="出版日期" id="creatTime" name="creatTime">
		    </div>
		</div>

        <%--<div class="row cl">--%>
            <%--<label class="form-label col-xs-4 col-sm-2">--%>
                <%--<span class="c-red">*</span>--%>
                <%--上传照片：</label>--%>
            <%--<div class="formControls col-xs-3 col-sm-3">--%>
				<%--<span class="btn-upload form-group">--%>
  <%--<input class="input-text upload-url radius" type="text" style="width:260px;" name="uploadfile-1" id="uploadfile-1" readonly>&emsp;<a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe63e;</i> 上传照片</a>--%>
  <%--<input type="file" multiple name="imgUrl" id="imgUrl"  class="input-file">--%>
<%--</span>--%>


            <%--</div>--%>

            <%--<span class="msg" style="color:red;">${requestScope.msg}</span>--%>
        <%--</div>--%>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				地&emsp;&emsp;址：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.location}" placeholder="地址" id="location" name="location">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				数&emsp;&emsp;量：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${book.number}" placeholder="数量" id="number" name="number">
			</div>
		</div>


		<div class="row cl">
			<div class="col-9 col-offset-2">
				<button class="btn btn-primary radius"  id="sub_btn" type="submit" >${empty param.id ?"确认添加":"确认修改"}</button>

				<c:if test="${type==3}">
					<button  class="btn btn-default radius" onclick="window.location.href='StudentServlet?action=list'" type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
				</c:if>
			</div>
		</div>
	</form>
</div>
<script>
	$(function () {
		// 给注册绑定单击事件
		$("#sub_btn").click(function () {
			//校验编号
			var id = $("#id").val();
			if (id =="") {
				$("span.msg").text("编号不许为空！");
				return false;
			}


			//书名
			var name = $("#name").val();
			if (name =="") {
				$("span.msg").text("书名不许为空！");
				return false;
			}

			//地址
			var location = $("#location").val();
			if (location =="") {
				$("span.msg").text("地址不许为空！");
				return false;
			}


		});
		// 去掉错误信息
		setTimeout(function(){ $(".msg").html("")},10000);
	})






</script>


</body>
</html>