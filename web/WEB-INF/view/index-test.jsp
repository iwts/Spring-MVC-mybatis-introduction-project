<%@ page import="me.iwts.bean.Tourism" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
</head>
<body>
    <p>首页测试</p>
    <p>${sessionScope.city}</p>
    <br/>
    <a href="/getRegister.action">注册</a>
    <c:choose>
        <c:when test="${sessionScope.isLogin == true}">
            <%--管理员入口和普通用户入口要分开--%>
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

    <p>首页推送，由管理员设定3个，不足的随机补</p>
    <c:forEach items="${applicationScope.hotList}" var="tourism">
        <img src="${applicationScope.imagesUrl}${tourism.imageUrl}">
        <div style="background: orange;height: 180px;width: 180px;">
            <p style="color: #ffffff;">${tourism.id}</p>
            <p style="color: #ffffff;">${tourism.name}</p>
            <p style="color: #ffffff;">${tourism.price}</p>
            <p style="color: #ffffff;">
                <fmt:formatDate value="${tourism.beginTime}" type="date" pattern="yyyy-M-d"/>
            </p>
            <a href="/details/tourism/${tourism.id}">详情</a>
        </div>
    </c:forEach>
</body>
</html>
