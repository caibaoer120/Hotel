<%--
  Created by IntelliJ IDEA.
  User: xlezi
  Date: 2019/3/3
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="房间管理">
    <meta name="author" content="caibaoer">

    <title>房间管理</title>

    <!-- Bootstrap-CSS -->
    <link href="/HMS/css/bootstrap.min.css" rel="stylesheet">
    <!-- style-CSS -->
    <link href="/HMS/css/style.css" rel="stylesheet">
    <!-- style-CSS -->
    <link href="/HMS/css/tabs.css" rel="stylesheet">
    <!-- 日期-CSS -->
    <link href="/HMS/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

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
    <!-- 日期 -->
    <script src="/HMS/js/bootstrap-datetimepicker.min.js"></script>



</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="tabs.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<!-- 房间管理 -->
   <div class="hms_main">
       <div class="row">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="/HMS/index.jsp">主页</a></li>
                   <li class="breadcrumb-item active" aria-current="page">实时</li>
               </ol>
           </nav>
       </div>

       <button class='btn btn-outline-primary btn-sm'><a href='javascript:void(0)' data-toggle='modal' data-target='#reserveModal' >预定</a></button>

       <c:forEach var="list" items="${xx}">
           <div class="row" >
               <input type="hidden" value="${list.id}" class="room_roomtype">
               <h5>${list.name}</h5>
               <hr>
           </div>
           <c:forEach var="list1" items="${list.rooms}" >

               <div class="card text-center<c:if test="${list1.status==2}"> bg-success</c:if><c:if test="${list1.status==3}"> bg-warning</c:if><c:if test="${list1.status==4}"> bg-danger</c:if>
                   col-sm actual_roomdiv" >

                   <input type="hidden" value="${list1.id}">
                   <div class="card-header" >${list1.number}</div>
                   <div class="card-body">
                       <h5 class="card-title"></h5>
                       <p class="card-text"></p>

                   </div>
                   <div class="card-footer text-muted" >
                       <c:if test="${list1.status==1}">
                           <button class='btn btn-outline-primary btn-sm'><a href='/HMS/Actual.jsp'>入住</a></button>

                       </c:if>
                       <c:if test="${list1.status==2}">
                           <button class='btn btn-outline-primary btn-sm'><a href='/HMS/Actual.jsp'>入住</a></button>
                           <button class='btn btn-outline-primary btn-sm' data-toggle='modal' data-target='#roomDetailModal'>详情</button>
                       </c:if>
                       <c:if test="${list1.status==3}">
                           <button class='btn btn-outline-primary btn-sm' data-toggle='modal' data-target='#roomDetailModal'>详情</button>
                           <button class='btn btn-outline-primary btn-sm'><a href='/HMS/Actual.jsp'>退房</a></button>
                       </c:if>
                       <c:if test="${list1.status==4}"></c:if>


                       <c:if test="${list1.clear==1}">
                           <button class='btn btn-outline-primary btn-sm' onclick="setRoomNotClaer(this)">设脏</button>
                       </c:if>

                       <c:if test="${list1.clear==2}">
                           <button class='btn btn-outline-primary btn-sm' onclick="setRoomClaer(this)">设净</button>
                       </c:if>
                   </div>
               </div>


           </c:forEach>

       </c:forEach>






   </div>


<%--<div class="alert alert-warning" role="alert" id="reserveModal_NoSelect">--%>
   <%--没有选择房间--%>
<%--</div>--%>
<!-- 预定Modal -->
<div class="modal fade " id="reserveModal" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reserveModal_Title">预订信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body" >

                <form class="px-4 py-3">


                    <div class="form-group row">
                        <label for="reserveModal_Name" class="col-form-label">联 系 人 :&nbsp;&nbsp; </label>
                        <div class="">
                            <input type="text" class="form-control content" id="reserveModal_Name" placeholder="输入联系人">
                        </div>
                        &nbsp;&nbsp;
                        <label for="reserveModal_Phone" class="col-form-label">手 机 号 :&nbsp;&nbsp;</label>
                        <div class="">
                            <input type="text" class="form-control content" id="reserveModal_Phone" placeholder="输入电话">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label">住离时间:</label>
                        &nbsp;&nbsp;
                        <div class="">
                            <input type="text"  readonly class="form-control content" id="reserveModal_Intime" style="width: 150px; display: inline;" >-
                            <input type="text"  readonly class="form-control content" id="reserveModal_Outtime" style="width: 150px; display: inline;" >
                            <input type="text" class="form-control content" id="reserveModal_Days" placeholder="天数" style="width: 80px; display: inline;">


                            <select class="form-control" id="reserveModal_Select" style="width: 150px; display: inline;">
                                <option selected disabled>-Default select-</option>
                                <c:forEach var="list2" items="${xx}">
                                    <c:forEach var="list3" items="${list2.rooms}">
                                        <c:if test="${list3.status==1}">
                                            <option value="${list3.id}">${list3.number+=list2.name} </option>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>


                            </select>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label">备  注:</label>
                        <input type="text" class="form-control content" id="reserveModal_Detail" placeholder="备注" >

                    </div>


                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary " onclick="addReserveInfo()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 详情Modal -->
