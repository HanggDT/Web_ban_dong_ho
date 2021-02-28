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
        <title>New catalog</title>
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
                            <h1>Thêm mới danh mục</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">New category</li>
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
                                    <h3 class="card-title">New Category</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <f:form action="insert.htm" method="POST" commandName="catNew" role="form">
                                    <div class="card-body">
                                        <table>
                                            <tr>
                                                <td>CatalogName</td>
                                                <td><f:input placeholder="Enter Catalog Name" path="catName"/></td>
                                            </tr>
                                            <tr>
                                                <td>Priority</td>
                                                <td><f:input path="catPriority"/></td>
                                            </tr>
                                            <tr>
                                                <td>Description</td>
                                                <td><f:textarea path="catDescription" id="descriptionId"/></td>
                                            </tr>
                                            <tr>
                                                <td>ParentCatalog</td>
                                                <td>
                                                    <f:select path="parentId">
                                                        <f:option value="0">None</f:option>
                                                        <c:forEach items="${listCat}" var="cat">
                                                            <f:option value="${cat.catalogId}">${cat.catName}</f:option>
                                                        </c:forEach>
                                                    </f:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Status</td>
                                                <td>
                                                    <f:select path="catStatus">
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
            var editorDescription = CKEDITOR.replace('descriptionId');
            CKFinder.setupCKEditor(editorDescription, 'admin/ckfinder/');

//            $(document).ready(function () {
//                bsCustomFileInput.init();
//            });

        </script>
    </body>
    <%
            }else{
                HttpServletResponse Res = (HttpServletResponse)response;
                Res.sendRedirect("../loginController/login.htm");
                
            }
        %>
</html>
