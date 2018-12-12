<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <h3>${sessionScope.account}</h3>
                <a href="/getTourismConsole">添加新旅游团</a>
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
            <h2>控制台</h2>
            <!-- 修改失败 -->
            <c:if test="${requestScope.alterError == true}">
                <span class="list-wrong">${requestScope.alterMessage}</span>
            </c:if>
            <hr>
            <ul class="list-ul" style="margin-top: 29px;">
                <li class="list-id">#</li>
                <li class="list-name">团名</li>
                <li>始发地</li>
                <li>目的地</li>
                <li class="list-date">开团时间</li>
                <li>价格</li>
                <li>是否热门</li>
            </ul>
            <c:forEach items="${applicationScope.tourismList}" var="tourism">
                <hr>
                <ul class="list-ul">
                    <li class="list-id">${tourism.id}</li>
                    <li class="list-name">${tourism.name}</li>
                    <li>${tourism.fromAddress}</li>
                    <li>${tourism.toAddress}</li>
                    <li class="list-date">
                        <fmt:formatDate value="${tourism.beginTime}" type="date" pattern="yyyy-M-d"/>
                    </li>
                    <li>${tourism.price}</li>
                        <%-- 是否是热门 --%>
                    <li>
                        <c:choose>
                            <c:when test="${tourism.hot == true}">
                                是
                            </c:when>
                            <c:otherwise>
                                不是
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li>
                        <a href="removeTourism/${tourism.id}" class="alter">删除旅行</a>
                    </li>
                </ul>
            </c:forEach>
        </div>
    </main>
</div>

<script>
    window.onload = function () {
        var alter = document.getElementsByClassName("alter");
        var alter_form = document.getElementsByClassName("alter-form");

        for(var i = 0;i < alter.length;i++){
            alter[i].index = i;
            alter[i].onclick = function () {
                if(alter_form[this.index].style.display == "block"){
                    alter_form[this.index].style.display = "none";
                    return;
                }
                for(var j = 0;j < alter_form.length;j++){
                    alter_form[j].style.display = "none";
                }
                alter_form[this.index].style.display = "block";
            }
        }
    }
</script>
</body>
</html>
