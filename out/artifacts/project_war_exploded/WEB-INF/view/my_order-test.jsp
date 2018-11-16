<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    </style>
</head>
<body>
    <p>我的订单测试</p>
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
</body>
</html>
