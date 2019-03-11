<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="个人信息">
    <meta name="author" content="caibaoer">

    <title>个人信息</title>

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
  //  function checkForm(){
         //var pwd= document.getElementById('pwd');
         //pwd.value= toMD5(pwd.value);            
         //进行下一步

   //  }
   //  $(function(){
   //
   //      $('#personInfo_form_submit').click(function () {
   //          $('#personInfo_form').addClass('was-validated');
   //      });
   //
   //  })
   //
    </script>

</head>


<body class="bg-light">
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="tabs.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<!-- 房间管理 -->
    <div class="container">
        <div class="row">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">主页</a></li>
                    <li class="breadcrumb-item"><a href="#">用户</a></li>
                    <li class="breadcrumb-item active" aria-current="page">个人信息</li>
                </ol>
            </nav>
        </div>

        <div class="row">
            <h1>个人信息</h1>
        </div>

        <div class="row">
            <div class="col-sm">
                <!-- was-validated -->
                <form   id="personInfo_form">

                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="personInfo_form_nameInput">真实姓名</label>
                            <input type="text" class="form-control" id="personInfo_form_nameInput" placeholder="truename" required="required" />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="personInfo_form_phoneInput">电话号码</label>
                            <input type="text" class="form-control" id="personInfo_form_phoneInput" placeholder="Phone" pattern="a" required="" />
                        </div>
                    </div>

            <div class="form-row">

                <div class="col-md-6 mb-3">

                    <label>性别</label>
                     <div class="input-group">

                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="personInfo_form_sexRadio1" name="personInfo_form_sexRadio" class="custom-control-input" checked>
                        <label class="custom-control-label" for="personInfo_form_sexRadio1">男</label>
                    </div>

                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="personInfo_form_sexRadio2" name="personInfo_form_sexRadio" class="custom-control-input">
                        <label class="custom-control-label" for="personInfo_form_sexRadio2">女</label>
                    </div>

                    </div>

                </div>
            </div>

        <button class="btn btn-primary"  id="personInfo_form_submit" onclick="cherk()">提交</button>
                    <!-- HTML to write -->


    </form>

                <a><i class="fas fa-edit"id="xx" ></i></a>
                <!-- 房型添加Modal -->
                <div class="modal fade message_success" tabindex="-1" role="dialog" aria-labelledby="RoomManage_RoomTypeAddModal_Title" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body" id="RoomManage_RoomTypeAddModal_Form">
                                修改成功
                            </div>
                        </div>
                    </div>
                </div>
</div>
</div>
</div>
</div>

<script>


    function cherk() {
        var phone = document.getElementById("personInfo_form_phoneInput");
       // var phone=$('')
        if(phone.checkValidity())
        {

        }
        else{
           phone.setCustomValidity("请输入带http://的网站");
        }
    }

    //  function checkForm(){
    //var pwd= document.getElementById('pwd');
    //pwd.value= toMD5(pwd.value);
    //进行下一步

    //  }
    //  $(function(){
    //
    //      $('#personInfo_form_submit').click(function () {
    //          $('#personInfo_form').addClass('was-validated');
    //      });
    //
    //  })
    //
     $(function(){

         $('#xx').click(function () {
             $(".message_success").modal('show');
             setTimeout(function(){
                 $(".message_success").modal('hide');
             },2000);

         })


      })
</script>
</body>
</html>
