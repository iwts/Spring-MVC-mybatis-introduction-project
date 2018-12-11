<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>飞猫旅行</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="signin.css">
    <link rel="stylesheet" type="text/css" href="animate.css">
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
                            <li><a href="/getTourismPage">国内游</a></li>
                            <li><a href="/getAbout">关于飞猫</a></li>
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

    <span style="margin: 200px auto;width: 800px;display: block;text-align: center;font-size: 24px;">
        计算机科学与信息工程学院，软件四班-第十组。<br>
        高克坤，李东倍，李宇晗
    </span>

</body>
</html>
