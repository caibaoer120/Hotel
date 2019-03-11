<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <!--为了让 IE 浏览器运行最新的渲染模式下-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--将下面的 <meta> 标签加入到页面中，可以让部分国产浏览器默认采用高速模式渲染页面：<meta name="renderer" content="webkit">-->

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- 确保适当的绘制和触屏缩放.
    在移动设备浏览器上，通过为视口（viewport）设置 meta 属性为 user-scalable=no 可以禁用其缩放（zooming）功能。这样禁用缩放功能后，用户只能滚动屏幕，就能让你的网站看上去更像原生应用的感觉-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="登入页">
    <meta name="author" content="caibaoer">
 
    <title>登入页</title>

    <!-- CSS-->

    <!-- Bootstrap-CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 自己的CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- 登入界面的css-->
    <link href="css/index-css.css" rel="stylesheet">
  
    <!-- JS -->

    <!-- jQuery  -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- popper -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!--图标JS-->
    <script defer src="https://use.fontawesome.com/releases/v5.7.0/js/all.js" integrity="sha384-qD/MNBVMm3hVYCbRTSOW130+CWeRIKbpot9/gR1BHkd7sIct4QKhT1hOPd+2hO8K" crossorigin="anonymous"></script>
    <!-- 自己的js -->
    <script src="js/myjs.js"></script>

<!--
text.oninput=function(){
text.setCustomValidity("");
};
text.oninvalid=function(){
text.setCustomValidity("请不要输入火星的手机号好吗？");
};
-->
    <script>

        $(function(){

            if('${cookie.username.value}'==null||'${cookie.username.value}'==''){

            }
            else{

                $('#customSwitch1').prop('checked',true);
                $('#login_username').val('${cookie.username.value}');
                $('#login_password').focus();
            }
p
        })

        <%--'${cookie.username.value}'--%>
    </script>
</head>

  <body class="text-center">
    <form class="form-signin" action="/HMS/User/Login.action" method="post">

      <div style="font-size: 0.5rem;">
        <i class="fas fa-hotel fa-10x"></i>
      </div>

      <h1 class="h3 mb-3 font-weight-normal">Login In </h1>
        <div class="form-group">
          <label for="login_username" class="sr-only">用户名 </label>
            <%--pattern="^1[3-9]\d{9}$"--%>
          <input type="text" name="login_username" id="login_username" class="form-control" placeholder="用户名"   required autofocus title="a">
        </div>

         <div class="form-group">
          <label for="login_password" class="sr-only">密码</label>
          <input type="password" name="login_password" id="login_password" class="form-control" placeholder="密码" required>
        </div>

        <div id="login_tools">
          <label id="login_register">
            <a href="">注册</a>
          </label>
          <label id="login_forgetPassword">
            <a href="">忘记密码？</a>
          </label>
        </div>

        <div class="custom-control custom-switch mb-3" id="login_remember">
          <input type="checkbox" class="custom-control-input" id="customSwitch1" name="customSwitch1" >
          <label class="custom-control-label" for="customSwitch1">记住账号</label>
        </div>


      <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>

    </form>


</body>
</html>
