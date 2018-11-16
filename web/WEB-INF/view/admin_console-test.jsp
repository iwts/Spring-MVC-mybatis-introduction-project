<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>管理员控制台测试</p>
    <p>用户名：${sessionScope.account}</p>
    <a href="/getTourismConsole">旅行信息管理平台</a>
    <a href="/logoutAdmin">注销</a>
</body>
</html>
