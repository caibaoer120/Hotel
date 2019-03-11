<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="description" content="导航栏">
    <title>导航栏</title>
    <script>
  $(function() {
    $("#hms_tabs.dropdown-menu").on("click", "[data-stopPropagation]", function(e) {
        e.stopPropagation();
    });
  });
    </script>
</head>
<body>
<div>

    <nav class="navbar navbar-dark bg-dark fixed fixed-left" id="HMS_tabs">

        <ul class="navbar-nav nav-pills" id="tabs_menu">

            <li class="nav-item ">
                <!--   <a class="nav-link " href="#"><p class="font-weight-bold">主页</p></a>-->


                <a href="/HMS/actual/actualPage.action">
                    <button type="button" class="btn btn-dark btn-block"><i class="far fa-calendar-alt"></i>实时</button>
                </a>
            </li>

            <li class="nav-item dropdown ">
                <button type="button" class="btn btn-dark btn-block" id="tabs_manageDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bars"></i>管理</button>

                <ul class="dropdown-menu fade hms_tabs" aria-labelledby="tabs_manageDropdown" id="tabs_manageDropdownMenu">
                    <li>
                        <a href="/HMS/Manage/HotelManage.action">
                            <button type="button" class="btn btn-dark btn-block" data-stopPropagation="true">宾馆管理</button>
                        </a>
                    </li>
                    <li>
                        <a href="/HMS/Manage/RoomManage.action?pageNum=1">
                            <button type="button" class="btn btn-dark btn-block" data-stopPropagation="true">房间管理</button>
                        </a>
                    </li>
                    <li>
                        <a href="/HMS/Manage/RoomManage.action">
                            <button type="button" class="btn btn-dark btn-block" data-stopPropagation="true">人员管理</button>
                        </a>
                    </li>
                    <li>
                        <a href="/HMS/Manage/RoomManage.action">
                            <button type="button" class="btn btn-dark btn-block" data-stopPropagation="true">物品管理</button>
                        </a>
                    </li>
                </ul>
            </li>


            <li class="nav-item">
                <button type="button" class="btn btn-dark btn-block"><i class="fas fa-dollar-sign"></i>财务</button>
            </li>
            <li class="nav-item">
                <button type="button" class="btn btn-dark btn-block"><i class="fas fa-cog"></i>设置</button>
            </li>
        </ul>


    </nav>


</div>



</body>
</html>
