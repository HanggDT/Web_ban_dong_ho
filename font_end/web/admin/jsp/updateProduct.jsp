<%-- 
    Document   : updateProduct
    Created on : Oct 21, 2020, 3:54:31 PM
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
        <title>Update product</title>
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
        <link rel="stylesheet" href="../admin/css/select2.min.css">

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
                                <h1>Cập nhật sản phẩm</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Update product</li>
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
                                        <h3 class="card-title">Update Product</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <f:form action="update.htm" method="POST" commandName="proUp" enctype="multipart/form-data">
                                        <div class="card-body">
                                            <table>
                                                <tr>
                                                    <td>Product Id</td>
                                                    <td><f:input path="productId" readonly="true"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Product Name</td>
                                                    <td><f:input path="productName"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Title</td>
                                                    <td><f:textarea path="title" id="titleId"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Description</td>
                                                    <td><f:textarea path="productDescription" id="descriptionId"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Created</td>
                                                    <td><f:input type="date" path="createdDate"/></td>                                                                                             
                                                </tr>
                                                <tr>
                                                    <td>Discount</td>
                                                    <td><f:input path="discount"/></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><f:hidden path="productView"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Price</td>
                                                    <td><f:input path="price"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Image</td>
                                                    <td><img src="${proUp.imageMain}" style="height: 100px; width: 150px"></td>

                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td><input type="file" data-result="imageMainReview" name="imageMain1"/></td>
                                                    <td><div id="imageMainReview"></div></td>
                                                </tr>
                                                <tr>
                                                    <td>Other Images </td>
                                                    <td>
                                                        <c:forEach items="${proUp.imageses}" var="img">
                                                            <img src="${img.imageLink}" style="height: 100px; width: 150px">
                                                        </c:forEach>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td><input type="file" data-result="imageOtherReview" multiple="multiple" name="imageOther1"/></td>
                                                    <td><div id="imageOtherReview"></div></td>
                                                </tr>
                                                <tr>
                                                    <td>Categories</td>
                                                    <td>
                                                        <f:select class="select2" multiple="multiple" path="listCate" data-placeholder="Select categories" style="width: 100%;">
                                                            <f:options items="${loadCate}" itemLabel="catName" itemValue="catalogId"/>                        
                                                        </f:select>                                                 
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>Color</td>
                                                    <td>   
                                                        <c:forEach items="${listColor}" var="color" varStatus="i">
                                                            <div class="checkbox">
                                                                <label data-toggle="collapse" data-target="#${color.colorName}" aria-expanded="true" aria-controls="${color.colorName}">
                                                                    <c:if test="${listColorSelected.contains(color.colorName)}">
                                                                        <input type="checkbox" name="colors" value="${color.colorId}" checked="true"/> ${color.colorName}
                                                                    </c:if>
                                                                    <c:if test="${!listColorSelected.contains(color.colorName)}">
                                                                        <input type="checkbox" name="colors" value="${color.colorId}"/> ${color.colorName}
                                                                    </c:if>
                                                                </label>
                                                            </div>
                                                            </div>
                                                            <div id="${color.colorName}" aria-expanded="true" class="collapse">
                                                                <div class="well">
                                                                    <table>
                                                                        <tr>
                                                                            <td>Quantity</td>
                                                                            <td>
                                                                                <input type="text" name="quantity" value="${listQuantiies.get(i.index)}">                                                                          
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Status</td>
                                                    <td>                                                
                                                        <f:select path="productStatus">
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
        <script src="../admin/js/select2.full.min.js"></script>

        <script type="text/javascript">
            var editorDescription = CKEDITOR.replace('descriptionId');
            CKFinder.setupCKEditor(editorDescription, 'admin/ckfinder/');
            var editorTitle = CKEDITOR.replace('titleId');
            CKFinder.setupCKEditor(editorTitle, 'admin/ckfinder/');

//            $(document).ready(function () {
//                bsCustomFileInput.init();
//            });
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
                //Initialize Select2 Elements
                $('.select2').select2()
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
