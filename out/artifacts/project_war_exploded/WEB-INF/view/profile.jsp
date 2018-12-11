<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>飞猫旅行</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="signin.css">
    <link rel="stylesheet" type="text/css" href="main.css">
    <link rel="stylesheet" type="text/css" href="index.css">

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
                <form:form style="margin: 73px auto;" class="form-signin" modelAttribute="user" action="/alterUser.action" method="post">
                    <input class="form-control" type="password" placeholder="密码" name="passwd" />
                    <form:errors class="login-wrong" path="passwd"></form:errors>
                    <input class="form-control" type="email" placeholder="邮箱" name="email">
                    <form:errors class="login-wrong" path="email"></form:errors>
                    <input class="form-control" type="text" placeholder="手机" name="phone">
                    <form:errors class="login-wrong" path="phone"></form:errors>
                    <input class="form-control" type="text" placeholder="用户名" name="userName">
                    <form:errors class="login-wrong" path="userName"></form:errors>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        <input style="background: transparent;border: 0px;" type="submit" name="submit" value="修改信息">
                    </button>
                </form:form>
            </div>
        </main>
    </div>
</body>
</html>
