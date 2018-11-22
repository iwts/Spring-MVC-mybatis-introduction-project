<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" type="text/css" href="list.css">
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
                    <h3>${sessionScope.account}</h3>
                    <a href="/getAdminConsole.action">旅行控制台</a>
                    <span><a href="/logoutAdmin">退出账号</a></span>
                </div>
            </section>
            <section class="other section">
                <header>
                    <h2>个人信息</h2>
                    <hr>
                </header>
                <ul class="list">
                    <li>ID编号</li>
                    <li class="li-style-two">${sessionScope.admin.id}</li>
                </ul>
            </section>
        </aside>
        <main>
            <div id="users">
                <h2>添加新团</h2>
                <hr>
                <form:form class="form-signin" modelAttribute="tourism" action="addTourism" method="post" enctype="multipart/form-data">
                    <form:errors class="login-wrong" path="name"></form:errors>
                    <input class="form-control" type="text" name="name" placeholder="团名" value=${requestScope.tourism.name}>
                    <form:errors class="login-wrong" path="fromAddress"></form:errors>
                    <input class="form-control" type="text" name="fromAddress" placeholder="出发地" value=${requestScope.tourism.fromAddress}>
                    <form:errors class="login-wrong" path="toAddress"></form:errors>
                    <input class="form-control" type="text" name="toAddress" placeholder="目的地" value=${requestScope.tourism.toAddress}>
                    <form:errors class="login-wrong" path="beginTime"></form:errors>
                    <input class="form-control" type="date" name="beginTime" placeholder="开团时间" value=${requestScope.tourism.beginTime}>
                    <input class="form-control" type="number" name="price" placeholder="价格" value=${requestScope.tourism.price}>
                    <input class="list-upload" type="file" name="image">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        <input style="background: transparent;border: 0px;" type="submit" name="submit" value="增加">
                    </button>
                </form:form>
            </div>
        </main>
    </div>
</body>
</html>