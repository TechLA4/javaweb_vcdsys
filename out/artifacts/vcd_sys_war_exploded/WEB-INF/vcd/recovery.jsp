<%--
  Created by IntelliJ IDEA.
  User: 吴柳航
  Date: 2024/6/27
  Time: 13:31
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
    <title>Recovery</title>
    </div>

</head>

<body>
<div class="panel-body"><button class="btn btn-success size-S radius" onclick="location.href='VcdServlet?action=ToMain'">返回主页面</button></div>
<div class="panel panel-default">
    <form action="VcdServlet?action=DBRecovery" method="post">
        <div class="panel-header">请选择恢复的文件</div>
        <div class="panel-body">
            <!-- 文件选择按钮 -->
            <input type="file" name="file-input" id="file-input">
            <button type="submit" class="btn btn-primary size-S radius" id="select-files-btn">选择</button>
        </div>
    </form>
</div>




<script>
    // document.getElementById('select-files-btn').addEventListener('click', function() {
    //     document.getElementById('file-input').click();
    // });

    // document.getElementById('file-input').addEventListener('change', function(event) {
    //     const files = event.target.files;
    //     if (files.length > 0) {
    //         for (let i = 0; i < files.length; i++) {
    //             console.log('Selected file:', files[i].name);
    //             // 你可以在这里添加处理选中文件的逻辑
    //         }
    //         window.location.href = 'VcdServlet?action=DBRecovery'
    //     }
    // });

    // document.getElementById('file-input').addEventListener('change', function(event) {
    //     const files = event.target.files;
    //     if (files.length > 0) {
    //         const fileNames = [];
    //         for (let i = 0; i < files.length; i++) {
    //
    //             const filePath = URL.createObjectURL(files[i]);
    //             console.log('Selected file path:', filePath);
    //             fileNames.push(files[i].name);
    //         }
    //         // 将文件路径名设置为按钮的自定义属性
    //         document.getElementById('select-files-btn').setAttribute('data-file-paths', JSON.stringify(fileNames));
    //
    //         //window.location.href = 'VcdServlet?action=DBRecovery'
    //     }
    // });


    // $(document).ready(function() {
    //     // 点击按钮时触发文件选择
    //     $('#select-files-btn').click(function(event) {
    //         event.preventDefault();
    //         $('#file-input').click();
    //     });
    //
    //     // 监听文件选择事件
    //     $('#file-input').on('change', function() {
    //         var files = $(this)[0].files;
    //         var fileNames = '';
    //         for (var i = 0; i < files.length; i++) {
    //             fileNames += files[i].name + ', ';
    //         }
    //         // 去掉最后一个逗号和空格
    //         fileNames = fileNames.slice(0, -2);
    //
    //         // 弹出确认框，确认选择文件
    //         var confirmMessage = "你选择的文件是: " + fileNames + ". 确定继续吗？";
    //         if (confirm(confirmMessage)) {
    //             window.location.href = 'VcdServlet?action=DBRecovery';
    //         }
    //     });
    // });

</script>
</body>
</html>
