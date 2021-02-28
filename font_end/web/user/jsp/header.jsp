<%-- 
    Document   : header
    Created on : Oct 6, 2020, 8:34:50 PM
    Author     : Tuan Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="header header-style-2">
    <div class="header-top header-top-1">
        <div class="container">
            <div class="row no-gutters align-items-center">
                <div class="col-lg-8 d-flex align-items-center flex-column flex-lg-row">


                </div>
                <div class="col-lg-4">
                    <div class="header-top-nav d-flex justify-content-lg-end justify-content-center">


                        <div class="user-info header-top-nav__item">
                            <div class="dropdown header-top__dropdown">
                                <a class="dropdown-toggle" id="userID" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    My Account
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="userID">
                                    <%
                                        HttpSession sessions = request.getSession();
                                        String userId = (String) sessions.getAttribute("userId");
                                        if (userId != null) {
                                    %>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/myAccountController/myAccount.htm">My Account</a>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginUserController/logout.htm">Log Out</a>
                                    <%
                                    } else {
                                    %>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginUserController/login.htm">Register</a>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/loginUserController/login.htm">Log In</a>
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
    </div>
    <div class="header-middle header-middle-2">
        <div class="container">
            <div class="row no-gutters align-items-center">
                <div class="col-lg-4">
                    <a href="<%=request.getContextPath()%>/indexController/getAll.htm" class="logo-box text-lg-left text-center mb-md--30">
                        <img src="../user/img/logo/logo.png" alt="logo">
                    </a>
                </div>
                <div class="col-lg-8">
                    <div class="header-toolbar header-toolbar-2">
                        <div class="search-form-wrapper search-form-wrapper-2">
                            <form action="#" class="search-form search-form-2">
                                <input type="text" name="search" id="search" class="search-form__input" placeholder="Search entire store here..">
                                <button type="submit" class="search-form__submit">
                                    <i class="icon_search"></i>
                                </button>
                            </form>
                        </div>
                        <ul class="header-toolbar-icons">

                            <li class="wishlist-icon">
                                <a href="<%=request.getContextPath()%>/favoriteController/getAll.htm" class="bordered-icon"><i class="fa fa-heart"></i></a>
                            </li>
                            <li class="mini-cart-icon">
                                <div class="mini-cart mini-cart--1">
                                    <a class="mini-cart__dropdown-toggle bordered-icon" id="cartDropdown">
                                        <span class="mini-cart__count">${size}</span>
                                        <i class="icon_cart_alt mini-cart__icon"></i>
                                        <span class="mini-cart__ammount">${tongTien}<i class="fa fa-angle-down"></i></span>
                                    </a>
                                    <div class="mini-cart__dropdown-menu">
                                        <div class="mini-cart__content" id="miniCart">
                                            <div class="mini-cart__item">
                                                <c:forEach items="${listCart}" var="cart">
                                                    <div class="mini-cart__item--single">

                                                        <div class="mini-cart__item--image">
                                                            <img src="${cart.pro.imageMain}">
                                                        </div>
                                                        <div class="mini-cart__item--content">
                                                            <h4 class="mini-cart__item--name"><a href="product-details.html">${cart.pro.productName}</a> </h4>
                                                            <p class="mini-cart__item--quantity">${cart.quantity}</p>
                                                            <p class="mini-cart__item--price">${cart.pro.price}</p>
                                                        </div>
                                                        <a class="mini-cart__item--remove" href="#"><i class="icon_close"></i></a>

                                                    </div>
                                                </c:forEach>   
                                            </div>
                                            <div class="mini-cart__calculation">

                                                <p>
                                                    <span class="mini-cart__calculation--item"> Total :</span>
                                                    <span class="mini-cart__calculation--ammount">${tongTien}</span>
                                                </p>
                                            </div>
                                            <div class="mini-cart__btn">
                                                <a href="<%=request.getContextPath()%>/cartController/getCart.htm" class="btn btn-fullwidth btn-style-1">View Cart</a>
                                                
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>  
            </div>
        </div>
    </div>
    <div class="header-bottom header-bottom-2 position-relative navigation-wrap fixed-header">
        <div class="container position-static">
            <div class="row">
                <div class="col-12 position-static">
                    <nav class="main-navigation">
                        <ul class="mainmenu">
                            <li class="mainmenu__item">
                                <a href="<%=request.getContextPath()%>/indexController/getAll.htm" class="mainmenu__link">Home</a>

                            </li>
                            <li class="mainmenu__item">
                                <a href="<%=request.getContextPath()%>/shopController/shop.htm" class="mainmenu__link">Shop</a>

                            </li>
                            <li class="mainmenu__item">
                                <a href="blog.html" class="mainmenu__link">Blog</a>

                            <li class="mainmenu__item">
                                <a href="about.html" class="mainmenu__link">About Us</a>
                            </li>
                            <li class="mainmenu__item">
                                <a href="contact.html" class="mainmenu__link">contact Us</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-12">
                    <div class="mobile-menu"></div>
                </div>
            </div>
        </div>
    </div>
</header>
