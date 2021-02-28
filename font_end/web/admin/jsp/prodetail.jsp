<%-- 
    Document   : prodetail
    Created on : Oct 19, 2020, 5:21:10 PM
    Author     : Thanh Nam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Product Detail</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="../admin/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="../admin/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>
    <%
            HttpSession sessions = request.getSession();
            String email = (String)sessions.getAttribute("email");
            if(email!=null){
                %>
    <body>
        <!-- Site wrapper -->
        <div class="wrapper">
            <jsp:include page="header.jsp"/>
            <jsp:include page="sidebar.jsp"/>
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Product Detail</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Product Detail</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="card card-solid">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <h3 class="d-inline-block d-sm-none">${pro.productName}</h3>
                                    <div class="col-12">
                                        <img src="${pro.imageMain}" class="product-image" alt="Product Image">
                                    </div>
                                    <div class="col-12 product-image-thumbs">
                                        <div class="product-image-thumb" ><img src="${pro.imageMain}" alt="Product Image"></div>
                                            <c:forEach items="${pro.imageses}" var="img">
                                                
                                                    <div class="product-image-thumb active"><img src="${img.imageLink}" alt="Product Image"></div>
                                                
                                            </c:forEach>

                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <h3 class="my-3">${pro.productName}</h3>
                                    <p>${pro.productDescription}</p>

                                    <hr>
                                    <h4>Available Colors</h4>
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <c:forEach items="${pro.productDetails}" var="prodetail">
                                            <label class="btn btn-default text-center active">
                                                <input type="radio" name="color_option" id="color_option1" autocomplete="off" checked="">
                                                ${prodetail.colors.colorName}
                                                <br>
<!--                                                <i class="fas fa-circle fa-2x"></i>-->
                                            </label>
                                        </c:forEach>

                                    </div>

                                    <h4 class="mt-3">Categories</h4>
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <c:forEach items="${pro.catProducts}" var="cat">
                                            <label class="btn btn-default text-center">
                                                <input type="radio" name="color_option" id="color_option1" autocomplete="off">
                                                <span>${cat.categories.catName}</span>
                                                
                                                
                                            </label>
                                        </c:forEach>
                                        
                                    </div>

                                    <div class="bg-gray py-2 px-3 mt-4">
                                        <h2 class="mb-0">
                                            $80.00
                                        </h2>
                                        <h4 class="mt-0">
                                            <small>Ex Tax: $80.00 </small>
                                        </h4>
                                    </div>

                                    <div class="mt-4">
                                        <div class="btn btn-primary btn-lg btn-flat">
                                            <i class="fas fa-cart-plus fa-lg mr-2"></i> 
                                            Add to Cart
                                        </div>

                                        <div class="btn btn-default btn-lg btn-flat">
                                            <i class="fas fa-heart fa-lg mr-2"></i> 
                                            Add to Wishlist
                                        </div>
                                    </div>

                                    

                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                </section>
                <!-- /.content -->
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
        <script src="../admin/js/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../admin/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../admin/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../admin/js/demo.js"></script>
    </body>
    <%
            }else{
                HttpServletResponse Res = (HttpServletResponse)response;
                Res.sendRedirect("../loginController/login.htm");
                
            }
        %>
</html>
