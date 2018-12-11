<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>飞猫旅行</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="/signin.css">
    <link rel="stylesheet" type="text/css" href="/main.css">
    <link rel="stylesheet" type="text/css" href="/index.css">
    <link rel="stylesheet" type="text/css" href="/list.css">
    <link rel="stylesheet" type="text/css" href="/animate.css">

    <style>
        .width-100{
            width: 100px !important;
        }
        .width-160{
            width: 160px !important;
        }
        .my-button{
            display: block;
            text-align: center;
            width: 68px;
            margin: 0px auto;
            height: 26px;
            line-height: 26px;
            background: #00c1de;
            color: #ffffff;
            border-radius: 5px;
            margin-top: 6px;
        }
        .my-button:hover{
            color: #ffffff;
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
                            <li><a href="/getTourismPage">国内游</a></li>
                            <li><a href="/getAbout">关于飞猫</a></li>
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
                <h2>我的订单</h2>
                <hr />
                <c:choose>
                    <c:when test="${sessionScope.haveOrder == true}">
                        <ul class="list-ul" style="margin-top: 29px;">
                            <li class="width-100">订单号</li>
                            <li class="width-100">旅游团编号</li>
                            <li class="width-160">旅游团名</li>
                            <li>价格</li>
                        </ul>
                        <c:forEach items="${sessionScope.myOrder}" var="order">
                            <hr />
                            <ul class="list-ul">
                                <li class="width-100">${order.id}</li>
                                <li class="width-100">${order.tourismId}</li>
                                <li class="width-160">${sessionScope.myTourism[order.id].name}</li>
                                <li>${sessionScope.myTourism[order.id].price}</li>
                                <li>
                                    <!-- 可加js确认是否付款 -->
                                    <a class="my-button" href="pay/${order.id}">结算订单</a>
                                </li>
                                <li>
                                    <!-- 可加js确认是否取消 -->
                                    <a class="my-button" href="removeOrder/${order.id}">取消订单</a>
                                </li>
                            </ul>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="animated fadeInUp" style="font-size: 38px;display: block;width: 300px;text-align: center;margin: 0px auto;margin-top: 136px;">
                            您还没有订单
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>
</body>
</html>
