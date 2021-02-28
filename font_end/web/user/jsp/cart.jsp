<%-- 
    Document   : cart
    Created on : Oct 23, 2020, 4:24:54 PM
    Author     : Tuan Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
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
            <jsp:include page="header.jsp"/>
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h1 class="page-title">Cart</h1>
                            <ul class="breadcrumb justify-content-center">
                                <li><a href="<%=request.getContextPath()%>/userBannerController/getAll.htm">Home</a></li>
                                <li class="current"><a href="getCart.htm">Cart</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-content-wrapper">
                <div class="cart-area pt--40 pb--80 pt-md--30 pb-md--60">
                    <div class="container">
                        <div class="cart-wrapper bg--2 mb--80 mb-md--60">
                            <div class="row">
                                <div class="col-12">
                                    <form action="updateQuantity.htm" class="form cart-form" method="POST">
                                        <div class="cart-table table-content table-responsive">

                                            <table class="table mb--30">
                                                <thead>
                                                    <tr>
                                                        <th>remove</th>
                                                        <th>Images</th>
                                                        <th>Product</th>
                                                        <th>Colors</th>
                                                        <th>Unit Price</th>
                                                        <th>Quantity</th>
                                                        <th>Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listCart}" var="cart">
                                                        <tr>
                                                            <td><a class="delete" href="deleteCart.htm?productId=${cart.pro.productId}"><i class="fa fa-times"></i></a></td> 
                                                            <td><img src="${cart.pro.imageMain}"></td>
                                                            <td>${cart.pro.productName}</td>
                                                            <td>
                                                                <c:if test="${cart.color == null}">
                                                                    <select name="color">
                                                                        <c:forEach items="${cart.pro.productDetails}" var="proD">
                                                                            <option value="${proD.colors.colorId}">${proD.colors.colorName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:if>
                                                                <c:if test="${cart.color != null}">
                                                                    <c:forEach items="${cart.pro.productDetails}" var="proD">
                                                                        <c:if test="${proD.colors.colorId == cart.color}">
                                                                            ${proD.colors.colorName}
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    
                                                                </c:if>
                                                            </td>
                                                            <td class="cart-product-price"><strong>$${cart.pro.price*(1-cart.pro.discount)}</strong></td>
                                                            <td>
                                                                <div class="quantity">
                                                                    <input type="number" class="quantity-input"  name="quantity" id="pro_qty" value="${cart.quantity}" min="1">
                                                                </div>
                                                            </td>

                                                            <td class="cart-product-price"><strong>$${cart.pro.price*cart.quantity*(1-cart.pro.discount)}</strong></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td colspan="6">Total Amount</td>
                                                        <td colspan="1" class="cart-product-price"><strong>$${tongTien}</strong></td>

                                                    </tr>     

                                                </tbody>
                                            </table>    

                                            <div class="col-12 text-md-right">
                                                <div class="cart-btn-group">
                                                    <button type="submit" class="btn btn-medium btn-style-3" >Update Cart</button>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                    <div class="col-12 text-md-right">
                                        <%
                                            HttpSession sessions = request.getSession();
                                            String userId = (String) sessions.getAttribute("userId");
                                            if (userId != null) {
                                        %>
                                        <div class="cart-btn-group">
                                            <a href="<%=request.getContextPath()%>/orderController/placeOrder.htm" class="btn btn-medium btn-style-3">Place Order</a>
                                        </div>
                                        <%
                                        } else {
                                        %>
                                        <div class="cart-btn-group">
                                            <a href="<%=request.getContextPath()%>/loginUserController/login.htm" class="btn btn-medium btn-style-3">Login</a>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>







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
