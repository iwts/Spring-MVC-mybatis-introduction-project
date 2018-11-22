<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>详情页测试</p>
    <img src="${applicationScope.imagesUrl}${tourism.imageUrl}">
    <div style="background: orange;height: 180px;width: 180px;">
        <p style="color: #ffffff;">${tourism.id}</p>
        <p style="color: #ffffff;">${tourism.name}</p>
        <p style="color: #ffffff;">${tourism.price}</p>
        <p style="color: #ffffff;">
            <%--很诡异啊，在这个jsp里面就必须用备用fmt库？--%>
            <fmt:formatDate value="${tourism.beginTime}" type="date" pattern="yyyy-M-d"/>
        </p>
        <%--如果已经添加行程了，声明无法重复添加--%>
        <p>${requestScope.noRepeat}</p>
        <%--管理员不能添加行程--%>
        <c:if test="${sessionScope.isAdmin != true}">
            <a href="/addOrder/${tourism.id}">加入预备行程</a>
        </c:if>
    </div>
</body>
</html>
