<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="实时">
    <meta name="author" content="caibaoer">

    <title>实时</title>

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
<body class="bg-light">

<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

<!-- 实时情况-->
<div class="container">
    <div style="overflow:scroll;">
        <table class="table table-bordered" style="min-width:1500px;min-height: 300px;">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            </tbody>
        </table>
    </div>

</div>


</body>
</html>
