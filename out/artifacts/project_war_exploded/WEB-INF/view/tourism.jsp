<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>飞猫旅行</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="/signin.css">
    <link rel="stylesheet" type="text/css" href="/animate.css">
    <link rel="stylesheet" type="text/css" href="/tourism.css">
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
                            <li><a href="/getRegister.action">免费注册</a></li>
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

    <div class="image-title">
        <img src="/images/cost_bargin.png" width="204">
    </div>
    <div class="hot-div">
        <c:forEach items="${applicationScope.hotList}" var="hotTourism">
            <div class="hot-div-three">
                <img src="${applicationScope.imagesUrl}${hotTourism.imageUrl}" width="310">
                <span>${hotTourism.name}</span>
                <a href="/details/tourism/${hotTourism.id}">了解详情</a>
            </div>
        </c:forEach>
    </div>
    <div class="image-title">
        <img src="/images/cost_bargin_more.png" width="204">
    </div>
    <div class="more-div">
        <c:forEach items="${applicationScope.tourismList}" var="tourism">
            <%--只显示非热门旅行--%>
            <c:if test="${tourism.hot != true}">
                <div class="more-div-line">
                    <img src="${applicationScope.imagesUrl}${tourism.imageUrl}" width="310">
                    <h3>${tourism.name}</h3>
                    <span>${tourism.price}</span>
                    <a href="/details/tourism/${tourism.id}">了解详情</a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</body>
</html>
