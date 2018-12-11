<%@ page import="me.iwts.bean.Tourism" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>飞猫旅行</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-theme.css">

    <link rel="stylesheet" type="text/css" href="main.css">
    <link rel="stylesheet" type="text/css" href="index.css">


</head>
<body>
    <%--nav--%>
    <div id="nav" class="navbar-wrapper">
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
                            <li><a href="/getRegister.action">免费注册</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>


    <%--轮播--%>
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="max-width: 1600px;margin: 0px auto;">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner" role="listbox" style="height: 550px;">
            <div class="item active">
                <img class="first-slide" src="${applicationScope.imagesUrl}${applicationScope.hotList[0].imageUrl}" alt="First slide">
                <div class="container">
                    <div class="carousel-caption hot-text">
                        <h1>${applicationScope.hotList[0].name}</h1>
                        <a href="/details/tourism/${applicationScope.hotList[0].id}">了解详情</a>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="second-slide" src="${applicationScope.imagesUrl}${applicationScope.hotList[1].imageUrl}" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption hot-text">
                        <h1>${applicationScope.hotList[1].name}</h1>
                        <a href="/details/tourism/${applicationScope.hotList[1].id}">了解详情</a>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="third-slide" src="${applicationScope.imagesUrl}${applicationScope.hotList[2].imageUrl}" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption hot-text">
                        <h1>${applicationScope.hotList[2].name}</h1>
                        <a href="/details/tourism/${applicationScope.hotList[2].id}">了解详情</a>
                    </div>
                </div>
            </div>
        </div>

        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="container marketing" style="margin-top: 35px;">
        <%--子模块介绍--%>
        <div class="row">
            <div class="col-lg-4">
                <img class="img-circle" src="/images/flym.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>飞猫国内游</h2>
                <p>飞猫专注于国内旅游，在国内任意市以上城市都设有飞猫始发站。无论您在何处，都能将您送到景点开始行程。带上行囊，一切的开始请交给我们！</p>
                <p><a class="btn btn-default" href="/getTourismPage" role="button">开始一段旅程 &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-circle" src="/images/flym.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>关于飞猫</h2>
                <p style=" margin-bottom: 30px;">没有尝试过飞猫？一段旅行不知从何开始？或是想与我们合作？众里寻他千百度，蓦然回首，飞猫就在此处...</p>
                <p><a class="btn btn-default" href="/getAbout" role="button">了解我们 &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-circle" src="/images/flym.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>加入我们</h2>
                <p style="margin-bottom: 32px;">注册账号并加入我们吧！仅需数分钟就享受到我们提供的完美服务，随时恭候...</p>
                <p><a class="btn btn-default" href="/getRegister.action" role="button">免费注册 &raquo;</a></p>
            </div>
        </div>

        <hr class="featurette-divider">

        <%-- 介绍 --%>
        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">背上行囊，<span class="text-muted">即刻出发</span></h2>
                <p class="lead">不必管身在何方，只用到达离您最近的飞猫基站，我们会负责将您在10小时内送至目的地。享受旅程，不必等待。</p>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-responsive center-block" src="/images/bag.jpg" alt="Generic placeholder image">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 col-md-push-5">
                <h2 class="featurette-heading">飞猫基站，<span class="text-muted">急速起航</span></h2>
                <p class="lead">布满全国的飞猫网络，最远仅需在市区即可找到。您的出行我们全权负责，免去购票之苦。您需要考虑的仅仅是如何到达飞猫基站门口。</p>
            </div>
            <div class="col-md-5 col-md-pull-7">
                <img class="featurette-image img-responsive center-block" src="/images/train.jpg" alt="Generic placeholder image">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">自由随性，<span class="text-muted">无所约束</span></h2>
                <p class="lead">想要自定义每日计划？不想在人山人海中如打卡般度过假日？飞猫一对一秘书让您无所约束享受假期。您的酒店、导游我们全包了！您需要做的就是告诉我们，您想去哪里。</p>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-responsive center-block" src="/images/enjoy.jpg" alt="Generic placeholder image">
            </div>
        </div>

        <hr class="featurette-divider">

        <footer>
            <p>2018 in hrbun<a href="/getAbout">&nbsp;&nbsp;关于飞猫</a> &middot; kun & iwts</p>
        </footer>
    </div>

    <script src="jquery-3.1.1.js"></script>
    <script src="bootstrap.js"></script>
    <script>
        var nav = document.getElementById('nav');

        var top_height = nav.offsetTop;
        document.onscroll = function(){
            var height = document.body.scrollTop || document.documentElement.scrollTop;
            if(height > top_height){
                nav.style.position = "fixed";
                nav.style.marginTop = "0px";
                nav.style.height = "51px";
                nav.style.background = "#303030";
            }else{
                nav.style.position = "absolute";
                nav.style.marginTop = "20px";
                nav.style.height = "71px";
                nav.style.background = "transparent";
            }
        }
    </script>

</body>
</html>
