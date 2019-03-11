<%--
  Created by IntelliJ IDEA.
  User: xlezi
  Date: 2019/1/28
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--为了让 IE 浏览器运行最新的渲染模式下-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--将下面的 <meta> 标签加入到页面中，可以让部分国产浏览器默认采用高速模式渲染页面：<meta name="renderer" content="webkit">-->
    <!-- 确保适当的绘制和触屏缩放.
    在移动设备浏览器上，通过为视口（viewport）设置 meta 属性为 user-scalable=no 可以禁用其缩放（zooming）功能。这样禁用缩放功能后，用户只能滚动屏幕，就能让你的网站看上去更像原生应用的感觉-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="主页">
    <meta name="author" content="caibaoer">

    <title>主页</title>

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



  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
      <!-- .navbar-text 用于添加垂直居中的文本字符串。
           .navbar-brand 适用于您的公司，产品或项目名称。-->
      <a class="navbar-brand" href="/HMS/index.jsp" id="HMS_brand"><i class="fas fa-hotel"></i>乐乐客栈管理系统</a>

      <!--.navbar-toggler用于我们的折叠插件和其他导航切换行为。
          aria-expanded="false" 表示是否展开
          collapse 表示折叠插件
          aria-controls 该属性定义了元素间不能通过文档结构决定的关联关系。
             -->
      <button  class="navbar-toggler" type="button" data-toggle="collapse" data-target="#HMS_top" aria-controls="HMS_top" aria-expanded="true"  aria-label="栏缩小图标">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="HMS_top">


        <ul class="navbar-nav mr-auto" id="top_tools">


          <li class="nav-item">
            <a class="nav-link " href="/HMS/calendars.jsp">
                            <span style="font-size: 18px;">
                                <i class="fas fa-home"></i>
                            </span>
            </a>
          </li>

          <li class="nav-item dropdown" >
            <a class="nav-link "  href="#" id="message_Dropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                               <span style="font-size:20px;">
                                <i class="fas fa-bell fa-sm"></i>
                                </span>

              <!-- <span class="badge  badge-pill badge-secondary" id="message_badge">1</span>-->
            </a>
            <span class="badge  badge-pill badge-secondary" id="top_messageBadge">1</span>
            <ul class="dropdown-menu" aria-labelledby="message_Dropdown" id="top_messageDropdownMenu">
              <li>
                <h6 class="dropdown-header">你有<span id="top_messageNum">3</span>条新消息</h6>
              </li>
              <div class="dropdown-divider"></div>
              <li>
                <a class="dropdown-item" href="#">
                  <div class="user_img">
                    <img src="/HMS/images/1.jpg" class="rounded " alt="..." width="30px" height="30px">管理员
                    <div >
                      <p>Lorem ipsum dolor sit amet</p>
                      <small><span>1</span>hour ago</small>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </a>
              </li>
            </ul>


          </li>

          <li class="nav-item dropdown">

            <a class="nav-link dropdown" href="#" id="top_mailDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span style="font-size: 18px;">
                                <i class="fas fa-envelope"></i>
                                </span>
            </a>
            <span class="badge  badge-pill badge-secondary" id="top_mailBadge">1</span>


            <ul class="dropdown-menu" aria-labelledby="top_mailDropdown" id="top_mailDropdownMenu">
              <li>
                <h6 class="dropdown-header">你有<span id="top_mailNum">3</span>条新消息</h6>
              </li>

              <div class="dropdown-divider"></div>

              <li>
                <a class="dropdown-item" href="#">
                  <div class="user_img">
                    <img src="/HMS/images/1.jpg" class="rounded " alt="..." width="30px" height="30px">管理员
                    <div >
                      <p>Lorem ipsum dolor sit amet</p>
                      <small><span>1</span>hour ago</small>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </a>
              </li>
            </ul>

          </li>
        </ul>



        <form class="form-inline">

          <div class="input-group">
            <div class="input-group-prepend">
              <div class="input-group-text" for="msearch_input">
                <i class="fas fa-search"></i>
              </div>
            </div>
            <input class="form-control" type="search" id="msearch_input" placeholder="请输入合适的单词" aria-label="Search">
          </div>
          <div id="divformsearch_input_clear">

            <button type="button" class="close " aria-label="Close" id="msearch_input_clear">
              <span aria-hidden="true">&times;</span>
            </button>

          </div>
          <button class="btn btn-outline-secondary " type="submit" id="msearch_input_submit">搜索</button>
        </form>

        <ul class="navbar-nav" id="top_person">
          <!--通过添加data-toggle="dropdown"到链接或按钮以切换下拉列表
              或者通过JavaScript调用下拉列表 $('.dropdown-toggle').dropdown()-->
          <li class="nav-item dropdown">

            <a class="dropdown-toggle text-decoration-none" href="#" id="top_personDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <img src="/HMS/images/1.jpg" class="rounded " alt="..." width="30px" height="30px">
              <%--<c:if test="${user.type==1}">管理员</c:if>--%>
              <%--<c:if test="${user.type==2}">店主</c:if>--%>
              <%--<c:if test="${user.type==3}">店yuan </c:if>--%>


            </a>

            <ul class="dropdown-menu" aria-labelledby="top_personDropdown" id="top_personDropdownMenu">

              <li>
                <a class="dropdown-item" href="/HMS/User/personInfoPage.action"><i class="fas fa-user"></i>个人信息</a>
              </li>
              <li>
                <a class="dropdown-item" href="#"><i class="fas fa-user-cog"></i>&nbsp;设置</a>
              </li>
              <div class="dropdown-divider"></div>
              <li>
                <a class="dropdown-item" href="/HMS/User/Logout.action"><i class="fas fa-sign-out-alt"></i>&nbsp;退出</a>
              </li>


            </ul>

          </li>
        </ul>
      </div>
    </nav>


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
          <a href="/HMS/Manage/RoomManage.action?pageNum=1">
            <button type="button" class="btn btn-dark btn-block"><i class="fas fa-cog"></i>订单</button>
          </a>

        </li>
      </ul>


    </nav>




    <div class="=hms_main" style="margin-top: 56px; margin-left: 219px;">
      <div class="card-deck" id="Index_black">
        <div class="card" style="width: 18rem;">
          <i class="fa fa-mail-forward" style="width: 50px;height: 50px;"></i>
          <div class="card-body">
            <h5 class="card-title">信赖</h5>
            <p class="card-text"> <h3>3 <span>个</span></h3></p>
            <a href="#" class="btn btn-primary">查看更多</a>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <i class="fas fa-warehouse" style="width: 50px;height: 50px;"></i>

          <div class="card-body">
            <h5 class="card-title">剩下房间</h5>

            <p class="card-text"> <h3>3 <span>间</span></h3></p>

            <a href="#" class="btn btn-primary">查看更多</a>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <i class="fas fa-hand-holding-usd" style="width: 50px;height: 50px;"></i>
          <div class="card-body">
            <h5 class="card-title">利润</h5>
            <p class="card-text"><h3>3 <span>元</span></h3></p>
            <a href="#" class="btn btn-primary">查看更多</a>
          </div>
        </div>

      </div>

    </div>

  </div>




  </body>
</html>
