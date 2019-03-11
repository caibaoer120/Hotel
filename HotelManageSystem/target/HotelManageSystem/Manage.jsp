<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="管理模块">
    <meta name="author" content="caibaoer">

    <title>管理模块</title>

    <!-- Bootstrap-CSS -->
    <link href="/HMS/css/bootstrap.min.css" rel="stylesheet">
    <!-- style-CSS -->
    <link href="/HMS/css/style.css" rel="stylesheet">
    <!-- style-CSS -->
    <link href="/HMS/css/tabs.css" rel="stylesheet">

     <!-- jQuery  -->
    <script src="/HMS/js/jquery-3.3.1.min.js"></script>
    <!-- popper -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <!-- Bootstrap  JavaScript 插件 -->
    <script src="/HMS/js/bootstrap.min.js"></script>
    <!-- myjs -->
    <script src="/HMS/js/myjs.js"></script>
    <!--图标-->
    <script src="/HMS/js/all.min.js"></script>
    <script src="/HMS/js/v4-shims.min.js"></script>


</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    <jsp:include page="tabs.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- 管理模块 -->
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/HMS/index.jsp">主页</a></li>
                <li class="breadcrumb-item active" aria-current="page">管理</li>
            </ol>
        </nav>
    </div>

    <div class="row">
        <div class="col-sm col-sm-2">

            <nav id="navbar-example3" class="navbar navbar-light bg-light">
                <a class="navbar-brand" href="#"><h2>管理模块</h2></a>
                <nav class="nav nav-pills flex-column">
                    <a class="nav-link" href="/HMS/Manage/HotelManage.action">宾馆管理</a>
                    <a class="nav-link" href="/HMS/Manage/RoomManage.action">房间管理</a>
                    <a class="nav-link" href="#item-3">人员管理</a>
                    <a class="nav-link" href="#item-3">物品管理</a>
                </nav>
            </nav>
        </div>
    </div>
</body>
</html>


<%-- --%>