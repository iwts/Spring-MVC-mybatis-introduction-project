<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>登录测试</p>
    <form:form modelAttribute="user" action="/login.action" method="post">
        <p>${loginWrong}</p>
        账号：<input type="text" name="account" value=${user.account}>
        <br />
        密码：<input type="password" name="passwd">
        <br />
        <input type="submit" name="登录">
    </form:form>
    <br />
    <a href="/getRegister.action">注册</a>
    <br />
    <p>应在同页面显示管理员登录</p>
    <form:form modelAttribute="admin" action="loginByAdmin.action" method="post">
        <p>${loginWrongByAdmin}</p>
        ID：<input type="text" name="id" value=${admin.id}>
        <br />
        密码：<input type="password" name="passwd">
        <br />
        <input type="submit" name="登录">
    </form:form>
</body>
</html>
