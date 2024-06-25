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
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/css/login.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />


</head>

<body>
<%--借书规则--%>
<div class="m-login-bg">

    <div>
        <ul class="layui-nav" lay-filter="">
            <%--默认在首页--%>
            <li class="layui-nav-item"><a href="LoginServlet?action=loginOut">首页</a></li>
            <li class="layui-nav-item layui-this"><a href="StudentServlet?action=toBorrow">借阅规则</a></li>
            <li class="layui-nav-item"><a href="BookServlet?action=toBorrow">查询图书</a></li>
            <li class="layui-nav-item"><a href="StudentServlet?action=toTsgjj">图书馆简介</a></li>
            <%--点击我的图书馆跳转登陆页面，进行登陆--%>
            <li class="layui-nav-item"><a href="LoginServlet?action=loginOut">我的图书馆</a></li>
        </ul>
    </div>

    <div>
        <table cellSpacing="0" cellPadding="0" width=80% border="0">
            <tbody>
            <tr vAlign="top" >
                <td  width=80%>
                    <h4 align="center">&nbsp;&nbsp;&nbsp; 1、凡持有本馆借书证者，均可凭证借阅图书。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 2、本馆图书采取开架为主闭架为辅的借阅方法。读者可进入规定开架书库选借图书，借书手续在借书处（出纳台）办理。入库时必须遵守《读者入库选书守则》和有关规定。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 3、持证读者，教工每证借书量不超过15册，研究生不超过10册，本、专科生不超过5册，成教生不超过3册，临时借书证不超过2册。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 4、借书期限：教工为3个月，学生为1个月。借阅期满可续借1次。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 5、馆藏线装书、善本书、近10年进口原版书、部分工具书等珍贵图书以及期刊不外借，只限在阅览室阅览。馆藏机密资料（地形图）按照国家机密资料管理办法和学校机密资料借阅规定办理借阅手续。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 6、
                        读者应按期归还所借图书。如过期不还也不办理续借手续，
                        从过期当天起计算借书逾期费，每册每天5分，累计到还书日止。<br>
                        所借书刊到期时适逢法定节假日、寒暑假，不计逾期费。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 7、预约借书。读者所需图书已被他人借走时，可填写&quot;预约借书单&quot;或电话、网上预约，书到后即通知预约人来馆办理借书手续。读者应在一周内到借书处办理借书手续，逾期不予保留。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 8、遇有特殊需要时，本馆有权随时催还借出的图书。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 9、本省其他高校师生持馆际互借介绍信来馆借阅图书资料者，按&quot;关于执行'湖北省高校图书馆通借通阅和文献传递协议'的试行办法&quot;执行，每次限借2册，按书刊价的3倍收取押金，借期1个月。逾期1天，收逾期费0.2元，逾期2个月不还者，押金抵偿所借书刊，并通知担保馆（发证馆）催还所借书刊。<br>
                        <br>
                        &nbsp;&nbsp;&nbsp; 10、所借图书如有损坏遗失等情况，按《书刊遗失、损坏赔偿办法》处理。<br>
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