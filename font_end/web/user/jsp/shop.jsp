<%-- 
    Document   : shop
    Created on : Oct 23, 2020, 9:39:27 AM
    Author     : Thanh Nam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="meta description">
        <!-- Favicons -->
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="assets/img/icon.png">

        <!-- Title -->
        <title>Mirora - Shop</title>

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
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h1 class="page-title">Shop</h1>
                            <ul class="breadcrumb justify-content-center">
                                <li><a href="index.html">Home</a></li>
                                <li class="current"><a href="shop.html">Shop</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-content-wrapper">
                <div class="shop-area pt--40 pb--80 pt-md--30 pb-md--60">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9 order-lg-2 mb-md--30">
                                <div class="row">
                                    <div class="col-12">
                                        <!-- Refine Search Start -->
                                        <div class="refine-search mb--30">

                                        </div>
                                        <!-- Refine Search End -->

                                        <!-- Shop Toolbar Start -->
                                        <div class="shop-toolbar">
                                            <div class="product-view-mode" data-default="3">
                                                <a class="grid-2" data-target="gridview-2" data-toggle="tooltip" data-placement="top" title="2">2</a>
                                                <a class="active grid-3" data-target="gridview-3" data-toggle="tooltip" data-placement="top" title="3">3</a>
                                                <a class="grid-4" data-target="gridview-4" data-toggle="tooltip" data-placement="top" title="4">4</a>
                                                <a class="grid-5" data-target="gridview-5" data-toggle="tooltip" data-placement="top" title="5">5</a>
                                                <a class="list" data-target="listview" data-toggle="tooltip" data-placement="top" title="list">List</a>
                                            </div>
                                            <span class="product-pages">Showing 1 to 9 of 11 (2 Pages)</span>
                                            <div class="product-showing">
                                                <label class="select-label">Show:</label>
                                                <select class="short-select nice-select">
                                                    <option value="1">9</option>

                                                </select>
                                            </div>
                                            <div class="product-short">
                                                <label class="select-label">Short By:</label>
                                                <select class="short-select nice-select">
                                                    <option value="1">Relevance</option>
                                                    <option value="2">Name, A to Z</option>
                                                    <option value="3">Name, Z to A</option>
                                                    <option value="4">Price, low to high</option>
                                                    <option value="5">Price, high to low</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Shop Toolbar End -->
                                    </div>
                                </div>

                                <!-- Main Shop wrapper Start -->
                                <div class="shop-product-wrap grid gridview-3 row no-gutters">
                                    <c:forEach items="${listPro}" var="pro">
                                        <div class="col-xl-3 col-lg-4 col-md-6 col-12">


                                            <div class="mirora-product mb-md--10">
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
<!--                                                    <div class="product-rating">
                                                        <span>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </span>
                                                    </div>
                                                    <p>${pro.productDescription}</p>-->
                                                    <div class="product-action">
                                                        <a class="same-action" href="<%=request.getContextPath()%>/favoriteController/addFa.htm?productId=${pro.productId}" title="wishlist">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a class="add_cart cart-item action-cart" href="<%=request.getContextPath()%>/cartController/addCart.htm?productId=${pro.productId}" title="wishlist"><span>Add to cart</span></a>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mirora-product-list">
                                                <div class="product-img">
                                                    <img src="${pro.imageMain}" alt="Product" class="primary-image" />
                                                    <img src="${pro.imageMain}" alt="Product" class="secondary-image" />
                                                    <div class="product-img-overlay">
                                                        <c:if test="${pro.discount>0}">
                                                            <span class="product-label discount">
                                                                -7%
                                                            </span> 
                                                        </c:if>

                                                    </div>
                                                </div>
                                                <div class="product-content">

                                                    <h4><a href="<%=request.getContextPath()%>/prodetailController/getpro.htm?proId=${pro.productId}">${pro.productName}</a></h4>
                                                    <div class="product-rating">
                                                        <span>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star theme-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </span>
                                                    </div>
                                                    <p class="product-desc">
                                                        ${pro.productDescription}
                                                    </p>
                                                    <div class="product-price-wrapper">
                                                        <c:if test="${pro.discount >0}">
                                                            <span class="money">$550.00</span>
                                                            <span class="product-price-old">
                                                                <span class="money">${pro.price}</span>
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${pro.discount==0}">
                                                            <span class="money">${pro.price}</span>
                                                        </c:if>

                                                    </div>
                                                    <div class="product-action">
                                                        <a class="add_cart cart-item action-cart" href="cart.html" title="wishlist"><span>Add to cart</span></a>
                                                        <a class="same-action" href="wishlist.html" title="wishlist">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a class="same-action compare-mrg" data-toggle="modal" data-target="#productModal" href="compare.html">
                                                            <i class="fa fa-sliders fa-rotate-90"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Main Shop wrapper End -->

                                <!-- Pagination Start -->
                                <div class="pagination-wrap mt--15 mt-md--10">
                                    <p class="page-ammount">Showing 1 to 9 of 15 (2 Pages)</p>
                                    <ul class="pagination">
                                        <li><a href="#" class="first">|&lt;</a></li>
                                        <li><a href="#" class="prev">&lt;</a></li>
                                        <li><a href="#" class="current">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#" class="next">&gt;</a></li>
                                        <li><a href="#" class="next">&gt;|</a></li>
                                    </ul>
                                </div>
                                <!-- Pagination End -->
                            </div>
                            <div class="col-lg-3 order-lg-1">
                                <aside class="shop-sidebar">
                                    <div class="search-filter">

                                        <div class="filter-price">
                                            <h3 class="filter-heading">Price</h3>
                                            <ul class="filter-list">
                                                <li>
                                                    <div class="filter-input filter-radio">                          
                                                        <input type="radio" name="pricerange" id="pricerange-1"  >
                                                        <label for="pricerange-1">$55 - $100 </label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="filter-input filter-radio">
                                                        <input type="radio" name="pricerange" id="pricerange-2" >
                                                        <label for="pricerange-2">$100 - $200 </label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="filter-input filter-radio">
                                                        <input type="radio" name="pricerange" id="pricerange-3" >
                                                        <label for="pricerange-3">$300 - $500 </label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="filter-input filter-radio">
                                                        <input type="radio" name="pricerange" id="pricerange-4">
                                                        <label for="pricerange-4">$700 - $1000 </label>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="filter-categories">
                                            <h3 class="filter-heading">Categories</h3>
                                            <ul class="filter-list">
                                                <c:forEach items="${listCat}" var="cat">
                                                    <li>

                                                        <div class="filter-input filter-checkbox">
                                                            <c:choose>

                                                                <c:when test = "${cat.catName == priceFilter}">
                                                                    <input type="checkbox" name="${cat.catName}" id="${cat.catName}" checked="true">
                                                                    <label for="${cat.catName}">${cat.catName}</label>
                                                                </c:when>


                                                                <c:otherwise>
                                                                    <input type="checkbox" name="${cat.catName}" id="${cat.catName}">
                                                                    <label for="${cat.catName}">${cat.catName}</label>
                                                                </c:otherwise>
                                                            </c:choose>
<!--                                                            <input type="checkbox" name="${cat.catName}" id="${cat.catName}">
                                                            <label for="${cat.catName}">${cat.catName}</label>-->


                                                        </div>
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>
                                        <div class="filter-color">
                                            <h3 class="filter-heading">Color</h3>
                                            <ul class="filter-list">
                                                <c:forEach items="${listColor}" var="col">
                                                    <li>
                                                        <div class="filter-input filter-checkbox">
                                                            <input type="checkbox" name="${col.colorName}" id="${col.colorName}">
                                                            <label for="${col.colorName}">${col.colorName}</label>
                                                        </div>
                                                    </li> 
                                                </c:forEach>
                                            </ul>
                                        </div>

                                    </div>
                                    <div class="banner-static">
                                        <a href="#">
                                            <img src="../user/img/banner/img-sidebar.jpg" alt="Banner">
                                        </a>
                                    </div>
                                </aside>
                            </div>
                        </div>
                    </div>
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
