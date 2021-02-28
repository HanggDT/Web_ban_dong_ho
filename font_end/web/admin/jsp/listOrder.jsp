<%-- 
    Document   : listOrder
    Created on : Nov 4, 2020, 9:51:13 PM
    Author     : Thanh Nam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Orders</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../admin/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="../admin/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="../admin/css/responsive.bootstrap4.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../admin/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    </head>
    <%
        HttpSession sessions = request.getSession();
        String email = (String) sessions.getAttribute("email");
        if (email != null) {
    %>
    <body>
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <jsp:include page="sidebar.jsp"/>
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Quản lý Order</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Orders</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">

                                <!-- /.card -->

                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Danh sách Order</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">

                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Order Id</th>
                                                    <th>User</th>                                               
                                                    <th>Create Date</th>
                                                    <th>Total Amount</th>                                              
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listOr}" var="ord">
                                                    <tr>
                                                        <td>${ord.orderId}</td>
                                                        <td>${ord.users.userName}</td>
                                                        <td>${ord.createdDate}</td>
                                                        <td>${ord.totalAmount}</td>
                                                        <td>
                                                            <c:if test="${ord.orderStatus == false}">
                                                                Processing
                                                            </c:if>
                                                            <c:if test="${ord.orderStatus == true}">
                                                                Completed
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-outline-primary"><a href="auth.htm?orderId=${ord.orderId}">Duyệt</a></button>

                                                            <button class="btn btn-outline-primary"><a href="#">Details</a></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Order Id</th>
                                                    <th>User</th>                                               
                                                    <th>Create Date</th>
                                                    <th>Total Amount</th>                                              
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
        <script src="../admin/js/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../admin/js/bootstrap.bundle.min.js"></script>
        <script src="../admin/js/jquery.dataTables.min.js"></script>
        <script src="../admin/js/dataTables.bootstrap4.min.js"></script>
        <script src="../admin/js/dataTables.responsive.min.js"></script>
        <script src="../admin/js/responsive.bootstrap4.min.js"></script>
        <script src="../admin/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../admin/js/demo.js"></script>
        <!-- page script -->
        <script>
            $(function () {
                $("#example1").DataTable({
                    "responsive": true,
                    "autoWidth": false,
                });
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                    "responsive": true,
                });
            });
        </script>
    </body>
    <%
        } else {
            HttpServletResponse Res = (HttpServletResponse) response;
            Res.sendRedirect("../loginController/login.htm");

        }
    %>
</html>
