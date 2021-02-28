<%-- 
    Document   : login
    Created on : Nov 3, 2020, 10:48:09 PM
    Author     : Thanh Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Mirora - Login - Register</title>

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
                <div class="login-register-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 mb-md--40">
                                <h2 class="heading-secondary mb--30">Login</h2>
                                <div class="login-reg-box p-4 bg--2">
                                    <form class="form" action="checklogin.htm" method="post">
                                        <div class="form__group mb--20">
                                            <label class="form__label" for="username_email">
                                                Username or email address <span>*</span>
                                            </label>
                                            <input type="text" name="uname" id="username_email" class="form__input form__input--2">
                                        </div>
                                        <div class="form__group mb--20">
                                            <label class="form__label" for="password">
                                                Password <span>*</span>
                                            </label>
                                            <input type="password" name="psw" id="password" class="form__input form__input--2">
                                        </div>
                                        <div class="form__group d-flex align-items-center">
                                            <button type="submit" class="btn btn-5 btn-style-1 color-1">Login</button>
                                            <div class="custom-checkbox ml--20">
                                                <input type="checkbox" name="sessionStore" id="sessionStore" class="form__checkbox">

                                                <label for="sessionStore" class="form__checkbox--label">Remember me</label>
                                            </div>
                                        </div>
                                        <a href="#" class="forgot-pass">Forgot your password?</a>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h2 class="heading-secondary mb--30">Register</h2>
                                <div class="login-reg-box p-4 bg--2">
                                    <form class="form" action="register.htm">
                                        <div class="form__group mb--20">
                                            <label class="form__label" for="register_email">
                                                Email address <span>*</span>
                                            </label>
                                            <input type="text" name="register_email" id="register_email" class="form__input form__input--2">
                                        </div>
                                        <div class="form__group mb--20">
                                            <label class="form__label" for="register_password">
                                                Password <span>*</span>
                                            </label>
                                            <input type="password" name="register_password" id="register_password" class="form__input form__input--2">
                                            <input type="hidden" name="from" value="${param.from}">
                                        </div>
                                        <div class="form__group">
                                            <button type="submit" class="btn btn-5 btn-style-2">Register</button>
                                        </div>
                                    </form>
                                </div>
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
