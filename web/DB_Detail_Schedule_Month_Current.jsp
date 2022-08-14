<%-- 
    Document   : DB_DoctorDetail
    Created on : Jun 30, 2022, 3:11:04 PM
    Author     : Doan
--%>

<%@page import="schedule.scheduleDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="admins.AdminDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DentaCare-Admin</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/DB_DoctorDetail.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <%AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");%>
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
                <li class="nav-item">
                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Dịch Vụ</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Các Loại Dịch Vụ</h6>
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
                        <i class="fas fa-fw fa-user-doctor"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowPatientController">
                        <i class="fas fa-fw fa-bed-pulse"></i>
                        <span>Bệnh nhân</span>
                    </a>
                </li>



                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowFeedBackAdminController">
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
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <%DoctorDTO doctor = (DoctorDTO) request.getAttribute("DOCTOR_INFOR");%>
                    <div class="row ">
                        <form action="UpdateDoctor_Admin" class="col-12"> 
                            <div class="col-md-6 text-center float-md-left">
                                <div class="text-align-center">
                                    <img style="height:250px;width: 250px; object-fit: contain" src="<%=doctor.getImage()%>" alt=""/>
                                </div>
                                <div class="">
                                    <%=doctor.getFullName()%>
                                </div>
                                <div type="hidden" class="a" id="doctorID"><%=doctor.getDoctorID()%></div>

                                <div class="">
                                    <%=doctor.getServiceTypeName()%>
                                </div>
                                <select id="status" name="status" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                    <option selected value="<%=doctor.getStatus()%>"><%if (doctor.getStatus() == 1) {%>Đang làm việc<%} else {%>Đã nghỉ việc<%}%></option>
                                    <option value="<%=Math.abs(doctor.getStatus() - 1)%>"><%if (doctor.getStatus() == 1) {%>Đã nghỉ việc<%} else {%>Đang làm việc<%}%></option>
                                </select>
                            </div>
                            <input type="hidden" name="doctorID" value="<%=doctor.getDoctorID()%>">
                            <input type="hidden" name="serviceTypeName" value="<%=doctor.getServiceTypeName()%>">
                            <input type="hidden" name="fullName" value="<%=doctor.getFullName()%>">
                            <input type="hidden" name="gmail" value="<%=doctor.getGmail()%>">
                            <input type="hidden" name="image" value="<%=doctor.getImage()%>">
                            <input type="hidden" name="gender" value="<%=doctor.getGender()%>">
                            <div class="col-md-6 float-md-right">
                                <div class="p-2" >
                                    <label>Thành Tựu :</label>
                                    <a class="a" name="achievement" cols="6" rows="6" id="description"> <%=doctor.getAchievement()%></a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="text-center" style="margin-top: 15px">Lịch làm việc tháng này của <a><%=doctor.getFullName()%></a></div>
                    <!-- Hien lich cua bac si -->
                </div>

                <%List<scheduleDTO> listScheduleDTO = (List<scheduleDTO>) request.getAttribute("listScheduleDTO");%>
                <!-- Modal -->
                <div class="table-wrapper" id="exportContent">
                    <table style="width:100%">
                        <thead class="bg-light">
                            <tr>
                                <th>Ngày trong tuần</th>
                                <th>Ngày</th>
                                <th>Giờ làm</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (scheduleDTO schedule : listScheduleDTO) {
                            %>
                        <form>
                            <tr id="text-val">
                                <td><%=schedule.getDayOfWeek()%></td>
                                <td><%=schedule.getDay()%></td>
                                <td>
                                    <%if (schedule.getSlot() == 1) {%>7:00 - 9:00 am
                                    <%} else if (schedule.getSlot() == 2) {%>9:00 - 11:00 am 
                                    <%} else if (schedule.getSlot() == 3) {%>13:00 - 15:00 pm 
                                    <%} else if (schedule.getSlot() == 4) {%>15:00 - 17:00 pm<%}%>
                                </td>
                                <td>
                                    <%if (schedule.getStatus() == 0) {%>Đã hủy<%} else if (schedule.getStatus() == 1) {%>Đã đăng ký<% } else {%>Đã hoàn thành<%}%>
                                </td>
                            </tr>     
                        </form>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <button onclick="Export2Doc('exportContent', '<%=doctor.getFullName()%>');">Lưu lịch về máy</button>

                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

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
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>


        <script src="ckeditor/ckeditor.js"></script>
        <script>
                    var editor = CKEDITOR.replace('achievement');
                    CKFinder.setupCKEditor(editor, 'ckfinder/');
                    data["achievement"] = editor.getData();
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
        <script src="js/DB_DoctorDetail.js"></script>
        <script>
                    function Export2Doc(element, filename = '') {
                        var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
                        var postHtml = "</body></html>";
                        var html = preHtml + document.getElementById(element).innerHTML + postHtml;

                        var blob = new Blob(['\ufeff', html], {
                            type: 'application/msword'
                        });

                        var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html)

                        filename = filename ? filename + '.doc' : 'document.doc';

                        var downloadLink = document.createElement("a");

                        document.body.appendChild(downloadLink);

                        if (navigator.msSaveOrOpenBlob) {
                            navigator.msSaveOrOpenBlob(blob, filename);
                        } else {
                            downloadLink.href = url;

                            downloadLink.download = filename;

                            downloadLink.click();
                        }

                        document.body.removeChild(downloadLink);


                    }
        </script>
    </body>

</html>

