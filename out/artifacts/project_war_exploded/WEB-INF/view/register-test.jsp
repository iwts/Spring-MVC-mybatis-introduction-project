<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>注册测试</p>
    <form:form modelAttribute="user" action="register.action" method="post">
        账号：<input type="text" name="account" value=${requestScope.user.account}>
        <form:errors path="account"></form:errors>
        <span>${accountError}</span>
        <br />
        密码：<input type="password" name="passwd">
        <form:errors path="passwd"></form:errors>
        <br />
        手机号：<input type="text" name="phone" value=${requestScope.user.phone}>
        <form:errors path="phone"></form:errors>
        <br />
        邮箱：<input type="email" name="email" value="${requestScope.user.email}">
        <form:errors path="email"></form:errors>
        <br />
        用户昵称：<input type="text" name="userName" value=${requestScope.user.userName}>
        <form:errors path="userName"></form:errors>
        <br />
        <input type="submit" name="submit" value="注册">
    </form:form>
</body>
</html>
