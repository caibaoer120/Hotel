<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.hotelManageSystem.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 房间管理 -->
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/HMS/index.jsp">主页</a></li>
                <li class="breadcrumb-item"><a href="/HMS/Manage.jsp">管理</a></li>
                <li class="breadcrumb-item active" aria-current="page">房间管理</li>
            </ol>
        </nav>
    </div>

    <div class="row" id="RoomManage_Title">
            <h1>房型信息</h1>&nbsp;&nbsp;<a href="javascript:void(0)" data-toggle="modal" data-target="#RoomManage_RoomTypeAddModal"><i class="fas fa-plus" ></i>添加</a>
    </div>

    <div class="row">
        <div class="col-sm">
            <!--table-hover 悬停特效-->
            <table class="table table-striped table-hover" >
                <thead class="text-center">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">类型名</th>
                        <th scope="col">数量</th>
                        <th scope="col">价格</th>
                        <th scope="col">简介</th>
                        <th scope="col">操作</th>
                    </tr>
                </thead>
                <tbody class="text-center" id="RoomManage_RoomType_Table">
                <c:forEach var="list" items="${roomTypeList}" varStatus="st">
                    <tr>
                        <th scope="row">${st.count}</th>
                        <input type="hidden" value="${list.id}" id="${list.id}">
                        <td>${list.name}</td>
                        <td>${list.amount}个</td>
                        <td>${list.price}元</td>
                        <td>${list.detail}</td>
                        <td>
                            <%--<button type="button"><i class="fas fa-edit"></i></button>--%>
                            <%--<button type="button"> <i class="fas fa-times"></i></button>--%>
                                <a><i class="fas fa-edit" data-toggle="modal" data-target="#RoomManage_RoomTypeUpdateModal"></i></a>
                                &nbsp; &nbsp;
                                <a> <i class="fas fa-times" onclick="RoomTypeDelete(${list.id},this)"></i></a>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



            <nav aria-label="Page navigation example">
                <div style="display: inline;">
                    共 ${page.totalPage} 页 第<p id="page" style="display: inline;">${page.pageNum}</p> 页 总共有${page.totalRecord}条数据

                </div>
                <ul class="pagination justify-content-end">

                    <c:choose>
                        <c:when test="${page.pageNum - 1 > 0}">
                            <li class="page-item ">
                                <a class="page-link"  tabindex="-1" aria-disabled="true" href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum - 1}">上一页</a>
                            </li>
                        </c:when>
                        <c:when test="${page.pageNum - 1 <= 0}">

                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true" href="/HMS/Manage/RoomManage.action?pageNum=1">上一页</a>
                            </li>
                        </c:when>
                    </c:choose>


                    <c:choose>
                        <c:when test="${page.pageNum - 1 > 0}">
                            <li class="page-item ">
                                <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum-1}">${page.pageNum-1}</a>
                            </li>
                            <li class="page-item active" >
                                <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum}">${page.pageNum}</a>
                            </li>
                            <c:if test="${page.pageNum + 1 > page.totalPage}">
                                <li class="page-item disabled" >
                                    <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+1}">${page.pageNum+1}</a>
                                </li>
                            </c:if>
                            <c:if test="${page.pageNum + 1 <= page.totalPage}">
                                <li class="page-item " >
                                    <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+1}">${page.pageNum+1}</a>
                                </li>
                            </c:if>


                        </c:when>
                        <c:when test="${page.pageNum - 1 <= 0}">

                            <li class="page-item active">
                                <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum}">${page.pageNum}</a>
                            </li>
                            <c:if test="${page.pageNum +1> page.totalPage}">
                                <li class="page-item disabled">
                                    <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+1}">${page.pageNum+1}</a>
                                </li>
                            </c:if>

                            <c:if test="${page.pageNum +1<=page.totalPage}">
                                <li class="page-item">
                                    <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+1}">${page.pageNum+1}</a>
                                </li>
                            </c:if>

                            <c:if test="${page.pageNum +2> page.totalPage}">
                                <li class="page-item disabled">
                                    <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+2}">${page.pageNum+2}</a>
                                </li>
                            </c:if>

                            <c:if test="${page.pageNum +2<=page.totalPage}">
                                <li class="page-item">
                                    <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+2}">${page.pageNum+2}</a>
                                </li>
                            </c:if>
                        </c:when>

                        <c:when test="${page.totalPage==0}">
                            <li class="page-item disabled active">
                                <a class="page-link "  href="#">1</a>
                            </li>
                        </c:when>
                        <c:when test="${page.pageNum + 1 < page.totalPage}">
                            <li class="page-item ">
                                <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum-1}">${page.pageNum-1}</a>
                            </li>
                            <li class="page-item active" >
                                <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum}">${page.pageNum}</a>
                            </li>
                            <li class="page-item ">
                                <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+1}">${page.pageNum+1}</a>
                            </li>
                        </c:when>
                        <c:when test="${page.pageNum + 1 >= page.totalPage}">
                            <li class="page-item ">
                                <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum}">${page.pageNum}</a>
                            </li>
                            <li class="page-item " >
                                <a class="page-link "  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+1}">${page.pageNum+1}</a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link"  href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum+2}">${page.pageNum+2}</a>
                            </li>
                        </c:when>


                    </c:choose>

                    <c:choose>
                    <c:when test="${page.totalPage==0}">
                        <li class="page-item disabled">
                            <a class="page-link" href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum}">下一页</a>
                        </li>
                    </c:when>
                    <c:when test="${page.pageNum + 1 <= page.totalPage}">
                        <li class="page-item ">
                            <a class="page-link" href="/HMS/Manage/RoomManage.action?pageNum=${page.pageNum + 1}">下一页</a>
                        </li>
                    </c:when>
                    <c:when test="${page.pageNum + 1 > page.totalPage}">
                        <li class="page-item disabled">
                            <a class="page-link " href="/HMS/Manage/RoomManage.action?pageNum=${page.totalPage}">下一页</a>
                        </li>
                    </c:when>
                    </c:choose>




                </ul>
            </nav>
        </div>

    </div>
    <div class="row" >
        <h1>房间信息</h1>&nbsp;&nbsp;<a href="javascript:void(0)" data-toggle="modal" data-target="#RoomManage_RoomAddModal"><i class="fas fa-plus" ></i>添加</a>
    </div>

