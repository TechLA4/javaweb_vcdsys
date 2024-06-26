<%--
  Created by IntelliJ IDEA.
  User: 82405
  Date: 2024/6/25
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> vcd管理 <span class="c-gray en">&gt;</span> 零售记录 </nav>
<div class="page-container">
    <div class="text-c">
        <form action="VcdServlet?action=queryVcdBorrowRecordBetween" method="post">
            <%--        <input type="text" name="vcdNo" id="vcdNo" placeholder="根据编号查询" style="width:150px" class="input-text">--%>
            <%--        <input type="text" name="gmr" id="gmr" placeholder="根据购买人查询" style="width:150px" class="input-text">--%>
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                起始日期：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="date" class="input-text" value="${param.beginTime}"  id="beginTime" name="beginTime">
            </div>



            <label class="form-label coddl-xs-4 col-sm-2">
                <span class="c-red">*</span>
                截止日期：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="date" class="input-text" value="${param.endTime}"  id="endTime" name="endTime">
            </div>
            <button  class="btn btn-success" id="search" type="submit"><i class="Hui-iconfont">&#xe665;</i> 借还统计</button>

        </form>

    </div>





    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">


            <thead>
            <tr class="text-c">
                <th width="100">编号</th>
                <th width="100">名称</th>
                <th width="100">借出数量</th>
                <th width="100">还入数量</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${vcdUseRecordList}" var="u" >
                <tr class="text-c">
                    <td>${u.vcdNo }</td>
                    <td>${u.vcdName }</td>
                    <td>${u.vcdBorrowNum }</td>
                    <td>${u.vcdReturnNum }</td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>

</body>
</html>
