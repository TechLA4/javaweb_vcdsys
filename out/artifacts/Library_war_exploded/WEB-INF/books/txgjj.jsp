<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>图书馆管理系统</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/layui.css" />
	<%--<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/login.css" />--%>
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />


</head>

<body>
<%--借书规则--%>
<div class="m-login-bg">

	<div>
		<ul class="layui-nav" lay-filter="">
			<%--默认在首页--%>
			<li class="layui-nav-item"><a href="LoginServlet?action=loginOut">首页</a></li>
			<li class="layui-nav-item"><a href="StudentServlet?action=toBorrow">借阅规则</a></li>
			<li class="layui-nav-item"><a href="BookServlet?action=toBorrow">查询图书</a></li>
			<li class="layui-nav-item layui-this"><a href="StudentServlet?action=toTsgjj">图书馆简介</a></li>
			<%--点击我的图书馆跳转登陆页面，进行登陆--%>
			<li class="layui-nav-item"><a href="LoginServlet?action=loginOut">我的图书馆</a></li>
		</ul>
	</div>

	<div>
		<table cellSpacing="0" cellPadding="0" width=80% border="0">
			<tbody>
			<tr vAlign="top" >
				<td  width=80%>
					<h4 align="center">&nbsp;&nbsp;&nbsp; 浙江大学图书馆是我国历史最悠久的大学图书馆之一，其前身是始建于1897年的求是书院藏书楼。1998年9月，原浙江大学与杭州大学、浙江农业大学、浙江医科大学合并，四校图书馆也相应合并为新的浙江大学图书馆。<br>
						<br>
						&nbsp;&nbsp;&nbsp; 浙江大学图书馆由玉泉校区图书馆、紫金港校区基础分馆、紫金港校区农医分馆、紫金港校区古籍馆、西溪校区图书馆、华家池校区图书馆六大馆舍组成，总建筑面积约9.1万平方米，总阅览座位达4307席。目前，浙江大学正在规划建设紫金港主图书馆。图书馆现有在编正式职工184人，其中正高4人，副高32人，中级职称112人，硕士学历106人，博士学历6人。设有读者服务部、资源建设部、参考咨询部、古籍特藏部等9个部门。<br>
						<br>
						&nbsp;&nbsp;&nbsp; 浙江大学图书馆的文献资源建设以学校世界一流大学建设目标需求为导向，搜集反映各有关学科经典文献、代表学科发展先进水平的文献资源，为“双一流”教学科研与拔尖创新人才培养提供专业和较为充分的文献资源保障。截至2020年12月31日，全馆实体馆藏总量已达670.3万册（不含之江、舟山、海宁及院系资料室），包括线装古籍18万余册。近年来，浙江大学图书馆还大力加强网络化和数字化文献资源的建设，目前引进的中外文数据库已覆盖学校所有学科范围，共订购各类文献数据库（含子库）742个，中外文电子图书229.6万册，中外文电子期刊430.5万册，中外文学位论文987.2万册。种类丰富、品质优良的各类型文献资源为全面提高学校教学科研和学科建设水平提供了有力保证。<br>
						<br>
						&nbsp;&nbsp;&nbsp; 在馆藏总量与结构不断丰富的同时，浙江大学图书馆已形成了比较系统、完整的综合性藏书体系以及较为科学、合理的协调性馆藏布局。现有六座馆舍的藏书及服务对象各有侧重，并根据学校校区设置的变化而进行适时调整：玉泉校区图书馆馆藏以理工类文献为主，兼收经济、管理、文学等类文献；紫金港校区基础分馆主要面向低年级本科生，以收藏人文社科、自然科学、工程技术等各学科的基础理论和教学参考书为主要特色；紫金港校区农医分馆的藏书则以医学、药学和生命科学为主；紫金港校区古籍馆为图书馆与人文学院合作共建，以收藏传统古籍、新线装书、影印古籍及人文文献资源为特色；西溪校区图书馆藏书文理兼收，其中文史哲文献和基础学科文献收藏较为丰富；华家池校区图书馆目前的藏书体系已涵盖理、工、农、医各个学科，尤以面向医学院师生的生物、医学文献资源和面向继续教育学院中组部全国干部教育培训浙江大学基地学员的人文社科资源为主要服务资源。<br>
						<br>
						&nbsp;&nbsp;&nbsp; 浙江大学图书馆以服务师生为宗旨，不断推进优质服务工作。目前，图书馆已应用国际先进的自动化管理系统ALEPH500，实现了各校区图书的通借通还、预约等服务。图书馆配置了各种类型的服务器、微机、全光纤存储局域网（SAN）、光盘库及自助借书仪，形成了比较完善的服务管理系统。同时，图书馆每年都积极参与学校的新生教育工作，开展多种形式的导读活动，契合学校教育理念，现纳入学校教育体系。浙江大学图书馆还积极利用现代化服务手段，为全校师生提供科技查新、文献传递、情报分析、学科服务，为学校和其他机构部门的决策提供分析报告及内参。近年来发表的《浙江大学与亚洲一流大学比较分析报告》、浙江大学内参《中美12所一流大学ESI论文情况对比分析》、教育部内参《全面认识“跟班式科研”改善高校科技创新质量报告》等受到高度好评。同时，图书馆还积极加强古籍的保护与揭示工作，持续推进特色资源的建设。<br>
						<br>
						&nbsp;&nbsp;&nbsp; 浙江大学图书馆在参与我国高等教育的资源共享和数字化建设工作上，也本着积极共建、不遗余力的态度。浙江大学联合国内外的高等院校、科研机构共同承担大学数字图书馆国际合作计划（China Academic Digital Associative Library，简称CADAL），目前，项目已完成二期建设。浙江大学图书馆还作为浙江省高校数字图书馆(ZADL)省中心及资源组、服务组牵头馆，承担了ZADL项目服务管理、主体建设等工作，为全省数字图书馆建设做出了表率和贡献。CADAL和ZADL项目的建设将进一步推动我国数字图书馆技术的发展，这为数字图书馆建设与服务的可持续发展奠定了资源和技术基础。同时，浙江大学图书馆还参加了浙江省科技文献共建共享平台、浙江省联合知识导航网等项目建设，向参与建设的高等院校、学术机构提供教学科研支撑。。<br>
						所借书刊到期时适逢法定节假日、寒暑假，不计逾期费。<br>
						<br>
						&nbsp;&nbsp;&nbsp; 当前，浙江大学已经开启新甲子的辉煌历程，面临着历史性的战略机遇，图书馆也将迎来前所未有机遇和挑战。浙江大学图书馆必将坚持既定的发展目标及战略思路，努力做好浙江大学建设世界一流大学和一流学科的支撑平台，为浙江大学建设中国特色的世界一流大学做出应有的贡献。<br>

					</h4>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>


</body>

<script src="<%=path %>/static/layui/layui.js"></script>


<script>


    layui.use([ 'form','jquery','layer' ], function() {
        var form = layui.form,
            layer = layui.layer,
            $= layui.jquery;



    });
</script>
</html>