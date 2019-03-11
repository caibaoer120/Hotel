<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="宾馆管理">
    <meta name="author" content="caibaoer">

    <title>房间管理</title>

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

    <script>
        $(function(){

            $('#HotelManage_EditButton').click(function(){
                $('#HotelManage_HotelInfo_Form').hide();
                $('#HotelManage_HotelInfo_EditForm').show();
                $('#HotelManage_EditButton').hide();
                $('#HotelManage_QuitButton').show();
            });
            $('#HotelManage_QuitButton').click(function(){
                $('#HotelManage_HotelInfo_Form').show();
                $('#HotelManage_HotelInfo_EditForm').hide();
                $('#HotelManage_EditButton').show();
                $('#HotelManage_QuitButton').hide();
            });

        })
    </script>
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    <jsp:include page="tabs.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- 宾馆管理 -->
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/HMS/index.jsp">主页</a></li>
                <li class="breadcrumb-item"><a href="/HMS/Manage.jsp">管理</a></li>
                <li class="breadcrumb-item active" aria-current="page">宾馆管理</li>
            </ol>
        </nav>
    </div>

    <div class="row" id="HotelManage_Title">
        <h1>宾馆信息</h1> &nbsp;&nbsp;<a href="javascript:void(0)" id="HotelManage_EditButton"><i class="fas fa-edit"></i>编辑</a><a href="javascript:void(0)" id="HotelManage_QuitButton" style="display: none;"><i class="fas fa-times"></i>取消</a>
    </div>

    <div class="row">
        <div class="col-sm ">

            <form id="HotelManage_HotelInfo_Form" >
                <div class="form-group ">
                    <label  class="col-sm-2 col-form-label">客栈名:</label>
                    <div  class="col-sm-8">
                       ${hotel.name}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">宾馆地址:</label>
                    <div class="col-sm-8">
                        ${hotel.address}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">联系电话:</label>
                    <div class="col-sm-8">
                       ${hotel.phone}
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">简介:</label>
                    <div class="col-sm-8">
                        ${hotel.detail}
                    </div>
                </div>


            </form>


            <form id="HotelManage_HotelInfo_EditForm" style="display: none;" action="/HMS/Manage/HotelManage_Update.action">
                <div class="form-group">
                    <label  class="col-sm-2 col-form-label">客栈名:</label>
                    <div  class="col-sm-8">
                        <input type="text" name="HotelManage_HotelInfo_EditForm_Name" class="form-control" value="${hotel.name}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">宾馆地址</label>
                    <div class="col-sm-8">
                        <input type="text" name="HotelManage_HotelInfo_EditForm_Address" class="form-control" value="${hotel.address}" required="required">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">联系电话:</label>
                    <div class="col-sm-8">
                        <input type="text" name="HotelManage_HotelInfo_EditForm_Phone" class="form-control" value="${hotel.phone}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">简介:</label>
                    <div class="col-sm-8">
                        <input type="text" name="HotelManage_HotelInfo_EditForm_Detail" class="form-control" value="${hotel.detail}" required>
                    </div>
                </div>


                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                            <input type="submit" class="btn btn-success">
                            <input type="reset" class="btn btn-info">
                        </div>
                    </div>
            </form>

        </div>
    </div>
</body>
</html>


<%-- --%>