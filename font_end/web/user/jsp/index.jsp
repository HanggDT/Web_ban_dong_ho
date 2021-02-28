<%-- 
    Document   : index
    Created on : Oct 6, 2020, 9:11:02 PM
    Author     : Tuan Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Mirora - Watch & Luxury Store Bootstrap 4 Template</title>

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
            <div class="main-content-wrapper">
                <!--                Slider-->
                <div class="slider-area">
                    <div class="homepage-slider">
                        <c:forEach items="${listBan}" var="ban">
                            <div class="single-slider content-v-center" style="background-image: url(${ban.imagelink})">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="slider-content">
                                                <h5 data-animation="rollIn" data-duration=".8s" data-delay=".5s">Sale Off This Week</h5>
                                                <h1 data-animation="fadeInDown" data-duration=".8s" data-delay=".2s">${ban.bannerName}</h1>
                                                <div class="slide-btn-group" data-animation="fadeInUp" data-duration="1s" data-delay=".3s">
                                                    <a href="${ban.bannerLink}" class="btn btn-bordered btn-style-1">Shop Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <!--                End Slider-->
                <!--Most Viewed-->
                <section class="mostviewed-product-area pt--80 pb--20 pt-md--60">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="section-title mb--15">
                                    <h2 class="color--white">Mostviewed Products</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters">
                            <div class="col-12">
                                <div class="product-carousel nav-top js-product-carousel-2">
                                    <c:forEach items="${listPro}" var="pro">
                                        <div class="mirora-product">
                                            <div class="product-img">
                                                <img src="${pro.imageMain}" alt="Product" class="primary-image" />
                                                <img src="${pro.imageMain}" alt="Product" class="secondary-image" />
                                                <div class="product-img-overlay">
                                                    <c:if test="${pro.discount>0}">
                                                        <span class="product-label discount">
                                                            -<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.discount*100}" />%

                                                        </span>
                                                    </c:if>

                                                </div>
                                            </div>
                                            <div class="product-content text-center">

                                                <h4><a href="<%=request.getContextPath()%>/prodetailController/getpro.htm?proId=${pro.productId}">${pro.productName}</a></h4>
                                                <div class="product-price-wrapper">
                                                    <c:if test="${pro.discount >0}">
                                                        <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price*(1-pro.discount)}" /></span>
                                                        <span class="product-price-old">
                                                            <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price}" /></span>
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${pro.discount==0}">
                                                        <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price}" /></span>
                                                    </c:if>


                                                </div>
                                            </div>
                                            <div class="mirora_product_action text-center position-absolute">
                                                <!--                                                <div class="product-rating">
                                                                                                    <span>
                                                                                                        <i class="fa fa-star theme-star"></i>
                                                                                                        <i class="fa fa-star theme-star"></i>
                                                                                                        <i class="fa fa-star theme-star"></i>
                                                                                                        <i class="fa fa-star theme-star"></i>
                                                                                                        <i class="fa fa-star"></i>
                                                                                                    </span>
                                                                                                </div>-->
                                                <!--                                                <p>
                                                ${pro.productDescription}
                                            </p>-->
                                                <div class="product-action">
                                                    <a class="same-action" href="<%=request.getContextPath()%>/favoriteController/addFa.htm?productId=${pro.productId}" title="wishlist">
                                                        <i class="fa fa-heart-o"></i>
                                                    </a>
                                                    <a class="add_cart cart-item action-cart" href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${pro.productId}" title="wishlist"><span>Add to cart</span></a>

                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--End Most Viewed-->

                <div class="corporate-area pt--40 pb--80 pt-md--30 pb-md--60">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mb-sm--20">
                                <div class="corporate text-center">
                                    <h3>Money Return Guarantee</h3>
                                    <p>Back guarantee under 30 days</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="corporate text-center">
                                    <h3>Free Shipping On Order Over $120</h3>
                                    <p>Free shipping on all order</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Product Tab-->
                <div class="product-tab bg--dark-4 pt--80 pb--60 pt-md--60 pb-md--45">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 text-center">
                                <ul class="nav nav-tabs product-tab__head bg--dark-4" id="product-tab" role="tablist">

                                    <li class="product-tab__item nav-item active">
                                        <a class="product-tab__link nav-link active" id="nav-new-tab" data-toggle="tab" href="#nav-new" role="tab" aria-selected="true" >New Arrivals</a>
                                    </li>
                                    <li class="product-tab__item nav-item">
                                        <a class="product-tab__link nav-link" id="nav-bestseller-tab" data-toggle="tab" href="#nav-bestseller" role="tab" aria-selected="true">Bestseller</a>
                                    </li>
                                    <li class="product-tab__item nav-item">
                                        <a class="product-tab__link nav-link" id="nav-onsale-tab" data-toggle="tab" href="#nav-onsale" role="tab" aria-selected="false" >On Sale</a>
                                    </li>
                                </ul>
                                <div class="tab-content product-tab__content" id="product-tabContent">
                                    <!--New Arrival-->
                                    <div class="tab-pane fade show active" id="nav-new" role="tabpanel">
                                        <div class="product-carousel js-product-carousel">
                                            <c:forEach items="${listProArrival}" var="pro">
                                                <div class="product-carousel-group">
                                                    <div class="mirora-product bg--dark-4">
                                                        <div class="product-img">
                                                            <img src="${pro.imageMain}" alt="Product" class="primary-image" />
                                                            <img src="${pro.imageMain}" alt="Product" class="secondary-image" />
                                                            <div class="product-img-overlay">
                                                                <!--                                                                <span class="product-label discount">
                                                                                                                                    -7%
                                                                                                                                </span>
                                                                                                                                <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>-->
                                                            </div>
                                                        </div>
                                                        <div class="product-content text-center">

                                                            <h4><a href="<%=request.getContextPath()%>/prodetailController/getpro.htm?proId=${pro.productId}">${pro.productName}</a></h4>
                                                            <div class="product-price-wrapper">
                                                                <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price}" /></span>
                                                                <!--                                                                <span class="product-price-old">
                                                                                                                                    <span class="money">$700.00</span>
                                                                                                                                </span>-->
                                                            </div>
                                                        </div>
                                                        <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                            <!--                                                            <div class="product-rating">
                                                                                                                            <span>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star"></i>
                                                                                                                            </span>
                                                                                                                        </div>
                                                                                                                        <p>
                                                            ${pro.productDescription}
                                                        </p>-->
                                                            <div class="product-action">
                                                                <a class="same-action" href="<%=request.getContextPath()%>/favoriteController/addFa.htm?productId=${pro.productId}" title="wishlist">
                                                                    <i class="fa fa-heart-o"></i>
                                                                </a>
                                                                <a class="add_cart cart-item action-cart" href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${pro.productId}" title="wishlist"><span>Add to cart</span></a>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:forEach>

                                        </div>

                                    </div>
                                    <!--End New Arrival-->
                                    <!--BestSaller-->
                                    <div class="tab-pane fade" id="nav-bestseller" role="tabpanel">
                                        <div class="product-carousel js-product-carousel">
                                            <div class="product-carousel-group">
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/9-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/9-9-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/6-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/6-6-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-carousel-group">
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/5-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/5-5-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/4-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/4-4-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-carousel-group">
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/3-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/3-3-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/3-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/3-3-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-carousel-group">
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/1-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/1-1-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/7-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/2-2-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-carousel-group">
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/8-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/8-8-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mirora-product bg--dark-4">
                                                    <div class="product-img">
                                                        <img src="assets/img/products/10-450x450.jpg" alt="Product" class="primary-image" />
                                                        <img src="assets/img/products/10-10-450x450.jpg" alt="Product" class="secondary-image" />
                                                        <div class="product-img-overlay">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span>
                                                            <a data-toggle="modal" data-target="#productModal" class="btn btn-transparent btn-fullwidth btn-medium btn-style-1">Quick View</a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <span>Cartier</span>
                                                        <h4><a href="product-details.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price-wrapper">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">$700.00</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                        <div class="product-rating">
                                                            <span>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star theme-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        </div>
                                                        <p>
                                                            It is a long established fact that a reader will be distracted by the readable content...
                                                        </p>
                                                        <div class="product-action">
                                                            <a class="same-action" href="wishlist.html" title="wishlist">
                                                                <i class="fa fa-heart-o"></i>
                                                            </a>
                                                            <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                            <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                                <i class="fa fa-sliders fa-rotate-90"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End BestSaller-->
                                    <!--On sale-->
                                    <div class="tab-pane fade" id="nav-onsale" role="tabpanel">
                                        <div class="product-carousel js-product-carousel">
                                            <c:forEach items="${listOnSale}" var="pro">
                                                <div class="product-carousel-group">
                                                    <div class="mirora-product bg--dark-4">
                                                        <div class="product-img">
                                                            <img src="${pro.imageMain}" alt="Product" class="primary-image" />
                                                            <img src="${pro.imageMain}" alt="Product" class="secondary-image" />
                                                            <div class="product-img-overlay">
                                                                <span class="product-label discount">
                                                                    -<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.discount*100}" />%

                                                                </span>

                                                            </div>
                                                        </div>
                                                        <div class="product-content text-center">

                                                            <h4><a href="<%=request.getContextPath()%>/prodetailController/getpro.htm?proId=${pro.productId}">${pro.productName}</a></h4>
                                                            <div class="product-price-wrapper">
                                                                <c:if test="${pro.discount >0}">
                                                                    <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price*(1-pro.discount)}" /></span>
                                                                    <span class="product-price-old">
                                                                        <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price}" /></span>
                                                                    </span>
                                                                </c:if>
                                                                <c:if test="${pro.discount==0}">
                                                                    <span class="money">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price}" /></span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="mirora_product_action bg--dark-4 text-center position-absolute">
                                                            <!--                                                            <div class="product-rating">
                                                                                                                            <span>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star theme-star"></i>
                                                                                                                                <i class="fa fa-star"></i>
                                                                                                                            </span>
                                                                                                                        </div>
                                                                                                                        <p>
                                                            ${pro.productDescription}
                                                        </p>-->
                                                            <div class="product-action">
                                                                <a class="same-action" href="<%=request.getContextPath()%>/favoriteController/addFa.htm?productId=${pro.productId}" title="wishlist">
                                                                    <i class="fa fa-heart-o"></i>
                                                                </a>
                                                                <a class="add_cart cart-item action-cart" href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${pro.productId}" title="wishlist"><span>Add to cart</span></a>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Product Tab-->
            </div>
            <jsp:include page="footer.jsp"/>   
            <a class="scroll-to-top" href="#"><i class="fa fa-angle-double-up"></i></a>
        </div>
        <!-- ************************* JS Files ************************* -->

        <!-- jQuery JS -->
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
