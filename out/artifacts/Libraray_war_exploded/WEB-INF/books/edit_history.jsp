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
	<form action="AdminServlet?action=updatehistory" method="post" class="form form-horizontal" >
		<input type="hidden" value="${jyts.id}" name="id">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				编&emsp;&emsp;号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${jyts.bookNo}" placeholder="请输入编号" id="bookNo" name="bookNo">
			</div>
			<span class="msg" style="color:red;">${requestScope.msg}</span>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				书&emsp;&emsp;名：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${jyts.name}" placeholder="请输入书名" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				借阅&emsp;人：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${jyts.jyr}" placeholder="请输入借阅人" id="jyr" name="jyr">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				还书时间：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="date" class="input-text" value="${jyts.hssj}"placeholder="请输入还书时间"  id="hssj" name="hssj">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				借书时间：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="date" class="input-text" value="${jyts.jssj}"placeholder="请输入借书时间"  id="jssj" name="jssj">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				学&emsp;&emsp;号：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${jyts.stuno}" placeholder="请输入学号" id="stuno" name="stuno">
			</div>
		</div>


		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">
				<span class="c-red">*</span>
				备&emsp;&emsp;注：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="${jyts.note}" placeholder="请输入备注" id="note" name="note">
			</div>
		</div>



		<div class="row cl">
			<div class="col-9 col-offset-2">
				<button class="btn btn-primary radius"  id="sub_btn" type="submit" >确认修改</button>

			</div>
		</div>
	</form>
</div>
<script>
	$(function () {
		// 给注册绑定单击事件
		$("#sub_btn").click(function () {
			//校验编号
			var bookNo = $("#bookNo").val();
			if (bookNo =="") {
				$("span.msg").text("编号不许为空！");
				return false;
			}

			//书名
			var name = $("#name").val();
			if (name =="") {
				$("span.msg").text("书名不许为空！");
				return false;
			}

			//学号
			var stuno = $("#stuno").val();
			if (stuno =="") {
				$("span.msg").text("学号不许为空！");
				return false;
			}
            //还书时间
            var hssj = $("#hssj").val();
            if (hssj =="") {
                $("span.msg").text("还书时间不许为空！");
                return false;
            }

		});
		// 去掉错误信息
		setTimeout(function(){ $(".msg").html("")},10000);
	})






</script>


</body>
</html>