<c:forEach var="list" items="${roomList}" varStatus="st">
    <div class="card text-center" style="width: 200px; display:inline-block;">
        <div class="card-body">
            <h5 class="card-title">${list.number}</h5>
            <p class="card-text">${list.detail}</p>
            <c:forEach var="list1" items="${allroomTypeList}">
                <c:if test="${list1.id==list.typeid}">
                    <input type="hidden" value="${list1.id}" class="room_roomtype">
                    <p class="card-text "><small class="text-muted ">${list1.name}</small></p>
                </c:if>

            </c:forEach>

        </div>
    </div>
 </c:forEach>



    <!-- 房间添加Modal -->
    <div class="modal fade" id="RoomManage_RoomAddModal" tabindex="-1" role="dialog" aria-labelledby="RoomManage_RoomAddModal_Title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="RoomManage_RoomAddModal_Title">房型添加</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body" id="RoomManage_RoomAddModal_Form">

                    <form class="px-4 py-3">

                        <div class="form-group row">
                            <label for="RoomManage_RoomAddModal_Number" class="col-sm-3 col-form-label">房号</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="RoomManage_RoomAddModal_Number" placeholder="Number" required="required">
                            </div>
                        </div>



                        <div class="form-group row">
                            <label  class="col-sm-3 col-form-label">类型</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="RoomManage_RoomAddModal_Select">
                                    <option selected disabled>-Default select-</option>

                                    <c:forEach var="list" items="${allroomTypeList}">
                                        <option >${list.id} </option>

                                    </c:forEach>
                                </select>

                            </div>
                        </div>



                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="RoomAdd()">保存</button>
                </div>
            </div>
        </div>
    </div>



    <!-- 房型编辑Modal -->
    <div class="modal fade" id="RoomManage_RoomTypeUpdateModal" tabindex="-1" role="dialog" aria-labelledby="RoomManage_RoomTypeUpdateModal_Title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="RoomManage_RoomTypeUpdateModal_Title">房型编辑</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">

                    <form class="px-4 py-3">
                        <input type="hidden" id="RoomManage_RoomTypeUpdateModal_Id">

                        <div class="form-group row">
                            <label for="RoomManage_RoomTypeUpdateModal_Name" class="col-sm-3 col-form-label">房型</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control content" id="RoomManage_RoomTypeUpdateModal_Name" placeholder="Name">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="RoomManage_RoomTypeUpdateModal_Price" class="col-sm-3 col-form-label">价格</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control content" id="RoomManage_RoomTypeUpdateModal_Price" placeholder="Price">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="RoomManage_RoomTypeUpdateModal_Detail" class="col-sm-3 col-form-label">简介</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control content" id="RoomManage_RoomTypeUpdateModal_Detail" placeholder="Detail">
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="RoomTypeUpdate()">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 房型添加Modal -->
    <div class="modal fade" id="RoomManage_RoomTypeAddModal" tabindex="-1" role="dialog" aria-labelledby="RoomManage_RoomTypeAddModal_Title" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="RoomManage_RoomTypeAddModal_Title">房型添加</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body" id="RoomManage_RoomTypeAddModal_Form">

                    <form class="px-4 py-3">

                        <div class="form-group row">
                            <label for="RoomManage_RoomTypeAddModal_Name" class="col-sm-3 col-form-label">房型</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="RoomManage_RoomTypeAddModal_Name" placeholder="Name" required="required">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="RoomManage_RoomTypeAddModal_Price" class="col-sm-3 col-form-label">价格</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="RoomManage_RoomTypeAddModal_Price" placeholder="Price" required="required">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="RoomManage_RoomTypeAddModal_Detail" class="col-sm-3 col-form-label">简介</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="RoomManage_RoomTypeAddModal_Detail" placeholder="Detail" required="required">
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="RoomTypeAdd()">保存</button>
                </div>
            </div>
        </div>
    </div>

   <%--修改提示model--%>
    <div class="modal fade message_update_success" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body" >
                    修改成功
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade message_update_fail" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body" >
                    修改失败
                </div>
            </div>
        </div>
    </div>
    <%--删除提示model--%>
    <div class="modal fade message_delete_success" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body" >
                    删除成功
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade message_delete_fail" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body" >
                    删除失败
                </div>
            </div>
        </div>
    </div>

    <%--新增提示model--%>
    <div class="modal fade message_add_success" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body" >
                    新增成功
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade message_add_fail" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body" >
                    新增失败
                </div>
            </div>
        </div>
    </div>
    <script>

        function RoomAdd() {
            var number = $.trim($('#RoomManage_RoomAddModal_Number').val());
            var typeid = $.trim($('#RoomManage_RoomAddModal_Select').val());


            var jsondata = {"number": number, "typeid": typeid};

            var page=document.getElementById("page").innerHTML;
            $.ajax({
                type: "post",
                data: JSON.stringify(jsondata),
                dateType: "json",
                url: "/HMS/Manage/roomManage_RoomAdd.action",
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    var num="/HMS/Manage/RoomManage.action?pageNum="+page;



                    $('#RoomManage_RoomAddModal').modal('hide');

                    $(".message_add_success").modal('show');
                    setTimeout(function(){
                        window.location.href=num;
                        $(".message_add_success").modal('hide');

                    },2000);

                },
                error: function () {

                    $(".message_add_fail").modal('show');
                    setTimeout(function(){
                        $(".message_add_fail").modal('hide');
                    },2000);
                }
            });
        }


        function RoomTypeAdd() {
            var name = $.trim($('#RoomManage_RoomTypeAddModal_Name').val());
            var detail = $.trim($('#RoomManage_RoomTypeAddModal_Detail').val());
            var price = $.trim($('#RoomManage_RoomTypeAddModal_Price').val());
            var jsondata = {"name": name, "detail": detail, "price": price};
            var page=document.getElementById("page").innerHTML;

            $.ajax({
                type: "post",
                data: JSON.stringify(jsondata),
                dateType: "json",
                url: "/HMS/Manage/RoomManage_Add.action",
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    var num="/HMS/Manage/RoomManage.action?pageNum="+page;

                    // var tr=document.createElement("tr");
                    // var tbody=document.getElementById("RoomManage_RoomType_Table");
                    // var th=tbody.lastElementChild.firstElementChild;
                    // var num=parseInt(th.innerHTML);
                    // var newnum=num+1;
                    //
                    // var newstr = "";
                    // newstr +="<th scope='row'>"+newnum+"</th>"+
                    //     "<input type='hidden' value='"+data.id+"'>"+
                    //     "<td>"+data.name+"</td>"+
                    //     "<td>"+data.amount+"</td>"+
                    //     "<td>"+data.price+"</td>"+
                    //     "<td>"+data.detail+"</td>"+
                    //     "<td><a><i class='fas fa-edit' data-toggle='modal' data-target='#RoomManage_RoomTypeUpdateModal'></i></a> &nbsp; &nbsp;<a> <i class='fas fa-times' onclick='RoomTypeDelete("+data.id+",this)'></i></a></td>";
                    // tr.innerHTML=newstr;
                    // tbody.appendChild(tr);


                    $('#RoomManage_RoomTypeAddModal').modal('hide');

                    $(".message_add_success").modal('show');
                    setTimeout(function(){
                        window.location.href=num;
                        $(".message_add_success").modal('hide');

                    },2000);

                },
                error: function () {
                        $(".message_add_success").modal('show');
                    setTimeout(function(){
                        $(".message_add_success").modal('hide');
                    },2000);
                }
            });
        }
        function RoomTypeUpdate(){
            var name = $.trim($('#RoomManage_RoomTypeUpdateModal_Name').val());
            var detail = $.trim($('#RoomManage_RoomTypeUpdateModal_Detail').val());
            var price = $.trim($('#RoomManage_RoomTypeUpdateModal_Price').val());
            var id = $.trim($('#RoomManage_RoomTypeUpdateModal_Id').val());
            var jsondata = {"name": name, "detail": detail, "price": price,"id":id};
            $.ajax({
                type: "post",
                data: JSON.stringify(jsondata),
                dateType: "json",
                url: "/HMS/Manage/RoomManage_Update.action",
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    if(data!=null)
                    {
                        var id2=id;
                        var c=$('#'+id2);



                        c.closest('tr').find('td').eq(0).text(data.name);
                        c.closest('tr').find('td').eq(2).text(data.price);
                        c.closest('tr').find('td').eq(3).text(data.detail);


                        $(".room_roomtype").each(function(){


                            // alert(data.id);
                            // alert($(this).val());
                            if(data.id== $(this).val()) {
                                $(this).next().find('small').eq(0).text(data.name);
                            }

                        });

                        $('#RoomManage_RoomTypeUpdateModal').modal('hide');
                        $(".message_update_success").modal('show');
                        setTimeout(function(){
                            $(".message_update_success").modal('hide');
                        },2000);
                    }
                    else
                    {
                        $('#RoomManage_RoomTypeUpdateModal').modal('hide');
                        $(".message_update_fail").modal('show');
                        setTimeout(function(){
                            $(".message_update_fail").modal('hide');
                        },2000);
                    }
                },
                error: function () {
                    $('#RoomManage_RoomTypeUpdateModal').modal('hide');
                    $(".message_update_fail").modal('show');
                    setTimeout(function(){
                        $(".message_update_fail").modal('hide');
                    },2000);
                }
            });
        }

        function RoomTypeDelete(id,obj) {
            var jsondata = id;
            var tr=obj.parentNode.parentNode.parentNode;
            var page=document.getElementById("page").innerHTML;
            $.ajax({
                type: "post",
                data: JSON.stringify(jsondata),
                dateType: "json",
                url: "/HMS/Manage/RoomManage_Delete.action",
                contentType: "application/json;charset=utf-8",
                success: function () {
                    //tr.parentNode.removeChild(tr);
                    var num="/HMS/Manage/RoomManage.action?pageNum="+page;
                    $(".message_delete_success").modal('show');
                    setTimeout(function(){
                        window.location.href=num;
                        $(".message_delete_success").modal('hide');

                    },2000);

                },
                error: function () {
                    $(".message_delete_fail").modal('show');
                    setTimeout(function(){
                        $(".message_delete_fail").modal('hide');
                    },2000);
                }

            });

        }
        function page(obj) {
            var num="/HMS/Manage/RoomManage.action?pageNum="+obj.innerHTML;
            window.location.href=num;

        }
        $(function(){
            $('#RoomManage_RoomTypeAddModal').on('hide.bs.modal', function () {
                $('#RoomManage_RoomTypeAddModal_Name').val('');
                $('#RoomManage_RoomTypeAddModal_Price').val('');
                $('#RoomManage_RoomTypeAddModal_Detail').val('');
            });

            $('#RoomManage_RoomTypeUpdateModal').on('show.bs.modal',function (event) {

                var btn=$(event.relatedTarget);
                var modal=$(this);
                var id=btn.closest('tr').find('input').eq(0).val();
                var name=btn.closest('tr').find('td').eq(0).text();
                var price1=btn.closest('tr').find('td').eq(2).text();
                var price2=price1.split('元')[0];
                var detail=btn.closest('tr').find('td').eq(3).text();
                modal.find('#RoomManage_RoomTypeUpdateModal_Name').val(name);
                modal.find('#RoomManage_RoomTypeUpdateModal_Price').val(price2);
                modal.find('#RoomManage_RoomTypeUpdateModal_Detail').val(detail);
                modal.find('#RoomManage_RoomTypeUpdateModal_Id').val(id);

            });

        })
    </script>
</body>
</html>
