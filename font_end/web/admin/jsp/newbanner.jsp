<%-- 
    Document   : newcatalog
    Created on : Sep 19, 2020, 11:03:35 AM
    Author     : Thanh Nam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>New Banner</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="../admin/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../admin/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <script src="/MiroraWatch/admin/ckeditor/ckeditor.js" type="text/javascript"></script>
        <script src="/MiroraWatch/admin/ckfinder/ckfinder.js" type="text/javascript"></script>
        <script src="/MiroraWatch/admin/js/jquery.min.js"></script>

    </head>
    <%
            HttpSession sessions = request.getSession();
            String email = (String)sessions.getAttribute("email");
            if(email!=null){
                %>
    <body>
        <div class="wrapper">
        <jsp:include page="header.jsp"/>
        <jsp:include page="sidebar.jsp"/>

        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Thêm mới Banner</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">New Banner</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">New Banner</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <f:form action="insert.htm" method="POST" enctype="multipart/form-data" commandName="newBan">
                                    <div class="card-body">
                                        <table>
                                            <tr>
                                                <td>Banner Name</td>
                                                <td><f:input placeholder="Enter Banner Name" path="bannerName"/></td>
                                            </tr>
                                            <tr>
                                                <td>Image</td>
                                                <td><input type="file" data-result="imageMainReview" name="imageBanner"/></td>
                                                <td><div id="imageMainReview"></div></td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Banner Link</td>
                                                <td><f:input path="bannerLink"/></td>
                                            </tr>
                                            <tr>
                                                <td>Banner Priority</td>
                                                <td>
                                                    <f:select path="bannerPriority">
                                                        <f:option value="1">1</f:option>
                                                        <f:option value="2">2</f:option>
                                                        <f:option value="3">3</f:option>

                                                    </f:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Status</td>
                                                <td>
                                                    <f:select path="bannerStatus">
                                                        <f:option value="true">Enable</f:option>
                                                        <f:option value="false">Disable</f:option>
                                                    </f:select>
                                                </td>
                                            </tr>

                                        </table>

                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary" value="insert">Submit</button>
                                    </div>
                                </f:form>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <jsp:include page="footer.jsp"/>
        </div>
        <script src="../admin/js/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../admin/js/bootstrap.bundle.min.js"></script>
        <!-- bs-custom-file-input -->
        <!--        <script src="../admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>-->
        <!-- AdminLTE App -->
        <script src="../admin/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../admin/js/demo.js"></script>
        <script type="text/javascript">           

            function handleFileSelect(divResult) {
                //Check File API support
                if (window.File && window.FileList && window.FileReader) {

                    var files = event.target.files; //FileList object
                    var output = document.getElementById(divResult);
                    output.innerHTML = "";
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        //Only pics
                        if (!file.type.match('image'))
                            continue;

                        var picReader = new FileReader();
                        picReader.addEventListener("load", function (event) {
                            var picFile = event.target;
                            var div = document.createElement("span");
                            div.innerHTML = "<img width='150' class='thumbnail' src='" + picFile.result + "'" + "title='" + picFile.name + "'/>";
                            output.insertBefore(div, null);
                        });
                        //Read the image
                        picReader.readAsDataURL(file);
                    }
                } else {
                    console.log("Your browser does not support File API");
                }
            }


            $(function () {
                $("input[type='file']").change(function () {
                    var result = $(this).data('result');
                    handleFileSelect(result);
                })
            })

        </script>
    </body>
    <%
            }else{
                HttpServletResponse Res = (HttpServletResponse)response;
                Res.sendRedirect("../loginController/login.htm");
                
            }
        %>
</html>
