<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="signin.css">
    <link rel="stylesheet" type="text/css" href="main.css">
    <link rel="stylesheet" type="text/css" href="index.css">
    <style>
        .test-ul{
            height: 80px;
            display: block;
        }
        .test-ul>li{
            float: left;
            width: 180px;
            height: 25px;
            line-height: 25px;
            list-style-type: none;
        }
    </style>
</head>
<body>
    <div class="navbar-wrapper" style="background: #333333;height: 51px;margin: 0px;">
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
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="outer">
        <div class="separate"></div>
        <aside class="left-aside">
            <section class="author section">
                <header>
                    <h2>我的标签</h2>
                    <hr>
                </header>
                <div class="user-left">
                    <img src="/images/user.jpg@64h_64w_2e" width="100">
                </div>
                <div class="user-right">
                    <h3>${sessionScope.userName}</h3>
                    <p><a href="/getMyOrder">我的订单</a></p>
                    <span><a href="/logout.action">退出账号</a></span>
                </div>
            </section>
            <section class="other section">
                <header>
                    <h2>个人信息</h2>
                    <a href="/getProfile.action">修改信息</a>
                    <hr>
                </header>
                <ul class="list">
                    <li>E-mail</li>
                    <li class="li-style-two">${sessionScope.user.email}</li>
                    <li>Phone</li>
                    <li class="li-style-two">${sessionScope.user.phone}</li>
                </ul>
            </section>
        </aside>
        <main>
            <div id="users">
                <c:choose>
                    <c:when test="${sessionScope.haveOrder == true}">
                        <ul class="test-ul">
                            <li>订单号</li>
                            <li>旅游团编号</li>
                            <li>旅游团名</li>
                            <li>价格</li>
                        </ul>
                        <c:forEach items="${sessionScope.myOrder}" var="order">
                            <ul class="test-ul">
                                <li>${order.id}</li>
                                <li>${order.tourismId}</li>
                                <li>${sessionScope.myTourism[order.id].name}</li>
                                <li>${sessionScope.myTourism[order.id].price}</li>
                                <li>
                                    <!-- 可加js确认是否付款 -->
                                    <a href="pay/${order.id}">结算订单</a>
                                </li>
                                <li>
                                    <!-- 可加js确认是否取消 -->
                                    <a href="removeOrder/${order.id}">取消订单</a>
                                </li>
                            </ul>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>您还没有订单</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>
</body>
</html>