<div class="modal fade " id="roomDetailModal" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="roomDetailModal_Title">xiangqing</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body" >
                <table>

                    <thead><th>来的时间</th><th>离开时间</th></thead>
                    <tbody><tr><td id="intime"></td><td id="outtime"></td></tr></tbody>
                </table>

            </div>

        </div>
    </div>
</div>

<script>
    function setRoomClaer(event) {

        var x=$(event);
        var id=x.closest('div').parent().find('input').eq(0).val();
        var jsondata={"id":id};

        $.ajax({
            type: "post",
            data: JSON.stringify(jsondata),
            dateType: "json",
            url: "/HMS/actual/actualPage_setRoomClaer.action",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
               var button =x.closest('div').children('button:last-child');
                button.text('设脏');
                button.attr('onclick','setRoomNotClaer(this)');
            },
            error: function () {
                alert("失败");
            }
        });
    }
    function setRoomNotClaer(event) {

        var x=$(event);
        var id=x.closest('div').parent().find('input').eq(0).val();
        var jsondata={"id":id};

        $.ajax({
            type: "post",
            data: JSON.stringify(jsondata),
            dateType: "json",
            url: "/HMS/actual/actualPage_setRoomNotClaer.action",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                var button =x.closest('div').children('button:last-child');
                button.text('设净');
                button.attr('onclick','setRoomClaer(this)');
            },
            error: function () {
                alert("失败");
            }
        });
    }

    function addReserveInfo(){
        var name = $.trim($('#reserveModal_Name').val());
        var phone = $.trim($('#reserveModal_Phone').val());
        var detail=$.trim($('#reserveModal_Detail').val());

        var intime=$.trim($('#reserveModal_Intime').val());
        var outtime=$.trim($('#reserveModal_Outtime').val());
        var rid=$.trim($('#reserveModal_Select').val());
        if(rid==""||rid==null)
        {
           $('#reserveModal_NoSelect').alert();
        }
        else
        {

            var jsondata = {"name":name,"phone":phone,"detail":detail,"intime":intime,"outtime":outtime,"rid":rid};
            $.ajax({
                type: "post",
                data: JSON.stringify(jsondata),
                dateType: "json",
                url: "/HMS/actual/actualPage_addReserveInfo.action",
                contentType: "application/json;charset=utf-8",
                success: function (data) {

                    alert(data.flag);

                },
                error: function () {
                    alert("shibai ");

                }
            });
        }



    }

    function dateFtt(fmt,date) { //author: meizz
        var o = {
            "M+": date.getMonth() + 1,     //月份
            "d+": date.getDate(),     //日
            "h+": date.getHours(),     //小时
            "m+": date.getMinutes(),     //分
            "s+": date.getSeconds(),     //秒
            "q+": Math.floor((date.getMonth() + 3) / 3), //季度
            "S": date.getMilliseconds()    //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

        $(function () {

        var today =new Date();
        var nextday=new Date(today.toDateString());
        nextday.setDate(nextday.getDate()+1);
        var result1=dateFtt('yyyy-MM-dd',today);
        var result2=dateFtt('yyyy-MM-dd', nextday);

        $('[data-toggle="popover"]').popover(
            {

                html:true

            }
        );

        $("#reserveModal_Intime").val(result1);
        $("#reserveModal_Outtime").val(result2);
        $("#reserveModal_Days").val(1);
        $("#reserveModal_Intime").datetimepicker({
            format: 'yyyy-mm-dd',
            minView : 2,
            autoclose:true,
            startDate:today,
            todayBtn : true,
            language:'zh-CN'

        });

        $("#reserveModal_Outtime").datetimepicker({
            format: 'yyyy-mm-dd',
            minView : 2,
            autoclose:true,
            startDate:nextday,
            todayBtn : true,
            language:'zh-CN'

        });
            $('#reserveModal').on('show.bs.modal',function (event) {

                var btn=$(event.relatedTarget);
                var modal=$(this);

                // var id=btn.closest('div').parent().find('input').eq(0).val();
                // $('#reserveModal_Select').val(id);
            });

            $('#roomDetailModal').on('show.bs.modal',function (event) {

                var btn=$(event.relatedTarget);
                var modal=$(this);

                var id=btn.closest('div').parent().find('input').eq(0).val();
                // $('#reserveModal_Select').val(id);


                $('#intime').text(id);



            });


        })
</script>

</body>
</html>
