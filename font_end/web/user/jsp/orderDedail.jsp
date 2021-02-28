<%-- 
    Document   : orderDedail
    Created on : Nov 6, 2020, 3:57:28 PM
    Author     : Tuan Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="meta description">
        <!-- Favicons -->
        <link rel="shortcut icon" href="../user/img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="../user/img/icon.png">

        <!-- Title -->
        <title>Mirora - Watch Store</title>

        <!-- ************************* CSS Files ************************* -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../user/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="../user/css/font-awesome.min.css">

        <!-- Elegent Icon CSS -->
        <link rel="stylesheet" href="../user/css/elegent-icons.css">

        <!-- All Plugins CSS css -->
        <link rel="stylesheet" href="../user/css/plugins.css">

        <!-- style css -->
        <link rel="stylesheet" href="../user/css/main.css">

        <!-- modernizr JS
        ============================================ -->
        <script src="../user/js/vendor/modernizr-2.8.3.min.js"></script>

    </head>
    <body>
        <div class="wrapper bg--shaft">
            <jsp:include page="header.jsp"/>
            
                <div class="order-details">
                    <h3 class="heading-tertiary">Your Order</h3>
                    <div class="order-table table-content table-responsive mb--30">
                        <table class="table">
                            <thead>
                                <tr>

                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Colors</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listDetail}" var="ord">
                                    <tr>
                                        <td>${ord.productDetail.product.productName}</td>
                                        <td>${ord.quantity}</td>
                                        <td>${ord.productDetail.colors.colorName}</td>
                                        <td>${ord.productDetail.product.price*(1-ord.productDetail.product.discount)*ord.quantity}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr class="order-total">
                                    <th colspan="3">Order Total</th>
                                    <td><span class="order-total-ammount">${od.totalAmount}</span></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

            
            <jsp:include page="footer.jsp"/>
            <a class="scroll-to-top" href="#"><i class="fa fa-angle-double-up"></i></a>
        </div>
        <script src="../user/js/vendor/jquery.min.js"></script>

        <!-- Bootstrap and Popper Bundle JS -->
        <script src="../user/js/bootstrap.bundle.min.js"></script>

        <!-- All Plugins Js -->
        <script src="../user/js/plugins.js"></script>
        <!-- Ajax Mail Js -->
        <script src="../user/js/ajax-mail.js"></script>

        <!-- Main JS -->
        <script src="../user/js/main.js"></script>                       
    </body>
</html>
