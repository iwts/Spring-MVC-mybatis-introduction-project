<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="signin.css">
</head>
<body>
    <div class="navbar-wrapper" style="background: #333333;height: 51px;margin-top: -40px;">
        <div class="container">
            <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/getIndex.action">Home</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#">国内游</a></li>
                            <li><a href="#">关于飞猫</a></li>
                            <li>
                                <c:choose>
                                    <c:when test="${sessionScope.isLogin == true}">
                                        <c:choose>
                                            <c:when test="${sessionScope.isAdmin == true}">
                                                <a href="/getAdminConsole.action">${sessionScope.account}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/getProfile.action">${sessionScope.userName}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/getLogin.action">登录</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="container">
        <form:form class="form-signin" modelAttribute="user" action="register.action" method="post">
            <h2 class="form-signin-heading">Register</h2>
            <c:if test="${!(requestScope.accountError eq null)}">
                <span class="login-wrong"><i class="icon-warning" aria-hidden="true"></i>${requestScope.accountError}</span>
            </c:if>
            <input class="form-control" type="text" name="account" placeholder="账号" value=${requestScope.user.account}>
            <form:errors class="login-wrong" path="account"></form:errors>
            <input class="form-control" type="password" name="passwd" placeholder="密码">
            <form:errors class="login-wrong" path="passwd"></form:errors>
            <input class="form-control" type="text" name="phone" placeholder="手机号" value=${requestScope.user.phone}>
            <form:errors class="login-wrong" path="phone"></form:errors>
            <input class="form-control" type="email" name="email" placeholder="邮箱地址" value="${requestScope.user.email}">
            <form:errors class="login-wrong" path="email"></form:errors>
            <input class="form-control" type="text" name="userName" placeholder="昵称" value=${requestScope.user.userName}>
            <form:errors class="login-wrong" path="userName"></form:errors>
            <button class="btn btn-lg btn-primary btn-block" type="submit">
                <input style="background: transparent;border: 0px;" type="submit" name="submit" value="注册">
            </button>
        </form:form>
    </div>

</body>
</html>
