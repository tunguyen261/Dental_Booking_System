<%-- 
    Document   : DB_Service
    Created on : Jun 29, 2022, 6:09:10 PM
    Author     : Doan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.lang.String"%>
<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page import="admins.AdminDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Denta-Care</title>

        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/index_admin.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <%AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");
            String serviceTypeName = (String) request.getAttribute("serviceTypeName");
            int serviceTypeID = (int) request.getAttribute("serviceTypeID");
        %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-tooth"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Denta <strong>care</strong></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item ">
                    <a class="nav-link" href="LoadAdminController">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item active">

                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Dịch Vụ</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại dịch vụ</h6>
                            </div>
                            <%
                                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>


                            <div class="row service-item">
                                <a class="collapse-item col-sm float-left" href="LoadServiceController?serviceTypeName=<%=svType.getServiceTypeName()%>&serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowDoctorController">
                        <i class="fa-solid fa-user-doctor"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowPatientController">
                        <i class="fa-solid fa-bed-pulse"></i>
                        <span>Bệnh nhân</span>
                    </a>
                </li>



                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="index_feedback.jsp">
                        <i class="fas fa-fw fa-bell"></i>
                        <span>Đánh Giá</span>
                    </a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="ShowBookingAdminController">
                        <i class="fas fa-fw fa-calendar-check"></i>
                        <span>Lịch Hẹn</span></a>
                </li>
                <!-- Nav Item - Tables -->
                <li class="nav-item">

                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseThree"
                       aria-expanded="true" aria-controls="collapseThree">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Mã giảm giá</span>
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại giảm giá</h6>
                            </div>
                            <%
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>

                            <div class="row service-item">
                                <a class="collapse-item col-sm float-left" href="LoadDiscountController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>

                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>

            <!-- End of Page Wrapper -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <%if (!serviceTypeName.isEmpty()) {
                        %>
                        <div><%=serviceTypeName%> </div>
                        <%
                            }%>
                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=loginAdmin.getFullName()%></span>
                                    <img class="img-profile rounded-circle"
                                         src="https://www.kindpng.com/picc/m/699-6997452_administrator-network-icons-system-avatar-computer-transparent-admin.png">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="LogoutController" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>
                    </nav>
                    <!-- Noi dung Page -->
                    <div class="container">
                        <% List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE_BYSV_TYPE");

                        %> 

                        <div class="row">
                            <div class="col-md-3">
                                <div class="card card-body mb-4 border-primary" style="border-radius: 10px ; padding-bottom: 27px;background-color: #85b0e9;">
                                    <div class="services text-center ">
                                        <h5 style="height: 50px ; color: white; font-family: Arial, Helvetica, sans-serif;">Thêm dịch vụ mới</h5>

                                        <div>
                                            <i style="width: 200px;height:150px; vertical-align: middle;margin-bottom: 12px; border-radius: 10px ; font-size: 170px" class="fa-solid fa-square-plus"></i>
                                        </div>

                                        <div class="flex-row " style="margin-top:35px">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                Tạo
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal để tạo mới dịch vụ-->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" class="text-primary" id="exampleModalLabel"><%=serviceTypeName%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="AddServiceController">
                                            <div class="modal-body">
                                                <input type="hidden" name="serviceTypeID" value="<%=serviceTypeID%>">
                                                <label class="text-primary">Tên dịch vụ: </label>
                                                <input name="serviceName" type="text"></br>
                                                <label class="text-primary">Giá tiền: </label>
                                                <input style="margin-left: 24px" name="servicePrice" type="text"></br>
                                                <label class="text-primary">Mô tả dịch vụ: </label>
                                                <textarea class="form-control" name="description" rows="4" id="description"></textarea>
                                                <input type="hidden" name="serviceTypeName" value="<%=serviceTypeName%>">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                <input type="submit" class="btn btn-success" value="Tạo dịch vụ">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <%

                                for (ServiceDTO service : listService) {
                            %>
                            <div class="col-md-3">
                                <div class="card card-body mb-4 border-primary" style="border-radius: 10px ; background-color: #85b0e9;">
                                    <div class="services text-center ">
                                        <h5 style="height: 50px ; color: white; font-family: Arial, Helvetica, sans-serif;"><%=service.getServiceName()%></h5>
                                        <%
                                            List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("LIST_SERVICE_IMAGE");
                                            for (ServiceImageDTO Image : listServiceImage) {
                                                if (service.getServiceID() != Image.getServiceID()) {
                                                    continue;
                                                }
                                        %>
                                        <div>
                                            <img style="width: 200px;height:150px; vertical-align: middle;margin-bottom: 12px; border-radius: 10px ; " src="<%=Image.getImage()%>">
                                        </div>
                                        <%break;
                                            }%>
                                        <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                        <p style="color: white"><%=formatter.format(service.getServicePrice())%>VND</p>
                                        <div class="flex-row ">
                                            <a style="border-radius:25px ;padding: 2px, 4px; background-color: #F9D923" class="nav-link text-info" href="DetailServiceAdminController?serviceID=<%=service.getServiceID()%>">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>                    
                    <!-- Logout Modal-->
                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                    <a class="btn btn-primary" href="LogoutController">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="ckeditor/ckeditor.js"></script>
                    <script>
                        var editor = CKEDITOR.replace('description');
                        CKFinder.setupCKEditor(editor, 'ckfinder/');
                        data["description"] = editor.getData();
                    </script>      
                    <!-- Bootstrap core JavaScript-->
                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                    <!-- Core plugin JavaScript-->
                    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                    <!-- Custom scripts for all pages-->
                    <script src="js/sb-admin-2.min.js"></script>

                    <!-- Page level plugins -->
                    <script src="vendor/chart.js/Chart.min.js"></script>

                    <!-- Page level custom scripts -->
                    <script src="js/demo/chart-area-demo.js"></script>
                    <script src="js/demo/chart-pie-demo.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
                    <script src="js/js/convertImageBase64.js"></script>
                    </body>

                    </html>

