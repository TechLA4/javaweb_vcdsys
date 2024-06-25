<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />

<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>


<title>图书馆管理系统</title>

</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="javascript:;">图书馆管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">后台管理</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			
		</ul>
	</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<c:if test="${type==1 }">
						<li>欢迎学生:${student.realname}</li>

					</c:if>
					<c:if test="${type==2 }">
						<li>欢迎管理员:${admin.nickname}</li>

					</c:if>
					<li>&emsp;	操作</li>
					<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">${user.username } <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">

							<li><a href="LoginServlet?action=loginOut">退出</a></li>
				</ul>
			</li>
					
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
</div>
</header>

<aside class="Hui-aside">

	<div class="menu_dropdown bk_2">
		<c:if test="${type==1 }">
			<dl >
				<dt><i class="Hui-iconfont">&#xe62e;</i>&emsp;个人信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a href="StudentServlet?action=toEditStudentInfo" title="个人信息维护" target="mainFrame">  &emsp;个人信息维护</a></li>

					</ul>

				</dd>
			</dl>


			<dl >

				<dt>
					<ul>
						<li><a title="图书列表" href="BookServlet?action=list" target="mainFrame"> &emsp;图书列表</a></li>
						<li><a title="我的收藏图书" href="StudentServlet?action=queryBook&stuno=${student.stuno}" target="mainFrame"> &emsp;我的收藏图书</a></li>
						<li><a title="借阅历史" href="JytsServlet?action=findMyJyxx&stuno=${student.stuno}" target="mainFrame">  &emsp;借阅历史</a></li>
						<li><a title="借阅历史" href="BookServlet?action=recommendList" target="mainFrame">  &emsp;推荐图书</a></li>

					</ul>
				</dt>
			</dl>



		</c:if>
<%--管理员--%>
		<c:if test="${type==2 }">



				<dl>
					<dt><i class="Hui-iconfont">&#xe62e;</i>&emsp;用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
					<dd>
						<ul>

							<li><a title="学生管理" href="StudentServlet?action=list" target="mainFrame">  &emsp;学生管理</a></li>

						</ul>
						<ul>

							<li><a title="个人信息管理" href="AdminServlet?action=toEditAdminInfo&id=${admin.id}" target="mainFrame">  &emsp;个人信息管理</a></li>

						</ul>
					</dd>
				</dl>
			<dl >
				<dt>
					<ul>

						<li><a title="图书管理" href="AdminServlet?action=bookList" target="mainFrame">  &emsp;图书管理</a></li>
					</ul>
					<ul>

					<li><a title="借阅管理" href="BookServlet?action=findJyxx" target="mainFrame">  &emsp;借阅管理</a></li>
					</ul>
					<ul>

						<li><a title="借阅历史" href="BookServlet?action=findJyxxhistory" target="mainFrame">  &emsp;借阅历史</a></li>
					</ul>

				</dt>
			</dl>

		</c:if>


</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">	
	
	<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" name="mainFrame" src="LoginServlet?action=toConsole"></iframe>
		
		</div>
	

</section>
	

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.page.js"></script> 

</body>
</html> 