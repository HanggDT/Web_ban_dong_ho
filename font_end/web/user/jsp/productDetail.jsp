<%-- 
    Document   : productDetail
    Created on : Oct 22, 2020, 4:00:29 PM
    Author     : Tuan Hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="meta description">
        <link rel="shortcut icon" href="../user/img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="../user/img/icon.png">
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
                            <h1 class="page-title">Product Detail</h1>
                            <ul class="breadcrumb justify-content-center">
                                <li><a href="<%=request.getContextPath()%>/indexController/getAll.htm">Home</a></li>
                                <li><a href="<%=request.getContextPath()%>/shopController/shop.htm">Shop</a></li>
                                <li class="current"><a href="#">Product Detail</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-content-wrapper">
                <div class="single-products-area section-padding section-md-padding">
                    <div class="container">
                        <!-- Single Product Start -->
                        <section class="mirora-single-product pb--80 pb-md--60">
                            <div class="row">
                                <div class="col-lg-6">
                                    <!-- Tab Content Start -->
                                    <div class="tab-content product-details-thumb-large" id="myTabContent-3">
                                        <div class="tab-pane fade show active" id="product-large-one">
                                            <div class="product-details-img easyzoom">
                                                <a class="popup-btn" href="${pro.imageMain}">
                                                    <img src="${pro.imageMain}" alt="product">
                                                </a>
                                            </div>
                                        </div>
                                        <c:forEach items="${pro.imageses}" var="img">
                                            <div class="tab-pane fade" id="product-large-${img.imageId}">
                                                <div class="product-details-img easyzoom">
                                                    <a class="popup-btn" href="${img.imageLink}">
                                                        <img src="${img.imageLink}" alt="product">
                                                    </a>
                                                </div>
                                            </div>

                                        </c:forEach>

                                    </div>
                                    <!-- Tab Content End -->

                                    <!-- Product Thumbnail Carousel Start -->
                                    <div class="product-details-thumbnail">
                                        <div class="thumb-menu product-details-thumb-menu nav-vertical-center" id="thumbmenu-horizontal">
                                            <div class="thumb-menu-item">
                                                <a href="#product-large-one" data-toggle="tab" class="nav-link active">
                                                    <img src="${pro.imageMain}" alt="product thumb">
                                                </a>
                                            </div>
                                            <c:forEach items="${pro.imageses}" var="img"> 
                                                <div class="thumb-menu-item">
                                                    <a href="#product-large-${img.imageId}" data-toggle="tab" class="nav-link">
                                                        <img src="${img.imageLink}" alt="product thumb">
                                                    </a>
                                                </div>

                                            </c:forEach>

                                        </div>
                                    </div>
                                    <!-- Product Thumbnail Carousel End -->
                                </div>
                                <div class="col-lg-6">
                                    <!-- Single Product Content Start -->
                                    <div class="product-details-content"> 
                                        <div class="product-details-top">
                                            <h2 class="product-details-name">${pro.productName}</h2>
                                            <div class="ratings-wrap">
                                                <span>
                                                    <a class="review-btn" href="#singleProductTab">${listCmt.size()} Reviews</a>
                                                    <a class="review-btn" href="#singleProductTab">write a review</a>
                                                </span>
                                            </div>
                                            <ul class="product-details-list list-unstyled">
                                                <li> Category: 
                                                    <c:forEach items="${pro.catProducts}" var="cat"> 

                                                        <a href="#">${cat.categories.catName}, </a>

                                                    </c:forEach>
                                                </li>
                                                <li>Availability: 
                                                    <c:if test="${availability>0}">
                                                        <span>In Stock</span>
                                                    </c:if>
                                                    <c:if test="${availability==0}">
                                                        <span>Out of Stock</span>
                                                    </c:if>
                                                </li>
                                            </ul>
                                            <div class="product-details-price-wrapper">
                                                <c:if test="${pro.discount>0}">
                                                    <span class="money">$${pro.price*(1-pro.discount)}</span>
                                                    <span class="product-price-old">
                                                        <span class="money" >$${pro.price}</span>
                                                    </span>
                                                </c:if>
                                                <c:if test="${pro.discount==0}">
                                                    <span class="money">$${pro.price}</span>
                                                </c:if>

                                            </div>                                      
                                        </div>  

                                        <div class="product-details-bottom">

                                            <p class="product-details-availability">

                                                <i class="fa fa-check-circle"> ${availability} in Stock</i>


                                            </p> 
                                            <div class="product-details-action-wrapper mb--20">
                                                <form action="<%=request.getContextPath()%>/cartController/addCart1.htm" method="get">
                                                    <div class="product-details-action-top d-flex align-items-center mb--20">
                                                        <div class="quantity">
                                                            <span>Qty: </span>
                                                            <input type="number" class="quantity-input" name="qty" id="pro_qty" value="1" min="1">
                                                        </div>
                                                        <input type="hidden" name="productId" value="${pro.productId}">
                                                        <button type="submit" class="btn btn-medium btn-style-2">Add To Cart</button>

                                                    </div> 
                                                </form>

                                                <div class="product-details-action-bottom">
                                                    <a href="<%=request.getContextPath()%>/favoriteController/addFa.htm?productId=${pro.productId}">+Add to wishlist</a>
                                                </div>
                                            </div>  
                                            <div class="social-share">
                                                <a href="facebook.com" class="facebook share-button">
                                                    <i class="fa fa-facebook"></i>
                                                    <span>Like</span>
                                                </a>
                                                <a href="twitter.com" class="twitter share-button">
                                                    <i class="fa fa-twitter"></i>
                                                    <span>Tweet</span>
                                                </a>
                                                <a href="#" class="share share-button">
                                                    <i class="fa fa-plus-square"></i> 
                                                    <span>Share</span>
                                                </a>
                                            </div>
                                        </div>       
                                    </div>
                                    <!-- Single Product Content End -->
                                </div>
                            </div>
                        </section>
                        <!-- Single Product End -->  

                        <!-- Single Product Tab Start -->
                        <section class="product-details-tab bg--dark-4 ptb--80 ptb-md--60">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="product-details-tab-head nav nav-tab" id="singleProductTab" role="tablist">
                                        <li class="nav-item product-details-tab-item">
                                            <a class="nav-link product-details-tab-link active" id="nav-desc-tab" data-toggle="tab" href="#nav-desc" role="tab" aria-controls="nav-desc" aria-selected="true">Description</a>
                                        </li>
                                        <li class="nav-item product-details-tab-item">
                                            <a class="nav-link product-details-tab-link" id="nav-details-tab" data-toggle="tab" href="#nav-details" role="tab" aria-controls="nav-details" aria-selected="true">Additional Information</a>
                                        </li>

                                        <li class="nav-item product-details-tab-item">
                                            <a class="nav-link product-details-tab-link" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab" aria-controls="nav-review" aria-selected="true">review (${listCmt.size()})</a>
                                        </li>
                                    </ul>
                                    <div class="product-details-tab-content tab-content">
                                        <div class="tab-pane fade show active" id="nav-desc" role="tabpanel" aria-labelledby="nav-desc-tab">
                                            <p class="product-details-description">${pro.productDescription}</p>

                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="nav-details" aria-labelledby="nav-details-tab">
                                            <div class="product-details-additional-info">
                                                <h3>Additional Information</h3>
                                                <div class="table-content table-responsive">
                                                    <table class="shop_attributes">
                                                        <tr>
                                                            <th>Available Color: </th>
                                                            <td>
                                                                <c:forEach items="${pro.productDetails}" var="proD">
                                                                    <c:if test="${proD.quantity>0}">
                                                                        <span>${proD.colors.colorName}, </span>
                                                                    </c:if>
                                                                    <c:if test="${proD.quantity==0}">
                                                                        <span>${proD.colors.colorName}, </span>
                                                                    </c:if> 
                                                                </c:forEach>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="nav-review" aria-labelledby="nav-review-tab">
                                            <div class="product-details-review-wrap">
                                                <h2 class="mb--20">${listCmt.size()} Reviews</h2>
                                                <div class="review mb--40">
                                                    <c:forEach items="${listCmt}" var="cmt">
                                                        
                                                            <div class="review__single">
                                                                <div class="review__meta">
                                                                    <p class="review__author">${cmt.users.userName}</p>
                                                                    <p class="review__date">${cmt.createdateComment}</p>
                                                                </div>
                                                                <div class="review__content">
                                                                    <p class="review__text">
                                                                        ${cmt.commentContent}
                                                                    </p>

                                                                </div>
                                                            </div>
                                                        

                                                    </c:forEach>


                                                </div>
                                            </div>
                                            <c:if test="${userId == null}">
                                                <h3 class="mb--20">Login to add review</h3>
                                                <a href="<%=request.getContextPath()%>/loginUserController/login.htm" class="btn btn-medium btn-style-1">Login</a>
                                            </c:if>
                                            <c:if test="${userId != null}">
                                                <h2 class="mb--20">Add a Review</h2>
                                                <form action="addComment.htm?productId=${pro.productId}" method="post" class="form form--review">

                                                    <div class="form__group clearfix mb--20">
                                                        <label class="form__label d-block" for="review">Your Review <sup>*</sup></label>
                                                        <textarea id="review" name="review" class="form__input form__input--textarea"></textarea>
                                                        <div class="help-block">
                                                            <span>Note: </span>
                                                            HTML is not translated!
                                                        </div>
                                                    </div>
                                                    <div class="form__group text-right">
                                                        <button type="submit" class="btn btn-medium btn-style-1">Continue</button>
                                                    </div>
                                                </form>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </section>
                    <!-- Single Product End -->  



                    <!-- Related Product Start -->
                    <section class="related-products-area pt--80 pb--20 pb-md--15 pt-md--60">
                        <div class="row">
                            <div class="col-12 mb--20">
                                <div class="section-title">
                                    <h2>Related Products</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="product-carousel nav-top js-product-carousel-2">
                                    <div class="mirora-product">
                                        <div class="product-img">
                                            <img src="assets/img/products/2-450x450.jpg" alt="Product" class="primary-image" />
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                                    <div class="mirora-product">
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                                    <div class="mirora-product">
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                                    <div class="mirora-product">
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                                    <div class="mirora-product">
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                                    <div class="mirora-product">
                                        <div class="product-img">
                                            <img src="assets/img/products/12-450x450.jpg" alt="Product" class="primary-image" />
                                            <img src="assets/img/products/12-12-450x450.jpg" alt="Product" class="secondary-image" />
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                                    <div class="mirora-product">
                                        <div class="product-img">
                                            <img src="assets/img/products/14-450x450.jpg" alt="Product" class="primary-image" />
                                            <img src="assets/img/products/14-14-450x450.jpg" alt="Product" class="secondary-image" />
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
                                        <div class="mirora_product_action text-center position-absolute">
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
                    </section>
                    <!-- Related Product End -->
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
