<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>用户页测试</p>
    <p>用户名：${sessionScope.userName}</p>
    <a href="#">修改信息-下面应拉出表单</a>
    <form:form modelAttribute="user" action="/alterUser.action" method="post">
        <p>哪里需要改哪里，这里只前端验证，密码可以不填，默认原密码</p>
        <br />
        密码：<input type="password" name="passwd" />
        <form:errors path="passwd"></form:errors>
        <br />
        邮箱：<input type="email" name="email" value=${sessionScope.user.email}>
        <form:errors path="email"></form:errors>
        <br />
        手机：<input type="text" name="phone" value=${sessionScope.user.phone}>
        <form:errors path="phone"></form:errors>
        <br />
        用户名：<input type="text" name="userName" value=${sessionScope.user.userName}>
        <form:errors path="userName"></form:errors>
        <br />
        <input type="submit" name="submit">
    </form:form>
    <a href="/getMyOrder">我的订单</a>
    <a href="/logout.action">退出</a>
</body>
</html>
