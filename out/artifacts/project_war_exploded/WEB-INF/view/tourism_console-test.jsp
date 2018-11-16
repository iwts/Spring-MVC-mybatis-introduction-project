<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
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
        .alter-form{
            display: none;
        }
    </style>
</head>
<body>
    <p>旅游信息管理平台测试</p>
    <a href="#">添加信息</a>
    <!-- 这里点击添加，js展出提交表单 -->
    <form:form modelAttribute="tourism" action="addTourism" method="post" enctype="multipart/form-data">
        团名：<input type="text" name="name" value=${requestScope.tourism.name}>
        <form:errors path="name"></form:errors>
        <br />
        出发地：<input type="text" name="fromAddress" value=${requestScope.tourism.fromAddress}>
        <form:errors path="fromAddress"></form:errors>
        <br />
        目的地：<input type="text" name="toAddress"  value=${requestScope.tourism.toAddress}>
        <form:errors path="toAddress"></form:errors>
        <br />
        开团时间：<input type="date" name="beginTime" value=${requestScope.tourism.beginTime}>
        <form:errors path="beginTime"></form:errors>
        <br />
        价格：<input type="number" name="price" value=${requestScope.tourism.price}>
        <br />
        标题图上传：<input type="file" name="image">
        <br />
        <input type="submit" name="submit" value="添加">
    </form:form>
    <br />
    <!-- 修改失败 -->
    <c:if test="${requestScope.alterError == true}">
        <p>${requestScope.alterMessage}</p>
    </c:if>
    <c:forEach items="${applicationScope.tourismList}" var="tourism">
        <ul class="test-ul">
            <li>${tourism.id}</li>
            <li>${tourism.name}</li>
            <li>${tourism.fromAddress}</li>
            <li>${tourism.toAddress}</li>
            <li>
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
                <a href="#${tourism.id}" class="alter">修改信息</a>
            </li>
            <li>
                <c:choose>
                    <c:when test="${tourism.hot == true}">
                        <a href="removeHot/${tourism.id}">取消热门</a>
                    </c:when>
                    <c:otherwise>
                        <a href="setHot/${tourism.id}">设置热门</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
        <form:form class="alter-form" action="alterTourism" method="post" enctype="multipart/form-data">
            <p>与原数据一样则不进行修改</p>
            <input type="hidden" name="id" value="${tourism.id}">
            团名：<input type="text" name="name" value=${tourism.name}>
            <form:errors path="name"></form:errors>
            <br />
            出发地：<input type="text" name="fromAddress" value=${tourism.fromAddress}>
            <form:errors path="fromAddress"></form:errors>
            <br />
            目的地：<input type="text" name="toAddress"  value=${tourism.toAddress}>
            <form:errors path="toAddress"></form:errors>
            <br />
            开团时间：<input type="date" name="beginTime" value=${tourism.beginTime}>
            <form:errors path="beginTime"></form:errors>
            <br />
            价格：<input type="number" name="price" value=${tourism.price}>
            <br />
            标题图上传：<input type="file" name="image">
            <br />
            <input type="submit" name="submit" value="添加">
        </form:form>
    </c:forEach>

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
