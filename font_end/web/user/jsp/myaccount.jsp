<%-- 
    Document   : myaccount
    Created on : Nov 4, 2020, 9:38:33 AM
    Author     : Thanh Nam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="meta description">
        <!-- Favicons -->
        <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="../img/icon.png">

        <!-- Title -->
        <title>Mirora - My Account</title>

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
            <section class="main-content-wrapper">
                <div class="account-wrapper pt--40 pb--80 pt-md--30 pb-md--60">
                    <div class="container">
                        <div class="user-dashboard-tab">
                            <div class="row">
                                <div class="col-lg-4 mb-md--30">
                                    <div class="user-dashboard-tab__head nav flex-column" role="tablist" aria-orientation="vertical">

                                        <a class="nav-link active" data-toggle="pill" role="tab" href="#orders" aria-controls="orders" aria-selected="true">Orders</a>

                                        <a class="nav-link" data-toggle="pill" role="tab" href="#addresses" aria-controls="addresses" aria-selected="true">Addresses</a>
                                        <a class="nav-link" data-toggle="pill" role="tab" href="#accountdetails" aria-controls="accountdetails" aria-selected="true">Account Details</a>
                                        <a class="nav-link" href="<%=request.getContextPath()%>/loginUserController/logout.htm">Logout</a>
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div class="user-dashboard-tab__content tab-content">

                                        <div class="tab-pane fade show active" id="orders">
                                            <div class="account-table table-content table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Order</th>
                                                            <th>Date</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listOrder}" var="order" varStatus="i">
                                                            <tr>
                                                                <td>${i.index + 1}</td>
                                                                <td>${order.createdDate}</td>

                                                                <td>
                                                                    <c:if test="${order.orderStatus == false}">
                                                                        Processing
                                                                    </c:if>
                                                                    <c:if test="${order.orderStatus == true}">
                                                                        Completed
                                                                    </c:if>
                                                                </td>
                                                                <td>${order.totalAmount}</td>
                                                                <td><a href="<%=request.getContextPath()%>/orderController/orderDetail.htm?orderId=${order.orderId}" class="btn btn-medium btn-style-1">View</a></td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="addresses">
                                            <div class="billing-address mb--20">
                                                <p>The following addresses will be used on the checkout page by default.</p>
                                                <h4>BILLING ADDRESS</h4>
                                                <a href="#" data-attr="#billing_address" class="btn btn-medium btn-style-1 expand_action">Edit</a>
                                                <div class="address-form bg--2 mt--20 hide-in-default" id="billing_address">
                                                    <form action="#" class="form">
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-md-6 mb-sm--30">
                                                                <label for="billing_fname" class="form__label">First Name <span>*</span></label>
                                                                <input type="text" name="billing_fname" id="billing_fname" class="form__input form__input--2">
                                                            </div>
                                                            <div class="form__group col-md-6">
                                                                <label for="billing_lname" class="form__label">Last Name <span>*</span></label>
                                                                <input type="text" name="billing_lname" id="billing_lname" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_company" class="form__label">Company</label>
                                                                <input type="text" name="billing_company" id="billing_company" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_country" class="form__label">Country</label>
                                                                <select name="billing_country" id="billing_country" class="form__input form__input--2 nice-select">
                                                                    <option value="">Select a country…</option>
                                                                    <option value="AF">Afghanistan</option>
                                                                    <option value="AL">Albania</option>
                                                                    <option value="DZ">Algeria</option>
                                                                    <option value="AR">Argentina</option>
                                                                    <option value="AM">Armenia</option>
                                                                    <option value="AU">Australia</option>
                                                                    <option value="AT">Austria</option>
                                                                    <option value="AZ">Azerbaijan</option>
                                                                    <option value="BH">Bahrain</option>
                                                                    <option value="BD" selected="selected">Bangladesh</option>
                                                                    <option value="BD">Brazil</option>
                                                                    <option value="CN">China</option>
                                                                    <option value="EG">Egypt</option>
                                                                    <option value="FR">France</option>
                                                                    <option value="DE">Germany</option>
                                                                    <option value="HK">Hong Kong</option>
                                                                    <option value="HU">Hungary</option>
                                                                    <option value="IS">Iceland</option>
                                                                    <option value="IN">India</option>
                                                                    <option value="ID">Indonesia</option>
                                                                    <option value="IR">Iran</option>
                                                                    <option value="IQ">Iraq</option>
                                                                    <option value="IE">Ireland</option>
                                                                    <option value="IT">Italy</option>
                                                                    <option value="JP">Japan</option>
                                                                    <option value="KW">Kuwait</option>
                                                                    <option value="MY">Malaysia</option>
                                                                    <option value="MV">Maldives</option>
                                                                    <option value="MX">Mexico</option>
                                                                    <option value="MC">Monaco</option>
                                                                    <option value="NP">Nepal</option>
                                                                    <option value="RU">Russia</option>
                                                                    <option value="KR">South Korea</option>
                                                                    <option value="SS">South Sudan</option>
                                                                    <option value="ES">Spain</option>
                                                                    <option value="LK">Sri Lanka</option>
                                                                    <option value="SD">Sudan</option>
                                                                    <option value="SZ">Swaziland</option>
                                                                    <option value="SE">Sweden</option>
                                                                    <option value="CH">Switzerland</option>
                                                                    <option value="TN">Tunisia</option>
                                                                    <option value="TR">Turkey</option>
                                                                    <option value="UA">Ukraine</option>
                                                                    <option value="AE">United Arab Emirates</option>
                                                                    <option value="GB">United Kingdom (UK)</option>
                                                                    <option value="US">United States (US)</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_streetAddress" class="form__label">Street Address</label>
                                                                <input type="text" name="billing_streetAddress" id="billing_streetAddress" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_apartment" class="form__label">Apartment, suite, unit etc. (optional)</label>
                                                                <input type="text" name="billing_apartment" id="billing_apartment" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_city" class="form__label">Town/City <span>*</span></label>
                                                                <input type="text" name="billing_city" id="billing_city" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_district" class="form__label">District <span>*</span></label>
                                                                <select name="billing_district" id="billing_district" class="form__input form__input--2 nice-select">
                                                                    <option value="">Select a District…</option>
                                                                    <option>BARISAL</option>
                                                                    <option>BHOLA</option>
                                                                    <option>BANDARBAN</option>
                                                                    <option>BRAHMANBARIA</option>
                                                                    <option>CHANDPUR</option>
                                                                    <option>CHITTAGONG</option>
                                                                    <option>COMILLA</option>
                                                                    <option>COX'S BAZAR</option>
                                                                    <option>DHAKA</option>
                                                                    <option>FARIDPUR</option>
                                                                    <option>FENI</option>
                                                                    <option>GAZIPUR</option>
                                                                    <option>GOPALGANJ</option>
                                                                    <option>JAMALPUR</option>
                                                                    <option>KHAGRACHHARI</option>
                                                                    <option>KISHOREGONJ</option>
                                                                    <option>LAKSHMIPU</option>
                                                                    <option>RMADARIPUR</option>
                                                                    <option>MUNSHIGANJ</option>
                                                                    <option>MYMENSINGH</option>
                                                                    <option>NARAYANGANJ</option>
                                                                    <option>NARSINGDI</option>
                                                                    <option>NETRAKONA</option>
                                                                    <option>NOAKHALI</option>
                                                                    <option>RANGAMATI </option>
                                                                    <option>RAJBARI</option>
                                                                    <option>SHARIATPUR</option>
                                                                    <option>SHERPUR</option>
                                                                    <option>TANGAIL</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="billing_zip" class="form__label">Post/Zip Code <span>*</span></label>
                                                                <input type="text" name="billing_zip" id="billing_zip" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-md-6 mb-sm--30">
                                                                <label for="billing_phone" class="form__label">Phone</label>
                                                                <input type="text" name="billing_phone" id="billing_phone" class="form__input form__input--2">
                                                            </div>
                                                            <div class="form__group col-md-6">
                                                                <label for="billing_email" class="form__label">Email Address <span>*</span></label>
                                                                <input type="email" name="billing_email" id="billing_email" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form__group col-12">
                                                                <button type="submit" class="btn btn-medium btn-style-1">Save Address</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="shipping-address">
                                                <p>The following addresses will be used on the checkout page by default.</p>
                                                <h4>Shipping ADDRESS</h4>
                                                <a href="#" data-attr="#shipping_address" class="btn btn-medium btn-style-1 expand_action">Edit</a>
                                                <div class="address-form bg--2 mt--20 hide-in-default" id="shipping_address">
                                                    <form action="#" class="form">
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-md-6 mb-sm--30">
                                                                <label for="shipping_fname" class="form__label">First Name <span>*</span></label>
                                                                <input type="text" name="shipping_fname" id="shipping_fname" class="form__input form__input--2">
                                                            </div>
                                                            <div class="form__group col-md-6">
                                                                <label for="shipping_lname" class="form__label">Last Name <span>*</span></label>
                                                                <input type="text" name="shipping_lname" id="shipping_lname" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_company" class="form__label">Company</label>
                                                                <input type="text" name="shipping_company" id="shipping_company" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_country" class="form__label">Country</label>
                                                                <select id="shipping_country" name="shipping_country" class="form__input form__input--2 nice-select">
                                                                    <option value="">Select a country…</option>
                                                                    <option value="AF">Afghanistan</option>
                                                                    <option value="AL">Albania</option>
                                                                    <option value="DZ">Algeria</option>
                                                                    <option value="AR">Argentina</option>
                                                                    <option value="AM">Armenia</option>
                                                                    <option value="AU">Australia</option>
                                                                    <option value="AT">Austria</option>
                                                                    <option value="AZ">Azerbaijan</option>
                                                                    <option value="BH">Bahrain</option>
                                                                    <option value="BD" selected="selected">Bangladesh</option>
                                                                    <option value="BD">Brazil</option>
                                                                    <option value="CN">China</option>
                                                                    <option value="EG">Egypt</option>
                                                                    <option value="FR">France</option>
                                                                    <option value="DE">Germany</option>
                                                                    <option value="HK">Hong Kong</option>
                                                                    <option value="HU">Hungary</option>
                                                                    <option value="IS">Iceland</option>
                                                                    <option value="IN">India</option>
                                                                    <option value="ID">Indonesia</option>
                                                                    <option value="IR">Iran</option>
                                                                    <option value="IQ">Iraq</option>
                                                                    <option value="IE">Ireland</option>
                                                                    <option value="IT">Italy</option>
                                                                    <option value="JP">Japan</option>
                                                                    <option value="KW">Kuwait</option>
                                                                    <option value="MY">Malaysia</option>
                                                                    <option value="MV">Maldives</option>
                                                                    <option value="MX">Mexico</option>
                                                                    <option value="MC">Monaco</option>
                                                                    <option value="NP">Nepal</option>
                                                                    <option value="RU">Russia</option>
                                                                    <option value="KR">South Korea</option>
                                                                    <option value="SS">South Sudan</option>
                                                                    <option value="ES">Spain</option>
                                                                    <option value="LK">Sri Lanka</option>
                                                                    <option value="SD">Sudan</option>
                                                                    <option value="SZ">Swaziland</option>
                                                                    <option value="SE">Sweden</option>
                                                                    <option value="CH">Switzerland</option>
                                                                    <option value="TN">Tunisia</option>
                                                                    <option value="TR">Turkey</option>
                                                                    <option value="UA">Ukraine</option>
                                                                    <option value="AE">United Arab Emirates</option>
                                                                    <option value="GB">United Kingdom (UK)</option>
                                                                    <option value="US">United States (US)</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_streetAddress" class="form__label">Street Address</label>
                                                                <input type="text" name="shipping_streetAddress" id="shipping_streetAddress" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_apartment" class="form__label">Apartment, suite, unit etc. (optional)</label>
                                                                <input type="text" name="shipping_apartment" id="shipping_apartment" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_city" class="form__label">Town/City <span>*</span></label>
                                                                <input type="text" name="shipping_city" id="shipping_city" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_district" class="form__label">Distring <span>*</span></label>
                                                                <select name="shipping_district" id="shipping_district" class="form__input form__input--2 nice-select">
                                                                    <option value="">Select a District…</option>
                                                                    <option>BARISAL</option>
                                                                    <option>BHOLA</option>
                                                                    <option>BANDARBAN</option>
                                                                    <option>BRAHMANBARIA</option>
                                                                    <option>CHANDPUR</option>
                                                                    <option>CHITTAGONG</option>
                                                                    <option>COMILLA</option>
                                                                    <option>COX'S BAZAR</option>
                                                                    <option>DHAKA</option>
                                                                    <option>FARIDPUR</option>
                                                                    <option>FENI</option>
                                                                    <option>GAZIPUR</option>
                                                                    <option>GOPALGANJ</option>
                                                                    <option>JAMALPUR</option>
                                                                    <option>KHAGRACHHARI</option>
                                                                    <option>KISHOREGONJ</option>
                                                                    <option>LAKSHMIPU</option>
                                                                    <option>RMADARIPUR</option>
                                                                    <option>MUNSHIGANJ</option>
                                                                    <option>MYMENSINGH</option>
                                                                    <option>NARAYANGANJ</option>
                                                                    <option>NARSINGDI</option>
                                                                    <option>NETRAKONA</option>
                                                                    <option>NOAKHALI</option>
                                                                    <option>RANGAMATI </option>
                                                                    <option>RAJBARI</option>
                                                                    <option>SHARIATPUR</option>
                                                                    <option>SHERPUR</option>
                                                                    <option>TANGAIL</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-12">
                                                                <label for="shipping_zip" class="form__label">Post/Zip Code <span>*</span></label>
                                                                <input type="text" name="shipping_zip" id="shipping_zip" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row mb--20">
                                                            <div class="form__group col-md-6 mb-sm--30">
                                                                <label for="shipping_phone" class="form__label">Phone</label>
                                                                <input type="text" name="shipping_phone" id="shipping_phone" class="form__input form__input--2">
                                                            </div>
                                                            <div class="form__group col-md-6">
                                                                <label for="shipping__email" class="form__label">Email Address <span>*</span></label>
                                                                <input type="email" name="shipping__email" id="shipping__email" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form__group col-12">
                                                                <button type="submit" class="btn btn-5 btn-style-2">Save Address</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="accountdetails">
                                            <div class="account-form bg--2">
                                                <f:form action="changePass.htm" class="form" method="post" commandName="user">
                                                    <f:hidden path="userId"/>
                                                    <div class="form-row mb--20">
                                                        <div class="col-md-6 mb-sm--20">
                                                            <div class="form__group">
                                                                <label for="account_fname" class="form__label">User Name</label>
                                                                <f:input path="userName" class="form__input form__input--2" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-row mb--20">
                                                        <div class="col-12">
                                                            <div class="form__group">
                                                                <label for="user_email" class="form__label">Email Address</label>
                                                                <f:input path="mail" class="form__input form__input--2" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row mb--20">
                                                        <div class="col-12">
                                                            <div class="form__group">
                                                                <label for="user_email" class="form__label">Phone</label>
                                                                <f:input path="phone"  id="user_email" class="form__input form__input--2" />
                                                            </div>
                                                        </div>
                                                    </div> 

                                                    <div class="form-row">
                                                        <div class="col-12">
                                                            <h4>PASSWORD CHANGE</h4>
                                                        </div>
                                                    </div>
                                                    <f:hidden path="userPassword"/>
                                                    <f:hidden path="userAddress"/>
                                                    <f:hidden path="userStatus"/>
                                                    <f:hidden path="permission"/>
                                                    <f:hidden path="userAddress"/>

                                                    <div class="form-row mb--20">
                                                        <div class="col-12">
                                                            <div class="form__group">
                                                                <label for="cur_password" class="form__label">Current Password (leave blank to leave unchanged)</label>
                                                                <input type="password" name="cur_password" id="cur_password" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                    </div>                                             
                                                    <div class="form-row mb--20">
                                                        <div class="col-12">
                                                            <div class="form__group">
                                                                <label for="new_password" class="form__label">New Password (leave blank to leave unchanged)</label>
                                                                <input type="password" name="new_password" id="new_password" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row mb--20">
                                                        <div class="col-12">
                                                            <div class="form__group">
                                                                <label for="new_password" class="form__label">Confirm Password</label>
                                                                <input type="password" name="confirm_password" id="confirm_password" class="form__input form__input--2">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="col-12">
                                                            <button type="submit" class="btn btn-medium btn-style-2">Save Changes</button>
                                                        </div>
                                                    </div>
                                                </f:form>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>    
                </div>
            </section>
            <jsp:include page="footer.jsp"/>;
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
