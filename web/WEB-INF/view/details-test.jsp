<%--待完成--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="/signin.css">
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
                            <li><a href="/getRegister.action">免费注册</a></li>
                            <li id="change"><a href="#">管理员登录</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <%--<p>详情页测试</p>--%>
    <%--<img src="${applicationScope.imagesUrl}${tourism.imageUrl}">--%>
    <%--<div style="background: orange;height: 180px;width: 180px;">--%>
        <%--<p style="color: #ffffff;">${tourism.id}</p>--%>
        <%--<p style="color: #ffffff;">${tourism.name}</p>--%>
        <%--<p style="color: #ffffff;">${tourism.price}</p>--%>
        <%--<p style="color: #ffffff;">--%>
            <%--&lt;%&ndash;很诡异啊，在这个jsp里面就必须用备用fmt库？&ndash;%&gt;--%>
            <%--<fmt:formatDate value="${tourism.beginTime}" type="date" pattern="yyyy-MM-dd"/>--%>
        <%--</p>--%>
        <%--&lt;%&ndash;如果已经添加行程了，声明无法重复添加&ndash;%&gt;--%>
        <%--<p>${requestScope.noRepeat}</p>--%>
        <%--&lt;%&ndash;管理员不能添加行程&ndash;%&gt;--%>
        <%--<c:if test="${sessionScope.isAdmin != true}">--%>
            <%--<a href="/addOrder/${tourism.id}">加入预备行程</a>--%>
        <%--</c:if>--%>
    <%--</div>--%>
</body>
</html>
