<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>飞猫旅行</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="/signin.css">

    <link rel="stylesheet" type="text/css" href="/d_main.css">
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

    <div class="total">
        <div class="body_l">
            <div class="showimg" style="margin-top: 77px;">
                <img src="${applicationScope.imagesUrl}${tourism.imageUrl}" width="400">
            </div>
        </div>
        <div class="body_r">
            <div class="prise">
                <c:if test="${tourism.hot}">
                    <div class="bargin"></div>
                </c:if>
            </div>
            <div class="goods_info">
                <div class="discountinfo">${tourism.name}</div>
            </div>
            <ul class="client_judge">
                <li class="list-item">满意度:95%</li>
                <li class="list-item">点评:41</li>
                <li class="list-item">关注度:1002 </li>
            </ul>
            <div class="order_mess">
                <table class="city_package">
                    <dl class="trival_info"><dt>推荐出发站:</dt><ul class="chose"><li class="list-chose"><span>${tourism.fromAddress}</span></li></ul><input type="hidden"></dl>
                    <dl class="trival_info"><dt>到达站:</dt><dd><div class="select_box"><ul class="chose"><li class="list-chose"><span>${tourism.toAddress}</span></li></ul></div> </dd><input type="hidden"></dl>
                    <dl class="trival_info"><dt>最近拼团时间:</dt>
                        <ul class="chose">
                            <li class="list-chose">
                                <span>
                                    <%--很诡异啊，在这个jsp里面就必须用备用fmt库？--%>
                                    <fmt:formatDate value="${tourism.beginTime}" type="date" pattern="yyyy-MM-dd"/>
                                </span>
                            </li>
                        </ul>
                        <input type="hidden">
                    </dl>
                    <dl class="trival_info"><dt>单人价格:</dt>
                        <span>${tourism.price}</span>
                    </dl>
                    <%--如果已经添加行程了，声明无法重复添加--%>
                    <c:if test="${!(requestScope.noRepeat eq null)}">
                        <span class="login-wrong"><i class="icon-warning" aria-hidden="true"></i>${requestScope.noRepeat}</span>
                    </c:if>
                    <%--管理员不能添加行程--%>
                    <c:if test="${sessionScope.isAdmin != true}">
                        <a class="g-add" href="/addOrder/${tourism.id}">加入预备行程</a>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
