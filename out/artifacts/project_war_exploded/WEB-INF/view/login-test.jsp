<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="signin.css">
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

    <div class="container">
        <form:form class="form-signin" modelAttribute="user" action="/login.action" method="post">
            <h2 class="form-signin-heading">Sign In</h2>
            <c:if test="${!(requestScope.loginWrong eq null)}">
                <span class="login-wrong"><i class="icon-warning" aria-hidden="true"></i>${requestScope.loginWrong}</span>
            </c:if>
            <input class="form-control" type="text" name="account" placeholder="账号" value=${user.account}>
            <input class="form-control" type="password" name="passwd" placeholder="密码">
            <button class="btn btn-lg btn-primary btn-block" type="submit">
                <input style="background: transparent;border: 0px;" type="submit" name="登录">
            </button>
            <span class="register-span">
                <a href="/getRegister.action">注册</a>
            </span>
        </form:form>

        <form:form style="display: none;" class="form-signin" modelAttribute="admin" action="loginByAdmin.action" method="post">
            <h2 class="form-signin-heading">Admin Sign In</h2>
            <c:if test="${!(requestScope.loginWrongByAdmin eq null)}">
                <span class="login-wrong"><i class="icon-warning" aria-hidden="true"></i>${requestScope.loginWrongByAdmin}</span>
            </c:if>
            <input class="form-control" type="text" name="id" placeholder="ID" value=${admin.id}>
            <input class="form-control" type="password" name="passwd" placeholder="密码">
            <button class="btn btn-lg btn-primary btn-block" type="submit">
                <input style="background: transparent;border: 0px;" type="submit" name="登录">
            </button>
        </form:form>
    </div>

    <script>
        var change = document.getElementById('change');
        var form = document.getElementsByClassName('form-signin');

        change.onclick = function(){
            if(form[1].style.display == "none"){
                form[1].style.display = "block";
                form[0].style.display = "none";
                change.firstElementChild.innerHTML = "用户登录";
            }else{
                form[1].style.display = "none";
                form[0].style.display = "block";
                change.firstElementChild.innerHTML = "管理员登录";
            }
        }
    </script>

</body>
</html>
