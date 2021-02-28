<%-- 
    Document   : favorite
    Created on : Nov 4, 2020, 4:27:46 PM
    Author     : Tuan Hoang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Favorite</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="meta description">
        <link rel="shortcut icon" href="../admin/img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="../admin/img/icon.png">
        <link rel="stylesheet" href="../user/css/bootstrap.min.css">
        <link rel="stylesheet" href="../user/css/font-awesome.min.css">
        <link rel="stylesheet" href="../user/css/elegent-icons.css">
        <link rel="stylesheet" href="../user/css/plugins.css">
        <link rel="stylesheet" href="../user/css/main.css">
        <script src="../user/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <div class="wrapper bg--shaft">
            <div class="main-content-wrapper">
                <jsp:include page="header.jsp"/>
                <div class="wishlist-area pt--40 pb--80 pt-md--30 pb-md--60">
                    <div class="container">
                        <!-- Wishlist Area Start -->
                        <div class="wishlist-wrapper bg--2">
                            <div class="row">
                                <div class="col-12">
                                    <form action="#" class="form form--cart">
                                        <div class="wishlist-table table-content table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>remove</th>
                                                        <th>Images</th>
                                                        <th>Product</th>
                                                        <th>Unit Price</th>
                                                        <th>Add to Cart</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${user.favorites}" var="fa">
                                                        <tr>
                                                            <td><a class="delete" href="remove.htm?favoriteId=${fa.favoriteId}"><i class="fa fa-times"></i></a></td>
                                                            <td><img src="${fa.product.imageMain}"></td>
                                                            <td>${fa.product.productName}</td>
                                                            <td class="cart-product-price"><strong>$${fa.product.price*(1-fa.product.discount)}</strong></td>
                                                            <td><a href="addCart.htm?productId=${fa.product.productId}&favoriteId=${fa.favoriteId}" class="btn  add-to-cart btn-medium btn-style-2">Add to Cart</a></td>
                                                        </tr>   
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>  
                                </div>
                            </div>
                        </div>

                    </div>   
                </div>

            </div>
            <jsp:include page="footer.jsp"/>
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
