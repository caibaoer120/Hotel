<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="description" content="顶部栏">
    <title>顶部栏</title>
</head>
<body>
    <!-- 顶部栏 -->
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
            </div>
       
</body>
</html>
